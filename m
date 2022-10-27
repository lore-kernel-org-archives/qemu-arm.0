Received: by 2002:a17:906:43c7:b0:78d:9f02:16a1 with SMTP id j7csp158449ejn;
        Wed, 26 Oct 2022 23:41:46 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM6pYNjFeRSKaCrzr9n9zm+9GPiqxhsebd0nfsWIRjTYLm6g9x2HWfai8aPV6wAKM/FjlKbZ
X-Received: by 2002:a05:620a:4091:b0:6ee:db2c:55b7 with SMTP id f17-20020a05620a409100b006eedb2c55b7mr33713540qko.636.1666852906039;
        Wed, 26 Oct 2022 23:41:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1666852906; cv=none;
        d=google.com; s=arc-20160816;
        b=HJ9UtqK+rVtULUcxfG9KYVwDD52s96lYtzxTmEDqhX5Tv1l2Q3haP9iaynnpaa4JXu
         LNrhlS+FT6WTm6k0PVaZY1VmHsZrK6Dp7ZtQ5cKv9h/V9ato0WxR8IFVib/MLdW023bO
         uN5f9NIEsg0VDkIJK0h3yj7+LpFULxBV1w6h0KjKpJgxF6NMYOGowIBJ/GxlVSAxDVQB
         IEU8wGs8zhpqsCQ38fkK4jdB/5jA7aOdE+3Ez7Fe01k/RGa5UVI7tcN1ZGHDu4bUts+X
         +5BmXHHK+tj4qRIlFNRYjgr3tMsVQd9A3KJ79OueDkJgHu8Zx4HFSnLSfKIP4z3DVqB4
         y96w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=errors-to:sender:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=xFfGOC+4AClp0N9VqAaA4RDzVVq2bpMfGkuUo72PR3Y=;
        b=vKGz/vC4KZ+PVBaFVbq5oKkJ9K2Ote5MkzHCSeNuO7BX+NFKKzY/siqyoRwRr2QkT8
         DtIiGtEJPruh0Dn1buPkkHLgsThczJRjJ9AZETEw53pFPgdxCAkMUwWH+27YPDdFEIfK
         HdM2+8zC7a744z3XVIF/l0woE0wvp/fCToRTijCPbJAdifipqDA7KpGFQ3FVqxQ0glHh
         DhB4cfo3riUcTeoUIkE/koKppWsXTu/wGHWcvIS6XOdC/f96RekOpQKWDEPyofCuadp1
         NrO6jJsqI2jjqinxXZNI76zbds46TvagWgcdISq8zdv70OXef2n00Qeb9nYLa0dhWHwT
         bo4Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@daynix-com.20210112.gappssmtp.com header.s=20210112 header.b=vZxLIom+;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x16-20020a05620a12b000b006ee91d6b2a1si382745qki.619.2022.10.26.23.41.45
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 26 Oct 2022 23:41:46 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@daynix-com.20210112.gappssmtp.com header.s=20210112 header.b=vZxLIom+;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1onwa7-0006wa-7y; Thu, 27 Oct 2022 02:41:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1onwX8-0005bl-AQ
 for qemu-arm@nongnu.org; Thu, 27 Oct 2022 02:38:36 -0400
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1onwX4-0003PE-Mx
 for qemu-arm@nongnu.org; Thu, 27 Oct 2022 02:38:30 -0400
Received: by mail-pf1-x430.google.com with SMTP id i3so558685pfc.11
 for <qemu-arm@nongnu.org>; Wed, 26 Oct 2022 23:38:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xFfGOC+4AClp0N9VqAaA4RDzVVq2bpMfGkuUo72PR3Y=;
 b=vZxLIom+CIEIN6ThtxW/0yHChzIqt0CtjArPO6y6yPIr39cpwRI9QPsNM4SbEGjnhj
 FT97iaMiP/Kyn2xaLdB28iBNB1r5kKd5e6uVrbRI4om+e+/u8UEd/Hl8fSEHHCVX7hL+
 BoUWn/dsDBNBap+2+bkXAjOXVqk514djg5BGJpL2DmjIonOL0pvzGt2W2MH2xGpzaBTg
 3y8IjuoDM1j2LM6zWjHeteBOrFpEW/mA5Y8MUD+WLNrBLq7u13ZnBBd/ZwERFTwl7rkj
 8o/N5JUWymFFpI9L55wFrK3oH1LIC7CvpXcuiralkIHRy9TVTOt+SA5mM3iERgf1ZruB
 DWHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=xFfGOC+4AClp0N9VqAaA4RDzVVq2bpMfGkuUo72PR3Y=;
 b=1F08smiUBUnCkn7oXZwyqEN10b+21+nG1mz7wSetLnxOGTEZ2dRwp6V8PZDvhAQrLH
 +XJybKz4FuM2ccp+tX6oJzmW/xOElqwCcbkV0sHeWtavsGDAqvyHCKASbbByfyAqNBzN
 wJDjfEH5nZrXjA5M7iFVfxnqQJJxt6GC+D7eT96HLXVVqBWdo/Ne1GHrRBjuQp//5MeU
 LWfA+j6dEGC82HMyNPgce4QxBFQ0skxyqKHjed24oX628VGn5p2GecMFwXOyhmDJEZm/
 UFQ9vofiT/7rjhVvQZr//BIudW9E1HiXWL+Qvq6QIm+e+xaIopRB8qkxi6gO2KFdcc7G
 2MJA==
X-Gm-Message-State: ACrzQf2cd8mgU9qUfOZGldHhTgmqLfeDuvHseCTzjh1gUXCgQbL2ipgJ
 wamwWlT1wMOmr7LdCt7yr5qJMQ==
X-Received: by 2002:aa7:96b6:0:b0:56c:8c22:78f0 with SMTP id
 g22-20020aa796b6000000b0056c8c2278f0mr2919981pfk.21.1666852702487; 
 Wed, 26 Oct 2022 23:38:22 -0700 (PDT)
Received: from fedora.flets-east.jp ([2400:4050:c360:8200:8ae8:3c4:c0da:7419])
 by smtp.gmail.com with ESMTPSA id
 z17-20020aa79491000000b0056b818142a2sm448872pfk.109.2022.10.26.23.38.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Oct 2022 23:38:22 -0700 (PDT)
From: Akihiko Odaki <akihiko.odaki@daynix.com>
To: 
Cc: Alex Williamson <alex.williamson@redhat.com>, qemu-devel@nongnu.org,
 qemu-block@nongnu.org, qemu-arm@nongnu.org,
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
Subject: [PATCH v4 13/17] pci/slotid: Omit errp for pci_add_capability
Date: Thu, 27 Oct 2022 15:37:01 +0900
Message-Id: <20221027063705.4093-14-akihiko.odaki@daynix.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221027063705.4093-1-akihiko.odaki@daynix.com>
References: <20221027063705.4093-1-akihiko.odaki@daynix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::430;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-pf1-x430.google.com
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: rxOC+aM4CmIu

Omitting errp for pci_add_capability() causes it to abort if
capabilities overlap. A caller of slotid_cap_init(), which calls
pci_add_capability() in turn, is expected to ensure that will not
happen.

Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
---
 hw/pci/slotid_cap.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/hw/pci/slotid_cap.c b/hw/pci/slotid_cap.c
index 36d021b4a6..5da8c82133 100644
--- a/hw/pci/slotid_cap.c
+++ b/hw/pci/slotid_cap.c
@@ -12,7 +12,7 @@ int slotid_cap_init(PCIDevice *d, int nslots,
                     unsigned offset,
                     Error **errp)
 {
-    int cap;
+    uint8_t cap;
 
     if (!chassis) {
         error_setg(errp, "Bridge chassis not specified. Each bridge is required"
@@ -24,11 +24,7 @@ int slotid_cap_init(PCIDevice *d, int nslots,
         return -EINVAL;
     }
 
-    cap = pci_add_capability(d, PCI_CAP_ID_SLOTID, offset,
-                             SLOTID_CAP_LENGTH, errp);
-    if (cap < 0) {
-        return cap;
-    }
+    cap = pci_add_capability(d, PCI_CAP_ID_SLOTID, offset, SLOTID_CAP_LENGTH);
     /* We make each chassis unique, this way each bridge is First in Chassis */
     d->config[cap + PCI_SID_ESR] = PCI_SID_ESR_FIC |
         (nslots << SLOTID_NSLOTS_SHIFT);
-- 
2.37.3

