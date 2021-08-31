Received: by 2002:a19:5205:0:0:0:0:0 with SMTP id m5csp4973700lfb;
        Tue, 31 Aug 2021 05:16:43 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz4eNRtFLJvbcnUY01iTeKBntG4jF8Q4n6lOYDr7piTX3bqDEJisXYLEEKvSaIHWHh4VxXU
X-Received: by 2002:a50:ec0d:: with SMTP id g13mr14668529edr.233.1630412203389;
        Tue, 31 Aug 2021 05:16:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1630412203; cv=none;
        d=google.com; s=arc-20160816;
        b=HgzRQdUBuuO3DBVSOLbgzievAn2pU5xKF0wsF9OUfIivz5IB0LdtAl4UvOlMTQ4yj/
         bZfxJF6f91T1LQ/wgeqcWZQXX8Xs3i+ifUHOJn/0SbJV/IqE9daOMyAsePCwT6sOLTKO
         txVMY5IBeOdlTtV5Vnsqmry5IPast/ABg3oVCN88bDDPv6RoGq8TAutmycLUy+ZhGGvU
         eTZoEiWY9JcwxekBtstg/+pHUxUWXn+ZzUEw003VWEXBwrx8Lar1PmRmIzrJkGJKzuhZ
         U8A9mOgjFGwPApRAeWfHBdm+7Ze9RxAxI7z6C4PNr2l1aP7Fe31y3AxZlQRd4SsK5TY3
         QQaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=hbozBWdpIYVrrkXyxTYUX7mJn1/ZDDgcNXOzYDgphu4=;
        b=oPsp5bC+MQZ6Ab9davwtcanMXSMQUhk8dxNmMWSXNS9PR6K8o0I2MxKxj7rjQwVQ2X
         OEZ/j2Wvz+GUOd9qR7Hmt66gnwEx//b/BgpuVXHagCNAQiImTGi9gvxK4Zjj8cU7bpeV
         KmU7KWEurvW5FqdLSEetMgXUfy07sggdwZ5+h3jG2FC1fvO0EAKHxWRB4i6DCBw61xs5
         jCiR2I/lwcWuxb68dZcLXtvWtiXOppsX/cFiRqgBa6ONWq8YOm8Ne3NbsykQnvmWfcca
         xpYnHtFe3IjHPA2+WdT3gMQm90WVmSiAurjH7nKOOXU18y+CSsvRPJ8Fl0FpAa+KJ1Sk
         m09g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=jFZX4mFp;
       spf=pass (google.com: domain of kraxel@redhat.com designates 216.205.24.124 as permitted sender) smtp.mailfrom=kraxel@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <kraxel@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [216.205.24.124])
        by mx.google.com with ESMTPS id bc4si18095907edb.161.2021.08.31.05.16.43
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 31 Aug 2021 05:16:43 -0700 (PDT)
Received-SPF: pass (google.com: domain of kraxel@redhat.com designates 216.205.24.124 as permitted sender) client-ip=216.205.24.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=jFZX4mFp;
       spf=pass (google.com: domain of kraxel@redhat.com designates 216.205.24.124 as permitted sender) smtp.mailfrom=kraxel@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1630412202;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hbozBWdpIYVrrkXyxTYUX7mJn1/ZDDgcNXOzYDgphu4=;
	b=jFZX4mFpE6HNrb7IAWYcaQZr+dgrTtYJzywThyI0PjGUnuazfpAN23XZSMMJrZp7zQ9fVn
	xvTK9tnc9PDVaMiLUV3ljEhZi5JXg6v3P6WxyQexBSX4+rxy7OUpB0El41XOrD/2Cny96C
	CwLk3rmCUdTd+vV3blkw+ShARXs4/FA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-537-YMNlV6tiOL2Xs9s8p5GZJA-1; Tue, 31 Aug 2021 08:16:41 -0400
X-MC-Unique: YMNlV6tiOL2Xs9s8p5GZJA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 493EA87D544;
	Tue, 31 Aug 2021 12:16:37 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.192.91])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C883A1007611;
	Tue, 31 Aug 2021 12:16:22 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
	id 50865180093E; Tue, 31 Aug 2021 14:15:45 +0200 (CEST)
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
Subject: [PATCH 05/29] tcg/module: move tcg_ss to module [accel/tcg]
Date: Tue, 31 Aug 2021 14:15:21 +0200
Message-Id: <20210831121545.2874233-6-kraxel@redhat.com>
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
X-TUID: Enxyn96qsc5C

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 accel/tcg/meson.build | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/accel/tcg/meson.build b/accel/tcg/meson.build
index 57e4ef12da23..6471fe7832d7 100644
--- a/accel/tcg/meson.build
+++ b/accel/tcg/meson.build
@@ -11,7 +11,7 @@ tcg_ss.add(files(
 tcg_ss.add(when: 'CONFIG_USER_ONLY', if_true: files('user-exec.c'))
 tcg_ss.add(when: 'CONFIG_SOFTMMU', if_false: files('user-exec-stub.c'))
 tcg_ss.add(when: 'CONFIG_PLUGIN', if_true: [files('plugin-gen.c'), libdl])
-specific_ss.add_all(when: 'CONFIG_TCG', if_true: tcg_ss)
+tcg_module_ss.add_all(when: 'CONFIG_TCG', if_true: tcg_ss)
 
 tcg_module_ss.add(when: ['CONFIG_SOFTMMU', 'CONFIG_TCG'], if_true: files(
   'tcg-accel-ops.c',
-- 
2.31.1
