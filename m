Received: by 2002:a19:5205:0:0:0:0:0 with SMTP id m5csp4973731lfb;
        Tue, 31 Aug 2021 05:16:45 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyAOf/kl9yc5E2f4Oxv3WNKfBQrwof+qXRXyPk6ZLWwvVxdwUpLI9ODl5vrhM1hGbL8xDZy
X-Received: by 2002:a17:907:76ee:: with SMTP id kg14mr30744784ejc.90.1630412205082;
        Tue, 31 Aug 2021 05:16:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1630412205; cv=none;
        d=google.com; s=arc-20160816;
        b=pOUI+a1BnAp2KxjUhBfu+jW04xzizN/Fd3Xre9owW3Yx8YrGeiXkdw4YvoeRAMRAI/
         yN9GuJ3B6ezhkef76DGyFINOUDO7fCT7PfW7wPsP25pGrwvigI/M/j0opTZ5O0IVgsuE
         XxBOhnzmrbJeh1SMCEzKul1CPzawT7EcK6zvojp5KbaIAoauZg6PYok8ZE03a5p3V9fk
         Ucup/LKM1OWUh7US2vnD7WUmTv/s5KRGsVinwfEazAw3xVtYHQKfTnc7cRoizI/Bl6au
         R7s/fD8d8mzhQFi2QOngw0LCeBddOhChp6u1W5zyey1Mazurao+DFN6nc4Hs8N/tfYoM
         STNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=jukTgOTUEMS4x77F2TCNXG7jp7vcP0QVcACeKswLeM4=;
        b=QIZFKHmaU4emDY0lFTH6WM7de1M4Ms4eRm62FkdLmmODC9fVq812zxSDPBvkwR9aSo
         R/oyEDQ3a3GXPqSZEotb0hydat/p4q7EJTQf01qqUe8KDRc6KzTVusK2ZA+7QiJpfQEm
         qY3uCFjhC6i4apXKU7dqDGGG25hNpEiLPfc8KugWIdG14S9NsNK3UXipYfGi8ok2rSfL
         fJHC+PldsEr6A4ng489Q3FJAGl2ZbirBCZGdwHWebHQdZomcYG2VLYLXCHzhTUhLMvZG
         7V/ToAtRgTS4gjfpfitm+jO2f56Cfu/fTSXW5xsKcSMl7ITsT5OOpymn8b6rMwZ4guiq
         XvgQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="hDl/Cu7S";
       spf=pass (google.com: domain of kraxel@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=kraxel@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <kraxel@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id w17si16688865edr.212.2021.08.31.05.16.44
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 31 Aug 2021 05:16:45 -0700 (PDT)
Received-SPF: pass (google.com: domain of kraxel@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="hDl/Cu7S";
       spf=pass (google.com: domain of kraxel@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=kraxel@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1630412204;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jukTgOTUEMS4x77F2TCNXG7jp7vcP0QVcACeKswLeM4=;
	b=hDl/Cu7S5c6qzLvm4z/yGGMviNt+UyxqIZFPg5XOaJ1/dB1bZaEliUN9VuEWN39gJ1NBhs
	7BnRXknBkBMjcwIwy92XA6D0DtIXG1DIpZUBSclvF5LPxLSS0RiENeoDeWOsBVQqLBY9xI
	A/mcGrN3U2n5bjFQ8UJfid2D2RV2hwo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-15-sZ_UXZ4VPdSYTbzg-3WcJQ-1; Tue, 31 Aug 2021 08:16:43 -0400
X-MC-Unique: sZ_UXZ4VPdSYTbzg-3WcJQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3B3D4760C1;
	Tue, 31 Aug 2021 12:16:39 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.192.91])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id DD9EF1001281;
	Tue, 31 Aug 2021 12:16:38 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
	id 5BE60180093F; Tue, 31 Aug 2021 14:15:45 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Cc: Aurelien Jarno <aurelien@aurel32.net>,
	Laurent Vivier <laurent@vivier.eu>,
	Peter Xu <peterx@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Cornelia Huck <cohuck@redhat.com>,
	qemu-ppc@nongnu.org,
	Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
	Thomas Huth <thuth@redhat.com>,
	Eduardo Habkost <ehabkost@redhat.com>,
	qemu-riscv@nongnu.org,
	David Gibson <david@gibson.dropbear.id.au>,
	Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
	Stafford Horne <shorne@gmail.com>,
	Huacai Chen <chenhuacai@kernel.org>,
	Halil Pasic <pasic@linux.ibm.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Bin Meng <bin.meng@windriver.com>,
	Mahmoud Mandour <ma.mandourr@gmail.com>,
	Max Filippov <jcmvbkbc@gmail.com>,
	Alexandre Iooss <erdnaxe@crans.org>,
	Greg Kurz <groug@kaod.org>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	qemu-arm@nongnu.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	qemu-s390x@nongnu.org,
	Christian Borntraeger <borntraeger@de.ibm.com>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	David Hildenbrand <david@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
	Gerd Hoffmann <kraxel@redhat.com>
Subject: [PATCH 06/29] tcg/module: move tcg_ss to module [tcg]
Date: Tue, 31 Aug 2021 14:15:22 +0200
Message-Id: <20210831121545.2874233-7-kraxel@redhat.com>
In-Reply-To: <20210831121545.2874233-1-kraxel@redhat.com>
References: <20210831121545.2874233-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
X-TUID: i7fAvbzI1n55

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 tcg/meson.build | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tcg/meson.build b/tcg/meson.build
index c4c63b19d4ed..f1d7b898b1cd 100644
--- a/tcg/meson.build
+++ b/tcg/meson.build
@@ -17,4 +17,4 @@ if get_option('tcg_interpreter')
   specific_ss.add(files('tci.c'))
 endif
 
-specific_ss.add_all(when: 'CONFIG_TCG', if_true: tcg_ss)
+tcg_module_ss.add_all(when: 'CONFIG_TCG', if_true: tcg_ss)
-- 
2.31.1
