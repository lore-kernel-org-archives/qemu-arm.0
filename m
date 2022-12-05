Received: by 2002:a17:906:80c3:b0:7ae:d8f:8937 with SMTP id a3csp3378261ejx;
        Mon, 5 Dec 2022 01:54:14 -0800 (PST)
X-Google-Smtp-Source: AA0mqf4aIvrqw2ind5ovnsMTUyB3EMgXHaRLk2fjjrG5JswwBjWlUPefyUt/r8u3o6LPVWK/3PTa
X-Received: by 2002:a05:6214:2d47:b0:4bd:f65a:4742 with SMTP id na7-20020a0562142d4700b004bdf65a4742mr57795326qvb.36.1670234054513;
        Mon, 05 Dec 2022 01:54:14 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1670234054; cv=none;
        d=google.com; s=arc-20160816;
        b=MnPWRLiEYRa9nvZVVXuzha1/kiSknrI51vJxfqTyVcZFebNiN1Q3vI3t0owWXTf+ER
         AKg1rTDCXsxxWvpT4atxptit5g0rCqHaatSwA6Tbtqu/8+vPxf/wBuIl9SxJfVDDDA1V
         I1J8W2F7WEa7wuxXo6/RcM092SDaQTvKH0MhbZV+nR51a2ojIEi6+bB9aSzQYLciO4ge
         1lNNRxIJLVPjiw8xnhtxurkBKHxONQ44zud6s4IU2pKwhZ5dECBRMQS0iTdhwmpveqR2
         k0JNVZJhauixj9tJ+8iIJzmi+I5Ou3iWTLzYRZlxZuHyo/GO+SeDK3zzEARCzfHEmbWD
         AkUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=A58yn8gbgM6uMQJ3134uqu6AR7IEA8M1jgXqbvIAcqs=;
        b=ULMHeeH7S+CAR652VGYLdad8H+SyVZWTGAwDfXtfuVqK7/1UPRrJKuroxVl+k1iFpU
         dy25IH9Z+JMk2jPzLh9j5+2391DWWQ2pN4XBOew71AzZ6z6XR/JMpl3ea6M+i1+qH/H5
         hpih68m7gMTN/C8UZB7cRlnRglLdWAfXtUd0n6dqG+i/tRGQfiNZMfwgTZ+RhsuxdpK0
         dNk7QpZG2KEqJ3uiVpznURjFRruWPVqjuBBXF8Yqw9QByXRKdfnaw0/XvNcOtagD4eQq
         1UYxsLrwryze/p5+4bggpqH6IHKo3We7kqZ+XcHKpPv/sMec/HoS/bGblXRTKFJ03UQE
         Lhmg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=bR5LPfyT;
       spf=pass (google.com: domain of quintela@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=quintela@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <quintela@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id cb9-20020a05622a1f8900b0038e72375b07si4919170qtb.692.2022.12.05.01.54.14
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 Dec 2022 01:54:14 -0800 (PST)
Received-SPF: pass (google.com: domain of quintela@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=bR5LPfyT;
       spf=pass (google.com: domain of quintela@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=quintela@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1670234054;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=A58yn8gbgM6uMQJ3134uqu6AR7IEA8M1jgXqbvIAcqs=;
	b=bR5LPfyT94TtgCvo10rXVs3TaZXiFJuaIay7UMNLve+9AR4thDE4AbYINSioyP4vpzWFXg
	KGlCAZ5ppMeDA5/y9/ZLUcpqdaiMiorDZ1VQw57DjXC2fwrJGJi9TUjbge+M/5LMg3jqL7
	ROEq/9sspKoFoFTuM2+QCupXOzNaHGw=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-201-Gnhs0bJhMzKaVwmFU5Zkpg-1; Mon, 05 Dec 2022 04:54:08 -0500
X-MC-Unique: Gnhs0bJhMzKaVwmFU5Zkpg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com [10.11.54.6])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 54A4B185A7AA;
	Mon,  5 Dec 2022 09:54:07 +0000 (UTC)
Received: from secure.mitica (unknown [10.39.194.135])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 1E7FA2166B29;
	Mon,  5 Dec 2022 09:53:59 +0000 (UTC)
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
	Hanna Reitz <hreitz@redhat.com>
Subject: [PATCH v2 11/51] Update VERSION for v7.2.0-rc3
Date: Mon,  5 Dec 2022 10:51:48 +0100
Message-Id: <20221205095228.1314-12-quintela@redhat.com>
In-Reply-To: <20221205095228.1314-1-quintela@redhat.com>
References: <20221205095228.1314-1-quintela@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
X-TUID: k80VYaqm9Gc7

From: Stefan Hajnoczi <stefanha@redhat.com>

Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
---
 VERSION | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/VERSION b/VERSION
index 02998662dd..1c24435536 100644
--- a/VERSION
+++ b/VERSION
@@ -1 +1 @@
-7.1.92
+7.1.93
-- 
2.38.1
