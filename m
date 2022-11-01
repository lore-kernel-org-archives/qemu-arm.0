Received: by 2002:a17:906:9f27:b0:7ad:ca5a:aee3 with SMTP id fy39csp1968921ejc;
        Tue, 1 Nov 2022 08:38:37 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM7WnhQsR/649rxxCsN+MlWAx6yCfHiBzj/G17eYBghtl+xeU4HwW9GkpeFeiZwT0KTAfFcn
X-Received: by 2002:ac8:7d92:0:b0:39c:f4b6:f014 with SMTP id c18-20020ac87d92000000b0039cf4b6f014mr15201666qtd.513.1667317116949;
        Tue, 01 Nov 2022 08:38:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1667317116; cv=none;
        d=google.com; s=arc-20160816;
        b=iWLGULHpMtlFarG6u+9CkvnTXDXgBdjLau3ZX9P9iDAi1OH/Q+rq+pEGEXQFI41WVK
         F6TD5NQW90sAFuWPQEsJWFwU6qq4pn4/Ezdu9u5/JXpM7UXZ4pqdxIWaBrWCKjSnDr0s
         uoIChEX8AToV6OZP7eseiU7hCzD/Jqs3e2VbdOhMIeHn/Dh9ibanM+Eiz+MaUxlDU9AO
         ebMH08d5VtI6dBuiKsTCfbec/n8AbNw/4icFvi237TRPShCKy4X1N2D8+z/wsPMvvf76
         TclDT1lzCuhuENjg7+w7wUKVSLJQK3kHcMqQ2rTOcB/zjw0Ib35YN2qbItxjctf+rkb5
         +Ksg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=errors-to:sender:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=ulXMgjC1nhezaSD23eulJZtw/gqtaE7ewFuc5xi9szM=;
        b=xQ9ZlJQSyqLGImt2nPD5f/7nDzIFS5tX9zo7Yq06kpGNfnfdJsyMeQJ5SuvC/9zInG
         SSAeWSNQZMSOaymDddl3uAaDM51Sfy3HOUsvIHRVtCnlAMh/wcOpeHKwOXO3EyiltDzi
         1qwXPmcYka8bNRddI+HAH19v9vGH/X0Ber+s7SVYA05TrE6eoP09w4G+K3b5tZ71XDBx
         rle+62Fy0STnt1MYmxaUX0gcSHriSVxto5jOmlLAAesrJW8XbUsWlZKdO2Af9xZK0JCV
         U2Xxn7ET6F4Oe1/CX4lA/MndNOd6Cxe3oKgAAPaAf3M6gldEnv9SdNaA/+tB1C9bMuLA
         bC7A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@daynix-com.20210112.gappssmtp.com header.s=20210112 header.b=cgAorXro;
       spf=pass (google.com: domain of qemu-arm-bounces+thiago.bauermann=linaro.org+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+thiago.bauermann=linaro.org+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+thiago.bauermann=linaro.org+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id cb20-20020a05622a1f9400b003a4fedfbbb1si6513839qtb.253.2022.11.01.08.38.36
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 01 Nov 2022 08:38:36 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+thiago.bauermann=linaro.org+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@daynix-com.20210112.gappssmtp.com header.s=20210112 header.b=cgAorXro;
       spf=pass (google.com: domain of qemu-arm-bounces+thiago.bauermann=linaro.org+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+thiago.bauermann=linaro.org+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1oprnQ-00066Z-L1; Tue, 01 Nov 2022 09:59:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1oprnK-00062Y-RH
 for qemu-arm@nongnu.org; Tue, 01 Nov 2022 09:59:11 -0400
Received: from mail-pg1-x52a.google.com ([2607:f8b0:4864:20::52a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1oprnJ-0004cG-Gn
 for qemu-arm@nongnu.org; Tue, 01 Nov 2022 09:59:10 -0400
Received: by mail-pg1-x52a.google.com with SMTP id q1so13462567pgl.11
 for <qemu-arm@nongnu.org>; Tue, 01 Nov 2022 06:59:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ulXMgjC1nhezaSD23eulJZtw/gqtaE7ewFuc5xi9szM=;
 b=cgAorXro9dhWTYqQeYjrWLbA3UtVao1eHKhr+DaVPEtxI+nX1UQvLgNuKytoJGAc5B
 drrHlaspQWTOTl/isN0hsnOWJmorvWqg4lGnjtxIx/67gKMRL3a17Dj+MfJhzTtciTla
 c4PPISDT3+HnjJJ4c0AfeBiQO2ey8DSi2z9or3dqytwCytwFOeCRFZl6+jkD4NxI3Vbi
 qCJxfbnMwcSL5/HsXQjPdi3F3guoapMJAf9/gi0L9C/n3PBAZclLIqrizB1JjN8bupki
 kjiOs8qiID21swKLlCUtBIYJfatdIfvoqyLaLww7mZPdGzjTR2Vm6KU1/a4ILfcIhpwb
 LfEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ulXMgjC1nhezaSD23eulJZtw/gqtaE7ewFuc5xi9szM=;
 b=WqHL2d4z3IpkAXxBUV6L6TR6rv2IOa4imGMbgqvJLUM6j2Ny7F1rnY4I62Vr/vDksb
 pDQDagq05dlqX394e+vnFExsiZUnTh5pOIpuBWiqvv20WdpMBNhN9zPOFlmZMPDlnY2Z
 GeepXCfTnEnek0rRRa8MCDLSyjWVQUQXxv0kaaFy81mlucER9rKXukWzoXtukLCDnQiy
 Zq+p88rr88O7JxYUsewCKkz0NqAFsEU+WiITJdtM2cZlPAi3dvTFvLzGhD+Gl88ZHEGS
 +fCm+OodL8s1An21D0i9ZDycTEO08EE6U/7TyXlgAVFvm65anoxYCCLJpii9tiSUDowT
 zRSw==
X-Gm-Message-State: ACrzQf2wVDqYaYCGe3qZihXt0eR8KB2XqFWhWof2NrHyTpYfvIOz6cN0
 vF6q9sOrO8DU5sfL1v9KRzmPNg==
X-Received: by 2002:a05:6a00:168e:b0:53b:3f2c:3213 with SMTP id
 k14-20020a056a00168e00b0053b3f2c3213mr19794739pfc.56.1667311148048; 
 Tue, 01 Nov 2022 06:59:08 -0700 (PDT)
Received: from fedora.flets-east.jp ([2400:4050:c360:8200:8ae8:3c4:c0da:7419])
 by smtp.gmail.com with ESMTPSA id
 y4-20020aa79ae4000000b0056bdc3f5b29sm6510722pfp.186.2022.11.01.06.59.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Nov 2022 06:59:07 -0700 (PDT)
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
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Akihiko Odaki <akihiko.odaki@daynix.com>
Subject: [PATCH v8 13/17] pci/slotid: Omit errp for pci_add_capability
Date: Tue,  1 Nov 2022 22:57:45 +0900
Message-Id: <20221101135749.4477-14-akihiko.odaki@daynix.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221101135749.4477-1-akihiko.odaki@daynix.com>
References: <20221101135749.4477-1-akihiko.odaki@daynix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::52a;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-pg1-x52a.google.com
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
X-TUID: 5J9ATHp0D5Ct

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

