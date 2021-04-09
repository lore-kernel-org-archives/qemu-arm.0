Received: by 2002:ac2:5e6c:0:0:0:0:0 with SMTP id a12csp1569287lfr;
        Fri, 9 Apr 2021 08:05:51 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyuGQblkjI8eRI1k1eqOeokuCGAA6vrlLBatUAh3WyzC8G4s3lPr4wOsCqtfYdqhYAmvbjD
X-Received: by 2002:a05:6e02:1145:: with SMTP id o5mr11195353ill.61.1617980751106;
        Fri, 09 Apr 2021 08:05:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1617980751; cv=none;
        d=google.com; s=arc-20160816;
        b=MMmzJLMU0vNvd2wzfxlqjwXr+BXh3Bkqlb1Wt9pBL3+P1RPeuSNxWI8GPRqPPC7KK4
         5fKPyCDhUNGY+WXdRE7UfBkMnU0W/VexBQnNNfkfPX1uurEHqpPJoFGQEX1uX3aF6Q+B
         HNwyf/YKst5HVIsCLO5Uz/V1OwTGihWmTUFelIUVj5COlnEPZLOjuNtJVDjSCbCZTFNN
         Behnl6lMja+gSwZokne8zCzK6ACIh+WLKgGGvkWgCTsjeydiRppXXF9B1DSA8G//T1ew
         HFBW0HGj2UGA1z358boISie95Ravhtbhqg5CtFiDCwwEXHdaSGpVbUkcm3qQCUfaF0qX
         pEGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from:dkim-signature;
        bh=86r6ZcxyKLSRFnboIa/RjDv32mKauqu0t/J5jJyk3oI=;
        b=0LAE/UshB8jQ5NWCSirIN4QI5UvmWetyXyuLCt2YZ/LKW9F1PyoP87bHjKPiZEcizC
         GgpCU6t03urEXAdYI3Lcg5tpxZD3wJsgFqt6fYURp8Br08g7m0Y1P3t3vDqwLm2Ok2Vx
         trha9N1+P3L6gb++/xqD2HXvXH0bO5vVERsUlJKK0/i7/EbFWrMuPTCv7/wXZePvAAsS
         Ea1EkYsmYhdsWXWlG+izsO4ejQYB8RwNBV/+U6sVSxq+qIyIqZeWsOttld+6ENGpkbEC
         p7Zj3ttN90L0zGczkiUHkwTHn1vE0j1TIWM5A1dzZaM8/xXKumluPB24LLb8/s03xQ+v
         nx5Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=vOG27fmj;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q5si1125229jap.93.2021.04.09.08.05.50
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 09 Apr 2021 08:05:51 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=vOG27fmj;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:46204 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lUshi-0002a2-9s
	for alex.bennee@linaro.org; Fri, 09 Apr 2021 11:05:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60174)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lUshR-0002ZZ-5o
 for qemu-arm@nongnu.org; Fri, 09 Apr 2021 11:05:33 -0400
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435]:42883)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lUshP-0004Qg-EO
 for qemu-arm@nongnu.org; Fri, 09 Apr 2021 11:05:32 -0400
Received: by mail-wr1-x435.google.com with SMTP id q26so5946740wrz.9
 for <qemu-arm@nongnu.org>; Fri, 09 Apr 2021 08:05:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=86r6ZcxyKLSRFnboIa/RjDv32mKauqu0t/J5jJyk3oI=;
 b=vOG27fmjmsNLbtNiK8+8r/gMNMz9dqk1iAAmFaCJVWItDNGQmmARXqKkJs6nMk+mBb
 2qh6oRPox3jjIY3zAA63vic9u9iOqT4W/Jr/wo3Qr6MnqbnODPp0b7+MR8AC1wk+gR3F
 fgSmex/teDF0I6XK0VeKxjjbHYQwEDusSJsguA5gUX5skJnCMXBfBZW7TKYDT2Bc1wpg
 BHjQEBsHihQlsGL4jtrSfVakglTfSPLYhxjR+YCUnr1mHFpf0+s5BqflWHIfk6ZAspSE
 jJIThEb5CT+UgnsMV8kL2N6TZmOt62d44MPjz6BSckXSLETTRP4WHBdy/mzpuI9TLw94
 Mrdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=86r6ZcxyKLSRFnboIa/RjDv32mKauqu0t/J5jJyk3oI=;
 b=JUgKb6WIbrztroyMhOpGo/qmJ7smiyu36OpIT9T7FlWM9as9O/s74mxaf+BaJ+38sw
 scLfSDOkWr77529SloimAtLCezrqYqB5U+iuFFLo0yhX7qMud9hzS2bfzkqOHl0pT4fc
 FVbQgrgVAMF8DVhtVjtrs5epCY3rLsIcYa/3LlWyyOT5JjuIfK03SsA0d7o8rUuYwxYT
 Qyd72zQpAP3CICa8R8pXR1iWRhX0B3Sop1prvNTLf3Tn0ZZZJxpZBTnSM32OoxZHvraX
 gyLsCFbzl04Gf5BeKqrAFNO10TugXDb2hmaCOC6dvZyA9TX9m37U+DPC6cjPZ8j9J6hc
 C0+w==
X-Gm-Message-State: AOAM532F8Zq1QxEgmYXlldK6lXnVNWbtmg4WlcUOzloK/AGTx3ARHNmN
 XdN1OSlTnDZVPTGu42Mbx5FPkIz8jRUJiinV
X-Received: by 2002:adf:f3cd:: with SMTP id g13mr18595955wrp.286.1617980729613; 
 Fri, 09 Apr 2021 08:05:29 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id c18sm5048094wrp.33.2021.04.09.08.05.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 09 Apr 2021 08:05:28 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH for-6.0 0/2] mps3-an524: Fix MPC setting for SRAM block
Date: Fri,  9 Apr 2021 16:05:25 +0100
Message-Id: <20210409150527.15053-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x435.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: g7a/hz5gOrId

The AN524 FPGA image has three MPCs: one for the BRAM, one for
the QSPI flash, and one for the DDR. In the an524_raminfo[] array
that defines the various RAM blocks on the board, we incorrectly
set the .mpc field for the SRAM to 1 as well as for the QSPI flash.
The effect of this was to cause the QSPI flash not to be mapped
at all (because when we mapped the 'upstream' end of each MPC,
we found the incorrectly marked SRAM entry before the QSPI one
when scanning through the raminfo array, and so put the upstream
end of MPC1 at the SRAM address).

Patch 1 fixes the SRAM block to use '.mpc = -1' indicating that
there is no associated MPC. Patch 2 adds an assert() that would
have caught this programming error (which is quite easy to make
if you're constructing the raminfo array for a new board by
copying and modifying entries from existing boards).

I think this makes sense to put into 6.0, it's a pretty safe change.

Peter Maydell (2):
  hw/arm/mps2-tz: Fix MPC setting for AN524 SRAM block
  hw/arm/mps2-tz: Assert if more than one RAM is attached to an MPC

 hw/arm/mps2-tz.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

-- 
2.20.1
