Received: by 2002:a19:5205:0:0:0:0:0 with SMTP id m5csp4973283lfb;
        Tue, 31 Aug 2021 05:16:12 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy5U8Cmjzz4JnBbXtsvq0WfEalfJJD7EzSiRslT/Q+kQeCzS4psBFYRD2pmYuh6/2e1k2G5
X-Received: by 2002:aa7:d645:: with SMTP id v5mr29608506edr.145.1630412172673;
        Tue, 31 Aug 2021 05:16:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1630412172; cv=none;
        d=google.com; s=arc-20160816;
        b=KSpYER0fyLhrRHJfIAZADHHMhhVkO2UzLsuiwBWDbcyFsUPsJsk6nEyRyGAWgu4J7c
         WPINCFGyV9S5FCvG21dwwPthA2WYUbxsvK5oXlG1BM2ecayyQH9sgHVQSKQOXCl4n2xK
         3YXJ5XuEi7EJuz3tx5lVYQGDwE2ui/rivNga/dKoELZsyE98cCWH9AJBU/JANfKYEVNu
         y3oUJgRgJpFV2Tz9GZjplAwnDqo7iW4M4q6Jl51H7Yh1mOFFXSfXxYaL9i2Jct+aLnNw
         0nnSX3L7LQlNaFbisvme1h8/PJpE11M/DUWEcqcLOpIWAiHaKBENNh6yKF6eBkDV0mn2
         UcdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=LK4fnylC73dEzKTJly+qoqoxWFfW8wdmNlU+K3NKCGU=;
        b=JSCwPJmcrLbwQ4Jxy/t1R8uFBKd6PANsxZFK+U3CEUswpM36J5AuOM+H1eOft1Uc0k
         /TYomP70jo6VhyNOP6MQ0wb/KBz3hd2b2iW3GEr07y/FJHa5cw0/fMGPgYL2RVV4WAel
         JFY32ikrDP+eQq18YT5jbwe4dvxQIzqEXWGXKfRrxGCceVOPehgV0lYgYWSo5A5eK3mu
         mY3YrQcMe3XQ1drgb7RBSHOP4P1sb9KgdzfV0ZUcG2FUAdirWI6+3RJV0dfrD334RhCs
         VmCzmbnx73T54lXsKV/gg33T9ruc3+3vJjNwwdcEcOQl6+H8EIGz+PupiCTVAwVscXBX
         /aHQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=ZdhwEnPq;
       spf=pass (google.com: domain of kraxel@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=kraxel@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <kraxel@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id d10si18145713edy.383.2021.08.31.05.16.11
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 31 Aug 2021 05:16:12 -0700 (PDT)
Received-SPF: pass (google.com: domain of kraxel@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=ZdhwEnPq;
       spf=pass (google.com: domain of kraxel@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=kraxel@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1630412170;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=LK4fnylC73dEzKTJly+qoqoxWFfW8wdmNlU+K3NKCGU=;
	b=ZdhwEnPqt8iy2L5jQeayonDdAjrUFHAwm4rin8FVr3twuE3M3UjklfTM62GsQ3wnOhbGEZ
	xJU/b7P0KR+ATg0LHGAI6sUVJe39zq9GeGvGRlV1hpKkBhAx4kyG216oTMhhPZqTQs387m
	ENNa5gL8quqLoAs5V2An6/U19S4B0Ps=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-470-OzDvGCrbNuqQrndV3ZgBnA-1; Tue, 31 Aug 2021 08:16:06 -0400
X-MC-Unique: OzDvGCrbNuqQrndV3ZgBnA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 837B9100F766;
	Tue, 31 Aug 2021 12:16:03 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.192.91])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id AD98C60843;
	Tue, 31 Aug 2021 12:15:46 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
	id 1DB3C1800939; Tue, 31 Aug 2021 14:15:45 +0200 (CEST)
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
Subject: [PATCH 01/29] build: temporarily disable modular tcg
Date: Tue, 31 Aug 2021 14:15:17 +0200
Message-Id: <20210831121545.2874233-2-kraxel@redhat.com>
In-Reply-To: <20210831121545.2874233-1-kraxel@redhat.com>
References: <20210831121545.2874233-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
X-TUID: vtOprqDknBEN

Allows more fine-grained patches
without breaking bisecting.

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 meson.build | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meson.build b/meson.build
index bf6378481250..e83aa4f5c3c9 100644
--- a/meson.build
+++ b/meson.build
@@ -94,7 +94,7 @@ endif
 
 modular_tcg = []
 # Darwin does not support references to thread-local variables in modules
-if targetos != 'darwin'
+if false #targetos != 'darwin'
   modular_tcg = ['i386-softmmu', 'x86_64-softmmu']
 endif
 
-- 
2.31.1
