Received: by 2002:adf:b2b8:0:0:0:0:0 with SMTP id g53-v6csp2130011wrd;
        Sun, 2 Sep 2018 23:58:17 -0700 (PDT)
X-Google-Smtp-Source: ANB0VdYBVM2p64aNSOeedclr3EbD2ljA3iDA/Tj82+/kCZNIQZNJkCfPhtZ4zTAvkJf5YMuQZ37d
X-Received: by 2002:a37:38b:: with SMTP id 133-v6mr20354063qkd.48.1535957897329;
        Sun, 02 Sep 2018 23:58:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1535957897; cv=none;
        d=google.com; s=arc-20160816;
        b=doAJMOWSPPbK98XtIUy3ooA4kdok4KY97mZzSA2NyRTD1RCfA2igOaKbe7UtFzOZv0
         NW5CM4xYxYsqFrlvsIoisqAMqpbFzJchbkxigXxeywrJPjgpjzUGuDDCYN5tN/N19jwh
         fRXA7Qc+QQTQnBq0a66kkNp+PDJOa+tM83QG11RuqfuGRrzf5RwnDka1d5z3pzLzd/4M
         usehIud1kg7ZPxflCApfZXoOphM0v8LPpix2DlbZwADGIP5Ew0YxDtRBAAuFNbIEC8BK
         u+kxH+qE60g2ww2ZQ6HYVpnQIqr3bXFQ2CNuT35rWE0/ViGR2AeipNve0BHDBnaGH1/Q
         reUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:message-id:date:to:from
         :arc-authentication-results;
        bh=PeOYCiFCcwCY14Y8XIHsEMvLUCoePntpWVpEyfSG+1U=;
        b=A+fRTKui++Wzhg3r/SPVFms6OBwLIFOVidBo6s04Ux5vi2nir2hMwunOcdvvloJHQI
         GpszXgD9TOlwep4WrUQkb0jVkbvHhZa7YiEjzRCR56LDaTn4RgJiwHwGdBuaQjItjQjD
         c2vmspRUixUeMOlB/BK+QAS/FLkxJglHd7CV4Q03VQgGFMROyHNNEFGeO0XCwZYF0GKY
         jQPfS/Y1z2u7HRwFIF91B8bfpYLzbfygcM7qw/5KcccDnAzcXN+CKGDmXTXB7AANjEON
         NtR+O5cOcQfpVOZs3eK7PiRgQDzan14otbG0eaIGCNU0a8f06q0nQ7MCDCOsOI4cETXY
         XRdQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id j2-v6si3828452qvb.280.2018.09.02.23.58.17
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sun, 02 Sep 2018 23:58:17 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:43795 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fwioS-0001u8-QV
	for alex.bennee@linaro.org; Mon, 03 Sep 2018 02:58:16 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58415)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kraxel@redhat.com>) id 1fwio7-0001lO-HH
	for qemu-arm@nongnu.org; Mon, 03 Sep 2018 02:57:56 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <kraxel@redhat.com>) id 1fwio4-0008CS-Af
	for qemu-arm@nongnu.org; Mon, 03 Sep 2018 02:57:55 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:33482 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <kraxel@redhat.com>)
	id 1fwio4-0008Bd-2u; Mon, 03 Sep 2018 02:57:52 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 6063F87A70;
	Mon,  3 Sep 2018 06:57:51 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-66.ams2.redhat.com
	[10.36.116.66])
	by smtp.corp.redhat.com (Postfix) with ESMTP id D8E232166BA1;
	Mon,  3 Sep 2018 06:57:46 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
	id E2E3711AA4; Mon,  3 Sep 2018 08:57:45 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Date: Mon,  3 Sep 2018 08:57:40 +0200
Message-Id: <20180903065745.23055-1-kraxel@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.1]);
	Mon, 03 Sep 2018 06:57:51 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.1]);
	Mon, 03 Sep 2018 06:57:51 +0000 (UTC) for IP:'10.11.54.6'
	DOMAIN:'int-mx06.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'kraxel@redhat.com' RCPT:''
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 66.187.233.73
Subject: [Qemu-arm] [PULL 0/5] Vga 20180903 patches
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
Cc: "Michael S. Tsirkin" <mst@redhat.com>,
	Igor Mitsyanko <i.mitsyanko@gmail.com>,
	Alistair Francis <alistair@alistair23.me>, qemu-arm@nongnu.org,
	Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: TnB59MmpoQ0D

The following changes since commit 19b599f7664b2ebfd0f405fb79c14dd2415574=
52:

  Merge remote-tracking branch 'remotes/armbru/tags/pull-error-2018-08-27=
-v2' into staging (2018-08-27 16:44:20 +0100)

are available in the git repository at:

  git://git.kraxel.org/qemu tags/vga-20180903-pull-request

for you to fetch changes up to 8da132a56f7ebaabc5b674b5a3a2e6fa8934be45:

  virtio-gpu: add iommu support (2018-09-03 08:31:57 +0200)

----------------------------------------------------------------
vga: virtio reset fix, virtio iommu support.

----------------------------------------------------------------

Gerd Hoffmann (5):
  virtio-vga: fix reset
  Revert "virtio-gpu: fix crashes upon warm reboot with vga mode"
  use dpy_gfx_update_full
  virtio-gpu: pass down VirtIOGPU pointer to a bunch of functions
  virtio-gpu: add iommu support

 include/hw/virtio/virtio-gpu.h |  8 +++---
 hw/display/exynos4210_fimd.c   |  4 +--
 hw/display/g364fb.c            |  2 +-
 hw/display/jazz_led.c          |  3 +--
 hw/display/tc6393xb.c          |  4 +--
 hw/display/vga.c               |  3 +--
 hw/display/virtio-gpu-3d.c     |  8 +++---
 hw/display/virtio-gpu.c        | 59 ++++++++++++++++++++++--------------=
------
 hw/display/virtio-vga.c        | 17 ++++--------
 hw/display/vmware_vga.c        |  5 +---
 hw/display/xlnx_dp.c           |  3 +--
 11 files changed, 53 insertions(+), 63 deletions(-)

--=20
2.9.3

