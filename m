Received: by 2002:a17:505:ba85:b0:1be9:327d:8ee3 with SMTP id zs5csp2001175njc;
        Wed, 11 Jun 2025 11:33:03 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWzn6ITVQFYGSiSPYh340P5m32WG9n2xuddGUUfFyQcyN3nL2Y629KcVR/OqLXZc2HGiCvSIbReDBuejA==@linaro.org
X-Google-Smtp-Source: AGHT+IFmRZfZVZ+muy8QOQEEF08zXIGGkllytk0864bZoqKOF2Z2L7dqeVxd3EN/EzGnYccbSzPL
X-Received: by 2002:a05:6214:21c8:b0:6fa:c2a4:f806 with SMTP id 6a1803df08f44-6fb34662523mr8717106d6.29.1749666783753;
        Wed, 11 Jun 2025 11:33:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1749666783; cv=none;
        d=google.com; s=arc-20240605;
        b=VxNjUXBgxc+lNGr5g3KE2L7yxiXnJCec5AwsLtbat1N5SV0S/y65Fz2jI3CWVLxGpt
         xd2fmsRDuHFDj1kmpe/2ZqJJELGtdNV2YBJZ/EIC0fFniudMwhcHttbaSGPhQTmoQEzd
         wHTLzso7YXN82ndCcL60g8HxO313xNBbuYyxpBY4hnsd5uY0Q/kUkTg4LA+trZhcV+gq
         qmzFlZbXaPIjV6fLFzTtrgAaX+bHP3YsbOFtBUZcI99ULOEvuoknHTw38aeyKMjP1K4s
         5UCwOW+n0ZmiIwsQBkQYWxq8fVK6L3pDFCy4PFigNVBvnHyqxibZoyZMW0qZiTdZw9UM
         5ksg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=GkQJxxqIb7abXJVfUSauncS5q94lB96LQMTClKO0AaU=;
        fh=llWsnZZ16TEYjnayUds9QVVisxba1LyOA7TWHTWVEKk=;
        b=Dmsvs2AMj09pycJJLsbDarPJ0KhHAYypUfdP72hSob1Q4dLjFueo6WyWMeQ/jxfzTz
         REqoZF86HJCQupwopR8E86KI8bMK+q2f3NoH4jEaXurXKpYgYj4Ow9V5VgVnBjK5v8lC
         35KoGFiW0mHfP+k++J7DtD6u+or1o7elD+e3Jiwo7DXygruDpRQUAm92CwwDCmoCDouM
         K0GOwNHcwh4zmvbPlSmEUvtuZfpSMCiW1rSA5EpqQ8qx/ejv+YBqDNzqOQlWdhREF4q7
         51cOaX9JYgqCI4tVBGVq4dlGEetAMMbOXn+cZXn0IDywWCaPpq4XELAVIyi0D3Zb2Oki
         10/g==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=D2jZHHVk;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6fb09b265d7si133010816d6.282.2025.06.11.11.33.03
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 11 Jun 2025 11:33:03 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=D2jZHHVk;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uPQEz-0003UD-5b; Wed, 11 Jun 2025 14:32:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1uPQAg-0002Wg-Mr
 for qemu-arm@nongnu.org; Wed, 11 Jun 2025 14:27:35 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1uPQAa-0001kj-5K
 for qemu-arm@nongnu.org; Wed, 11 Jun 2025 14:27:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1749666446;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GkQJxxqIb7abXJVfUSauncS5q94lB96LQMTClKO0AaU=;
 b=D2jZHHVkUCiB33fqAyN4E1xVqCS1MYUBL15E5Ccle/Mtx6lmRpbUrqmjbOzxTCLrorNhBY
 bKhBjYrMSP6bBdxUesChquz5wbcVBOvcdnnhLgZB0zqH2yfCKlIN50jIjuHfVccvfapINj
 cyrClK4ISPcIeo3DJu8KUeW5jv74Rkc=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-617-EuRogx8FOqqC9-X06jtGCw-1; Wed,
 11 Jun 2025 14:27:23 -0400
X-MC-Unique: EuRogx8FOqqC9-X06jtGCw-1
X-Mimecast-MFC-AGG-ID: EuRogx8FOqqC9-X06jtGCw_1749666439
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id E92BA1955F4A; Wed, 11 Jun 2025 18:27:18 +0000 (UTC)
Received: from localhost (unknown [10.2.16.122])
 by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 2781818002B7; Wed, 11 Jun 2025 18:27:17 +0000 (UTC)
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
Subject: [PULL 27/31] hw/scsi/lsi53c895a: skip automatic zero-init of large
 array
Date: Wed, 11 Jun 2025 14:25:29 -0400
Message-ID: <20250611182533.200590-28-stefanha@redhat.com>
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
X-TUID: 3cpq5EEtCrnY

From: Daniel P. Berrangé <berrange@redhat.com>

The 'lsi_memcpy' method has a 4k byte array used for copying data
to/from the device. Skip the automatic zero-init of this array to
eliminate the performance overhead in the I/O hot path.

The 'buf' array will be fully initialized when data is copied.

Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
Reviewed-by: Klaus Jensen <k.jensen@samsung.com>
Reviewed-by: Harsh Prateek Bora <harshpb@linux.ibm.com>
Message-id: 20250610123709.835102-28-berrange@redhat.com
Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
---
 hw/scsi/lsi53c895a.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/scsi/lsi53c895a.c b/hw/scsi/lsi53c895a.c
index f4f2ef321e..9ea4aa0a85 100644
--- a/hw/scsi/lsi53c895a.c
+++ b/hw/scsi/lsi53c895a.c
@@ -1112,7 +1112,7 @@ bad:
 static void lsi_memcpy(LSIState *s, uint32_t dest, uint32_t src, int count)
 {
     int n;
-    uint8_t buf[LSI_BUF_SIZE];
+    QEMU_UNINITIALIZED uint8_t buf[LSI_BUF_SIZE];
 
     trace_lsi_memcpy(dest, src, count);
     while (count) {
-- 
2.49.0

