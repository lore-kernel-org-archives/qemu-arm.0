Received: by 2002:a17:505:6015:b0:1be9:327d:8ee3 with SMTP id us21csp798333njc;
        Fri, 6 Jun 2025 02:30:24 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXBY2Klr8BZ8igJHUW2q1QYgeiS6ZK+GXEhvT+JWNkxJrBrNfxJf/vADx95PH5uFhJRYRDT+v8qZcxfEg==@linaro.org
X-Google-Smtp-Source: AGHT+IFsnpSKUZIbkvRNP83O/okoFQuzrh0ek+KklUzICSGppOhBnkCE7V9s8oCnSq6+bAOXFkfS
X-Received: by 2002:a05:622a:144c:b0:4a6:ded9:1148 with SMTP id d75a77b69052e-4a6ded9124fmr22854491cf.52.1749202213705;
        Fri, 06 Jun 2025 02:30:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1749202213; cv=none;
        d=google.com; s=arc-20240605;
        b=dtO/YLkWGCqIAAt4Of9DG409zXJculQbY0CBXZMbpmKaTiysRklFx8rxHWWBgr1Zx+
         Fb85+7hPAvabfGacyt40nBB4leMrY1G4J9EH7bZRUHhDZuNiLPpQkUIVv1kJKZb8DjnH
         e8DQy66CW324q4oO2dRA+RGLopBUWkIHXndGSchtZFkgKMT8m3DBdSCg4pBEdofUY45G
         S3EFTcyvcmYaIlg4DQOras+ccloD7LOwP/t1mMF1g6Yws+t9nxUpo7lp4QxNc8/ME97w
         3XoWkFo3KFIVBJqzKi8aAu5eQ+ZoEeud2dluf9tHlHsi2JWTDRbBgnW5WJVzgQ0/nSYb
         6MEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=4GrfktJnNcoiQOOCAfk9aKe08+nzGO5wNSjf9ubEZAA=;
        fh=On0iqecn6op6Ip9fF7l4WwS4a+zasSTgDnZQBibNgEs=;
        b=gK5B1lr+DmeBjS0RNIP7jbshHzrCXDRVxVwYb2nA9rEG1DhVtXd9KSRUcuxlW2Xdoa
         kbStYQFyQDItqYavTWZwjLuqKqQ5jIZNAsT1YHqnPmwBsRJwqcrRFJG7IKVm8S+/VfYI
         ZW0C2qn2qIIiuroLhgFK0Jn7jKinVhn/unG3yNrrnDNtI0bwehyp/LFLzN659++I70bK
         mdmHHj4t+JC0f2Rby5i00A67NSM8OZIbLxTc9QpvKmdlD9eKD7gQQaK0LYvc5Ji34QJe
         TO6UlMlQplycfDaWfQ48TaS3IL42yulsVodjDLiLE+xZ1W1BkvD3Y+4VNo+mI7loyOs1
         3yjg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@intel.com header.s=Intel header.b=mXothN+u;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=intel.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-4a6198ce5cfsi13037151cf.650.2025.06.06.02.30.13
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 06 Jun 2025 02:30:13 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@intel.com header.s=Intel header.b=mXothN+u;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=intel.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uNTN5-0005nu-FB; Fri, 06 Jun 2025 05:28:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhenzhong.duan@intel.com>)
 id 1uNTN3-0005n9-Br; Fri, 06 Jun 2025 05:28:18 -0400
Received: from mgamail.intel.com ([198.175.65.14])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhenzhong.duan@intel.com>)
 id 1uNTMw-0001AE-40; Fri, 06 Jun 2025 05:28:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749202091; x=1780738091;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=2ePIszT8vhUK6g6wYVAlRimUVB4HDL6I8i1MCH7XmJE=;
 b=mXothN+uN6KilGLRnetdrFcxAfcymwC+OlLKXvKJryYea022bvtOzZGz
 P4I95krVbwvJaC6rCB1a+wZyJeenIfcq1DtP0TJGLRpOoCqLNgxIYPM/B
 VrDsOmsaEugy+t+ZBe7Fcaex8gB/JTL9X/lXyk6TRcaiJlZBPfx0wMZhE
 +RC7Vt1TA71OZ45aKq+zmwTn0uN2cElEI5JYNLS5U80jon1RGgkYlFScP
 jBNfBg6U/53Vf5DSri1Hq3x5Hj7OJvPPk66fAbuh/30PQGVqbxvYZxL/7
 BmwJYrtHd3Uz6WxxBV+hKc7+0klXgJLQdXcW+yqW0cP73DrRZK5z9SPYW Q==;
X-CSE-ConnectionGUID: V8dck0uLSH2FPAM4F9D3aw==
X-CSE-MsgGUID: 73C6WmPgR9q6+6Y/4f+R5Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11455"; a="55154640"
X-IronPort-AV: E=Sophos;i="6.16,214,1744095600"; d="scan'208";a="55154640"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jun 2025 02:28:03 -0700
X-CSE-ConnectionGUID: zBWB2QWuRxmXX5DQK84FSQ==
X-CSE-MsgGUID: CuSblt6HR3mqDKjBqDsTQg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,214,1744095600"; d="scan'208";a="145706189"
Received: from spr-s2600bt.bj.intel.com ([10.240.192.127])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jun 2025 02:27:59 -0700
From: Zhenzhong Duan <zhenzhong.duan@intel.com>
To: qemu-devel@nongnu.org
Cc: chao.p.peng@intel.com, david@redhat.com, armbru@redhat.com,
 Zhenzhong Duan <zhenzhong.duan@intel.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 Steven Lee <steven_lee@aspeedtech.com>, Troy Lee <leetroy@gmail.com>,
 Jamin Lin <jamin_lin@aspeedtech.com>,
 Andrew Jeffery <andrew@codeconstruct.com.au>,
 Joel Stanley <joel@jms.id.au>, qemu-arm@nongnu.org (open list:ASPEED BMCs)
Subject: [PATCH v4 3/5] hw/gpio/aspeed: Fix definition of AspeedGPIOClass
Date: Fri,  6 Jun 2025 17:24:04 +0800
Message-Id: <20250606092406.229833-4-zhenzhong.duan@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250606092406.229833-1-zhenzhong.duan@intel.com>
References: <20250606092406.229833-1-zhenzhong.duan@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=198.175.65.14;
 envelope-from=zhenzhong.duan@intel.com; helo=mgamail.intel.com
X-Spam_score_int: -44
X-Spam_score: -4.5
X-Spam_bar: ----
X-Spam_report: (-4.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.132,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, SPF_HELO_NONE=0.001,
 T_SPF_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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
X-TUID: yrqa0szemQ1e

AspeedGPIOClass's parent is SysBusDeviceClass rather than SysBusDevice.
This isn't catastrophic only because sizeof(SysBusDevice) >
sizeof(SysBusDeviceClass).

Fixes: 4b7f956862dc ("hw/gpio: Add basic Aspeed GPIO model for AST2400 and AST2500")
Closes: https://lists.gnu.org/archive/html/qemu-devel/2025-06/msg00586.html
Suggested-by: David Hildenbrand <david@redhat.com>
Reviewed-by: Cédric Le Goater <clg@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Zhenzhong Duan <zhenzhong.duan@intel.com>
---
 include/hw/gpio/aspeed_gpio.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/hw/gpio/aspeed_gpio.h b/include/hw/gpio/aspeed_gpio.h
index e1e6c54333..e6b2fe71b5 100644
--- a/include/hw/gpio/aspeed_gpio.h
+++ b/include/hw/gpio/aspeed_gpio.h
@@ -70,7 +70,7 @@ typedef struct AspeedGPIOReg {
 } AspeedGPIOReg;
 
 struct AspeedGPIOClass {
-    SysBusDevice parent_obj;
+    SysBusDeviceClass parent_class;
     const GPIOSetProperties *props;
     uint32_t nr_gpio_pins;
     uint32_t nr_gpio_sets;
-- 
2.34.1

