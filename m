Received: by 2002:a17:906:cf90:b0:9bd:85f7:2662 with SMTP id um16csp803453ejb;
        Thu, 19 Oct 2023 14:26:45 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHYu/cCTGcNaqjske/S1fWf5/VMFnwDOBCWxWnqg8xK/PdfV1rXtI8UXs90fOpyzLoOpopD
X-Received: by 2002:ac8:7f54:0:b0:419:52a9:9ffb with SMTP id g20-20020ac87f54000000b0041952a99ffbmr3878718qtk.20.1697750805147;
        Thu, 19 Oct 2023 14:26:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1697750805; cv=none;
        d=google.com; s=arc-20160816;
        b=kAeEYBlOvImxNq6VBQz9uqKOnsnEJ9wS6znBG5elQAiIP4V7neYRTXzKYVdNLHLsvc
         zrn1edZ4LSHD2NL7HjN9caGqwO0GV7i2PQr/6x84h2BKEj5o/GgWIdfMgqHpS/TDqFI7
         3i6Fgt/90317m8YU8ekn+1dScLe/Zh5Tm8qo0VUExsZ/LhQcAv6+R1Nd6jiICYylGHkR
         8Stsrv1M6OAQiD+WdssKGc4QzN/rXRXNNiaZpA2mcSmJZP1ym3zcD/VnPevC/ZImSVN3
         ogKFbkf3FnuwEr5yJRlZrGW5fG0qDbwUF9ejN+eTuatUlsyE7SNQOQ8FSIWF5kjm8Yy+
         JG3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=uPCUA2oPZ2wdqytvwya118q0tpbF9WOJR99LmJrLuIo=;
        fh=6LDSn8tOctq2kJKzBiR4RrCDKZ5BeHk+sXTCVi8lj2U=;
        b=JOwI0SwSQm8vsjRDJs8WISf6qRz0xcb9eZHRyXyLotVZQHn/+kzejzKOS7B4euA4hX
         wsIJieF6wpFvH5QIi2PNJGmWdYP1w+A8mDVDOuRkiU0N/YaZlpz4ySMFKVhnENzL6WOc
         8+ln8tcrE9PzjrLs34jo4exwcUUcbzUmDlGvsGHNduEWHjicwHWNSy5JNsizdcFD2FYD
         OKtgt1/Om2eJUxSbHieXQsTKRAivZ06timUvux4iTMIvMOTGeMlcr2N0j2yKPIr98git
         uvaCAcK/TnrcITHxT0c28Pil+VepA/PequENY9/NKCDpe0UhhCRxhpl3AXQKuXETi2VP
         RHZQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=JP4C1oN+;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c17-20020a05622a025100b0041978cbdcc3si277608qtx.498.2023.10.19.14.26.45
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 19 Oct 2023 14:26:45 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=JP4C1oN+;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1qtaU2-0006mQ-UB; Thu, 19 Oct 2023 17:23:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qtaTz-0006UK-Qw
 for qemu-devel@nongnu.org; Thu, 19 Oct 2023 17:23:07 -0400
Received: from mail-lj1-x234.google.com ([2a00:1450:4864:20::234])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qtaTx-0001eK-V5
 for qemu-devel@nongnu.org; Thu, 19 Oct 2023 17:23:07 -0400
Received: by mail-lj1-x234.google.com with SMTP id
 38308e7fff4ca-2c50906f941so1671461fa.2
 for <qemu-devel@nongnu.org>; Thu, 19 Oct 2023 14:23:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1697750584; x=1698355384; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=uPCUA2oPZ2wdqytvwya118q0tpbF9WOJR99LmJrLuIo=;
 b=JP4C1oN+LQvxxbPv8VJkBWDbdbs4ScUaXh9CrmLprg9YobphcGcE4sNpJMGhR1kY99
 t10f1OP3NqCxE7xnisWUJyjdItsKm9gINbADv3qJA5NaGNmCXP4ZK0dm4Zkfh4luT+g+
 ptYyMHFuGHcrT+qGPW5s3iJ6x47viHsLXh3KGGDalqlhLYagU17UhnA9ltWgkUSNUgEM
 aziaFi+OZiV6e1/BsaoDC9RZfatuYzn05IhXEWKQ14P8bYCsSJkwILTClLvSKFZkp0E7
 qGVxFzJAS7ufO2Z8OsHI1rICwJctrCoeBI4dmhikzfPCjOqP3M94uqmtyCMfr6VuOOoe
 kViA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697750584; x=1698355384;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=uPCUA2oPZ2wdqytvwya118q0tpbF9WOJR99LmJrLuIo=;
 b=ts2vF4RunYFs1PjEU3OVWgxZYRnYVSUgVB0lCRtNaPmRaALVXWkONkG0dOMY5nyGAH
 3Bf+mje8fVQE4NfGOeTuVTN0b9YX36xWhCYtvX1DrUVeDViSoFgY72KlnP4LO/J1ff+B
 s0z44oZgpiqVoG4YQP7siSVBzKcD6Dq7DFgAcvNZabJBwG2nM7iNe2qBzoZLcWjsMwwi
 fCmgOO269CzO9R71Uw4c9KBdn4U2HhOB3FJfAlXyqo5jlxxQFeXCc36pzolnDVC/DXfy
 li0wyoO8tCcSXijciGjPy4OvQt+TXsz8gMJPILtZnfXrObOsTHmFGtdqXpKkp9+2KiRj
 sxMA==
X-Gm-Message-State: AOJu0YzSszBjAAMKxJa1Lrd7vupnmRbAY/b7DK7TM6i8u9KW0q1ktHA8
 gd4SFjRPR2NesSk8FJkmavVxNV+Ie6K8AGAwgCyjPQ==
X-Received: by 2002:a2e:b712:0:b0:2c5:47f:8ff7 with SMTP id
 j18-20020a2eb712000000b002c5047f8ff7mr109874ljo.18.1697750583934; 
 Thu, 19 Oct 2023 14:23:03 -0700 (PDT)
Received: from m1x-phil.lan (176-131-216-177.abo.bbox.fr. [176.131.216.177])
 by smtp.gmail.com with ESMTPSA id
 j20-20020a05600c1c1400b004065daba6casm5434839wms.46.2023.10.19.14.23.02
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 19 Oct 2023 14:23:03 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, qemu-s390x@nongnu.org, qemu-block@nongnu.org,
 qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Manos Pitsidianakis <manos.pitsidianakis@linaro.org>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Paolo Bonzini <pbonzini@redhat.com>, Fam Zheng <fam@euphon.net>
Subject: [PULL 43/46] hw/scsi/virtio-scsi: Use VIRTIO_SCSI_COMMON() macro
Date: Thu, 19 Oct 2023 23:18:08 +0200
Message-ID: <20231019211814.30576-44-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231019211814.30576-1-philmd@linaro.org>
References: <20231019211814.30576-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::234;
 envelope-from=philmd@linaro.org; helo=mail-lj1-x234.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: 2tXTFTkkXVIq

Access QOM parent with the proper QOM VIRTIO_SCSI_COMMON() macro.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Reviewed-by: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
Reviewed-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Message-Id: <20231017140150.44995-5-philmd@linaro.org>
---
 hw/scsi/virtio-scsi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/scsi/virtio-scsi.c b/hw/scsi/virtio-scsi.c
index 45b95ea070..fa53f0902c 100644
--- a/hw/scsi/virtio-scsi.c
+++ b/hw/scsi/virtio-scsi.c
@@ -761,7 +761,7 @@ static void virtio_scsi_fail_cmd_req(VirtIOSCSIReq *req)
 
 static int virtio_scsi_handle_cmd_req_prepare(VirtIOSCSI *s, VirtIOSCSIReq *req)
 {
-    VirtIOSCSICommon *vs = &s->parent_obj;
+    VirtIOSCSICommon *vs = VIRTIO_SCSI_COMMON(s);
     SCSIDevice *d;
     int rc;
 
-- 
2.41.0

