Received: by 2002:a17:505:ba85:b0:1be9:327d:8ee3 with SMTP id zs5csp2002884njc;
        Wed, 11 Jun 2025 11:36:18 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCX8htZm70lUjWfFeJvrJ4uhNkNdrLPdW76Q03GqTfBONDWAwu5/ME92GwDb4VkmYRAUYs2Ke3AT1TYGgg==@linaro.org
X-Google-Smtp-Source: AGHT+IE209RtVEVtt9dhm3WQAk8eoQPNGyWyP5DQ5d8RrpTI8aEus6Ev8tO5u0fQAyQmnJrEpxQC
X-Received: by 2002:a05:6214:4113:b0:6fa:b954:2c32 with SMTP id 6a1803df08f44-6fb3465d172mr9538216d6.35.1749666978711;
        Wed, 11 Jun 2025 11:36:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1749666978; cv=none;
        d=google.com; s=arc-20240605;
        b=HkcQAfs8jp/BUuDrTDlwJbFI8bxxcpjSmcDL3g6v1SEm+A6L9LhZH0cp3whd49cjT1
         IXsYWtUwBir4reF2ttl+au90CU+dO6zgdACDD14/xXPfszk306LH7hicvu+3fhtyYcrB
         TPqyeVrA2L4hagOzN42vZ4q4jbBKTjpMrLaGkzyTVmbfofAgqxwP9hJsAFBxbckyvswC
         3uClM8X0WvFk7UewXQE6tz9akLXT6RfgC3PPexVZVHeG6OtNedgu+9N/hqsvLDFGgH8a
         R0GSFIs/FLJO66GPavxGVfYPvogAIKNQmztjPflMtkpEB5l18r/OfCUg7oalsUJeji+N
         n+4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=zUBueujoaF3SY5nslIqDYxh56xsOS9uQEUGXk8GVXVA=;
        fh=llWsnZZ16TEYjnayUds9QVVisxba1LyOA7TWHTWVEKk=;
        b=hGPfvdtSQylfvmI4nlVapYKmV0n9bAwP/zHlmWyCrkWx+Of0bFx3G2wxf9BtFiSSW/
         kmp8qr+uHeTIOHItoHbB3vopG1yWfKDM8/bKwRYbNjDN22mYVutlQfB+H/DevjI4I3vf
         tAsoxsZ/1erCUwCBtybFk0n3JQ/ZJx/NewKIN1BaJL22uOoiyC7j/jB8y1VUsBxe/z9r
         kkec+7rIjt/XBLQAQoTnPAiqJ6qA6eRENiCtnyONB/cIiTjlDCB0TxbaG2HYYwwOchpb
         XaGtU1qvkIPVn0CcpMwpuZ7Zk126MIKKp5U2FZhdrZXT27ikCRyPtVoqdhJVkhfNifxB
         PSZA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=bzQyCrbd;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6fb09b17009si133350006d6.236.2025.06.11.11.36.18
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 11 Jun 2025 11:36:18 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=bzQyCrbd;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uPQE7-0002cT-Vm; Wed, 11 Jun 2025 14:31:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1uPQAf-0002R3-2V
 for qemu-arm@nongnu.org; Wed, 11 Jun 2025 14:27:33 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1uPQAa-0001iR-3Q
 for qemu-arm@nongnu.org; Wed, 11 Jun 2025 14:27:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1749666444;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zUBueujoaF3SY5nslIqDYxh56xsOS9uQEUGXk8GVXVA=;
 b=bzQyCrbd5vrJ0Tx1HROHaVAYjs6adfBDg0EjwPSGMkzpqUqzSFfeSAQfS1Feo9d4qUo+H5
 SL4AUpZP6XVWmkKTt1AmKvHJnYOcezvNJTlRI0Cdmy9lUKfIWPnzEvMenm6wVd9erWU+x/
 BKwJ8+B3lel4D8SgTCSiv8JZDZaK/DM=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-449-1rVyhgshO_qYMZhU75p1IQ-1; Wed,
 11 Jun 2025 14:27:18 -0400
X-MC-Unique: 1rVyhgshO_qYMZhU75p1IQ-1
X-Mimecast-MFC-AGG-ID: 1rVyhgshO_qYMZhU75p1IQ_1749666434
Received: from mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.15])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id C71401956058; Wed, 11 Jun 2025 18:27:13 +0000 (UTC)
Received: from localhost (unknown [10.2.16.122])
 by mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id ED68519560A2; Wed, 11 Jun 2025 18:27:12 +0000 (UTC)
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
Subject: [PULL 25/31] hw/ppc/spapr_tpm_proxy: skip automatic zero-init of
 large arrays
Date: Wed, 11 Jun 2025 14:25:27 -0400
Message-ID: <20250611182533.200590-26-stefanha@redhat.com>
In-Reply-To: <20250611182533.200590-1-stefanha@redhat.com>
References: <20250611182533.200590-1-stefanha@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.15
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
X-TUID: 8MpYhW4kgS0i

From: Daniel P. Berrangé <berrange@redhat.com>

The 'tpm_execute' method has a pair of 4k arrays used for copying
data between guest and host. Skip the automatic zero-init of these
arrays to eliminate the performance overhead in the I/O hot path.

The two arrays will be fully initialized when reading data from
guest memory or reading data from the proxy FD.

Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
Reviewed-by: Klaus Jensen <k.jensen@samsung.com>
Reviewed-by: Harsh Prateek Bora <harshpb@linux.ibm.com>
Message-id: 20250610123709.835102-26-berrange@redhat.com
Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
---
 hw/ppc/spapr_tpm_proxy.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/ppc/spapr_tpm_proxy.c b/hw/ppc/spapr_tpm_proxy.c
index 862eeaa50a..1297b3ad56 100644
--- a/hw/ppc/spapr_tpm_proxy.c
+++ b/hw/ppc/spapr_tpm_proxy.c
@@ -41,8 +41,8 @@ static ssize_t tpm_execute(SpaprTpmProxy *tpm_proxy, target_ulong *args)
     target_ulong data_in_size = args[2];
     uint64_t data_out = ppc64_phys_to_real(args[3]);
     target_ulong data_out_size = args[4];
-    uint8_t buf_in[TPM_SPAPR_BUFSIZE];
-    uint8_t buf_out[TPM_SPAPR_BUFSIZE];
+    QEMU_UNINITIALIZED uint8_t buf_in[TPM_SPAPR_BUFSIZE];
+    QEMU_UNINITIALIZED uint8_t buf_out[TPM_SPAPR_BUFSIZE];
     ssize_t ret;
 
     trace_spapr_tpm_execute(data_in, data_in_size, data_out, data_out_size);
-- 
2.49.0

