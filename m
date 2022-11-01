Received: by 2002:a17:906:9f27:b0:7ad:ca5a:aee3 with SMTP id fy39csp1435101ejc;
        Mon, 31 Oct 2022 18:06:17 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM5nnEjjdhm2m4OGWjli1OLXY9yzcv9axnW16oP2Q9ZTGtcUbNpy36ulmyPXqjqOJg0Xwyfu
X-Received: by 2002:a05:622a:1826:b0:3a4:ae8c:6eb4 with SMTP id t38-20020a05622a182600b003a4ae8c6eb4mr13171691qtc.210.1667264777381;
        Mon, 31 Oct 2022 18:06:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1667264777; cv=none;
        d=google.com; s=arc-20160816;
        b=PnmremVJAKbHZr93kNn4m2JIlzz6o9zUKa7NHiT4cMDa97PY1UUJEgxpdApJLTJ07P
         195Z0LEVLU/F68rxog4x/qtmLW4f2JTrQNdNM1w1vdNCrovPm3idJ5DrmkGtBxxBRjec
         vWYEam5YlXLCVmvUNEhJvtZ5U67q7qIONkwJnfT0uNMW5upOT8AG2tcenBVEmxP/zbEB
         HLSGgLAf8uPGj6TI4vv4e+hS2icO0lsOyvCLaDIyl7ifU74EIlxmpHq3FG2Q3j+nWjZB
         NzqY96sD+u6gFsF5IyvSiDgYXzAD64U8BwWb2Xq1niq5MiMPs6zf4XCEdtD9NyvDnQp3
         DMUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=errors-to:sender:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=ulXMgjC1nhezaSD23eulJZtw/gqtaE7ewFuc5xi9szM=;
        b=JMY7eeg8KCHc5AzZ11yQXhDBn3vBhLEq0Xoj7RhLln4IEFWp0m1BDuVjJrniN4K/kQ
         i+O8HtBoT5ki+RAgHYc5IZxgG+GmLy3d9yF9frxnwvAmvYYW46soWkfLDqfAMFm751rF
         VMfDYdww2lkvC464XmhO5gzzdO+hV2a9hTVHkYoJ6PBmVYNiJvS+fAn2IVUtua3ZRxHR
         084tyi+T/E7DyxdOZG676vhriP8YXS9QS/EfOoS/GOJiX6EHS9RePV2ECWUEucYRK8jP
         DHDYeCdyjse1AUjotpf3qPyUm66D3ujrW0uQ6YXqDLSyvCDqN2CFaVUqKwwujJkWPY0w
         RIZQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@daynix-com.20210112.gappssmtp.com header.s=20210112 header.b=TchUNwqw;
       spf=pass (google.com: domain of qemu-devel-bounces+peter.griffin=linaro.org+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+peter.griffin=linaro.org+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+peter.griffin=linaro.org+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id z17-20020ac81011000000b0035d582c0764si4712009qti.104.2022.10.31.18.06.17
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 31 Oct 2022 18:06:17 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+peter.griffin=linaro.org+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@daynix-com.20210112.gappssmtp.com header.s=20210112 header.b=TchUNwqw;
       spf=pass (google.com: domain of qemu-devel-bounces+peter.griffin=linaro.org+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+peter.griffin=linaro.org+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1opfe6-0005RM-5g; Mon, 31 Oct 2022 21:00:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1opfdj-0004oa-I4
 for qemu-devel@nongnu.org; Mon, 31 Oct 2022 21:00:31 -0400
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1opfdY-0006Vd-Va
 for qemu-devel@nongnu.org; Mon, 31 Oct 2022 21:00:23 -0400
Received: by mail-pl1-x635.google.com with SMTP id g24so12226302plq.3
 for <qemu-devel@nongnu.org>; Mon, 31 Oct 2022 18:00:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ulXMgjC1nhezaSD23eulJZtw/gqtaE7ewFuc5xi9szM=;
 b=TchUNwqwMt0Puhntt7d4pbw30rCl2cKAcJ7tR3XGxJnTW9qjKK8N4zCXJ0Ewe8t7n+
 P4jUaaxd1b90+k0N5SUfiJjz2UgR1VAgDVtFdBcqEU+k1BJ44SsD2V0xJEQVLvmr5gRO
 QqlRNGvScGzF89PQMbi33leyMhOnShkPezea+oqWLDVFNZ1IfJqdHAixnd7wgzNEB3t5
 2obxKivdvvMK0zs65RQjyMIbs6FpQYpO7X1f1u/GQbbMuRspLQejni++ATggw23N7NcT
 iwPLPl9EeWXYGu3XwZLWH5SouuW+1CKQ6ncCQfg/8tbizm9KSE7F7o/MPBHihhOiTEOe
 mOZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ulXMgjC1nhezaSD23eulJZtw/gqtaE7ewFuc5xi9szM=;
 b=Wlxl3IJLNEQobzo522NZFBO9s53LnPJQeVheh1F5MEo25tivnip54WdFYmOskSkEKl
 cl0dIKExOfHIRcG8PWW7tiDL+Gd5y2WG1pxNTN72daycCd0CasrWqwzReo9Vb75xyp24
 2uamwpN8t+acD/ZN8t3LR0sIx1l5Df0NDcAia15DkVLSGaZoQw8Vdai9ysO+1kJqT/X4
 lSepkPVnV/fMj8ucRRr4po+OW4zlg8Pp4PC7RB7n480jlZ7X3ZTZ6rjR9c5WBgfzRFTE
 KJyw8Td/ShP2Vg4vJRSjClC3e+0hpJL8uLkmsuJ5J92M9GMmLC4n/3vV9Xov0ur4Pahf
 ySQw==
X-Gm-Message-State: ACrzQf17w/fGrcjp7R9aUhmAmqlqVTg9tIesdSYuqdBQy7jWCQFQYYXq
 q2dN+H9ebDWMC4zc5kDU4+Wu8OQS0flev4oQ
X-Received: by 2002:a17:902:b70c:b0:186:8bb2:de36 with SMTP id
 d12-20020a170902b70c00b001868bb2de36mr17412917pls.106.1667264414656; 
 Mon, 31 Oct 2022 18:00:14 -0700 (PDT)
Received: from fedora.flets-east.jp ([2400:4050:c360:8200:8ae8:3c4:c0da:7419])
 by smtp.gmail.com with ESMTPSA id
 o9-20020aa79789000000b0056d98e359a5sm1875644pfp.165.2022.10.31.18.00.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 31 Oct 2022 18:00:14 -0700 (PDT)
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
Subject: [PATCH v7 13/17] pci/slotid: Omit errp for pci_add_capability
Date: Tue,  1 Nov 2022 09:58:55 +0900
Message-Id: <20221101005859.4198-14-akihiko.odaki@daynix.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221101005859.4198-1-akihiko.odaki@daynix.com>
References: <20221101005859.4198-1-akihiko.odaki@daynix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::635;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-pl1-x635.google.com
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
X-TUID: MyQIIH9ob5+y

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

