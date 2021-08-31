Received: by 2002:a19:5205:0:0:0:0:0 with SMTP id m5csp4973972lfb;
        Tue, 31 Aug 2021 05:17:01 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzFv5yS1j6WHOmrmUumHpLIoEBu3ftC6U/5K5viYh42erw1iYDarMCqD06Hyu6Njuy/WPyu
X-Received: by 2002:a17:907:98ce:: with SMTP id kd14mr30938077ejc.440.1630412221379;
        Tue, 31 Aug 2021 05:17:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1630412221; cv=none;
        d=google.com; s=arc-20160816;
        b=Cut8CbHwiG1zWMiKGNiSxdI7V3dqEFFHK1MiZkdnkPV64ligHTnjrzGzeQgGJmSGBA
         yMx4/mofyxUVbEaAtNQ3ak+MlCdWPD4qznxvL+oAalLziA3E2Vg3RZH53coDgbixOdGm
         85sUQiAL2fcYvdwKhl2Z2+1nYYlVuYe6mGRfZ9axYvQN36/xFxaA7wEyyS4pcEuL/PtT
         A1NX+ZltjtwMaxe9zGnQdwOg7CUifZzMlZcWbRpOxIlO/nZhNjyuGh6dlQX3eaok5Gz6
         LHQeFSU6kEcVJ0IzmED16Niix1yLI+EorvYO1E6pLnAVkoVHs2D+rG7p3lBzyI5VjMgp
         3KkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=4cHILTFEO+nUdl3l0iUFX7QIAFD2fALvSFNx8yIq3Sk=;
        b=1ACqgNKQib4KiThfHqt2al9pGfKlyA+2SFjPrDAxk/BULd/Kyup8u5ENgGJ7g05aE2
         jbafbL5DdEvZ88XuSmnNcCsw8GRYSLqebAk5ChQLQS3+2tPq8gsvKHpJ0UQbYhEvK//E
         ZgYweHqpBBWUSXAi9kf58U3455fXA9KTuukATPsZiBy4Oby5mIBTQYm1utB//uF8/ot1
         DUvYQfiAMuXiOfPKZmVS/iA+XFh091/abHVqCkHv+0FxhoPJRJFFSCbiuVP+5o35Uv3A
         s3HuaO8IQP+grDZR+V4evPUrlGRhX492vZ4KT7Umdzi9+xy2twW0yAC/+K4X70C7Fefl
         dT0A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=TCWLITZo;
       spf=pass (google.com: domain of kraxel@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=kraxel@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <kraxel@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id o15si13659418edi.51.2021.08.31.05.17.01
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 31 Aug 2021 05:17:01 -0700 (PDT)
Received-SPF: pass (google.com: domain of kraxel@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=TCWLITZo;
       spf=pass (google.com: domain of kraxel@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=kraxel@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1630412220;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4cHILTFEO+nUdl3l0iUFX7QIAFD2fALvSFNx8yIq3Sk=;
	b=TCWLITZol86Az9f4COXrFhDbz/AdHYaVnwJeZFaFWZK9VJdML+zrOD3R9l47o6n4r9qV7m
	cPUS+gUW8rdKpcWXrBOHhve+gC+AE4tjdm+3KRuV2E8mjmU9Lhu2Lxt8J0/KRAnYB16lQr
	1yGyfSQpBUq5KAwXP7NWZKe5iUsa7j8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-466-B6x6kO9zP5CsLTS4yCDhZA-1; Tue, 31 Aug 2021 08:16:59 -0400
X-MC-Unique: B6x6kO9zP5CsLTS4yCDhZA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C7E9A869EC9;
	Tue, 31 Aug 2021 12:16:55 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.192.91])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B39F85DF2F;
	Tue, 31 Aug 2021 12:16:40 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
	id 73CE21800991; Tue, 31 Aug 2021 14:15:45 +0200 (CEST)
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
Subject: [PATCH 08/29] move cpu-exec-common.c from tcg module to core qemu [accel/tcg]
Date: Tue, 31 Aug 2021 14:15:24 +0200
Message-Id: <20210831121545.2874233-9-kraxel@redhat.com>
In-Reply-To: <20210831121545.2874233-1-kraxel@redhat.com>
References: <20210831121545.2874233-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
X-TUID: +3EZ3OyCGZTR

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 accel/tcg/meson.build | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/accel/tcg/meson.build b/accel/tcg/meson.build
index 6471fe7832d7..ec74e17a8285 100644
--- a/accel/tcg/meson.build
+++ b/accel/tcg/meson.build
@@ -1,7 +1,10 @@
+specific_ss.add(when: 'CONFIG_TCG', if_true: files(
+  'cpu-exec-common.c',
+))
+
 tcg_ss = ss.source_set()
 tcg_ss.add(files(
   'tcg-all.c',
-  'cpu-exec-common.c',
   'cpu-exec.c',
   'tcg-runtime-gvec.c',
   'tcg-runtime.c',
-- 
2.31.1
