Received: by 2002:a17:907:9874:b0:a31:23a7:2a34 with SMTP id ko20csp1023675ejc;
        Fri, 26 Jan 2024 09:33:57 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGXqgxSg8JAUFjQcQSl2ug9uhaSs2OA/621nXDaUfhkyEETVdxE/uGaOC2uccfiSgCTQ9MH
X-Received: by 2002:a0d:d8d1:0:b0:5ff:83c3:d2e8 with SMTP id a200-20020a0dd8d1000000b005ff83c3d2e8mr241418ywe.2.1706290437194;
        Fri, 26 Jan 2024 09:33:57 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1706290437; cv=none;
        d=google.com; s=arc-20160816;
        b=gMbLlc+TjrrMEH+eF1KCXRO2c+SSO61xEtiBJrrvIAxPczTJPfAyBZx3nOF+laHp9J
         Qw6tS2r/cHp5nFIEGkn4rDJ+8gNcmdLgjP+9nYcBWeWrEp/9cE8T4uRStovNCdT2xq89
         d3EPCKGU5AdEen+c90mVfyuuyVPBTkqp1g2nxsCioP0UIzo+GVmkpgDHls8AW+VyMUTS
         hDj2kU9heqKZWeYwtGdP4aLKIDruYITpTuFjTpqbwkVQIhD4yXnIoZAgAVzHhqbnva6P
         53d+wSLLtgsQVGOiDMncqZ7K67fJLrsm0+Dx8Ra/tNpS/aeNXZmWX9j0DZ1sIxpMI1e/
         F8tA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:content-transfer-encoding:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:dkim-signature
         :precedence:errors-to:list-subscribe:list-help:list-post
         :list-unsubscribe:list-id;
        bh=C7nZq/xI+tHeWx5EE1R48ZvurCMfWCSLsOC+/dyJjdk=;
        fh=4aUA0JPxoVvgInBmJ96rXkS+v1RtLmlfy0HlzHtXDaI=;
        b=htPsGEGQTGK+mnt+uWUlnY5W9A4lWAnc5yYcifCwO1WsOF6flZkHyf67zKKvJ/LV5O
         GDXr4B5Pt8JnBg5cutF8vlu3Nu1+wibYES4whKkCS1nFAIwpujDUf8KwH4H+cZaC7k7E
         ejY3UrZaas2wdq2n4PZjLOtkMGiCUTUZjg+hS6+rX5DBmx6+jyoSNvo8ZA9do2s6DYq8
         PrrgomL0XMUprhAGg6eCNdxiQjqaL5MSqsTSujwAkJ/UXaf8bULrBKb75JF+brlcBonQ
         eSbACmvzmaDCnG4RCQSVqjYfo58g1r6xnMk+QoCyNbAnKNb9/kzOuyOq/N21BK6Ko7Bc
         I9og==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@infradead.org header.s=casper.20170209 header.b=Rv2CQRFK;
       spf=pass (google.com: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Return-Path: <xen-devel-bounces@lists.xenproject.org>
Received: from lists.xenproject.org (lists.xenproject.org. [192.237.175.120])
        by mx.google.com with ESMTPS id j134-20020a81928c000000b00602cf3e184bsi821078ywg.313.2024.01.26.09.33.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Jan 2024 09:33:57 -0800 (PST)
Received-SPF: pass (google.com: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) client-ip=192.237.175.120;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@infradead.org header.s=casper.20170209 header.b=Rv2CQRFK;
       spf=pass (google.com: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.672257.1046075 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rTQ4j-0005Eg-1Z; Fri, 26 Jan 2024 17:33:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 672257.1046075; Fri, 26 Jan 2024 17:33:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rTQ4i-0005CN-OI; Fri, 26 Jan 2024 17:33:08 +0000
Received: by outflank-mailman (input) for mailman id 672257;
 Fri, 26 Jan 2024 17:33:07 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=bPDA=JE=casper.srs.infradead.org=BATV+7caeb094913322f6f00d+7460+infradead.org+dwmw2@srs-se1.protection.inumbo.net>)
 id 1rTQ4h-0004Zo-6K
 for xen-devel@lists.xenproject.org; Fri, 26 Jan 2024 17:33:07 +0000
Received: from casper.infradead.org (casper.infradead.org
 [2001:8b0:10b:1236::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f6d80c20-bc70-11ee-8a43-1f161083a0e0;
 Fri, 26 Jan 2024 18:33:06 +0100 (CET)
Received: from [2001:8b0:10b:1::ebe] (helo=i7.infradead.org)
 by casper.infradead.org with esmtpsa (Exim 4.97.1 #2 (Red Hat Linux))
 id 1rTQ48-0000000EKUI-0c8R; Fri, 26 Jan 2024 17:32:33 +0000
Received: from dwoodhou by i7.infradead.org with local (Exim 4.97.1 #2 (Red
 Hat Linux)) id 1rTQ47-00000001elY-26Lp;
 Fri, 26 Jan 2024 17:32:31 +0000
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
X-Inumbo-ID: f6d80c20-bc70-11ee-8a43-1f161083a0e0
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Sender:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description;
	bh=C7nZq/xI+tHeWx5EE1R48ZvurCMfWCSLsOC+/dyJjdk=; b=Rv2CQRFKPPyrLZD67SGNqYuyb4
	GvyhT2YW0gHDow6GwIwtyMr2T8XDpGhiLDkpIl+LXPq+vSjs0xaTXC+C74GqqFjOdKKzCFWOAiahT
	sB76ExMjIfNhDo8gW1z6wgV68rgmcMG4plTG+aLERSxf4tHclfLIDHVltLbw+RQlVWpSbibrqC2GF
	3uQFm4GMwabqQE8hart4kFuZ7fOEhqfwFwZSBirP2coHxK0N9D+He1wdqV4EOu/exOaJ0CeuSiv8d
	0QWonbluFTzgv8d7fMKsnELacrNO1B0NTYqWGfdq2WJbIyHawk7Lua4tuq9/zG54YfsC3sHvnIYsa
	u3kXcdGQ==;
From: David Woodhouse <dwmw2@infradead.org>
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
	Beniamino Galvani <b.galvani@gmail.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Strahinja Jankovic <strahinja.p.jankovic@gmail.com>,
	Niek Linnenbank <nieklinnenbank@gmail.com>,
	=?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	Joel Stanley <joel@jms.id.au>,
	Igor Mitsyanko <i.mitsyanko@gmail.com>,
	Jean-Christophe Dubois <jcd@tribudubois.net>,
	Andrey Smirnov <andrew.smirnov@gmail.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Subbaraya Sundeep <sundeep.lkml@gmail.com>,
	Jan Kiszka <jan.kiszka@web.de>,
	Tyrone Ting <kfting@nuvoton.com>,
	Hao Wu <wuhaotsh@google.com>,
	Radoslaw Biernacki <rad@semihalf.com>,
	Leif Lindholm <quic_llindhol@quicinc.com>,
	Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	Alistair Francis <alistair@alistair23.me>,
	Helge Deller <deller@gmx.de>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Eduardo Habkost <eduardo@habkost.net>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Song Gao <gaosong@loongson.cn>,
	Thomas Huth <huth@tuxfamily.org>,
	Laurent Vivier <laurent@vivier.eu>,
	Huacai Chen <chenhuacai@kernel.org>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	=?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
	Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
	Aurelien Jarno <aurelien@aurel32.net>,
	Jason Wang <jasowang@redhat.com>,
	Jia Liu <proljc@gmail.com>,
	Stafford Horne <shorne@gmail.com>,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	Nicholas Piggin <npiggin@gmail.com>,
	Daniel Henrique Barboza <danielhb413@gmail.com>,
	David Gibson <david@gibson.dropbear.id.au>,
	Harsh Prateek Bora <harshpb@linux.ibm.com>,
	Bin Meng <bin.meng@windriver.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Weiwei Li <liwei1518@gmail.com>,
	Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
	Halil Pasic <pasic@linux.ibm.com>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Eric Farman <farman@linux.ibm.com>,
	David Hildenbrand <david@redhat.com>,
	Ilya Leoshkevich <iii@linux.ibm.com>,
	Yoshinori Sato <ysato@users.sourceforge.jp>,
	Magnus Damm <magnus.damm@gmail.com>,
	Artyom Tarasenko <atar4qemu@gmail.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Anthony Perard <anthony.perard@citrix.com>,
	Paul Durrant <paul@xen.org>,
	Max Filippov <jcmvbkbc@gmail.com>,
	qemu-arm@nongnu.org,
	qemu-ppc@nongnu.org,
	qemu-riscv@nongnu.org,
	qemu-s390x@nongnu.org,
	xen-devel@lists.xenproject.org,
	David Woodhouse <dwmw@amazon.co.uk>,
	Thomas Huth <thuth@redhat.com>
Subject: [PATCH v4 07/47] hw/alpha/dp264: use pci_init_nic_devices()
Date: Fri, 26 Jan 2024 17:24:44 +0000
Message-ID: <20240126173228.394202-8-dwmw2@infradead.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240126173228.394202-1-dwmw2@infradead.org>
References: <20240126173228.394202-1-dwmw2@infradead.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: David Woodhouse <dwmw2@infradead.org>
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by casper.infradead.org. See http://www.infradead.org/rpr.html
X-TUID: c1abY4wyL3Gp

From: David Woodhouse <dwmw@amazon.co.uk>

Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
Reviewed-by: Thomas Huth <thuth@redhat.com>
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
2.43.0

