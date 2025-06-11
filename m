Received: by 2002:a17:505:ba85:b0:1be9:327d:8ee3 with SMTP id zs5csp1998662njc;
        Wed, 11 Jun 2025 11:28:37 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVVqKN4FpLEyi90rNgiNiVyWhhlFrU4/cuyGgnVO6haCxEOSlcddBqVxe9KoZPjwG+lMZ6RpHuL4GJUWA==@linaro.org
X-Google-Smtp-Source: AGHT+IFx6G3xYQzDGHm0K4TVBzjVE/TJ/ti1Qsrx1dmUji51FIfhJUc/9XtJA2APPa6mwj3PHaQN
X-Received: by 2002:a05:622a:98b:b0:494:7ca0:2ff with SMTP id d75a77b69052e-4a713b9a54fmr67257291cf.15.1749666516961;
        Wed, 11 Jun 2025 11:28:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1749666516; cv=none;
        d=google.com; s=arc-20240605;
        b=Req8dUpri5sxqF1CXWjAxxURT4DnIzac5JTRz8Qz/msfyseVyJHtaBctx5sOCfHXYh
         Z3nDRFGEizYw/76u3VHgfZtWGyyOVq/p2GnUdADj/Rc0+fw8WuYcH+aibR2VR5hdFb6s
         /sIr0YSuYBg3jp0vWjv7ZcgEGHHvN2FyfS9wRpqmTYRNOK6TsGTr3x4PuIZR5U3keL1X
         iph11649/dUiYa9PiV8Ff+XKTNCAwZ9oKIRoDvg6799AZnyc8+n4CjNs8v5cnymDxPF0
         yCfGFmJF0gtxnTGPUXKHJl0pkh43uu669tX+75aeJpkeR/DkV9xLYfDzI+qHWY/u2ikF
         F8Fw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=mt7Eev/XPLmMMdxpFyBJo5Jewpv1gUUY+0ePO6YtQ/c=;
        fh=loh9k9y3S2mImjFs3v08l0zZWu2zKrkh48k9P3fQXm8=;
        b=Q7r6IJFTIKJVqPVQZkpAroN7nEH81XmM+YYfRReHk0YL046olVzjU5RhegXfTAICVT
         Rwj64v5ijmg6C+ZgzKBQLhWHqtvriyoT4yzX9DwI9k2aY7xUl3mOSGu0sh3e+GiO8bBD
         LPwAb/kEfMw7dDEQUxCjDiffHVLzeViAwmM6MkIhkBY4NXwS3UtaCuTZZlwqdmEZL/Wt
         YcJ+i5K3RNGsYGBIHX8atlCWpAIEXVvkpE/CROOYh+63Mf+CTcQxgLDdx7MSSm+Nba4o
         Y5jF7zTid2Z3GjsQA6ZLHfCjmcmdjH507pVXyEtiYivN3I6ffcveKwbRXNxwwMR5N7M3
         Gm0g==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=ZtUxJoFR;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-4a6f572d108si103705541cf.309.2025.06.11.11.28.36
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 11 Jun 2025 11:28:36 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=ZtUxJoFR;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uPQAN-0001xp-Dd; Wed, 11 Jun 2025 14:27:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1uPQ9l-0001WF-E1
 for qemu-arm@nongnu.org; Wed, 11 Jun 2025 14:26:37 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1uPQ9e-0001IB-SQ
 for qemu-arm@nongnu.org; Wed, 11 Jun 2025 14:26:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1749666373;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mt7Eev/XPLmMMdxpFyBJo5Jewpv1gUUY+0ePO6YtQ/c=;
 b=ZtUxJoFRrMljj1bWE18YRV1+vK7K1JlO/nuXwRQMEyfXH4T9FitWyAN+4MzAfYeKD5GyjT
 8WKzHu1DAt4bBEAwOinqKLvVilZ6jcy/VscNhik1x8bp1EmYyeN0jmc1EdnGznEAGtfDCL
 cBHlHd0AJttrM408PL7LwdiX1VVPP0k=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-657-cE_DP5rNMDGSzqy0Vv7YPQ-1; Wed,
 11 Jun 2025 14:26:09 -0400
X-MC-Unique: cE_DP5rNMDGSzqy0Vv7YPQ-1
X-Mimecast-MFC-AGG-ID: cE_DP5rNMDGSzqy0Vv7YPQ_1749666366
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 4ED6918002A4; Wed, 11 Jun 2025 18:26:05 +0000 (UTC)
Received: from localhost (unknown [10.2.16.122])
 by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 254A31800284; Wed, 11 Jun 2025 18:26:04 +0000 (UTC)
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
Subject: [PULL 04/31] chardev/char-fd: skip automatic zero-init of large array
Date: Wed, 11 Jun 2025 14:25:06 -0400
Message-ID: <20250611182533.200590-5-stefanha@redhat.com>
In-Reply-To: <20250611182533.200590-1-stefanha@redhat.com>
References: <20250611182533.200590-1-stefanha@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93
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
X-TUID: unsLzomYzJqv

From: Daniel P. Berrangé <berrange@redhat.com>

The 'fd_chr_read' method has a 4k byte array used for copying
data between the socket and device. Skip the automatic zero-init
of this array to eliminate the performance overhead in the I/O
hot path.

The 'buf' array will be fully initialized when reading data off
the network socket.

Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
Message-id: 20250610123709.835102-5-berrange@redhat.com
Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
---
 chardev/char-fd.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/chardev/char-fd.c b/chardev/char-fd.c
index 23bfe3c0b1..6f03adf872 100644
--- a/chardev/char-fd.c
+++ b/chardev/char-fd.c
@@ -50,7 +50,7 @@ static gboolean fd_chr_read(QIOChannel *chan, GIOCondition cond, void *opaque)
     Chardev *chr = CHARDEV(opaque);
     FDChardev *s = FD_CHARDEV(opaque);
     int len;
-    uint8_t buf[CHR_READ_BUF_LEN];
+    QEMU_UNINITIALIZED uint8_t buf[CHR_READ_BUF_LEN];
     ssize_t ret;
 
     len = sizeof(buf);
-- 
2.49.0

