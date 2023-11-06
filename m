Received: by 2002:a17:906:33ce:b0:9d0:bf65:29fa with SMTP id w14csp3004459eja;
        Mon, 6 Nov 2023 11:56:32 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFoIhz6ic4TWirwHc1TB0kHFXzO0cm5DhKTGQUyLLOy+iYl0OBvSNd0ecc8NBsnWAhLMJq8
X-Received: by 2002:a05:620a:608c:b0:772:5300:1c3d with SMTP id dx12-20020a05620a608c00b0077253001c3dmr35683191qkb.0.1699300591908;
        Mon, 06 Nov 2023 11:56:31 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1699300591; cv=none;
        d=google.com; s=arc-20160816;
        b=t9ZpsgVhcKxXZ4K7oJ2AGWa9fkYouFgjUHEqkH8jSeaem3/OEnhCrKYEc6lmaHwMOg
         XTvnOIYJqJ8z29T5/jjcJ/XtZjaWsxUDQUJ5lSNy+MVrclXYRJjwo7Y4sIrX95JkbNuX
         aD5wneBTPfLQ0bl+aD5GgFIMkokEqVRE0uicAFSTg2kwoyjSs1Fk4f9MTkLjLCSgtzjJ
         qoOY/F914PSXcsFkRzOdL+6zkJB+2nh+WtOJVJU+MNhdZGX5f2y3oqh17O9n+29vd9KA
         IJfS/MIe2eriV4MVU6PeN2jX8Z1wstxtPAwH36OnGrEl5vmTUvpbWnVLVGwIJCSGRNng
         QP+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:content-transfer-encoding:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:dkim-signature
         :precedence:errors-to:list-subscribe:list-help:list-post
         :list-unsubscribe:list-id;
        bh=uI6218d08/cSOBxZVhTlSem5C3AVIU6Zm5P1V+8LsMo=;
        fh=aO0iHn1gEkY7cXLX0OqpYrk+6ZrDWUTepWYzJsBxj6U=;
        b=ZNCPd/o/QvyTLWcgr+ca+TtRrRA7tdcTglLQWHPN8PK+tgh54IF9b0vsclHGs8yRnN
         JULMwl4NEmLG/Xig8/gNEvz6IuAsoPTw+fpTBJU2MSw7JkPmZTRTy21K5gOs4LCVmLUR
         e92IUukNKSiSEedQv+VXUL5qpCuS1vh0lesXh7TAfWnPPRkce8sgmVK3FGvYYrx5Po3p
         q8K8ni3ROkYf/j9juUfzcX6MNPw59EMA5fKMOKObXq81rT4zvzVn3KMjzjw6yaX7mwzv
         9NiALDa2Chvf10lM+46kW4L6w5PvaP6D1xN8KAQhtyNwhhgys6SE5ru7v/9+VfxSD6vN
         1Fiw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@infradead.org header.s=desiato.20200630 header.b=WtaXpx9c;
       spf=pass (google.com: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Return-Path: <xen-devel-bounces@lists.xenproject.org>
Received: from lists.xenproject.org (lists.xenproject.org. [192.237.175.120])
        by mx.google.com with ESMTPS id o5-20020a05620a0d4500b0077892f61ac1si5671983qkl.616.2023.11.06.11.56.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Nov 2023 11:56:31 -0800 (PST)
Received-SPF: pass (google.com: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) client-ip=192.237.175.120;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@infradead.org header.s=desiato.20200630 header.b=WtaXpx9c;
       spf=pass (google.com: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.628284.979561 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r05hA-0001ft-Jx; Mon, 06 Nov 2023 19:55:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 628284.979561; Mon, 06 Nov 2023 19:55:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r05hA-0001ed-EX; Mon, 06 Nov 2023 19:55:36 +0000
Received: by outflank-mailman (input) for mailman id 628284;
 Mon, 06 Nov 2023 19:55:35 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nwd5=GT=desiato.srs.infradead.org=BATV+aa7b7dce24b49c47a83c+7379+infradead.org+dwmw2@srs-se1.protection.inumbo.net>)
 id 1r05h9-0001Ig-SM
 for xen-devel@lists.xenproject.org; Mon, 06 Nov 2023 19:55:35 +0000
Received: from desiato.infradead.org (desiato.infradead.org
 [2001:8b0:10b:1:d65d:64ff:fe57:4e05])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 716d20eb-7cde-11ee-9b0e-b553b5be7939;
 Mon, 06 Nov 2023 20:55:32 +0100 (CET)
Received: from [2001:8b0:10b:1::ebe] (helo=i7.infradead.org)
 by desiato.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
 id 1r05fb-00AkFg-2j; Mon, 06 Nov 2023 19:54:00 +0000
Received: from dwoodhou by i7.infradead.org with local (Exim 4.96.2 #2 (Red
 Hat Linux)) id 1r05fa-001GNP-1V; Mon, 06 Nov 2023 19:53:58 +0000
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
X-Inumbo-ID: 716d20eb-7cde-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description;
	bh=uI6218d08/cSOBxZVhTlSem5C3AVIU6Zm5P1V+8LsMo=; b=WtaXpx9cIFo6D4kvZ4SvG6Jpwi
	huHya+dPj7gspQwnLSmS8IcuiymPUGIbVtWUYp+tn2sSPqQ39hpf8NKj5Fv4Qn4Xh2X1KpqyBuy6N
	UgLyt6y3hKX34eMU751rQvNIeLwCW5sWc+e/M3L//QoEc6ix/gqGabboJtdpAfVxeXqUwBGM+O2Pj
	3l+9UfAjMgVHmMxuOQ6FqzlCWIDup1I1lkXLmfK4w+/AipVM+FmSdbLcZ/YAPzEphLZpMS+0gY1nd
	h83gKCHLz8HoPJ00cC8OkRQx+R/d2X0CcVy6RUzEW6YdS3kp7omu4vE181J99lrxG+KMKclsPcC1I
	SUBIG5vQ==;
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
	"Michael S. Tsirkin" <mst@redhat.com>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Eduardo Habkost <eduardo@habkost.net>,
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
	Weiwei Li <liweiwei@iscas.ac.cn>,
	Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
	David Hildenbrand <david@redhat.com>,
	Ilya Leoshkevich <iii@linux.ibm.com>,
	Halil Pasic <pasic@linux.ibm.com>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Eric Farman <farman@linux.ibm.com>,
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
	xen-devel@lists.xenproject.org
Subject: [PATCH for-8.3 v2 13/46] hw/mips/malta: use pci_init_nic_devices()
Date: Mon,  6 Nov 2023 19:49:18 +0000
Message-ID: <20231106195352.301038-14-dwmw2@infradead.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231106195352.301038-1-dwmw2@infradead.org>
References: <20231106195352.301038-1-dwmw2@infradead.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: David Woodhouse <dwmw2@infradead.org>
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by desiato.infradead.org. See http://www.infradead.org/rpr.html
X-TUID: lTQMEsR8U5Fb

From: David Woodhouse <dwmw@amazon.co.uk>

The Malta board setup code would previously place the first NIC into PCI
slot 11 if was a PCNet card, and the rest (including the first if it was
anything other than a PCNet card) would be dynamically assigned.

Now it will place any PCNet NIC into slot 11, and then anything else will
be dynamically assigned.

Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
---
 hw/mips/malta.c | 15 +++------------
 1 file changed, 3 insertions(+), 12 deletions(-)

diff --git a/hw/mips/malta.c b/hw/mips/malta.c
index 049de46a9e..0998d94053 100644
--- a/hw/mips/malta.c
+++ b/hw/mips/malta.c
@@ -605,18 +605,9 @@ static MaltaFPGAState *malta_fpga_init(MemoryRegion *address_space,
 /* Network support */
 static void network_init(PCIBus *pci_bus)
 {
-    int i;
-
-    for (i = 0; i < nb_nics; i++) {
-        NICInfo *nd = &nd_table[i];
-        const char *default_devaddr = NULL;
-
-        if (i == 0 && (!nd->model || strcmp(nd->model, "pcnet") == 0))
-            /* The malta board has a PCNet card using PCI SLOT 11 */
-            default_devaddr = "0b";
-
-        pci_nic_init_nofail(nd, pci_bus, "pcnet", default_devaddr);
-    }
+    /* The malta board has a PCNet card using PCI SLOT 11 */
+    pci_init_nic_in_slot(pci_bus, "pcnet", NULL, "0b");
+    pci_init_nic_devices(pci_bus, "pcnet");
 }
 
 static void bl_setup_gt64120_jump_kernel(void **p, uint64_t run_addr,
-- 
2.41.0

