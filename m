Received: by 2002:a17:906:fc07:b0:9bd:85f7:2662 with SMTP id ov7csp865000ejb;
        Sun, 22 Oct 2023 08:55:05 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH061d6LdcUQ6aII8ahhmGzhRgD47I8PBrAh8G5l7W37yL95yZei8ZojTbb0dow83sG5Q24
X-Received: by 2002:a05:6830:459c:b0:6c0:c1ba:8f78 with SMTP id az28-20020a056830459c00b006c0c1ba8f78mr6799578otb.0.1697990105445;
        Sun, 22 Oct 2023 08:55:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1697990105; cv=none;
        d=google.com; s=arc-20160816;
        b=jpJe8k0vRSa7NzLsmujaCsGh4fotYSIk62KWKYDVfwzNyygwyt4Oz4lsyM7/Z3Iq8l
         Fm3PZjFEfNjLlrBsBSfrj/g1kH13IWgUWprelMhf7jKKJNTREg0cUYKOV8Ep8+4CspkP
         FIw2YcI4px9nlHirDY9INIbTv4gwSYqQrDom7N8MUD/Qw6qS44TwMs66z2YSr53kXRYY
         jm3hMNhhWqHgUTcy6t6runO7UGromD8yDrAss2xJJD6d8HWZQBDR5sQrwZNuJZh2Dq+O
         /0gVVqQxBJ4nzEq+tbySxk4XrlXfylmj35To0X31Rw0D+fAkkIdI/4vLlwrAFzSDnbfk
         bVrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:content-transfer-encoding:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:dkim-signature
         :precedence:errors-to:list-subscribe:list-help:list-post
         :list-unsubscribe:list-id;
        bh=MzNB1kB+MKKgmKuvdGyjwRqbOWNmdCGP24EVU4gbBKs=;
        fh=fR25DIKCexhPQAp6aUdYi3uFJxEhZaxhhcNQofNVQl0=;
        b=GlH0RvpZjZbDY8tXklqwg9tZd/6A+OputOxZbbg2EZV0xmiC2cLRm1QJL7OtSNEXwh
         FmNAkgytvi7r/t/DNMp32UyRoh9K4Y2wYIigDmFh09MPLFUGVUks/ty1CKwdUmpX8mNA
         2Zjt19MB3hjsa3I5+HINwHdy5ckrW8urEg1RWEKR+Mn7lUbO+39bc2Tlg1c6GQlOL8fv
         v4i6V8O2NS008uOCZFTJ9A5Ct2ZruvclAHoEESd0y6pw2G8PFgQunBbh7ymPxAUyoNGQ
         3HPAvbiHUFgVWUgUufFkGZmQJSmnr/fO27XLgXdFaXHKhbp/H7q27Uy2W6y+HinbDbku
         oglA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@infradead.org header.s=casper.20170209 header.b=BOTpbmEh;
       spf=pass (google.com: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Return-Path: <xen-devel-bounces@lists.xenproject.org>
Received: from lists.xenproject.org (lists.xenproject.org. [192.237.175.120])
        by mx.google.com with ESMTPS id s64-20020a818243000000b005a7b8fe7b32si4662642ywf.230.2023.10.22.08.55.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Oct 2023 08:55:05 -0700 (PDT)
Received-SPF: pass (google.com: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) client-ip=192.237.175.120;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@infradead.org header.s=casper.20170209 header.b=BOTpbmEh;
       spf=pass (google.com: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.620672.966326 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1quam2-0000di-L4; Sun, 22 Oct 2023 15:53:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 620672.966326; Sun, 22 Oct 2023 15:53:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1quam2-0000bC-2w; Sun, 22 Oct 2023 15:53:54 +0000
Received: by outflank-mailman (input) for mailman id 620672;
 Sun, 22 Oct 2023 15:53:51 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=zZR7=GE=casper.srs.infradead.org=BATV+88d8721f4af1339c2fab+7364+infradead.org+dwmw2@srs-se1.protection.inumbo.net>)
 id 1qualz-0006wY-Jo
 for xen-devel@lists.xenproject.org; Sun, 22 Oct 2023 15:53:51 +0000
Received: from casper.infradead.org (casper.infradead.org
 [2001:8b0:10b:1236::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 304069e3-70f3-11ee-98d5-6d05b1d4d9a1;
 Sun, 22 Oct 2023 17:53:48 +0200 (CEST)
Received: from [2001:8b0:10b:1::ebe] (helo=i7.infradead.org)
 by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1quakL-008TGu-DD; Sun, 22 Oct 2023 15:52:09 +0000
Received: from dwoodhou by i7.infradead.org with local (Exim 4.96 #2 (Red Hat
 Linux)) id 1quakK-001qay-20; Sun, 22 Oct 2023 16:52:08 +0100
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
X-Inumbo-ID: 304069e3-70f3-11ee-98d5-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Sender:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description;
	bh=MzNB1kB+MKKgmKuvdGyjwRqbOWNmdCGP24EVU4gbBKs=; b=BOTpbmEhw9k8na/d3I1AbUe9b0
	E6G1Hj4USM9BvQ+F5xHHrxW1V2tmkvERcHo7d3FZ0Tv/uakTSMvIgZQqIcBtApttgEXq386rStogT
	NGtg59PSjG5qFluXSFVO+sAKemnE8U5ELEDGh1lS2gmYwSKkiPgrS55f2AofdoM6u3I1bGJrXl5ba
	xtTsjXmpZ4r05MqdxLNIFbmAxC8Uesnf2zu3wqnZtY34+ASHLO5qR+YC6Q8NgyQalK6K8L4i9FDzq
	dcEGLBKoVLWBDlgqQzAibSQxsnFGGMY+PV30dzPBeZf1vCuuNDbk+0qYFREsNCyFY8a1BTbrIBcce
	DMLchh8Q==;
From: David Woodhouse <dwmw2@infradead.org>
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
	Beniamino Galvani <b.galvani@gmail.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Strahinja Jankovic <strahinja.p.jankovic@gmail.com>,
	Niek Linnenbank <nieklinnenbank@gmail.com>,
	=?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
	Andrew Jeffery <andrew@aj.id.au>,
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
Subject: [PATCH 39/45] hw/s390x/s390-virtio-ccw: use qemu_create_nic_device()
Date: Sun, 22 Oct 2023 16:51:54 +0100
Message-Id: <20231022155200.436340-40-dwmw2@infradead.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20231022155200.436340-1-dwmw2@infradead.org>
References: <20231022155200.436340-1-dwmw2@infradead.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: David Woodhouse <dwmw2@infradead.org>
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by casper.infradead.org. See http://www.infradead.org/rpr.html
X-TUID: sLpk6BLsxNvW

From: David Woodhouse <dwmw@amazon.co.uk>

Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
---
 hw/s390x/s390-virtio-ccw.c | 11 ++---------
 1 file changed, 2 insertions(+), 9 deletions(-)

diff --git a/hw/s390x/s390-virtio-ccw.c b/hw/s390x/s390-virtio-ccw.c
index 2d75f2131f..b8b8a2a201 100644
--- a/hw/s390x/s390-virtio-ccw.c
+++ b/hw/s390x/s390-virtio-ccw.c
@@ -217,16 +217,9 @@ static void s390_init_ipl_dev(const char *kernel_filename,
 
 static void s390_create_virtio_net(BusState *bus, const char *name)
 {
-    int i;
-
-    for (i = 0; i < nb_nics; i++) {
-        NICInfo *nd = &nd_table[i];
-        DeviceState *dev;
-
-        qemu_check_nic_model(nd, "virtio");
+    DeviceState *dev;
 
-        dev = qdev_new(name);
-        qdev_set_nic_properties(dev, nd);
+    while ((dev = qemu_create_nic_device(name, true, "virtio")) {
         qdev_realize_and_unref(dev, bus, &error_fatal);
     }
 }
-- 
2.40.1

