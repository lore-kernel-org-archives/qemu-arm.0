Received: by 2002:a17:505:ba85:b0:1be9:327d:8ee3 with SMTP id zs5csp2002003njc;
        Wed, 11 Jun 2025 11:34:36 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVQ4VsqwiVpKbqK890UJ0E2jTKPRIvstqUULpEeQrILeH9sx1UF86mPESiTAMTKNiCjZPRCn57LgIMHeg==@linaro.org
X-Google-Smtp-Source: AGHT+IHtsHFaFd7iVm1ceYFog/v5xTTES7ryOcqazdNGkxttz4eL7rIdin1ttVR1gTe1UPG7WCPu
X-Received: by 2002:a05:620a:3197:b0:7ce:c471:2b8e with SMTP id af79cd13be357-7d3b29fff2emr80740985a.10.1749666876538;
        Wed, 11 Jun 2025 11:34:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1749666876; cv=none;
        d=google.com; s=arc-20240605;
        b=P2qQAwt078swkTpAgZH7djYdezI6Yk9fUD1rmBsjsookhU0N3Y1nGxFn8n0RWhP/aM
         8a3A6p2E1xKYRhPMyPov6WdXB8WOjv0wAAv3Z4UJPdlSxZ3xvZ46sdMDR/JZxUGuzs0a
         til8EVc96AYv5HnUxbeDVXwYkc6Pgr0DPS38/qi690yOn1LLu81EO2f4+1rOxcDhh37J
         EhZlMeoTj1IRH6BR0sVDRQIMkRJ8QKv3SJm64rPb68MNXCqgnWnxq4cH9Ja/t90UCULP
         pDmPeJV0a08rEmNORqbpTykroh6P/YgG3mxcDi226WbEy3LPbuFl0nHToBI/n9lewGBd
         UuWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=DA+s4Ip/ag7ChTelqOTkfJ0xAlR4kkpE9uIMvxvue8g=;
        fh=loh9k9y3S2mImjFs3v08l0zZWu2zKrkh48k9P3fQXm8=;
        b=I0r5b7F8PCfxgeEZ4/5y1g3fRvku10WD4hck5v/VYbtzpAPKpEHxNO1jZhD+JgXIVV
         /L+C8eHA9raFBGWJUxpCNyaTA077k0elXupT63aX0D3vP6/xYBgB7bvhNuAUuyBnoZOg
         8XBjY0gaZzVlzPXq4skGq2YIHQ8L4W4RZnOVLR2Z9mLBrONEB8k6YYKLpuDRib838e67
         kPdSVMpWYytFmWHy9oPmXEC7L50fWsjmWvaFpDf3zpuzgbt+TCs/i6u5IJItRof3YznQ
         MZQ0lPdsR/J4MHKYGrta7Vjiw4XGn4I4yuRuJjQkTBH7xnbM4KNqgvcqudGZ9FAGYuzA
         sQcg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=ConDMXqy;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7d25a60ec3csi1273945885a.351.2025.06.11.11.34.36
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 11 Jun 2025 11:34:36 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=ConDMXqy;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uPQCr-00079Q-Iv; Wed, 11 Jun 2025 14:29:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1uPQAN-00020R-H3
 for qemu-arm@nongnu.org; Wed, 11 Jun 2025 14:27:17 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1uPQAJ-0001cK-M6
 for qemu-arm@nongnu.org; Wed, 11 Jun 2025 14:27:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1749666429;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DA+s4Ip/ag7ChTelqOTkfJ0xAlR4kkpE9uIMvxvue8g=;
 b=ConDMXqy6J+wVlzrsm+hjvtpuhxXw5SMgScgILl3/RIprdA5DTvui4uNHvRoE6iD2BWUcP
 /jQPhe/meLjnL1wxhcMSn8tex2vqZvSTuF2Mv51gNd7iP3DRHwJLcAlSVkSnEBIJPfSu7o
 /lo8nO3b7/AJPPAl3jL08f3/kQy6sWk=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-421-KZTdJYYaNVyTK7d4JhVIcA-1; Wed,
 11 Jun 2025 14:27:06 -0400
X-MC-Unique: KZTdJYYaNVyTK7d4JhVIcA-1
X-Mimecast-MFC-AGG-ID: KZTdJYYaNVyTK7d4JhVIcA_1749666422
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id C5F981956048; Wed, 11 Jun 2025 18:27:02 +0000 (UTC)
Received: from localhost (unknown [10.2.16.122])
 by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id F07FC18003FC; Wed, 11 Jun 2025 18:27:00 +0000 (UTC)
From: Stefan Hajnoczi <stefanha@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, Daniel Henrique Barboza <danielhb413@gmail.com>,
 qemu-block@nongnu.org, Jesper Devantier <foss@defmacro.it>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Harsh Prateek Bora <harshpb@linux.ibm.com>, Troy Lee <leetroy@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 qemu-s390x@nongnu.org, Halil Pasic <pasic@linux.ibm.com>,
 Kevin Wolf <kwolf@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 qemu-trivial@nongnu.org, Dmitry Fleytman <dmitry.fleytman@gmail.com>,
 Jason Wang <jasowang@redhat.com>, Keith Busch <kbusch@kernel.org>,
 Nicholas Piggin <npiggin@gmail.com>,
 =?UTF-8?q?Fr=C3=A9d=C3=A9ric=20Barrat?= <fbarrat@linux.ibm.com>,
 Fam Zheng <fam@euphon.net>, Sven Schnelle <svens@stackframe.org>,
 Stefan Hajnoczi <stefanha@redhat.com>, Joel Stanley <joel@jms.id.au>,
 Gerd Hoffmann <kraxel@redhat.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, qemu-arm@nongnu.org,
 Hannes Reinecke <hare@suse.com>, Klaus Jensen <its@irrelevant.dk>,
 Jeuk Kim <jeuk20.kim@samsung.com>,
 Andrew Jeffery <andrew@codeconstruct.com.au>,
 Alistair Francis <alistair@alistair23.me>, Thomas Huth <thuth@redhat.com>,
 Michael Tokarev <mjt@tls.msk.ru>, Laurent Vivier <laurent@vivier.eu>,
 Rob Herring <robh@kernel.org>, Steven Lee <steven_lee@aspeedtech.com>,
 Jamin Lin <jamin_lin@aspeedtech.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
Subject: [PULL 21/31] hw/net/virtio-net: skip automatic zero-init of large
 arrays
Date: Wed, 11 Jun 2025 14:25:23 -0400
Message-ID: <20250611182533.200590-22-stefanha@redhat.com>
In-Reply-To: <20250611182533.200590-1-stefanha@redhat.com>
References: <20250611182533.200590-1-stefanha@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111
Received-SPF: pass client-ip=170.10.129.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: Zn6uG4nQwDKO

From: Daniel P. Berrangé <berrange@redhat.com>

The 'virtio_net_receive_rcu' method has three arrays with
VIRTQUEUE_MAX_SIZE elements, which are apprixmately 32k in
size used for copying data between guest and host. Skip the
automatic zero-init of these arrays to eliminate the
performance overhead in the I/O hot path.

The three arrays will be selectively initialized as required
when processing network buffers.

Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
Message-id: 20250610123709.835102-22-berrange@redhat.com
Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
---
 hw/net/virtio-net.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/hw/net/virtio-net.c b/hw/net/virtio-net.c
index 221252e00a..eb93607b8c 100644
--- a/hw/net/virtio-net.c
+++ b/hw/net/virtio-net.c
@@ -1911,9 +1911,9 @@ static ssize_t virtio_net_receive_rcu(NetClientState *nc, const uint8_t *buf,
     VirtIONet *n = qemu_get_nic_opaque(nc);
     VirtIONetQueue *q;
     VirtIODevice *vdev = VIRTIO_DEVICE(n);
-    VirtQueueElement *elems[VIRTQUEUE_MAX_SIZE];
-    size_t lens[VIRTQUEUE_MAX_SIZE];
-    struct iovec mhdr_sg[VIRTQUEUE_MAX_SIZE];
+    QEMU_UNINITIALIZED VirtQueueElement *elems[VIRTQUEUE_MAX_SIZE];
+    QEMU_UNINITIALIZED size_t lens[VIRTQUEUE_MAX_SIZE];
+    QEMU_UNINITIALIZED struct iovec mhdr_sg[VIRTQUEUE_MAX_SIZE];
     struct virtio_net_hdr_v1_hash extra_hdr;
     unsigned mhdr_cnt = 0;
     size_t offset, i, guest_offset, j;
-- 
2.49.0

