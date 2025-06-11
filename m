Received: by 2002:a17:505:ba85:b0:1be9:327d:8ee3 with SMTP id zs5csp1998260njc;
        Wed, 11 Jun 2025 11:27:51 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCX9U3nS48bbfyh7VL0Pfqy2ErOWRXQe4X30QpMxqMzQb/K2g0LpFJR3xt9CSWeREXGgrsPjYw/rJfOnqQ==@linaro.org
X-Google-Smtp-Source: AGHT+IHxhlO52D2Qs0qEgpQ9t2c1HROSP7C0Qf7FYDfE/UX4obCuecHJxTg3MC0o+dkE9OsaK/BO
X-Received: by 2002:a05:622a:558e:b0:4a6:f878:346a with SMTP id d75a77b69052e-4a713b856ddmr69679191cf.11.1749666471487;
        Wed, 11 Jun 2025 11:27:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1749666471; cv=none;
        d=google.com; s=arc-20240605;
        b=Xt6PwclWPONrUa6joSHGFl8oPlhClHfKC+dQp0zVCiLs3NlG/NYy1IiNudzWpSoOtx
         4Boe8xB4XUJP+fMYlVMgUlSUExvLG7LFr1IaUVgFJ0unsrnyVGJY441nh1UgWIzKWrB4
         V3mGQIYELbexGbBRZkIqug1V8QOEcKj1WQqnpgZumYiYA3tgcYJtFu7jnC1kydfMLXkt
         mQmv0HO2T3H6HJ7okjlZqvHUQpQZe6oU3rYY4qhgn7E/Tp8NpOImyc1vU2gGx2dEOE7E
         kRrczLvYiaXXA/SNomo15zzmUrUwwXXmUZCJ9vG9G8XA7oknvjvp1wKwpkRj60ag40tM
         95Og==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=mm98qXn5IDmt3E297nVLvHl5ngbngtyzaU5/4dIyXnw=;
        fh=loh9k9y3S2mImjFs3v08l0zZWu2zKrkh48k9P3fQXm8=;
        b=M4RKL4ryNnIYMRzLcwNv0Zxv3ZTDwhuxtHeZfQZnKNZujGGLqgSh8mQTtE7TK3fO/M
         ntcKFJEoSOLA+lJSNnBFWZj7p5qdTHCAkJyUgIM4+lgznl/uIqLBVIQrjwaBXCRRPvC/
         z08xT2z2bTlq29q0yBjAnnA6m5hArh69tnvVJM2xJ+G9LBLqRaWKTQ+YfGSoUpxrhOro
         ggCW5FaNS0x53azQ0H5mPIM/I3Ix4Tvcq2aLP3fG2g9wRqZZ4pxYx9KmGlUK0ZzulnMy
         vvA2MR9/jahNjFmzuPYh3sAHVos1PAZcN5r8PA10reoEEw8yP8aIY1xT4LaB5cBBNmj7
         yKiQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=OmRx0aR8;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-4a6198ce948si124873071cf.638.2025.06.11.11.27.51
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 11 Jun 2025 11:27:51 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=OmRx0aR8;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uPQ9x-0001ho-Lx; Wed, 11 Jun 2025 14:26:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1uPQ9l-0001Wz-QM
 for qemu-arm@nongnu.org; Wed, 11 Jun 2025 14:26:38 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1uPQ9g-0001Hf-Mt
 for qemu-arm@nongnu.org; Wed, 11 Jun 2025 14:26:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1749666370;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mm98qXn5IDmt3E297nVLvHl5ngbngtyzaU5/4dIyXnw=;
 b=OmRx0aR8nKs1UnbqFH55GSxG5J4cR26tz/h9u/YavUJOo8AY0hq5BUcy5PIYZKBH4yY2KE
 ypE1fT/MA365eSHfR1qR0ZxmSXt+xlBNyYZxRelRNUuDJJSdx2/7zBhQLOvx8JDaeem0Xg
 bEl78CTIfrhLH4qg2vWSR9jxZk1Hg0I=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-591-E9XgjjYEMhqIillSL_vM_Q-1; Wed,
 11 Jun 2025 14:26:07 -0400
X-MC-Unique: E9XgjjYEMhqIillSL_vM_Q-1
X-Mimecast-MFC-AGG-ID: E9XgjjYEMhqIillSL_vM_Q_1749666364
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 0D00B195608E; Wed, 11 Jun 2025 18:26:03 +0000 (UTC)
Received: from localhost (unknown [10.2.16.122])
 by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id F008819560A3; Wed, 11 Jun 2025 18:26:00 +0000 (UTC)
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
Subject: [PULL 03/31] block: skip automatic zero-init of large array in
 ioq_submit
Date: Wed, 11 Jun 2025 14:25:05 -0400
Message-ID: <20250611182533.200590-4-stefanha@redhat.com>
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
X-TUID: z0yMzFlTvQA/

From: Daniel P. Berrangé <berrange@redhat.com>

The 'ioq_submit' method has a struct array that is 8k in size.
Skip the automatic zero-init of this array to eliminate the
performance overhead in the I/O hot path.

The 'iocbs' array will selectively initialized when processing
the I/O data.

Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
Message-id: 20250610123709.835102-4-berrange@redhat.com
Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
---
 block/linux-aio.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/block/linux-aio.c b/block/linux-aio.c
index 407369f5c9..c200e7ad20 100644
--- a/block/linux-aio.c
+++ b/block/linux-aio.c
@@ -291,7 +291,7 @@ static void ioq_submit(LinuxAioState *s)
 {
     int ret, len;
     struct qemu_laiocb *aiocb;
-    struct iocb *iocbs[MAX_EVENTS];
+    QEMU_UNINITIALIZED struct iocb *iocbs[MAX_EVENTS];
     QSIMPLEQ_HEAD(, qemu_laiocb) completed;
 
     do {
-- 
2.49.0

