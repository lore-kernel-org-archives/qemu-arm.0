Received: by 2002:a17:505:ba85:b0:1be9:327d:8ee3 with SMTP id zs5csp1998838njc;
        Wed, 11 Jun 2025 11:28:58 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUMibZWWzCaHBnQ5X7q7tZprR9CBakq4OZ/t3r8cDzrBM48XdMClq+uHP5EYZbkCKD/nrcuxpYHxzBILA==@linaro.org
X-Google-Smtp-Source: AGHT+IElewGVKONCxUAJZ8d26fdp/TjmdieR5qEno//4LK/jOiyLX4N9MMziqm5j4kfcUL1VQxWw
X-Received: by 2002:a05:622a:4c0e:b0:4a6:fdb1:878d with SMTP id d75a77b69052e-4a72298b465mr10411601cf.24.1749666538605;
        Wed, 11 Jun 2025 11:28:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1749666538; cv=none;
        d=google.com; s=arc-20240605;
        b=kKPEvcYFS5kgoCeJ7OXSrnJEYTrhC3FJGJv5H7ieamuiO+BZiTGSS1Tyfia2oKPN/o
         cI1XB5Tu2Py8I3h0pMOHnhGBacoEv6QT2IMQGMaaO0vEAWD3YeXHjTnJ79BHQje5ekBc
         31cnss978rSVJzwLvQv+YF2JeNa6rZlJ+JlKPdyTh4RdHcJZR9Pc8y+Zt+Hy0vQYT1MZ
         EfL6nK67GAptzCn3vSw1xnF7D2RbPW+1vnp5X5mE2mqnMndoRmNYsVEg98V1+lrbhffC
         M9gYSDhF8kZ/w1dy7CV9Lq4eigTHZ5UZp+bu7KzPRFDAxG4yqu6hVZCamUXM10rFdFWG
         Rx2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=HrDpLNUDxNjCCWyN7dPnjdzORIrSgivckyj7LOAAsYg=;
        fh=loh9k9y3S2mImjFs3v08l0zZWu2zKrkh48k9P3fQXm8=;
        b=MrYVEKuKVAfai+NFA5T3tP6XXJEfRYh5CzZK1joNZTPdRA17Mfg0pnBVTNYC+QXUku
         DLKOpVpC3UA8tcGxlm3h1EOPgOocDberjaQVO4B0nV9KyX6PRojyC9omtyqR6BnUUiaD
         g9cqMz+meExeYkbgvO0wBbaVIVExo9nIPnyGWxB6BMvivA62CyeiVTg7rKhYxauXdksa
         lSzOzSwgkdSbgOPQHefkC5xw1hsydbB9TT8kLscwgywLb70I2CA3clNeRwpXPrgeuIru
         3snuJN8UPqehP2HVnl8P8K2XXMnahlqkqMnRoIMkKi8Twkgoexoq+O1M5z+0LSSXdMSI
         b3EA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Oeb+fjpk;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-4a61988cb19si133660011cf.314.2025.06.11.11.28.58
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 11 Jun 2025 11:28:58 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Oeb+fjpk;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uPQAj-0002d6-Db; Wed, 11 Jun 2025 14:27:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1uPQ9l-0001Wa-IY
 for qemu-arm@nongnu.org; Wed, 11 Jun 2025 14:26:37 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1uPQ9g-0001JP-MY
 for qemu-arm@nongnu.org; Wed, 11 Jun 2025 14:26:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1749666382;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HrDpLNUDxNjCCWyN7dPnjdzORIrSgivckyj7LOAAsYg=;
 b=Oeb+fjpkoPDN6fQ7KOZnf4hG4LpZzAS+enRVq/oT5nzA6ZScKAJe+rnSu1xbPVLwPw6bjh
 wmkM2EORwHDUf0TSUPd4w/Ait6S2v9seSRuuJ8v1ywwuPfmU4V1Tgd11YQVS4eTMaoeezk
 k0NYRHKQq73AE8T0tZWzGDmwQ93TErg=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-61-0fmQl1_hOTK9_fyKainSSA-1; Wed,
 11 Jun 2025 14:26:19 -0400
X-MC-Unique: 0fmQl1_hOTK9_fyKainSSA-1
X-Mimecast-MFC-AGG-ID: 0fmQl1_hOTK9_fyKainSSA_1749666375
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 9893418002A2; Wed, 11 Jun 2025 18:26:14 +0000 (UTC)
Received: from localhost (unknown [10.2.16.122])
 by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 85D4319560A3; Wed, 11 Jun 2025 18:26:12 +0000 (UTC)
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
Subject: [PULL 06/31] chardev/char-socket: skip automatic zero-init of large
 array
Date: Wed, 11 Jun 2025 14:25:08 -0400
Message-ID: <20250611182533.200590-7-stefanha@redhat.com>
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
X-TUID: MpFaeFVUdLjI

From: Daniel P. Berrangé <berrange@redhat.com>

The 'tcp_chr_read' method has a 4k byte array used for copying
data between the socket and device. Skip the automatic zero-init
of this array to eliminate the performance overhead in the I/O
hot path.

The 'buf' array will be fully initialized when reading data off
the network socket.

Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
Message-id: 20250610123709.835102-7-berrange@redhat.com
Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
---
 chardev/char-socket.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/chardev/char-socket.c b/chardev/char-socket.c
index e8dd2931dc..1e8313915b 100644
--- a/chardev/char-socket.c
+++ b/chardev/char-socket.c
@@ -497,7 +497,7 @@ static gboolean tcp_chr_read(QIOChannel *chan, GIOCondition cond, void *opaque)
 {
     Chardev *chr = CHARDEV(opaque);
     SocketChardev *s = SOCKET_CHARDEV(opaque);
-    uint8_t buf[CHR_READ_BUF_LEN];
+    QEMU_UNINITIALIZED uint8_t buf[CHR_READ_BUF_LEN];
     int len, size;
 
     if ((s->state != TCP_CHARDEV_STATE_CONNECTED) ||
-- 
2.49.0

