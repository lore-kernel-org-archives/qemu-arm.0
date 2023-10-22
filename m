Received: by 2002:a17:906:fc07:b0:9bd:85f7:2662 with SMTP id ov7csp865424ejb;
        Sun, 22 Oct 2023 08:56:09 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGAkKFhzX4x/l41QEg37XoLrugGxQw+qVsmoEGb6sF86rA6/UM51UXbLnNgcs6FFC4tryqP
X-Received: by 2002:a05:6214:224c:b0:66d:a1d3:fd94 with SMTP id c12-20020a056214224c00b0066da1d3fd94mr6058982qvc.19.1697990168931;
        Sun, 22 Oct 2023 08:56:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1697990168; cv=none;
        d=google.com; s=arc-20160816;
        b=TLhkmUE9y2XgZCInx+RFW5I/zPVAP/MLgCBQm0KPMhFkY/ZxlrArJTJ/rSRk8gsVdt
         I/IJ3RM4CtkKtS9rk/NjnOZ5op+a98yti5TpAxCS8FFlayvdm1xnshtqrRj97m8JSuDM
         KBJBKy5vXvzpDjJIVLmaCGzTmHx7mdrFA/zrIrIvCaMelHRvUoc2Kd89TdOHS4VUtRNS
         LXFeuvvFJcNxKrbitvVlYQ0hp3j+pEfExFdvYnT5T+juwkgvpC+mJDM17C4z/jhqj3ZG
         li8U2W7O2yk1vG2/bj7e+Fgr5HKdbqlHy7kmUBG0FZgpK3w1nKQR1/G5EQ5IKpnCnEwr
         fHVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=4+Mc5UoIk/j59DxPJr9/Bba3Ss0BlZ5eJh5qSsyPoYw=;
        fh=fR25DIKCexhPQAp6aUdYi3uFJxEhZaxhhcNQofNVQl0=;
        b=uaWrDtKOJnBC0jZxVmzgTZLiTXCYcI9TJ9+OUC65BOmQUm1zjPTxDqzH7ZR5xldCqC
         +1rFjLAyvHhRL5EgSrjfcdDYS/kzFAu9G4P8wLVpZ0bmwPtItFXi96+itesk1M+wE8L/
         eNcwUppKs1fwSzuPgMGseFYgeEnkhznsIZ6EvrRCMj/KL389KJ7idIaSL8f0fLNvSzmR
         /gsdA01zGdGhZKC9+Y7jQSF7E1dBfuY7Nwi+fmzxxlzgBGexKkYG0KO/b3i3SrKDFGeK
         ZlmGCwQpzV/HLeuXmhzP1a/TzloBFmhcy1ayZ6XHvrELoe7NWddjfLPLgGQOv3fpsxg4
         9G9g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@infradead.org header.s=desiato.20200630 header.b=jKJ5VvWE;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id bp40-20020a05620a45a800b007756a7b3dfasi4239379qkb.503.2023.10.22.08.56.08
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 22 Oct 2023 08:56:08 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@infradead.org header.s=desiato.20200630 header.b=jKJ5VvWE;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1qualZ-0005Iw-EI; Sun, 22 Oct 2023 11:53:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <BATV+fd6248c3715d1825373b+7364+infradead.org+dwmw2@desiato.srs.infradead.org>)
 id 1qualT-000572-4w; Sun, 22 Oct 2023 11:53:19 -0400
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <BATV+fd6248c3715d1825373b+7364+infradead.org+dwmw2@desiato.srs.infradead.org>)
 id 1qualP-0000Mg-W2; Sun, 22 Oct 2023 11:53:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
 Reply-To:Content-Type:Content-ID:Content-Description;
 bh=4+Mc5UoIk/j59DxPJr9/Bba3Ss0BlZ5eJh5qSsyPoYw=; b=jKJ5VvWEyZleEXgoeqEjZyi1L3
 F2uGIPRfZhpHac7DvT8dcH7gIWxpe/tRYcLh6a531myfO27mcnhfiU46UoKaXiCyX8XLGtR1CdiVj
 lCTsZg/ufvzJ5E1RjmOZ+bxSSWGgzoA5UbRs3K8EgeRsYod3r5vMmhKZ3EkWUbwXIyjj/7PuP3qzW
 rWINlK9wlyTwfAizsWoIWwhkaEp4EraKyMOG38tO68U98yl5KCKzvK08FpngEcsQfD3GNtneUfIMD
 /xfCnoqcaHNm5gZTtBehY1MvpMR+RyFE4tIdKv3DoushzbI5KZMsI8qV49iJYhVF3DJ61ye4Oaacl
 p2ZI+F2Q==;
Received: from [2001:8b0:10b:1::ebe] (helo=i7.infradead.org)
 by desiato.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
 id 1quakJ-00DCmu-24; Sun, 22 Oct 2023 15:53:09 +0000
Received: from dwoodhou by i7.infradead.org with local (Exim 4.96 #2 (Red Hat
 Linux)) id 1quakJ-001qZj-00; Sun, 22 Oct 2023 16:52:07 +0100
From: David Woodhouse <dwmw2@infradead.org>
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Beniamino Galvani <b.galvani@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Strahinja Jankovic <strahinja.p.jankovic@gmail.com>,
 Niek Linnenbank <nieklinnenbank@gmail.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Andrew Jeffery <andrew@aj.id.au>, Joel Stanley <joel@jms.id.au>,
 Igor Mitsyanko <i.mitsyanko@gmail.com>,
 Jean-Christophe Dubois <jcd@tribudubois.net>,
 Andrey Smirnov <andrew.smirnov@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Rob Herring <robh@kernel.org>, Subbaraya Sundeep <sundeep.lkml@gmail.com>,
 Jan Kiszka <jan.kiszka@web.de>, Tyrone Ting <kfting@nuvoton.com>,
 Hao Wu <wuhaotsh@google.com>, Radoslaw Biernacki <rad@semihalf.com>,
 Leif Lindholm <quic_llindhol@quicinc.com>,
 Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Alistair Francis <alistair@alistair23.me>, Helge Deller <deller@gmx.de>,
 Paolo Bonzini <pbonzini@redhat.com>, Eduardo Habkost <eduardo@habkost.net>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Song Gao <gaosong@loongson.cn>, Thomas Huth <huth@tuxfamily.org>,
 Laurent Vivier <laurent@vivier.eu>, Huacai Chen <chenhuacai@kernel.org>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Aurelien Jarno <aurelien@aurel32.net>, Jason Wang <jasowang@redhat.com>,
 Jia Liu <proljc@gmail.com>, Stafford Horne <shorne@gmail.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Nicholas Piggin <npiggin@gmail.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 Harsh Prateek Bora <harshpb@linux.ibm.com>,
 Bin Meng <bin.meng@windriver.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Weiwei Li <liweiwei@iscas.ac.cn>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 David Hildenbrand <david@redhat.com>, Ilya Leoshkevich <iii@linux.ibm.com>,
 Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Eric Farman <farman@linux.ibm.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Magnus Damm <magnus.damm@gmail.com>,
 Artyom Tarasenko <atar4qemu@gmail.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony Perard <anthony.perard@citrix.com>, Paul Durrant <paul@xen.org>,
 Max Filippov <jcmvbkbc@gmail.com>, qemu-arm@nongnu.org,
 qemu-ppc@nongnu.org, qemu-riscv@nongnu.org, qemu-s390x@nongnu.org,
 xen-devel@lists.xenproject.org
Subject: [PATCH 22/45] hw/arm/aspeed: use qemu_configure_nic_device()
Date: Sun, 22 Oct 2023 16:51:37 +0100
Message-Id: <20231022155200.436340-23-dwmw2@infradead.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20231022155200.436340-1-dwmw2@infradead.org>
References: <20231022155200.436340-1-dwmw2@infradead.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by
 desiato.infradead.org. See http://www.infradead.org/rpr.html
Received-SPF: none client-ip=2001:8b0:10b:1:d65d:64ff:fe57:4e05;
 envelope-from=BATV+fd6248c3715d1825373b+7364+infradead.org+dwmw2@desiato.srs.infradead.org;
 helo=desiato.infradead.org
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: +s46Tlb0BEcm

From: David Woodhouse <dwmw@amazon.co.uk>

Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
---
 hw/arm/aspeed.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
index f8ba67531a..945ad97835 100644
--- a/hw/arm/aspeed.c
+++ b/hw/arm/aspeed.c
@@ -356,7 +356,6 @@ static void aspeed_machine_init(MachineState *machine)
     AspeedMachineClass *amc = ASPEED_MACHINE_GET_CLASS(machine);
     AspeedSoCClass *sc;
     int i;
-    NICInfo *nd = &nd_table[0];
 
     object_initialize_child(OBJECT(machine), "soc", &bmc->soc, amc->soc_name);
 
@@ -370,10 +369,10 @@ static void aspeed_machine_init(MachineState *machine)
                              &error_fatal);
 
     for (i = 0; i < sc->macs_num; i++) {
-        if ((amc->macs_mask & (1 << i)) && nd->used) {
-            qemu_check_nic_model(nd, TYPE_FTGMAC100);
-            qdev_set_nic_properties(DEVICE(&bmc->soc.ftgmac100[i]), nd);
-            nd++;
+        if ((amc->macs_mask & (1 << i)) &&
+            !qemu_configure_nic_device(DEVICE(&bmc->soc.ftgmac100[i]),
+                                       true, NULL)) {
+            break; /* No configs left; stop asking */
         }
     }
 
-- 
2.40.1

