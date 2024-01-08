Received: by 2002:a17:906:6951:b0:a28:f940:7a27 with SMTP id c17csp4106ejs;
        Mon, 8 Jan 2024 12:50:58 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFcE4m1FpVmU0+8Z1NmVgvVSJLJh3RBCb3+WzsJf/uaRZggjHVgAjdxJJw5gtleOReL95II
X-Received: by 2002:a05:620a:205b:b0:783:18c7:27fa with SMTP id d27-20020a05620a205b00b0078318c727famr3963831qka.61.1704747058386;
        Mon, 08 Jan 2024 12:50:58 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1704747058; cv=none;
        d=google.com; s=arc-20160816;
        b=NKjOBDET+7ZovCLjHN9dALl/fDbruKLvYDL+GKdX9/Y14HICEqefVr6jvMPICrGNbR
         ZYAT7323mbbkDVc2T6BqKVcoFjg7tjL+7rAuR5eAM4oExdABzzEMkjG3WGIJxqhvq9uj
         dkmp3bVA3BWVmyjF6aauFDAxwT2+LGgxtLah1fa0WtZtQp2BLmoefiTUpNT7HkA5T8FN
         vyg69/q778jekv4KJV44iQN3t/IJzBgqwBWNBzNEF4ttpqwUHe4jb+GuJZXQH9jEJ3Y7
         6OnKDkEGGG0htbf1zZsk6p8rJMvGpbk5me+KevjrZyYw8nEF+yshqgzwfpljikcYpZ3n
         Uykg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=bVGb2+EtT3pxaWvqPLp7baiGIuRpc42koRGOsdWnaUk=;
        fh=LeOBNGHwoQQCylLh9v89P/OdTUx8jmDchZ7fstdYfbc=;
        b=JwTBLtw5xJ+it5gYvab0yYV8a7bSg/IKh0LZ/SW/JPTFDy75/uu7sN6duitz5+UiZM
         iyW4RyxA69No4751/1P849oTTXWAwggbnMy4q7d+M32STPLCmXU9zxKUa06fjeILbbAU
         PIkTJgbBpP2xF0g03XGaKCGyTWOdAV3z0qQFhx5tYFRhlWLgMIenlUMzNn5+e6LpyqdL
         W2ghWUy217YyitucFvs0X7zo9KOeGqU8p7qH9XdnbnPJmjDAKJwVeu8dh4DQfLYIUC06
         Mfpygh5FtlG968IKSFnXEQRxuwIcuVov/QkdGQZmQlD9HgvHO0PY2W2alWoPryq31zyt
         VMZg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@infradead.org header.s=casper.20170209 header.b=X43RH9Ab;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v9-20020a05620a440900b007831be1087esi551434qkp.655.2024.01.08.12.50.58
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 08 Jan 2024 12:50:58 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@infradead.org header.s=casper.20170209 header.b=X43RH9Ab;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rMwa9-0004aq-OR; Mon, 08 Jan 2024 15:50:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <BATV+41a72dc6539c0dfbbc31+7442+infradead.org+dwmw2@casper.srs.infradead.org>)
 id 1rMwZY-0003ny-GQ; Mon, 08 Jan 2024 15:50:13 -0500
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <BATV+41a72dc6539c0dfbbc31+7442+infradead.org+dwmw2@casper.srs.infradead.org>)
 id 1rMwZE-0000ur-4G; Mon, 08 Jan 2024 15:50:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Sender:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
 Reply-To:Content-Type:Content-ID:Content-Description;
 bh=bVGb2+EtT3pxaWvqPLp7baiGIuRpc42koRGOsdWnaUk=; b=X43RH9AbD3fJNnSNp6zj09ltf+
 fnPjYoNKw/LCY4sLAJ0XSEgh2X0VrFVEH2/Vut01+TVDf27LqToIk4nMKZKNqcKYg2oSynHVvXXd3
 wmrcu6hDmlyRPIBBAhnwoSo8bNOJnWilocaH9Nm2K412zDTBq7bBxjJNgwltO0TK0jSQIuEkSb7aL
 Se/tAWZ770hs5e0RuJ33snAwDjPCpEgSuAWLwbQ5i6aeZt/wzTtrrt7by0kkrFLSSHIJsEcXIrnDR
 cmTyzT+yDJWk2Zpn1SCxFDMawd09aFiLD+4f2rSXJou7fbzNwluCxx0N+7DjZKEkPZkMnpmt+Tj1W
 cOTGJ6pg==;
Received: from [2001:8b0:10b:1::ebe] (helo=i7.infradead.org)
 by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1rMwYi-008RPS-8o; Mon, 08 Jan 2024 20:49:21 +0000
Received: from dwoodhou by i7.infradead.org with local (Exim 4.96.2 #2 (Red
 Hat Linux)) id 1rMwYi-002NEN-37; Mon, 08 Jan 2024 20:49:20 +0000
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
 xen-devel@lists.xenproject.org, David Woodhouse <dwmw@amazon.co.uk>
Subject: [PATCH v3 07/46] hw/alpha/dp264: use pci_init_nic_devices()
Date: Mon,  8 Jan 2024 20:26:36 +0000
Message-ID: <20240108204909.564514-8-dwmw2@infradead.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240108204909.564514-1-dwmw2@infradead.org>
References: <20240108204909.564514-1-dwmw2@infradead.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by
 casper.infradead.org. See http://www.infradead.org/rpr.html
Received-SPF: none client-ip=2001:8b0:10b:1236::1;
 envelope-from=BATV+41a72dc6539c0dfbbc31+7442+infradead.org+dwmw2@casper.srs.infradead.org;
 helo=casper.infradead.org
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001, SPF_NONE=0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: 7R/bM0oRdeDU

From: David Woodhouse <dwmw@amazon.co.uk>

Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
---
 hw/alpha/dp264.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/hw/alpha/dp264.c b/hw/alpha/dp264.c
index 03495e1e60..52a1fa310b 100644
--- a/hw/alpha/dp264.c
+++ b/hw/alpha/dp264.c
@@ -124,9 +124,7 @@ static void clipper_init(MachineState *machine)
     pci_vga_init(pci_bus);
 
     /* Network setup.  e1000 is good enough, failing Tulip support.  */
-    for (i = 0; i < nb_nics; i++) {
-        pci_nic_init_nofail(&nd_table[i], pci_bus, mc->default_nic, NULL);
-    }
+    pci_init_nic_devices(pci_bus, mc->default_nic);
 
     /* Super I/O */
     isa_create_simple(isa_bus, TYPE_SMC37C669_SUPERIO);
-- 
2.41.0

