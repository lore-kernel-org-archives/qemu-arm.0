Received: by 2002:a17:504:1e0a:b0:1be9:327d:8ee3 with SMTP id i10csp931471njk;
        Fri, 24 Jan 2025 08:36:54 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUihDGpSHPZ1EV07OXKmQY58Xd3cs/A2hjidTS4R4R2yGMZt/XK2LXll8bIGdHlGKTcDDIt5ii5SnCAkQ==@linaro.org
X-Google-Smtp-Source: AGHT+IFnN3ykqutc4tZrtrhToE61jSIz/fZ4+xPe/21phfLg1D4zGYW7VwiQyfqUdaFFzcOWQD1O
X-Received: by 2002:a05:6102:50a5:b0:4a3:ab95:9637 with SMTP id ada2fe7eead31-4b690bf62ecmr26777872137.12.1737736614512;
        Fri, 24 Jan 2025 08:36:54 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1737736614; cv=none;
        d=google.com; s=arc-20240605;
        b=XXu4jzWZU29lW6nfRBf67/mPx/Ebjia0/MMbboqOvTchVWxOmodJ9nLAFHMTETxkop
         C/PXyxoeazVdNXEAeGc0xVSaxpMt7+4vJoDjKSqut83RvDrel058oZ/Fy53vGGzgrZhA
         90CIs6ae8xrjd/fuAbLudjgu3KRrPEY1Gxd+1wT5kSSscjbJClvsMhzpscPyK+KEzQV/
         mn/tJEK0A0EOH3rhjHRh1pgeC7BOm8FwdXsnjwJ5lrA+nlRfwA0hSwLPoiwID/L2ugIO
         L/AYlgdDMtSlhhYH6TOy4PV+NY25Yd5XulD8dx0FWGgsxtvk+B9owPcXQrLp9eSUQaTR
         p3cQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=1n4b3Sbe/IW5K25A4cb6upe/VFAy/+5L91fnNWowiOo=;
        fh=H2AmuqulvQE+T5zu97MCEUC3z9wF9NssS7895NhR/+c=;
        b=GD1fXkRrY1hm/ZvU+0j/sY9M/kJSgEW/CqEltSPROz0809n5gkmUQi4W4nzW6HWwgI
         /qfG02a+oTT9nh6KlWRsWwGQ4WnahA0JP3NPlgw0Xx/g02+/RZE+n7svK7zPfUdUQlkX
         MoKNmlIkOvyvAN/8j3fgYTXvt2iRyUhmVRwQ65wbFt4Rtg/2ATzgoKaAY5wjMeTu51LI
         +jBuVwgQHDKFXjuBhVMXRcWMERDbEgJh56vUYXcyMb/mR9H1fUIvSm72IItH/FKEb2E8
         PaYo9Oaq1xoKdePHTgvYdjFoJzT5qfEPw/kXcyOmhL7TtkoP2QBHl9rTY8/PstTte+g/
         wDlg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=PV8FF46E;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ada2fe7eead31-4b709983c33si857994137.238.2025.01.24.08.36.54
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 24 Jan 2025 08:36:54 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=PV8FF46E;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tbMfV-00045A-PM; Fri, 24 Jan 2025 11:36:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tbMZh-0006B7-Lp
 for qemu-arm@nongnu.org; Fri, 24 Jan 2025 11:30:32 -0500
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tbMZZ-00064j-QR
 for qemu-arm@nongnu.org; Fri, 24 Jan 2025 11:30:26 -0500
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-436281c8a38so16562905e9.3
 for <qemu-arm@nongnu.org>; Fri, 24 Jan 2025 08:30:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1737736215; x=1738341015; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=1n4b3Sbe/IW5K25A4cb6upe/VFAy/+5L91fnNWowiOo=;
 b=PV8FF46EQSv655R6R1CYir2ekj1t3zcuAJArLS0pADO/Je02iwhQwJRko7wWBY24v6
 kJ0D78uSLjpVZeahmynXUu4MiE4Z/WHo+c70WFLhKGLwc5ZzNE6mFEik+FMsJv7UFQ4J
 CjjHi2XQzkSn+CGTAH9wf5oEgHTzdKHfyDNan5s6lFqSS8/ZI7fRyEK3BIFpw6ye72cP
 BG2RBT0kZeX5UpnO/gWpHBxkRd1F3TuDup5x8Oh/ZGTwXGpoLLAFM47sKUJ/fDANGgnf
 SUkTq3cNmCn7lm3zbR6/Hmbq/NjnLp4/udeS2eqDyzKj92eP05MpW8dcG22c3oF8uAcN
 Z49A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737736215; x=1738341015;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=1n4b3Sbe/IW5K25A4cb6upe/VFAy/+5L91fnNWowiOo=;
 b=LhiMt+vip3qNa8hBlWMiANNMSC7ml/9KgtTY4vxqJnhcFEh8eNllb90HBuQUJ7wZ4d
 B8iHtZZWkqJYJFjd+A/TjStbIftIzhyTqQ4V1orxCktzUZNCGcwsCQzkX2HuJmf+Anwy
 O+pGu5l01lCBpRAeXBxovbeWiceFKatIsEE9WGYmNcTkKplifMo6ANz76P5QuG5AKO2u
 Hu40gjRveada3vToGPGt2/ZGzckDxL9CXV/TAuvxmbBdkAh2oa62EtOUZjoLeIvvMKTC
 RX6R5BZTsCRLF5I1bqtOECPEWSDWfugfSSrrGyazjv9N70J3jCeCZeDofnGhGmN1bwy8
 Bzjw==
X-Gm-Message-State: AOJu0YxcyjFUEVwfwG1NIJbkUWnywlVIeYaIwuVKxEpyNeQ2DwkO6iK3
 flMxHgE9A63YN5abgomdqRD1wiNfWXxnQjgfhjqosPTX6mNPLgpwlEakLGXLP3Lp5AmXjqLphGR
 P
X-Gm-Gg: ASbGnctsX4/8qRKdPqkGvJbdTleFav7W7z4Rpu/+XWzKA2VQMhsRXrEkxWuu/tDx9dh
 3i+ucMx9vN4qqhP4rH1sljfDxL7xswEixHQcEM5/AboKT0r8TFzPpFrtxdzlT18zIoL9nDP6s7e
 cI0nt2OSeJ2uAqwSTdrljrjf6hNVSxjyWkBJhswmOXfl8+YgtfMgQvfEgYoJbOzZDHJWSt5Fnhb
 vJtDXZ98YGr1IYcorpdU3oKyiEO1xrkIBBf2DISey0qlaIy7bq4gKKinpXJ4ILO0VPiuWfr5HXp
 RTh8N3anZW4=
X-Received: by 2002:a05:600c:4687:b0:435:b064:7dce with SMTP id
 5b1f17b1804b1-438913f2df1mr295380125e9.18.1737736215407; 
 Fri, 24 Jan 2025 08:30:15 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-438bd47eecasm31683025e9.6.2025.01.24.08.30.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Jan 2025 08:30:14 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 76/76] tests/tcg/x86_64/fma: add test for exact-denormal output
Date: Fri, 24 Jan 2025 16:28:36 +0000
Message-Id: <20250124162836.2332150-77-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250124162836.2332150-1-peter.maydell@linaro.org>
References: <20250124162836.2332150-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x336.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
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
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: LTWFrl+STD8G

Add some fma test cases that check for correct handling of FTZ and
for the flag that indicates that the input denormal was consumed.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 tests/tcg/x86_64/fma.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/tests/tcg/x86_64/fma.c b/tests/tcg/x86_64/fma.c
index 46f863005ed..34219614c0a 100644
--- a/tests/tcg/x86_64/fma.c
+++ b/tests/tcg/x86_64/fma.c
@@ -82,6 +82,18 @@ static testdata tests[] = {
      */
     { 0x3fdfffffffffffff, 0x001fffffffffffff, 0x801fffffffffffff, true,
       0x8010000000000000, 0x20 }, /* Enabling FTZ shouldn't change flags */
+    /*
+     * normal * 0 + a denormal. With FTZ disabled this gives an exact
+     * result (equal to the input denormal) that has consumed the denormal.
+     */
+    { 0x3cc8000000000000, 0x0000000000000000, 0x8008000000000000, false,
+      0x8008000000000000, 0x2 }, /* Denormal */
+    /*
+     * With FTZ enabled, this consumes the denormal, returns zero (because
+     * flushed) and indicates also Underflow and Precision.
+     */
+    { 0x3cc8000000000000, 0x0000000000000000, 0x8008000000000000, true,
+      0x8000000000000000, 0x32 }, /* Precision, Underflow, Denormal */
 };
 
 int main(void)
-- 
2.34.1

