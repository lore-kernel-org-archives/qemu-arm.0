Received: by 2002:a17:906:33ce:b0:9d0:bf65:29fa with SMTP id w14csp3004441eja;
        Mon, 6 Nov 2023 11:56:28 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEud2J95fZEmiIyUVaX+asQJ2v8eyaopv/XDvn7cbwXXzrjZ2PzbZiXiy2dvNt+Iof6w4dV
X-Received: by 2002:a05:622a:2ca:b0:41c:c848:d831 with SMTP id a10-20020a05622a02ca00b0041cc848d831mr34542595qtx.5.1699300588508;
        Mon, 06 Nov 2023 11:56:28 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1699300588; cv=none;
        d=google.com; s=arc-20160816;
        b=kf/vxzSjL9qqNHnupzGfdY0OLairkNqdEuUbYlnNjZ04SIHKwOFDhiyaFYsAzy83el
         isy4LZYApFjYWcT9hvknwLc2KkbowNbCltUOQPJWQ8cs8zwQJLcnVcI8pvH/FtjkcpdQ
         3bSgu1oQJiUhe0US/DT/dVugvIPeUlCfb4Cpn4uGflb4d+JSLTRL2GLL6xJ9R74EdC3O
         XwsJCU3OpUYmCBDq88IwgqRl0tX5LvmLq7oTDlMfSZPV3KzmyyO0KOsExfwGPaToLP5a
         gbpTIkzrY3NfrmnttZT8IolImx6/gxS71uHmx5F4XANYRczKgEOKmDagISLShZFSvMyh
         8LXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:content-transfer-encoding:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:dkim-signature
         :precedence:errors-to:list-subscribe:list-help:list-post
         :list-unsubscribe:list-id;
        bh=Q6WJzrf/gsQj4hekd5E3jTDYvSsFsIQ40+J5PbVDAlw=;
        fh=aO0iHn1gEkY7cXLX0OqpYrk+6ZrDWUTepWYzJsBxj6U=;
        b=SJHHfwR0+Ozdw++T6TOn8nS07rITRE7QvNw1mHvuH86FqJZ7PUV3jzUtRRYbOaeY4Z
         pv1SrECXS7mXtneXfcE2vlgjV3BFIF921AW2wqV255tXVzyJopgDFV8GSW39Zg7XBxp0
         84SzDwX7iR8RTfrMep/j6EgBzc6o6GoKzi0/drqWTz8xRKj7tIhBnNfr97pR4bj4rA9Q
         vvzdAfkUlIM75VlLWCDBGD5aik/Dl9qOI0jVyi8dd1pPqhgSDsbuGgQls31kaxLXSi3V
         3Z/rM3yuSyDFvJEkrqc/sUTjB8Vc2sZzTXonwq0EPqmZAd/8pEp+yU6PuJSczWfjOdbh
         vc8g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@infradead.org header.s=desiato.20200630 header.b=hN6jXJAR;
       spf=pass (google.com: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Return-Path: <xen-devel-bounces@lists.xenproject.org>
Received: from lists.xenproject.org (lists.xenproject.org. [192.237.175.120])
        by mx.google.com with ESMTPS id p17-20020a05622a13d100b0041805d0969bsi6092661qtk.210.2023.11.06.11.56.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Nov 2023 11:56:28 -0800 (PST)
Received-SPF: pass (google.com: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) client-ip=192.237.175.120;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@infradead.org header.s=desiato.20200630 header.b=hN6jXJAR;
       spf=pass (google.com: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.628282.979544 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r05h1-0001Ix-Vw; Mon, 06 Nov 2023 19:55:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 628282.979544; Mon, 06 Nov 2023 19:55:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r05h1-0001Iq-T5; Mon, 06 Nov 2023 19:55:27 +0000
Received: by outflank-mailman (input) for mailman id 628282;
 Mon, 06 Nov 2023 19:55:26 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nwd5=GT=desiato.srs.infradead.org=BATV+aa7b7dce24b49c47a83c+7379+infradead.org+dwmw2@srs-se1.protection.inumbo.net>)
 id 1r05gy-0001Ig-JE
 for xen-devel@lists.xenproject.org; Mon, 06 Nov 2023 19:55:26 +0000
Received: from desiato.infradead.org (desiato.infradead.org
 [2001:8b0:10b:1:d65d:64ff:fe57:4e05])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6af681b7-7cde-11ee-9b0e-b553b5be7939;
 Mon, 06 Nov 2023 20:55:21 +0100 (CET)
Received: from [2001:8b0:10b:1::ebe] (helo=i7.infradead.org)
 by desiato.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
 id 1r05fe-00AkGA-0M; Mon, 06 Nov 2023 19:54:03 +0000
Received: from dwoodhou by i7.infradead.org with local (Exim 4.96.2 #2 (Red
 Hat Linux)) id 1r05fc-001GPF-2Q; Mon, 06 Nov 2023 19:54:00 +0000
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
X-Inumbo-ID: 6af681b7-7cde-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description;
	bh=Q6WJzrf/gsQj4hekd5E3jTDYvSsFsIQ40+J5PbVDAlw=; b=hN6jXJARRmz2GcvDSca7kv1iBF
	MD6IM83m3OlMumoHTu1tfa5Hh5TNwVAO2zuzdBV7ya9YTeAksrYH2KAvYWnvU5vZc9PtViL6FYuLD
	4rVMwVE/8xp2ESjC7pSdGhtZQW+Racktv0Jg7A9rDfvVCHY0fIMZ1JypA3E44pMAOX3VMdt2PSWfU
	M2S/w5oq+ePOvVJq+1b+kHHcURRQ4CafaKAjihmSN/viVnhW+oLS/NDdiSmLhxkF316u0LnDdceA6
	3GnYTj3WXakTIuiyW6b2gdCJ2powAIsP/BxehtWnuN5+wA/bsvIwgA1DgVBkiJqDtFpodoETq8VrF
	szF2/wkA==;
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
Subject: [PATCH for-8.3 v2 37/46] hw/net/lasi_i82596: use qemu_configure_nic_device()
Date: Mon,  6 Nov 2023 19:49:42 +0000
Message-ID: <20231106195352.301038-38-dwmw2@infradead.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231106195352.301038-1-dwmw2@infradead.org>
References: <20231106195352.301038-1-dwmw2@infradead.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: David Woodhouse <dwmw2@infradead.org>
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by desiato.infradead.org. See http://www.infradead.org/rpr.html
X-TUID: 211JbHY0um9W

From: David Woodhouse <dwmw@amazon.co.uk>

Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
---
 hw/net/lasi_i82596.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/hw/net/lasi_i82596.c b/hw/net/lasi_i82596.c
index e37f7fabe9..c4c197aaa8 100644
--- a/hw/net/lasi_i82596.c
+++ b/hw/net/lasi_i82596.c
@@ -125,11 +125,10 @@ SysBusI82596State *lasi_82596_init(MemoryRegion *addr_space,
     static const MACAddr HP_MAC = {
         .a = { 0x08, 0x00, 0x09, 0xef, 0x34, 0xf6 } };
 
-    qemu_check_nic_model(&nd_table[0], TYPE_LASI_82596);
     dev = qdev_new(TYPE_LASI_82596);
     s = SYSBUS_I82596(dev);
     s->state.irq = lan_irq;
-    qdev_set_nic_properties(dev, &nd_table[0]);
+    qemu_configure_nic_device(dev, true, NULL);
     sysbus_realize_and_unref(SYS_BUS_DEVICE(dev), &error_fatal);
     s->state.conf.macaddr = HP_MAC; /* set HP MAC prefix */
 
-- 
2.41.0

