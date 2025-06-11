Received: by 2002:a17:505:ba85:b0:1be9:327d:8ee3 with SMTP id zs5csp2000515njc;
        Wed, 11 Jun 2025 11:31:54 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVPwwT/e0l3s9WneJ8ZVXFUF4PlQTFkfeKTh0HzmY7aa1cBT+wcePaFxirDWrhx3Kf3OySduymbe/LgoA==@linaro.org
X-Google-Smtp-Source: AGHT+IFixrutzAlX/fDF+cSlB5wh8SZD7UWg5TOcdWmjx2Xvcux2l1uK+bMk96R4FjloErJX9qMK
X-Received: by 2002:a05:622a:2b46:b0:4a6:cee6:9743 with SMTP id d75a77b69052e-4a7229200b5mr12115021cf.5.1749666714308;
        Wed, 11 Jun 2025 11:31:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1749666714; cv=none;
        d=google.com; s=arc-20240605;
        b=IEOdDl3CjPKN1KYn8rElGtLwL4DEKYX261MZViyr9IW8dPlFmdPGb3LLfghyysGRU1
         I7BWsIe7rNeddnIhl4htBLuTw4DHRZQpu/HECckVqir+KO5BrlZ8t8z0QW7yn5rXeUaM
         jRwbWYDbb2SYc5KXjwcEADzDnL7k5377f9Fibeug1lNBoeHeNWIuakr+DmW0OTGIF2WU
         EFiDbsOo7i5Licn1vKgwHBFUCObFKSoDTVf5NpO7svpMJ4E8kGEubacfgyvFJJ1C1en7
         bojHdnrYajX/4SZq3XAoGtK2HZ2wctf1qAyTFR2by+y78IVzCF1gsA7Mjwq0kWnXC+eP
         jp7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=UpwIHbzvu7jlclXB/9FN3lLirxVS/6Y80YtOZqhOwSU=;
        fh=loh9k9y3S2mImjFs3v08l0zZWu2zKrkh48k9P3fQXm8=;
        b=Y6QLdoguEA+T0N9zdLqiJnJw26XesIiS7sNk5Otue9/L0Z4h4mpO8MbGiRiv5DT+Du
         Y9Uov43D6shJZWOY/0KEkUQKHFLvm7K/FxNJfHVxfeD071uktNOb/Fvba4h81bjrstcS
         fX8L6HKd6PDBcWjAF0Ohz8xHyZiTQsjdrKFIzsv/ejruYctHiX6xTXCLwp07bDLFyzDU
         /nXXorBhgo6PWu7P9QEe2d3DrN6o7+FeoKwmuEYVQCDSY8DBZVJO2JDDj82E4/E5NQx3
         mgGIQtTgqxnuKcdfOoRnAKDfloHDBUP7I+adomUB4XeWXnWr6yVsnmPvBmRMWN+x7Pzb
         RCDg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=iTk+qMT6;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-4a6198c96edsi132025671cf.580.2025.06.11.11.31.54
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 11 Jun 2025 11:31:54 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=iTk+qMT6;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1uPQBE-0003zb-F0; Wed, 11 Jun 2025 14:28:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1uPQA1-0001o6-4T
 for qemu-devel@nongnu.org; Wed, 11 Jun 2025 14:26:53 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1uPQ9s-0001Rj-Sq
 for qemu-devel@nongnu.org; Wed, 11 Jun 2025 14:26:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1749666404;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UpwIHbzvu7jlclXB/9FN3lLirxVS/6Y80YtOZqhOwSU=;
 b=iTk+qMT6Q1PvdPkAkjlznBcmDGhPt0byiXNbP+PzbJkFQ3iL2jRsya3D6wmCHkfsN0TbZ3
 NOcE7naJpx++Pnl9niRyloP7iTPZDNg5OPpDEt81akcp/S9E5vz+pog+PVD3738n07ovTH
 VZYqzSI0g5gTclGYMNU/zCoERUnwFnU=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-21-SdR7kE7NN5KcDoOsCTUOhg-1; Wed,
 11 Jun 2025 14:26:39 -0400
X-MC-Unique: SdR7kE7NN5KcDoOsCTUOhg-1
X-Mimecast-MFC-AGG-ID: SdR7kE7NN5KcDoOsCTUOhg_1749666396
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 1F42E18089B6; Wed, 11 Jun 2025 18:26:36 +0000 (UTC)
Received: from localhost (unknown [10.2.16.122])
 by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 8E0A230002C3; Wed, 11 Jun 2025 18:26:34 +0000 (UTC)
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
Subject: [PULL 12/31] hw/audio/sb16: skip automatic zero-init of large array
Date: Wed, 11 Jun 2025 14:25:14 -0400
Message-ID: <20250611182533.200590-13-stefanha@redhat.com>
In-Reply-To: <20250611182533.200590-1-stefanha@redhat.com>
References: <20250611182533.200590-1-stefanha@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4
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
X-TUID: rx4zYoZRJaL2

From: Daniel P. Berrangé <berrange@redhat.com>

The 'write_audio' method has a 4k byte array used for copying data
between the audio backend and device. Skip the automatic zero-init
of this array to eliminate the performance overhead in the I/O hot
path.

The 'tmpbuf' array will be fully initialized when reading data from
device memory.

Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
Message-id: 20250610123709.835102-13-berrange@redhat.com
Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
---
 hw/audio/sb16.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/audio/sb16.c b/hw/audio/sb16.c
index 19fd3b9020..bac64118fe 100644
--- a/hw/audio/sb16.c
+++ b/hw/audio/sb16.c
@@ -1181,7 +1181,7 @@ static int write_audio (SB16State *s, int nchan, int dma_pos,
     IsaDma *isa_dma = nchan == s->dma ? s->isa_dma : s->isa_hdma;
     IsaDmaClass *k = ISADMA_GET_CLASS(isa_dma);
     int temp, net;
-    uint8_t tmpbuf[4096];
+    QEMU_UNINITIALIZED uint8_t tmpbuf[4096];
 
     temp = len;
     net = 0;
-- 
2.49.0

