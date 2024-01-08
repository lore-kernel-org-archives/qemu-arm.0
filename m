Received: by 2002:a17:906:6698:b0:a28:f940:7a27 with SMTP id z24csp2389761ejo;
        Mon, 8 Jan 2024 08:37:47 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGo+hayNxzw9h35+Pfc7olfbOugqrB/PkgParaIive8ADdOf5vGuSF0dB7/S7BXGfVF5fU9
X-Received: by 2002:a05:620a:6201:b0:781:7ac2:d7d8 with SMTP id ou1-20020a05620a620100b007817ac2d7d8mr4222984qkn.100.1704731866756;
        Mon, 08 Jan 2024 08:37:46 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1704731866; cv=none;
        d=google.com; s=arc-20160816;
        b=t0Dp+O670n0XNjCpleQ1r5m2ECyozRC7MKzSau6zYiJgR9xsNRBpRt15B1lUVybc6O
         xQv6kr4uABXJ19vjafoI3lJCYBOXgCmOzja0AV5Hy6Y839R0RRElGw+bZdSbVsF+5GP7
         wCxg5gbLeMnk+QCIeIg23YuR5NMEPVI1yhIStXtDOEerKrlepY0Ea2d06IAPrG8jW+y9
         i8nJcvb3XgL0eRcGZf7N+t/jZnUqDbbT+gRNLB90Yi1vrXEjaID3H8rGr23kua38eBca
         HG07RSnyUgGMAJjrN5ihtCV767Z342bQejxGEu17t+W2wVw+iOpGXVZ4bTUraC950UBj
         Y5mQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=8JyAVituzHKzz/zXpAv4OyXDfgV7BDAfn1K6NqR7fpw=;
        fh=5fMz2F8zQkRjlaxnj3AO/pLGiW7hAhGPmcy5QVDwW54=;
        b=rez4KaU9ePOooENAjkssCQOn+FMKL81VaHIctluyY+VPEIM4N98JMhyaiVJwqWyhYp
         LcryGOA6OouLqtfgJ9ZUhhlMiaoI1f51nTjozMBiYSk64dTnBJlQhMuKBI0UG0YG4U7v
         Ajh7eunFkcQRLMf/4wAS2ClMCYc4gDw8yWt7+OPMwj0E3hxFHfj6HBrUdnLyrjrJYGkL
         ekZHfO7J0t8rr3i9XiVE46Nip3jZlgX775eRAE5xxf4SJaFx3XlAMBJxdB66SET6AIum
         B4cjoKAnqAHciEply1YCFTq7NQIwiTmKWSGwzFesAnvXSgkXOLJvJUCaQ/czUtoVjEU8
         2Z4g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=gR0J0DJ3;
       spf=pass (google.com: domain of stefanha@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=stefanha@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <stefanha@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id br13-20020a05620a460d00b0078126fbd340si43880qkb.596.2024.01.08.08.37.46
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jan 2024 08:37:46 -0800 (PST)
Received-SPF: pass (google.com: domain of stefanha@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=gR0J0DJ3;
       spf=pass (google.com: domain of stefanha@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=stefanha@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1704731866;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8JyAVituzHKzz/zXpAv4OyXDfgV7BDAfn1K6NqR7fpw=;
	b=gR0J0DJ3wPfFEWY18k72JlBsyAW9W0Sn6sjEIU2DeT69HKIPSPHvWhuR6y3kyVmYgelE4c
	FE7v79Wg/mcHqRKhqOa6H2+tZQ0zBg3bQ7+K7gIfywxulLTEE1caVjB3Qdm2OORBjmPzmg
	HS3y8rS1fs4BvYW1WwhObKD8/ynLK8M=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-668-xwrQBWUfPzqlTw3k0NIoCA-1; Mon,
 08 Jan 2024 11:37:43 -0500
X-MC-Unique: xwrQBWUfPzqlTw3k0NIoCA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com [10.11.54.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 514A83C025AC;
	Mon,  8 Jan 2024 16:37:41 +0000 (UTC)
Received: from localhost (unknown [10.39.194.85])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 14E8B2026F95;
	Mon,  8 Jan 2024 16:37:40 +0000 (UTC)
From: Stefan Hajnoczi <stefanha@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-s390x@nongnu.org,
	Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
	qemu-block@nongnu.org,
	Alistair Francis <alistair.francis@wdc.com>,
	Max Filippov <jcmvbkbc@gmail.com>,
	kvm@vger.kernel.org,
	Daniel Henrique Barboza <danielhb413@gmail.com>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	qemu-arm@nongnu.org,
	Jean-Christophe Dubois <jcd@tribudubois.net>,
	Jiri Slaby <jslaby@suse.cz>,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Eric Blake <eblake@redhat.com>,
	Paul Durrant <paul@xen.org>,
	BALATON Zoltan <balaton@eik.bme.hu>,
	Kevin Wolf <kwolf@redhat.com>,
	Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>,
	=?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	Roman Bolshakov <rbolshakov@ddn.com>,
	Reinoud Zandijk <reinoud@netbsd.org>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Gerd Hoffmann <kraxel@redhat.com>,
	Thomas Huth <thuth@redhat.com>,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	xen-devel@lists.xenproject.org,
	Anthony Perard <anthony.perard@citrix.com>,
	Weiwei Li <liwei1518@gmail.com>,
	qemu-ppc@nongnu.org,
	Sunil Muthuswamy <sunilmut@microsoft.com>,
	Halil Pasic <pasic@linux.ibm.com>,
	Song Gao <gaosong@loongson.cn>,
	Aurelien Jarno <aurelien@aurel32.net>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	=?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
	Andrey Smirnov <andrew.smirnov@gmail.com>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Eduardo Habkost <eduardo@habkost.net>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Marcelo Tosatti <mtosatti@redhat.com>,
	qemu-riscv@nongnu.org,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Alexander Graf <agraf@csgraf.de>,
	Markus Armbruster <armbru@redhat.com>,
	John Snow <jsnow@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Peter Xu <peterx@redhat.com>,
	Stefan Weil <sw@weilnetz.de>,
	Harsh Prateek Bora <harshpb@linux.ibm.com>,
	Hailiang Zhang <zhanghailiang@xfusion.com>,
	Hyman Huang <yong.huang@smartx.com>,
	Michael Roth <michael.roth@amd.com>,
	Fam Zheng <fam@euphon.net>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
	David Gibson <david@gibson.dropbear.id.au>,
	Artyom Tarasenko <atar4qemu@gmail.com>,
	Stefan Hajnoczi <stefanha@redhat.com>,
	Stafford Horne <shorne@gmail.com>,
	Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
	David Woodhouse <dwmw2@infradead.org>,
	Cameron Esfahani <dirty@apple.com>,
	Eric Farman <farman@linux.ibm.com>,
	Jason Wang <jasowang@redhat.com>,
	Nicholas Piggin <npiggin@gmail.com>,
	Ilya Leoshkevich <iii@linux.ibm.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	Hanna Reitz <hreitz@redhat.com>,
	Huacai Chen <chenhuacai@kernel.org>,
	Jagannathan Raman <jag.raman@oracle.com>,
	Elena Ufimtseva <elena.ufimtseva@oracle.com>,
	Bin Meng <bin.meng@windriver.com>,
	Fabiano Rosas <farosas@suse.de>,
	Akihiko Odaki <akihiko.odaki@daynix.com>,
	David Hildenbrand <david@redhat.com>
Subject: [PULL 1/6] iothread: Remove unused Error** argument in aio_context_set_aio_params
Date: Mon,  8 Jan 2024 11:37:30 -0500
Message-ID: <20240108163735.254732-2-stefanha@redhat.com>
In-Reply-To: <20240108163735.254732-1-stefanha@redhat.com>
References: <20240108163735.254732-1-stefanha@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.4
X-TUID: 5hHUxJjYiNtb

From: Philippe Mathieu-Daudé <philmd@linaro.org>

aio_context_set_aio_params() doesn't use its undocumented
Error** argument. Remove it to simplify.

Note this removes a use of "unchecked Error**" in
iothread_set_aio_context_params().

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Markus Armbruster <armbru@redhat.com>
Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
Message-ID: <20231120171806.19361-1-philmd@linaro.org>
---
 include/block/aio.h | 3 +--
 iothread.c          | 3 +--
 util/aio-posix.c    | 3 +--
 util/aio-win32.c    | 3 +--
 util/main-loop.c    | 5 +----
 5 files changed, 5 insertions(+), 12 deletions(-)

diff --git a/include/block/aio.h b/include/block/aio.h
index af05512a7d..c802a392e5 100644
--- a/include/block/aio.h
+++ b/include/block/aio.h
@@ -699,8 +699,7 @@ void aio_context_set_poll_params(AioContext *ctx, int64_t max_ns,
  * @max_batch: maximum number of requests in a batch, 0 means that the
  *             engine will use its default
  */
-void aio_context_set_aio_params(AioContext *ctx, int64_t max_batch,
-                                Error **errp);
+void aio_context_set_aio_params(AioContext *ctx, int64_t max_batch);
 
 /**
  * aio_context_set_thread_pool_params:
diff --git a/iothread.c b/iothread.c
index b753286414..6c1fc8c856 100644
--- a/iothread.c
+++ b/iothread.c
@@ -170,8 +170,7 @@ static void iothread_set_aio_context_params(EventLoopBase *base, Error **errp)
     }
 
     aio_context_set_aio_params(iothread->ctx,
-                               iothread->parent_obj.aio_max_batch,
-                               errp);
+                               iothread->parent_obj.aio_max_batch);
 
     aio_context_set_thread_pool_params(iothread->ctx, base->thread_pool_min,
                                        base->thread_pool_max, errp);
diff --git a/util/aio-posix.c b/util/aio-posix.c
index 7f2c99729d..266c9dd35f 100644
--- a/util/aio-posix.c
+++ b/util/aio-posix.c
@@ -777,8 +777,7 @@ void aio_context_set_poll_params(AioContext *ctx, int64_t max_ns,
     aio_notify(ctx);
 }
 
-void aio_context_set_aio_params(AioContext *ctx, int64_t max_batch,
-                                Error **errp)
+void aio_context_set_aio_params(AioContext *ctx, int64_t max_batch)
 {
     /*
      * No thread synchronization here, it doesn't matter if an incorrect value
diff --git a/util/aio-win32.c b/util/aio-win32.c
index 948ef47a4d..d144f9391f 100644
--- a/util/aio-win32.c
+++ b/util/aio-win32.c
@@ -438,7 +438,6 @@ void aio_context_set_poll_params(AioContext *ctx, int64_t max_ns,
     }
 }
 
-void aio_context_set_aio_params(AioContext *ctx, int64_t max_batch,
-                                Error **errp)
+void aio_context_set_aio_params(AioContext *ctx, int64_t max_batch)
 {
 }
diff --git a/util/main-loop.c b/util/main-loop.c
index 797b640c41..63b4cda84a 100644
--- a/util/main-loop.c
+++ b/util/main-loop.c
@@ -192,10 +192,7 @@ static void main_loop_update_params(EventLoopBase *base, Error **errp)
         return;
     }
 
-    aio_context_set_aio_params(qemu_aio_context, base->aio_max_batch, errp);
-    if (*errp) {
-        return;
-    }
+    aio_context_set_aio_params(qemu_aio_context, base->aio_max_batch);
 
     aio_context_set_thread_pool_params(qemu_aio_context, base->thread_pool_min,
                                        base->thread_pool_max, errp);
-- 
2.43.0
