Received: by 2002:a5d:4301:0:0:0:0:0 with SMTP id h1-v6csp2304462wrq;
        Thu, 21 Jun 2018 11:03:33 -0700 (PDT)
X-Google-Smtp-Source: ADUXVKIoJfJtsELmB3785RzaY7L6pXY6ykbotfhFuH2e+t2wTGkFgZHxiGCqrxoQzBQqGG0Dbn/7
X-Received: by 2002:a0c:9aec:: with SMTP id k44-v6mr23428958qvf.50.1529604213852;
        Thu, 21 Jun 2018 11:03:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1529604213; cv=none;
        d=google.com; s=arc-20160816;
        b=yFnxf+i3UB52arWvsRU3082gx9CGk7+n1ZFdB4e1LxblKz1PXy5qmIURTbypDHXu0z
         wQDJWnhwT2iC6XKIJqEbqUML0+gs43iE5yZ2pQ+yt2auN1jZUIosgQl8U0BIjUHDX3oQ
         T3LLnbJgorY4eP+fnDswGJ5nXIjsg9QobXIdJ+w1UhDBlNhW6TqM4wPmVDgdRfqEC2uj
         5wOJYHTn3Jg4iH0eMqMoNDQX04/4G6mm9zw4Z/yVTddBeDxePtydr885X8iKtTiQVTxm
         Kuc/pkfBbrlioeBxajgYd8pslSV2bxz7eP4L0SO9G7wYGZjwFBUhokVk8GWsx8SDwtXt
         yBNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:message-id:date:to:from
         :dkim-signature:arc-authentication-results;
        bh=DMRxpurs0O6SQaofjNj8qhq/fUQQ+sk9CUt/ldhsPnQ=;
        b=cVmQlo6GDcumTqcsa/32X3F1qAX7ffBfHaxIcyNpFA1fnNS1R5D/Y7HNgjoy2jou2o
         xjwOOq1Tmalq/qBUY28+NklKU097JxFT6nVFa7Gw5dq2OVjLfvQILB4WNNUBKQRR8tyO
         mANRBsnA0SL9jJ+NnasjgcJGlSJr06mJrRD39cggr+ZS1mn495uyouq0aZ83H7ayyrtn
         MBOOqfYJlExpIcZ0ehOG4TBpO+06qmll5RSbF0L8wqQlDwjghUOEK+mnPmP9ZqxvCCGx
         YzISnmZwXY48bu16wCDWo9LYU6v18gw/bMoyCxp0GKp974OcVYqLedmd3wCbcrIYpKxo
         4u1g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=RoIGga5l;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id z67-v6si1125502qkd.318.2018.06.21.11.03.33
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 21 Jun 2018 11:03:33 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=RoIGga5l;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:56999 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fW3vh-0000ah-7r
	for alex.bennee@linaro.org; Thu, 21 Jun 2018 14:03:33 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59091)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fW3up-0000Nm-C1
	for qemu-devel@nongnu.org; Thu, 21 Jun 2018 14:02:40 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fW3um-0006Q6-AB
	for qemu-devel@nongnu.org; Thu, 21 Jun 2018 14:02:39 -0400
Received: from mail-qt0-x230.google.com ([2607:f8b0:400d:c0d::230]:39060)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fW3um-0006Q2-63; Thu, 21 Jun 2018 14:02:36 -0400
Received: by mail-qt0-x230.google.com with SMTP id p23-v6so3664507qtn.6;
	Thu, 21 Jun 2018 11:02:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=DMRxpurs0O6SQaofjNj8qhq/fUQQ+sk9CUt/ldhsPnQ=;
	b=RoIGga5lBSZLUcnf6SfKjTPLZjv2UWslXZT4SJ/Gd5+QMYle5rDWEnhLKFJisNHhcV
	4hyPwWNNkL2uado/cPT1xWCqbiPS6Jmo1OT2mtyPRQH89xIAmNe0FqZ4X3/TIHcQGNAK
	epW0tLJE6Yy7Fl5cKB0Cq7GCJdDfMTkWUVWB2p1hqixQGFWfk1/w9SJt7j5vtV1acAtE
	CExxv0bswTNI0Af21WWRDeUHcbxDc/Mhnt53diIgWe4Qh9dopJnWWOHpq7Ze+saZ/Som
	fgXJpl1i+FpXcBIukbwdAdQLz1RPjKG/3jqvtFoI+ghZkIXITZaNmkSF5xr0tCCEByRr
	+UoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:mime-version:content-transfer-encoding;
	bh=DMRxpurs0O6SQaofjNj8qhq/fUQQ+sk9CUt/ldhsPnQ=;
	b=aeMYcgzZJsk+MeKXSPbR/4VEkJc5/RdV2bdDA+x6ZNOWBT692R+YsNDquOTR9SuuFi
	85o8cHi9KdCo0PhQwEPGtBdwHiuuJMb0ZYcvWJTQqNMubXaI1+o08ABNSEx6JUp7Mrxp
	ZCu2V9L2LXTiPLffgmuHV8N6zTzt4Gyp4oFutJ/Y/2sbQKlySgWYZGK6x+CXmFL8YZKc
	5FuTEkq/2r32wQpsFiZrrC+2cBmft5VEOityznCLgwyxe+6tcy0AeD+fMgoHSpRNfI/9
	4ctjrBOoUXvkA4q5+o3q1BrJbRJZN25Zw8KoopssN1myv79rCrDc0w8w86YJMqtCvHXk
	FCPg==
X-Gm-Message-State: APt69E12VE5zm5T6jH6XB6JO2koqPN4iBBTzjtthJfasOOOgc887T9Qw
	VMwMwA9cOqoyjhNGd1poRws=
X-Received: by 2002:ac8:2c23:: with SMTP id
	d32-v6mr24047307qta.54.1529604155471; 
	Thu, 21 Jun 2018 11:02:35 -0700 (PDT)
Received: from x1.local ([138.117.48.222]) by smtp.gmail.com with ESMTPSA id
	w51-v6sm2469469qta.12.2018.06.21.11.02.31
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 21 Jun 2018 11:02:34 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Peter Maydell <peter.maydell@linaro.org>,
	Alistair Francis <alistair@alistair23.me>,
	Peter Crosthwaite <crosthwaite.peter@gmail.com>,
	Jason Wang <jasowang@redhat.com>, "Michael S . Tsirkin" <mst@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>
Date: Thu, 21 Jun 2018 15:02:13 -0300
Message-Id: <20180621180224.8312-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.18.0.rc2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::230
Subject: [Qemu-devel] [PATCH 00/11] hw/arm: use qemu_log_mask instead of
 fprintf
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: qemu-trivial@nongnu.org, qemu-arm@nongnu.org,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: c4WGn+Fg1n4B

Hi,

This series is another collection of trivial patches from
different stagnating branches, OMAP and Stellaris. Time to
share before loosing them.

Regards,

Phil.

Philippe Mathieu-Daudé (11):
  hw/input/pckbd: Use qemu_log_mask(GUEST_ERROR) instead of fprintf
  hw/input/tsc2005: Use qemu_log_mask(GUEST_ERROR) instead of fprintf
  hw/dma/omap_dma: Use qemu_log_mask(UNIMP) instead of printf
  hw/dma/omap_dma: Use qemu_log_mask(GUEST_ERROR) instead of fprintf
  hw/ssi/omap_spi: Use qemu_log_mask(GUEST_ERROR) instead of fprintf
  hw/sd/omap_mmc: Use qemu_log_mask(UNIMP) instead of printf
  hw/i2c/omap_i2c: Use qemu_log_mask(UNIMP) instead of fprintf
  hw/arm/omap: Use qemu_log_mask(GUEST_ERROR) instead of fprintf
  hw/arm/stellaris: Use qemu_log_mask(UNIMP) instead of fprintf
  hw/net/stellaris_enet: Use qemu_log_mask(GUEST_ERROR) instead of hw_error
  hw/net/smc91c111: Use qemu_log_mask(GUEST_ERROR) instead of hw_error

 include/hw/arm/omap.h   | 20 +++++++-----
 hw/arm/stellaris.c      |  2 +-
 hw/dma/omap_dma.c       | 72 ++++++++++++++++++++++++++---------------
 hw/i2c/omap_i2c.c       | 23 ++++++++-----
 hw/input/pckbd.c        |  4 ++-
 hw/input/tsc2005.c      | 14 +++++---
 hw/net/smc91c111.c      |  9 ++++--
 hw/net/stellaris_enet.c |  9 ++++--
 hw/sd/omap_mmc.c        | 13 +++++---
 hw/ssi/omap_spi.c       | 15 ++++++---
 10 files changed, 119 insertions(+), 62 deletions(-)

-- 
2.18.0.rc2

