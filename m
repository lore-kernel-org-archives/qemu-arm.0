Received: by 2002:a17:906:9f27:b0:7ad:ca5a:aee3 with SMTP id fy39csp1909425ejc;
        Tue, 1 Nov 2022 07:25:26 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM5CVirnn1vw+eXC+jr/ckLKmf0tkN3NBye8i7W4jemsHC26N+6TRpBqLthgHHSS+Q/T7QNX
X-Received: by 2002:a05:6214:2483:b0:4bb:59ec:c5a7 with SMTP id gi3-20020a056214248300b004bb59ecc5a7mr16420250qvb.94.1667312726021;
        Tue, 01 Nov 2022 07:25:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1667312726; cv=none;
        d=google.com; s=arc-20160816;
        b=puhhggDw9i/tN1MnOVMZy7U9LGB6SHjipjs+ESMnWSuWLUb6J4taU/Cc2bjkYi0nYP
         KhrBALvEcW+A8CEi/wf9Lr5P2I2qdvsUxTfZxwE5iD+JpVWzTzY11ITtbwoObzbsnSEA
         +8JYoScG2hZmcK5Dj7f/ztlBTazLW8tebHxJQnS4ijR2JtruY+TPpD05cOCZEpOvtLZg
         rK6TLsIwNhOLgSSgdM+x7+qLDNHs2dvDF3yTlJX9+xsgNxKV8EDOV7sNCG4VYR0JGFDC
         3D8k3MzTRw1SYCm3c8hQ0qFi9bFwSYkxRjvN6HzeN4K3QbVCedOdB3MKhMHxkmg4TbAD
         lU2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=errors-to:sender:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=rOjHWNXn/Wht1Shk+YGDnbsD8G3ScWO/Koc/z3Bsls4=;
        b=C9vcYX2RJCfm9C5m3aH9Kruf+mm1qTilgzGk5rpVhLLYWmoHtilgsu4zCsQmzhs5vg
         nzjEYdmEOCxSWOTzaxdeT51YW1+hZlSG3NAliljNPVSGAVfxztyU9VgwpmKECgTc4JF+
         jVJNNmbgkYPbKSxfnEw1Stbi8chB4+C/pJq9JVRqY+2XzZdjFvqho6BHkc1aNLIbqbS2
         WDfq9ytnwOt9U6SKtvjRZ/az1auS47oW19zL5LeTOG0glTKWjfP9O8D/mNQ3r0KQabuK
         +2h+hSIUXJkulmlCdIwC3wGZWdXzpj7rPN0lOuvc+rwD8LEq/0fXFyBe8TPJlyFdyJFB
         8sxg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@daynix-com.20210112.gappssmtp.com header.s=20210112 header.b=1csrNmft;
       spf=pass (google.com: domain of qemu-arm-bounces+thiago.bauermann=linaro.org+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+thiago.bauermann=linaro.org+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+thiago.bauermann=linaro.org+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s12-20020a05620a0bcc00b006fa07c7f568si6329663qki.486.2022.11.01.07.25.25
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 01 Nov 2022 07:25:25 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+thiago.bauermann=linaro.org+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@daynix-com.20210112.gappssmtp.com header.s=20210112 header.b=1csrNmft;
       spf=pass (google.com: domain of qemu-arm-bounces+thiago.bauermann=linaro.org+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+thiago.bauermann=linaro.org+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1oprmy-0005vf-IN; Tue, 01 Nov 2022 09:58:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1oprmt-0005sZ-Dm
 for qemu-arm@nongnu.org; Tue, 01 Nov 2022 09:58:43 -0400
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1oprmr-0003ta-U3
 for qemu-arm@nongnu.org; Tue, 01 Nov 2022 09:58:43 -0400
Received: by mail-pl1-x62d.google.com with SMTP id p21so9766440plr.7
 for <qemu-arm@nongnu.org>; Tue, 01 Nov 2022 06:58:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=rOjHWNXn/Wht1Shk+YGDnbsD8G3ScWO/Koc/z3Bsls4=;
 b=1csrNmftuAhP6a4ao8QzzfzRjYFRaED4KfhdSDsYDKprl0Mj3yLGODrx+hDmsHPBi2
 M4P7bhNhTazXMlKqnHamZlDuR3ilmDes5KqPre+OvteuNGYbOFRx6qczVZxfROQTX+q+
 pX9APGUycgtKupl5wIBkB4zeggDdEWEPWX4CyEAezC3/ivfiMpoAxu6FXur2+eL9h+x9
 dDezxLnRA9DdLPRgH47kaFWfcZr6sQyKgMCpW9yaj6BROKh6soiO3NK2q4xXnaMfBtDA
 EzG/agvJjBV2J0gzf36ZDeq/bf/UueYcmV6SjaLePOZOPjynGxZxFm7tDpRoGaE8ENbE
 0F0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=rOjHWNXn/Wht1Shk+YGDnbsD8G3ScWO/Koc/z3Bsls4=;
 b=b5Y9YVAj+m45X4ksQRW4dBwTZeFZviOHJDyla5hqfYpd38U1f9l/Ewe63lEMsKq/rS
 LLJq6ZU2WzOB6123Jyv0nRzyknjd0IV1RsC617M01NEhlb62Zr3NLMV88Vnek+jF1Z7Z
 MI5/tP5bwixfPhN3nxTB58cuTKC7B71DUAZ8ro7V358WhhLEJHvAj5Nx90Zk8G4QJdk4
 IA77JOHMKMXK06fGwId+I9/EprtcUUOFOGeDtBEpogynGv8mkm6xtRqIYcjwlpuG708A
 OE9kgY93hYm0g+QcRec6ynEpJfrCYbNf1dTjVq6fc/V2ksc7gMInLI/aoICeVCQ4PFG+
 CmNw==
X-Gm-Message-State: ACrzQf2w/I4T2IqKS2WftcZBN2a6R+mT+yCJLixNa0vKmjh6G6fVNSKW
 V8xx8SulU5hWqHjpbMi2vta/mg==
X-Received: by 2002:a17:902:d48e:b0:187:2f4d:db72 with SMTP id
 c14-20020a170902d48e00b001872f4ddb72mr6284476plg.69.1667311121316; 
 Tue, 01 Nov 2022 06:58:41 -0700 (PDT)
Received: from fedora.flets-east.jp ([2400:4050:c360:8200:8ae8:3c4:c0da:7419])
 by smtp.gmail.com with ESMTPSA id
 y4-20020aa79ae4000000b0056bdc3f5b29sm6510722pfp.186.2022.11.01.06.58.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Nov 2022 06:58:40 -0700 (PDT)
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
Subject: [PATCH v8 08/17] msi: Omit errp for pci_add_capability
Date: Tue,  1 Nov 2022 22:57:40 +0900
Message-Id: <20221101135749.4477-9-akihiko.odaki@daynix.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221101135749.4477-1-akihiko.odaki@daynix.com>
References: <20221101135749.4477-1-akihiko.odaki@daynix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::62d;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-pl1-x62d.google.com
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
Errors-To: qemu-arm-bounces+thiago.bauermann=linaro.org+alex.bennee=linaro.org@nongnu.org
X-TUID: jKnA9YSSvGpA

Omitting errp for pci_add_capability() causes it to abort if
capabilities overlap. A caller of msi_init(), which calls
pci_add_capability() in turn, is expected to ensure that will not
happen.

Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
---
 hw/pci/msi.c | 9 +--------
 1 file changed, 1 insertion(+), 8 deletions(-)

diff --git a/hw/pci/msi.c b/hw/pci/msi.c
index 058d1d1ef1..5283a08b5a 100644
--- a/hw/pci/msi.c
+++ b/hw/pci/msi.c
@@ -194,7 +194,6 @@ int msi_init(struct PCIDevice *dev, uint8_t offset,
     unsigned int vectors_order;
     uint16_t flags;
     uint8_t cap_size;
-    int config_offset;
 
     if (!msi_nonbroken) {
         error_setg(errp, "MSI is not supported by interrupt controller");
@@ -221,13 +220,7 @@ int msi_init(struct PCIDevice *dev, uint8_t offset,
     }
 
     cap_size = msi_cap_sizeof(flags);
-    config_offset = pci_add_capability(dev, PCI_CAP_ID_MSI, offset,
-                                        cap_size, errp);
-    if (config_offset < 0) {
-        return config_offset;
-    }
-
-    dev->msi_cap = config_offset;
+    dev->msi_cap = pci_add_capability(dev, PCI_CAP_ID_MSI, offset, cap_size);
     dev->cap_present |= QEMU_PCI_CAP_MSI;
 
     pci_set_word(dev->config + msi_flags_off(dev), flags);
-- 
2.38.1

