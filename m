Received: by 2002:a17:906:80c3:b0:7ae:d8f:8937 with SMTP id a3csp3377822ejx;
        Mon, 5 Dec 2022 01:53:08 -0800 (PST)
X-Google-Smtp-Source: AA0mqf6SLI5DTV5bigfoLCOFiCxU+sjZl7p1pQV9+wzDbM6wTkeu9jYspz+vaJZsC40T0KAXJIKQ
X-Received: by 2002:a0c:c3cc:0:b0:4c6:a05d:f67e with SMTP id p12-20020a0cc3cc000000b004c6a05df67emr57028020qvi.4.1670233988102;
        Mon, 05 Dec 2022 01:53:08 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1670233988; cv=none;
        d=google.com; s=arc-20160816;
        b=VaUiMWjlU4DNBWAadEED2fvlN6WfaWW64YifEScaogvxWCIGaeP9LW6icz2mofsYgT
         qHtbEf1zQK3M5k4bp6Jo0NIVVuGP1p7gd06nc4EBkLmu07wuk2HjwJo1iZCBhPzJ5K4T
         ZW1FaXml4OpFOnx6HYmUDMqE3fM0O8eumvbDr2mKXvUz+QpITVIm0Zz0Uo5sfNHBW4i/
         JUhueJ8c9Gbf11R1cjjprtod8CricynNAJD6mXksnFCCg30O9mdPArmgLYSzyiOI0+P0
         kCnXvKdbNd7bDnhvQNK1UOIWCg7gzTTodIJSRl5V2ohxfx0GzsVWzq3Go9LBLuPbUi5W
         oZYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=gM1FzBim53KQXgBVytxLzbWYxEf9vN7NkiErlAjlFr4=;
        b=v8qCuNKJeQiyhnud54TjCMa0GerM7xWLjw7MlovjxduNB2y3mtQblwfDdlclfzdm42
         GLiaJuv2vL0nerfaRMYZWPIdwZaypmzbaaDVSPcJ225vQ/n0M9khIcRWDVwC7GOhWWCD
         Y2LaAeEu0fAhAe3NFAeYLhQSr0B1vYxCEJ89BfMwAWrrHTmKzSnBoNguebWmJxkkMRLO
         5dcMQsqVyNLG/qrYIaFKDLB5MBBBb5bN7w/m+zyNXZM31DCVLsk/9QQMg0ZCUcrnsHPF
         cxHp8fg9oWxxlYbitMBpZw9yk25U9vkN+dMLkbfJExGCXuxIEfGwvVqLFQ5bQUcZPbiw
         0uBA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=GhOLvIcU;
       spf=pass (google.com: domain of quintela@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=quintela@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <quintela@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id c6-20020a05620a268600b006fc97875494si8055713qkp.650.2022.12.05.01.53.07
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 Dec 2022 01:53:08 -0800 (PST)
Received-SPF: pass (google.com: domain of quintela@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=GhOLvIcU;
       spf=pass (google.com: domain of quintela@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=quintela@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1670233987;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=gM1FzBim53KQXgBVytxLzbWYxEf9vN7NkiErlAjlFr4=;
	b=GhOLvIcUi6AonoFAP5/3J+q9Yd2uW5obTnFgJuqwAxcqMfecFt8EAHh97Xi56igk3MEZd8
	VU6EOcqr9X2vrpmFjyx6dToLxnH90a0NykrcaUAZXo3ddkcfURqoffaEMNddBPigpaZC4u
	TTqJ1MU4vMJz+fidZAHP/6jJYDeXg6g=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-232-y6LLJ39VMn-SjpfmQaPpNg-1; Mon, 05 Dec 2022 04:53:06 -0500
X-MC-Unique: y6LLJ39VMn-SjpfmQaPpNg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com [10.11.54.6])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2F4AA1C09B82;
	Mon,  5 Dec 2022 09:53:05 +0000 (UTC)
Received: from secure.mitica (unknown [10.39.194.135])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 7BFA32166B29;
	Mon,  5 Dec 2022 09:52:57 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Cc: Fam Zheng <fam@euphon.net>,
	Thomas Huth <huth@tuxfamily.org>,
	Viresh Kumar <viresh.kumar@linaro.org>,
	Kevin Wolf <kwolf@redhat.com>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Laurent Vivier <laurent@vivier.eu>,
	Eric Blake <eblake@redhat.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Raphael Norwitz <raphael.norwitz@nutanix.com>,
	Stefan Hajnoczi <stefanha@redhat.com>,
	Juan Quintela <quintela@redhat.com>,
	virtio-fs@redhat.com,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	"Gonglei (Arei)" <arei.gonglei@huawei.com>,
	qemu-block@nongnu.org,
	Xiaojuan Yang <yangxiaojuan@loongson.cn>,
	Thomas Huth <thuth@redhat.com>,
	Ilya Leoshkevich <iii@linux.ibm.com>,
	Eduardo Habkost <eduardo@habkost.net>,
	Gerd Hoffmann <kraxel@redhat.com>,
	"Dr. David Alan Gilbert" <dgilbert@redhat.com>,
	Alex Williamson <alex.williamson@redhat.com>,
	Eric Farman <farman@linux.ibm.com>,
	Halil Pasic <pasic@linux.ibm.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
	Jason Wang <jasowang@redhat.com>,
	Laurent Vivier <lvivier@redhat.com>,
	Song Gao <gaosong@loongson.cn>,
	qemu-s390x@nongnu.org,
	Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>,
	Klaus Jensen <its@irrelevant.dk>,
	John Snow <jsnow@redhat.com>,
	Michael Tokarev <mjt@tls.msk.ru>,
	qemu-arm@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Keith Busch <kbusch@kernel.org>,
	David Hildenbrand <david@redhat.com>,
	qemu-trivial@nongnu.org,
	Hanna Reitz <hreitz@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Wilfred Mallawa <wilfred.mallawa@wdc.com>,
	Pavel Dovgalyuk <Pavel.Dovgalyuk@ispras.ru>
Subject: [PATCH v2 03/51] replay: Fix declaration of replay_read_next_clock
Date: Mon,  5 Dec 2022 10:51:40 +0100
Message-Id: <20221205095228.1314-4-quintela@redhat.com>
In-Reply-To: <20221205095228.1314-1-quintela@redhat.com>
References: <20221205095228.1314-1-quintela@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
X-TUID: br2NlonKeIC/

From: Richard Henderson <richard.henderson@linaro.org>

Fixes the build with gcc 13:

replay/replay-time.c:34:6: error: conflicting types for  \
  'replay_read_next_clock' due to enum/integer mismatch; \
  have 'void(ReplayClockKind)' [-Werror=enum-int-mismatch]
   34 | void replay_read_next_clock(ReplayClockKind kind)
      |      ^~~~~~~~~~~~~~~~~~~~~~
In file included from ../qemu/replay/replay-time.c:14:
replay/replay-internal.h:139:6: note: previous declaration of \
  'replay_read_next_clock' with type 'void(unsigned int)'
  139 | void replay_read_next_clock(unsigned int kind);
      |      ^~~~~~~~~~~~~~~~~~~~~~

Fixes: 8eda206e090 ("replay: recording and replaying clock ticks")
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Wilfred Mallawa <wilfred.mallawa@wdc.com>
Reviewed-by: Pavel Dovgalyuk <Pavel.Dovgalyuk@ispras.ru>
Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
Message-Id: <20221129010547.284051-1-richard.henderson@linaro.org>
---
 replay/replay-internal.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/replay/replay-internal.h b/replay/replay-internal.h
index 89e377be90..b6836354ac 100644
--- a/replay/replay-internal.h
+++ b/replay/replay-internal.h
@@ -136,7 +136,7 @@ bool replay_next_event_is(int event);
 /*! Reads next clock value from the file.
     If clock kind read from the file is different from the parameter,
     the value is not used. */
-void replay_read_next_clock(unsigned int kind);
+void replay_read_next_clock(ReplayClockKind kind);
 
 /* Asynchronous events queue */
 
-- 
2.38.1
