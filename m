Received: by 2002:a19:ca48:0:0:0:0:0 with SMTP id h8csp1820620lfj;
        Tue, 11 Jan 2022 09:40:10 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzhwUj9V5NfzTKgWqqmkSK9arW+XC2ryDquo7H+VFrMQUijpneVJbWLYWOpNoBANIDRcX1l
X-Received: by 2002:a05:6e02:1aa1:: with SMTP id l1mr3026401ilv.215.1641922810197;
        Tue, 11 Jan 2022 09:40:10 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1641922810; cv=none;
        d=google.com; s=arc-20160816;
        b=esreUSVQ1VmttWQUPG+a5MZ1dZ7pkLHBcLt4cSm0MMwXSUSY7xSkX2xLCNS5D/zQC5
         uCeKQyvsRH6LTHnL5RLcCIEJKg3dSML8PP+9iAEsOLz5SxsT4jKhmg+LvaVa+mE3mPga
         F+a1SDJMJitad2h4f7l6njgGN2RpePvGm33+RRKsz1+VSarn6EN2kDmpFRpWFbPfhUae
         Bgh99oWSyof38LJEA0TZBDKQkqxnh0hGJH2qdPQoGawa6DbvioD7fToYFFKp1MkCXgJz
         QYa+W0k9iWQ5+5o9YX3iqn5bwM7npfQ9gngwPa8ORyH3dZGlLJ+QH7S05HLaCnEYrS4s
         7AHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:from:subject:mime-version
         :message-id:date:dkim-signature;
        bh=vmwZoqt3VOA1A7dG7w3w8KRUrA973J4DcOKjuhMXOP8=;
        b=r6xiam+MLgfLM3FKd+qjjKHh0Zs5sZRm9LWxDncrm+e0+E4u6dythzHIe5hiF88/5d
         /VOOdO41vRQ/MB66gQi7cgb00WhDRMRKnL8hf20EXrSqDAMb3OUeV7EpX+YaD/f9p2Z2
         kL/sD8YEucWEdlyP3ssqAB1zN8JynTePE2jMTAouqgVI/dkOAHX58SVjxZisKGZVSeXm
         P3LOn0YWAJaNt4gILVeMrAf1LlFgStm3kuj4vK4gWIz78pphA7tPYhbndBvqOnGMDlpX
         NZtyILKaXx9QTJUSUTfbB5IV/HTi/LVdHOHIa43d8Ec6jpRjrkdBYTbLNcYb0oyBzj9X
         aCBQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20210112 header.b=phQdtBs9;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k13si4549187iov.4.2022.01.11.09.40.10
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 11 Jan 2022 09:40:10 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20210112 header.b=phQdtBs9;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Received: from localhost ([::1]:33090 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1n7L7x-00014K-Kg
	for alex.bennee@linaro.org; Tue, 11 Jan 2022 12:40:09 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40504)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3Hr3dYQcKCCUWFOUVSFHPPHMF.DPNRFNV-BSNOPOHOV.PSH@flex--venture.bounces.google.com>)
 id 1n7KyE-0005UG-2i
 for qemu-arm@nongnu.org; Tue, 11 Jan 2022 12:30:06 -0500
Received: from [2607:f8b0:4864:20::b4a] (port=46008
 helo=mail-yb1-xb4a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3Hr3dYQcKCCUWFOUVSFHPPHMF.DPNRFNV-BSNOPOHOV.PSH@flex--venture.bounces.google.com>)
 id 1n7KyC-0001hR-8D
 for qemu-arm@nongnu.org; Tue, 11 Jan 2022 12:30:05 -0500
Received: by mail-yb1-xb4a.google.com with SMTP id
 2-20020a251302000000b006118f867dadso1803766ybt.12
 for <qemu-arm@nongnu.org>; Tue, 11 Jan 2022 09:30:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=date:message-id:mime-version:subject:from:to:cc;
 bh=vmwZoqt3VOA1A7dG7w3w8KRUrA973J4DcOKjuhMXOP8=;
 b=phQdtBs9xo9va6TKFQoBbirtPWvONoNfjxDtxTBqLEnBcQlmpS6JSA0Iddx99RbXDp
 sbzR9QUy5MH4HObc8vjs00mG6hVBj71AgqNLTZSV1sNzefP5zwxx7ygoMCKJQhvCJOCK
 aionZ4V62D5pYKijUHtIOzELI68t9Io7UBWB+dWFU0H5MXcrN+pZCFBWNIsX4BKAzrDa
 8GjQNGadHcfdqK+tFDyQqUPBKlWhkIEQpQ9z3fbn5B1qoYtk+gUhjfDlR4Xje5vNNt5T
 g4ck21vMVl7L0pCc4LxifzSVvX1eZSp+8MyriKIU3UApRG8VfrbmgGCedfl7fL21/QKq
 OKtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
 bh=vmwZoqt3VOA1A7dG7w3w8KRUrA973J4DcOKjuhMXOP8=;
 b=LEFC3M88u4ZuMXScZMnPtjS/6F1B0jY92fgD6jGVBuuWQBXH4lHHj5vdulrjF1rINe
 bYTOWBwqfIzmcDMjzI0sihgP3nY9jGOYOuB4OwpT6Wjv3TGjSRDi4lxI0ju7rQ5N2QPf
 YKHFH7bHzgDGJzd1x+utgn/VHvG4djaL/sQGqVxzGsp9SsP+Nzr3ntoNfaS0v+mXrufe
 uodrjf1JeKOpksgLOhRcvcttbRdNvrG97QNkuGtoNASnGdvQCZfk/Xkg1OWqpKXE7Yal
 uLR0OWl+PUtnNOK/LIvC7Y8DO608Wq1nUm1ufVIugXl5o72pksBJagVWQ0jPPEje+hr8
 XH1Q==
X-Gm-Message-State: AOAM5334VuWBGhai6YBAKRrTXQApFkRreK3Cn5CWwwK33y4lwAhAYC3W
 ZQ+bqpHjjVhhc/RhfBMlF2vAc93tjk+M
X-Received: from venture.svl.corp.google.com
 ([2620:15c:2a3:200:574:98c:4a15:a258])
 (user=venture job=sendgmr) by 2002:a25:70d5:: with SMTP id
 l204mr7718307ybc.193.1641921822061; Tue, 11 Jan 2022 09:23:42 -0800 (PST)
Date: Tue, 11 Jan 2022 09:23:38 -0800
Message-Id: <20220111172338.1525587-1-venture@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.34.1.575.g55b058a8bb-goog
Subject: [PATCH] hw/arm: kudo add lm75s behind bus 1 switch at 75
From: Patrick Venture <venture@google.com>
To: hskinnemoen@google.com, kfting@nuvoton.com, peter.maydell@linaro.org
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, 
 Patrick Venture <venture@google.com>, Hao Wu <wuhaotsh@google.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::b4a
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::b4a;
 envelope-from=3Hr3dYQcKCCUWFOUVSFHPPHMF.DPNRFNV-BSNOPOHOV.PSH@flex--venture.bounces.google.com;
 helo=mail-yb1-xb4a.google.com
X-Spam_score_int: -62
X-Spam_score: -6.3
X-Spam_bar: ------
X-Spam_report: (-6.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SORTED_RECIPS=2.499,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 USER_IN_DEF_DKIM_WL=-7.5 autolearn=no autolearn_force=no
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
X-TUID: ot06erUFzpIB

Reviewed-by: Hao Wu <wuhaotsh@google.com>
Signed-off-by: Patrick Venture <venture@google.com>
---
 hw/arm/npcm7xx_boards.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/hw/arm/npcm7xx_boards.c b/hw/arm/npcm7xx_boards.c
index 7d0f3148be..d701e5cc55 100644
--- a/hw/arm/npcm7xx_boards.c
+++ b/hw/arm/npcm7xx_boards.c
@@ -332,7 +332,15 @@ static void kudo_bmc_i2c_init(NPCM7xxState *soc)
 {
     I2CSlave *i2c_mux;
 
-    i2c_slave_create_simple(npcm7xx_i2c_get_bus(soc, 1), TYPE_PCA9548, 0x75);
+    i2c_mux = i2c_slave_create_simple(npcm7xx_i2c_get_bus(soc, 1),
+                                      TYPE_PCA9548, 0x75);
+
+    /* tmp105 is compatible with the lm75 */
+    i2c_slave_create_simple(pca954x_i2c_get_bus(i2c_mux, 4), "tmp105", 0x5c);
+    i2c_slave_create_simple(pca954x_i2c_get_bus(i2c_mux, 5), "tmp105", 0x5c);
+    i2c_slave_create_simple(pca954x_i2c_get_bus(i2c_mux, 6), "tmp105", 0x5c);
+    i2c_slave_create_simple(pca954x_i2c_get_bus(i2c_mux, 7), "tmp105", 0x5c);
+
     i2c_slave_create_simple(npcm7xx_i2c_get_bus(soc, 1), TYPE_PCA9548, 0x77);
 
     i2c_slave_create_simple(npcm7xx_i2c_get_bus(soc, 4), TYPE_PCA9548, 0x77);
-- 
2.34.1.575.g55b058a8bb-goog

