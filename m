Received: by 2002:a17:906:9f27:b0:7ad:ca5a:aee3 with SMTP id fy39csp1433258ejc;
        Mon, 31 Oct 2022 18:03:49 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM7nzcye7uTFAkL+aapuuG8cnJh6ZeUdrIYQlxVyi7sH34lgTWrq6hPuZmojh75iD4x2heZA
X-Received: by 2002:a05:6214:1bc5:b0:4bb:acd8:36c2 with SMTP id m5-20020a0562141bc500b004bbacd836c2mr13687856qvc.36.1667264629428;
        Mon, 31 Oct 2022 18:03:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1667264629; cv=none;
        d=google.com; s=arc-20160816;
        b=y5JmPigW7ePDZ8Oo4Tyv0aEN5D3SEPXXRWrNNCRP3bOP5R9CN94OmjW1ro5Ow7fd9I
         YHDpjIcHWDqlWf/0Byp1MU0zSmmmitG1VRms5NOBrLeP/5qvmUfPpYDc7+qWuPU+x0Vm
         1XgBZpPWJpL3ehMjgvBoOww+wnZ+8UuvmcOkHNph/66T7laHnIKNPwWpcxpOgL5x6cga
         ei1CFbDErosvY/b/QohtVE+QMQr59gDsaAmgauccJu9VZz4FDPSe0B2Sy4Axc8qgEAAG
         KWvZeEk45WhAIRuojcDt5osABbeWYnF56eRckYaTlZgOWn7PvEhsXFyGiW4NE3UbPfkN
         QQqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=errors-to:sender:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=Ve64Yknp9Z5jtrd7y/2CScvNeMugfa6S0tD/94xCa3A=;
        b=yLyEX8yZesvESiW4wLvWz9QVtyiaaXXeTaO8bAC0CbKap22J8mCGwR7Y11T3D99NqO
         OaceFy3AZ71nQjfIgYqsWSi2xz3Y7HLC1Z7y+GGzp0uGCnAIgqM+XpNqne9WQkbRsOdI
         wKDWEnb0/gEcpAdpQ0C839E3h37BrvBIcv8NtEoUFQ77qU315N5abxDkx2CxV2kxLrXy
         qXovTWxp3O/Prlf2hwt5Q8IdsfGdb6pdhNxDGuF7k8JbirQbJbrd7x1uv/FIb8bv9n00
         OycnAGct4ncwwOybsrqt4blnvbYTpR1uEq14ahllW5P3k4zlgyzS/ClDdLUS+DO7YjYe
         O3dw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@daynix-com.20210112.gappssmtp.com header.s=20210112 header.b=pEGBMKIU;
       spf=pass (google.com: domain of qemu-devel-bounces+peter.griffin=linaro.org+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+peter.griffin=linaro.org+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+peter.griffin=linaro.org+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u8-20020a05620a430800b006b88d06dc1csi5337659qko.565.2022.10.31.18.03.49
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 31 Oct 2022 18:03:49 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+peter.griffin=linaro.org+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@daynix-com.20210112.gappssmtp.com header.s=20210112 header.b=pEGBMKIU;
       spf=pass (google.com: domain of qemu-devel-bounces+peter.griffin=linaro.org+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+peter.griffin=linaro.org+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1opfeX-0005tM-3j; Mon, 31 Oct 2022 21:01:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1opfdc-0004kf-W5
 for qemu-devel@nongnu.org; Mon, 31 Oct 2022 21:00:31 -0400
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1opfdU-0006SV-I4
 for qemu-devel@nongnu.org; Mon, 31 Oct 2022 21:00:18 -0400
Received: by mail-pl1-x62d.google.com with SMTP id k7so2499820pll.6
 for <qemu-devel@nongnu.org>; Mon, 31 Oct 2022 18:00:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Ve64Yknp9Z5jtrd7y/2CScvNeMugfa6S0tD/94xCa3A=;
 b=pEGBMKIUzlv5twIJZ9GQSwdNWzzvEBVsr6DRAPE3NESBy+tlEoxFXlTSVRTx2lmwJy
 R8gcEAIZKoxC/17qAct4CFWwKtn5c2R0gX/dQzlEsOu/BGZMtGQqe9utB+lzbruZ+fGf
 26y4hnOkCgPPalLdzmx+8PtxNaHC8yTZ65Tt/Ho7d7xGSN4r/dkM2EzLaWovsohfYw1u
 oYE5vfweReMJ2N+rFYuwBEsNsgN4qTS4tqRJbk55FykQEMOIym4OPg5h+B+HR/NkHRgI
 WAkvLyL67O7b91HCj1z2kNDyFtvtWNqxsiZZpjWtanZ/R9GMwXBUYrpvqTvySvSAvyyS
 lBAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Ve64Yknp9Z5jtrd7y/2CScvNeMugfa6S0tD/94xCa3A=;
 b=CNcuAHKe/qfG3vcT/W6uevIRsCVj3hOLclP3rS1L8xn8T1eHDRInKi306fav3LwAIR
 1RFw772S+QTe9K1hRQ6QFBO04/fDlOWYgxAEsqGXwUdcL++xBn4hXvKiP+1DtCIECHL5
 +w3ePC+tKUViUD4FppXrBKHQQaq7WA6SpL1j4rS+XlzkBiovs8ESgRdYPvRGoU1h72UY
 nwmsAbvbktYuzOxrFVowaSq0c+GI/EKCGYCmLmy7aMNqUUEbaSs3ZL4DplaztC+x/R9j
 HkjjkbW8wG3/qrmOpg+dDHCP4QBPTQPvwsqgML9rlQXjVnC8pDYxJBIMumKlAmtk9mte
 SR/w==
X-Gm-Message-State: ACrzQf3rd1LLdbex+OKOeWy75xWSBIQxvUtJmw8Be4/xQSSUZOzWJqy6
 3X37y65YiYIzcWo9yM1d9rZXxGTuGIBMNBQ1
X-Received: by 2002:a17:902:f60b:b0:178:6a49:d4e3 with SMTP id
 n11-20020a170902f60b00b001786a49d4e3mr16990994plg.75.1667264409613; 
 Mon, 31 Oct 2022 18:00:09 -0700 (PDT)
Received: from fedora.flets-east.jp ([2400:4050:c360:8200:8ae8:3c4:c0da:7419])
 by smtp.gmail.com with ESMTPSA id
 o9-20020aa79789000000b0056d98e359a5sm1875644pfp.165.2022.10.31.18.00.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 31 Oct 2022 18:00:09 -0700 (PDT)
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
Subject: [PATCH v7 12/17] msix: Omit errp for pci_add_capability
Date: Tue,  1 Nov 2022 09:58:54 +0900
Message-Id: <20221101005859.4198-13-akihiko.odaki@daynix.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221101005859.4198-1-akihiko.odaki@daynix.com>
References: <20221101005859.4198-1-akihiko.odaki@daynix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::62d;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-pl1-x62d.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+peter.griffin=linaro.org+alex.bennee=linaro.org@nongnu.org
X-TUID: ZQWpOOtWW9U0

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

