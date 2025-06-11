Received: by 2002:a17:505:ba85:b0:1be9:327d:8ee3 with SMTP id zs5csp1999211njc;
        Wed, 11 Jun 2025 11:29:40 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVP42aOVcrd+v9811coOzIYTR/EIUVOYeh0pAB3agn0KHACpOwH7+i6/VuhF3b9KB+niHD/6mmh2qGE5A==@linaro.org
X-Google-Smtp-Source: AGHT+IGft9eP4Jfvju93BfgjDFxuG6yNhvF6EqXWTp9cEjRY60Do6mvgGHjOpQg0n0gQVtup+J6d
X-Received: by 2002:a0c:f097:0:20b0:6fb:f19:66f2 with SMTP id 6a1803df08f44-6fb34d276ffmr2134906d6.8.1749666569005;
        Wed, 11 Jun 2025 11:29:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1749666568; cv=none;
        d=google.com; s=arc-20240605;
        b=Jcs3Liv90Ih0LxX75XVGntkLO7XyE7atjVT3dQdpC0ZjnRIhQiEFBJf3YY2rPu3qxt
         HUZaSmJMtOL7xaenhXDfObeZToty36Dj3soDo02EkfdwJk9PzUbqIer/f5JU6xb2X5zM
         MmqxqnxMXN8U4Q2luxEsdwimzYvO4qgOU6qVwGivv78itdoQcrOLbn1J5ztI43Ywh6nE
         EN1QquwPOLOefz29gJRUV0QEGWnFYOdiJnhq+mtUMdIaMdj9Hi3dSsNE5FT3sa9BdQ5P
         8tMt4cUSHAaGENJZlxP3RFVhiDujcTl5iY4pktgXno0lqIhIv6PzDVsneWLkd2ecKd7A
         Wuaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=98MBMcUSEptGVNIPVLyiue7Ww+HKRSay/z2TDY8nvFw=;
        fh=loh9k9y3S2mImjFs3v08l0zZWu2zKrkh48k9P3fQXm8=;
        b=hJUYlRJNyLxTGOg5yIDKcE3KRV6zPLyn1lfV/8Wwp9fEz15c6CYwECOT6M5i8ICRoq
         LS1mlSYh6UEzvxgG3I0fDOxttpzeXrbOvnn9//RtEeYtFdMviAIpIdrTSpvsTerkFslb
         LtkdjOLUwVYRj+93FtuBYgOr8pMyrCxk7u4fUw/oat3Z+HB+7PXlPmEypLVPg13Yji20
         XPy+w9bhYKkT8oSiMYFjW6GqLQyInzBtpB4yJA1Es9/SaRuJ03bL/mAAFh/oWi+Ihoxn
         TFS0RFz/erIu97V2rEAtOzQ9m9QYSakwbCYG4rJSlZyGVzx0qYM1CGlrY0WsvCYPhCDY
         12Fg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=K5Y36Z+k;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6fb09ab07e9si135146716d6.21.2025.06.11.11.29.28
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 11 Jun 2025 11:29:28 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=K5Y36Z+k;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uPQBA-0003kK-Mc; Wed, 11 Jun 2025 14:28:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1uPQAJ-0001xg-Qu
 for qemu-arm@nongnu.org; Wed, 11 Jun 2025 14:27:13 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1uPQA8-0001Yt-QL
 for qemu-arm@nongnu.org; Wed, 11 Jun 2025 14:27:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1749666419;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=98MBMcUSEptGVNIPVLyiue7Ww+HKRSay/z2TDY8nvFw=;
 b=K5Y36Z+kKA9ZmXdd6Nf0Brv2n24yeViX+LjvI+N25hroy9J39t3oYxysJ5RqPVBV7WOqS2
 /2CaEaMlXrlbyfFrjMODjrv11hQhYyT8rEOGjfFSHN/sC4QyxY+PVn4TodmrnRFCn2weT+
 x7nchSzue77RLHju52nx2Ahi/peCAXQ=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-317-AELjrSb9N5yl-IVITRhf6w-1; Wed,
 11 Jun 2025 14:26:56 -0400
X-MC-Unique: AELjrSb9N5yl-IVITRhf6w-1
X-Mimecast-MFC-AGG-ID: AELjrSb9N5yl-IVITRhf6w_1749666412
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 76D7C18089B5; Wed, 11 Jun 2025 18:26:51 +0000 (UTC)
Received: from localhost (unknown [10.2.16.122])
 by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id B00EF19560AF; Wed, 11 Jun 2025 18:26:49 +0000 (UTC)
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
Subject: [PULL 17/31] hw/hyperv/syndbg: skip automatic zero-init of large array
Date: Wed, 11 Jun 2025 14:25:19 -0400
Message-ID: <20250611182533.200590-18-stefanha@redhat.com>
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
X-TUID: NQRDfVbVP/ou

From: Daniel P. Berrangé <berrange@redhat.com>

The 'handle_recv_msg' method has a 4k byte array used for copying
data between the network socket and guest memory. Skip the automatic
zero-init of this array to eliminate the performance overhead in the
I/O hot path.

The 'data_buf' array will be fully initialized when data is read
off the network socket.

Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
Message-id: 20250610123709.835102-18-berrange@redhat.com
Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
---
 hw/hyperv/syndbg.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/hyperv/syndbg.c b/hw/hyperv/syndbg.c
index 8b8a14750d..ac7e15f6f1 100644
--- a/hw/hyperv/syndbg.c
+++ b/hw/hyperv/syndbg.c
@@ -192,7 +192,7 @@ static uint16_t handle_recv_msg(HvSynDbg *syndbg, uint64_t outgpa,
 {
     uint16_t ret;
     g_assert(MSG_BUFSZ >= qemu_target_page_size());
-    uint8_t data_buf[MSG_BUFSZ];
+    QEMU_UNINITIALIZED uint8_t data_buf[MSG_BUFSZ];
     hwaddr out_len;
     void *out_data;
     ssize_t recv_byte_count;
-- 
2.49.0

