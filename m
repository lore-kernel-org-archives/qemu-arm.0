Received: by 2002:a5d:4308:0:0:0:0:0 with SMTP id h8-v6csp671266wrq;
        Wed, 4 Jul 2018 08:42:53 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpfGtfUFMvZogPz5TxcZurGSpSj/mtbRNKp3PI0vOss1qfPtwUj1qfJrmQPONHBRGwnH8/D8
X-Received: by 2002:a0c:c176:: with SMTP id i51-v6mr2142393qvh.40.1530718973454;
        Wed, 04 Jul 2018 08:42:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1530718973; cv=none;
        d=google.com; s=arc-20160816;
        b=VBrkbabzw8ZgtweBOdhnt+eQoN+7KxBd3zs0WS1fZLM2SiFHplPYaRv1yM0kHHAM/0
         GwJIvrntAOB0OFNECPtn61FdWCV9nuwlqElZ5+r4oRNXiAWifeaqbCNU2jdxu/eslJSw
         usAcT+VhRvhydhvVHqeIBuMCW0jAQ/CCiA0TGutuhJqLWDVJHDZtK7I7EOpDmqpsEs1m
         xU39dbEW852t0O5IUOtPipiJJcY+9T5x/YmZkcowrrFVkxzxqL5mdApiRb7XqV2Agmp8
         qUIMAskrhZzOYCPHRCnp8z54sPLKSY/c9djkseWVklvSVmySlnRXw7lUCSdDouNVLhYz
         S70A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:message-id:date:to:from
         :dkim-signature:arc-authentication-results;
        bh=O5WdySP/xR35IpkOxksj5GJQg5aL0JblElDYp3FqoIc=;
        b=Tabr80kn/TaPXwqUzSA+ArpL5I2c5kCH1ndwpUY4KfQB41VWOYB/zizJkT84TZpB7Y
         NVv/gJA1EDN8MsVlLBI5iC+UWUdgSWOCrxPXddoBymoqn8Y3TzlAuhdLtfESWQujf87Y
         pAL98lBnmXWqrQ9ilfByaDf2an3X6rNB1yh0sovSH4rAuXu3NIbhwtm+vFox2L32qj63
         3/or1Iga6nkzA0cwhF0480x9CrE0pVOO/BvQVgnaQKOSQgjc2peJOiZS8wAoxSIhk9MA
         9Ynoh9PEses+qBROmWFWGNRwuSSlGXlpPqe3Nvd+zXcLWidX9DjUk9V/+0gjOSoAS5t6
         GHrg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=tItTjV6A;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id y2-v6si3636558qkl.233.2018.07.04.08.42.53
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 04 Jul 2018 08:42:53 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=tItTjV6A;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:47802 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fajvg-0000wi-Sw
	for alex.bennee@linaro.org; Wed, 04 Jul 2018 11:42:52 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57476)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fajsr-0006tU-CI
	for qemu-arm@nongnu.org; Wed, 04 Jul 2018 11:39:58 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fajsn-0003YJ-Fp
	for qemu-arm@nongnu.org; Wed, 04 Jul 2018 11:39:57 -0400
Received: from mail-qt0-x244.google.com ([2607:f8b0:400d:c0d::244]:33344)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fajsn-0003Y5-AN; Wed, 04 Jul 2018 11:39:53 -0400
Received: by mail-qt0-x244.google.com with SMTP id l10-v6so4852528qtj.0;
	Wed, 04 Jul 2018 08:39:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=O5WdySP/xR35IpkOxksj5GJQg5aL0JblElDYp3FqoIc=;
	b=tItTjV6AnTeLQ4rRAaqBx9rlLJIKB57ztdFZh7m6gdbPgkb5dtj93Wp1vm6nvddB/w
	i/GMjT+9YhdGbeipkNgoJlPPxxDuEnPrpH0lBkfN/ao0xxbt4xcfBsYafXMd6HdEUXNs
	1k+OfsK+joIBXclrGX+r4ufZ/Eruls+cnTWSOBuOwqj5Yv6HIHnXfL0dAdggHRV8KX9o
	5UhhF053UiTaMiatZ4zwSs6KnqxgmKE53bXSDRq7PaLKFnZqiHULyP2RvU7HiqFQjnJF
	p+qPVtByXfPiuW/v8ea0eO4P6kcpKMzspT9JtflsrsRRdYo3X0alakONHx3qZ0SzYzaT
	CaSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:mime-version:content-transfer-encoding;
	bh=O5WdySP/xR35IpkOxksj5GJQg5aL0JblElDYp3FqoIc=;
	b=rz0XJoXbIKwD4nHd0aoVKGZzkJvny0pdSayPBDHZqJAPR5OsAzuFx0GChF+Ung8QUb
	SM+urx/petLCpQtg7HN121uVSnDmattokmv0Wtnbyz+SwuZFTwQeea/ZdcBjkfXuiMUA
	XyjQcCdCtUaqwi1LVO0yGTeZg25a7oDlKeKi8RTQgFRCQqu5r7Zjd6T9dkpSmPxzje1n
	2WCN6QZphUDnleFI+OQtGwQqNCY9uY1bPTG0gxYbv00g3yvlHxhZYdm0biEaX11ndSdn
	yj8EkXl+ONQeN/t7hpF4X3Gcci/InBM32z6bXlzch64RzI4ptqoNVWH/s1N8N6E33Cuz
	FpIA==
X-Gm-Message-State: APt69E39yul2txn6nOWD8cQzHfmXzSIrN9f7hq/p1o88rU/RU+RrPxXI
	FgGCMTLNoSGvx+v2N+Q4vWE=
X-Received: by 2002:aed:3c42:: with SMTP id
	u2-v6mr2157168qte.198.1530718792756; 
	Wed, 04 Jul 2018 08:39:52 -0700 (PDT)
Received: from x1.local ([138.117.48.222]) by smtp.gmail.com with ESMTPSA id
	a127-v6sm2383795qkd.9.2018.07.04.08.39.46
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 04 Jul 2018 08:39:52 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Laurent Vivier <laurent@vivier.eu>,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Date: Wed,  4 Jul 2018 12:39:11 -0300
Message-Id: <20180704153919.12432-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::244
Subject: [Qemu-arm] [PATCH 0/8] Coccinelle cleanups
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>,
	David Hildenbrand <david@redhat.com>, qemu-devel@nongnu.org,
	Alexander Graf <agraf@suse.de>, Gerd Hoffmann <kraxel@redhat.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	qemu-block@nongnu.org, "Michael S . Tsirkin" <mst@redhat.com>,
	Markus Armbruster <armbru@redhat.com>,
	Christian Borntraeger <borntraeger@de.ibm.com>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Anthony Perard <anthony.perard@citrix.com>,
	xen-devel@lists.xenproject.org, qemu-s390x@nongnu.org,
	qemu-arm@nongnu.org, Richard Henderson <rth@twiddle.net>,
	Kevin Wolf <kwolf@redhat.com>, "Daniel P . Berrange" <berrange@redhat.com>,
	Cornelia Huck <cohuck@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	Max Reitz <mreitz@redhat.com>, Igor Mammedov <imammedo@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 5hRwd+1tRQ/O

Nothing exciting here, patches created mechanically
(common after soft freeze).

Philippe Mathieu-Daudé (8):
  qobject: Catch another straggler for use of qdict_put_str()
  error: Remove NULL checks on error_propagate() calls
  crypto: Remove useless casts
  xen: Remove useless casts
  tests/bios-tables-test: Remove useless casts
  ui/vnc: Remove useless parenthesis around DIV_ROUND_UP macro
  hw/pci-host: Remove useless parenthesis around DIV_ROUND_UP macro
  hw/intc/gicv3: Remove useless parenthesis around DIV_ROUND_UP macro

 include/hw/intc/arm_gicv3_common.h | 2 +-
 crypto/cipher-builtin.c            | 4 ++--
 hw/pci-host/piix.c                 | 2 +-
 hw/pci-host/q35.c                  | 2 +-
 hw/s390x/virtio-ccw.c              | 4 +---
 hw/xen/xen_pt_config_init.c        | 2 +-
 qobject/block-qdict.c              | 2 +-
 tests/bios-tables-test.c           | 2 +-
 ui/vnc-enc-tight.c                 | 2 +-
 ui/vnc.c                           | 3 ++-
 10 files changed, 12 insertions(+), 13 deletions(-)

-- 
2.18.0

