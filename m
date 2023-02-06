Received: by 2002:a17:906:dac7:b0:886:babc:7eeb with SMTP id xi7csp4229401ejb;
        Mon, 6 Feb 2023 06:10:52 -0800 (PST)
X-Google-Smtp-Source: AK7set/TiUN2MXI15K4J0vxgs2UsaDsSXulRK4QdADG3JTiRfLt1F1MPCeAzBsKFbCgF+ZmZ9VKc
X-Received: by 2002:ac8:590b:0:b0:3b9:b6c8:6d7a with SMTP id 11-20020ac8590b000000b003b9b6c86d7amr36269766qty.29.1675692652227;
        Mon, 06 Feb 2023 06:10:52 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1675692652; cv=none;
        d=google.com; s=arc-20160816;
        b=oZmzJ8mNm0kHydbg2oPTdRhnOzQgxMJc0RGSaxL93/M1hqkCJ+5ImrzS3kq3R7lz0a
         +LNwHbN9DZR9WVryfFwAYXxqqyG7yWrGVOD3Eyz/RnDiXuTwQhI6Xg5eJM4SRwE3emOk
         cgNw4QqtZBiizlSBF1SVJa6q5NzdU9WprBu388/pm+H9G2NcN7Nq2fotuxhQA29IfLlM
         J8WlRZ9dPSOs1WcN6O6fwT7do0CrcudmNzBy8NrhkaaKSpmSmfBcdUB1Nh/POZzHmqv2
         J6XuhJMIvuG0HDh3/XuFyPArUK4vkKP6fhPQ0WLIXh3a+ykjVo74YzGABFBvrYfvA5t6
         +T8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature:dkim-signature;
        bh=2nF6Q1feagG1j59SSALXFHCj/mrnFM3pmdWjXUdvEyk=;
        b=MI+p+kWdLwU+up7k5LpXgI90mvH3wQkmXNFvSA7QRXmHYQcNIdClmZsmyZY064gFvc
         NGpQ27qnkFLwBgT+A4S2JJQR4jjs//T6bmTmp29y1i40eF7qT6lnpxJB9aMlGWvEc1v/
         mrj1AcsrG5cWSYX5EkNNM235lRbFf8tYb9Epc96vAWf2CBwDLrZByw0lEeomplbilJVp
         y9hCfRCBr1q4Rw8Zt6+wcMRLe8RMricJy/GeqGKWmWnSNog9js24dAFj7cm6i2ujFzHN
         oJ7BWnB7bzOSvjCUqK9HI1iajsDZbRX4nGoCcFe5WlL//GLcngJlj0Ob4M98nOnRJvZq
         khiQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b=2OyAQdYA;
       dkim=neutral (no key) header.i=@nongnu.org;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t25-20020a05622a181900b003b85f26c4d8si8247553qtc.724.2023.02.06.06.10.52
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 06 Feb 2023 06:10:52 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b=2OyAQdYA;
       dkim=neutral (no key) header.i=@nongnu.org;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pP2Ck-00066b-Bq; Mon, 06 Feb 2023 09:10:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@suse.de>)
 id 1pP2Ch-000662-Uj; Mon, 06 Feb 2023 09:10:44 -0500
Received: from smtp-out2.suse.de ([195.135.220.29])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <farosas@suse.de>)
 id 1pP2Cg-0002g0-Bi; Mon, 06 Feb 2023 09:10:43 -0500
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 0311E60420;
 Mon,  6 Feb 2023 14:10:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1675692641; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2nF6Q1feagG1j59SSALXFHCj/mrnFM3pmdWjXUdvEyk=;
 b=2OyAQdYAuGIZZE+HtUF3pb3GSFde3he6QRrJZBlgGiuq9dFyjPEjOUpQDaFdNy26aMVoIl
 4+W89l9r/RIkSFJwNOVwm5POLGFWSPQoAA4+BZ/EJHLk9vP4zeOkR0KZFz+spUQOX2Lb5s
 vG0EiiMrNS+ECpBlHNhvO43PdpT7DMI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1675692641;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2nF6Q1feagG1j59SSALXFHCj/mrnFM3pmdWjXUdvEyk=;
 b=OIZjmeufdyR2kyZ7nHEmRVxefLjDZSE31xo571EU0XTrj1PVHAFLH3exKanxMAYsputE73
 y26HJq+sdrhRF6BA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 9B35E138E7;
 Mon,  6 Feb 2023 14:10:39 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id KEWOGF8K4WOgQAAAMHmgww
 (envelope-from <farosas@suse.de>); Mon, 06 Feb 2023 14:10:39 +0000
From: Fabiano Rosas <farosas@suse.de>
To: qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 qemu-arm@nongnu.org
Subject: [PATCH 06/10] hw/arm: Select VIRTIO_BLK for virt machine
Date: Mon,  6 Feb 2023 11:08:05 -0300
Message-Id: <20230206140809.26028-7-farosas@suse.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20230206140809.26028-1-farosas@suse.de>
References: <20230206140809.26028-1-farosas@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=195.135.220.29; envelope-from=farosas@suse.de;
 helo=smtp-out2.suse.de
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: kb34FMBXj+dJ

The virt machine has IF_VIRTIO as block_default_type, which causes the
generic code to try to create a virtio-blk-pci device pair at
configure_blockdev()/qemu_create_cli_devices().

Select VIRTIO_BLK and VIRTIO_PCI from CONFIG_ARM_VIRT to avoid errors
when PCI_DEVICES=n (due to e.g. --without-default-devices):

$ ./qemu-system-aarch64 -M virt -accel tcg -cpu max -nodefaults -cdrom foo.qcow2
qemu-system-aarch64: -cdrom foo.qcow2: 'virtio-blk' (alias
'virtio-blk-pci') is not a valid device model name

Signed-off-by: Fabiano Rosas <farosas@suse.de>
---
 hw/arm/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
index 8dcc08b7ec..296d4f5176 100644
--- a/hw/arm/Kconfig
+++ b/hw/arm/Kconfig
@@ -33,6 +33,7 @@ config ARM_VIRT
     select ACPI_HMAT
     select VIRTIO_PCI
     select VIRTIO_NET
+    select VIRTIO_BLK
 
 config CHEETAH
     bool
-- 
2.35.3

