Received: by 2002:a17:906:3b11:0:0:0:0 with SMTP id g17csp3315174ejf;
        Tue, 9 Aug 2022 12:14:51 -0700 (PDT)
X-Google-Smtp-Source: AA6agR4tIKm7/9RvFdsuh+tbQ3znZPyz6HjEbepT2vacKzF9Xhg1ZkX8UmnWlh/QBLSyIJGi1INc
X-Received: by 2002:ac8:5887:0:b0:31f:389a:2dd5 with SMTP id t7-20020ac85887000000b0031f389a2dd5mr21133108qta.33.1660072491546;
        Tue, 09 Aug 2022 12:14:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1660072491; cv=none;
        d=google.com; s=arc-20160816;
        b=rpHEFybnazGz6ODwqwp9Gk1a1aIs5yFtrl1zizOPG8GkVcgKnhLYenBg3DowG9YJRG
         Nf397dBwk0xdyK9OMoajy2AYX1OpC1Zr1AZrL6uTe8UwJFNgGBg9eVd/F36qgVVxuOk1
         mmHR4Tu8AIVjWCc2WL50jeMtekOY9cnPXgwZbF7y+20XeHF93kJPDA7pfgPvXir7M148
         VDTql5cT6QBTNXj3DaxS3NVMQSAFcGwGbH6ouZ6UzcNZHk+KgC/vsJyaSMf/txpkMpqj
         EJLydUGAVoO4zthzvCHgDRtK5KyU/8UlgvhUMbDldKyqOj/i4rRJdOwFSCe6p/FhtE9p
         XZHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from;
        bh=d6rAAsVwZzc3RQVQv0hlJrjQ6AVJtM8CWv4xvcb/JkY=;
        b=JYvpF5DmSZHYq1qJ1gya3+foWwP6gI5GRaq+ntEXXwV7VcpC+I2vpiOHezgODU8lK3
         E4G7KIOrAkVQmAd5mr5WROFUtOtl9ilsFq3C7l8grMVAx4ZcOLyaAK/b4H3yvCOcUwC3
         w0ON/yvCotyNWl9iIbAAMIaUO5zwuCIsMehcqOC0rHZWI1jqVf5c/1+4G4FbjnbOxETU
         1wlEJBMZd3jPFZeudTKcoqDxlekFeaR3hMgxb3oEb8nWG1nTkz4EgkOdceIrr7rVYg4e
         Ae93m6ao0Mo3tIvHvFNohLQFROSZF4cnj1xhXe6qKqMO/Zirc3fV6ejxWDBkHL5tNsUf
         ZxZg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i14-20020ac85c0e000000b0031eb3ab7942si11300270qti.356.2022.08.09.12.14.51
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 09 Aug 2022 12:14:51 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:55584 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1oLUgl-0001BT-2t
	for alex.bennee@linaro.org; Tue, 09 Aug 2022 15:14:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40200)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ben@luna.fluff.org>)
 id 1oLUQ9-0007KX-G4; Tue, 09 Aug 2022 14:57:41 -0400
Received: from cpc152649-stkp13-2-0-cust121.10-2.cable.virginm.net
 ([86.15.83.122]:57414 helo=luna)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ben@luna.fluff.org>)
 id 1oLUQ6-0003Ab-Ll; Tue, 09 Aug 2022 14:57:41 -0400
Received: from ben by luna with local (Exim 4.96)
 (envelope-from <ben@luna.fluff.org>) id 1oLUQ1-0039E2-0w;
 Tue, 09 Aug 2022 19:57:33 +0100
From: Ben Dooks <qemu@ben.fluff.org>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, Alistair.Francis@wdc.com, peter.maydell@linaro.org,
 qemu-arm@nongnu.org, Ben Dooks <qemu@ben.fluff.org>
Subject: [PATCH v4 4/6] hw/core: use qemu_fdt_setprop_strings()
Date: Tue,  9 Aug 2022 19:56:38 +0100
Message-Id: <20220809185639.750345-5-qemu@ben.fluff.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220809185639.750345-1-qemu@ben.fluff.org>
References: <20220809185639.750345-1-qemu@ben.fluff.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=86.15.83.122; envelope-from=ben@luna.fluff.org;
 helo=luna
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, FSL_HELO_NON_FQDN_1=0.001,
 HELO_NO_DOMAIN=0.001, KHOP_HELO_FCRDNS=0.187, PDS_RDNS_DYNAMIC_FP=0.001,
 RCVD_IN_SORBS_DUL=0.001, RDNS_DYNAMIC=0.982, SPF_NONE=0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: CAjYJGFy+nwl

Change to using the qemu_fdt_setprop_strings() helper in
hw/core code.

Signed-off-by: Ben Dooks <qemu@ben.fluff.org>
---
 hw/core/guest-loader.c | 13 +++++--------
 1 file changed, 5 insertions(+), 8 deletions(-)

diff --git a/hw/core/guest-loader.c b/hw/core/guest-loader.c
index c61ebc4144..7b8e32e06f 100644
--- a/hw/core/guest-loader.c
+++ b/hw/core/guest-loader.c
@@ -56,18 +56,15 @@ static void loader_insert_platform_data(GuestLoaderState *s, int size,
     qemu_fdt_setprop(fdt, node, "reg", &reg_attr, sizeof(reg_attr));
 
     if (s->kernel) {
-        const char *compat[2] = { "multiboot,module", "multiboot,kernel" };
-        qemu_fdt_setprop_string_array(fdt, node, "compatible",
-                                      (char **) &compat,
-                                      ARRAY_SIZE(compat));
+        qemu_fdt_setprop_strings(fdt, node, "compatible",
+                                 "multiboot,module", "multiboot,kernel");
+
         if (s->args) {
             qemu_fdt_setprop_string(fdt, node, "bootargs", s->args);
         }
     } else if (s->initrd) {
-        const char *compat[2] = { "multiboot,module", "multiboot,ramdisk" };
-        qemu_fdt_setprop_string_array(fdt, node, "compatible",
-                                      (char **) &compat,
-                                      ARRAY_SIZE(compat));
+        qemu_fdt_setprop_strings(fdt, node, "compatible",
+                                 "multiboot,module", "multiboot,ramdisk");
     }
 }
 
-- 
2.35.1

