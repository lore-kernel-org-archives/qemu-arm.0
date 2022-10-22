Received: by 2002:a17:906:43c7:b0:78d:9f02:16a1 with SMTP id j7csp1703157ejn;
        Fri, 21 Oct 2022 21:58:41 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM7ePwlHUpWGNp4fwZ3620y1wqMBlXV8UMpExg13P0E6iTq2GMbJ3U9Am2g252ItQklyBqdt
X-Received: by 2002:a0c:f412:0:b0:4b1:25f6:6c26 with SMTP id h18-20020a0cf412000000b004b125f66c26mr19459716qvl.69.1666414720893;
        Fri, 21 Oct 2022 21:58:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1666414720; cv=none;
        d=google.com; s=arc-20160816;
        b=l7B/RtsNRAse+HqlZ4EMUS7L0qSoxpHQEaQ+wcSsBIkvtgBr78+U1UemK8X0Qs6UJZ
         Xxs6qTSKitkePnz+tHzIf4n60SNs1GzAedz/BMfsdNxxq/UWzI6TOnKrqicFfql6h3T7
         +I90a4EIC6psJC6U9yeHYs8rbHH86QlcinhoX4npmobDeFqcAj4VBpzbHPoQnfEEXvaN
         MLO9dVnjnTFnouWM9dcIIkoXPaS3Miaqk2CugYvEfomdWXeyet72HM2FRkJUHlKWcOeF
         hQnESMpIOKuPBAzygWC1XNMCsiTTC/pu6lvtd3jRRO4CCt8pJBFnuTCq2lsroNCPxrI+
         MbbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=errors-to:sender:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=OrwchNWJXG/IFKyLYSvhlUx2Gvwku9OSgyo4kfBl800=;
        b=eapBtOnvVeK4lG6AA5sCEswA3wVc7mQ+Yq7mrAYKzkbi6xR2J9DbzBGnoHfLxLn9LA
         jnMia0JNbP9umYFUCHgCO8eDhEnoGYFuq6Jt5TtR4Qf7NaQJ/kKBhuwnr+s9eFhgvI2Q
         FmXw7SZdQVstBObbXxCUYY7dJGaviDiFVmXm50fWGJ+1dmfBn8BzZCbp7sdS2sPWc1cE
         80rLC062MQtEgEG6FFvg1a8kqoueneprYSXm+rRAI1R53QVQa+DQSlNSUJljtyq4xQjJ
         1V42vFgEzoVUhV1YQlyvBmtO9RJU5iU4s8ek1wQavFtWJ/M6vRc0bZ/5C15yWinIukqg
         ERPQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@daynix-com.20210112.gappssmtp.com header.s=20210112 header.b=IkrM3hZg;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w29-20020ac84d1d000000b0039a53ca0c5fsi12251871qtv.189.2022.10.21.21.58.40
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 21 Oct 2022 21:58:40 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@daynix-com.20210112.gappssmtp.com header.s=20210112 header.b=IkrM3hZg;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1om6LC-0005jO-M3; Sat, 22 Oct 2022 00:42:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1om6LA-0005is-Fd
 for qemu-arm@nongnu.org; Sat, 22 Oct 2022 00:42:32 -0400
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1om6L6-0003wV-LC
 for qemu-arm@nongnu.org; Sat, 22 Oct 2022 00:42:30 -0400
Received: by mail-pj1-x1033.google.com with SMTP id l6so463023pjj.0
 for <qemu-arm@nongnu.org>; Fri, 21 Oct 2022 21:42:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=OrwchNWJXG/IFKyLYSvhlUx2Gvwku9OSgyo4kfBl800=;
 b=IkrM3hZgkq1Fuy3DpdzeUUk2nPTMnXizn1m8A2ecwRQQMk1XF9XRGW5hZhPNniEg3X
 yUXn8tJHwB21vdAJMoDcbYNCvusDgdAH1/gdUeBA3v8lP0Ox+P+qBfC8at9AOPY7oIAP
 U3yRdKB1giEBYx+GMH1obbdkmVYZIhb937ZG7xo8UnX6Xtfjjko3Y8KV6wQymz80SuhI
 VrbJxWB+HqzbZBlGgMiZ44PcmqKqwkbHrW3fqzCXS623Gc9kpRHB/sSQtYqD3J9rAv1H
 tdpD1hohoMtZ6RFY52HpNXrMGKYIYaCwLEhv5Q1G8I7P2W+M3LhtREp17hDhd91IKkUT
 z6YQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=OrwchNWJXG/IFKyLYSvhlUx2Gvwku9OSgyo4kfBl800=;
 b=pr9KpdVVsOBYYYosTTp/NwriEntq9iIoVK2HMsNXfuH0JemUj/OZxNWKrKXlThJu2t
 yBfIT8NVOrSSVs4cYK0A5Dn6uUZuXLeOBbClzb5dmXJA786nlRJfPc8AB35N9eAx/lob
 2FST+m37ZaxRp7PL5dClysEwQzc24iXog1RvJc/TqTU9uRfn5/aJSjF8wMkMIGpzjwhY
 Q6vF1R6ASd7rDgutAPzQuaq+jClybJztBAGta1YEYjDn39n5CnUGquQj/q6+sG3RQMbH
 G5Atp35Sem7KsfDooVHkjcceRdpEZLyHRaDEb92dN/JR7YjSAVg6hSJ/Pef4+uc3fOSa
 Bxcg==
X-Gm-Message-State: ACrzQf2bytM6Eu76XXnmHDj/1hGIx6T9qKw+ZJQLH521xf0uCKHAWIfK
 3dr2FI0EO13oMgs8Yf09i3W23g==
X-Received: by 2002:a17:90b:3e81:b0:20d:bbe5:f332 with SMTP id
 rj1-20020a17090b3e8100b0020dbbe5f332mr50207015pjb.112.1666413747453; 
 Fri, 21 Oct 2022 21:42:27 -0700 (PDT)
Received: from fedora.flets-east.jp ([2400:4050:c360:8200:8ae8:3c4:c0da:7419])
 by smtp.gmail.com with ESMTPSA id
 y16-20020a17090264d000b001868d4600b8sm178049pli.158.2022.10.21.21.42.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Oct 2022 21:42:26 -0700 (PDT)
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
Subject: [PATCH v2 15/17] hw/vfio/pci: Omit errp for pci_add_capability
Date: Sat, 22 Oct 2022 13:40:51 +0900
Message-Id: <20221022044053.81650-16-akihiko.odaki@daynix.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221022044053.81650-1-akihiko.odaki@daynix.com>
References: <20221022044053.81650-1-akihiko.odaki@daynix.com>
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: EP7hDuG/w0CP

Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
---
 hw/vfio/pci.c | 14 +++++---------
 1 file changed, 5 insertions(+), 9 deletions(-)

diff --git a/hw/vfio/pci.c b/hw/vfio/pci.c
index 939dcc3d4a..2b653d01e3 100644
--- a/hw/vfio/pci.c
+++ b/hw/vfio/pci.c
@@ -1826,7 +1826,7 @@ static void vfio_add_emulated_long(VFIOPCIDevice *vdev, int pos,
     vfio_set_long_bits(vdev->emulated_config_bits + pos, mask, mask);
 }
 
-static int vfio_setup_pcie_cap(VFIOPCIDevice *vdev, int pos, uint8_t size,
+static int vfio_setup_pcie_cap(VFIOPCIDevice *vdev, uint8_t pos, uint8_t size,
                                Error **errp)
 {
     uint16_t flags;
@@ -1943,11 +1943,7 @@ static int vfio_setup_pcie_cap(VFIOPCIDevice *vdev, int pos, uint8_t size,
                                1, PCI_EXP_FLAGS_VERS);
     }
 
-    pos = pci_add_capability(&vdev->pdev, PCI_CAP_ID_EXP, pos, size,
-                             errp);
-    if (pos < 0) {
-        return pos;
-    }
+    pos = pci_add_capability(&vdev->pdev, PCI_CAP_ID_EXP, pos, size);
 
     vdev->pdev.exp.exp_cap = pos;
 
@@ -2045,14 +2041,14 @@ static int vfio_add_std_cap(VFIOPCIDevice *vdev, uint8_t pos, Error **errp)
     case PCI_CAP_ID_PM:
         vfio_check_pm_reset(vdev, pos);
         vdev->pm_cap = pos;
-        ret = pci_add_capability(pdev, cap_id, pos, size, errp);
+        pci_add_capability(pdev, cap_id, pos, size);
         break;
     case PCI_CAP_ID_AF:
         vfio_check_af_flr(vdev, pos);
-        ret = pci_add_capability(pdev, cap_id, pos, size, errp);
+        pci_add_capability(pdev, cap_id, pos, size);
         break;
     default:
-        ret = pci_add_capability(pdev, cap_id, pos, size, errp);
+        pci_add_capability(pdev, cap_id, pos, size);
         break;
     }
 
-- 
2.37.3

