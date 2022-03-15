Received: by 2002:a05:6512:204:0:0:0:0 with SMTP id a4csp2925611lfo;
        Tue, 15 Mar 2022 07:42:03 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwYzLbpJMWvUu1EBrPXtQQV2+h6BBWWLfwvotV6n8+NIDm4BrkxD2hdW8RMzBrf65sLQMia
X-Received: by 2002:a17:907:1b20:b0:6da:649b:d99e with SMTP id mp32-20020a1709071b2000b006da649bd99emr22854242ejc.712.1647355323392;
        Tue, 15 Mar 2022 07:42:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1647355323; cv=none;
        d=google.com; s=arc-20160816;
        b=YeXPzIxJNLkUf1LteIChuTqMIXrZag65yqL1paVI8AB7RODAHcL9HJW/lHW24MazU/
         KEnPTWv+tcC7ixBb2pjtdEBY7ye7mQWAl98n5A7bmTDDGBrKFcGgUCSmx0Rhog+Haqsj
         b6X/TBJY99SfQgsvWSk8d5u15hDTFPnMf2cxaPjQQzu6NTeqIpiV9mIFt+hv2jerxGJm
         mgckOnXqNTJLPsOdsnkk4/9M8AKT0GXmYSUV7iwzZzaC9yrHt3I0cryiWTKoLy6LoS6P
         jNWe/kKeeH/pynb58yTLItYxHdtPf9PWx9Zd4ALOIG5arBSdpQv9TzDsod86b4hVkygf
         KeLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=F9p92xVdbAU558Jcfq2dXxSaOx5fAK5gBBxvOK2lDYo=;
        b=SPCiNhRp4jz66ONrUa/dkV8Qc6cXgWi1ZjtsLdXt3aNyhPMnHMXvKdc929mm0yROV6
         R47prqqbO3cj4Kqum1XAzKGM7abEfyfNvJpkXGgQhuDFyZOVZA0rh/89KDzN3DJgrPPX
         vkq4zdRQBN+kGCnHF+avdoR9HmtDGp6yOfW/DJlFaxScv/J9ao4G/mRFc4tlT8/Tq7Jy
         j8jODAySXU9Bqg9F2QPsoSyC+esBP4d9prqum4urmzdO/pyX97+9Gj1fadmDbUc3xyAn
         azIKVqW2jC5VjwBC6KnuXwMlZGit2B3Ymo5se1agwjLsuZed1+kagNcQSgPDGFxKx/Q0
         CAGA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=At5nnrjD;
       spf=pass (google.com: domain of armbru@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=armbru@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <armbru@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id qa42-20020a17090786aa00b006da86dcfd6fsi12179263ejc.14.2022.03.15.07.42.03
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 15 Mar 2022 07:42:03 -0700 (PDT)
Received-SPF: pass (google.com: domain of armbru@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=At5nnrjD;
       spf=pass (google.com: domain of armbru@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=armbru@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1647355322;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=F9p92xVdbAU558Jcfq2dXxSaOx5fAK5gBBxvOK2lDYo=;
	b=At5nnrjDBwjZ1UORLtere9g2Yn5yjcK5zGtosgm7bkYVNe4ZyD+SiDuMgNXLQui7IQ8zt5
	uwHWSYnNqFgrYrJdy2P1DoVY00QM67kDMH++gY3a1Wx5CN4y/5SE5/Ud8GfUlpc+DILQDn
	EJssbVC67n9VXKexP57qQpEh/RZLpeI=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-638-2vIvU3WdPUWYbINmL8lYeg-1; Tue, 15 Mar 2022 10:42:01 -0400
X-MC-Unique: 2vIvU3WdPUWYbINmL8lYeg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com [10.11.54.5])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id BA3492999B47;
	Tue, 15 Mar 2022 14:41:58 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.36.112.3])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E65822EFB0;
	Tue, 15 Mar 2022 14:41:57 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id C2F2121E66FC; Tue, 15 Mar 2022 15:41:56 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Gerd Hoffmann <kraxel@redhat.com>,
	Christian Schoenebeck <qemu_oss@crudebyte.com>,
	"Gonglei (Arei)" <arei.gonglei@huawei.com>,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Igor Mammedov <imammedo@redhat.com>,
	Ani Sinha <ani@anisinha.ca>,
	Laurent Vivier <lvivier@redhat.com>,
	Amit Shah <amit@kernel.org>,
	Peter Maydell <peter.maydell@linaro.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Anthony Perard <anthony.perard@citrix.com>,
	Paul Durrant <paul@xen.org>,
	=?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
	Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
	Corey Minyard <cminyard@mvista.com>,
	Patrick Venture <venture@google.com>,
	Eduardo Habkost <eduardo@habkost.net>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Peter Xu <peterx@redhat.com>,
	Jason Wang <jasowang@redhat.com>,
	=?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
	Daniel Henrique Barboza <danielhb413@gmail.com>,
	David Gibson <david@gibson.dropbear.id.au>,
	Greg Kurz <groug@kaod.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	Jean-Christophe Dubois <jcd@tribudubois.net>,
	Keith Busch <kbusch@kernel.org>,
	Klaus Jensen <its@irrelevant.dk>,
	Yuval Shaia <yuval.shaia.ml@gmail.com>,
	Yoshinori Sato <ysato@users.sourceforge.jp>,
	Magnus Damm <magnus.damm@gmail.com>,
	Fabien Chouteau <chouteau@adacore.com>,
	KONRAD Frederic <frederic.konrad@adacore.com>,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	Artyom Tarasenko <atar4qemu@gmail.com>,
	Alex Williamson <alex.williamson@redhat.com>,
	Eric Auger <eric.auger@redhat.com>,
	Max Filippov <jcmvbkbc@gmail.com>,
	Juan Quintela <quintela@redhat.com>,
	"Dr. David Alan Gilbert" <dgilbert@redhat.com>,
	Konstantin Kostiuk <kkostiuk@redhat.com>,
	Michael Roth <michael.roth@amd.com>,
	=?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	David Hildenbrand <david@redhat.com>,
	Wenchao Wang <wenchao.wang@intel.com>,
	Kamil Rytarowski <kamil@netbsd.org>,
	Reinoud Zandijk <reinoud@netbsd.org>,
	Sunil Muthuswamy <sunilmut@microsoft.com>,
	Cornelia Huck <cohuck@redhat.com>,
	Thomas Huth <thuth@redhat.com>,
	Eric Blake <eblake@redhat.com>,
	Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
	John Snow <jsnow@redhat.com>,
	kvm@vger.kernel.org,
	qemu-arm@nongnu.org,
	xen-devel@lists.xenproject.org,
	qemu-ppc@nongnu.org,
	qemu-block@nongnu.org,
	haxm-team@intel.com,
	qemu-s390x@nongnu.org
Subject: [PATCH v2 1/3] scripts/coccinelle: New use-g_new-etc.cocci
Date: Tue, 15 Mar 2022 15:41:54 +0100
Message-Id: <20220315144156.1595462-2-armbru@redhat.com>
In-Reply-To: <20220315144156.1595462-1-armbru@redhat.com>
References: <20220315144156.1595462-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: yyMeYJrjc9Cm

This is the semantic patch from commit b45c03f585 "arm: Use g_new() &
friends where that makes obvious sense".

Signed-off-by: Markus Armbruster <armbru@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
---
 scripts/coccinelle/use-g_new-etc.cocci | 75 ++++++++++++++++++++++++++
 1 file changed, 75 insertions(+)
 create mode 100644 scripts/coccinelle/use-g_new-etc.cocci

diff --git a/scripts/coccinelle/use-g_new-etc.cocci b/scripts/coccinelle/use-g_new-etc.cocci
new file mode 100644
index 0000000000..e2280e93b3
--- /dev/null
+++ b/scripts/coccinelle/use-g_new-etc.cocci
@@ -0,0 +1,75 @@
+// Use g_new() & friends where that makes obvious sense
+@@
+type T;
+@@
+-g_malloc(sizeof(T))
++g_new(T, 1)
+@@
+type T;
+@@
+-g_try_malloc(sizeof(T))
++g_try_new(T, 1)
+@@
+type T;
+@@
+-g_malloc0(sizeof(T))
++g_new0(T, 1)
+@@
+type T;
+@@
+-g_try_malloc0(sizeof(T))
++g_try_new0(T, 1)
+@@
+type T;
+expression n;
+@@
+-g_malloc(sizeof(T) * (n))
++g_new(T, n)
+@@
+type T;
+expression n;
+@@
+-g_try_malloc(sizeof(T) * (n))
++g_try_new(T, n)
+@@
+type T;
+expression n;
+@@
+-g_malloc0(sizeof(T) * (n))
++g_new0(T, n)
+@@
+type T;
+expression n;
+@@
+-g_try_malloc0(sizeof(T) * (n))
++g_try_new0(T, n)
+@@
+type T;
+expression p, n;
+@@
+-g_realloc(p, sizeof(T) * (n))
++g_renew(T, p, n)
+@@
+type T;
+expression p, n;
+@@
+-g_try_realloc(p, sizeof(T) * (n))
++g_try_renew(T, p, n)
+@@
+type T;
+expression n;
+@@
+-(T *)g_new(T, n)
++g_new(T, n)
+@@
+type T;
+expression n;
+@@
+-(T *)g_new0(T, n)
++g_new0(T, n)
+@@
+type T;
+expression p, n;
+@@
+-(T *)g_renew(T, p, n)
++g_renew(T, p, n)
-- 
2.35.1
