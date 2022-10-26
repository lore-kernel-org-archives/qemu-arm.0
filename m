Received: by 2002:a17:906:43c7:b0:78d:9f02:16a1 with SMTP id j7csp829291ejn;
        Wed, 26 Oct 2022 13:22:22 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM6VA6RGchVGWUGgRSggDfYUibH/B96Z+37/VVACGh+K2BEhUDnTtMf5ceUJofP/8qLgbvrA
X-Received: by 2002:a05:6214:e86:b0:4bb:7e1a:9dee with SMTP id hf6-20020a0562140e8600b004bb7e1a9deemr12609467qvb.96.1666815731775;
        Wed, 26 Oct 2022 13:22:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1666815731; cv=none;
        d=google.com; s=arc-20160816;
        b=GU/E3CLAd4eD3/IdZPPA8PLjAt5XA4CYu3541RkSw8usyP04kcP16JaPMLvKr55eYF
         A/tyksREJTkIhId83/Y++8Z1H0xuRscw8RNV7B2TKiiMiQUuqqnn5qZ1pAMFImRtQGdu
         K8vHj92e654bZzAa1YTW21CtMSCbbSEqwTkWnOdGLXJCMNNP7RsvwxqTa6/sR/gqKZ+n
         ZtikYm7dcMJWkbAtM6h85fo7KaZkRtXKtJTOUPs3DgSnh/5Aq09YV4MaWzyPRpoc2V7J
         JtTxcp8ulJxly7FiKv3t+97II6MaPmVbQfBLTVBS4DyBJTowZaMiITNMKQ8fI9tBrrn2
         BKOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=errors-to:sender:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=xFfGOC+4AClp0N9VqAaA4RDzVVq2bpMfGkuUo72PR3Y=;
        b=M5+dsWXG3d4FRZbcj6i9S3ZkXFFkHF6uIgldNzVyaoM17d6lrfjDfRcG2EOeXS47fc
         /er5fjVnqeJFQSBABWMCzeGV7b+Z937ytIyechOxyTVMqmPsTJqAXfWwYfN2JY2Govb2
         mwaiEr8UGf2ORFMKJsMDJhRKPpYudjo+nBBQXIS2glzF0iGi3utgNvUE/J8Ra5Tetf2b
         SlZZioxeTUugfDvxK4uicGqN4fLr4Df1zuQJ97s2ihwsogtfU8pLAEeAEyRV7AVm2sZ5
         YTHvzL1gapeTPibURJ8s2G+4ycYbd0Hkxs2uq8+5ks/OliW/RxwR/ofrfYl9wzZj7Sq0
         sxiQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@daynix-com.20210112.gappssmtp.com header.s=20210112 header.b=kTRNw7UY;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y9-20020a37f609000000b006f371ff12eesi3730462qkj.448.2022.10.26.13.22.11
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 26 Oct 2022 13:22:11 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@daynix-com.20210112.gappssmtp.com header.s=20210112 header.b=kTRNw7UY;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1onmqT-0003On-Gl; Wed, 26 Oct 2022 16:17:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1onmpT-0001uG-Nc
 for qemu-arm@nongnu.org; Wed, 26 Oct 2022 16:16:50 -0400
Received: from mail-pg1-x529.google.com ([2607:f8b0:4864:20::529])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1onmpP-0003Ef-I2
 for qemu-arm@nongnu.org; Wed, 26 Oct 2022 16:16:45 -0400
Received: by mail-pg1-x529.google.com with SMTP id b5so16036901pgb.6
 for <qemu-arm@nongnu.org>; Wed, 26 Oct 2022 13:16:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xFfGOC+4AClp0N9VqAaA4RDzVVq2bpMfGkuUo72PR3Y=;
 b=kTRNw7UYBoR1X5DoH1oHShtzL5A5LVlJCpPUO7t2skXJg0PjGq2QE+qMKsUgESxQxN
 Gp+W77iqWJn3qoeQ18jsqBH/AeHOAlFSrLFmh67AZux1YbJJb82Fg/k0ZVUrfjugmPuZ
 XUjp4fxHMa3o87mvAv0+hr5bDNf3aoy1XWdVcdRdWWwoPI/pxtOkl+3Orloto+Rj1Lp3
 1zhK/WbADZIkP3KzO9KGO1IVEqNzpe4gwoGNTsYuqQT4g8Y7YUet4kII/6J7l+sUlC8q
 NgeGNmOqyLU9Gdo1jKhOq3rM1E+/bTjHvAUQsrMD9ytK9UQw2bVSGdB5i3mJ86blarn+
 LyTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=xFfGOC+4AClp0N9VqAaA4RDzVVq2bpMfGkuUo72PR3Y=;
 b=rTSY6/m1QAP0mfI4VjaIvnFYhBeL6ImS8vV9ADqp598u3Vn6RK1gobwsIN/toiyya7
 6YMtqf69Kq88lVQUoVVkRlP2A1yIX4aioooouTwGKPHsVVVnaASgwZMaf22N59i/fbxG
 pMGvx5UoiFh2xPPXjmuo2yHSObijC3Si/+58K0j9w0xpL5maORZWr9Q/YdondqwnJMol
 WMmkd2rCaaDcmDkWw/K4gcODVTKtYcam4St5mdNZY3zkR0r5fae250tfiTfnl6RSWJL6
 f0CKzfL1+UfzToW0knRMkdk3jnSG9k041Wt68U2eNazyGNyqm7BD3svuloebXARD0do5
 ghDw==
X-Gm-Message-State: ACrzQf0B1r7rSZjjNJJkMmk8API2iJaUmNuMRoh7BdEJSp6Fo81gfjff
 ZxdCAIJfbF1qRUo1/4LozjPAyg==
X-Received: by 2002:a63:101:0:b0:460:6d90:3f81 with SMTP id
 1-20020a630101000000b004606d903f81mr37457659pgb.545.1666815402394; 
 Wed, 26 Oct 2022 13:16:42 -0700 (PDT)
Received: from fedora.flets-east.jp ([2400:4050:c360:8200:8ae8:3c4:c0da:7419])
 by smtp.gmail.com with ESMTPSA id
 y5-20020aa78f25000000b00541c68a0689sm3375770pfr.7.2022.10.26.13.16.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Oct 2022 13:16:41 -0700 (PDT)
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
Subject: [PATCH v3 12/16] pci/slotid: Omit errp for pci_add_capability
Date: Thu, 27 Oct 2022 05:15:23 +0900
Message-Id: <20221026201527.24063-13-akihiko.odaki@daynix.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221026201527.24063-1-akihiko.odaki@daynix.com>
References: <20221026201527.24063-1-akihiko.odaki@daynix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::529;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-pg1-x529.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
X-TUID: svq2jcJRtdUt

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

