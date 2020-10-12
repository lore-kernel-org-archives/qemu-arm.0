Received: by 2002:a19:6b17:0:0:0:0:0 with SMTP id d23csp1018303lfa;
        Mon, 12 Oct 2020 05:53:47 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwG3zmjdJVRev7TMQe0VND/dd+7rRRMjwHzcX1Z742xyK6Gz8c876JoeHUXlQ8RRvhahi+B
X-Received: by 2002:a25:af41:: with SMTP id c1mr34632764ybj.213.1602507227635;
        Mon, 12 Oct 2020 05:53:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1602507227; cv=none;
        d=google.com; s=arc-20160816;
        b=CL0rPPMIm1U8YjZM03XvaLDSU2SaSuq5Dc/dkeY2cYFdSYfHnzkmW6SW/F4CtXfxwI
         Uz55lcmC1Z5J9JJ7qyguvg66aXvdQXZKIGBV7E+goDrKMugMNt3dtnxrW3ycV39FvDSs
         hpYF7Grs9pAuvuGofU38OTc3M9dRUo2Qlk/jaNhGrf2JC321BP3DjtFEw8jWbcIpmqte
         izl+4U0Wsu49+rbhNJuVnJ7W8d9nOFR+6XDkpIaXmU/QMX1Hz3w9d6a4PjMtste4HYGc
         cJOdWasm5iU3AOTqAOO39dEPT/jlQj3XKD0O4kiXEA5Oub/vYh+1+k+f/ZbtceB0NZxz
         KwTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=9wGxJZcsEOLAGSmgs7p8pt5WGBHmly5siKydoVe/oZE=;
        b=UtimD1b/kLQ8rD8Y1S8aNO4S7Egx8T9wFcL9xRFGifuhgaoeUA5ACLf0MuAb2tF8/6
         iDsralHMJTHPne+LL39zNzZ+0gEQwXVZnYALugKVBjIWdDLKbFZPTfof/eKvNep3SEPI
         gwW9L+wb5Ms0efi1TX4rmCKsSvfi9akFeVrYX6aR6407wDeGDbZ/nyFrDVDLcWNCS2jb
         GdM8snvTnm5yRe5VoP0NRAHrKUpi6XCQBwHpBKxpmwGZEm6lFTrV3CQWJUeu7LdMViyY
         P4mxm8Uyu2y5DfbuPloifseFvQN1ovxViuyMo8ksHMCunfUbK4OOo3skjQx/7uTLykKU
         AfwQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=KsGRH1Px;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k6si14386520ybt.147.2020.10.12.05.53.47
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 12 Oct 2020 05:53:47 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=KsGRH1Px;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:45716 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kRxKl-0007Gp-0O
	for alex.bennee@linaro.org; Mon, 12 Oct 2020 08:53:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33532)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kRxCw-0005ly-Hw
 for qemu-arm@nongnu.org; Mon, 12 Oct 2020 08:45:42 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:34836)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kRxCu-0000AI-M9
 for qemu-arm@nongnu.org; Mon, 12 Oct 2020 08:45:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1602506739;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9wGxJZcsEOLAGSmgs7p8pt5WGBHmly5siKydoVe/oZE=;
 b=KsGRH1PxYfLxYtjwYmC83GqCU7eL6OEigW9HPP0hlGVVEwLg2T7ZkzTAlzN1Imj/tW4VxV
 PtDHp2EVBa1FETnXgUm0N1s4TM6tN+tM126JmP9Cl9cgMnPRFR9hlx49+790cF8lk6jKHL
 cOEEm3ou6gesUD+Uyu884+Inzf/C7sg=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-198-wsOJueC_NPmoCKJ6D8BdHQ-1; Mon, 12 Oct 2020 08:45:38 -0400
X-MC-Unique: wsOJueC_NPmoCKJ6D8BdHQ-1
Received: by mail-wm1-f72.google.com with SMTP id c204so5732476wmd.5
 for <qemu-arm@nongnu.org>; Mon, 12 Oct 2020 05:45:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=9wGxJZcsEOLAGSmgs7p8pt5WGBHmly5siKydoVe/oZE=;
 b=rsS9Jksnl2t38k7c9gIGqJtRJ/I0Z/75DOIkkEYrMSAOushJZiFZQW5FjgAmcJiDXu
 8CEca5utoOFRP4pByurtdI22nAZi2iiXspuPskQLAqEQ8NQPT53XWm7WTZ0sJear2y7J
 37SNuSWeoWRJoFzijf1a6JYYjyAe7+g+Mmp3x/W7UGNPMNBMUHuyuU89G3JoCEAzusdl
 TZvRF2Wk6vgYe2B5BwClYo55GIxda0OeTXO4Yn/eL4BxDG/hqNFju1RnGoUbEXu1hByU
 3sT54eOUdM4PsZ3SPFxZ3XEwT8Tv37vXCyrzqr6WqGUzzps50SHovEQ2Jqv9zU7BtMuk
 +Alw==
X-Gm-Message-State: AOAM530r5bWF4lLtOrxR0vND8CXUo7HPwn+lCCQlfWITTfQkQPiO+Yxy
 JKa3iOLbLOU61p+L7oryu0r1mqUCyxFIKov7WcOETBXOpNrGi7owyt+hzHnioeLLPR44eYalE/L
 GQIhKa59FBmbh
X-Received: by 2002:adf:dccc:: with SMTP id x12mr30544381wrm.241.1602506737180; 
 Mon, 12 Oct 2020 05:45:37 -0700 (PDT)
X-Received: by 2002:adf:dccc:: with SMTP id x12mr30544349wrm.241.1602506736967; 
 Mon, 12 Oct 2020 05:45:36 -0700 (PDT)
Received: from localhost.localdomain
 (106.red-83-59-162.dynamicip.rima-tde.net. [83.59.162.106])
 by smtp.gmail.com with ESMTPSA id s185sm22765462wmf.3.2020.10.12.05.45.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Oct 2020 05:45:36 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 5/5] hw: Use the PCI_DEVFN() macro from 'hw/pci/pci.h'
Date: Mon, 12 Oct 2020 14:45:06 +0200
Message-Id: <20201012124506.3406909-6-philmd@redhat.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201012124506.3406909-1-philmd@redhat.com>
References: <20201012124506.3406909-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/12 02:58:41
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Paul Durrant <paul@xen.org>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Huacai Chen <chenhc@lemote.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Yoshinori Sato <ysato@users.sourceforge.jp>, qemu-trivial@nongnu.org,
 Helge Deller <deller@gmx.de>, "Michael S. Tsirkin" <mst@redhat.com>,
 Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Anthony Perard <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org,
 David Gibson <david@gibson.dropbear.id.au>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-arm@nongnu.org,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Richard Henderson <rth@twiddle.net>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 qemu-ppc@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: nMQaHgMlZDFS

From: Philippe Mathieu-Daudé <f4bug@amsat.org>

We already have a generic PCI_DEVFN() macro in "hw/pci/pci.h"
to pack the PCI slot/function identifiers, use it.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/arm/virt.c          | 3 ++-
 hw/pci-host/uninorth.c | 6 ++----
 2 files changed, 4 insertions(+), 5 deletions(-)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index e465a988d68..f601ef0798c 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -1144,7 +1144,8 @@ static void create_pcie_irq_map(const VirtMachineState *vms,
                      full_irq_map, sizeof(full_irq_map));
 
     qemu_fdt_setprop_cells(vms->fdt, nodename, "interrupt-map-mask",
-                           0x1800, 0, 0, /* devfn (PCI_SLOT(3)) */
+                           cpu_to_be16(PCI_DEVFN(3, 0)), /* Slot 3 */
+                           0, 0,
                            0x7           /* PCI irq */);
 }
 
diff --git a/hw/pci-host/uninorth.c b/hw/pci-host/uninorth.c
index c21de0ab805..f73d452bdce 100644
--- a/hw/pci-host/uninorth.c
+++ b/hw/pci-host/uninorth.c
@@ -70,10 +70,8 @@ static uint32_t unin_get_config_reg(uint32_t reg, uint32_t addr)
         /* ... and then convert them to x86 format */
         /* config pointer */
         retval = (reg & (0xff - 7)) | (addr & 7);
-        /* slot */
-        retval |= slot << 11;
-        /* fn */
-        retval |= func << 8;
+        /* slot, fn */
+        retval |= PCI_DEVFN(slot, func) << 8;
     }
 
     trace_unin_get_config_reg(reg, addr, retval);
-- 
2.26.2

