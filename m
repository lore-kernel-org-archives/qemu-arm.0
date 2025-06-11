Received: by 2002:a17:505:ba85:b0:1be9:327d:8ee3 with SMTP id zs5csp2002807njc;
        Wed, 11 Jun 2025 11:36:08 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXVu3UnhjT1OTok2zAIFujRx+X0v+KAHlmuLv6J5bY6+xsHTzlT473k5CheOQzvb55MvDt9BGwqC12QJQ==@linaro.org
X-Google-Smtp-Source: AGHT+IHs4HH+0rWHoe4hg+nksgNi+MHsfcP4Nmf+R4VH3FuiseD8Rmfawr5AiiF4m1UuGUySJW+3
X-Received: by 2002:a05:622a:22a5:b0:4a6:ef6b:af17 with SMTP id d75a77b69052e-4a713c563a2mr74278181cf.35.1749666968577;
        Wed, 11 Jun 2025 11:36:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1749666968; cv=none;
        d=google.com; s=arc-20240605;
        b=kB9GybVxZ0Qp+q5xcMIMZptiFU32ABwd4RELWI5HRAvxrRD75nGu3IaX1AtwLRhCTl
         WNOPSIxgKtvLgaBAmFwse2RJSf+gBrrs3od8G7f1OvNLAFMqht51gBwqgzErgxmPxA7g
         VI9TIa97s3tMfmpsgBQACeU3sSyO0Uv2a/iM8/PiOrvTyM0+AoIcHL+7UYfrCD8gKCAM
         sxq9zqcC3XnvF3e3p4sZX8BQUObTwhBVUmslZpAj2/hPOSn2GcPMMhn13TCntmtvgh9x
         P0evTW/8Ost9A1lSQ7H5ktHNt379dNz4C+C39BTeUvR787l9pabHXkAZA3HYQQWkHZSd
         i69w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=p1SjgeEm1cCSQpMWJ1zjwqMu3sNMaHNBwc1JeIdOkvs=;
        fh=llWsnZZ16TEYjnayUds9QVVisxba1LyOA7TWHTWVEKk=;
        b=aPQnaaHG2lHedUWg9zszTmaI803nh/aa3g1knWLyyIdELBIIFkO9bi9yVGY6uOJ1ce
         hYkyXAJgu5X4BrtyyoarMDDTaLYQmEw9fvJH/1RDxqJsnYtiMXT1lPbP6dHrBr1X1iED
         wc+bX4o6y9ne5DkSdEEijOW0Uq4YqjV0scmOgvEBJD7O8IvexCRcecsB9GTr4qDpuTn0
         +u+JFe+O+VwcH3uyO75KfU2lRSKH8fdFSRyRM5it0kHKpI+C9Yc/IZVwXpeCAyvf6kuU
         i+6jI+A0sSYH5QzK+1Q4OUfuz2dOI7jwB1EosMlk9xq/JndRNZgg2FnUIcRp2n8hsrX5
         CIng==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=BUqweCUM;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-4a6198ad532si131532941cf.486.2025.06.11.11.36.08
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 11 Jun 2025 11:36:08 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=BUqweCUM;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uPQDc-00012q-Bf; Wed, 11 Jun 2025 14:30:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1uPQAc-0002K6-Bb
 for qemu-arm@nongnu.org; Wed, 11 Jun 2025 14:27:31 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1uPQAW-0001iJ-Oh
 for qemu-arm@nongnu.org; Wed, 11 Jun 2025 14:27:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1749666444;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=p1SjgeEm1cCSQpMWJ1zjwqMu3sNMaHNBwc1JeIdOkvs=;
 b=BUqweCUMKsymKKpquSD5oO7D90zcY0vEIiNKOq0HRhRw2Aae1RCkMy+72Z1i40m+JHdOLN
 7mGTqUtsrA3m8CZiJw3he4bXpGJzTSPLNX3MlDl4yY4XvD0+a3jDgB3fQJe4aOg22fgu2U
 GsK0tAgAND+ld0T2etTPTRKuV2X2y2I=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-280-4wV7N0SwMw-Ternp8fqqqA-1; Wed,
 11 Jun 2025 14:27:17 -0400
X-MC-Unique: 4wV7N0SwMw-Ternp8fqqqA-1
X-Mimecast-MFC-AGG-ID: 4wV7N0SwMw-Ternp8fqqqA_1749666431
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id BE99319560BA; Wed, 11 Jun 2025 18:27:11 +0000 (UTC)
Received: from localhost (unknown [10.2.16.122])
 by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id C8B6E19560AF; Wed, 11 Jun 2025 18:27:09 +0000 (UTC)
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
Subject: [PULL 24/31] hw/ppc/pnv_occ: skip automatic zero-init of large struct
Date: Wed, 11 Jun 2025 14:25:26 -0400
Message-ID: <20250611182533.200590-25-stefanha@redhat.com>
In-Reply-To: <20250611182533.200590-1-stefanha@redhat.com>
References: <20250611182533.200590-1-stefanha@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12
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
X-TUID: hdIB35avS6oK

From: Daniel P. Berrangé <berrange@redhat.com>

The 'occ_model_tick' method has a 12k struct used for copying
data between guest and host. Skip the automatic zero-init of this
struct to eliminate the performance overhead in the I/O hot path.

The 'dynamic_data' buffer will be fully initialized when reading
data from the guest.

Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
Reviewed-by: Klaus Jensen <k.jensen@samsung.com>
Reviewed-by: Harsh Prateek Bora <harshpb@linux.ibm.com>
Message-id: 20250610123709.835102-25-berrange@redhat.com
Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
---
 hw/ppc/pnv_occ.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/ppc/pnv_occ.c b/hw/ppc/pnv_occ.c
index fa6f31cb8d..24b789c191 100644
--- a/hw/ppc/pnv_occ.c
+++ b/hw/ppc/pnv_occ.c
@@ -789,7 +789,7 @@ static bool occ_opal_process_command(PnvOCC *occ,
 
 static bool occ_model_tick(PnvOCC *occ)
 {
-    struct occ_dynamic_data dynamic_data;
+    QEMU_UNINITIALIZED struct occ_dynamic_data dynamic_data;
 
     if (!occ_read_dynamic_data(occ, &dynamic_data, NULL)) {
         /* Can't move OCC state field to safe because we can't map it! */
-- 
2.49.0

