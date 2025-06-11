Received: by 2002:a17:505:ba85:b0:1be9:327d:8ee3 with SMTP id zs5csp2000050njc;
        Wed, 11 Jun 2025 11:31:02 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVjuhxjLeX7p8Q+jBaK0wG21FrwFkxJehCrkYPMzY+1L2Ic8tGQXzvlTPjgNFwrnIZ4sEiQn26K2MISxA==@linaro.org
X-Google-Smtp-Source: AGHT+IGGD4GHVJOIUbE6PUJdusyGy5ZZlthRoPj9MYbxdYK/VbIQPa95G8pertS611djgzjha2n9
X-Received: by 2002:a05:620a:240e:b0:7c7:a614:7214 with SMTP id af79cd13be357-7d3b35c88e5mr30707485a.5.1749666662197;
        Wed, 11 Jun 2025 11:31:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1749666662; cv=none;
        d=google.com; s=arc-20240605;
        b=KEOLxTCKAjuQpKWKgc6iEAKBaet7gIXTPbLvm0nvu39VZdE36F6skt+G+Qr1dWcc9+
         xPPC6+J41LLcbMwgrBmIMNZyZmEhEkiOmf1JHz3xvFxPoe80Q9HLGeYNHNy/QozfqX65
         /YGcYm/v8uliGhT8nnkwHR7EHJ7I6Tv+UnMPTjTosSIDXQiImYDMr8TSrhZKfvkxgQoa
         gnYtqLGh5LA9lQCKSV/eDIQL07pcUpDgi5pvo8RJLZllmK07xH2wqc2wVVrvCR57UsZ6
         0joFN7AHGznj1BBHkrkoSYrIaMgRYSJPBsbgXkpfW9pZ5SwROcOxSfLB9buMQ4WQ0R4i
         TuiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=e+4l0naTET+aaMWzQ/pVz9X7Jz1w04ke4T2Xq1wrDPY=;
        fh=llWsnZZ16TEYjnayUds9QVVisxba1LyOA7TWHTWVEKk=;
        b=fmXOgOwhhMKLR62Zc1fkbECKUebDwN5T2EMAHZ6t1C06amJn2gcUrRSDUas+d7SdCJ
         RuzqSh49dg98N/9f1YBkJiX/Hfj1QvzZTz2cQg4cQgf+4HEUBtUOBIVvNwDnB9APXKtH
         eJ0i6StmicnWoShlVCD9Cj2OxhZQsQSAbzczkU48ZQ48/o8ZrRwJ07kDrERgAkFY+TYN
         QePLviBa/Watn/SdWbkme7Hhz19XC0nKze0G/WKGV6IN5BzNtZjj+4teR5vMXd5/T4N2
         kAzJR6R/mZywxcPLGyxGN9R4pHOdwhQ70ENpYGQ5gJCT107hY80KpVXAnFjs6Zic0vNe
         LN+g==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="Tu/GLJAI";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7d25a5f8fb4si1313041185a.184.2025.06.11.11.31.02
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 11 Jun 2025 11:31:02 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="Tu/GLJAI";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uPQDw-0001q0-IC; Wed, 11 Jun 2025 14:30:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1uPQAa-0002Cs-G4
 for qemu-arm@nongnu.org; Wed, 11 Jun 2025 14:27:30 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1uPQAW-0001h9-Fz
 for qemu-arm@nongnu.org; Wed, 11 Jun 2025 14:27:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1749666439;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=e+4l0naTET+aaMWzQ/pVz9X7Jz1w04ke4T2Xq1wrDPY=;
 b=Tu/GLJAIJjcl7717MuVmuDTnagY1nhQFi/LykxluBxA6oL+dJNeTz9gtvuRre3XoPmmVQ5
 2UaRwDPY5YZe2PQVznayJjbvsEQZlMTjRWCMCj22HQwnU1rAeV3s+6fIMyfDYFl2Aca//U
 azHC5SEkmz/cUCDz+/jSNP1mV01+vOM=
Received: from mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-78-yx9W_04IMmyJ0cqeGcc-ow-1; Wed,
 11 Jun 2025 14:27:13 -0400
X-MC-Unique: yx9W_04IMmyJ0cqeGcc-ow-1
X-Mimecast-MFC-AGG-ID: yx9W_04IMmyJ0cqeGcc-ow_1749666428
Received: from mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.15])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 770501955F69; Wed, 11 Jun 2025 18:27:08 +0000 (UTC)
Received: from localhost (unknown [10.2.16.122])
 by mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 4DB291956087; Wed, 11 Jun 2025 18:27:06 +0000 (UTC)
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
Subject: [PULL 23/31] hw/nvme/ctrl: skip automatic zero-init of large arrays
Date: Wed, 11 Jun 2025 14:25:25 -0400
Message-ID: <20250611182533.200590-24-stefanha@redhat.com>
In-Reply-To: <20250611182533.200590-1-stefanha@redhat.com>
References: <20250611182533.200590-1-stefanha@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.15
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
X-TUID: aWmeejemZzl5

From: Daniel P. Berrangé <berrange@redhat.com>

The 'nvme_map_sgl' method has a 256 element array used for copying
data from the device. Skip the automatic zero-init of this array
to eliminate the performance overhead in the I/O hot path.

The 'segment' array will be fully initialized when reading data from
the device.

The 'nme_changed_nslist' method has a 4k byte array that is manually
initialized with memset(). The compiler ought to be intelligent
enough to turn the memset() into a static initialization operation,
and thus not duplicate the automatic zero-init. Replacing memset()
with '{}' makes it unambiguous that the array is statically initialized.

Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
Reviewed-by: Klaus Jensen <k.jensen@samsung.com>
Message-id: 20250610123709.835102-24-berrange@redhat.com
Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
---
 hw/nvme/ctrl.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/hw/nvme/ctrl.c b/hw/nvme/ctrl.c
index fd935507bc..220002830d 100644
--- a/hw/nvme/ctrl.c
+++ b/hw/nvme/ctrl.c
@@ -1057,7 +1057,8 @@ static uint16_t nvme_map_sgl(NvmeCtrl *n, NvmeSg *sg, NvmeSglDescriptor sgl,
      */
 #define SEG_CHUNK_SIZE 256
 
-    NvmeSglDescriptor segment[SEG_CHUNK_SIZE], *sgld, *last_sgld;
+    QEMU_UNINITIALIZED NvmeSglDescriptor segment[SEG_CHUNK_SIZE];
+    NvmeSglDescriptor *sgld, *last_sgld;
     uint64_t nsgld;
     uint32_t seg_len;
     uint16_t status;
@@ -5128,7 +5129,7 @@ static uint16_t nvme_error_info(NvmeCtrl *n, uint8_t rae, uint32_t buf_len,
 static uint16_t nvme_changed_nslist(NvmeCtrl *n, uint8_t rae, uint32_t buf_len,
                                     uint64_t off, NvmeRequest *req)
 {
-    uint32_t nslist[1024];
+    uint32_t nslist[1024] = {};
     uint32_t trans_len;
     int i = 0;
     uint32_t nsid;
@@ -5138,7 +5139,6 @@ static uint16_t nvme_changed_nslist(NvmeCtrl *n, uint8_t rae, uint32_t buf_len,
         return NVME_INVALID_FIELD | NVME_DNR;
     }
 
-    memset(nslist, 0x0, sizeof(nslist));
     trans_len = MIN(sizeof(nslist) - off, buf_len);
 
     while ((nsid = find_first_bit(n->changed_nsids, NVME_CHANGED_NSID_SIZE)) !=
-- 
2.49.0

