Received: by 2002:a17:906:43c7:b0:78d:9f02:16a1 with SMTP id j7csp1713874ejn;
        Fri, 21 Oct 2022 22:15:30 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM7bqTLABtASSX2155WoBgaBSmaMQdmlGQmHhcBZIAgQ1IPitbFIhBKK0E5x5UpRYUVVrJCH
X-Received: by 2002:ac8:59c1:0:b0:39c:d5c3:6859 with SMTP id f1-20020ac859c1000000b0039cd5c36859mr19930431qtf.230.1666415730564;
        Fri, 21 Oct 2022 22:15:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1666415730; cv=none;
        d=google.com; s=arc-20160816;
        b=HF8RsI1btGkWqgn3a82ykRGBz6pFrCjjy1STp11gi62WaGNqaK9aCEKbEUsKaF785W
         IlQByWZjCiTtYu0fN1XpEfS+goQW6mqgP3eVxhX8i1GVTiFVuWLWvIvohMnCrU0G6Gha
         JFVM2uG1U2Swdjolb3XgGp1zW6yvhh9oHuiJYr3baVSQOHB5FxfZZPzB7VgxR7GQYW28
         BSQTIimD8mNSUrZxpnbkCJxLsHVCfTzfCZYL2T5B2GeZ/Jp+TUt4iq0bQuwvswge+kVK
         QsxPLuDDLmSSmd4vSmBDlwua0zoXJd2K+J3Kijlpa1ZL2xfn/fowqQl8PqILGho5drSA
         2eDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=errors-to:sender:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=9zy/FucJITly2PoO9JfOkp83R0OTklifrDwJAvFdxOM=;
        b=eBtkiHy2DEjo2mkoWnCGsrdzEoNsuPcssJWzP3Xrzvony3qL7QH+jgI3fKQ4OB/lpX
         qqr2hA06W3V1hfoLB1AlbGsrlheeF43WePlLVuNOuuqtM4bm/F6YCm4AWW1emDXgkfMP
         d5IMWXli6GsqPEI0Ry1nPWo4Uht0uXYmxiBKuu9UDmui4MZdL+DPkQWV1Kua1SzrpK3U
         tsELTB1oURj7qSk6etxnZj7KjQKCeKsvZgSukNh23UCx/yOfTP+Z5BTDIn/cazVqVywH
         MXrFpyE7lX7huGowjQ2k4hoJt+HSVyEQhWPc+KKUQFN8TwOftHm1gw2yA+UY5drGIXBi
         H77A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@daynix-com.20210112.gappssmtp.com header.s=20210112 header.b=SDtI5cwT;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m189-20020a3758c6000000b006d361e6d7b5si12579100qkb.512.2022.10.21.22.15.30
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 21 Oct 2022 22:15:30 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@daynix-com.20210112.gappssmtp.com header.s=20210112 header.b=SDtI5cwT;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1om6L0-0005fb-47; Sat, 22 Oct 2022 00:42:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1om6Ku-0005eR-JP
 for qemu-devel@nongnu.org; Sat, 22 Oct 2022 00:42:17 -0400
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1om6Ks-0003uD-6t
 for qemu-devel@nongnu.org; Sat, 22 Oct 2022 00:42:16 -0400
Received: by mail-pj1-x1035.google.com with SMTP id pq16so4062805pjb.2
 for <qemu-devel@nongnu.org>; Fri, 21 Oct 2022 21:42:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9zy/FucJITly2PoO9JfOkp83R0OTklifrDwJAvFdxOM=;
 b=SDtI5cwT8/pviqwp7SLnPCWxTTh3z4AfJKNCjBiohur16fa35BgBDB/RrX1op24YQq
 Qxw8PkUCGmmJP9toabb2FiYIleO7R/0SN6Wn9Z1dNdmiN9h1uhvTA3xnuslvii9sIxWi
 H7E9laKdybmGM+HWWaGdhmXvHJbl7GkbELn2YtOUvXwr1ssBiKe3hY3K7em8SiZidISc
 AUPSgzOQXknImShZrL+myv7p2HftduwF0a+t2m+8jZ3HPh7qt0akXkYpFvglIbSs18H9
 AhaNutCg2us1hpEUo0sS5H9+Ma28G4Wu8s3hONnsUJZsD0OtCkNrBps2gm2TarWASV8O
 X3FA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=9zy/FucJITly2PoO9JfOkp83R0OTklifrDwJAvFdxOM=;
 b=qZxDX/1sgoIaW84RK3C8R6/6r47lnIQO/0Z2yn05eg7lnRMQ7WyYf4mXmiOvaVhH8m
 4jlHCt9jk4CiteAEuDqJym1mFha1brlmmovC/64adAHN/oLGHhoVzOQ/t9cfbuqCws0W
 K6he7gLTmCMyK/ZJfnTdn5fwLAFa9/fyDsox5M5u+0MJNrkI2kHmi+YlR07mfJKHvums
 ZjN1EApnKxOEiP74jULztWBn9HruznNKWqYQxmaoqW9+pdcggIK/a9E1sZC4RS2ySEtB
 2iifeMCgxhmiTj0x/IX/mp3VvwZvNm+PCpLPlMEFELeaj8AX/etDV4V/CIwWcTZNjrWW
 IXDQ==
X-Gm-Message-State: ACrzQf0DL6E+LM57NGyEd3fCo9kTXG2DnOBjUGiDyS4Sk+ZZPcNoZA4F
 nhyq8tES+GReWfbI9AIkGcRhxA==
X-Received: by 2002:a17:90b:38d1:b0:20d:8f2a:c4c4 with SMTP id
 nn17-20020a17090b38d100b0020d8f2ac4c4mr59768279pjb.192.1666413731848; 
 Fri, 21 Oct 2022 21:42:11 -0700 (PDT)
Received: from fedora.flets-east.jp ([2400:4050:c360:8200:8ae8:3c4:c0da:7419])
 by smtp.gmail.com with ESMTPSA id
 y16-20020a17090264d000b001868d4600b8sm178049pli.158.2022.10.21.21.42.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Oct 2022 21:42:11 -0700 (PDT)
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
Subject: [PATCH v2 12/17] pci/slotid: Omit errp for pci_add_capability
Date: Sat, 22 Oct 2022 13:40:48 +0900
Message-Id: <20221022044053.81650-13-akihiko.odaki@daynix.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221022044053.81650-1-akihiko.odaki@daynix.com>
References: <20221022044053.81650-1-akihiko.odaki@daynix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::1035;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-pj1-x1035.google.com
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
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: TilIjInaEo78

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

