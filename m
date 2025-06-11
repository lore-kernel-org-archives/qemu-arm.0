Received: by 2002:a17:505:ba85:b0:1be9:327d:8ee3 with SMTP id zs5csp1999791njc;
        Wed, 11 Jun 2025 11:30:39 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXwyugXnNxP2tYj1v/3fC1K5Jzh1by4jyjDfPKUiTmrDYSRWkAW9FdQij5x9OCqZqPXoI23zJtxcHdg0A==@linaro.org
X-Google-Smtp-Source: AGHT+IGFrzWKhdbMekkc3Syr0LyXSyv/LG+2TMXaT/4kfLviyIxBvVWLuO0Ek9AUUUrX4oM6tIu6
X-Received: by 2002:ad4:5bc8:0:b0:6fa:baa2:b59e with SMTP id 6a1803df08f44-6fb2c372c86mr71535916d6.37.1749666639014;
        Wed, 11 Jun 2025 11:30:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1749666639; cv=none;
        d=google.com; s=arc-20240605;
        b=aDIqJF58c6cCatxz6FCMsusWzpxFX6hjfhh6oRSD6ruMMybxJf8agBrPdLgqs91Rxk
         27e7Iu+LuUVwqurA2g/SGpNBbGSL7uLzxAYsDz/JKZG2UWVeKChFs/Omdu3i7a5rqghu
         BjCeu38ieate03lbNNOKV18U/2vIoqc+d+sxHzUoUC4s3c5YmsER1c97+eu4+sN3QGAG
         78y0sFVRw0EXDIUMGF6HCck9+1hVnxg2/AmgMFwWLGp8a9nYRj4PiG4Fc+M6SLNS7Dva
         /E+w1ngFK43Ki02OlkQYgSFS6KyURUmwzNwppW1YonwQ5DUp22FQW+U6qf9KMj0NHZPB
         5/LA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=AWdb0Sqw9fzzDH4yTo03Hj/NjPCQHDhEN+9qHe2StXY=;
        fh=loh9k9y3S2mImjFs3v08l0zZWu2zKrkh48k9P3fQXm8=;
        b=hjs6XDh7eh2vyDfmAGPdFBGFZPgKkRYdBEoQpGlZyg9tLu3p7gwpv6piLOxSWoSwvG
         /xa2le7naobem3Pe4hXahamJy4XOznjmux8oXZoxxvcWhcbsy5MyfsoTucBaJAKbRsZ2
         nhQbiIaGPM7hMnTNrSRRb9JOLttXrL9db58sl29HIPjgifwFz59IIieJsvQNFVZ7H92h
         AtPFFqFoNxbqIZJag6qrVdiBgy7kFPorElnqmsK1fI9eCnyvw0aZ5u7pWDq/H8kfGSsW
         vCIS1Ir+hlCaWRlcwHciYnk8nQFGiHyYDdKAIwReitChrb3w0ryLIPDf8MlNAKLwS+Ty
         zzug==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=ZlaJ6lyH;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7d3a7621495si288869885a.11.2025.06.11.11.30.38
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 11 Jun 2025 11:30:39 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=ZlaJ6lyH;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uPQBH-0004GE-Ew; Wed, 11 Jun 2025 14:28:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1uPQA7-0001ri-6U
 for qemu-arm@nongnu.org; Wed, 11 Jun 2025 14:27:01 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1uPQA3-0001Wn-Er
 for qemu-arm@nongnu.org; Wed, 11 Jun 2025 14:26:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1749666414;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=AWdb0Sqw9fzzDH4yTo03Hj/NjPCQHDhEN+9qHe2StXY=;
 b=ZlaJ6lyHNCXD3wzMFiLQsYRaXZhk0xJ/XTH5RHcES8vCM69oveJ/acnLMw8nRZNIGrqStw
 Y5FB5KrIHW7YeqUU20NegaWHIVF8g0dQ2Uq2rvgdPipwpTwAkYM71VG2n7XPLpkVAolUj0
 gHjpRSc2IC5p5usNKnfsey/npvBYMVk=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-462-dh4qVUhPNIWR5eVZoiLTEw-1; Wed,
 11 Jun 2025 14:26:49 -0400
X-MC-Unique: dh4qVUhPNIWR5eVZoiLTEw-1
X-Mimecast-MFC-AGG-ID: dh4qVUhPNIWR5eVZoiLTEw_1749666405
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 9ED5E19560A2; Wed, 11 Jun 2025 18:26:45 +0000 (UTC)
Received: from localhost (unknown [10.2.16.122])
 by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id ACEC31956094; Wed, 11 Jun 2025 18:26:44 +0000 (UTC)
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
Subject: [PULL 15/31] hw/dma/xlnx_csu_dma: skip automatic zero-init of large
 array
Date: Wed, 11 Jun 2025 14:25:17 -0400
Message-ID: <20250611182533.200590-16-stefanha@redhat.com>
In-Reply-To: <20250611182533.200590-1-stefanha@redhat.com>
References: <20250611182533.200590-1-stefanha@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
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
X-TUID: Qo41M1x9Ddp+

From: Daniel P. Berrangé <berrange@redhat.com>

The 'xlnx_csu_dma_src_notify' method has a 4k byte array used for
copying DMA data. Skip the automatic zero-init of this array to
eliminate the performance overhead in the I/O hot path.

The 'buf' array will be fully initialized when data is copied.

Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
Message-id: 20250610123709.835102-16-berrange@redhat.com
Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
---
 hw/dma/xlnx_csu_dma.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/dma/xlnx_csu_dma.c b/hw/dma/xlnx_csu_dma.c
index 3db3904d83..d8c7da1a50 100644
--- a/hw/dma/xlnx_csu_dma.c
+++ b/hw/dma/xlnx_csu_dma.c
@@ -287,7 +287,7 @@ static uint32_t xlnx_csu_dma_advance(XlnxCSUDMA *s, uint32_t len)
 static void xlnx_csu_dma_src_notify(void *opaque)
 {
     XlnxCSUDMA *s = XLNX_CSU_DMA(opaque);
-    unsigned char buf[4 * 1024];
+    QEMU_UNINITIALIZED unsigned char buf[4 * 1024];
     size_t rlen = 0;
 
     ptimer_transaction_begin(s->src_timer);
-- 
2.49.0

