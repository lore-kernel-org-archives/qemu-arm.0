Received: by 2002:a17:505:ba85:b0:1be9:327d:8ee3 with SMTP id zs5csp1999414njc;
        Wed, 11 Jun 2025 11:30:07 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWe4gOQat+45mrazQQpeEa8soojzdHc5BdZtWdY4HiMFQ+Z2sJMEUwRX/CmrtWS/LqzFmsvgu2zzga2qg==@linaro.org
X-Google-Smtp-Source: AGHT+IFH22lWQ1CM6T8ASn4KKve5C+2W3xxcOvvtf3+/mwCk7o8UW8on+p0VVZIW2+4oQPY+3Ifp
X-Received: by 2002:a05:622a:4291:b0:4a4:3ca9:970d with SMTP id d75a77b69052e-4a713c2b11dmr72663121cf.27.1749666607601;
        Wed, 11 Jun 2025 11:30:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1749666607; cv=none;
        d=google.com; s=arc-20240605;
        b=NfPOLvWFHJXGWEP365ziphf9fmmLKA1eKqJcVrKqdYpBMJmoQo08QN74DTPIgrocb5
         DmiMQ18/5GkXyoxVZDDLDVqEekUTrw7QJkaIxVgtgWWBWXoJ1JLIfhF98rdif/nQhNRS
         xuLQH2fHQhz+3gi532R/TUXwLJjLnEnP8wGupMPvv87qWRFV6pbOKPkNKxFz3kaPhwII
         dSE2WGRByxG9vbxT0dAUVIVhy/ICI8agc5FVzXVPfh9/XKfjaARTZrzP8fAvK2Fd04Tc
         LmKJNADo9b8p2Lgwc2c6qob0/6ug9P7t3hJkXcf34CynTidIJYUSEuGAYVLHw+7kF7O1
         dF4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=mRFy2Ucg58TGuUkHvRrPt1Knp1WbjYx3ysY4ROiLkAw=;
        fh=loh9k9y3S2mImjFs3v08l0zZWu2zKrkh48k9P3fQXm8=;
        b=jmFENfPk6QBVdjEyMCYOZ01w9cYMLHJL2UG1NLD34SaL9KoOap912npQPaE/CLeM0+
         F1NF0Mx8eOKWxeRsIAd324vjz59XLmyg3jYbGbFnAnwI2nkr/2eg67HMSHMJner4O3dB
         GD9xgcFix9EvrO88T/Qu7CoJCcXuoYZBu8ii/6cLF5RfSxoddnzU+jZsw0L/8dn4nlf7
         wGDRE1dIgAMYEQGgyiOsZe0AMdtCC9GeZj3WAdXMHbUEXHEMgHN94gYqwRLUtVLooU5Y
         8gaAlXXEoIsvKFGRSi7IcPE8UJWy6g3Qjn3Qf1iFrBy34xp/45/kYGobzSYY2/9/z2uV
         vBuw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=VhF8Gtdm;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-4a6198c9703si140380201cf.576.2025.06.11.11.30.07
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 11 Jun 2025 11:30:07 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=VhF8Gtdm;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uPQBH-0004HW-L2; Wed, 11 Jun 2025 14:28:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1uPQAA-0001ur-Vu
 for qemu-arm@nongnu.org; Wed, 11 Jun 2025 14:27:12 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1uPQA6-0001XT-UT
 for qemu-arm@nongnu.org; Wed, 11 Jun 2025 14:27:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1749666416;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mRFy2Ucg58TGuUkHvRrPt1Knp1WbjYx3ysY4ROiLkAw=;
 b=VhF8Gtdmq7/Xz3iDlpnrAXZQ6/dpfg9dYBysJ9O2NfeUGnRy7Qp07ZedWzBdx7elYn1G8R
 hrrM1f4WLytlKRZ4SeTHrlVeGn6wIyQZAzvEwU0Lk3qxqzy6SifNKGIYeyFrdoUKo3BLJx
 5zFU4SsmzbCOwAlsupcMJ8h+WvsNDfs=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-316-Sv3XTrdpMAeAY9szI_NyDA-1; Wed,
 11 Jun 2025 14:26:51 -0400
X-MC-Unique: Sv3XTrdpMAeAY9szI_NyDA-1
X-Mimecast-MFC-AGG-ID: Sv3XTrdpMAeAY9szI_NyDA_1749666403
Received: from mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.15])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 79A3F1955F08; Wed, 11 Jun 2025 18:26:43 +0000 (UTC)
Received: from localhost (unknown [10.2.16.122])
 by mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id BFF811956087; Wed, 11 Jun 2025 18:26:39 +0000 (UTC)
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
Subject: [PULL 14/31] hw/char/sclpconsole-lm: skip automatic zero-init of
 large array
Date: Wed, 11 Jun 2025 14:25:16 -0400
Message-ID: <20250611182533.200590-15-stefanha@redhat.com>
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
X-TUID: 8W/1lEJPGLZ6

From: Daniel P. Berrangé <berrange@redhat.com>

The 'process_mdb' method has a 4k byte array used for copying data
between the guest and the chardev backend. Skip the automatic zero-init
of this array to eliminate the performance overhead in the I/O hot
path.

The 'buffer' array will be selectively initialized when data is converted
between EBCDIC and ASCII.

Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
Message-id: 20250610123709.835102-15-berrange@redhat.com
Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
---
 hw/char/sclpconsole-lm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/char/sclpconsole-lm.c b/hw/char/sclpconsole-lm.c
index e9580aacba..3e40d5e434 100644
--- a/hw/char/sclpconsole-lm.c
+++ b/hw/char/sclpconsole-lm.c
@@ -214,7 +214,7 @@ static int process_mdb(SCLPEvent *event, MDBO *mdbo)
 {
     int rc;
     int len;
-    uint8_t buffer[SIZE_BUFFER];
+    QEMU_UNINITIALIZED uint8_t buffer[SIZE_BUFFER];
 
     len = be16_to_cpu(mdbo->length);
     len -= sizeof(mdbo->length) + sizeof(mdbo->type)
-- 
2.49.0

