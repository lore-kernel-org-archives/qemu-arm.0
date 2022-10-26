Received: by 2002:a17:906:43c7:b0:78d:9f02:16a1 with SMTP id j7csp831414ejn;
        Wed, 26 Oct 2022 13:26:40 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM4owBPrc5kr0lxXHIggdq33yGEplCYI/JiNnFIBJjWCM6vqongUjZApw03YcuQGdnP18kBg
X-Received: by 2002:ae9:f301:0:b0:6e2:73ae:1258 with SMTP id p1-20020ae9f301000000b006e273ae1258mr31989991qkg.353.1666816000234;
        Wed, 26 Oct 2022 13:26:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1666816000; cv=none;
        d=google.com; s=arc-20160816;
        b=gPTXlZj6rZRItecSyTPBJzbC+YrlM8KlwhsYDjIP2UfDZLZgXE9Fn6TRtSG8UTal8+
         vh+Y1MJWK265T9VYFnGknAeVahQsa060Lybfdq7zJeDKbaLZKJShPBGF37ZJQqcsEBlh
         E9o48enIKhatXv3Al8+FDUYg6LdsL4VFyBrArChm5pdukEKRmy8nfnxtZJgWskdYsbGQ
         cf2gzNWKRKdX30apxtMV5CvWjt63BLiXoRVqX8rpNmE3PPCArwyBnOuVewyr/u/6TzHN
         LhC1VvmI4aGukwLCI7c38NZj452zJa4huxwgpR4WDp/hxhoSvOigqURduLnPjwicIROO
         cNTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=errors-to:sender:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=0BpmH1EK9gEiQYluMG2rP/Xfl8vYE39j2KicJvnukhs=;
        b=BJh7G1U3CduPMg91a9lsupNs07Y6Gcc4LFJlZQgu1i7pPHSt92qV0l8VICmzBwmXlK
         5SzdrJd85+9DEKSjGTjo5mDHkDadb/KQXDCx7MUn1Z4/RyShJmknsaSZcaO3Rcf2AhVP
         EU+aW+e1th7C75WguZwAEhHBJJGptUHwRyLCR/MwPha5117CvTMa+v9nqvGOQ70ASX2J
         I/36F6KmSJWEBam1EtBsEVaPyHCt3b2+9XKHmQPIsBcDbgEbBJbbFgkIcmGTXQ4ry4/v
         iUj4Edga76yL8pIYSUih5e/oC+rIx7ImkjeglQv4z2W61/+36pQ732y+i6RMyp/35loR
         KHiA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@daynix-com.20210112.gappssmtp.com header.s=20210112 header.b=SBMgb4hl;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id bl41-20020a05620a1aa900b006d2c5d6701bsi4525667qkb.37.2022.10.26.13.26.40
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 26 Oct 2022 13:26:40 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@daynix-com.20210112.gappssmtp.com header.s=20210112 header.b=SBMgb4hl;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1onmqS-0003Of-Bc; Wed, 26 Oct 2022 16:17:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1onmpN-0001la-EM
 for qemu-arm@nongnu.org; Wed, 26 Oct 2022 16:16:45 -0400
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1onmpL-0003Ds-Iq
 for qemu-arm@nongnu.org; Wed, 26 Oct 2022 16:16:40 -0400
Received: by mail-pj1-x102a.google.com with SMTP id
 r61-20020a17090a43c300b00212f4e9cccdso3849288pjg.5
 for <qemu-arm@nongnu.org>; Wed, 26 Oct 2022 13:16:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0BpmH1EK9gEiQYluMG2rP/Xfl8vYE39j2KicJvnukhs=;
 b=SBMgb4hlM/YGNfBUNlrmyksMpq8jtT6uk10BwzB6RtEfXxZ2CCy45zrdnQewtlaqKh
 Z6spmXW/UjF44hYMI05NUQF21ZH73zBgnsUqus0VazWGaq3zS2fLWwElyxYxd/2ZBG8q
 /Cp85AUwWKaZfVbsblyiHhKma3tnxGo5HYIU8RIXYy/bsBkMEi/qUEYLLODXWLN3eYSD
 HkrIRtFUGxi49Q8lceaxNHjLS7kMGgV1D3NSKUQj6Iv0v8uJNSh+mn3flN8J3w78FBzh
 K6LSdLj/Dx6oqJCAjSO0Rqk3tDYDvcwXBNbL+IGVw056Ih+TeG67KamkOveEegQHGjiE
 drtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=0BpmH1EK9gEiQYluMG2rP/Xfl8vYE39j2KicJvnukhs=;
 b=7jqOkmcCPE9MH5EGk5vLp82HUCPoaKyxCozdKBFD7o6eVz7joiU0VCjUDRLaC6JL3a
 4Q6mK1Tt/wn38Inreelxt7miYmGofKfaum/k2sfJGjpQ0f7bxMreN+sYm0TvkPlK0pzw
 5m2Ri/iJtgELY+7eUCRemAclcPdJLEVQhxQEYB0PcfYyUH2pU52fyovBnVZ/yPbO27UE
 FEDtkgfRLu5QnyCNGkE/9fZaMefVTLhA/T0T4DeAfqIHZQ5BcHMZzTHwwjWazlSu9ADo
 bdZlWDRd8cL+eA2MjFdVmr1uF3wVnqyl/DEZBuA+zzoq2buWhfuknmXXSVJe+9mUHdyS
 MNgA==
X-Gm-Message-State: ACrzQf201i6K4H97ymLlVti8/3PEw7sCiYFz3NtPTfQDToBg7SatHdph
 JVA88yuepYLUQM5P0biu+7wk0g==
X-Received: by 2002:a17:90a:5915:b0:20a:d6d5:31bd with SMTP id
 k21-20020a17090a591500b0020ad6d531bdmr6017376pji.15.1666815397228; 
 Wed, 26 Oct 2022 13:16:37 -0700 (PDT)
Received: from fedora.flets-east.jp ([2400:4050:c360:8200:8ae8:3c4:c0da:7419])
 by smtp.gmail.com with ESMTPSA id
 y5-20020aa78f25000000b00541c68a0689sm3375770pfr.7.2022.10.26.13.16.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Oct 2022 13:16:36 -0700 (PDT)
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
Subject: [PATCH v3 11/16] msix: Omit errp for pci_add_capability
Date: Thu, 27 Oct 2022 05:15:22 +0900
Message-Id: <20221026201527.24063-12-akihiko.odaki@daynix.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221026201527.24063-1-akihiko.odaki@daynix.com>
References: <20221026201527.24063-1-akihiko.odaki@daynix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::102a;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-pj1-x102a.google.com
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
X-TUID: knjhjiLyx/Rh

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
2.37.3

