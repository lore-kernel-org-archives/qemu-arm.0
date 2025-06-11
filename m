Received: by 2002:a17:505:ba85:b0:1be9:327d:8ee3 with SMTP id zs5csp2001918njc;
        Wed, 11 Jun 2025 11:34:26 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWCysU/S/gIw+halvjyATQYakrRPPdJAhJHPtbIWpF8zm8gdku8vXn723GP/xu3LLfoaPU1CAzC5J+2NQ==@linaro.org
X-Google-Smtp-Source: AGHT+IHmqi0SpCz303kOCHe4TNHG48ER/pXImO7ePgr+z9g4vksb1UB+65L4FDJ17Fa70swuJl63
X-Received: by 2002:a05:622a:4d46:b0:4a4:30df:f9ba with SMTP id d75a77b69052e-4a723510d26mr6292691cf.7.1749666866391;
        Wed, 11 Jun 2025 11:34:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1749666866; cv=none;
        d=google.com; s=arc-20240605;
        b=QmA0kJZFb/ehzGC/YMS/VWC5sKX3SWksHvnMNTPBIPsbAoOVM9vIEEaBwQA0joi+2I
         MACyXHRbjtO18Olxl9NgX/Qr4mChr/ML/jHOFwDAcFTbEYjzq7S9dpBaxK0WwrvGv/Pv
         mYKYyRi41olXXpYfoP6VxgR0HIXpbrjBkGneAwPB3XXGOkVCTNacseVBFrtH2cow9pcu
         joRBhTOY/kfEtgcyNMs6mRtJ+mECObZrnTe3fnKRd5pQQkwqBpWFjWPuEGp7RgZ+4TZg
         18IfONcAQa8qQEaoqg+csMIG9Yw2Nif8dhdxKqeaBqI4RhiH/RT30hUujzWuynbHh79o
         EDsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=f128TMvyALcEvw2Q1PgUkPtT2l4n4rQQAsIOgSwd6Bw=;
        fh=llWsnZZ16TEYjnayUds9QVVisxba1LyOA7TWHTWVEKk=;
        b=SYwjcUeIoA/26pvlH/5eSCNRZtMqTGprpLIHX+gRv5lxzJzUR5HZBl2zxdE6czaBn9
         x0QeXV8dZI7YjGw2wxJsuHkOmJq2U+sgThFksnuK3HaYPwMfYHpweDcyHLEmRxCvNmdZ
         o5Q/QcdaDgiVfZT101ZY+3jj2o8ksEsygjAbFNwR8Y9XQYFtjgMhCP4UmQTI5WVwz4Bc
         h9hRPeap/wp62bXSn6cSvi8IYnE0UFCMdXxqEqn0uR3m5IuClsS9dnGQAnOZllmtvqJC
         z862nPw1LUv2P6Dk6RIc05pQkpOZJEN0tyS3qlLBUB62KMMFRq6a6fhgCRI3X3tAhoOE
         MSPA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=fqFUhuZZ;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-4a61988c1ebsi131969601cf.311.2025.06.11.11.34.26
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 11 Jun 2025 11:34:26 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=fqFUhuZZ;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1uPQFb-00059j-Rd; Wed, 11 Jun 2025 14:32:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1uPQAa-0002Cy-Hg
 for qemu-devel@nongnu.org; Wed, 11 Jun 2025 14:27:30 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1uPQAW-0001hm-5M
 for qemu-devel@nongnu.org; Wed, 11 Jun 2025 14:27:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1749666441;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=f128TMvyALcEvw2Q1PgUkPtT2l4n4rQQAsIOgSwd6Bw=;
 b=fqFUhuZZBSIJamGAslmNAYvmzABGkME81L8a5IJ1pOybcqhdrZAbKxxwujTStmosDZkmBQ
 kLDxYmLUI7wp+GoifCDNan52kUFKzDr0Ud1BR9ZKXMbOEdrg22Z4mJvGHt6cT1ihn3c+ME
 iO6dnAnevXZO/Ufk+Fe+ymSED6C/kPU=
Received: from mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-98-mSrFx_MUMsimIImP4xTVHA-1; Wed,
 11 Jun 2025 14:27:20 -0400
X-MC-Unique: mSrFx_MUMsimIImP4xTVHA-1
X-Mimecast-MFC-AGG-ID: mSrFx_MUMsimIImP4xTVHA_1749666436
Received: from mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.15])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id D1B0119560B6; Wed, 11 Jun 2025 18:27:15 +0000 (UTC)
Received: from localhost (unknown [10.2.16.122])
 by mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 1B8CB195609D; Wed, 11 Jun 2025 18:27:15 +0000 (UTC)
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
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Klaus Jensen <k.jensen@samsung.com>
Subject: [PULL 26/31] hw/usb/hcd-ohci: skip automatic zero-init of large array
Date: Wed, 11 Jun 2025 14:25:28 -0400
Message-ID: <20250611182533.200590-27-stefanha@redhat.com>
In-Reply-To: <20250611182533.200590-1-stefanha@redhat.com>
References: <20250611182533.200590-1-stefanha@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.15
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
X-TUID: 16JN+MyQm4M9

From: Daniel P. Berrangé <berrange@redhat.com>

The 'ohci_service_iso_td' method has a 8k byte array used for copying
data between guest and host. Skip the automatic zero-init of this
array to eliminate the performance overhead in the I/O hot path.

The 'buf' array will be fully initialized when reading data from guest
memory.

Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
Reviewed-by: Klaus Jensen <k.jensen@samsung.com>
Reviewed-by: Harsh Prateek Bora <harshpb@linux.ibm.com>
Message-id: 20250610123709.835102-27-berrange@redhat.com
Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
---
 hw/usb/hcd-ohci.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/usb/hcd-ohci.c b/hw/usb/hcd-ohci.c
index 71b54914d3..72a9f9f474 100644
--- a/hw/usb/hcd-ohci.c
+++ b/hw/usb/hcd-ohci.c
@@ -577,7 +577,7 @@ static int ohci_service_iso_td(OHCIState *ohci, struct ohci_ed *ed)
     USBDevice *dev;
     USBEndpoint *ep;
     USBPacket *pkt;
-    uint8_t buf[8192];
+    QEMU_UNINITIALIZED uint8_t buf[8192];
     bool int_req;
     struct ohci_iso_td iso_td;
     uint32_t addr;
-- 
2.49.0

