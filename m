Received: by 2002:a17:505:ba85:b0:1be9:327d:8ee3 with SMTP id zs5csp1999102njc;
        Wed, 11 Jun 2025 11:29:29 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXTFRfI4zHbtoVyJLMemBf2JlsmilpQcXQe1g4Jr4pskY6Z/AeXAH8F28SxREy/9fGQepodGF7cf5M6Hg==@linaro.org
X-Google-Smtp-Source: AGHT+IHCn+Ok/5Lvk7jH0WdlTdPWPKjo6iLMG6OGP15psFznkFFmzbYI9BUejIAtKny0xY0SnxFy
X-Received: by 2002:a05:6214:c49:b0:6fa:a65a:224d with SMTP id 6a1803df08f44-6fb3478d99cmr7459276d6.4.1749666568917;
        Wed, 11 Jun 2025 11:29:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1749666568; cv=none;
        d=google.com; s=arc-20240605;
        b=lllk2ull3d3tmkzBF2NYXkjmaJzYDDiiCCq+AQHODgIDttvlrlmv7aoUsLbX0Q6Nct
         VZag+ZyuHevFJ3VNcxkQ3Mb1gW8RtNHMnBPI6pJy2qvNrXVvAOIY800H92vJmWdLC5Ls
         jsJKF3pDV/JPH53Dfm/CkddTYR2+NAde9XcQS2LuZxpzogT8ESgx7MUDwGZCU2BLAKzP
         VIyTQLxQzbMi9hOA65ZL6kxtO1ZizKkgqwmmplAeQ7EHo6JV0K2EEX/nDpcm/cRUaMz+
         EIL+dVuM6AcbseQ0pfba+MUpnK/dqloUVLh9FAypJZnhVWzZoQUilQOgyJD4+BJXhi3t
         s+yQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=a+3IbSd15/rc8GUbCSOu3df+NumonRFcoNFm3e5bolg=;
        fh=loh9k9y3S2mImjFs3v08l0zZWu2zKrkh48k9P3fQXm8=;
        b=ZU9CojnaI7X5cTH6tu/GsVVk/oq3LVW2CRI+lMA69R8ailNn4B/0uqFxIwMGHYrRS/
         ZYSw3yt/WN4S5P2JK/P1+hY4otQJyI+WsN0lWIah2hYJ1yTXUj2bGtP1Nvx8bF14qmUv
         UmTTTO6krc0DYn3ISaz3wEKlodOhVnwism8Mx+OvsqTJMIv9ITFR/gs3ZZJbaYVB6nTp
         cWW5pmR5gr0NUL4aTJ1xj0cc37/Dr8pgaFYfZgVqT4Q3YhTSkaEdi0iytHUIkFf/IPxS
         bYTEpv3Ba3SiD/z/PmKpEMK21GO167WFfrtudOBj1tSI9/OkVCREF5ApInZmOcXjzVhu
         t/Sg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=IEdLxoso;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6fb221fad1esi51293286d6.353.2025.06.11.11.29.28
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 11 Jun 2025 11:29:28 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=IEdLxoso;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uPQAh-0002VC-6O; Wed, 11 Jun 2025 14:27:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1uPQ9n-0001a8-KY
 for qemu-arm@nongnu.org; Wed, 11 Jun 2025 14:26:40 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1uPQ9g-0001Iv-PP
 for qemu-arm@nongnu.org; Wed, 11 Jun 2025 14:26:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1749666379;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=a+3IbSd15/rc8GUbCSOu3df+NumonRFcoNFm3e5bolg=;
 b=IEdLxosoS1xJFxZDZ/8kB19jWXyVdCLrrV5EwxfWNV5BgNJ0NKIRgu+PTRr9zllRCStXFU
 ZhG8TPFEAu418p31oce9Z7pbSOeb6mE9/oXpoUoHQfJ19W0gobXuNEMF1Dm8pWTai9vVXu
 hOcjjtdvbyuh/2Ni3gT8GkEcIVA5thg=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-622-Q6Hs_-hbPnyFGqvz5I4myw-1; Wed,
 11 Jun 2025 14:26:16 -0400
X-MC-Unique: Q6Hs_-hbPnyFGqvz5I4myw-1
X-Mimecast-MFC-AGG-ID: Q6Hs_-hbPnyFGqvz5I4myw_1749666372
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 216D1180028F; Wed, 11 Jun 2025 18:26:11 +0000 (UTC)
Received: from localhost (unknown [10.2.16.122])
 by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 624F218003FC; Wed, 11 Jun 2025 18:26:06 +0000 (UTC)
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
Subject: [PULL 05/31] chardev/char-pty: skip automatic zero-init of large array
Date: Wed, 11 Jun 2025 14:25:07 -0400
Message-ID: <20250611182533.200590-6-stefanha@redhat.com>
In-Reply-To: <20250611182533.200590-1-stefanha@redhat.com>
References: <20250611182533.200590-1-stefanha@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111
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
X-TUID: aAd2MbKpbJdX

From: Daniel P. Berrangé <berrange@redhat.com>

The 'pty_chr_read' method has a 4k byte array used for copying
data between the PTY and device. Skip the automatic zero-init
of this array to eliminate the performance overhead in the I/O
hot path.

The 'buf' array will be fully initialized when reading data off
the PTY.

Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
Message-id: 20250610123709.835102-6-berrange@redhat.com
Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
---
 chardev/char-pty.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/chardev/char-pty.c b/chardev/char-pty.c
index c28554e6e0..674e9b3f14 100644
--- a/chardev/char-pty.c
+++ b/chardev/char-pty.c
@@ -154,7 +154,7 @@ static gboolean pty_chr_read(QIOChannel *chan, GIOCondition cond, void *opaque)
     Chardev *chr = CHARDEV(opaque);
     PtyChardev *s = PTY_CHARDEV(opaque);
     gsize len;
-    uint8_t buf[CHR_READ_BUF_LEN];
+    QEMU_UNINITIALIZED uint8_t buf[CHR_READ_BUF_LEN];
     ssize_t ret;
 
     len = sizeof(buf);
-- 
2.49.0

