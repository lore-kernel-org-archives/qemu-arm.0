Received: by 2002:a17:505:ba85:b0:1be9:327d:8ee3 with SMTP id zs5csp1999709njc;
        Wed, 11 Jun 2025 11:30:31 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUL4Suzb+MEaVyUwUMErIiuy+krdkfhgOPo7S6nrRY1EFbeA+RgCGSgnGxQmJ5iFmYov/+xEyaQu9/vYA==@linaro.org
X-Google-Smtp-Source: AGHT+IGs/R7G2KSzSEDy2ZmFidNmn2QuxGDYWawCHA//vjfEW7AFtnCtDUIwbCS/OJL6TlT9MAdt
X-Received: by 2002:a05:622a:2488:b0:4a6:f6f9:c248 with SMTP id d75a77b69052e-4a713c5cde3mr76364361cf.37.1749666631251;
        Wed, 11 Jun 2025 11:30:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1749666631; cv=none;
        d=google.com; s=arc-20240605;
        b=L7TjJ1sEIZ4nCCBOLQC4YhVT+l089dkM90nlKFSp1zPrzhEJ32QB76r8CbMOEjgUUF
         VYOda+Wdw0GubOtfymuvKwQiPvTH2QLBYhzaYQWlajj+rGvJDNMg1vjhvoAqtj9HtL+3
         EijBySSExEzux263W3EfYsiLSktGXCbTINFXajIOC7ungBz+umNoMSKcNgDDNdncJVrb
         O1o/eyNaZhnSVIIOK1vU3Z9xM/aGZWVx3S3pvDgKqIQNRw9MITQYX7OPOL5TaC01e4NQ
         QDFlZWTCjENYQfr+k5Y98MoqPywEHXLnvhIP6tHnrgZd7UZIBSpENsYP5fkQpliKHMmM
         HwIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=M9LZ45V6NuLQ3B6KycXNWkn9735EaN4kZUBKCu+5+Lc=;
        fh=loh9k9y3S2mImjFs3v08l0zZWu2zKrkh48k9P3fQXm8=;
        b=RNgkyBlSuoEv8uh8kUYsmX+vdaI+YQhAGTv3qZlUJIlePuOQGXpei+3RLlxweDOaP4
         nhC/Yz86Fb1xrw3rTQhFdlptpSYQdX3MTQsQi+vE/0jWBUQDvPm3y5SNktZsqS/uEb4O
         GA77iccLF4jEzNmJIYpg19Mv2JKu/Xzp55kIjOUkDps95rZnuzfi5A+Hk8tJQVrgK1rW
         4E4rN3DuiCbmbLyCPS3UZ0cKISyODDKAlNFFJBaEGxdNz86S0i1D3kXRlnY7Fv4egyhC
         QzdY9VPtEakctg5VtawwcKGb7RLbvxKCQCAu6uPHSa8HLJ89XYoyibX14qeCyV8eROEB
         qSKA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Cerm+UYT;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-4a619892231si137988311cf.423.2025.06.11.11.30.31
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 11 Jun 2025 11:30:31 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Cerm+UYT;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1uPQDL-00081c-AM; Wed, 11 Jun 2025 14:30:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1uPQAO-00022a-6e
 for qemu-devel@nongnu.org; Wed, 11 Jun 2025 14:27:21 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1uPQAJ-0001b1-Ne
 for qemu-devel@nongnu.org; Wed, 11 Jun 2025 14:27:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1749666424;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=M9LZ45V6NuLQ3B6KycXNWkn9735EaN4kZUBKCu+5+Lc=;
 b=Cerm+UYTnrKy2sDtF0KN+wZUZcMkeLJt3qC0x0LXUoBs75pEe5KrPaerQry8ZxOrsl6Uxy
 9CBnnmS64SL7wuhI8hokSa7bgYJbMHkzjiTzS9IwOPMbMtoEsp0jtgRoBrmDgDWp+G4QMd
 PeIveOrCMADPWAiHTpJvfjf7lhf7muo=
Received: from mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-684-QbkNV5_QN22LFuGxiASsBw-1; Wed,
 11 Jun 2025 14:27:00 -0400
X-MC-Unique: QbkNV5_QN22LFuGxiASsBw-1
X-Mimecast-MFC-AGG-ID: QbkNV5_QN22LFuGxiASsBw_1749666416
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 62C4C19560B2; Wed, 11 Jun 2025 18:26:56 +0000 (UTC)
Received: from localhost (unknown [10.2.16.122])
 by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 746E130002C6; Wed, 11 Jun 2025 18:26:55 +0000 (UTC)
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
Subject: [PULL 19/31] hw/net/rtl8139: skip automatic zero-init of large array
Date: Wed, 11 Jun 2025 14:25:21 -0400
Message-ID: <20250611182533.200590-20-stefanha@redhat.com>
In-Reply-To: <20250611182533.200590-1-stefanha@redhat.com>
References: <20250611182533.200590-1-stefanha@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4
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
X-TUID: 1dm35lJN5XND

From: Daniel P. Berrangé <berrange@redhat.com>

The 'rtl8139_transmit_one' method has a 8k byte array used for
copying data between guest and host. Skip the automatic zero-init
of this array to eliminate the performance overhead in the I/O
hot path.

The 'txbuffer' will be fully initialized when reading PCI DMA
buffers.

Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
Message-id: 20250610123709.835102-20-berrange@redhat.com
Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
---
 hw/net/rtl8139.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/net/rtl8139.c b/hw/net/rtl8139.c
index 15b8f7501a..654a087d80 100644
--- a/hw/net/rtl8139.c
+++ b/hw/net/rtl8139.c
@@ -1816,7 +1816,7 @@ static int rtl8139_transmit_one(RTL8139State *s, int descriptor)
 
     PCIDevice *d = PCI_DEVICE(s);
     int txsize = s->TxStatus[descriptor] & 0x1fff;
-    uint8_t txbuffer[0x2000];
+    QEMU_UNINITIALIZED uint8_t txbuffer[0x2000];
 
     DPRINTF("+++ transmit reading %d bytes from host memory at 0x%08x\n",
         txsize, s->TxAddr[descriptor]);
-- 
2.49.0

