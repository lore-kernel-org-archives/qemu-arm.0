Received: by 2002:a8a:1930:0:0:0:0:0 with SMTP id be48csp71005ocb;
        Mon, 3 Oct 2022 07:57:35 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM5BGF/8KaxbVHRLmiGDSoXJFZ2hOnInIKpYOger9/dsQz7EQorhzcAjnUb4se9uf+CoXz3x
X-Received: by 2002:ac8:5b06:0:b0:35c:e066:b967 with SMTP id m6-20020ac85b06000000b0035ce066b967mr16250371qtw.233.1664809054843;
        Mon, 03 Oct 2022 07:57:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1664809054; cv=none;
        d=google.com; s=arc-20160816;
        b=ZGQW/ISUAyWYDRLuniGifPa15D+V70DrcIovKBXIvn2JH466N3p5/0dg2wj25yXUiV
         BIousEScfiVS2pCRItXzUEUf/TGW0MegSEYNj9/zMjHEtn9Y9K1tVIkQm+WiiAurgtIZ
         wLlYN5ngK0t0b0g9s5yV6Juc+mTj9B/KRVFtXHQQfNlJUr8TGVzBDnexA3v212DbFQHH
         2vAO4MA9mvXn7uMy7Y8wYvqZrFe/AhBXGyuNl/II2U29kg1UemtHOGUmdc7i+s3RkCHb
         bK5di8pcqOKAeCVwSmQzQkLgiK4+0G9BYZP3p4GpJi2Ezyj4EZd4O7FEO1QzXxVWrmZd
         n/kA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=RV/X+WaJqNZO6nQexO9aMZi9OCWlE8Q3vDFCU19ehgg=;
        b=l7AmXg/NrGFoWvjggntJ2eRaoTi/jA9l4L1DSdiiha++sJ+17tt9nc0dRwQ01Yprx3
         aozOmHSS8bRJ6g4mIS6qWOjmpgnHikblHgY8mn0AwPy7r4MDufEv5fg1uldDwnoZkPe+
         Q2HHyzDCWw4ZEDW+5R7KDPFAGIcVQdAv8oIt3xbd5uXbdSBNDSCVR+/gNgrRHrwcer0O
         c4BdHJbbo2MAGlaje/i+ZxuEZKi5hac63aamfFP7Lwe1FQBU378R59yPNgqeCcslnL4e
         fRHOZAN2qNNzjYz3RqO0OXlhcUMYJt3vMgYrkHGzgA+5WdvITlShCOlOgbL93xwEUrgX
         1zEg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=YcBNWgCz;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w19-20020a05620a445300b006ce177efcbcsi4450203qkp.413.2022.10.03.07.57.34
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 03 Oct 2022 07:57:34 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=YcBNWgCz;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:39732 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ofMsw-0005Lv-EP
	for alex.bennee@linaro.org; Mon, 03 Oct 2022 10:57:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54928)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jerome.forissier@linaro.org>)
 id 1ofMsc-0005Lf-5n
 for qemu-arm@nongnu.org; Mon, 03 Oct 2022 10:57:14 -0400
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431]:36631)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jerome.forissier@linaro.org>)
 id 1ofMsZ-0004rw-S7
 for qemu-arm@nongnu.org; Mon, 03 Oct 2022 10:57:13 -0400
Received: by mail-wr1-x431.google.com with SMTP id j7so11781725wrr.3
 for <qemu-arm@nongnu.org>; Mon, 03 Oct 2022 07:57:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date;
 bh=RV/X+WaJqNZO6nQexO9aMZi9OCWlE8Q3vDFCU19ehgg=;
 b=YcBNWgCzGgKluIVRv7kN/epE6GoK2NdrFIZeLZmi5o7vDBwZPVC4G+28FM+UF0Ne5D
 O9+5VywFmi035TNVRZKNGPyVGBdhYbNC9EB0kcrq7B5xEsF4s4XvGjjVk2cFqqkoL92O
 nh+U0eLxcpulGDcFJvkei4i0wnQauuY60cFAnvA8nLU0fTUQsr+xaQVqPpcWadV3ZJzW
 E70FE83xrow75jhRGdT58Wa9cwiU+8bSxdGjGfGR6CbWSQL31msxvCwl5ZwRE9INlIsl
 RDspmAZ7AJWaBEpxVONRr8863nAVOve7am22frKjLPSRxQk8RH3TUfq4fVVKJ4HPfhuQ
 LX3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date;
 bh=RV/X+WaJqNZO6nQexO9aMZi9OCWlE8Q3vDFCU19ehgg=;
 b=fncRRu11hlNnbXdYkX7Y17FRQLjclEgDRD+QWFvoKpjJbyAcWrNIJbf1woMlggQEf4
 eJlAUWJggKDHPPQJPTL4PlyorjgbkamVoB0CLriHp1PfuKy3JCZ5xebjk21KyrUEXcbw
 f3KyJ7ORuGnfK1AAJXvvWt+Kog8yR9wkSu7ee4KyIcR8etvxHcyXFCM+OW6eawA9JQ1K
 0bK8dLvBh20PHa1SV3NcH04TWGAJGHLDLNZA99GPBqg6N0E6gOWjpF9Zsen0KyJZTuvz
 0n160rDkfkHbWKsrc2io+DfVB+ZXFUe50c7CAHbzl2kyS+Mk8wSCLVMUSLGRRIgeJUNa
 GfJQ==
X-Gm-Message-State: ACrzQf2Ljme2GS3XzSUTOivH5csz10L3oY755jG8aAl3kRTTviExVYb/
 zfbHwylZLkLYaUbUkpNETbFS/w==
X-Received: by 2002:a5d:69c6:0:b0:22c:dbb2:d84 with SMTP id
 s6-20020a5d69c6000000b0022cdbb20d84mr12881189wrw.190.1664809029566; 
 Mon, 03 Oct 2022 07:57:09 -0700 (PDT)
Received: from jerome-XPS-13-9310.. ([2a01:e0a:3cb:7bb0:5860:99c5:7ff3:cb36])
 by smtp.gmail.com with ESMTPSA id
 z6-20020adfec86000000b0022b1d74dc56sm10040365wrn.79.2022.10.03.07.57.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Oct 2022 07:57:09 -0700 (PDT)
From: Jerome Forissier <jerome.forissier@linaro.org>
To: Peter Maydell <peter.maydell@linaro.org>,
	qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 Jerome Forissier <jerome.forissier@linaro.org>, qemu-stable@nongnu.org
Subject: [PATCH] hw/arm/boot: set CPTR_EL3.ESM and SCR_EL3.EnTP2 when booting
 Linux with EL3
Date: Mon,  3 Oct 2022 16:56:41 +0200
Message-Id: <20221003145641.1921467-1-jerome.forissier@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=jerome.forissier@linaro.org; helo=mail-wr1-x431.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: LFajK2DLF4HZ

According to the Linux kernel booting.rst [1], CPTR_EL3.ESM and
SCR_EL3.EnTP2 must be initialized to 1 when EL3 is present and FEAT_SME
is advertised. This has to be taken care of when QEMU boots directly
into the kernel (i.e., "-M virt,secure=on -cpu max -kernel Image").

Cc: qemu-stable@nongnu.org
Fixes: 78cb9776662a ("target/arm: Enable SME for -cpu max")
Link: [1] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/arm64/booting.rst?h=v6.0#n321
Signed-off-by: Jerome Forissier <jerome.forissier@linaro.org>
---
 hw/arm/boot.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/hw/arm/boot.c b/hw/arm/boot.c
index ada2717f76..ee3858b673 100644
--- a/hw/arm/boot.c
+++ b/hw/arm/boot.c
@@ -763,6 +763,10 @@ static void do_cpu_reset(void *opaque)
                     if (cpu_isar_feature(aa64_sve, cpu)) {
                         env->cp15.cptr_el[3] |= R_CPTR_EL3_EZ_MASK;
                     }
+                    if (cpu_isar_feature(aa64_sme, cpu)) {
+                        env->cp15.cptr_el[3] |= R_CPTR_EL3_ESM_MASK;
+                        env->cp15.scr_el3 |= SCR_ENTP2;
+                    }
                     /* AArch64 kernels never boot in secure mode */
                     assert(!info->secure_boot);
                     /* This hook is only supported for AArch32 currently:
-- 
2.34.1

