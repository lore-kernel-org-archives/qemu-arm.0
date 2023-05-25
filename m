Received: by 2002:a17:906:d7a2:b0:96f:a786:ac5c with SMTP id pk2csp788082ejb;
        Thu, 25 May 2023 16:27:18 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ6D1PItU67/FkNZrzv1ukjwakTjLtVsB+PMl8GC10IS9PQw3n9Qz7o+eyeL4afrVBBrv+ba
X-Received: by 2002:a05:620a:3aca:b0:75b:23a1:3f8 with SMTP id ss10-20020a05620a3aca00b0075b23a103f8mr397472qkn.14.1685057238171;
        Thu, 25 May 2023 16:27:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1685057238; cv=none;
        d=google.com; s=arc-20160816;
        b=E3ZxvY5MbWbUMJTzzeeI0gPJ1RWvggLZcpOgji/sqrXWKUN3nORxalcXIKJIXZ7Cd7
         L5xyBIhioMEMvUwqQRi8GCV7vBwXaa6VKsWEJkD4VBz3uxbTjTyXI1KKL5fqIgSHSlGq
         aSzoyfODbRPXvSj/64yedRKiIm0vPupEboAMbbcfRUhxJ84TJcwYBKyFLg2QkIdKaPgU
         oG13E/hmsR5xkqrb74st7qOBzOJul+EhGm6FJuswwfDWJAVDj3M/fBtDQqL/aIpunS3+
         QeqD1F8quUzOKz9Vr8tWkQhrxuBus0aiCGfQ58Qkqs7SF2vMIi/qXtMR/7O8ouL9KIWJ
         H+5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=HmTrzaAymfCp1fyYj9R9fztmY/GgYJekROiEVCv4rCU=;
        b=syg6d/yxMlu1pwuEjLY6An76WaGqXYl9kz840rioYCt/qfrCHonDRb869hkf4lYA5O
         QhqRaOdGz2g9DMFM4l+2O2lrPaW8UhsxoMDatZwEW+eCZG8ptycro1oJPKCdcJjHOvlB
         8ZrJpL5BmS6VkUzh5VIFKiKEPyqxSx9m9G77CDDJ2Gw4r5Oaa1pnyiaRBtBT9qYyvHU2
         R7lWZc9oIIPF71NBCUjt1+e/akX8D8Py/Vcn51pmId4Xvy7ntevxeF1yw7NdSdR4j0r0
         F+ZYoe2IBWRE1bqJDkKC6zIEl/CngDTFaOSG4734oeVYTg+KNF2tatu/p2uQu2XzFfsT
         WZvQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=D95VQ1tR;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i10-20020a37c20a000000b0075b0f18584asi617575qkm.445.2023.05.25.16.27.18
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 25 May 2023 16:27:18 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=D95VQ1tR;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1q2KLi-0005xa-9p; Thu, 25 May 2023 19:26:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1q2KLd-0005v3-T6
 for qemu-arm@nongnu.org; Thu, 25 May 2023 19:26:24 -0400
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1q2KLY-0005qG-2t
 for qemu-arm@nongnu.org; Thu, 25 May 2023 19:26:21 -0400
Received: by mail-pl1-x630.google.com with SMTP id
 d9443c01a7336-1ae79528d4dso1346755ad.2
 for <qemu-arm@nongnu.org>; Thu, 25 May 2023 16:26:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1685057175; x=1687649175;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=HmTrzaAymfCp1fyYj9R9fztmY/GgYJekROiEVCv4rCU=;
 b=D95VQ1tRvJ2i3Xtl/TXHyO428ZCDEjHiiy8RNMauvE+2eLnZBxLjEPgwbOzI0AWKXd
 0XlxlhGhDHyiGaEBF5z4ud6GED4fHoe0WusI1HIhYf/z8pSjugPfR3AZVqCcTLaIFo7C
 16T7hOzI+/PVgW6RTirRgIjquhDbP9Wexl2tVagA5WXLFML9bE31byxjFIVBODpNPYDb
 XWMHjfy02fekXFX7zvaPpXVtsUxd2ujNdi2tMlC/6A52GXwDmIiY5YIgWVyucBDjeAeL
 EwAJRMxEc9WA8GavvLekx9S4HUO+tm1FDpx1qVx4uii2t3lOD1+PAswd71IWJrM1jIAZ
 OR+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685057175; x=1687649175;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=HmTrzaAymfCp1fyYj9R9fztmY/GgYJekROiEVCv4rCU=;
 b=WESBz0ApG+9GMy9UwiODjf8XohkN5xkhTjBZg23qJBIHHr/eEcUwGQ2rBepeFdb2mv
 Tl3VrgUvYAW5fSv35dNEHXw+EqeKmN6AxKegz2vRX9dMos/X3727INi7GE1HIe0TKGVT
 senAyn8ZaH9lsU1hbJGBRM8NVb1UOHe6REzxAv2C/r+i63VsQlsxj1q6DBHNErekfRfI
 jcRxNB/BH1U4IWqiHJDvnRGHCNyjuYUPdDw2EWF4KpNw71UMliPMAzvtF5m1q1MxkTra
 PisrmOBT/H0YAoqXTVqhGXJNJpmn9AkT7IB3d9xo3EhwjHs23TpJHiUX6blcXtggDVtf
 S/9w==
X-Gm-Message-State: AC+VfDzLLB5+ZpuQAJX3WaBPhHRP64xn9DDKBp8cJg0Y3IbS++t090jS
 bCG3QHrSMuKB2n/mJ6BXf4JH/Q==
X-Received: by 2002:a17:902:f686:b0:1aa:f78d:97b7 with SMTP id
 l6-20020a170902f68600b001aaf78d97b7mr433101plg.46.1685057174934; 
 Thu, 25 May 2023 16:26:14 -0700 (PDT)
Received: from stoup.. ([2602:ae:1598:4c01:7ac5:31cc:3997:3a16])
 by smtp.gmail.com with ESMTPSA id
 s15-20020a170902ea0f00b0019e60c645b1sm1885036plg.305.2023.05.25.16.26.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 May 2023 16:26:14 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v2 19/20] tests/tcg/multiarch: Adjust sigbus.c
Date: Thu, 25 May 2023 16:25:57 -0700
Message-Id: <20230525232558.1758967-20-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230525232558.1758967-1-richard.henderson@linaro.org>
References: <20230525232558.1758967-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::630;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x630.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: P5ccsauqr+1j

With -cpu max and FEAT_LSE2, the __aarch64__ section will only raise
an alignment exception when the load crosses a 16-byte boundary.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tests/tcg/multiarch/sigbus.c | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/tests/tcg/multiarch/sigbus.c b/tests/tcg/multiarch/sigbus.c
index 8134c5fd56..f47c7390e7 100644
--- a/tests/tcg/multiarch/sigbus.c
+++ b/tests/tcg/multiarch/sigbus.c
@@ -6,8 +6,13 @@
 #include <endian.h>
 
 
-unsigned long long x = 0x8877665544332211ull;
-void * volatile p = (void *)&x + 1;
+char x[32] __attribute__((aligned(16))) = {
+  0x01, 0x02, 0x03, 0x04, 0x05, 0x06, 0x07, 0x08,
+  0x09, 0x0a, 0x0b, 0x0c, 0x0d, 0x0e, 0x0f, 0x10,
+  0x11, 0x12, 0x13, 0x14, 0x15, 0x16, 0x17, 0x18,
+  0x19, 0x1a, 0x1b, 0x1c, 0x1d, 0x1e, 0x1f, 0x20,
+};
+void * volatile p = (void *)&x + 15;
 
 void sigbus(int sig, siginfo_t *info, void *uc)
 {
@@ -60,9 +65,9 @@ int main()
      * We might as well validate the unaligned load worked.
      */
     if (BYTE_ORDER == LITTLE_ENDIAN) {
-        assert(tmp == 0x55443322);
+        assert(tmp == 0x13121110);
     } else {
-        assert(tmp == 0x77665544);
+        assert(tmp == 0x10111213);
     }
     return EXIT_SUCCESS;
 }
-- 
2.34.1

