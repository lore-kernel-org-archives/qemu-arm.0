Received: by 2002:adf:a111:0:0:0:0:0 with SMTP id o17-v6csp5798015wro;
        Tue, 30 Oct 2018 09:25:20 -0700 (PDT)
X-Google-Smtp-Source: AJdET5d6PrTvXF4yTVSurVtUtq4fmEz0ad8oKW3bkl3QUGMXtOTAUxFjZCU5zrinFw/JrkRLhAOR
X-Received: by 2002:a1c:3a8d:: with SMTP id h135-v6mr2390477wma.92.1540916720448;
        Tue, 30 Oct 2018 09:25:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1540916720; cv=none;
        d=google.com; s=arc-20160816;
        b=03RYMeThYfcwEiIsO9iyOzVZhVrXgUQpiYu3LoP+fSRd7/hdm/BSsnWpAqn5nLxsXA
         mH+Qht5OQDpZxJnrVMv+++aH2Bz0qoB3nqdyDVD/bymSWLKAP3RFshWJFoHzuKHo8kyF
         cSjbFtDDv26qHk3dpMmBDsIz5/XWAuM471ZMnwYcLhwTNfkoJA2KuIMaT3l+W251CxBe
         UAK4r+42WFso7lagbR8IXo+5YUl6jQCHpQS7H3r8okwe6tJg06fDu7rXNDnmE1sq4HvY
         ZQOin4NvVbJVfh/M8ONDODwVIe2JBu8EY+r9FM7e0gBx5dnw3KsuMNyBwWaHUKMLK3bP
         iubw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from;
        bh=LrDY/yzEjaFD3iV2FtZR1Zl+Kzw8CC/i/BALUe3POyg=;
        b=whHhNM+6oDEF9WB0x1rZtj620Z2E1s7P+l3Nkr/Jgwf5MkhlBB2izptqMQ3Zksqafa
         RDstG9TbO9uo/Lk7GjglFl8T/zONwAhR0VaRMI9IyRca+Ky1urVF4MYiJ8ExYdiLYD+K
         djRy9EtI1iyuwJsVl0wM6a67c4Ey/XERMog8kwOA02WUlJRMyJQZwvQA2GHbmDz8MtV8
         w0Lcz26j1V7BmoPibRuuCDafhqN1aiHzmGMqBiTo6jtXuvcfvwrihgYVr9wdg8vdBIUR
         3h1drnQt8RlTPj+BWEWgC3/QDalGfLknf6jF1AAQOheDCDwegK2gGGKGxZs8a81jATW/
         +Vpw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: best guess record for domain of pm215@archaic.org.uk designates 2001:8b0:1d0::2 as permitted sender) smtp.mailfrom=pm215@archaic.org.uk;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <pm215@archaic.org.uk>
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
        by mx.google.com with ESMTPS id w15-v6si13975985wme.155.2018.10.30.09.25.20
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 30 Oct 2018 09:25:20 -0700 (PDT)
Received-SPF: pass (google.com: best guess record for domain of pm215@archaic.org.uk designates 2001:8b0:1d0::2 as permitted sender) client-ip=2001:8b0:1d0::2;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of pm215@archaic.org.uk designates 2001:8b0:1d0::2 as permitted sender) smtp.mailfrom=pm215@archaic.org.uk;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.89)
	(envelope-from <pm215@archaic.org.uk>)
	id 1gHWpT-0001Gk-Ex; Tue, 30 Oct 2018 16:25:19 +0000
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: patches@linaro.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Richard Henderson <richard.henderson@linaro.org>
Subject: [PATCH for-3.1] target/arm: Remove can't-happen if() from handle_vec_simd_shli()
Date: Tue, 30 Oct 2018 16:25:17 +0000
Message-Id: <20181030162517.21816-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.19.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: 1g3BWscJVEDB

In handle_vec_simd_shli() we have a check:
     if (size > 3 && !is_q) {
         unallocated_encoding(s);
         return;
     }
However this can never be true, because we calculate
    int size = 32 - clz32(immh) - 1;
where immh is a 4 bit field which we know cannot be all-zeroes.
So the clz32() return must be in {28,29,30,31} and the resulting
size is in {0,1,2,3}, and "size > 3" is never true.

This unnecessary code confuses Coverity's analysis:
in CID 1396476 it thinks we might later index off the
end of an array because the condition implies that we
might have a size > 3.

Remove the code, and instead assert that the size is in [0..3],
since the decode that enforces that is somewhat distant from
this function.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
Alex, if you could run this through the risu testset just as
a sanity check that would be very helpful.

 target/arm/translate-a64.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index 88195ab9490..fd36425f1ae 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -9483,12 +9483,10 @@ static void handle_vec_simd_shli(DisasContext *s, bool is_q, bool insert,
     int immhb = immh << 3 | immb;
     int shift = immhb - (8 << size);
 
-    if (extract32(immh, 3, 1) && !is_q) {
-        unallocated_encoding(s);
-        return;
-    }
+    /* Range of size is limited by decode: immh is a non-zero 4 bit field */
+    assert(size >= 0 && size <= 3);
 
-    if (size > 3 && !is_q) {
+    if (extract32(immh, 3, 1) && !is_q) {
         unallocated_encoding(s);
         return;
     }
-- 
2.19.1
