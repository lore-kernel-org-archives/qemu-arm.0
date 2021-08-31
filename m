Received: by 2002:a19:5205:0:0:0:0:0 with SMTP id m5csp4973695lfb;
        Tue, 31 Aug 2021 05:16:43 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyNpAj3KEzTGD3p8TcJb9ofhhYDxIG3gBXVHjYiWHLFVAFMZWIHAmAI5jiEB895Lk8eRkyY
X-Received: by 2002:a17:906:4482:: with SMTP id y2mr11249238ejo.484.1630412203068;
        Tue, 31 Aug 2021 05:16:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1630412203; cv=none;
        d=google.com; s=arc-20160816;
        b=qyEXMAgT7pqJclRSgKk6wDEC0wZMBewC1udmHzZzeneV+Hak3pOcTpqt9T/dlUFF+/
         R5r/ciMt2J6fvhgepWFSZqjxqihe1nTcdyvrj3Pz7vhrHjhDQ8z3PysUUOHPo7zm9CeD
         V+isc2ahKD9aOIq+HWYBi3a15uVXNl7CbfXUonEMixyCkPezuUu9KRfxWJBKtIfgLbt6
         a+GnzpFcojQm/TzB4DjaSEksYyk3CxtY/YhXX4oFZuwd79oRrp3c2hLlINOO5xbWWRWs
         GeAqCIiQQE9C1AJNu1LmOBqUayBBMgbLpMPVD0xA8lv+VNdnKthpoqGseVuQg5leIQJS
         juVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=yIyj7/u3W3N3RozuL2ZT76lwvBJPxZBhD9UN/m86jgk=;
        b=lPIarN8QMdVrgY1b/vYVD3l6d641Q3iw6xJqQomvScss/Q74GmFyYxAJjT5BAkp//m
         AM5Fq4Kjm2OGNlEVFLgG9e3+Sg0z/Hg6rGNDOV7hPMo/5C1bvbb05JYPuDMYpoLc4/HB
         bnd25+1jzbNcRQti0IGjTz7TTsT/IML/cTldlGrQLzOk1LO7h3/+U6ogJLokSqaYXPji
         oyDES8toPvrZ6s5ERlWdlhbl2q3G38EnfvvHRSQaNF3Mi9mN1MyZ+Q2oDtr5b5ZbiEBT
         OP0RKq1/d3EU0/bhphgx7at+FPFJqXT6DVJzCdBNCtVKEzD22s5J/s4JNOmOXTu4AMYy
         L9aQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=VK7v0h0y;
       spf=pass (google.com: domain of kraxel@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=kraxel@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <kraxel@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id j8si17409244ejn.202.2021.08.31.05.16.42
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 31 Aug 2021 05:16:43 -0700 (PDT)
Received-SPF: pass (google.com: domain of kraxel@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=VK7v0h0y;
       spf=pass (google.com: domain of kraxel@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=kraxel@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1630412202;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=yIyj7/u3W3N3RozuL2ZT76lwvBJPxZBhD9UN/m86jgk=;
	b=VK7v0h0ypuOlMge3m1VTcK2chiFzI18KC8zPwMuQsKhY3TXkEKuztBYj3d31XiWC2AOwS6
	R9kmfMDI60/RJDxcYFqcWW4jJR1wJLS2pLyGLyrjavl1581rlQzzmFfN07VRBWnODNhAV8
	XKgbePWVq2biQqtDve+t0fY0AfNZWtE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-174-7RjnT5wVMEqx9TWNGWV4lA-1; Tue, 31 Aug 2021 08:16:40 -0400
X-MC-Unique: 7RjnT5wVMEqx9TWNGWV4lA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4F68A760C7;
	Tue, 31 Aug 2021 12:16:37 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.192.91])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C6F3F1001281;
	Tue, 31 Aug 2021 12:16:21 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
	id 45A47180093D; Tue, 31 Aug 2021 14:15:45 +0200 (CEST)
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
Subject: [PATCH 04/29] tcg/module: move cputlb.c to module
Date: Tue, 31 Aug 2021 14:15:20 +0200
Message-Id: <20210831121545.2874233-5-kraxel@redhat.com>
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
X-TUID: FpyZSYKF1smQ

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 accel/tcg/meson.build | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/accel/tcg/meson.build b/accel/tcg/meson.build
index d4df7681a811..57e4ef12da23 100644
--- a/accel/tcg/meson.build
+++ b/accel/tcg/meson.build
@@ -13,14 +13,11 @@ tcg_ss.add(when: 'CONFIG_SOFTMMU', if_false: files('user-exec-stub.c'))
 tcg_ss.add(when: 'CONFIG_PLUGIN', if_true: [files('plugin-gen.c'), libdl])
 specific_ss.add_all(when: 'CONFIG_TCG', if_true: tcg_ss)
 
-specific_ss.add(when: ['CONFIG_SOFTMMU', 'CONFIG_TCG'], if_true: files(
-  'cputlb.c',
-))
-
 tcg_module_ss.add(when: ['CONFIG_SOFTMMU', 'CONFIG_TCG'], if_true: files(
   'tcg-accel-ops.c',
   'tcg-accel-ops-mttcg.c',
   'tcg-accel-ops-icount.c',
   'tcg-accel-ops-rr.c',
   'hmp.c',
+  'cputlb.c',
 ))
-- 
2.31.1
