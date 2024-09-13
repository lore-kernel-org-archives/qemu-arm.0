Received: by 2002:a17:504:928f:b0:1be9:327d:8ee3 with SMTP id d15csp895234nji;
        Fri, 13 Sep 2024 06:19:46 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWPyyzY+ZNohNg4ZtH48CZkrMidikB62GpAKbfwOh2Uc8IS+uuLwHLS4hZigwpkg6nRIHE1BnN0Zy1Obw==@linaro.org
X-Google-Smtp-Source: AGHT+IHyVmAUISsMTTytU8pfNSWqA91TL39nBiQ/5xz9f8hWq6UK7vWWu63lkpvZhKhv59zUeavZ
X-Received: by 2002:a05:622a:508:b0:458:3b77:f59 with SMTP id d75a77b69052e-45860330a9dmr86547321cf.31.1726233586103;
        Fri, 13 Sep 2024 06:19:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1726233586; cv=none;
        d=google.com; s=arc-20240605;
        b=QCdX5+OESJd6KoVrQm+AwlPaJxHuhFr6dmVTlXz4y/Mv2MCx3L7JSiNzU6rtdyBScc
         uKlOBZtKgIj5dvV96lJqD/4L+gi9PlR7ALjrLsrIcGNLp5qVqDRBeO4J5SgOr8br3SC8
         An5oF2zgBcmiL2XI76DeBMd3hvwMvbMMatlJooUYX4YzLInPPhRt5IcCN0wJTMxiSZOh
         ufOI/68rty8LU9UWoXYubOHd7ZlPDBkNxedFCVzEQ3Qtff6dL3dwzFeY8etF41qMuJy1
         T7GvPtJCVw/cxS/tboOiA8isvIDjYzf4yr2fabAkcIDWYNvHuPdlB7ST0x/YkpjnKrqY
         UJMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=6Wq2gz2kJ2DpqJ0edWlOFNLeL/UQkcdpUB9mWh98cNQ=;
        fh=t5Uyys11Y7aR87M0bTNDiA5XoT9xo0pnjf44kWsKPHQ=;
        b=TGu7gtmexIrmrul+NGe7puMCZd9Nm7vGacr0nF7fqRJ+EqVgU5a6gEXrV+DpkL+atu
         WHirf/rCOvZjb2TYH24KW1gB0+tDGHztNZJ9wIXT9FszTR8FMd79wfELcLJmpW+ebCMJ
         L3Ul72qaWA3G42ObAiXNIJqA8DNx3uIEHZ9vP/nir9vQ39nsLvn2exmi5JuvZzmyOOud
         l9C6n3lP8QNcD9FGZDQuEKNBFNY8zEDUP41QfFYop0ufv/WHIzOnbkOEXPT1L8nme89G
         h+Bmloxzc4PWG98kjOPrqJn1gOLFdA1ZvQ+5GpUS7WbVDYp5n8Z4F19BpGdE2TabAkfy
         T9ww==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="F/5jNV/N";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-45822fd9792si153802611cf.659.2024.09.13.06.19.46
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 13 Sep 2024 06:19:46 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="F/5jNV/N";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sp6Ck-00036P-Go; Fri, 13 Sep 2024 09:19:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1sp6CZ-0002wY-QM
 for qemu-arm@nongnu.org; Fri, 13 Sep 2024 09:19:08 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1sp6CY-00027h-JZ
 for qemu-arm@nongnu.org; Fri, 13 Sep 2024 09:19:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1726233544;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=6Wq2gz2kJ2DpqJ0edWlOFNLeL/UQkcdpUB9mWh98cNQ=;
 b=F/5jNV/Nsbug3ZVH3jVH1gonZKvzwQiK/onILbltPnI7mteY7mbSmwGFD6ndWPKttggH0x
 6gGz4nQPDD8qy6zVDo1QsneR/XAtBHOHh0X0ds9jsAwp+8rQcakKUSQBi5/bfZEL9iaZ1U
 NrbeL1aREj4uW7edAVDdCsaJzT50WcM=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-332-gjZEIDtbMiyXcomOa7yPZQ-1; Fri,
 13 Sep 2024 09:19:03 -0400
X-MC-Unique: gjZEIDtbMiyXcomOa7yPZQ-1
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 37EEF193E8D1; Fri, 13 Sep 2024 13:19:02 +0000 (UTC)
Received: from thuth-p1g4.redhat.com (unknown [10.39.193.15])
 by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 18C0A19560AB; Fri, 13 Sep 2024 13:18:59 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, mzamazal@redhat.com,
 "Michael S . Tsirkin" <mst@redhat.com>, qemu-arm@nongnu.org
Subject: [PATCH] hw/virtio/Kconfig: Include vhost-user-scmi only on arm targets
Date: Fri, 13 Sep 2024 15:18:58 +0200
Message-ID: <20240913131858.418407-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.147,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
X-TUID: PdYGEXIxgfmP

The System Control and Management Interface is specific to arm
machines, so don't include this device in non-arm targets.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 hw/virtio/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/virtio/Kconfig b/hw/virtio/Kconfig
index aa63ff7fd4..bea5be4d4a 100644
--- a/hw/virtio/Kconfig
+++ b/hw/virtio/Kconfig
@@ -109,4 +109,4 @@ config VHOST_USER_SND
 config VHOST_USER_SCMI
     bool
     default y
-    depends on VIRTIO && VHOST_USER
+    depends on VIRTIO && VHOST_USER && ARM
-- 
2.46.0

