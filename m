Received: by 2002:a19:5205:0:0:0:0:0 with SMTP id m5csp4976061lfb;
        Tue, 31 Aug 2021 05:19:33 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz+WGdr8vsud9pxJ50vL9ew1KN2bPYiiJ+iinKMZ43jTr+x3bmbizPDY5RXq7txu23zElLo
X-Received: by 2002:aa7:c5cb:: with SMTP id h11mr28937413eds.255.1630412372944;
        Tue, 31 Aug 2021 05:19:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1630412372; cv=none;
        d=google.com; s=arc-20160816;
        b=jI3lidD6XKQHB7ymH35qvqOyf9SRfqCH5z2kK3P0iT/FUiTsyH5YZ74GX3bsvakM3j
         9MtyR3AfmxU4sZ+scFxpbu3r+cvvheJV7V+EXAYUOp+VBE8Oa1lUSQIbwtEsKH9PlkC6
         4WO5JIaQj+zyu7YWkg5xuqBmwL40jPJYR32+RCe4fsax1HFbqRxDpxOHoFL9zSWsbk9W
         YvRca/J9Y0gcGt3c0hjDmADBzoM8uYpzyWIq2NfGGB94ION9KegKsZTvZqJY6a+snjEt
         60Ty5pVfuLAyDDCHS9dawhGiNywi0XH0ib8tRpcdWdEH2C6phWD8JvBqJRVdaRibHEge
         Gy9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=hq0XekWZ6wNI++fX5qK67SfjTvBuQ/Myz8WyFIG4GqY=;
        b=EpVVn/Euu/2AgxurfVkVJ2NxE5YbpmLp8aRVSEKHcCUiXXrPDeUNztUtSZHS6nC7iL
         SG0+C+WaQyztbUdkYRMwLxDY4rV2MP+sVjUXWnNRjVkUEW7cboTARy2uilu1AlJXIpQB
         1TTwuWrQDpEAr5I+5vhLO1buNetxkZBKDMtdgjzytrinP+lgOrIlCk1LVp246RDE3qUu
         h9NsfhpSK7sZLd9NjC7duXjDPJIAOPWgp+lYS6Bs0hYw/ktQDkjBkXgO+Ln1XxvnFIEz
         /nkySKhASm/CLzuQ4aiXN4enzuIT5jbXtMHA15jNBH5TwSaOYI9aIBiMBup1LEp7L7nJ
         UOKQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=btkBs+Oo;
       spf=pass (google.com: domain of kraxel@redhat.com designates 216.205.24.124 as permitted sender) smtp.mailfrom=kraxel@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <kraxel@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [216.205.24.124])
        by mx.google.com with ESMTPS id h6si15269763ede.238.2021.08.31.05.19.32
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 31 Aug 2021 05:19:32 -0700 (PDT)
Received-SPF: pass (google.com: domain of kraxel@redhat.com designates 216.205.24.124 as permitted sender) client-ip=216.205.24.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=btkBs+Oo;
       spf=pass (google.com: domain of kraxel@redhat.com designates 216.205.24.124 as permitted sender) smtp.mailfrom=kraxel@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1630412372;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hq0XekWZ6wNI++fX5qK67SfjTvBuQ/Myz8WyFIG4GqY=;
	b=btkBs+Ooso3by5pmAjPJop+iiU+QdSTfSQ+fILj9AW3k3gj2Z4V7qs+cWA8WZGKS1bCkXM
	Y8oI1FTIewWjqeepJJ0HFiY5sYzVuKpDc9PVhPg714yWKmgZtlUqZzn9KvzrNTL9nAxuyN
	tQoErc+YfYvxnxkV29g2SM7FtQijPi8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-345-jIS5CnXoMDiZwGqv9SumQA-1; Tue, 31 Aug 2021 08:19:30 -0400
X-MC-Unique: jIS5CnXoMDiZwGqv9SumQA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4AFF293922;
	Tue, 31 Aug 2021 12:19:27 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.192.91])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A149C1001281;
	Tue, 31 Aug 2021 12:19:11 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
	id 6608A18009F2; Tue, 31 Aug 2021 14:15:47 +0200 (CEST)
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
Subject: [PATCH 29/29] Revert "build: temporarily disable modular tcg"
Date: Tue, 31 Aug 2021 14:15:45 +0200
Message-Id: <20210831121545.2874233-30-kraxel@redhat.com>
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
X-TUID: ssmpZIuN5wU3

Everything is in place now, so re-enable modular tcg builds,
with alot more code actually being built modular now.

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 meson.build | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meson.build b/meson.build
index e83aa4f5c3c9..bf6378481250 100644
--- a/meson.build
+++ b/meson.build
@@ -94,7 +94,7 @@ endif
 
 modular_tcg = []
 # Darwin does not support references to thread-local variables in modules
-if false #targetos != 'darwin'
+if targetos != 'darwin'
   modular_tcg = ['i386-softmmu', 'x86_64-softmmu']
 endif
 
-- 
2.31.1
