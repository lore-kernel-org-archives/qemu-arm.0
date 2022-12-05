Received: by 2002:a17:906:80c3:b0:7ae:d8f:8937 with SMTP id a3csp3378125ejx;
        Mon, 5 Dec 2022 01:53:51 -0800 (PST)
X-Google-Smtp-Source: AA0mqf4AFBbbhONOY0P/ozvN0nWKmBaRbKDBtJoVWd133gVegdRUF4cVYg+RNOcFwy+8LZVeyxJs
X-Received: by 2002:ac8:4d81:0:b0:3a6:9efa:d019 with SMTP id a1-20020ac84d81000000b003a69efad019mr10654151qtw.581.1670234031200;
        Mon, 05 Dec 2022 01:53:51 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1670234031; cv=none;
        d=google.com; s=arc-20160816;
        b=fZuGMN0sFRZ/wrx75uWkbMPzFuvnCmFnNSPEy0Io4U4GC67XfHSOvPDW+JE4bOwO1U
         cSBIYXGbO/qO990puxPXOk3wNAwWyd6c18pSwhZSjkH2e9uAcojbPoHgoQfnXzFbAFc1
         XXXIVHono3Q27/IffxVc4GG6nz07e4nzkylTRsgwPAFcxoUKV/L4/ToUgZ0Bz7rrBbVW
         gDXyRZEEJq3WgZs5dCIV0jgoD/HL0VtEsrQErJCe2YLz6rWODL9H6S/pGV097DcUYHzq
         ls34j8h/B4yR9kQ6y3gjj1S6fKqZcdelrBVr3IejRQcGlwA0QcA+AD31OcdSJIl0TWN9
         twCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=sWawvSWadu0bL+au53S7AJrJqJZVUFdCmV8iHivocyk=;
        b=bziF/33/fddUbbcwUcIWRI3jEvmgVKyE4hWDkLkk/8RQ3qgXWLwE/15BT0LI+xU/gK
         RqrWCdHxhUngH8UFW7qNniE1OCC53g7P79x/9yhJfgjtV1CgzbUnwTOXOW/Zf5NJiGr1
         TlWCyV/fnIdRTKLRttZa1lP1Ln+l5CECveOJaKqQmEn5mQ/nsTnl+ZTnRJnogmVb4zgA
         zIMmCsjSF90XnBIBG+nV3sWnm+2UbZWQ8NAY1H9yt+nHTkj0o79ym9HehayoJSVSI+jX
         efJG6DBRLryyFJ+fDQJoXEV976wbQkD/HafUNTwiRW21JVYnfeHu50/R9VQPooOanOs0
         bJUA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=NSd2WhuP;
       spf=pass (google.com: domain of quintela@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=quintela@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <quintela@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id gf15-20020a056214250f00b004bde8bb7489si7341861qvb.559.2022.12.05.01.53.50
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 Dec 2022 01:53:51 -0800 (PST)
Received-SPF: pass (google.com: domain of quintela@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=NSd2WhuP;
       spf=pass (google.com: domain of quintela@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=quintela@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1670234030;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=sWawvSWadu0bL+au53S7AJrJqJZVUFdCmV8iHivocyk=;
	b=NSd2WhuPnEelUByHFX//eaoGjXlbCY7B5fEKuqvNfYsPrqgNtY/iS5UDIuupOfnGi8nIaH
	xcXRjVSiJ/C8YICKFn4RTEdFs7iJaAgAxOm+/VGpdcml+T/2TgVm9ruyDfRtRhfRgPVv/3
	MfA0Sz2E6z8RXzH9ZhJkdbdAJUmcAmA=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-392-aAy9LTFLPj6yCjW41-Z7hg-1; Mon, 05 Dec 2022 04:53:45 -0500
X-MC-Unique: aAy9LTFLPj6yCjW41-Z7hg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com [10.11.54.6])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2C0F185A588;
	Mon,  5 Dec 2022 09:53:44 +0000 (UTC)
Received: from secure.mitica (unknown [10.39.194.135])
	by smtp.corp.redhat.com (Postfix) with ESMTP id D73122166B29;
	Mon,  5 Dec 2022 09:53:36 +0000 (UTC)
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
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v2 08/51] hw/display/qxl: Assert memory slot fits in preallocated MemoryRegion
Date: Mon,  5 Dec 2022 10:51:45 +0100
Message-Id: <20221205095228.1314-9-quintela@redhat.com>
In-Reply-To: <20221205095228.1314-1-quintela@redhat.com>
References: <20221205095228.1314-1-quintela@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
X-TUID: lTXlGD6aEuGp

From: Philippe Mathieu-Daudé <philmd@linaro.org>

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
Message-Id: <20221128202741.4945-6-philmd@linaro.org>
---
 hw/display/qxl.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/display/qxl.c b/hw/display/qxl.c
index 0b21626aad..6772849dec 100644
--- a/hw/display/qxl.c
+++ b/hw/display/qxl.c
@@ -1384,6 +1384,7 @@ static int qxl_add_memslot(PCIQXLDevice *d, uint32_t slot_id, uint64_t delta,
         qxl_set_guest_bug(d, "%s: pci_region = %d", __func__, pci_region);
         return 1;
     }
+    assert(guest_end - pci_start <= memory_region_size(mr));
 
     virt_start = (intptr_t)memory_region_get_ram_ptr(mr);
     memslot.slot_id = slot_id;
-- 
2.38.1
