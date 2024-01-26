Received: by 2002:a17:907:9874:b0:a31:23a7:2a34 with SMTP id ko20csp1024747ejc;
        Fri, 26 Jan 2024 09:35:56 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHXsTIs54HAvgEMApcdL2o3T+yl9D0VJDuOW8LZyvL4E7pUkbP3OeUrk7sOSRuMczEPYfuS
X-Received: by 2002:a05:6214:21c9:b0:686:ab9a:e5ec with SMTP id d9-20020a05621421c900b00686ab9ae5ecmr152127qvh.116.1706290556329;
        Fri, 26 Jan 2024 09:35:56 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1706290556; cv=none;
        d=google.com; s=arc-20160816;
        b=ZU0F1+m/pUT4jZcpkzJ/AE13SnLRFyFS6lHJseb/3xVuISoyUrXlAONgTJonzNeHdJ
         RReCXZgIGYPyZRGyeLs7aPoOdRiECOdAYOrLpjRVrV0A59agYYOe1qkMA+vchVDcGH9g
         W3tjJE93+0pYQODL+oFtyB89yRwYEtdOKhzZDPsFx9lGe3mSXj9OlBPQN2AsI2uTXkJ1
         CPBRFWVVkczc0CDJVZ39T14YRQ240MNy9hOErx9IcJup9QbLVB185j8pjTnCHaxQgMs8
         acWpfHPNFfBNMky8ObIj/FxsVbfRRyPK3zHQBSYVjUoYcFapB2j+/BZVp2XUhYXKfDuh
         i4aw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=35K3x9bzhCjbbLdjF5dN7+yX0Fl3u32uZ8IZYdqJ3uI=;
        fh=4aUA0JPxoVvgInBmJ96rXkS+v1RtLmlfy0HlzHtXDaI=;
        b=synv5xLyjK1PPqSxR205NJM0SqcpNgHTFeZ6khrE09UHhCcQsT6CWhyHzwBW5QPkXh
         ZqwjURG6gZCB+LOPXMygkLRFblmhCTUUn8HDZKPYNllYu76t/1WqGQzb2up262vBp8bv
         /0OpIxXICJ24++BMwfwlhNZhjK8w/IChGDABjyWZbTPsmZF93EnBqmjE5c+GFQZVMMfh
         d1HXdsWA7o35yKB3ZCEpoIYpNrLnjpFhTUNLPwXjprRU4y9lcqi1qwwBLNaHsyntKEdj
         WqphpLGKDKly8oooWsz9hTrF9yxX2qAfZ0+izlji6Bzy56mgVHlwLizU3RTKiO1QxAwu
         lDBA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@infradead.org header.s=desiato.20200630 header.b="SjwcI8/Z";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id jm10-20020ad45eca000000b00681748ab7fcsi1751998qvb.584.2024.01.26.09.35.56
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 26 Jan 2024 09:35:56 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@infradead.org header.s=desiato.20200630 header.b="SjwcI8/Z";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1rTQ67-0002Kj-EO; Fri, 26 Jan 2024 12:34:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <BATV+5cc348fc898a3f56ac6c+7460+infradead.org+dwmw2@desiato.srs.infradead.org>)
 id 1rTQ5Q-00009c-Sr; Fri, 26 Jan 2024 12:33:55 -0500
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <BATV+5cc348fc898a3f56ac6c+7460+infradead.org+dwmw2@desiato.srs.infradead.org>)
 id 1rTQ5O-0001jP-C4; Fri, 26 Jan 2024 12:33:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
 Reply-To:Content-Type:Content-ID:Content-Description;
 bh=35K3x9bzhCjbbLdjF5dN7+yX0Fl3u32uZ8IZYdqJ3uI=; b=SjwcI8/ZrGiWVLtebxiNKU3HJn
 F9DTWPcWeEU56094MWLaRaa5riRksyguKuY8LjPhRBfeWZcSMoS8brp+m4iYWK/ziHgts8Q+XFryo
 Cna3lZrNMiZYDdEiJiRx8BFXycJtdSF7jNSenQgX0Nyv512kZ6mzzQfXm8w+m47m+eKlSVxUnHMjj
 3AVmX2Vi4En0Bzk21re4nbWKicTRsqcVdilxS7tHAYLW2c3CBfJTgSyrrWMut4qFjEYO6hgKVf+h+
 o2xt8ao62i756IKOYu7aS/z2HKwtFIkjYDiGGRbuy33CuwlqHkTj3hoM4jzPH7Nxd8Ec4DqbrJL1u
 KmW3Irjw==;
Received: from [2001:8b0:10b:1::ebe] (helo=i7.infradead.org)
 by desiato.infradead.org with esmtpsa (Exim 4.97.1 #2 (Red Hat Linux))
 id 1rTQ4A-000000069Ul-1eWe; Fri, 26 Jan 2024 17:32:35 +0000
Received: from dwoodhou by i7.infradead.org with local (Exim 4.97.1 #2 (Red
 Hat Linux)) id 1rTQ48-00000001emB-3EtP;
 Fri, 26 Jan 2024 17:32:32 +0000
From: David Woodhouse <dwmw2@infradead.org>
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Beniamino Galvani <b.galvani@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Strahinja Jankovic <strahinja.p.jankovic@gmail.com>,
 Niek Linnenbank <nieklinnenbank@gmail.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Andrew Jeffery <andrew@codeconstruct.com.au>,
 Joel Stanley <joel@jms.id.au>, Igor Mitsyanko <i.mitsyanko@gmail.com>,
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
 Weiwei Li <liwei1518@gmail.com>, Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Eric Farman <farman@linux.ibm.com>, David Hildenbrand <david@redhat.com>,
 Ilya Leoshkevich <iii@linux.ibm.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Magnus Damm <magnus.damm@gmail.com>,
 Artyom Tarasenko <atar4qemu@gmail.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony Perard <anthony.perard@citrix.com>, Paul Durrant <paul@xen.org>,
 Max Filippov <jcmvbkbc@gmail.com>, qemu-arm@nongnu.org,
 qemu-ppc@nongnu.org, qemu-riscv@nongnu.org, qemu-s390x@nongnu.org,
 xen-devel@lists.xenproject.org, David Woodhouse <dwmw@amazon.co.uk>,
 Thomas Huth <thuth@redhat.com>
Subject: [PATCH v4 20/47] hw/xtensa/virt: use pci_init_nic_devices()
Date: Fri, 26 Jan 2024 17:24:57 +0000
Message-ID: <20240126173228.394202-21-dwmw2@infradead.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240126173228.394202-1-dwmw2@infradead.org>
References: <20240126173228.394202-1-dwmw2@infradead.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by
 desiato.infradead.org. See http://www.infradead.org/rpr.html
Received-SPF: none client-ip=2001:8b0:10b:1:d65d:64ff:fe57:4e05;
 envelope-from=BATV+5cc348fc898a3f56ac6c+7460+infradead.org+dwmw2@desiato.srs.infradead.org;
 helo=desiato.infradead.org
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001, SPF_NONE=0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: gx/3PqJDhcjC

From: David Woodhouse <dwmw@amazon.co.uk>

Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
Reviewed-by: Thomas Huth <thuth@redhat.com>
---
 hw/xtensa/virt.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/hw/xtensa/virt.c b/hw/xtensa/virt.c
index a6cf646e99..5310a88861 100644
--- a/hw/xtensa/virt.c
+++ b/hw/xtensa/virt.c
@@ -102,9 +102,7 @@ static void create_pcie(MachineState *ms, CPUXtensaState *env, int irq_base,
 
     pci = PCI_HOST_BRIDGE(dev);
     if (pci->bus) {
-        for (i = 0; i < nb_nics; i++) {
-            pci_nic_init_nofail(&nd_table[i], pci->bus, mc->default_nic, NULL);
-        }
+        pci_init_nic_devices(pci->bus, mc->default_nic);
     }
 }
 
-- 
2.43.0

