Received: by 2002:a17:505:ba85:b0:1be9:327d:8ee3 with SMTP id zs5csp2003987njc;
        Wed, 11 Jun 2025 11:38:21 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXfJguKWr8Pl/tuvTarsLfGEEpMvxMZfQU45E1AjZXK9MCuposL2eAngeNhT96LMQVi+gf5XrBJFjkQdQ==@linaro.org
X-Google-Smtp-Source: AGHT+IHvlYi8iHLl2UK6VSiNPQWAam4L7yEfSrHUDfqd1f6Mnw60zcGPqZB/R4FnZYhWmWYQX4EE
X-Received: by 2002:a05:620a:40d6:b0:7d2:18d8:84f2 with SMTP id af79cd13be357-7d3b29fc0eemr71475485a.24.1749667090468;
        Wed, 11 Jun 2025 11:38:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1749667090; cv=none;
        d=google.com; s=arc-20240605;
        b=Sze91KMuLZBGoNfdfTu/iJZM7z0VLMN8QegmYPoD/fSUbyBGH4u/KoJWaRPy+0yM2n
         SholOV61+othmxlSKgoZWKXOXW5QjUK685PKoPOtSdPism2WWCIV+KBGE1QcDBibmyDk
         kv2qdhjb9eswshy73ZtuXVQ59wQaiyA20qvHCmg/fZZHPcdjdZiIzBeEF1spDv7j6gFd
         U94vX05v/MY2gnCwqDRDLOXDNEe+caiZLyyrzg2a+Dpj2Xrng6XtESNucK6xayacdCsn
         IOUl0AhWNr++Tvnl4uPYLApqNkhShKIq8amZSIoUkP07DPkjrfj4fQQzA7ibb1Dca3b7
         p3uQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=GRUOwrPa9aDe+BByn7DHtlAgJL5D74m+C48N+bMyyao=;
        fh=loh9k9y3S2mImjFs3v08l0zZWu2zKrkh48k9P3fQXm8=;
        b=Ia8cRATFB7YL52FKFbYEgHn0fq8ZgbPIa4n/mahX9XuSKG9CGEWRr3zs/wp61xTmGr
         EyHpLpyZvRcIUeEeL05PyzU5FljswGcNF/F6VpNaWGgEjhCroIvrjQcbkWfnkzuKg54U
         Uh567g5ajUrbRInYMsduNx33Wwb+JErYXYTQRegwTS40XC4ycuKnJPJ9SQ8jP4GgzkGd
         V5e6hzJcX/SOTYVb7SIjmvzzYv0J2i/XMZis2zFBbFv7j5sVS3h/t2zmVgftAnvhRm2D
         N21jluTA7jTekIxjVnb9mDVCZZYzCu2hBhtx40OIsMyjgruto18RTd6FY2ZgTuv1uARu
         f+tQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=RRVj8uWV;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7d24b3d0594si1437399385a.91.2025.06.11.11.38.10
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 11 Jun 2025 11:38:10 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=RRVj8uWV;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1uPQEA-0002nV-2c; Wed, 11 Jun 2025 14:31:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1uPQAS-000269-1E
 for qemu-devel@nongnu.org; Wed, 11 Jun 2025 14:27:22 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1uPQAN-0001eJ-5t
 for qemu-devel@nongnu.org; Wed, 11 Jun 2025 14:27:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1749666433;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GRUOwrPa9aDe+BByn7DHtlAgJL5D74m+C48N+bMyyao=;
 b=RRVj8uWVmSqsULVhxxO9oobIFAcjH3W/UM9zXvY0kPy2vV4zErY6JMPckGhKCpT4oiImto
 WmrjKaK+e/sDCxJ6wkVUaicEezXVvltfF6NR0XL2AoqLeLlkYrA6UGI7H1I0vfAGCEFCj5
 VbZSXbAVAjbDKk1mdYIYlvOeguSBFlo=
Received: from mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-455-7oaliND1OX6iyJ8Ymqxw2Q-1; Wed,
 11 Jun 2025 14:27:08 -0400
X-MC-Unique: 7oaliND1OX6iyJ8Ymqxw2Q-1
X-Mimecast-MFC-AGG-ID: 7oaliND1OX6iyJ8Ymqxw2Q_1749666425
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id DCA1B195605C; Wed, 11 Jun 2025 18:27:04 +0000 (UTC)
Received: from localhost (unknown [10.2.16.122])
 by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 262AE30002C3; Wed, 11 Jun 2025 18:27:04 +0000 (UTC)
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
Subject: [PULL 22/31] hw/net/xgamc: skip automatic zero-init of large array
Date: Wed, 11 Jun 2025 14:25:24 -0400
Message-ID: <20250611182533.200590-23-stefanha@redhat.com>
In-Reply-To: <20250611182533.200590-1-stefanha@redhat.com>
References: <20250611182533.200590-1-stefanha@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4
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
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: 0tk9Z/mdiE5z

From: Daniel P. Berrangé <berrange@redhat.com>

The 'xgmac_enet_send' method has a 8k byte array used for copying
data between guest and host. Skip the automatic zero-init of this
array to eliminate the performance overhead in the I/O hot path.

The 'frame' buffer will be fully initialized when reading guest
memory to fetch the data to send.

Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
Message-id: 20250610123709.835102-23-berrange@redhat.com
Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
---
 hw/net/xgmac.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/net/xgmac.c b/hw/net/xgmac.c
index 9c87c4e70f..d45f872467 100644
--- a/hw/net/xgmac.c
+++ b/hw/net/xgmac.c
@@ -207,7 +207,7 @@ static void xgmac_enet_send(XgmacState *s)
     struct desc bd;
     int frame_size;
     int len;
-    uint8_t frame[8192];
+    QEMU_UNINITIALIZED uint8_t frame[8192];
     uint8_t *ptr;
 
     ptr = frame;
-- 
2.49.0

