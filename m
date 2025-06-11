Received: by 2002:a17:505:ba85:b0:1be9:327d:8ee3 with SMTP id zs5csp1998853njc;
        Wed, 11 Jun 2025 11:29:00 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCW1S24MxpM99UyBY0cVZbGeN1kXfWv2TF48WEcdH1oZaKAUxUW20/yeCMd7Ggr2pYPiDc16+H06vU+A2Q==@linaro.org
X-Google-Smtp-Source: AGHT+IFAHS7/PJHVAfHxRpSWoVsqZZ9UAmrVlZ9JxRRJklJMj/bAwHmg6VwObvR/Sf1h86pVM/u8
X-Received: by 2002:a05:622a:1927:b0:4a4:2f0b:d2dc with SMTP id d75a77b69052e-4a713b9be18mr85322571cf.20.1749666539779;
        Wed, 11 Jun 2025 11:28:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1749666539; cv=none;
        d=google.com; s=arc-20240605;
        b=JL+888iz+aE254aeSeDRuP2cvfMHKGkfQcT/pu0kIX/8OSvHS/F8wArJ5t/RRD41CA
         4x8cEAE85vOatH/fBl7YbjCfCYrIQFIUQb+ag16CbvZJrGDMNYoppG67m7cXtD05+H2L
         veAUsjlVy+LQPp49uXc9EZxl1P9dBtLdkp95lwrgDQuLU+1zg7vY0UQZCyTgGHIWIlHF
         NOPACc+cWU3S5ZfzylNthAL8oRn+ojx1I1zWcntvuoO2pzalUfwL7WE0iF92AAF8qxpm
         uhc+0f6NQ9/zgYXC9lsqnrwRwXrHcsG680NCgk8BZqx6RY4W4TidiBathmfVXJ0wyfCg
         ujTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=Go5IXU3Pe7Z7a1UScspRgPi+WTDoYjIknceMmADHQN8=;
        fh=loh9k9y3S2mImjFs3v08l0zZWu2zKrkh48k9P3fQXm8=;
        b=QctBNQFn4gb5x/HSnehFxRYLc+ZAs2sCZ7kIXy7/Js2WFTm9ev173aB9KJwvbPeVqU
         /7aN6I2SJxn4yCs5luhx3dDT7tiaelRs1EYf8eVYNNMDCQRMgveysR6Y/UN5IIPy7lPX
         fzZVdfc5oXhnClQePr74DtRLh3b0wcEW+W/lB+E+4b2+yrHCBSmdDun77HyyNFPUAhii
         XHpn+Jyr3e3mXpL18DQNDgVTtbeCsiqUGmyghcWsfdNs3W7tSHOX7tklHv8Z6esfK5nn
         4tZuWk7wnZopho9uVYre9JYH1Gs2NEx/YNEfvrAoK+zTfP2xrPOACj3aPwqWBvl8ai9H
         Ha3w==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Tee0qh2d;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-4a6198a6c57si127940541cf.453.2025.06.11.11.28.59
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 11 Jun 2025 11:28:59 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Tee0qh2d;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uPQBI-0004Lo-GY; Wed, 11 Jun 2025 14:28:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1uPQA1-0001o4-3K
 for qemu-arm@nongnu.org; Wed, 11 Jun 2025 14:26:53 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1uPQ9q-0001QE-7m
 for qemu-arm@nongnu.org; Wed, 11 Jun 2025 14:26:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1749666401;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Go5IXU3Pe7Z7a1UScspRgPi+WTDoYjIknceMmADHQN8=;
 b=Tee0qh2dckKpKdJxS0kTqrRBR3+g3Kl72vu2MptOvY6Tm0e8llDX/O656MNX9sSDnw5/QS
 7eNj62NkzT+vTJ6zDAJSoDxma0zMcGobyKs0R65u7i52gJN0kfLfEkEARtdpS2+xJ6b2T/
 xYeLq0j1aOcnd7Khvk/z6Q6mYyvgP3w=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-617-KxM9LR3LM2Ok0FmXGII5KQ-1; Wed,
 11 Jun 2025 14:26:37 -0400
X-MC-Unique: KxM9LR3LM2Ok0FmXGII5KQ-1
X-Mimecast-MFC-AGG-ID: KxM9LR3LM2Ok0FmXGII5KQ_1749666393
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 3FB7A180029D; Wed, 11 Jun 2025 18:26:33 +0000 (UTC)
Received: from localhost (unknown [10.2.16.122])
 by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 34D2019560A3; Wed, 11 Jun 2025 18:26:32 +0000 (UTC)
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
Subject: [PULL 11/31] hw/audio/gus: skip automatic zero-init of large array
Date: Wed, 11 Jun 2025 14:25:13 -0400
Message-ID: <20250611182533.200590-12-stefanha@redhat.com>
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
X-TUID: 0bnf8Ri1z5vy

From: Daniel P. Berrangé <berrange@redhat.com>

The 'mv88w8618_audio_callback' method has a 4k byte array used for
copying data between the audio backend and device. Skip the automatic
zero-init of this array to eliminate the performance overhead in
the I/O hot path.

The 'buf' array will be fully initialized when reading data from
device memory.

Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
Message-id: 20250610123709.835102-12-berrange@redhat.com
Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
---
 hw/audio/marvell_88w8618.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/audio/marvell_88w8618.c b/hw/audio/marvell_88w8618.c
index 6d3ebbb0c8..c5c79d083a 100644
--- a/hw/audio/marvell_88w8618.c
+++ b/hw/audio/marvell_88w8618.c
@@ -66,7 +66,7 @@ static void mv88w8618_audio_callback(void *opaque, int free_out, int free_in)
 {
     mv88w8618_audio_state *s = opaque;
     int16_t *codec_buffer;
-    int8_t buf[4096];
+    QEMU_UNINITIALIZED int8_t buf[4096];
     int8_t *mem_buffer;
     int pos, block_size;
 
-- 
2.49.0

