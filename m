Received: by 2002:a19:5205:0:0:0:0:0 with SMTP id m5csp4973908lfb;
        Tue, 31 Aug 2021 05:16:56 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzZ1rvoIA50KlobczPo5o6mTU00Y2veWTIWJ7gOFpNdVbkS5yRavl5ili2im1TsCrERv+/Z
X-Received: by 2002:adf:fc4f:: with SMTP id e15mr30639693wrs.95.1630412216195;
        Tue, 31 Aug 2021 05:16:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1630412216; cv=none;
        d=google.com; s=arc-20160816;
        b=y011ZH8gg6t5G9LAOGYhC6CoZ1QzjU9kBGqo0uAkD1sJBGzbToFKp8rbM/7KpRc8k4
         sTuut0W9nvLeP8O4+Sn/X203/7op1SzfGQTRRhi7gJ+v9X2uGYEEXj05yxMWszdsMtZu
         dY/00aANgAY9zxOSbiHDaNBtWWHUF4zKWFw8J/Mm753/MN0Hyh28MeLMhb/s+EwukWuK
         /6hyTmM8mZodsUVXF14hLZtSsFU5n7aSH9OezE9X2S918lD/LqU6cN7YRalEkWI99olQ
         n/AEeqakls2/L+iMl1hY6AjKct22vJAPQ4aiUZtaR/qamylbuSZWWfphwkzcVo7CvuyQ
         ICsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=st8LyVaIC9LZtCDOeqjCn0qsWGxdj7MtONbXC66eiAE=;
        b=yqG7FgVIAAXXUrg1oM2tu5HApCKitcdFTxRJHl/punGgKaL0J5hNPSxhfg92kCm11w
         Qfy/+HCgjifNrrfBdjhPDO5LxPJN8/YcAmSJlH0+1aN5ThbE3Nwxin115pNNWaIAQas7
         Ympk5dH2RD5i9ePZyaKXSuyXnnQmMb1EnLFdycZyrd023NJLoTm+labBZhocmz3YHLbL
         eWqPBD1lkSUyjUmXbvS7YbPqzFKgPVT8JNx8eV8wYcQvDMmyX0YaYyBZLPd2PHNMcDWs
         8jGjd3WGfpaKYlTNjtVXdpBUQffG11KnO5XC4BK6Vm/dx/X+ljqkEWt0yMdu16sFEgpj
         EQ/g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=IL6AH1z8;
       spf=pass (google.com: domain of kraxel@redhat.com designates 216.205.24.124 as permitted sender) smtp.mailfrom=kraxel@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <kraxel@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [216.205.24.124])
        by mx.google.com with ESMTPS id h15si16304207ejj.98.2021.08.31.05.16.55
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 31 Aug 2021 05:16:56 -0700 (PDT)
Received-SPF: pass (google.com: domain of kraxel@redhat.com designates 216.205.24.124 as permitted sender) client-ip=216.205.24.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=IL6AH1z8;
       spf=pass (google.com: domain of kraxel@redhat.com designates 216.205.24.124 as permitted sender) smtp.mailfrom=kraxel@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1630412215;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=st8LyVaIC9LZtCDOeqjCn0qsWGxdj7MtONbXC66eiAE=;
	b=IL6AH1z8tqgie03VLkPm2xomunb4v8fnAG0UF34mfh9ChvAousWayBU9wit+L4nkD/w0D8
	Gjj/Kw6NdkXZ8IaEfRjXaXGzO0saIrEDrU/9XPhy3GhJjygg/VVRgux7yEsFDrHGsZtBDZ
	yQKVAmoiL2NbA4IJ1wdGKvJYOuYGmPY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-241-L97Ruv1RMa-DvmyGBTuIMw-1; Tue, 31 Aug 2021 08:16:54 -0400
X-MC-Unique: L97Ruv1RMa-DvmyGBTuIMw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AF2D3800482;
	Tue, 31 Aug 2021 12:16:50 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.192.91])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D9410197FC;
	Tue, 31 Aug 2021 12:16:38 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
	id 68AFB1800980; Tue, 31 Aug 2021 14:15:45 +0200 (CEST)
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
Subject: [PATCH 07/29] tcg/module: move files to module [target/i386/tcg]
Date: Tue, 31 Aug 2021 14:15:23 +0200
Message-Id: <20210831121545.2874233-8-kraxel@redhat.com>
In-Reply-To: <20210831121545.2874233-1-kraxel@redhat.com>
References: <20210831121545.2874233-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
X-TUID: Z4zcs9q5E/Dh

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 target/i386/tcg/meson.build        | 9 +++++++--
 target/i386/tcg/sysemu/meson.build | 5 ++++-
 2 files changed, 11 insertions(+), 3 deletions(-)

diff --git a/target/i386/tcg/meson.build b/target/i386/tcg/meson.build
index f9110e890c8a..7bbe3d926975 100644
--- a/target/i386/tcg/meson.build
+++ b/target/i386/tcg/meson.build
@@ -1,4 +1,7 @@
-i386_ss.add(when: 'CONFIG_TCG', if_true: files(
+i386_softmmu_ss.add(when: 'CONFIG_TCG', if_false: files('tcg-stub.c'))
+
+files_ss = ss.source_set()
+files_ss.add(when: 'CONFIG_TCG', if_true: files(
   'bpt_helper.c',
   'cc_helper.c',
   'excp_helper.c',
@@ -9,7 +12,9 @@ i386_ss.add(when: 'CONFIG_TCG', if_true: files(
   'mpx_helper.c',
   'seg_helper.c',
   'tcg-cpu.c',
-  'translate.c'), if_false: files('tcg-stub.c'))
+  'translate.c'))
+tcg_module_ss.add_all(when: 'TARGET_I386', if_true: files_ss)
+tcg_module_ss.add_all(when: 'TARGET_X86_64', if_true: files_ss)
 
 subdir('sysemu')
 subdir('user')
diff --git a/target/i386/tcg/sysemu/meson.build b/target/i386/tcg/sysemu/meson.build
index 2e444e766a5b..50bfd5094787 100644
--- a/target/i386/tcg/sysemu/meson.build
+++ b/target/i386/tcg/sysemu/meson.build
@@ -1,4 +1,5 @@
-i386_softmmu_ss.add(when: ['CONFIG_TCG', 'CONFIG_SOFTMMU'], if_true: files(
+files_ss = ss.source_set()
+files_ss.add(when: ['CONFIG_TCG', 'CONFIG_SOFTMMU'], if_true: files(
   'tcg-cpu.c',
   'smm_helper.c',
   'excp_helper.c',
@@ -8,3 +9,5 @@ i386_softmmu_ss.add(when: ['CONFIG_TCG', 'CONFIG_SOFTMMU'], if_true: files(
   'svm_helper.c',
   'seg_helper.c',
 ))
+tcg_module_ss.add_all(when: 'TARGET_I386', if_true: files_ss)
+tcg_module_ss.add_all(when: 'TARGET_X86_64', if_true: files_ss)
-- 
2.31.1
