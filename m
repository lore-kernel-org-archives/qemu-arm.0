Received: by 2002:a17:907:9874:b0:a31:23a7:2a34 with SMTP id ko20csp1023874ejc;
        Fri, 26 Jan 2024 09:34:15 -0800 (PST)
X-Google-Smtp-Source: AGHT+IELQgizm/fd5SzTLDoDEN5SDTIjqEwyu52FeCjrEk2fYVI0GZqGsdMq04HUl8HpAzRBGwEA
X-Received: by 2002:a25:8f85:0:b0:dc3:721f:7a53 with SMTP id u5-20020a258f85000000b00dc3721f7a53mr278161ybl.5.1706290455574;
        Fri, 26 Jan 2024 09:34:15 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1706290455; cv=none;
        d=google.com; s=arc-20160816;
        b=ezn4ktXh7M2tDCxD5QJhy0T6D65xWMwwIfS4k73ZFl7FkWfvlQDxgTO9l7/mRWLdUP
         +jA3j4mH5Po2VHd7GayoXeaB8tMkawnLNNxv3ICqm5GDsAdwXkp81/NiU1xAuILyOLVF
         dq73cc2c36pPN7FJD11QwOlL2jwyPq00t2nw028FTIb6tNMWlTmX03gh+YN9muHxPtyQ
         RypO1mcFRDolZ/adYVc5pzMke6bOrSR0ipAHs+VEYUgggofbR6VqP2WNvoVms4ZbMy1v
         tam5aEt9ZpC2bf6DZ9JfUBu2zS8TJ/Kun7QJLpZu8Juc1kox6kweRihMsrGesO8cMqy1
         N0Lw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:content-transfer-encoding:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:dkim-signature
         :precedence:errors-to:list-subscribe:list-help:list-post
         :list-unsubscribe:list-id;
        bh=bWvWof/1cmcc1j4iR+WvmK21dtpKtWiHn2Gmk5c5D+g=;
        fh=4aUA0JPxoVvgInBmJ96rXkS+v1RtLmlfy0HlzHtXDaI=;
        b=jPezl1UA66u84xJAGBnB0yq6MeKYZZysV0dhOQEck4YcnzJ9ZhEeiFnysRnb5zMNEP
         epdHi0OXXCd0ndahT4WEx16bOITFFdOllUVYOLQAzisObnV+t07eE61Fa7nXPb4Z9P2B
         Fu1dfGYOrnHF4v752tFI/qPhhXYltv8xBYrRFEmjy947XEVaByjEPXTkpIwPxpOkS82D
         dz2S5DeazEmhigR+VD8uyhtpFZmzkVC101kujrGNtlkE+G+D4irdLAe0AD7qVD0Fi98/
         S92uRN+2CdvmOI1PPV46/BhqXh0Ao2l/JwdjzGBqbarBlB5PxoFTKgqQe02xa1FODz1X
         wEvQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@infradead.org header.s=casper.20170209 header.b=WzzpstEk;
       spf=pass (google.com: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Return-Path: <xen-devel-bounces@lists.xenproject.org>
Received: from lists.xenproject.org (lists.xenproject.org. [192.237.175.120])
        by mx.google.com with ESMTPS id 187-20020a2515c4000000b00dc255a0d64dsi985279ybv.630.2024.01.26.09.34.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Jan 2024 09:34:15 -0800 (PST)
Received-SPF: pass (google.com: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) client-ip=192.237.175.120;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@infradead.org header.s=casper.20170209 header.b=WzzpstEk;
       spf=pass (google.com: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.672261.1046124 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rTQ4o-0006kq-Nh; Fri, 26 Jan 2024 17:33:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 672261.1046124; Fri, 26 Jan 2024 17:33:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rTQ4o-0006jw-Do; Fri, 26 Jan 2024 17:33:14 +0000
Received: by outflank-mailman (input) for mailman id 672261;
 Fri, 26 Jan 2024 17:33:12 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=bPDA=JE=casper.srs.infradead.org=BATV+7caeb094913322f6f00d+7460+infradead.org+dwmw2@srs-se1.protection.inumbo.net>)
 id 1rTQ4m-0004m7-Ns
 for xen-devel@lists.xenproject.org; Fri, 26 Jan 2024 17:33:12 +0000
Received: from casper.infradead.org (casper.infradead.org
 [2001:8b0:10b:1236::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f94b1646-bc70-11ee-98f5-efadbce2ee36;
 Fri, 26 Jan 2024 18:33:10 +0100 (CET)
Received: from [2001:8b0:10b:1::ebe] (helo=i7.infradead.org)
 by casper.infradead.org with esmtpsa (Exim 4.97.1 #2 (Red Hat Linux))
 id 1rTQ49-0000000EKV8-44sQ; Fri, 26 Jan 2024 17:32:35 +0000
Received: from dwoodhou by i7.infradead.org with local (Exim 4.97.1 #2 (Red
 Hat Linux)) id 1rTQ4A-00000001eoO-3aiC;
 Fri, 26 Jan 2024 17:32:34 +0000
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
X-Inumbo-ID: f94b1646-bc70-11ee-98f5-efadbce2ee36
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Sender:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description;
	bh=bWvWof/1cmcc1j4iR+WvmK21dtpKtWiHn2Gmk5c5D+g=; b=WzzpstEkNJiPLuy92upSXanqTF
	La6Ww0ZzuK27VHK1Qpd+lUrAaC/DeDA7Jd1G5BVyfJ2c1X5gfD+t3LDddgefqLi1Ocr+5U5QHPRX+
	LAXaw8dcwwQANy1glCZKAbKQoDasbC7Ca8YhP8UJ1cVHKavuftIwXkLhPk9GCjXDgxq7jm/7qhyCY
	i42yg2iZe8Yb8j/kSHcuTU5/ikvOMtl6u++VwXZR1CAJ1td+pAHwe6jqsKOsuIczoy6r0diWC+HUG
	svVAtxAwVNFAHcwJZjSF/HBe39q6T52eEzgHswXTWsEacxcIcIJHSqgKLOd8SoXXa5aiCrYiZA6iP
	dHar8YlQ==;
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
Subject: [PATCH v4 44/47] net: remove qemu_check_nic_model()
Date: Fri, 26 Jan 2024 17:25:21 +0000
Message-ID: <20240126173228.394202-45-dwmw2@infradead.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240126173228.394202-1-dwmw2@infradead.org>
References: <20240126173228.394202-1-dwmw2@infradead.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: David Woodhouse <dwmw2@infradead.org>
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by casper.infradead.org. See http://www.infradead.org/rpr.html
X-TUID: zj4VgQblwYNJ

From: David Woodhouse <dwmw@amazon.co.uk>

There are no callers of this function any more, as they have all been
converted to qemu_{create,configure}_nic_device().

Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
Reviewed-by: Thomas Huth <thuth@redhat.com>
---
 include/net/net.h |  1 -
 net/net.c         | 13 -------------
 2 files changed, 14 deletions(-)

diff --git a/include/net/net.h b/include/net/net.h
index 728ca965af..00ee1af7ab 100644
--- a/include/net/net.h
+++ b/include/net/net.h
@@ -204,7 +204,6 @@ int qemu_set_vnet_le(NetClientState *nc, bool is_le);
 int qemu_set_vnet_be(NetClientState *nc, bool is_be);
 void qemu_macaddr_default_if_unset(MACAddr *macaddr);
 int qemu_show_nic_models(const char *arg, const char *const *models);
-void qemu_check_nic_model(NICInfo *nd, const char *model);
 int qemu_find_nic_model(NICInfo *nd, const char * const *models,
                         const char *default_model);
 /**
diff --git a/net/net.c b/net/net.c
index 4651b3f443..ffd4b42d5a 100644
--- a/net/net.c
+++ b/net/net.c
@@ -992,19 +992,6 @@ int qemu_show_nic_models(const char *arg, const char *const *models)
     return 1;
 }
 
-void qemu_check_nic_model(NICInfo *nd, const char *model)
-{
-    const char *models[2];
-
-    models[0] = model;
-    models[1] = NULL;
-
-    if (qemu_show_nic_models(nd->model, models))
-        exit(0);
-    if (qemu_find_nic_model(nd, models, model) < 0)
-        exit(1);
-}
-
 int qemu_find_nic_model(NICInfo *nd, const char * const *models,
                         const char *default_model)
 {
-- 
2.43.0

