Received: by 2002:a17:906:9f27:b0:7ad:ca5a:aee3 with SMTP id fy39csp932791ejc;
        Mon, 31 Oct 2022 05:38:29 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM52v+AAg5T7g8ZAeg9XQTJuxoOb5sVOutBVJhZJQXUiCxZrXO7/zwQPzn+2GHlZRzF9Gj2J
X-Received: by 2002:a05:620a:31a1:b0:6ef:1a8d:a9a6 with SMTP id bi33-20020a05620a31a100b006ef1a8da9a6mr8675206qkb.283.1667219909046;
        Mon, 31 Oct 2022 05:38:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1667219909; cv=none;
        d=google.com; s=arc-20160816;
        b=0D5ca6EdegJEKOVwr9CwMD3LyO0Td0/FFa/vo/jgtERZnm26IsUoEqP+LCTDuwZo63
         JU1ST1lxaXectHLNJ6PMrGzUO2b2NxE7HhzC+zMTCA1pL32rGqpvd9HjWeL1A2bvYXfe
         MbOjdn3faq2d/ELaUgDCvrLsWb/vBS2yAlLlgDb51pgv/pIR5CHu9U1iz2lhQIqWdwx1
         TkBiTYZPwwK/pqmQxiM7BK1+DSuFxcbO1Yqrm6wjGoiwt80ykEOfpsJssURq2dkaTqrc
         AfXOaQhpLGFFxR22yg59Kzfq/FeOxOTerrbaH0yofRG3EaxiVThDSVq2QCZwo82GblO+
         wsgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=errors-to:sender:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=Ve64Yknp9Z5jtrd7y/2CScvNeMugfa6S0tD/94xCa3A=;
        b=yPLycqinHfWPJsGdja8/asXhU5NQGQSRXVY26jcsE8EV8fWSZc+uPKOQUmZtQ7466Y
         T1zFlOPSnevTukEe0ZCsGeJ0MItIrlWs3hmGsf84s6GfAKG1knFvsQMd97FClGKQ+esg
         3z5Cq9NuqvlgBwWWtFtJIbPqrOvz65UJl5s+9Y1EaF522y0me4qc2qDGuBsg/OqMiVYM
         bPsLpLy3ZwcKuS7QRZ+gV61vbPmu3KOyRz5FVF04/tn+fMnIV4NcqoCbR67048Er8ygJ
         KhdpeJTDEkD6WJH63fk+l5KfgPPZ43Zr8iZoi40krnv6r4GQuSptfOu5RDguy4wwCmWP
         YV5A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@daynix-com.20210112.gappssmtp.com header.s=20210112 header.b="ftnYt/0f";
       spf=pass (google.com: domain of qemu-arm-bounces+thiago.bauermann=linaro.org+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+thiago.bauermann=linaro.org+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+thiago.bauermann=linaro.org+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id jq13-20020ad45fcd000000b004bbf753d0b1si1645449qvb.194.2022.10.31.05.38.28
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 31 Oct 2022 05:38:29 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+thiago.bauermann=linaro.org+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@daynix-com.20210112.gappssmtp.com header.s=20210112 header.b="ftnYt/0f";
       spf=pass (google.com: domain of qemu-arm-bounces+thiago.bauermann=linaro.org+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+thiago.bauermann=linaro.org+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1opU0r-0006C1-5p; Mon, 31 Oct 2022 08:35:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1opTzu-0003m6-Rk
 for qemu-arm@nongnu.org; Mon, 31 Oct 2022 08:34:35 -0400
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1opTzt-0004SG-8X
 for qemu-arm@nongnu.org; Mon, 31 Oct 2022 08:34:34 -0400
Received: by mail-pj1-x1033.google.com with SMTP id l6so10298386pjj.0
 for <qemu-arm@nongnu.org>; Mon, 31 Oct 2022 05:34:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Ve64Yknp9Z5jtrd7y/2CScvNeMugfa6S0tD/94xCa3A=;
 b=ftnYt/0fDgjS0EKUSqUIqx61YJHzGLpuTcVHaUlKt8tKNyDLkzAkU8Atbh8+6p/hMC
 Ewm/WDLAQMIsn4KaJqjmsQJseBhAqF28CPnhve6jC74tPwzDnDH7iaWbPAZU579ShDAH
 LGqOg62B4B/Vvp+7AOiwZdNI79ODUPsNdK2oSmsm7HYsamzG/s66yYggXsdHWvt0sbu/
 kvMzUF98O1jE21bryhNLpkRBBzmwjFx2ajgpxbVZpLnu+VEpF5LGPe6vEh5oXLBA5wTC
 Dzn+tr73ttQxOXUvn+Q2aZpeKwJPRPncSsz+KSQJTuwQ0wXPwzO4MOX6x0GGpb9gdhjG
 205A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Ve64Yknp9Z5jtrd7y/2CScvNeMugfa6S0tD/94xCa3A=;
 b=YDiziUoAbhO8jg5fd+Law4jaJFSCIXNjXC+9NeGp59IpIGt9jMZAaH8WNpLVQgvBrl
 hiXkzeR9K0a/37regMYH+uGqNMBWigINLmn1EVXqoOYJTAVU1tDKUtg5zwMICiCHB/vt
 lQqf0xIxz62vNA9lnVivcvhAaGUESC0ctNMVKEeZfAcC1D5o14ZTgng+8IOzfx7TjLcP
 x1Y/KuEcyA6UKf+G4W+uDvIB7OvF5Dh2QjDSbnPDOs0Hth6NKRCWvQNAH+VwmXxvIOh8
 EHvX2iPsCpryHC1e6pEmNwFPL/Rxomqn2+h4Z+wHsttDwEKFZnfVArjW01oflDvzjCXo
 olgQ==
X-Gm-Message-State: ACrzQf2udGO6xhELDcnf0/NyzO/MiNUW5YaH8SVJJcLZR6cbx5nOPXw/
 jiCmSShC7fMThxzLEfdlccX2mA==
X-Received: by 2002:a17:90b:1918:b0:213:d97c:c6c9 with SMTP id
 mp24-20020a17090b191800b00213d97cc6c9mr6522557pjb.198.1667219671930; 
 Mon, 31 Oct 2022 05:34:31 -0700 (PDT)
Received: from fedora.flets-east.jp ([2400:4050:c360:8200:8ae8:3c4:c0da:7419])
 by smtp.gmail.com with ESMTPSA id
 m10-20020a6545ca000000b0042b5095b7b4sm4093810pgr.5.2022.10.31.05.34.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 31 Oct 2022 05:34:29 -0700 (PDT)
From: Akihiko Odaki <akihiko.odaki@daynix.com>
To: 
Cc: qemu-devel@nongnu.org, qemu-block@nongnu.org, qemu-arm@nongnu.org,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>, John Snow <jsnow@redhat.com>,
 Dmitry Fleytman <dmitry.fleytman@gmail.com>,
 Jason Wang <jasowang@redhat.com>, Stefan Weil <sw@weilnetz.de>,
 Keith Busch <kbusch@kernel.org>, Klaus Jensen <its@irrelevant.dk>,
 Peter Maydell <peter.maydell@linaro.org>,
 Andrey Smirnov <andrew.smirnov@gmail.com>,
 Paul Burton <paulburton@kernel.org>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Yan Vugenfirer <yan@daynix.com>,
 Yuri Benditovich <yuri.benditovich@daynix.com>,
 Akihiko Odaki <akihiko.odaki@daynix.com>
Subject: [PATCH v6 12/17] msix: Omit errp for pci_add_capability
Date: Mon, 31 Oct 2022 21:33:14 +0900
Message-Id: <20221031123319.21532-13-akihiko.odaki@daynix.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221031123319.21532-1-akihiko.odaki@daynix.com>
References: <20221031123319.21532-1-akihiko.odaki@daynix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::1033;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-pj1-x1033.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=unavailable autolearn_force=no
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
Sender: "Qemu-arm" <qemu-arm-bounces@nongnu.org>
Errors-To: qemu-arm-bounces+thiago.bauermann=linaro.org+alex.bennee=linaro.org@nongnu.org
X-TUID: 8SpnP6KhbZsK

Omitting errp for pci_add_capability() causes it to abort if
capabilities overlap. A caller of msix_init(), which calls
pci_add_capability() in turn, is expected to ensure that will not
happen.

Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
---
 hw/pci/msix.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/hw/pci/msix.c b/hw/pci/msix.c
index 1e381a9813..28af83403b 100644
--- a/hw/pci/msix.c
+++ b/hw/pci/msix.c
@@ -311,7 +311,7 @@ int msix_init(struct PCIDevice *dev, unsigned short nentries,
               uint8_t pba_bar_nr, unsigned pba_offset, uint8_t cap_pos,
               Error **errp)
 {
-    int cap;
+    uint8_t cap;
     unsigned table_size, pba_size;
     uint8_t *config;
 
@@ -340,11 +340,7 @@ int msix_init(struct PCIDevice *dev, unsigned short nentries,
         return -EINVAL;
     }
 
-    cap = pci_add_capability(dev, PCI_CAP_ID_MSIX,
-                              cap_pos, MSIX_CAP_LENGTH, errp);
-    if (cap < 0) {
-        return cap;
-    }
+    cap = pci_add_capability(dev, PCI_CAP_ID_MSIX, cap_pos, MSIX_CAP_LENGTH);
 
     dev->msix_cap = cap;
     dev->cap_present |= QEMU_PCI_CAP_MSIX;
-- 
2.38.1

