Received: by 2002:a17:906:43c7:b0:78d:9f02:16a1 with SMTP id j7csp1707337ejn;
        Fri, 21 Oct 2022 22:08:17 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM6pnhJ9p1buy6x1NZ27kAFd2B8LxO43dqSuKznFxz0O/1sG3+KJU4g9SrqSKCvmDaErwQNC
X-Received: by 2002:a05:622a:1c4:b0:39c:f5a3:2f67 with SMTP id t4-20020a05622a01c400b0039cf5a32f67mr19092782qtw.29.1666415297609;
        Fri, 21 Oct 2022 22:08:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1666415297; cv=none;
        d=google.com; s=arc-20160816;
        b=XXgtUkXKLtt9jniGVd9+aj6tvaaGG07bk13dRA3ZCbDaxjnEd7o0wr3pWiRRRPNqEp
         /pNSWNXuv58hcf02wx9RBIUP3dMgjCI+Qw6kGZfcSYxBmsRkzy568QTOSU7Eb5q0ep+t
         6jp77KkyBcGo0qmD1DohP7GE6PeYfiz2CHeGEsUQtfWKUIlL/0a9Q4bFIPF93k/BMEcj
         2M2ebmgGKYolQV43aa+iX2Aowe+4M8QSVxifN8YtrcTdOp8uQqk6YgEFOHiDnYPGxlxn
         34ubQ5pLCb8g6BPxY3R2N5WvF9OOWZYxRWT2GYEnENQbniTk6ryzg7fg/4UDOBq2dgTJ
         5K2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=errors-to:sender:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=GHs3FIVgg/OfZMJJpCzpOV6oBMUZOjvUGwJM42Wh0Q4=;
        b=FJsrWcv+MjRMXZ3q03KFs6T/J8WTjFApzVhYGUUO6zP5ggU9MZ4kQHqnQIDk10UuSA
         fOKmRxEoStGewxvmZNaLIoTOn/rLhCMlHGA7dsg2HCA282Swb20PR7coLblSpsH1UdsT
         dqqQqwC5z7/vOSS6eRf3oEqWroRJo7zl0QrPq33619cHdtJRQmumW0TgxQPkkXD5kSbl
         W+SlXp49JacceEaDNI639sSFCu0CxDCI9YVETf+6LysHLe3bxF4DZlhux1pSf6pH3Wj3
         aREXvasqwa+k/atItcts+46FsnQSDvI+qwHf0aPmu4oxVuUjvAYI0NHUCM1QndAZOUCl
         QJiA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@daynix-com.20210112.gappssmtp.com header.s=20210112 header.b=u3DYI60M;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j14-20020a05620a288e00b006ce401c798esi14370216qkp.709.2022.10.21.22.08.17
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 21 Oct 2022 22:08:17 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@daynix-com.20210112.gappssmtp.com header.s=20210112 header.b=u3DYI60M;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1om6KN-0005Pv-1y; Sat, 22 Oct 2022 00:41:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1om6KJ-0005PT-Ng
 for qemu-arm@nongnu.org; Sat, 22 Oct 2022 00:41:39 -0400
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1om6KH-0003ji-4s
 for qemu-arm@nongnu.org; Sat, 22 Oct 2022 00:41:39 -0400
Received: by mail-pj1-x1031.google.com with SMTP id
 f9-20020a17090a654900b00210928389f8so8484096pjs.2
 for <qemu-arm@nongnu.org>; Fri, 21 Oct 2022 21:41:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=GHs3FIVgg/OfZMJJpCzpOV6oBMUZOjvUGwJM42Wh0Q4=;
 b=u3DYI60M2qZVmc69+BldTMJV9xDoHgWxZaPPUuIo+83+mW59eBOfPKk2q4wX3t5afA
 0v1nc19sbEdBIjHOxQ5bc7t5fK1qfVg1P8HZXVZ7YwY0VkRdNqghqAhC2GzxT1ndVQsb
 AKv7Lpw4M4qYshmsSquDpqICSjiJax/slgWJO18TbqgcYvmqr0spwpCHu5Ikk2sTPpST
 VofEmyQYlbBW68aN+wEACHM3r6PWI8gGvj64tcZxaSJq+QohcdTEXFn6jHf1C2pTKXFK
 6IioBMQMp8r2ICz4sA8y9OwHCnoLE472c7tDVFxakO1pR9ZZtODm98XQA8y/4q1J8gnf
 sTdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=GHs3FIVgg/OfZMJJpCzpOV6oBMUZOjvUGwJM42Wh0Q4=;
 b=Kda/JOb5wJzrcjcSk5GJemH94B/u44grQRre/Ap1Iuz6vkylUwF1tgMvotdZO6X/YL
 j9j5IAgTJI0SEw3eEN7VsjlQCRO1kkLnrAXxBmFNnVBXnfAkQ/zNPFQEtQEUrG2dMe5K
 C1SLde9mMMKPTGt/FFK+6dLx5FyzherBwqXZb0ZptXpQw3SgqEwMfogXnlPUPlrG73Kg
 DfrCGghCBK+75l+bSta8NJja0RapU+1Yd5gjKnTs4n7Oij9M+lCGkBj6b8A6awedLKtT
 QgB8qU/ME4GRqxGHpGFCpQX7YaUn+jRVZ4lzH4+ywivsC5jEKCoCLTRVCTGQikKHEIeq
 02Gw==
X-Gm-Message-State: ACrzQf1ymiLbFoatiTjZCWMNlO6037WYp0VkP8yuM6EDwUx+bIrsRVnq
 6cAqHlIIypxsKnqzuIG+T7ebSQ==
X-Received: by 2002:a17:902:e846:b0:185:2f:c52 with SMTP id
 t6-20020a170902e84600b00185002f0c52mr22629702plg.69.1666413695443; 
 Fri, 21 Oct 2022 21:41:35 -0700 (PDT)
Received: from fedora.flets-east.jp ([2400:4050:c360:8200:8ae8:3c4:c0da:7419])
 by smtp.gmail.com with ESMTPSA id
 y16-20020a17090264d000b001868d4600b8sm178049pli.158.2022.10.21.21.41.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Oct 2022 21:41:34 -0700 (PDT)
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
Subject: [PATCH v2 05/17] eepro100: Omit errp for pci_add_capability
Date: Sat, 22 Oct 2022 13:40:41 +0900
Message-Id: <20221022044053.81650-6-akihiko.odaki@daynix.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221022044053.81650-1-akihiko.odaki@daynix.com>
References: <20221022044053.81650-1-akihiko.odaki@daynix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::1031;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-pj1-x1031.google.com
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
X-TUID: jeSVPACNH92N

Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
---
 hw/net/eepro100.c | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/hw/net/eepro100.c b/hw/net/eepro100.c
index 679f52f80f..bf2ecdded9 100644
--- a/hw/net/eepro100.c
+++ b/hw/net/eepro100.c
@@ -549,12 +549,7 @@ static void e100_pci_reset(EEPRO100State *s, Error **errp)
     if (info->power_management) {
         /* Power Management Capabilities */
         int cfg_offset = 0xdc;
-        int r = pci_add_capability(&s->dev, PCI_CAP_ID_PM,
-                                   cfg_offset, PCI_PM_SIZEOF,
-                                   errp);
-        if (r < 0) {
-            return;
-        }
+        pci_add_capability(&s->dev, PCI_CAP_ID_PM, cfg_offset, PCI_PM_SIZEOF);
 
         pci_set_word(pci_conf + cfg_offset + PCI_PM_PMC, 0x7e21);
 #if 0 /* TODO: replace dummy code for power management emulation. */
-- 
2.37.3

