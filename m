Received: by 2002:a5d:6782:0:0:0:0:0 with SMTP id v2-v6csp770924wru;
        Wed, 25 Jul 2018 07:35:07 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpe8JZZILO93v5J/9qxmPWfQu01StLxvNpygwDuIjGa95Ljgtr3nJinv4w7eeNH5oOnJ1aCG
X-Received: by 2002:a0c:fa4e:: with SMTP id k14-v6mr19121669qvo.35.1532529306977;
        Wed, 25 Jul 2018 07:35:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1532529306; cv=none;
        d=google.com; s=arc-20160816;
        b=U0S9nK7cP2ielWEa6j1IqWiaOwHSawRPATC4aPDmGP4SJ44sNkU0f7K82/6kG01Eae
         JZml1Vcv090LUnU75VsmYTobEieAMwGK09IVnmORVfnAbvPAyYRl0awbmRARh4U2unXn
         wOmOk1o4CoXmoHbiILwjBKQvOcX/QzIaVapxMrD7xPaKkuL4QZnB9ne9YUperc89kmkt
         8q+is9y7eNeD24PQEss34Gbc5sUJhZTo9GPu2MacPIa5MNzCaRqWYaZbyuYDzetbLj8O
         9m+BVZDu6SJCL22vk+zZCv6xKKqmID68Vm0u+KnH0Cj5FMOJ4jnVyjRFyyardZnliM+v
         JU3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=Uzw95oGEZ4YuSthQNWaXGORqrOb7p7V2T8gfO/S9ZtE=;
        b=YaT8eQVwldM4mfBLFwRmFm+J0vL9uxo9wZRJKZ0ssTeoFGnUkoOJd1+/vwFdri0wRb
         wMZeMQoq8RXvMv9T237QOquztTgntz8rYgJMyoFzEM2aJVhsAYM7/zdpGRaqzgVl3Q29
         0AhA6d8PcdWEJ4RJtSzmv86yVIqhJ/q7L1gLooViBydsTnL1YSzY1QWWpKsSM7JIZZsH
         nkwOBTFjdI9BDJaQ0mJJFc12fdvNeEd3IHoblfvjCm+p2zRalHUWhrnjX96SEe/2z3//
         Li/awSX920p+8L91rQkK3VChmxdp8eZKGiqg+nT6Bz8mrICEL1lSzIerWZvdp5XEoZrj
         SDkw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id k5-v6si3843500qkb.28.2018.07.25.07.35.06
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 25 Jul 2018 07:35:06 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:51568 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fiKsc-0001D3-B1
	for alex.bennee@linaro.org; Wed, 25 Jul 2018 10:35:06 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48514)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <geert@linux-m68k.org>) id 1fiKrx-00016O-2v
	for qemu-devel@nongnu.org; Wed, 25 Jul 2018 10:34:28 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <geert@linux-m68k.org>) id 1fiKru-00066T-1x
	for qemu-devel@nongnu.org; Wed, 25 Jul 2018 10:34:25 -0400
Received: from andre.telenet-ops.be ([2a02:1800:120:4::f00:15]:47410)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <geert@linux-m68k.org>)
	id 1fiKrt-00065f-Qn
	for qemu-devel@nongnu.org; Wed, 25 Jul 2018 10:34:21 -0400
Received: from ramsan.of.borg ([84.194.111.163])
	by andre.telenet-ops.be with bizsmtp
	id F2aJ1y0053XaVaC012aJro; Wed, 25 Jul 2018 16:34:19 +0200
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.86_2)
	(envelope-from <geert@linux-m68k.org>)
	id 1fiKrq-000528-7u; Wed, 25 Jul 2018 16:34:18 +0200
Received: from geert by rox.of.borg with local (Exim 4.90_1)
	(envelope-from <geert@linux-m68k.org>)
	id 1fiKrq-0002Xs-6j; Wed, 25 Jul 2018 16:34:18 +0200
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Peter Maydell <peter.maydell@linaro.org>,
	Alex Williamson <alex.williamson@redhat.com>
Date: Wed, 25 Jul 2018 16:34:12 +0200
Message-Id: <20180725143413.9728-4-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20180725143413.9728-1-geert+renesas@glider.be>
References: <20180725143413.9728-1-geert+renesas@glider.be>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 2a02:1800:120:4::f00:15
Subject: [Qemu-devel] [PATCH v3 3/4] hw/arm/virt: Allow dynamic sysbus
 devices again
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
Cc: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
	Magnus Damm <damm+renesas@opensource.se>, qemu-devel@nongnu.org,
	linux-renesas-soc@vger.kernel.org,
	Auger Eric <eric.auger@redhat.com>, qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: AOnFpAUhWkWl

Allow the instantation of generic dynamic sysbus devices again, without
the need to create a new device-specific vfio type.

This is more or less a partial revert of commit 6f2062b9758ebc64
("hw/arm/virt: Allow only supported dynamic sysbus devices").

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
v3:
  - Drop RFC state,

v2:
  - Restrict from TYPE_SYS_BUS_DEVICE to TYPE_VFIO_PLATFORM, as
    suggested by Eric Auger.
---
 hw/arm/virt.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 281ddcdf6e26236d..24c1d8e28c7c4285 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -1724,6 +1724,7 @@ static void virt_machine_class_init(ObjectClass *oc, void *data)
     machine_class_allow_dynamic_sysbus_dev(mc, TYPE_VFIO_CALXEDA_XGMAC);
     machine_class_allow_dynamic_sysbus_dev(mc, TYPE_VFIO_AMD_XGBE);
     machine_class_allow_dynamic_sysbus_dev(mc, TYPE_RAMFB_DEVICE);
+    machine_class_allow_dynamic_sysbus_dev(mc, TYPE_VFIO_PLATFORM);
     mc->block_default_type = IF_VIRTIO;
     mc->no_cdrom = 1;
     mc->pci_allow_0_address = true;
-- 
2.17.1

