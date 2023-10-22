Received: by 2002:a17:906:fc07:b0:9bd:85f7:2662 with SMTP id ov7csp865632ejb;
        Sun, 22 Oct 2023 08:56:40 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEP7kXV5Eci4DdY7miwgrIqrIbUI78EDqFMQqPmvkMDrd7lZ/zcIu3A6bpPK5xS1bSrhlQx
X-Received: by 2002:a05:620a:8011:b0:774:12ae:99be with SMTP id ee17-20020a05620a801100b0077412ae99bemr6844286qkb.44.1697990200660;
        Sun, 22 Oct 2023 08:56:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1697990200; cv=none;
        d=google.com; s=arc-20160816;
        b=XI3Y/eKOdCMv9aCPbJbkXufJx0F0kq7pXv9o2W7f59q510gYLLG77I5dz1T5VY3a0j
         q27Tk+48b25nyE+9L3btR93gU61ZFtqzDMBqQ9EvAjg0mDANB9Xe1CCIzsYqHLUukhF+
         6ddx5d6/GCo8/dBCF8Z+FjblT4UNRk9ZYeCai0BhIR9Zg6mFq6tD2T17yVBA/kQOiWCq
         qi9o/K/k+JjhwtT4+F1BJXEA9IahA9IcoyoFOKx8m6iq5jKLlk2rvEoO1DsHVUFig4ao
         H6mSnLGbXjqVTuGg8o3FjTp1K+4l4ISMhKBRbnZxwrGFqP8tOTFYYXXe0/cQ1WDYm64c
         RNzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=s5Drx3xmEDJsRgRm38xyzsjLMjErO3gIacS5Ec67mBM=;
        fh=fR25DIKCexhPQAp6aUdYi3uFJxEhZaxhhcNQofNVQl0=;
        b=TDFgjHCndvO2QKrVZeerBVZw0/JuRPnYSGZMRRXacl3szlVay5Movl9JvjdiiWNTzQ
         al9iegVreDXYEC1A2bHPagC9m1ezUbdhz47CrKHtY8d/7L2qUVSa7E3PjXBXD+8KG3p1
         VM4T8VMbxJG1qrXH7mnooTNfUhJSenfRam3OhS+cXSVzQV9fkjXSugeeonLCR6qaMmYz
         eFFTlfyaAnQFLuAde23CSLcRRexDrGIlKj9LJYcfobfgKznCigCtmEkm4iOV64wfjfYL
         GQo3CtwZu+nLJz0oSy1y+lfLb94EuGLxxM5YAs9ui2JNdY6sSZcGT1ULRBkM1tQttIbe
         HTxA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@infradead.org header.s=desiato.20200630 header.b=jLxyMvlZ;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w24-20020ae9e518000000b0077592d4c5afsi4156021qkf.767.2023.10.22.08.56.40
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 22 Oct 2023 08:56:40 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@infradead.org header.s=desiato.20200630 header.b=jLxyMvlZ;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1quam5-00078j-HN; Sun, 22 Oct 2023 11:53:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <BATV+fd6248c3715d1825373b+7364+infradead.org+dwmw2@desiato.srs.infradead.org>)
 id 1qualt-0006JD-4t; Sun, 22 Oct 2023 11:53:45 -0400
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <BATV+fd6248c3715d1825373b+7364+infradead.org+dwmw2@desiato.srs.infradead.org>)
 id 1qualr-0000Xi-Kz; Sun, 22 Oct 2023 11:53:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
 Reply-To:Content-Type:Content-ID:Content-Description;
 bh=s5Drx3xmEDJsRgRm38xyzsjLMjErO3gIacS5Ec67mBM=; b=jLxyMvlZFjPUMy/yrbuF+IwxBG
 YtISwVrFJbUvbkSa3ufHdry3ipr9jZv57ple8ejXshc1TqK6KeBgk1tn33pf/iMonjdGNXRBMLLbW
 QsXQ+RpGB2rID7pvfOOAzJkzDneCM5MJnNRW8KAr3tukpCPzMeYItvpF+RHDPzVhsWc9d3cxtZr0S
 niBPLOdLkUz7EtozjFMkXQy6dMi8ZQNDCmCYYQr4QNyjzokbyxMrb7tTVBpBDpIGF/zaTF9rDrXOZ
 lzK2vahVAdLaUXOligmlBDb4Seqg6tQG60vyFAqHR8VCDeN2voi4H4qlN+o4/DdSHN2E0kCxF9smY
 J1evSALg==;
Received: from [2001:8b0:10b:1::ebe] (helo=i7.infradead.org)
 by desiato.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
 id 1quakI-00DCmo-0W; Sun, 22 Oct 2023 15:53:37 +0000
Received: from dwoodhou by i7.infradead.org with local (Exim 4.96 #2 (Red Hat
 Linux)) id 1quakH-001qYx-2E; Sun, 22 Oct 2023 16:52:05 +0100
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
Subject: [PATCH 11/45] hw/loongarch: use pci_init_nic_devices()
Date: Sun, 22 Oct 2023 16:51:26 +0100
Message-Id: <20231022155200.436340-12-dwmw2@infradead.org>
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
X-TUID: C9+yGDOtMStL

From: David Woodhouse <dwmw@amazon.co.uk>

Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
---
 hw/loongarch/virt.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/hw/loongarch/virt.c b/hw/loongarch/virt.c
index 2952fe452e..9905e525b1 100644
--- a/hw/loongarch/virt.c
+++ b/hw/loongarch/virt.c
@@ -504,9 +504,7 @@ static void loongarch_devices_init(DeviceState *pch_pic, LoongArchMachineState *
     fdt_add_uart_node(lams);
 
     /* Network init */
-    for (i = 0; i < nb_nics; i++) {
-        pci_nic_init_nofail(&nd_table[i], pci_bus, mc->default_nic, NULL);
-    }
+    pci_init_nic_devices(pci_bus, mc->default_nic);
 
     /*
      * There are some invalid guest memory access.
-- 
2.40.1

