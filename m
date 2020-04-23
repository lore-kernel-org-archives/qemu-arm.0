Received: by 2002:ac2:52b1:0:0:0:0:0 with SMTP id r17csp1813171lfm;
        Thu, 23 Apr 2020 05:11:40 -0700 (PDT)
X-Google-Smtp-Source: APiQypLnxRaJ/kbfNWBsN49Fc/Ff1iFIBWp8MIiUH90JDVdEprKMf9gxOHn/yK915sIJJmMnJTAe
X-Received: by 2002:a05:6214:1402:: with SMTP id n2mr3836655qvx.104.1587643900413;
        Thu, 23 Apr 2020 05:11:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1587643900; cv=none;
        d=google.com; s=arc-20160816;
        b=fT778KdDu8dbpvieJK0KrEoUvNenBEQSKNSEnbzsjiAEYWpGtXeXhHTuhIG2fpIOyZ
         jar5TVUWhGMSjaqKFXAOsdF2HDSfhg2bE1RstUQ9ugIau9Rm1+oJBCXmhE4akULClDhh
         DZHoP3B+8hApj5ecTeAdwp0/Dz0a9bo3ODahvAPAbcfdgx8mjjvrURHG5vOMbmM/CaBB
         hmLpKPSiMbV1aIStO5kz3OgQ3YLxGesuoTNpjUDt36Nm0aR9zHCvqoifSrXbwMak/c/c
         +CksU63cNbVliFuWmLK9INx/ZeHaQCojEvNKs9L2VQc8j41U83iGgB43rIffR+QolRlc
         q7oQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=Ibni5GBdJPCYUbCK4oOU2/vhcP6N08qmypiQakNxh54=;
        b=KCV5X+U4SoZGvJERHrcMMEhYVBqBknLI1kxS+ZO0Hv+f01l1x28cmCUg6bsCCfv6cZ
         IXmywYJpd6q/l0PKQNqPxT8OPlqKIB3+sP0/F3BoZumfH32NUuvmUB3+7MFkdFkpw6tW
         QkKQMyJUOQGVUXih4ATIUkytal2o0D4MeIZuVC9bJCrEH3VteWIDagfPXt7f/oHduylg
         vaxy3HmFiBGhOIa/8nq3vqQOl85ZJVV6bTHSGX8AF83FgeilL6HXONjrWIGZVyX11Bng
         6VMzXfHWP8obWVhiwDQwNnrVbdjCGKKRV4rCbEax5B7WA/zjl8Ye1HakCz2kD+1Mcoma
         7+fQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=maMZOWCo;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c31si1211905qte.343.2020.04.23.05.11.40
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 23 Apr 2020 05:11:40 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=maMZOWCo;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:42148 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jRahf-00028x-R2
	for alex.bennee@linaro.org; Thu, 23 Apr 2020 08:11:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52018)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <edgar.iglesias@gmail.com>) id 1jRahO-00024w-KG
 for qemu-arm@nongnu.org; Thu, 23 Apr 2020 08:11:23 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.90_1)
 (envelope-from <edgar.iglesias@gmail.com>) id 1jRahO-00086z-9O
 for qemu-arm@nongnu.org; Thu, 23 Apr 2020 08:11:22 -0400
Received: from mail-lj1-x242.google.com ([2a00:1450:4864:20::242]:32994)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <edgar.iglesias@gmail.com>)
 id 1jRahM-00085T-Ld; Thu, 23 Apr 2020 08:11:20 -0400
Received: by mail-lj1-x242.google.com with SMTP id w20so5972078ljj.0;
 Thu, 23 Apr 2020 05:11:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Ibni5GBdJPCYUbCK4oOU2/vhcP6N08qmypiQakNxh54=;
 b=maMZOWCoIqBkYRUPD5dLj7xFGvvrl7FK/OxkIwMNGmlNMi8fN1MqIuocIYDCpBNZfR
 j6IxkcFPjFtVD1ComvfYd2bRGR4fUqiRPmCztRcP4wWifCR/cGuCodFSXXa1Mq9wkbdu
 hPzqRwc//Jcmo8iO3MHuTLk65Zd2f/DyWe0bGMxucYj+M8QyuMB/qGXyC/M8E6kmXZ5M
 Xwj1XZWbUcvzyxeqWw31YbWYde4px4io1ZrRHg2Qcr3hsMMx8IO//A8bBzlV/LDcxtlX
 KPTmPDW1SZtqfDYbg+abW5Br0zIy/VGBwfcPfEuw5aD2kBThCF8dt1ZdO7Iswv1OP0AO
 tOHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Ibni5GBdJPCYUbCK4oOU2/vhcP6N08qmypiQakNxh54=;
 b=C1GRmo2aWgQ1mWtShMHE4acp9WMLTlITduDyAS6s68HPW/hl9o4Dm3cr4io2Sphe+A
 NvgfQ+HIPesgEBucAfZPQaScN/6kWhiu3pVk0ldUg4spKNDLD/8rtwZ0Kn2KXeETVcD6
 HiY3O3rMhDFAJNBF5UJ8txX6EBLSukzcvUdPgvRq2gh7TsUYLqZxh1oXp5ZDV/jT3o7R
 Rd/xZS3yPRyVQAmKKsH595mbSmbFzJX1Z6bLetPrmfxoNOB46G3XBwqnwf41InfwX4Rh
 x9ZHZ4bIJcBHH4kG+PjAVOBWzkknShcYiMZfUvquoX8gOu20pF0O2fWSZD+JNMl0IKeb
 sNTQ==
X-Gm-Message-State: AGi0PuZ0ZytciDh3IUjafTZ8LLZT8emmetNBVyyvdPZ+4qzUakZ+AEa/
 Lg+8fMe8NEyd0nikLx/F82JeK0fnZ3w=
X-Received: by 2002:a2e:8693:: with SMTP id l19mr2159005lji.63.1587643878038; 
 Thu, 23 Apr 2020 05:11:18 -0700 (PDT)
Received: from gmail.com (81-231-232-130-no39.tbcn.telia.com. [81.231.232.130])
 by smtp.gmail.com with ESMTPSA id b73sm1708175lfg.86.2020.04.23.05.11.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Apr 2020 05:11:17 -0700 (PDT)
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 2/4] device_tree: Constify compat in qemu_fdt_node_path()
Date: Thu, 23 Apr 2020 14:11:12 +0200
Message-Id: <20200423121114.4274-3-edgar.iglesias@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200423121114.4274-1-edgar.iglesias@gmail.com>
References: <20200423121114.4274-1-edgar.iglesias@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::242;
 envelope-from=edgar.iglesias@gmail.com; helo=mail-lj1-x242.google.com
X-detected-operating-system: by eggs.gnu.org: Error: [-] PROGRAM ABORT :
 Malformed IPv6 address (bad octet value).
 Location : parse_addr6(), p0f-client.c:67
X-Received-From: 2a00:1450:4864:20::242
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
Cc: figlesia@xilinx.com, peter.maydell@linaro.org, sstabellini@kernel.org,
 edgar.iglesias@xilinx.com, sai.pavan.boddu@xilinx.com,
 frasse.iglesias@gmail.com, alistair@alistair23.me,
 richard.henderson@linaro.org, frederic.konrad@adacore.com, qemu-arm@nongnu.org,
 philmd@redhat.com, luc.michel@greensocs.com, david@gibson.dropbear.id.au
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: NaMPHmCUpocy

From: "Edgar E. Iglesias" <edgar.iglesias@xilinx.com>

Make compat in qemu_fdt_node_path() const char *.

Signed-off-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
---
 device_tree.c                | 2 +-
 include/sysemu/device_tree.h | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/device_tree.c b/device_tree.c
index f5b4699aed..b335dae707 100644
--- a/device_tree.c
+++ b/device_tree.c
@@ -291,7 +291,7 @@ char **qemu_fdt_node_unit_path(void *fdt, const char *name, Error **errp)
     return path_array;
 }
 
-char **qemu_fdt_node_path(void *fdt, const char *name, char *compat,
+char **qemu_fdt_node_path(void *fdt, const char *name, const char *compat,
                           Error **errp)
 {
     int offset, len, ret;
diff --git a/include/sysemu/device_tree.h b/include/sysemu/device_tree.h
index 7c53ef7634..982c89345f 100644
--- a/include/sysemu/device_tree.h
+++ b/include/sysemu/device_tree.h
@@ -43,7 +43,7 @@ void *load_device_tree_from_sysfs(void);
  * @name may be NULL to wildcard names and only match compatibility
  * strings.
  */
-char **qemu_fdt_node_path(void *fdt, const char *name, char *compat,
+char **qemu_fdt_node_path(void *fdt, const char *name, const char *compat,
                           Error **errp);
 
 /**
-- 
2.20.1

