Received: by 2002:a17:906:cf90:b0:9bd:85f7:2662 with SMTP id um16csp801728ejb;
        Thu, 19 Oct 2023 14:23:00 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF6lo24+xE2mW2Qe8pEMJ+YKWkHTzmNI4clLsZhnevQ1YeUiPoz2HhIwz/qcVYN2Xrlw7CJ
X-Received: by 2002:a05:622a:104a:b0:411:f5c0:5db with SMTP id f10-20020a05622a104a00b00411f5c005dbmr4008925qte.26.1697750580226;
        Thu, 19 Oct 2023 14:23:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1697750580; cv=none;
        d=google.com; s=arc-20160816;
        b=pMvxVLKsZnPI8dU34/QZz5Nhw7iMa1+RY304F054A+kpLuaK3aIFjxY1sRTpryQqTs
         /rNkdEnaC9ZOI217GwF7iAuk127/ZgmbaXtonSPxV/VB8UoSIhEOXOeHw14HmAq4LufO
         wncW5V2cnt1GTwEaMlVDApxeHr1JfIBvUZZLKw1eKSLTsjznra3PFNWaquJ8W/3QfiX7
         OrXyAiTYNbK+zXiVNgaHUtUG1NAIKjbvePgdhoRowlACWmqT/oP9j9qtfcQf1XFiffIG
         ADh/ky1GdkbFDKnM3k9ESHtpL96uAM1tfYqIdhCgWZNUDvCKSNm34dm/0gXuf5XhTe/5
         Ex/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=yHJOUZD7CaeAazVTXdyNVPRKOq5TT8EL7NxW6Z1zYOU=;
        fh=gPUAZr3rG5AAum2cFS0vXpLjRIjvY8asn41zDrAXuoE=;
        b=iumo2wODEP3zudbYj2CigWbS4qBjyyu7VW6I8A5tMIJv/ortAeWjiLAFFbjc6B8oju
         QnLQqwshudhuPCbHp3ixLPD/Ek4W6aVAIvAqClH2HVCaekNgqlty4CRJIPG7pcfQ5Qcn
         zpQyjPed1WcEks3nvdlyg6hqwXNUUk5gJKSl6uagpzphCR0iVlKRSgURTfl/dUikJpeV
         fmGBK/vl3XRq6WDqsI5AWhVIYo8nXoZvXwMhxpXbOpdzfIXP4H+p2zyrx4dWq70CSA6s
         3uKGl2gDtGnyp9h1vSJdMLdu14xBVSh24b+QCLLc4aPtTJ9uMM4J0cbDyC/P7VHgfm3c
         rFdg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=iaYz1cUW;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j7-20020ac85c47000000b004196c1b2b65si253830qtj.438.2023.10.19.14.23.00
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 19 Oct 2023 14:23:00 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=iaYz1cUW;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qtaSK-0001GN-KQ; Thu, 19 Oct 2023 17:21:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qtaSI-0001Ef-Q7
 for qemu-arm@nongnu.org; Thu, 19 Oct 2023 17:21:23 -0400
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qtaS6-0005jC-M2
 for qemu-arm@nongnu.org; Thu, 19 Oct 2023 17:21:20 -0400
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-408425c7c10so1148205e9.0
 for <qemu-arm@nongnu.org>; Thu, 19 Oct 2023 14:21:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1697750463; x=1698355263; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=yHJOUZD7CaeAazVTXdyNVPRKOq5TT8EL7NxW6Z1zYOU=;
 b=iaYz1cUWQf2hsNHJvSX4EQs86ObNTeNkfye8axiciYd8S8OlL04rP6AEPeyCppCc6D
 GErJD74Wyw8GtzClDjf7ymzMUt9MddE82fk9DsDlokXejg3gvxw8JSklON/v8sRzKe2M
 ao5HjVQW5p9cTr7IpSAKozK+HuPIBAsLSOXr8gHrXjDYcpl6Btr47mowACJaezE4ST8R
 rAFo33gfg3CbGP3BJ/MOZsdoY90Dk55AOp8NLpi+HKGjHd/YeZbwUmHpEGgzK+SQOj0K
 PuBLJyXjxuoSy4P36aaYOK5Gzy06De37gBN8QDWfbAKNiiZ9CptbSm3/CRKKGDxWlbyl
 iAlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697750463; x=1698355263;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=yHJOUZD7CaeAazVTXdyNVPRKOq5TT8EL7NxW6Z1zYOU=;
 b=Eo5N/+PR+5JKZ/xTLxuIt5Tmh4d/LhJRgjg7tnfDcADqjgcXHn4GzzUw/EeNTIO+bK
 4EgNH5hT2zaRE0u18kAdXpGW+sPuYrJXXLfLgL32j5LCwb5DXmx5QrLWe/yqaD0RJ33P
 tcwUBrdOiAdJNDN4vZVSBKQHdKsJX4VlY0SltPqiSHcAPmWgTKor+wNhLIiFVI5VF1gg
 j9ZwPXe10Soyil7tv/XVmdXGnNCfaRqlM4cNQCGca8looUAwUbUPosmRua5z6/vm509p
 GEhzcQcM+P6zh7budlo7Hiahyl/zK//0b8WwYgq+m3+cm9lsvqUzYJNAwVW7OAHMXRL1
 uhkw==
X-Gm-Message-State: AOJu0YyJPJaCKon1aVAA14DuiFlFwR53XWLGs3y9Vj6uxRJ5IE1LqefW
 /pswd1xYu9nBUsRP/IxWBdBAFQ==
X-Received: by 2002:a05:600c:4f12:b0:408:364e:34a2 with SMTP id
 l18-20020a05600c4f1200b00408364e34a2mr17988wmq.10.1697750462773; 
 Thu, 19 Oct 2023 14:21:02 -0700 (PDT)
Received: from m1x-phil.lan (176-131-216-177.abo.bbox.fr. [176.131.216.177])
 by smtp.gmail.com with ESMTPSA id
 p6-20020a5d6386000000b00327b5ca093dsm209316wru.117.2023.10.19.14.21.00
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 19 Oct 2023 14:21:02 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, qemu-s390x@nongnu.org, qemu-block@nongnu.org,
 qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Thomas Huth <thuth@redhat.com>, LIU Zhiwei <zhiwei_liu@linux.alibaba.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Nicholas Piggin <npiggin@gmail.com>,
 =?UTF-8?q?Fr=C3=A9d=C3=A9ric=20Barrat?= <fbarrat@linux.ibm.com>
Subject: [PULL 25/46] hw/ppc/pnv_xscom: Move sysbus_mmio_map() call within
 pnv_xscom_init()
Date: Thu, 19 Oct 2023 23:17:50 +0200
Message-ID: <20231019211814.30576-26-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231019211814.30576-1-philmd@linaro.org>
References: <20231019211814.30576-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x335.google.com
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
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: PQA/XPQ79WUy

In order to make the next commit trivial, move sysbus_init_mmio()
calls just before the corresponding sysbus_mmio_map() calls.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Reviewed-by: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
Reviewed-by: Cédric Le Goater <clg@kaod.org>
Message-Id: <20231019131647.19690-4-philmd@linaro.org>
---
 include/hw/ppc/pnv_xscom.h | 2 +-
 hw/ppc/pnv.c               | 9 +++------
 hw/ppc/pnv_xscom.c         | 3 ++-
 3 files changed, 6 insertions(+), 8 deletions(-)

diff --git a/include/hw/ppc/pnv_xscom.h b/include/hw/ppc/pnv_xscom.h
index 41671001da..35b19610f7 100644
--- a/include/hw/ppc/pnv_xscom.h
+++ b/include/hw/ppc/pnv_xscom.h
@@ -170,7 +170,7 @@ struct PnvXScomInterfaceClass {
 #define PNV10_XSCOM_PEC_PCI_BASE   0x8010800 /* index goes upwards ... */
 #define PNV10_XSCOM_PEC_PCI_SIZE   0x200
 
-void pnv_xscom_init(PnvChip *chip, uint64_t size);
+void pnv_xscom_init(PnvChip *chip, uint64_t size, hwaddr addr);
 int pnv_dt_xscom(PnvChip *chip, void *fdt, int root_offset,
                  uint64_t xscom_base, uint64_t xscom_size,
                  const char *compat, int compat_size);
diff --git a/hw/ppc/pnv.c b/hw/ppc/pnv.c
index 456631c9dc..10158f7684 100644
--- a/hw/ppc/pnv.c
+++ b/hw/ppc/pnv.c
@@ -1249,8 +1249,7 @@ static void pnv_chip_power8_realize(DeviceState *dev, Error **errp)
     assert(chip8->xics);
 
     /* XSCOM bridge is first */
-    pnv_xscom_init(chip, PNV_XSCOM_SIZE);
-    sysbus_mmio_map(SYS_BUS_DEVICE(chip), 0, PNV_XSCOM_BASE(chip));
+    pnv_xscom_init(chip, PNV_XSCOM_SIZE, PNV_XSCOM_BASE(chip));
 
     pcc->parent_realize(dev, &local_err);
     if (local_err) {
@@ -1508,8 +1507,7 @@ static void pnv_chip_power9_realize(DeviceState *dev, Error **errp)
     Error *local_err = NULL;
 
     /* XSCOM bridge is first */
-    pnv_xscom_init(chip, PNV9_XSCOM_SIZE);
-    sysbus_mmio_map(SYS_BUS_DEVICE(chip), 0, PNV9_XSCOM_BASE(chip));
+    pnv_xscom_init(chip, PNV9_XSCOM_SIZE, PNV9_XSCOM_BASE(chip));
 
     pcc->parent_realize(dev, &local_err);
     if (local_err) {
@@ -1719,8 +1717,7 @@ static void pnv_chip_power10_realize(DeviceState *dev, Error **errp)
     Error *local_err = NULL;
 
     /* XSCOM bridge is first */
-    pnv_xscom_init(chip, PNV10_XSCOM_SIZE);
-    sysbus_mmio_map(SYS_BUS_DEVICE(chip), 0, PNV10_XSCOM_BASE(chip));
+    pnv_xscom_init(chip, PNV10_XSCOM_SIZE, PNV10_XSCOM_BASE(chip));
 
     pcc->parent_realize(dev, &local_err);
     if (local_err) {
diff --git a/hw/ppc/pnv_xscom.c b/hw/ppc/pnv_xscom.c
index af57b55863..cf892c9fe8 100644
--- a/hw/ppc/pnv_xscom.c
+++ b/hw/ppc/pnv_xscom.c
@@ -221,7 +221,7 @@ const MemoryRegionOps pnv_xscom_ops = {
     .endianness = DEVICE_BIG_ENDIAN,
 };
 
-void pnv_xscom_init(PnvChip *chip, uint64_t size)
+void pnv_xscom_init(PnvChip *chip, uint64_t size, hwaddr addr)
 {
     SysBusDevice *sbd = SYS_BUS_DEVICE(chip);
     char *name;
@@ -230,6 +230,7 @@ void pnv_xscom_init(PnvChip *chip, uint64_t size)
     memory_region_init_io(&chip->xscom_mmio, OBJECT(chip), &pnv_xscom_ops,
                           chip, name, size);
     sysbus_init_mmio(sbd, &chip->xscom_mmio);
+    sysbus_mmio_map(sbd, 0, addr);
 
     memory_region_init(&chip->xscom, OBJECT(chip), name, size);
     address_space_init(&chip->xscom_as, &chip->xscom, name);
-- 
2.41.0

