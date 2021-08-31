Received: by 2002:a19:5205:0:0:0:0:0 with SMTP id m5csp4973463lfb;
        Tue, 31 Aug 2021 05:16:27 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzRFVz3j+l+D/FXPstzVc95G92/u5djwpbhVdwkNIuCTkPCIlXjJlb0Ghtw27cwM5P6v21B
X-Received: by 2002:a17:906:704e:: with SMTP id r14mr31042504ejj.293.1630412187286;
        Tue, 31 Aug 2021 05:16:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1630412187; cv=none;
        d=google.com; s=arc-20160816;
        b=aMvmxHu11PM7iOH5+JR+kjl8J9t6lmPMd7+KoKBA9RfGd5VJBdRe9KD58lqW2nwMWw
         hOHiBTfMv3wFXpZMx/WLHeJa6R+vQEq+pqz9+nBEAi0NgWGCtpK/hEGyODYj0Pe1Xsgt
         Z8kEcPRm2kA8qZ+oHBG+UUCBxMBNvxLxi8D+OG1R2AN59g75+D+Z8XBc6PRYo2OsMfmm
         EiU+ZpfqxY87jWOggg1ykuPt2t3l/I/Y8S8FfuA4SreVzHDVLI0gziA87d3cDhGfABJz
         k+aGAkQxt5IdlWPz0HosVlu683nJX1wohT877B0p/VSUZTKDZxuwJFVzcv0fy4e3EcVC
         5FNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=YD248Ndk1lvDxS9aNusHF44nRWrj2+qYvJ28h1pffcE=;
        b=Uqk3EFav7e5YPw4c4pUXDykNR44zdw2UTP7I/UkaXIxNKVTFmlWdFlZnpMwFWHplw+
         E9SBJ3lozFYivYIOBJwqqBXSRlmQmIp3a8s/vyUMqw0F04E3wO97zwOJnwf1Iu893xTw
         KtN3w5BBshEZ4qhAKtKy8ABnluRkm/iedYtFIHG4maE+dsXlwpG/Qfh1QPQLU4ueZh7V
         47Oo36StCXoKKzIX6+qvQrypBqdey4gHESVs0RdpMz4YO9cTMCxIg2LNm29SYRxJLqJK
         ztcXEu/B6JV9x9wqhSwdN7gj3RVDLTcBZGH+Dk4b2LvXKSsZrRmgxLA6U5SncR37d7b0
         5h1Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=HeWmkqVS;
       spf=pass (google.com: domain of kraxel@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=kraxel@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <kraxel@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id hb14si16940637ejc.296.2021.08.31.05.16.26
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 31 Aug 2021 05:16:27 -0700 (PDT)
Received-SPF: pass (google.com: domain of kraxel@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=HeWmkqVS;
       spf=pass (google.com: domain of kraxel@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=kraxel@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1630412185;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=YD248Ndk1lvDxS9aNusHF44nRWrj2+qYvJ28h1pffcE=;
	b=HeWmkqVSj6qK29DrdavjCIQ1s3/ybSnuJpeRiCmKwt7nQDg4zofOuYHUPGU57bOSfPBzTK
	VcvqXwIYrll0xFE5kv/PJdKJvTz9hpYsk+pZRO1Gj2F0DSK1TLNuwQiToDO0fULus/Yfcx
	mqyLI21BtLLojgtPFCLFlEFFE3n1boo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-216-LcTDRZKuPgG3_DKTa2xJ1A-1; Tue, 31 Aug 2021 08:16:24 -0400
X-MC-Unique: LcTDRZKuPgG3_DKTa2xJ1A-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 52DEA760C1;
	Tue, 31 Aug 2021 12:16:21 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.192.91])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E6C5D27089;
	Tue, 31 Aug 2021 12:16:05 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
	id 3A43A180093C; Tue, 31 Aug 2021 14:15:45 +0200 (CEST)
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
Subject: [PATCH 03/29] tcg/module: move hmp.c to module
Date: Tue, 31 Aug 2021 14:15:19 +0200
Message-Id: <20210831121545.2874233-4-kraxel@redhat.com>
In-Reply-To: <20210831121545.2874233-1-kraxel@redhat.com>
References: <20210831121545.2874233-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
X-TUID: g18Jd7jkIQlG

Can be built modular without problems.

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 accel/tcg/meson.build | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/accel/tcg/meson.build b/accel/tcg/meson.build
index 137a1a44cc0a..d4df7681a811 100644
--- a/accel/tcg/meson.build
+++ b/accel/tcg/meson.build
@@ -15,7 +15,6 @@ specific_ss.add_all(when: 'CONFIG_TCG', if_true: tcg_ss)
 
 specific_ss.add(when: ['CONFIG_SOFTMMU', 'CONFIG_TCG'], if_true: files(
   'cputlb.c',
-  'hmp.c',
 ))
 
 tcg_module_ss.add(when: ['CONFIG_SOFTMMU', 'CONFIG_TCG'], if_true: files(
@@ -23,4 +22,5 @@ tcg_module_ss.add(when: ['CONFIG_SOFTMMU', 'CONFIG_TCG'], if_true: files(
   'tcg-accel-ops-mttcg.c',
   'tcg-accel-ops-icount.c',
   'tcg-accel-ops-rr.c',
+  'hmp.c',
 ))
-- 
2.31.1
