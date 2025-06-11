Received: by 2002:a17:505:ba85:b0:1be9:327d:8ee3 with SMTP id zs5csp2003631njc;
        Wed, 11 Jun 2025 11:37:37 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVhW9ajzcbgsekh+KWDN67dNrntpN+7tdF59BUdKTzHZR3uhltBS6QVFaJ0GRsry1rQqPC6dRPqTmn8mA==@linaro.org
X-Google-Smtp-Source: AGHT+IEqBoryLu8mvItNcgyTg1RoMbTMgl+QQoSXnFPCInZd93bMk6b6LuolrPfhYQyo1MQ7T/HR
X-Received: by 2002:a05:6214:1305:b0:6fa:cc39:90 with SMTP id 6a1803df08f44-6fb34658b0emr8798066d6.29.1749667057291;
        Wed, 11 Jun 2025 11:37:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1749667057; cv=none;
        d=google.com; s=arc-20240605;
        b=OryEDw6WZxYuQrpLvcDZ1dXP6QzcaQL+K9b9fBPiI5DHoHGHp6a2hY8rYpBc8spSq5
         nZiDQ5UpbfYoKlZimixs3Snk46Xkbtw3pbHbpPMrOlblKwmag0sUHg64QZAInmUUgLwf
         tnstyHBgBxWRLegsKP8tCJK50OnuIKn40MhfQsENij9GP1lg3hWdzxbcDn1JhyjD9TkH
         MH7nfF3v+aay9QZ+IRCytsIZHvu5Oq51WWZ64LpVEhvikZR6AX/q9snVt/Xn07fxrhYB
         XVLzoe50lUSWWiqfL24ywKPWous5/85KpqGoHP1j/Rtd1nqby5wAboohfZwB537xax3A
         6+Hg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=FU8wL7XxDJ9uyH0nMB1l6aLZjdzSp7OBD7R4cqOfBZU=;
        fh=llWsnZZ16TEYjnayUds9QVVisxba1LyOA7TWHTWVEKk=;
        b=lyYyH7MYN52lMyf89sacfPFQ1Hx/j3GFODyM75SiuuoBPoE0INyG80oVovYj8yQNP2
         3c7bCON95aO0U9kOgPr0JTsCL8Xdr8wwlJRw/yYexa3I/a+AXanIm+63l2f75GaXtu8s
         O1w5ooO19f50Us/ZAlZHbBi5AMhZdGPChosatRnLLtjTXnxAm171EzQQXqk2XBsSvLjd
         CoKf28Z+LFfLUkqt54A13tnXHzh3Kw2pep1EZjFDQi+BGcnBny9Zs51VC65dIzsv50WF
         TLCHpLh2LM8CNKaKgO+A4ZJnchuZsCod0Uo7i5rBD83WCRIdqJ1APCAmOFeBcz8tj9Ft
         Z9FA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=KrE7lCvp;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7d38c6e4dedsi1026717585a.168.2025.06.11.11.37.37
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 11 Jun 2025 11:37:37 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=KrE7lCvp;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uPQE2-0002GK-PJ; Wed, 11 Jun 2025 14:31:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1uPQAm-0002n6-Ns
 for qemu-arm@nongnu.org; Wed, 11 Jun 2025 14:27:40 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1uPQAh-0001pA-CX
 for qemu-arm@nongnu.org; Wed, 11 Jun 2025 14:27:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1749666454;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FU8wL7XxDJ9uyH0nMB1l6aLZjdzSp7OBD7R4cqOfBZU=;
 b=KrE7lCvpX2L2UoLuD916efhPFn553DWSet4scXcnBguH4bJXy8zKV3gMAVWDoCF7gvHyph
 REy3O+uHELYySJGjNCxB/8LE/N+qsZvIQ0a7hgHas0+iy/oP008l2KHjXJ3ySCowAyEYGI
 Xp/LcPlmh7u5w+h8Yr/TeJ2B32c+tY0=
Received: from mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-626-BRevhgz1MY-FqReGZ6l7FQ-1; Wed,
 11 Jun 2025 14:27:30 -0400
X-MC-Unique: BRevhgz1MY-FqReGZ6l7FQ-1
X-Mimecast-MFC-AGG-ID: BRevhgz1MY-FqReGZ6l7FQ_1749666446
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 6243E195608B; Wed, 11 Jun 2025 18:27:26 +0000 (UTC)
Received: from localhost (unknown [10.2.16.122])
 by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id A198518002B5; Wed, 11 Jun 2025 18:27:25 +0000 (UTC)
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
Subject: [PULL 30/31] net/socket: skip automatic zero-init of large array
Date: Wed, 11 Jun 2025 14:25:32 -0400
Message-ID: <20250611182533.200590-31-stefanha@redhat.com>
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
X-TUID: Qs7tTbgH32U0

From: Daniel P. Berrangé <berrange@redhat.com>

The 'net_socket_send' method has a 68k byte array used for copying
data between guest and host. Skip the automatic zero-init of this
array to eliminate the performance overhead in the I/O hot path.

The 'buf1' array will be fully initialized when reading data off
the network socket.

Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
Reviewed-by: Klaus Jensen <k.jensen@samsung.com>
Reviewed-by: Harsh Prateek Bora <harshpb@linux.ibm.com>
Message-id: 20250610123709.835102-31-berrange@redhat.com
Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
---
 net/socket.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/net/socket.c b/net/socket.c
index 8e3702e1f3..784dda686f 100644
--- a/net/socket.c
+++ b/net/socket.c
@@ -157,7 +157,7 @@ static void net_socket_send(void *opaque)
     NetSocketState *s = opaque;
     int size;
     int ret;
-    uint8_t buf1[NET_BUFSIZE];
+    QEMU_UNINITIALIZED uint8_t buf1[NET_BUFSIZE];
     const uint8_t *buf;
 
     size = recv(s->fd, buf1, sizeof(buf1), 0);
-- 
2.49.0

