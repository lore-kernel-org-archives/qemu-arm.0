Received: by 2002:a17:906:9f27:b0:7ad:ca5a:aee3 with SMTP id fy39csp931824ejc;
        Mon, 31 Oct 2022 05:37:05 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM7cE7zVZufymj9UdyhfMz+w8iGlR3FR+79nYPjppg3hlInSnRvWgIU5gQGOXUo23zDGCPhs
X-Received: by 2002:ac8:7f07:0:b0:39c:c64d:852e with SMTP id f7-20020ac87f07000000b0039cc64d852emr10088071qtk.21.1667219825544;
        Mon, 31 Oct 2022 05:37:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1667219825; cv=none;
        d=google.com; s=arc-20160816;
        b=PMafAPN1tWGIGI0crtco//QCUT1eLlHV+w1AUcigc8q0Zq9tHeAEo5bTR0o0bZZYMN
         yiGmoMWLabDZI+fFtvJyGdCN40wv7qsniDWv++xHZD29Fyl40cMTCJAWgCCK9ILhXHdT
         HrOrgtsrRoyDz7zOSAQSEc+RS9XmaJCCtdvsXiKJb/s2ZmJ526XKAO7nENeb/yeaouf5
         MXZGXQvJ9Em25cEh4k15igYGxjfnngrOO9JwCheVz5g+oBUtMGHlEZTKsWyEsHlHhIT+
         DU+NZURJZEuvPVeQIMNds7padmYsCJWoxGagP8PqxvCex37sxX2u/ftHMVzIml4Sfpnj
         2Xdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=errors-to:sender:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=ulXMgjC1nhezaSD23eulJZtw/gqtaE7ewFuc5xi9szM=;
        b=suR7bwVu9LMblMxW99ZOxrYW00s6xBD9f0wnURjlw4WuoPjOjs36ET8y5krVjbVz9g
         RLHwXASbz7MvE4SumldDlzM1AOy5UEPbF/7x8Z+1KMk3TUrNdBJYHuGL0WofBCnFFrJM
         p2H6MUlNvEJhzDREvL9BKwrhH1Ad1DZZL1gjCySsRnzUQn1sASU6Lfi0prUq1Ma7PlT4
         ggMesSch+2pS4GQlXCRVM7mMbTdaS43mVbf8SISuNquMqgPQKIddoV29NIwGoPfDrmdn
         YzLZy+qvuPIXlTSlflcDFBm4h3wJlTD0TpsqxhUEYSmjXRHu/GFW32lfqV/Z6eAlYuZV
         Nwzw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@daynix-com.20210112.gappssmtp.com header.s=20210112 header.b=bFNVJdiu;
       spf=pass (google.com: domain of qemu-arm-bounces+thiago.bauermann=linaro.org+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+thiago.bauermann=linaro.org+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+thiago.bauermann=linaro.org+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id fq6-20020a056214258600b004afb5d22ed1si3632488qvb.191.2022.10.31.05.37.05
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 31 Oct 2022 05:37:05 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+thiago.bauermann=linaro.org+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@daynix-com.20210112.gappssmtp.com header.s=20210112 header.b=bFNVJdiu;
       spf=pass (google.com: domain of qemu-arm-bounces+thiago.bauermann=linaro.org+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+thiago.bauermann=linaro.org+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1opU0u-0006QU-VH; Mon, 31 Oct 2022 08:35:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1opTzz-0003qZ-NW
 for qemu-arm@nongnu.org; Mon, 31 Oct 2022 08:34:47 -0400
Received: from mail-pg1-x52d.google.com ([2607:f8b0:4864:20::52d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1opTzy-0004U8-8E
 for qemu-arm@nongnu.org; Mon, 31 Oct 2022 08:34:39 -0400
Received: by mail-pg1-x52d.google.com with SMTP id q1so10550383pgl.11
 for <qemu-arm@nongnu.org>; Mon, 31 Oct 2022 05:34:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ulXMgjC1nhezaSD23eulJZtw/gqtaE7ewFuc5xi9szM=;
 b=bFNVJdiupLN+zfeGsQDegx2y6j6IbuBt5ao2H3NjbDFMFhOeRmzTW6yqofKHjjupey
 poVbd0Ha4RzUErZ5wW6E8fTZZbZxCKVvW95ARm4vGK2bhVnKzpNL0C+AsVQ6OKSEnKK2
 r/rt5yKIBoQ8qL1DZG9/I8EZTjT4AfZGYNjXC5bGT3L+mhpiFDzMAQ7X1NPR9alXl7B1
 xZgZLcwOej4FbbcEAnNaQNocqxgsxP2sB3FLDfkwlkfTdgoXG7mBzmEOw4OJxVUzY5Pr
 2lt8eqVg1Fr2h274Qc8k0GWkoxXxXRv0VVH0/0CRvhD86hzjocw/KiHbb9o9VG+HLWhp
 1f1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ulXMgjC1nhezaSD23eulJZtw/gqtaE7ewFuc5xi9szM=;
 b=1xQgimGAPmHZoPC0EQrXAKXWr1eDd7Fdms2t7E19HQUrWUESQC6gSZWXCxQk4jlGzH
 wnath3FJSB65s3LROV9yMtLSKxCdy4E6nJzontLq4seL5joYJqFujDThPlMBrg04ilc4
 UHAiU4blzM6q0UP/cJaWR4CU9jWbZx58b4ukUfHd55RxV9CujkQDyPhwmT5x1SZhqDyE
 m1zWTg9LwueBDlZbh8BrRKZxOAgLWphVdb4oCm1QunOhMxHTzwBCc9HT0Fb/GiyOC6D/
 mVd+CMauXZeliED1c6SQ9gnb2/U2aA33LHbsYtZnCsT4A+fc3CP/Gk84GBqfZelY7krZ
 Dh9g==
X-Gm-Message-State: ACrzQf3Yph2InQyS73oatP5e+VllOjYc1af4uK83C5saoSoiIKGTMw9+
 inirTiL++JQXzCtcIAyMECq3tA==
X-Received: by 2002:a63:6b83:0:b0:460:c07c:553b with SMTP id
 g125-20020a636b83000000b00460c07c553bmr12393717pgc.209.1667219676982; 
 Mon, 31 Oct 2022 05:34:36 -0700 (PDT)
Received: from fedora.flets-east.jp ([2400:4050:c360:8200:8ae8:3c4:c0da:7419])
 by smtp.gmail.com with ESMTPSA id
 m10-20020a6545ca000000b0042b5095b7b4sm4093810pgr.5.2022.10.31.05.34.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 31 Oct 2022 05:34:36 -0700 (PDT)
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
Subject: [PATCH v6 13/17] pci/slotid: Omit errp for pci_add_capability
Date: Mon, 31 Oct 2022 21:33:15 +0900
Message-Id: <20221031123319.21532-14-akihiko.odaki@daynix.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221031123319.21532-1-akihiko.odaki@daynix.com>
References: <20221031123319.21532-1-akihiko.odaki@daynix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::52d;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-pg1-x52d.google.com
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
X-TUID: nZW9N+CRy8+Z

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
2.38.1

