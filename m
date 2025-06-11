Received: by 2002:a17:505:ba85:b0:1be9:327d:8ee3 with SMTP id zs5csp2000031njc;
        Wed, 11 Jun 2025 11:31:00 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUo4GFDqno3VSegXoBQQgXvgrh3NQciodLui/dWHuNcobnuxGZdpf175B41CO/EXJ+0Rg05+pKbxNblJQ==@linaro.org
X-Google-Smtp-Source: AGHT+IFuu/sPdx4QIoLTGXsdhgZaWyvHPzwkD3QUtYc2YKMWbuKeWRp3pbLh5E4hiBvBdFzt4pTN
X-Received: by 2002:a05:600c:681b:b0:453:9bf:6f79 with SMTP id 5b1f17b1804b1-4532b929227mr8478905e9.26.1749666660458;
        Wed, 11 Jun 2025 11:31:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1749666660; cv=none;
        d=google.com; s=arc-20240605;
        b=eFV4NIbZQwWLTiNKTpZmwsCAGIwYKB1JWr/U40ZTw7EdU9E37QatDzGuji8a0iurP/
         3Pp793B65TdqW1lam35J3ZXIgwTLeiOAU+ROqOuqck82jnMGbPLNqTj6TZfxm0vs1zdB
         UqgyW9XpjJUK1u3hpIsZAKUy4D8Wq6AZN4WlbN5pLh9vIYxZ7x0GVrMR3akr+yNVAVhm
         3wURbZPs3fMu8v4vA3z2U1zkzXxXs7qfESdVkqMh/XLzqBjPc7srFJoWnvXg1HgxaBo2
         VN3rNGH4VYSDvvU9O/shX+ENuEtLJlOh+nWvtsN2de46t28d15stQzwx0zdW05uHlyfO
         +Hww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=im3waQOttvXRq21y6DO+WT6rky//dGN0HZp3WTaOmSo=;
        fh=loh9k9y3S2mImjFs3v08l0zZWu2zKrkh48k9P3fQXm8=;
        b=A46I7urJauzWuN/i6Ux9EQh9Lz0zO23ogr2aBXk/0HYiDYw1cHiAbfBRw7DDxoSz7/
         nJ4jgx+XNn1tDOX/DHPgd+0xrAh9sMP9sz/HdpaCbr/qZqdCLD8oWWoeGOtKRbq/FYuf
         aiEc8uEYgENVyO7+BGlypE61dkz5N3jlJco7+7/SK8bEC4nHXE68xrchltMQ5c92twUq
         h2zg9cIq4267MIvv1SuDBPxS/uHIvZXDPOlZVbdeu/gs07knY+JWUcfvibGgXJ7WpjhP
         k7iGDqXMATlQuPdOTufe20tPE0VQvkFowhJkl79m2f09kN4QpYmwcJd08OmelJ7X19HQ
         cnQQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=dH4UK6X5;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 5b1f17b1804b1-453251762bdsi18983225e9.46.2025.06.11.11.31.00
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 11 Jun 2025 11:31:00 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=dH4UK6X5;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1uPQBL-0004PA-2l; Wed, 11 Jun 2025 14:28:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1uPQA1-0001oA-7K
 for qemu-devel@nongnu.org; Wed, 11 Jun 2025 14:26:53 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1uPQ9t-0001SV-Oa
 for qemu-devel@nongnu.org; Wed, 11 Jun 2025 14:26:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1749666405;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=im3waQOttvXRq21y6DO+WT6rky//dGN0HZp3WTaOmSo=;
 b=dH4UK6X5+8FRdxksYF1NUf+w9xatOOYAUj9hRKuMc3s7ZyDWF8dSJ4ev9viOQWp9X7Yv7O
 jcjvZJRiVclCXb3WNT3jvGQMAyjCSj5vYiQuWtjMqbYnCJ/Ol+mmMY6TQSsY+6eFfbWBUT
 TW8RRmo6M5+D0tsQ8G8EXxET43mrVJw=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-267-FkF2Su1ZOYS-Chr4rc82RA-1; Wed,
 11 Jun 2025 14:26:41 -0400
X-MC-Unique: FkF2Su1ZOYS-Chr4rc82RA-1
X-Mimecast-MFC-AGG-ID: FkF2Su1ZOYS-Chr4rc82RA_1749666398
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 5473E1955F2C; Wed, 11 Jun 2025 18:26:38 +0000 (UTC)
Received: from localhost (unknown [10.2.16.122])
 by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 6B2DA19560A3; Wed, 11 Jun 2025 18:26:37 +0000 (UTC)
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
Subject: [PULL 13/31] hw/audio/via-ac97: skip automatic zero-init of large
 array
Date: Wed, 11 Jun 2025 14:25:15 -0400
Message-ID: <20250611182533.200590-14-stefanha@redhat.com>
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
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: eqmJtkl/0ZI4

From: Daniel P. Berrangé <berrange@redhat.com>

The 'out_cb' method has a 4k byte array used for copying data
between the audio backend and device. Skip the automatic zero-init
of this array to eliminate the performance overhead in the I/O hot
path.

The 'tmpbuf' array will be fully initialized when reading data from
device memory.

Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
Message-id: 20250610123709.835102-14-berrange@redhat.com
Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
---
 hw/audio/via-ac97.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/audio/via-ac97.c b/hw/audio/via-ac97.c
index 1e0a5c7398..d5231e1cf2 100644
--- a/hw/audio/via-ac97.c
+++ b/hw/audio/via-ac97.c
@@ -175,7 +175,7 @@ static void out_cb(void *opaque, int avail)
     ViaAC97SGDChannel *c = &s->aur;
     int temp, to_copy, copied;
     bool stop = false;
-    uint8_t tmpbuf[4096];
+    QEMU_UNINITIALIZED uint8_t tmpbuf[4096];
 
     if (c->stat & STAT_PAUSED) {
         return;
-- 
2.49.0

