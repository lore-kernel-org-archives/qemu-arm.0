Received: by 2002:a17:505:ba85:b0:1be9:327d:8ee3 with SMTP id zs5csp2509837njc;
        Thu, 12 Jun 2025 10:50:54 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCU5rI5T+JiekiEipsJ7VkNvFXhdugNWQOlPn+ZreD11pJqmElI7lty95TM2YZ7dPwoBWFotDbnIE2f05Q==@linaro.org
X-Google-Smtp-Source: AGHT+IFY/gQQXtksoRu5r6IPIaSdI7wfSUpRXNE0bo/KqnzUm1O0DfAhek+WsJ2X1WRAmk/1ZMKq
X-Received: by 2002:a05:620a:404d:b0:7ce:f5c6:e48 with SMTP id af79cd13be357-7d3bc3e4449mr29461485a.21.1749750653949;
        Thu, 12 Jun 2025 10:50:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1749750653; cv=none;
        d=google.com; s=arc-20240605;
        b=MPI8nO+9L0dcnfoTY992arZd+tzekt6aT/ZRkSHczUoCGmMYvc5c0r4LEUYJ9y9BIc
         OVyAyW5S9vjikLXyLKWrAT8m96i3IR8rTS9ki38VqaaCefbV8UYSNO0zGGIrZOT6P3MZ
         en200W6MT6nCviN3rxjXwfQozUcH/r7fe9D4qW6ZT2YA5hq1vmkoIBvXgRr0ODrfs+TY
         fEGaPAEcp+SkrnGsjoAQ7mW1AbsCecfgJibBwv+CO400DX7suELORclSi7MGshLPPR1B
         +3DHUQ9HUEvhYc2BK7E0esZ3rsLpxL5mcXKyCx6p5a3sXp2ZrvtnpVjqKw7fn7O+ZPyI
         1+VA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=6bQecbjwc79DIm5WiLI4eZ/uPMXFoQbP4oqqiq3Lujc=;
        fh=nCo36o9gfWjbYkf8Rvtq02K03zSMECAaEugBysd/axg=;
        b=ebsGp0q3tDH5fMxNFOsC8sILfvm2sDPo7tHAHZfd78wFp0Qf4m1MtGEC+vRwHq8eTD
         mMGxHt9LUegL79hT5wUNlM5JZ3xHegoX3pOa3rOSqVH8tzMH7V06d0wmlgg8Qlxr13VR
         OqEzYqnYRr2sGbTMUKqZnprFCo0+Cjkq+J9UuqHPiyodpQhjITt+5a7T2t6J1+QQJw+N
         zjcqZmpu5s97xds03lB6KERnAUmgUDINs231LRYJR6YD44XQbtnQT8JwOVSStz04Y59p
         aU7u/6yoGLrAgO8//J0hlVa+1/vSHZiDZbnFkaMgnKYMzwdPEmDJY4K0XDcfZ0kDgOtL
         TmfA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=OO6GzQA6;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-4a72a2b8bffsi12765451cf.20.2025.06.12.10.50.53
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 12 Jun 2025 10:50:53 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=OO6GzQA6;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uPm3M-0008SF-AT; Thu, 12 Jun 2025 13:49:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1uPm3H-0008On-W8
 for qemu-arm@nongnu.org; Thu, 12 Jun 2025 13:49:24 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1uPm3F-0001Lv-BY
 for qemu-arm@nongnu.org; Thu, 12 Jun 2025 13:49:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1749750560;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6bQecbjwc79DIm5WiLI4eZ/uPMXFoQbP4oqqiq3Lujc=;
 b=OO6GzQA6Lf9CepJO7Rycd+bHdDFXgGwEEeT7B3fIN7v/lgNmljzOOe6O+LKEfQEv/pgoEL
 CKuolpYJLBjt9K5UZsn2HiI7OaUWn2HChcZZ2WAMTS46bCVCrij6GJDsRo33vTun+xaUaj
 HxJbMiH/h+OPo+bUkcQ6G1OO7UsxV8w=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-549-TrKyAINWPXWPRIaMqBuveQ-1; Thu,
 12 Jun 2025 13:49:16 -0400
X-MC-Unique: TrKyAINWPXWPRIaMqBuveQ-1
X-Mimecast-MFC-AGG-ID: TrKyAINWPXWPRIaMqBuveQ_1749750552
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 4EB1B1809C84; Thu, 12 Jun 2025 17:49:11 +0000 (UTC)
Received: from localhost (unknown [10.2.16.98])
 by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id E055D19560AF; Thu, 12 Jun 2025 17:49:07 +0000 (UTC)
From: Stefan Hajnoczi <stefanha@redhat.com>
To: qemu-devel@nongnu.org
Cc: "Michael S. Tsirkin" <mst@redhat.com>, qemu-ppc@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, Fam Zheng <fam@euphon.net>,
 Laurent Vivier <laurent@vivier.eu>, Hanna Reitz <hreitz@redhat.com>,
 Keith Busch <kbusch@kernel.org>, Steven Lee <steven_lee@aspeedtech.com>,
 qemu-arm@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>,
 qemu-block@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Harsh Prateek Bora <harshpb@linux.ibm.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?q?Fr=C3=A9d=C3=A9ric=20Barrat?= <fbarrat@linux.ibm.com>,
 Rob Herring <robh@kernel.org>, Dmitry Fleytman <dmitry.fleytman@gmail.com>,
 Jamin Lin <jamin_lin@aspeedtech.com>, qemu-s390x@nongnu.org,
 Gerd Hoffmann <kraxel@redhat.com>, Halil Pasic <pasic@linux.ibm.com>,
 Kevin Wolf <kwolf@redhat.com>, Jason Wang <jasowang@redhat.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Klaus Jensen <its@irrelevant.dk>, Jeuk Kim <jeuk20.kim@samsung.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Nicholas Piggin <npiggin@gmail.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Andrew Jeffery <andrew@codeconstruct.com.au>,
 Jesper Devantier <foss@defmacro.it>, qemu-trivial@nongnu.org,
 Sven Schnelle <svens@stackframe.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Troy Lee <leetroy@gmail.com>, Joel Stanley <joel@jms.id.au>,
 Thomas Huth <thuth@redhat.com>, Hannes Reinecke <hare@suse.com>,
 Alistair Francis <alistair@alistair23.me>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
Subject: [PULL v2 11/31] hw/audio/marvell_88w8618: skip automatic zero-init of
 large array
Date: Thu, 12 Jun 2025 13:48:55 -0400
Message-ID: <20250612174855.238493-2-stefanha@redhat.com>
In-Reply-To: <20250612174855.238493-1-stefanha@redhat.com>
References: <20250612174855.238493-1-stefanha@redhat.com>
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
X-TUID: oVkAaVLPRyJv

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
[Fixed hw/audio/gus in commit message --Stefan]
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

