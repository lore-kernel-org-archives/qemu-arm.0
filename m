Received: by 2002:a17:906:cf90:b0:9bd:85f7:2662 with SMTP id um16csp801435ejb;
        Thu, 19 Oct 2023 14:22:26 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFFOD9Bj+ltsrjO/01LQME1IhzBGYfRcz9sBiNXjH6ewu32vIscMZNYQiovS3RnQEQx+krQ
X-Received: by 2002:a67:a64b:0:b0:457:d207:4328 with SMTP id r11-20020a67a64b000000b00457d2074328mr195814vsh.23.1697750546579;
        Thu, 19 Oct 2023 14:22:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1697750546; cv=none;
        d=google.com; s=arc-20160816;
        b=K8VXfJMExdphSBQvwhMwFNK+YGreI6RKgrNIORsucb9E50fR3WUJhzc9NzWfCTuAkh
         KrcDDgNXNn1U4EQBWgexRypuR3jZmk5dFKHq6ko3h2IjDBvBQ4nKPnlK6BZlRsAGITE7
         tfA9YBqZuaPwOrJZlnxcdyijYCv4bNWJSyETFjE2rNV2bSTnrWjlN5MOboPElCQG/Xta
         dwGXJeYkbJ1qcAjo3ZGcGEBGxPhHkFKLdn0d6YG8PzSVZx+pIDkX3YX7tZtwvrWZD0Ik
         4kunoNRoWlgtRnL/MxfzUdJsDWPzABATGzQDG0NBTz0n6ImvthtRy6NbDJimkN8kayAW
         x/qA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=L77YzspB8FLbeJAi/xMSeTxKS717pbBpnSqxW2g70VQ=;
        fh=2q5eMg19MBJX4UJEslUyHr343qyfN+8GSNgdOvlNCm8=;
        b=TEL2cB+CwYGUgm/GjLNFCLGG9xQuTJJ2lSH6P56LvRIXCZwS7abc6rNkOH+a7xkEIw
         PKATS2wGj+LY9t3xCsbB3isCx/pZRtcO5lIRieFLpE/DF23BW187GVZ7gsTxFQyGxT88
         /GYEI+miQgTBChHubS3p+EAkeFA4PCd8eyjFPjKPAoWYS7auQocY+vxMrv8T6Q2QVsb5
         HEhsdnicVl0kAP50msUwnaQixS5cXqQbg56gD8OJYPUnp2jiL88QuKYbI3H0o1QJmdnh
         OCq0/Fxj+BxAJijpgVjFGokxshcsZwrcYlNCuqBBcyVOOAXZIJZeq6iBdxaW86nwFb5h
         6feQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ullVvB39;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q13-20020a05620a0d8d00b00775762f28c2si265718qkl.81.2023.10.19.14.22.26
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 19 Oct 2023 14:22:26 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ullVvB39;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1qtaSR-0001OF-Q1; Thu, 19 Oct 2023 17:21:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qtaSO-0001Ji-Fv
 for qemu-devel@nongnu.org; Thu, 19 Oct 2023 17:21:28 -0400
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qtaSM-0006kX-7k
 for qemu-devel@nongnu.org; Thu, 19 Oct 2023 17:21:28 -0400
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-40790b0a224so1090255e9.0
 for <qemu-devel@nongnu.org>; Thu, 19 Oct 2023 14:21:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1697750484; x=1698355284; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=L77YzspB8FLbeJAi/xMSeTxKS717pbBpnSqxW2g70VQ=;
 b=ullVvB39rcaCkPICFdiESGxAOLYEaJe2fO++yDn9Ek/WeRbqYTd/k0wLAFIt2eP3dN
 vdTHAZLTe1mxrUS/5CtbDkBZSTOA52MS4UiaqCfwyIApoWUv8RViiNne88CRJ24WwS4j
 Xs8WDgiPWrqhxVLeTu9LL5MaZ77ZrLAhw2H/FOqVHovfYp/b7KKfEkYOHpbjeJWXUXFB
 YXHu1N4k794mIwXuo4hojO6ql7BV10x6Z+nHoPHVuNapNoZvkxg/wOWTntqstHq4Finh
 5dWwhqMlLTdNuJ8l0WzCT5n7Kxg4zpCCFD7W1gvTaF7GdpRc106MXliEdTTsANwRshLb
 IojQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697750484; x=1698355284;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=L77YzspB8FLbeJAi/xMSeTxKS717pbBpnSqxW2g70VQ=;
 b=PRzi5tQ2qGh8/yI3MRjmd/nJA7hp0syUckOid1tJgO+91tTedjrP5VFNv3P+OfGhjo
 yHEmRFrWH0kdl1H67jIo7bQ/l8qq+Q88PcLhOHakXeWe2ljyc1wGNHLmpVwOy30viLNl
 YvrHghtgEp45FL4+BaYWK6s3Uy2bYXCm81iX1n7HI6dgy5XrFHyecPHGdqx7DYFBHfvw
 2h0tUTzqEFpFtjiDWwfUSaxhzJxkMFORWF/Z7OhWnT2NckppMJpmF3mTuLq0/84Esirn
 wTUWuv2nnatjSsUd3UOnbJk5r7IRo42YwLrLCsWKjZDyhPjxfY9Gdj19w0cMBAj/6+u1
 5VlA==
X-Gm-Message-State: AOJu0YyXX19fecpBfawTscbWPzvSfAIJxVvyqtFCGMOBhQTQpixs+yxO
 vbd1SzW/hqMYni9WiMRPA9YbIMFRYDG3+LfOVfmCvA==
X-Received: by 2002:a05:600c:4992:b0:406:513d:7373 with SMTP id
 h18-20020a05600c499200b00406513d7373mr67452wmp.11.1697750484293; 
 Thu, 19 Oct 2023 14:21:24 -0700 (PDT)
Received: from m1x-phil.lan (176-131-216-177.abo.bbox.fr. [176.131.216.177])
 by smtp.gmail.com with ESMTPSA id
 b24-20020a05600c06d800b004064e3b94afsm5307518wmn.4.2023.10.19.14.21.21
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 19 Oct 2023 14:21:23 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, qemu-s390x@nongnu.org, qemu-block@nongnu.org,
 qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Thomas Huth <thuth@redhat.com>, LIU Zhiwei <zhiwei_liu@linux.alibaba.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Nicholas Piggin <npiggin@gmail.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 Harsh Prateek Bora <harshpb@linux.ibm.com>,
 =?UTF-8?q?Fr=C3=A9d=C3=A9ric=20Barrat?= <fbarrat@linux.ibm.com>
Subject: [PULL 28/46] hw/intc/spapr_xive: Move sysbus_init_mmio() calls around
Date: Thu, 19 Oct 2023 23:17:53 +0200
Message-ID: <20231019211814.30576-29-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231019211814.30576-1-philmd@linaro.org>
References: <20231019211814.30576-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: J9AsPhWM8jMX

In order to make the next commit trivial, move sysbus_init_mmio()
calls just before the corresponding sysbus_mmio_map() calls.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Reviewed-by: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
Reviewed-by: Cédric Le Goater <clg@kaod.org>
Message-Id: <20231019131647.19690-7-philmd@linaro.org>
---
 hw/intc/spapr_xive.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/hw/intc/spapr_xive.c b/hw/intc/spapr_xive.c
index 7f701d414b..12057ffe5b 100644
--- a/hw/intc/spapr_xive.c
+++ b/hw/intc/spapr_xive.c
@@ -316,7 +316,6 @@ static void spapr_xive_realize(DeviceState *dev, Error **errp)
     if (!qdev_realize(DEVICE(xsrc), NULL, errp)) {
         return;
     }
-    sysbus_init_mmio(SYS_BUS_DEVICE(xive), &xsrc->esb_mmio);
 
     /*
      * Initialize the END ESB source
@@ -328,7 +327,6 @@ static void spapr_xive_realize(DeviceState *dev, Error **errp)
     if (!qdev_realize(DEVICE(end_xsrc), NULL, errp)) {
         return;
     }
-    sysbus_init_mmio(SYS_BUS_DEVICE(xive), &end_xsrc->esb_mmio);
 
     /* Set the mapping address of the END ESB pages after the source ESBs */
     xive->end_base = xive->vc_base + xive_source_esb_len(xsrc);
@@ -347,14 +345,16 @@ static void spapr_xive_realize(DeviceState *dev, Error **errp)
     /* TIMA initialization */
     memory_region_init_io(&xive->tm_mmio, OBJECT(xive), &spapr_xive_tm_ops,
                           xive, "xive.tima", 4ull << TM_SHIFT);
-    sysbus_init_mmio(SYS_BUS_DEVICE(xive), &xive->tm_mmio);
 
     /*
      * Map all regions. These will be enabled or disabled at reset and
      * can also be overridden by KVM memory regions if active
      */
+    sysbus_init_mmio(SYS_BUS_DEVICE(xive), &xsrc->esb_mmio);
     sysbus_mmio_map(SYS_BUS_DEVICE(xive), 0, xive->vc_base);
+    sysbus_init_mmio(SYS_BUS_DEVICE(xive), &end_xsrc->esb_mmio);
     sysbus_mmio_map(SYS_BUS_DEVICE(xive), 1, xive->end_base);
+    sysbus_init_mmio(SYS_BUS_DEVICE(xive), &xive->tm_mmio);
     sysbus_mmio_map(SYS_BUS_DEVICE(xive), 2, xive->tm_base);
 }
 
-- 
2.41.0

