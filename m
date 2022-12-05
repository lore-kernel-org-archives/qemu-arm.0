Received: by 2002:a17:906:80c3:b0:7ae:d8f:8937 with SMTP id a3csp3377892ejx;
        Mon, 5 Dec 2022 01:53:18 -0800 (PST)
X-Google-Smtp-Source: AA0mqf4huSWqzkb5hpY7r+oW3e0WbAHR7ir0pUhHsw9rcPokh/8QBvVZfWTs80xzvMImiKjOlRYD
X-Received: by 2002:aa7:db13:0:b0:46b:aee1:3b46 with SMTP id t19-20020aa7db13000000b0046baee13b46mr20110864eds.44.1670233998634;
        Mon, 05 Dec 2022 01:53:18 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1670233998; cv=none;
        d=google.com; s=arc-20160816;
        b=PeuTo4hWgHOZih7f9/KriTob1YLvYS/2t9kr3K25sUeLTsgZz/euSKbYKlk1mcQib9
         Mty9EZLVQGttlWHOslOpG1AX5uMwgvZbGvQLud3MYndQbbj3zGcDupm4SCagLkKyz7eB
         J/8G7nMv+LPqPunuAgcW++gLZOj+vvSy7bvuAKm7PqgkZTDClOuogUC5AlGgYdM6JN8y
         F54vu36x0QyxkvipLT6MTRLPCNv5opY4mr7CVZ6glGKurMKJ1Ln2w2gbluhf27JE4Mki
         +c3sXbhuyNQ8R7mi0UYPBcegir7ejBb/5YSNjiL6QO3C2PfhM6cQ3A2B6t8IPt5eZRfn
         hvfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=i2+Mno2782955D37e2Tk3rpJLYwAGRf+TLqC5a0fYsE=;
        b=JLKLTtmcleg5CmuQmJpzPKQxfMewS0405Fb8+pbG550wERbw7OcIeh84MdDDoTOe/M
         Nb+kPM7U/pcP8ny6QX2wSmyVaCRxrta1Xtn7GvgzvkrDGFuSjxsPpX+xvCTGfd2KQkPp
         HeEtpi0iV8Isk1nwu8/0KbXMC1kwpxH+ENskxIyyISz6xYQuaaRRxMWT1VyEj/Lagr2e
         g32/g0egAyxsUhwgezvK5OlBpL2uciMoUvUAqvYaz6Rxc6AMBcPvbfSQy66pwdnBmukR
         SyDRQz1NANp4VMAkkEgtOqS9oAFWTw4MGgw7WobuCaAALlD8CeFqNsYoh01sbKQlEKSs
         ZfPw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Gt0X0oqc;
       spf=pass (google.com: domain of quintela@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=quintela@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <quintela@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id du15-20020a17090772cf00b00780488c11bbsi12986249ejc.388.2022.12.05.01.53.18
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 Dec 2022 01:53:18 -0800 (PST)
Received-SPF: pass (google.com: domain of quintela@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Gt0X0oqc;
       spf=pass (google.com: domain of quintela@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=quintela@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1670233997;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=i2+Mno2782955D37e2Tk3rpJLYwAGRf+TLqC5a0fYsE=;
	b=Gt0X0oqclauMlmYCZexZ5PycCHQLKs41W3j3WE5aw9OwC328mx4vfwhnehtYpHeBCIEL79
	Xlj3P81DpvM6uggj96Y78DQJgOOFmXn/iaQG4j3QMNXd8s3oMYXelvoIO7JMQGjG4XPViu
	A6yr0ziTHE0ABQx5IaLF/LtURCXKH0U=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-416-CHUk4CsCOM6mJ6mmfIORaw-1; Mon, 05 Dec 2022 04:53:14 -0500
X-MC-Unique: CHUk4CsCOM6mJ6mmfIORaw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com [10.11.54.6])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0FD6E894E81;
	Mon,  5 Dec 2022 09:53:13 +0000 (UTC)
Received: from secure.mitica (unknown [10.39.194.135])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 7B08C2166B29;
	Mon,  5 Dec 2022 09:53:05 +0000 (UTC)
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
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Subject: [PATCH v2 04/51] hw/display/qxl: Have qxl_log_command Return early if no log_cmd handler
Date: Mon,  5 Dec 2022 10:51:41 +0100
Message-Id: <20221205095228.1314-5-quintela@redhat.com>
In-Reply-To: <20221205095228.1314-1-quintela@redhat.com>
References: <20221205095228.1314-1-quintela@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
X-TUID: dhjRCq6zRJbL

From: Philippe Mathieu-Daudé <philmd@linaro.org>

Only 3 command types are logged: no need to call qxl_phys2virt()
for the other types. Using different cases will help to pass
different structure sizes to qxl_phys2virt() in a pair of commits.

Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
Message-Id: <20221128202741.4945-2-philmd@linaro.org>
---
 hw/display/qxl-logger.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/hw/display/qxl-logger.c b/hw/display/qxl-logger.c
index 68bfa47568..1bcf803db6 100644
--- a/hw/display/qxl-logger.c
+++ b/hw/display/qxl-logger.c
@@ -247,6 +247,16 @@ int qxl_log_command(PCIQXLDevice *qxl, const char *ring, QXLCommandExt *ext)
             qxl_name(qxl_type, ext->cmd.type),
             compat ? "(compat)" : "");
 
+    switch (ext->cmd.type) {
+    case QXL_CMD_DRAW:
+        break;
+    case QXL_CMD_SURFACE:
+        break;
+    case QXL_CMD_CURSOR:
+        break;
+    default:
+        goto out;
+    }
     data = qxl_phys2virt(qxl, ext->cmd.data, ext->group_id);
     if (!data) {
         return 1;
@@ -269,6 +279,7 @@ int qxl_log_command(PCIQXLDevice *qxl, const char *ring, QXLCommandExt *ext)
         qxl_log_cmd_cursor(qxl, data, ext->group_id);
         break;
     }
+out:
     fprintf(stderr, "\n");
     return 0;
 }
-- 
2.38.1
