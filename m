Received: by 2002:a17:906:6951:b0:a28:f940:7a27 with SMTP id c17csp4710ejs;
        Mon, 8 Jan 2024 12:52:31 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEubI+jX0JcA/6j9PznwuPvdeJ4CG2SAHm//8i/6HkXsVRi1BaYT4FA6r3/mlGqLDBdqelB
X-Received: by 2002:a05:6808:30f:b0:3bd:3a51:340b with SMTP id i15-20020a056808030f00b003bd3a51340bmr497293oie.2.1704747150773;
        Mon, 08 Jan 2024 12:52:30 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1704747150; cv=none;
        d=google.com; s=arc-20160816;
        b=HjxmRwIeRCUOJfH3T+K5Dwzvd7SZrnK+vfDpUATcJ3qMJn4wiqip6FS2AB2wOdDUZ3
         YSbDby2hf/QPzF+AhyhneTuVBav8+KVShC6sI6qWsQplZ9UX2SzGaCSH+wWxpYsyDA++
         lQGWgwFblAGnd+N1+AD1Nz2fvQILnW41bTfBSyNmL51ddTYWZzESwvHp+NmOXYFntCg+
         d3I7uh0u6TQSux3A7hjwzSQbSRsvv7FUSaYAHA0OswsO3eAoJErb9kQiAYj/HKvIpkqJ
         DFkWgSRMt+FHySqY5FlUpd57GqtdIUkeFEphwF7WmIkQ0gJ4G60ds/dLw/M6rkXa2ArN
         WRPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:content-transfer-encoding:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:dkim-signature
         :precedence:errors-to:list-subscribe:list-help:list-post
         :list-unsubscribe:list-id;
        bh=EY5jroAc8MCOZn/iMIDqFzrV+uFS3P3alR9EbXNKjbA=;
        fh=LeOBNGHwoQQCylLh9v89P/OdTUx8jmDchZ7fstdYfbc=;
        b=l4Ga79fJOq38Q0MD4w3u2siYH5Cv75kNuTPu/oQT8yG+wNxN/7d+1MHp2I46QG59Tp
         tNwt2DWNHNofldVCpUoV0j49z4OpwRK6gbxMP42Uc+xnku5294bMdFxQiTc856aFO2yk
         pg/VTSJf/C1hU8jcT5ckQ/GId+c0v1PNWaXjppX1VzLhoDSiJvUhwVCdtOY27Dk0cbp4
         ruGSL4Xm0K7xJSBuDb9v7rJLQEfnZLBABGSOwoJf/vjnxIj6vrllK6L82stt5C5Nzw1h
         YfZdy4OiIWSSXp7fy7xnbWnESKT2/Uyos5fEDjJv5I7I4DyaC8dRRn/O2PmSN3KtxkN5
         gTRw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@infradead.org header.s=casper.20170209 header.b=kZvFfEtv;
       spf=pass (google.com: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Return-Path: <xen-devel-bounces@lists.xenproject.org>
Received: from lists.xenproject.org (lists.xenproject.org. [192.237.175.120])
        by mx.google.com with ESMTPS id k6-20020a0cf586000000b0067abd18c974si685633qvm.325.2024.01.08.12.52.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jan 2024 12:52:30 -0800 (PST)
Received-SPF: pass (google.com: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) client-ip=192.237.175.120;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@infradead.org header.s=casper.20170209 header.b=kZvFfEtv;
       spf=pass (google.com: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.663902.1033869 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rMwaQ-0001u5-0C; Mon, 08 Jan 2024 20:51:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 663902.1033869; Mon, 08 Jan 2024 20:51:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rMwaP-0001s9-Lb; Mon, 08 Jan 2024 20:51:05 +0000
Received: by outflank-mailman (input) for mailman id 663902;
 Mon, 08 Jan 2024 20:51:03 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=NrlO=IS=casper.srs.infradead.org=BATV+41a72dc6539c0dfbbc31+7442+infradead.org+dwmw2@srs-se1.protection.inumbo.net>)
 id 1rMwaN-0000R6-FQ
 for xen-devel@lists.xenproject.org; Mon, 08 Jan 2024 20:51:03 +0000
Received: from casper.infradead.org (casper.infradead.org
 [2001:8b0:10b:1236::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a14b5abd-ae67-11ee-9b0f-b553b5be7939;
 Mon, 08 Jan 2024 21:51:00 +0100 (CET)
Received: from [2001:8b0:10b:1::ebe] (helo=i7.infradead.org)
 by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1rMwYl-008RQB-0k; Mon, 08 Jan 2024 20:49:24 +0000
Received: from dwoodhou by i7.infradead.org with local (Exim 4.96.2 #2 (Red
 Hat Linux)) id 1rMwYl-002NHD-2V; Mon, 08 Jan 2024 20:49:23 +0000
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
X-Inumbo-ID: a14b5abd-ae67-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Sender:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description;
	bh=EY5jroAc8MCOZn/iMIDqFzrV+uFS3P3alR9EbXNKjbA=; b=kZvFfEtvSc+2WEUAmbwYwJ2lf6
	n8j+9PM0udQh+tjnaMb1GwsyPhPSCYiqzXKZ+7ja9QUTfMQlnTW2SfL2SqdoPU7uU3Di5YUulChIC
	rXhFpsYJvt0S49LH4i0ZtFV5dkCCg34qbju1xyZqiAanXwwl30VSspYUIU+7pUX4t2aFjVvgUxeTb
	bA7SlVUUNU2eoRcHjR/CXFmztWLt/jep5BA7wh6iwy7v39gbQuIuSXCh7BoPdr1DOuSksAS5XfkoJ
	1eqszgX250rXa8lfMFslqU5axeaRGQT2jgL4/A86sUNrel0drthWPDkvI9FxZTbQEtvM1UMFGv0Hd
	65ij8Cnw==;
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
	David Woodhouse <dwmw@amazon.co.uk>
Subject: [PATCH v3 43/46] net: remove qemu_check_nic_model()
Date: Mon,  8 Jan 2024 20:27:12 +0000
Message-ID: <20240108204909.564514-44-dwmw2@infradead.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240108204909.564514-1-dwmw2@infradead.org>
References: <20240108204909.564514-1-dwmw2@infradead.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: David Woodhouse <dwmw2@infradead.org>
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by casper.infradead.org. See http://www.infradead.org/rpr.html
X-TUID: kx3+Fv0ZfiQb

From: David Woodhouse <dwmw@amazon.co.uk>

Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
---
 include/net/net.h |  1 -
 net/net.c         | 13 -------------
 2 files changed, 14 deletions(-)

diff --git a/include/net/net.h b/include/net/net.h
index 31e63d1f0d..1be8b40074 100644
--- a/include/net/net.h
+++ b/include/net/net.h
@@ -204,7 +204,6 @@ int qemu_set_vnet_le(NetClientState *nc, bool is_le);
 int qemu_set_vnet_be(NetClientState *nc, bool is_be);
 void qemu_macaddr_default_if_unset(MACAddr *macaddr);
 int qemu_show_nic_models(const char *arg, const char *const *models);
-void qemu_check_nic_model(NICInfo *nd, const char *model);
 int qemu_find_nic_model(NICInfo *nd, const char * const *models,
                         const char *default_model);
 NICInfo *qemu_find_nic_info(const char *typename, bool match_default,
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
2.41.0

