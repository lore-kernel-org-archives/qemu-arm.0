Received: by 2002:a5d:51d0:0:0:0:0:0 with SMTP id n16csp207761wrv;
        Fri, 26 Jul 2019 10:51:43 -0700 (PDT)
X-Received: by 2002:a63:66c5:: with SMTP id a188mr92099969pgc.127.1564163502977;
        Fri, 26 Jul 2019 10:51:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1564163502; cv=none;
        d=google.com; s=arc-20160816;
        b=Qxx4k9M5M36JetOfJdhiM+YBc2nNzRtGgGVhTZnG76biHv4HBZAewW2f60kM6yzBgX
         tvWv2Lr//I5suaB622Gu8jJ0wPl0FPVVDm7hrkIwAkHrowUkKrwuvTmAVLB9hoCriXvo
         9kHbfrTduDUSHqzeSXyi9gnN4SoiCiJhUE/HHlyu48myf9tjqNpYw1cx+FHyqxgArJgc
         +sg3+xDEPTFoGlqd9vnbrNnYrYiftZ86aJUfP99+49Glfe870aEQJ1PCyoAUojbAsty4
         gPZK2jFCK+c8jCEFvyUvOsGccFzWhv6TFL2okZhLr8HqyllTe259ZmrYIa21DhRTreki
         7tnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :dkim-signature;
        bh=jvX6d8XTRW2yINP7UUXQMp5wulYHcQa40IZNorojim4=;
        b=VkPhtvx9l62rr+q7LiYbr65W6yDEMG9quSfqVi2UP7RwwbCNxaWj5H1QaSZVDGPVc3
         YWpoJzLP+lPyKDr9YsPeFXBbZRnDl0wCtlRa2RwWMUgsp9RKeISX75Lw9ATjUt3v6dua
         vSbtCSD4UFbp3hHgrtKUrjOMiOawMajpO4WWFeMWcjrMnXUe/x1rSvNpPYlZOaPp0939
         7cpP/4ZOIGRMbBiGoNPJnlFeEzxOeB1c+T89uJxeHiiuXF3FAjYQmBXBR/SA74WEAuWq
         sr43UHLK/WBNRKc/GTigNTRezkOyeysIMTSEhL7sb3rEnNf0lYt31z42YDQsG7Shtsjz
         JTcQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Wa09kRYm;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id 125sor13384484pgi.63.2019.07.26.10.51.42
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 26 Jul 2019 10:51:42 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Wa09kRYm;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=jvX6d8XTRW2yINP7UUXQMp5wulYHcQa40IZNorojim4=;
        b=Wa09kRYm6m3CF3ttivMMv8u/yQKXirGUlAJVWq4s8hIZCc1gyeFdJCRrNob2zTCJWQ
         lrCwA4+AzRPw+J4AJvZtpquXXt5eFlYD5ol9rVJufp+s+f+oqzyPQkc1kPm0BqF913Vz
         Bww8YS5g8Wsh/rZaM7NhrWOktQRCJBDtXvML3bTNiRUaepVEiDDW0MAF8Ld7ERVo7Oj9
         jrd1+ADjUKBWHNbYP15JpcwL0g1KP7+uH8kVoEAUo15Rn0RAUp3I0+Z8waiX1/DVLkP2
         Ei4TmzmUqskYn3FqJ7JFm0BFIfX22UKjw6dTA3dxK78iyUJacKIKi03qFMcpk0H9iD3d
         eevA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=jvX6d8XTRW2yINP7UUXQMp5wulYHcQa40IZNorojim4=;
        b=npsg7i5rMWXvG+dvYygbhzS9jJluzb1ScTxe8y+lUoI+ho8rN1z7AE261TsqdsbXvL
         JWDTin6mXsc1uhJLt690NR4q4Bm2SV/Vjou4XBcLeaSYzA5cF2nihoLg7f5LnZ9hgqFw
         FuJO4oj8KnEkolhBGcvFh9tHxahd85nQTRr05+BGdJewoPWGI3OOuxJ7hcnYP5RCDOQS
         L6Us0aG1Ud/jQDInNqBYYFLO4Vd1GveQ7mI6N02tR5uLcqsRYtsf9osxeRY1ci5OeC0k
         c/g+qQBVQILIIHbY9uYSFWr+1EJiMwPMC0+3chd+4qW97434aYJluCsFapvZ1CpDwstL
         oJCA==
X-Gm-Message-State: APjAAAV49gI1UdVa3QEeqZ+lipNq6ZC6561M9dMTIESlN3upbncuVTv3
	1MlwpjkBqeN9mBzhckNkU9VXDrtO
X-Google-Smtp-Source: APXvYqwtumCJAkOH7kSgFyzr4i+A3ue+GmiEwzCK9gv08RbYUzsV86QfUUoZt0ZzzgKU1JtXyvTJxw==
X-Received: by 2002:a65:5188:: with SMTP id h8mr59842315pgq.294.1564163502521;
        Fri, 26 Jul 2019 10:51:42 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from localhost.localdomain (97-126-117-207.tukw.qwest.net. [97.126.117.207])
        by smtp.gmail.com with ESMTPSA id o24sm104287919pfp.135.2019.07.26.10.51.41
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Fri, 26 Jul 2019 10:51:41 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
	qemu-arm@nongnu.org,
	alex.bennee@linaro.org
Subject: [PATCH 57/67] target/arm: Convert T16, nop hints
Date: Fri, 26 Jul 2019 10:50:22 -0700
Message-Id: <20190726175032.6769-58-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190726175032.6769-1-richard.henderson@linaro.org>
References: <20190726175032.6769-1-richard.henderson@linaro.org>
X-TUID: Dgb9Xjb8gcMx

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate.c |  3 +--
 target/arm/t16.decode  | 17 +++++++++++++++++
 2 files changed, 18 insertions(+), 2 deletions(-)

diff --git a/target/arm/translate.c b/target/arm/translate.c
index c9386ceefb..55404414a2 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -10779,8 +10779,7 @@ static void disas_thumb_insn(DisasContext *s, uint32_t insn)
 
         case 15: /* IT, nop-hint.  */
             if ((insn & 0xf) == 0) {
-                gen_nop_hint(s, (insn >> 4) & 0xf);
-                break;
+                goto illegal_op; /* nop hint, in decodetree */
             }
             /*
              * IT (If-Then)
diff --git a/target/arm/t16.decode b/target/arm/t16.decode
index 8864f89a81..90a4b71a45 100644
--- a/target/arm/t16.decode
+++ b/target/arm/t16.decode
@@ -19,6 +19,7 @@
 # This file is processed by scripts/decodetree.py
 #
 
+&empty           !extern
 &s_rrr_shi       !extern s rd rn rm shim shty
 &s_rrr_shr       !extern s rn rd rm rs shty
 &s_rri_rot       !extern s rn rd imm rot
@@ -204,3 +205,19 @@ SETEND          1011 0110 010 1 E:1 000         &setend
 REV             1011 1010 00 ... ...            @rdm
 REV16           1011 1010 01 ... ...            @rdm
 REVSH           1011 1010 11 ... ...            @rdm
+
+# Hints
+
+{
+  YIELD         1011 1111 0001 0000
+  WFE           1011 1111 0010 0000
+  WFI           1011 1111 0011 0000
+
+  # TODO: Implement SEV, SEVL; may help SMP performance.
+  # SEV         1011 1111 0100 0000
+  # SEVL        1011 1111 0101 0000
+
+  # The canonical nop has the second nibble as 0000, but the whole of the
+  # rest of the space is a reserved hint, behaves as nop.
+  NOP           1011 1111 ---- 0000
+}
-- 
2.17.1
