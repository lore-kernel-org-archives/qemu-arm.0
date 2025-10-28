Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B7E9CCF9E0
	for <qemu-arm@archiver.kernel.org>; Tue, 28 Oct 2025 08:03:38 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vDefy-0005zx-K7; Tue, 28 Oct 2025 04:03:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vDefx-0005zA-Dd
 for qemu-arm@nongnu.org; Tue, 28 Oct 2025 04:03:29 -0400
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vDefs-0000oB-Jy
 for qemu-arm@nongnu.org; Tue, 28 Oct 2025 04:03:28 -0400
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-4711b95226dso69837705e9.0
 for <qemu-arm@nongnu.org>; Tue, 28 Oct 2025 01:03:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1761638602; x=1762243402; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0bJEm1B8ks9h5HyZDKkIUNIPRZdg3XjuMbaxmF/lz1I=;
 b=UMfETVQOdyLejXM+bn0lXHRmLNYaPXRrl0gur2oUg0/hF+y80ManCvk1IsOGtf5PkJ
 fZCoBPMIYF+cz9HgADD6p8hqL17vHeD39aQXT0fANz2gAHXQpt9NNm2/czGSp73TB5YV
 UDLq2vis7IknDPMHwZsQtGqVl8smFHtgo5lXQ4cJuFi6fwzw0ehn/J76J3Nz4vSMQ77b
 HDAEwa4qZnERoYQ5EOClX/ZtQ7YZyYrjD7y856lf232PvUXO75r17ZtEV8ZzQY8AO725
 du08puqQ4h9FLEFIaYJGT/YR4C3WM2r92i+UlWjWScIRaaj+eyfLNTqSUl2zPPVo1r3Z
 sa3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761638602; x=1762243402;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=0bJEm1B8ks9h5HyZDKkIUNIPRZdg3XjuMbaxmF/lz1I=;
 b=QxUKXK3iACjH6SMPq1IUO+uYu2CP8UR/RXKpTek9bhiqHPPunqlxOvDtIagMImgsnn
 AG//rMeaj5DuqgYJYXhCr4MPSrcDQWI+nT6m7tGHlO0QZ4qILhtGgF7xjbTSHamg+faP
 39uTa9DVEQYNUwMnsBA3XgA4grQXpdHYovsaL/jiDuQzPNBXBoM9MWwI+MWFM/ciEjhU
 80NcYFZpOc3iFjC+FvEfy/lvfuMvwkwbmPnjNz+ZDASvW1uOHordA9/femVOGIPbOEku
 YHaU0Y/So5/INzV+1bv4WCzCTRvNWyxvakV37wTWh1n3VjtwrguWIINAyWlg/IrRXF73
 KYgg==
X-Gm-Message-State: AOJu0YzmzwK++1A82don/b+ttOb1J+4r6h0MAJeHjwhY5zVt4fNdL6Qd
 Bac18OhYx9j5yg6fzzcgSA395CO7Pu39PqSiwVOgWMpDAlRcGCLhFlzDsAnNEEZKU1g=
X-Gm-Gg: ASbGncswWzOPyoqs4L47ICnJmeGfaqyny3xvTG6gYo2iroKLDgj69MSW8tD9J02idtb
 BvP7MdPfZ+R93AndubaNP+0V7nQEgQ56kHXydinZtj/8KCfgHuCYPlr27EiKoR8QHKqs0SUrCt2
 dsKKOhAkdC+cPCYkgpyTVtpddI+OVswNHcG1QFG23or0n4fmnTH//tuoGaj4i6U3a43gD6QbTN9
 gdhAOhM8mp6NCVSCqHHss6+FXjYn9BeIqzxNeaUbYMqRg/NnGa6F9WuSJr08ZXd6pinmAjnfh9v
 d5aLSgPcj7foavEagKglPFrnaO9M0UpH/38BsY3PKtgp2vA5E3yzXLnFfxFX0HwA+8YSxpuOVHw
 Tyuho0XFDSaBvYNgnj7tBtB40ziJwAm2eJ2nIOl43F19wlSARsKj/mAxJ+gP61twXRJaX7zuAYD
 wNZBsMTDHarSgX1KwCYQAAnNQmK2Py4OlFiZUtB1C+H5SRYDc4CIG1q8I=
X-Google-Smtp-Source: AGHT+IGu8tAz7QNSfENwh5DhebxcpB0Uf+T7MY5mWmoV8QBJEMMaI05N0PzFr/4r9vD0c/yed5mTVw==
X-Received: by 2002:a05:600c:1554:b0:470:ffd1:782d with SMTP id
 5b1f17b1804b1-47717df6c74mr21252585e9.6.1761638602070; 
 Tue, 28 Oct 2025 01:03:22 -0700 (PDT)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-475dd035dc2sm184181795e9.5.2025.10.28.01.03.21
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 28 Oct 2025 01:03:21 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-riscv@nongnu.org,
 Bernhard Beschow <shentey@gmail.com>,
 Mark Cave-Ayland <mark.caveayland@nutanix.com>, qemu-ppc@nongnu.org,
 qemu-block@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>
Subject: [PATCH v2 1/7] hw/sysbus: Use memory_region_name()
Date: Tue, 28 Oct 2025 09:02:51 +0100
Message-ID: <20251028080258.23309-2-philmd@linaro.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251028080258.23309-1-philmd@linaro.org>
References: <20251028080258.23309-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32e.google.com
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

MemoryRegion::name is kind of internal. Use the proper
memory_region_name() accessor, which might return a different
name.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/core/sysbus.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/core/sysbus.c b/hw/core/sysbus.c
index ae447c1196a..d33be6b2b52 100644
--- a/hw/core/sysbus.c
+++ b/hw/core/sysbus.c
@@ -154,7 +154,7 @@ void sysbus_mmio_map(SysBusDevice *dev, int n, hwaddr addr)
 int sysbus_mmio_map_name(SysBusDevice *dev, const char *name, hwaddr addr)
 {
     for (int i = 0; i < dev->num_mmio; i++) {
-        if (!strcmp(dev->mmio[i].memory->name, name)) {
+        if (!strcmp(memory_region_name(dev->mmio[i].memory), name)) {
             sysbus_mmio_map(dev, i, addr);
             return i;
         }
-- 
2.51.0


