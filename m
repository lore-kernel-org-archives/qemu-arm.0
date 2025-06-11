Received: by 2002:a17:505:ba85:b0:1be9:327d:8ee3 with SMTP id zs5csp1999140njc;
        Wed, 11 Jun 2025 11:29:32 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUDw8CmMbL46Wf1Km+oDy4eFToK0KibT2e87N0NCXyM9gL0DrIJJjOtfnhDhUmAJhDFGCBOHmbyMX+dQg==@linaro.org
X-Google-Smtp-Source: AGHT+IEuXykqzvZpG7/KGAi434LafrZqMsiBr2nimoEljvHfKZE6vCLFmCKiG29/WvELQleK/9dW
X-Received: by 2002:a05:622a:2619:b0:4a3:5ba8:4978 with SMTP id d75a77b69052e-4a722968e8cmr11300421cf.21.1749666572138;
        Wed, 11 Jun 2025 11:29:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1749666572; cv=none;
        d=google.com; s=arc-20240605;
        b=IdKPi/RuY20tfM7Mjh1GFE94RGJBBSdHnZEOFGjklwZmUh5FDM7/U68pSUFMNP0vlh
         FR9b9NRbz9ojdBF2r2rDo+O8BhQbshu0JaagNqGQtfR3h9dZYfggH0FjqpTiV3iBM2kZ
         x+f0t0SLWL0OgBPHYsXJ/WUhLSyY00sfK/hZ9ohWytpYBiDNCGpy6gl0cit4Fo6PMOL9
         vo4kKSJfuFUKqygyRQ6R7Bhqq2fnM59pY/eVwptRlSJsupR47vOCe9aTRA54UIh/LeY8
         72qbhcVAKqEKZMPj3xWHAeGfSh3qOTtmDkcwgtZf/uJ93Hfuotd1/mKuNzlib/NnEXsS
         iSmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=EY31iwe6lMrC3heUYVrnbfnuVcc4xslPfJSpEvuNg6o=;
        fh=loh9k9y3S2mImjFs3v08l0zZWu2zKrkh48k9P3fQXm8=;
        b=WBvrb4a4xRUwOlkKNyrWqv1cW0WFAiOoWkIWsylZR3xBf/GSC+KKMlFmtp9nBcN3ux
         YyE6QrRa1+BAdBVrY8b99s3RkN6SJP/xsWBRxsLsOvc8fBFsMFtHH7RbT2HNX69qc43z
         W6m/4HfGTmrovWeTFqZzd6jjsI+Dm71ltRAirtzPtttFSbR/SUb/w1lia3JkXWeCK6PG
         +4+HoXxBlbWjfCyhKIVdvhL/q2/KkyFDeFDPuApuAqsjPdpQ3NQJIRWEF0rhbVv/Ucnc
         k+jzaBN7lR7HIZWpe7YiNJX/n4OWM/vhpICIL0xEfRgpm2Po4uvc1n2M2Csl4OnWhpKk
         Li6g==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="jEz/gnry";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-4a61116a6f1si127335131cf.15.2025.06.11.11.29.32
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 11 Jun 2025 11:29:32 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="jEz/gnry";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1uPQBY-0004h9-Dx; Wed, 11 Jun 2025 14:28:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1uPQAJ-0001xi-RY
 for qemu-devel@nongnu.org; Wed, 11 Jun 2025 14:27:13 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1uPQA7-0001YG-E8
 for qemu-devel@nongnu.org; Wed, 11 Jun 2025 14:27:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1749666418;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=EY31iwe6lMrC3heUYVrnbfnuVcc4xslPfJSpEvuNg6o=;
 b=jEz/gnry+R3Sv0GgBelmlVEaZnKP72gGEsrt1SjTZ/mLJO9uCgGogaD1h4q0N0fUX7S8zQ
 XqsgH+LEv6+LUSug7TyXS2/oE3YZR52UDHaR9obNC1GnYHcxRaYAJ+KD06wRMmbid702iR
 hIPQbmCZFsG3zu7/2hx0jLxRDmN37HU=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-130-xO02etT5ORmRJ79kOiamwA-1; Wed,
 11 Jun 2025 14:26:54 -0400
X-MC-Unique: xO02etT5ORmRJ79kOiamwA-1
X-Mimecast-MFC-AGG-ID: xO02etT5ORmRJ79kOiamwA_1749666408
Received: from mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.40])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id A72D11809C80; Wed, 11 Jun 2025 18:26:48 +0000 (UTC)
Received: from localhost (unknown [10.2.16.122])
 by mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id D1F1519560A3; Wed, 11 Jun 2025 18:26:46 +0000 (UTC)
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
Subject: [PULL 16/31] hw/display/vmware_vga: skip automatic zero-init of large
 struct
Date: Wed, 11 Jun 2025 14:25:18 -0400
Message-ID: <20250611182533.200590-17-stefanha@redhat.com>
In-Reply-To: <20250611182533.200590-1-stefanha@redhat.com>
References: <20250611182533.200590-1-stefanha@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.40
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
X-TUID: CB8lbDY/Ppgw

From: Daniel P. Berrangé <berrange@redhat.com>

The 'vmsvga_fifo_run' method has a struct which is a little over 20k
in size, used for holding image data for cursor changes. Skip the
automatic zero-init of this struct to eliminate the performance
overhead in the I/O hot path.

The cursor variable will be fully initialized only when processing
a cursor definition message from the guest.

Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
Message-id: 20250610123709.835102-17-berrange@redhat.com
Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
---
 hw/display/vmware_vga.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/display/vmware_vga.c b/hw/display/vmware_vga.c
index 544bb65320..bc1a8ed466 100644
--- a/hw/display/vmware_vga.c
+++ b/hw/display/vmware_vga.c
@@ -618,7 +618,7 @@ static void vmsvga_fifo_run(struct vmsvga_state_s *s)
     uint32_t cmd, colour;
     int args, len, maxloop = 1024;
     int x, y, dx, dy, width, height;
-    struct vmsvga_cursor_definition_s cursor;
+    QEMU_UNINITIALIZED struct vmsvga_cursor_definition_s cursor;
     uint32_t cmd_start;
 
     len = vmsvga_fifo_length(s);
-- 
2.49.0

