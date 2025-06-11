Received: by 2002:a17:505:ba85:b0:1be9:327d:8ee3 with SMTP id zs5csp1999251njc;
        Wed, 11 Jun 2025 11:29:43 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXW2MKSrxPqgADEsOA7LFkiVs9LL2eVPzbBdb6vtp9OL+2YjD+7DwbFYZM3BMjYpieyHwErjvdEzLdTxA==@linaro.org
X-Google-Smtp-Source: AGHT+IGe2Q2LlJpDXWqdpVJBI0g/3tE/pVxjTyRK8smjLl50NU4oXv7/m0BKwNBhmeDC73TSMiir
X-Received: by 2002:a05:620a:4708:b0:7d0:9519:8329 with SMTP id af79cd13be357-7d3a88040camr755896085a.8.1749666583755;
        Wed, 11 Jun 2025 11:29:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1749666583; cv=none;
        d=google.com; s=arc-20240605;
        b=Bd3hdx0Vc8PNeqhxm40BrF8lVnHOJa6IZ562qa2+XtjUw0D5Fj1XRKM06V3JqM7M5h
         pvUgA0z8FFZy6LNqbtufiJaaCpIMhVGzFjoPuV/FB2Ibs71pL/Tq9NDNQmnC4/kOVhQb
         mQI/0bV1Z9ZvfHMYTuJd6kNu6aZA93/3XEcMNY35oZC288JYSRcnsbMb2FNYH3NpHlBg
         aCv/L6gSBUONO7W9Bqi4YcrwXblF6yYzr2/CeSj75sbcmYJV/7bj+i9mbkZwWNTOJA+s
         +clbPD78N1jBl5puLjbyLPGeDA09U5TvN0gb6/3UUKq2fLCiUnbP1QR+xxz3RKp/yE0g
         PTFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=12JvcWeA/xERILlNpLG6k8ImP52Q27ruWL1INzcd1O0=;
        fh=loh9k9y3S2mImjFs3v08l0zZWu2zKrkh48k9P3fQXm8=;
        b=I7w6TpBkPnx+/9bvXG22/NjCKTHz+XizUn/OVC6A5yH+9bPJbELdXJcSxF03mwVnMe
         WoLr6hIzf/ZG4T1rrycUt79BI7nsip+bqg9QsimubEvjo5502U+dGPBRQKwY5dSLqpvR
         5GQmVWdpN8WZ0cKhGpbL/uPathzjJeB5WznU64iHULcMrMESPIJ13iFsPsnrNO4cmx36
         2aHxyKeNfFmeQxYlQVRJIOLYytf4lfL54KIIzwRB8M0WyBHbXHLnFTmBADrkMCGcoCM1
         F93v+BZNJqGX19n7/0S3EHxJlM1Fc2pK32t440MJCGZiZuESfmBfu8eCM2P99uPq8qya
         W26g==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=bf92GKsR;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-4a61985d4f8si122204171cf.291.2025.06.11.11.29.43
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 11 Jun 2025 11:29:43 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=bf92GKsR;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uPQBF-00049X-MK; Wed, 11 Jun 2025 14:28:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1uPQ9w-0001hR-Ti
 for qemu-arm@nongnu.org; Wed, 11 Jun 2025 14:26:49 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1uPQ9n-0001P4-QV
 for qemu-arm@nongnu.org; Wed, 11 Jun 2025 14:26:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1749666399;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=12JvcWeA/xERILlNpLG6k8ImP52Q27ruWL1INzcd1O0=;
 b=bf92GKsRGqPkbpogeIK1990bfhyL+t/cDaSHqRNnSGia5o20XRw7aO5n+0EW5Rj+wkCGan
 QG+2MhzbtGCJU3RdQnRLIO1AhgWDjcjSruaIz8WTpfZTKSyIfVE831b1/2MPoEj2NsfWkU
 ETlsmRhdrx2z7J8rSgL+F/qJ7ELImXE=
Received: from mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-611-csKpKmkNMU6GEknqFbMg1w-1; Wed,
 11 Jun 2025 14:26:34 -0400
X-MC-Unique: csKpKmkNMU6GEknqFbMg1w-1
X-Mimecast-MFC-AGG-ID: csKpKmkNMU6GEknqFbMg1w_1749666391
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 013FE1956051; Wed, 11 Jun 2025 18:26:31 +0000 (UTC)
Received: from localhost (unknown [10.2.16.122])
 by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 9F58D19560A3; Wed, 11 Jun 2025 18:26:29 +0000 (UTC)
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
Subject: [PULL 10/31] hw/audio/gus: skip automatic zero-init of large array
Date: Wed, 11 Jun 2025 14:25:12 -0400
Message-ID: <20250611182533.200590-11-stefanha@redhat.com>
In-Reply-To: <20250611182533.200590-1-stefanha@redhat.com>
References: <20250611182533.200590-1-stefanha@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17
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
X-TUID: KfYBtUeIIUUY

From: Daniel P. Berrangé <berrange@redhat.com>

The 'GUS_read_DMA' method has a 4k byte array used for copying
data between the audio backend and device. Skip the automatic
zero-init of this array to eliminate the performance overhead in
the I/O hot path.

The 'tmpbuf' array will be fully initialized when reading data
from device memory.

Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
Message-id: 20250610123709.835102-11-berrange@redhat.com
Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
---
 hw/audio/gus.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/audio/gus.c b/hw/audio/gus.c
index 87e8634893..c36df0240f 100644
--- a/hw/audio/gus.c
+++ b/hw/audio/gus.c
@@ -183,7 +183,7 @@ static int GUS_read_DMA (void *opaque, int nchan, int dma_pos, int dma_len)
 {
     GUSState *s = opaque;
     IsaDmaClass *k = ISADMA_GET_CLASS(s->isa_dma);
-    char tmpbuf[4096];
+    QEMU_UNINITIALIZED char tmpbuf[4096];
     int pos = dma_pos, mode, left = dma_len - dma_pos;
 
     ldebug ("read DMA %#x %d\n", dma_pos, dma_len);
-- 
2.49.0

