Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A8AECCD199
	for <qemu-arm@archiver.kernel.org>; Fri, 17 Oct 2025 13:22:48 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1v9kDP-0003qI-5x; Fri, 17 Oct 2025 09:09:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1v9kD3-0003PX-SH
 for qemu-arm@nongnu.org; Fri, 17 Oct 2025 09:09:30 -0400
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1v9kCp-0004Z0-KM
 for qemu-arm@nongnu.org; Fri, 17 Oct 2025 09:09:19 -0400
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-46e6ba26c50so14173225e9.2
 for <qemu-arm@nongnu.org>; Fri, 17 Oct 2025 06:09:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1760706552; x=1761311352; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/GqgVIjIVxL9Bk7BWZfwdZrQ/R8VZlnoVGR9k0eNJZE=;
 b=P3ADTI2ObpzYGdRzEIUrIeecDvc2ADgodLxuOKJ0MPOOfoYbbT/lKFJud+GjbUSSid
 Wzfojc9DZZycpUgRcxswGWS5G1JFTTRGrlWsQO+N7W5r+QLuy6+4SX+XofqMbwyn45sF
 kJ9YwpU6CURc94AltMxutEnT/CkwzbiZnA6puxmThgsMUZjzna3JN8cujk6fVzUfaiF3
 zXxqwWc1HymcbuVM+oUkxWs6o2xp3NgaSFrSutvj340SOHxQce9aUbuxTowa4EJyPPjW
 Z+veDerSNLlCEKVmRCDUJiEmLUaIVafOfS5aQs9NkP9s89vkpVPsRlfnMxX/0iOzPOnp
 ePag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760706552; x=1761311352;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/GqgVIjIVxL9Bk7BWZfwdZrQ/R8VZlnoVGR9k0eNJZE=;
 b=BwRhd78CVIsZAg+8afnIkqZzSjU88tcux2n2qVnRVUCFkHsU9iC9eFPrRFcm+8Hcps
 an1OrnXKevoFajS3qWGJYz/nRD28dkOkrEIZEI8pMncAGDfvWrPCaGgILZNV1d9fUNt/
 apsn8+4L163GxhQe5cqPUFXQ2a0dHIKSwZeLRxrUEC59dZsgxQrWflcC6rzbyHnx1lxg
 3dJRmYnZcu1xb8eCIVn0re8+qNiv7iWTSQruow3HhHnB2jFkzLHICfPiNHna+nwmmmYS
 Krz98728bz1D6KIR4uS82gyOwS9WG33kv9ErS508DPI7bfsJ29jmzYyn5HjLDlNowiVb
 T7KQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUNYSbBM5ZA9jlMVG/LVV0vHI+XbzoUJiDYxRENdn+qBi602nbdpH5PHaVUhHvXvmsEyjxfVCES8A==@nongnu.org
X-Gm-Message-State: AOJu0YxVVg74Re3e1ZzhSI7Zu0c8knbDaUl0yFWqCbul23ceM534wGkF
 VY3CIBu9DSGOMkF1hbNvlNFrg6xiDdRvARdGAJyQxMZi0+YHtGITLwdmGzWJrry3BU0=
X-Gm-Gg: ASbGnctr968uKK7BlrCnohqgcAUbvtvdLwc5rRYOj/2yXQBeDFwJjQysimoeVlfHttZ
 SeO+KOHkWL6MotssmhuUT7kujVHPOHA8dBdv4NHAWnpfmL9j5I9a9aF/92Iy43fqG85ZDmQjE28
 xHQyq7PS1TDcpBIvgMrLC06RKpDFcbbe7K3f0b1aMl5JDUM8ueePuLHv+kv0VvmuAUD2iMTrhDp
 g467U+Yq6HJVbsDvZqV/eUIHX0gq1sLh+Z/xV6CQ6uBoz6Y+t6JbCpd+OudFHR9ndpmLbjA5eZ6
 wkiR6g/Mjyf7HNG8PUasD45HyXRq8IqMTpunsSM3b0818rVYN1OCZnd0elxDoWrmQlYdMSkB2vs
 dgSNkH8EQeHuTbV6wHRmg1YqoAsHl5eJGqGoq1ibdfARARtG7KAW0NWtD8b+oYrP1/Dtiqc2Vn4
 EkQzg2RUKEYM/psPMOLdN1ATD6Nq4UAp5vgjBv58XIi/+2AO3M+Ln+vtxhgYM5K9NfyhmMbr8=
X-Google-Smtp-Source: AGHT+IE8PhpIiHfHWpHcb8zHxB6YySKZ3L4Z+1bd8cjkOVSeAHxTMdwlRmXGPYuQj0ra9V8k/mg7sg==
X-Received: by 2002:a05:600c:8284:b0:45d:d505:a1c3 with SMTP id
 5b1f17b1804b1-47117920935mr31315235e9.37.1760706551922; 
 Fri, 17 Oct 2025 06:09:11 -0700 (PDT)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-426ce5e10e8sm40948238f8f.39.2025.10.17.06.09.10
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 17 Oct 2025 06:09:11 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: "Michael S. Tsirkin" <mst@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Andrew Jones <ajones@ventanamicro.com>, Ani Sinha <anisinha@redhat.com>,
 qemu-arm@nongnu.org, Shannon Zhao <shannon.zhaosl@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 10/20] hw/arm/virt: Remove VirtMachineClass::no_secure_gpio
 field
Date: Fri, 17 Oct 2025 15:08:09 +0200
Message-ID: <20251017130821.58388-11-philmd@linaro.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251017130821.58388-1-philmd@linaro.org>
References: <20251017130821.58388-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

The VirtMachineClass::no_secure_gpio field was
only used by virt-5.2 machine, which got removed.
Remove it as now unused.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 include/hw/arm/virt.h | 1 -
 hw/arm/virt.c         | 2 +-
 2 files changed, 1 insertion(+), 2 deletions(-)

diff --git a/include/hw/arm/virt.h b/include/hw/arm/virt.h
index 96f3569c290..c5ccd6ec9ea 100644
--- a/include/hw/arm/virt.h
+++ b/include/hw/arm/virt.h
@@ -123,7 +123,6 @@ struct VirtMachineClass {
     MachineClass parent;
     bool no_tcg_its;
     bool no_highmem_compact;
-    bool no_secure_gpio;
     /* Machines < 6.2 have no support for describing cpu topology to guest */
     bool no_cpu_topology;
     bool no_tcg_lpa2;
diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index e49af505431..33c0034b030 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -2510,7 +2510,7 @@ static void machvirt_init(MachineState *machine)
         create_gpio_devices(vms, VIRT_GPIO, sysmem);
     }
 
-    if (vms->secure && !vmc->no_secure_gpio) {
+    if (vms->secure) {
         create_gpio_devices(vms, VIRT_SECURE_GPIO, secure_sysmem);
     }
 
-- 
2.51.0


