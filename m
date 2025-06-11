Received: by 2002:a17:505:ba85:b0:1be9:327d:8ee3 with SMTP id zs5csp2003632njc;
        Wed, 11 Jun 2025 11:37:37 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVeyZn9cMFnLOEMlTihKb1px8NIZD1loo5uiZy8eCAd9GT7HXVxIYSWSf1y06MaqlYgBXAqSJrGZz4+Tw==@linaro.org
X-Google-Smtp-Source: AGHT+IGAtMidiW4L/wBoi0IOndZYMbN4jJWlFTFqpEHdD/faitQmTd432DyTsU/slPpMTSY1Fux5
X-Received: by 2002:a05:622a:5587:b0:494:ad3f:cb7e with SMTP id d75a77b69052e-4a713c66bb9mr93835091cf.50.1749667057634;
        Wed, 11 Jun 2025 11:37:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1749667057; cv=none;
        d=google.com; s=arc-20240605;
        b=AuFTxDLZIzkg/K7dDT8ha+3w+hr8oL2kJWYv7n5Cy8h8p1nr5Z9GXapG6ZbxQqKlhr
         CvoyzEFWRgqVEv/349KeLi9VSEYX98+rhhhaXOlS/LJhZBoQkglh12MnNq4Oz2qX6O3Z
         Q8RkMIPLngHd1HQnr0MXg/FQqwPEloBlFIMEv3b3EuuYFWsSPhQQDkZXRWPAYGd6UxU2
         LlPpEfNlbGGKIFiq/yzeuxNmHd9xTN/TKwoIzDREzJiCx64Hlvc1R3pX107hf3UuoQCR
         38n6I4eu9GpugeF9nl9UdoPUVCwLQ3i0S4k1m8XbP06QGOtiICW1PpIzjfCL3Ibc1Rw7
         G96Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=TKCERI53LuMk8TuYkm/wkoeKkMg0tToLNccvF0Tm5YY=;
        fh=llWsnZZ16TEYjnayUds9QVVisxba1LyOA7TWHTWVEKk=;
        b=FDsbTCV3jSrZkl30AY5+i3Ph7TmA+ILK3cQfHulwJcM5DNl8M3Wd/asE9zvmNz8k/i
         Q5+r5nJqN21XV3j09MewfTcJTyoqNYYftAm4F4pxxZEbx7plCZ1tA4Tp0aJyFDrPHWEh
         aq0j3Y742ZGoUQb8lRd+19Z3RXR56NTF7YRAOI4ddDdT31yRvR4MB7ldSdkfOeEeXkJi
         B9vMCrvfnkdSG3AOa19lFzIuZbGaJyFKxa1bNNh/4TQZuL7iv+166fLMfck1qSboVn54
         Yz0qgbRHGixEQhThNNqowftFG4s5pynddob7EObxayf/Mtf9Z7tDU7Cs29NBlL/DiGh+
         3g4Q==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=C8esRktA;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-4a611169d9fsi142866321cf.76.2025.06.11.11.37.37
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 11 Jun 2025 11:37:37 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=C8esRktA;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uPQGo-00070g-08; Wed, 11 Jun 2025 14:33:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1uPQAl-0002k8-PX
 for qemu-arm@nongnu.org; Wed, 11 Jun 2025 14:27:39 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1uPQAe-0001nG-GY
 for qemu-arm@nongnu.org; Wed, 11 Jun 2025 14:27:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1749666450;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=TKCERI53LuMk8TuYkm/wkoeKkMg0tToLNccvF0Tm5YY=;
 b=C8esRktAMQKMNPuyriTOYrszmGCtyTRqtHKoOiqgXLKa8ws2hfT93dEuJ+m4Co5dj+SvJp
 cIIOTV1pXH690iaNR0grRqrYNbOXFOiCgDC29Ty2lB26GUvhg0+9zjHxw90sVfwlYxWLZt
 W1DJBeDwH63Ly4mzLbuxOn+Em7eNIOo=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-135-GFsYugu_M6SpL27G8L--Yw-1; Wed,
 11 Jun 2025 14:27:28 -0400
X-MC-Unique: GFsYugu_M6SpL27G8L--Yw-1
X-Mimecast-MFC-AGG-ID: GFsYugu_M6SpL27G8L--Yw_1749666444
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 49F531809C82; Wed, 11 Jun 2025 18:27:24 +0000 (UTC)
Received: from localhost (unknown [10.2.16.122])
 by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 65B6618002B6; Wed, 11 Jun 2025 18:27:23 +0000 (UTC)
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
Subject: [PULL 29/31] hw/ufs/lu: skip automatic zero-init of large array
Date: Wed, 11 Jun 2025 14:25:31 -0400
Message-ID: <20250611182533.200590-30-stefanha@redhat.com>
In-Reply-To: <20250611182533.200590-1-stefanha@redhat.com>
References: <20250611182533.200590-1-stefanha@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111
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
X-TUID: 6Wlp7j/nrT0O

From: Daniel P. Berrangé <berrange@redhat.com>

The 'ufs_emulate_scsi_cmd' method has a 4k byte array used for
copying data from the device. Skip the automatic zero-init of
this array to eliminate the performance overhead in the I/O hot
path.

The 'outbuf' array will be fully initialized when data is copied
from the guest.

Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
Reviewed-by: Klaus Jensen <k.jensen@samsung.com>
Reviewed-by: Harsh Prateek Bora <harshpb@linux.ibm.com>
Message-id: 20250610123709.835102-30-berrange@redhat.com
Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
---
 hw/ufs/lu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/ufs/lu.c b/hw/ufs/lu.c
index 57b307ea56..2d8ffd72c5 100644
--- a/hw/ufs/lu.c
+++ b/hw/ufs/lu.c
@@ -194,7 +194,7 @@ static int ufs_emulate_wlun_inquiry(UfsRequest *req, uint8_t *outbuf,
 static UfsReqResult ufs_emulate_scsi_cmd(UfsLu *lu, UfsRequest *req)
 {
     uint8_t lun = lu->lun;
-    uint8_t outbuf[4096];
+    QEMU_UNINITIALIZED uint8_t outbuf[4096];
     uint8_t sense_buf[UFS_SENSE_SIZE];
     uint8_t scsi_status;
     int len = 0;
-- 
2.49.0

