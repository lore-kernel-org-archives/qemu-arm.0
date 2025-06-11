Received: by 2002:a17:505:ba85:b0:1be9:327d:8ee3 with SMTP id zs5csp2002817njc;
        Wed, 11 Jun 2025 11:36:09 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXgCRxiiNUwC1DPqMzdDf0A5taUB+HGCJ7FMp3m0Bf/7r0Aqf4704MYA/szT8S4pz1FwBU1hux4fzVfrw==@linaro.org
X-Google-Smtp-Source: AGHT+IEfrg+dS3AINqZFg04Eii5Oq28CDG5ak2euRehsKb631EZNG28IrDQG8HgT1QH18q9D7rlP
X-Received: by 2002:a05:6214:485:b0:6fa:c22c:f7ae with SMTP id 6a1803df08f44-6fb34804e26mr8388966d6.16.1749666969343;
        Wed, 11 Jun 2025 11:36:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1749666969; cv=none;
        d=google.com; s=arc-20240605;
        b=TnmjtQVPMLmdfosO3Ij2Mah5LRoraFNGvkxe5H47Z1viJ8WzWf3CUMLszDQ2PPDTnw
         Eq/Qeg1GMOfzb2+o4sP8tDyNZvc7LOZu6MMlWOAOF+0Jc9Kgf5+GYEnPc1aNKiUkXxYJ
         0F6hN0RVapd6VHuhnH8Q61Z2oNyk/JL9+FrNjYBxas7Vrc2bJgsExkq3WrrxLAhcpNLW
         TWc7jnkPWZOfsvB68eB/bRvpFkeZyQVYsUTYwgRc9XRV4gW9lbcP9PwPdUrPISXKJtDS
         crxbJuevCyVw+CgfPEKJMTYZJYrlMejChbV0OFjH31hzqKtf61sBPPQJZaWgHfbWN3jM
         J6UA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=tOmeR+7YKB0Um31qhvM3CwNMwBeIMA6XIJySMb2QpY4=;
        fh=loh9k9y3S2mImjFs3v08l0zZWu2zKrkh48k9P3fQXm8=;
        b=La4KJNsHeDB0teytlIH98VennQr9Ak2bs+FMIgQsIVmhmUBOMFgX2yutf3/p0etjnv
         yiteUjK0fJNR8BQBlLIvPFHZySUu81KIcCLXcxl7LLiyyMrnQqdNCT75Tw7+omt4ud1S
         HHE3lgqwKkx/CVzpTJZdFWsI0e36CwLlLBNbBmO4GU55ye8tusQ9qjVQgUPOfcu3Igje
         R3xK8a+yquat5nOAcFYz2HATTBtwkpKmRsZCA06QXOmvViCcf+287PKPFP035VD5S2yj
         +Oz7szJWWKMgnwBHxDurDulVaa5Lk3Il9B+4Cj+us7GUdn7Wxbob5AgK1dnHXc3QSZS9
         cBjw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=e9DG94Gx;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6fb09b2614dsi127788756d6.300.2025.06.11.11.36.09
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 11 Jun 2025 11:36:09 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=e9DG94Gx;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uPQB7-0003WB-In; Wed, 11 Jun 2025 14:28:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1uPQ9v-0001fD-VC
 for qemu-arm@nongnu.org; Wed, 11 Jun 2025 14:26:48 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1uPQ9l-0001Ml-Dr
 for qemu-arm@nongnu.org; Wed, 11 Jun 2025 14:26:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1749666396;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tOmeR+7YKB0Um31qhvM3CwNMwBeIMA6XIJySMb2QpY4=;
 b=e9DG94GxlqNe8ogB07XzN9YjVYNBbNd6KOBUF8eiCjrL6WhG4LFqhHsXBty5Ga/VeUjCYd
 REFa86jDHNs/aKL2TodX95VI+dxCdqlbK+3nBNFTmxEiRZ5gexJvv9Jjjho8HfTjdTWm97
 +HCMMjXP4gbcrAuLdj/CBHmr8Aon9SE=
Received: from mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-157-u0FD2h3PP0KIDu8Q0n65Hw-1; Wed,
 11 Jun 2025 14:26:32 -0400
X-MC-Unique: u0FD2h3PP0KIDu8Q0n65Hw-1
X-Mimecast-MFC-AGG-ID: u0FD2h3PP0KIDu8Q0n65Hw_1749666388
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 66D92195608F; Wed, 11 Jun 2025 18:26:28 +0000 (UTC)
Received: from localhost (unknown [10.2.16.122])
 by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 8E91119560B2; Wed, 11 Jun 2025 18:26:22 +0000 (UTC)
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
Subject: [PULL 09/31] hw/audio/es1370: skip automatic zero-init of large array
Date: Wed, 11 Jun 2025 14:25:11 -0400
Message-ID: <20250611182533.200590-10-stefanha@redhat.com>
In-Reply-To: <20250611182533.200590-1-stefanha@redhat.com>
References: <20250611182533.200590-1-stefanha@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12
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
X-TUID: csgkMD73rgN6

From: Daniel P. Berrangé <berrange@redhat.com>

The 'es1370_transfer_audio' method has a 4k byte array used for
copying data between the audio backend and device. Skip the automatic
zero-init of this array to eliminate the performance overhead in
the I/O hot path.

The 'tmpbuf' array will be fully initialized when reading data from
the audio backend and/or device memory.

Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
Message-id: 20250610123709.835102-10-berrange@redhat.com
Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
---
 hw/audio/es1370.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/audio/es1370.c b/hw/audio/es1370.c
index 8efb969212..a6a32a6348 100644
--- a/hw/audio/es1370.c
+++ b/hw/audio/es1370.c
@@ -604,7 +604,7 @@ static uint64_t es1370_read(void *opaque, hwaddr addr, unsigned size)
 static void es1370_transfer_audio (ES1370State *s, struct chan *d, int loop_sel,
                                    int max, bool *irq)
 {
-    uint8_t tmpbuf[4096];
+    QEMU_UNINITIALIZED uint8_t tmpbuf[4096];
     size_t to_transfer;
     uint32_t addr = d->frame_addr;
     int sc = d->scount & 0xffff;
-- 
2.49.0

