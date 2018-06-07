Received: by 2002:a5d:4301:0:0:0:0:0 with SMTP id h1-v6csp2404421wrq;
        Thu, 7 Jun 2018 11:07:09 -0700 (PDT)
X-Google-Smtp-Source: ADUXVKKhetUNPtE9LZaiHJKftTHtlgbkO8FW+6iLS/Rz25yWT1xTXTqtjhSVbsFJDSwQ+FGRhUmL
X-Received: by 2002:ac8:25db:: with SMTP id f27-v6mr2874176qtf.128.1528394829666;
        Thu, 07 Jun 2018 11:07:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1528394829; cv=none;
        d=google.com; s=arc-20160816;
        b=Pco1cHnGPHkgLQKTR39l5RvsEIGHoww1zs7sd/ZCyJK/PhKWwHyRCRRI3t8dpYD4Zy
         kqpZdKWDTSLK8gZds1d8SlrF+2FllLz/YX5vBo7mcGhDEmvObpicUU+bR/310kQHx7dx
         j5WMP39oL7QyqZZdPhwSRa/OAjGVmLi2rqe/tll/IaHgyxdD5ElDBNcSTF+969oKwIFj
         kUOfh52xsV/6WWQuXHRLvrOOPFtG2FTj5fFvW7ksuPiwKVtue/kE1v6xPjQG3EhdSGFC
         lvc5Kpin5DfpzGJAOvzyMh3Ae4C3g4COAc8q6BC2JFB6Cg7VQCaOJzo9yFC0Lup/dx9U
         avaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:message-id:date:to:from
         :dkim-signature:arc-authentication-results;
        bh=yzlHe4tUYNev+pC2++tMvCAfF2Eg9lnGb+WnsWHanC0=;
        b=IwHI7RCgdtYq5VTGD+QXGFbUPlVCerN3qU/mvFZ6phahIgRejHGDMcRQqVOZUuJxzr
         PkrMLRKW+s1tgxpL29COO9gGOI6MgPeciP7GADTNX1RtfzOqQVbOo6oswdHtZzxJGxIj
         W3OSt5zGSK0FexoN/yi3Wlh0LvqlkFAbTiw2BlcknagC0S80Q7Gs6+CGGY8AF+VBawbD
         bwrhZoNIqXl5hqUrFAvLns39LIN5ubEPfRaGTZnsiJzzpD8wS8g6DGYcgc1QYRr+JH3I
         UGLnlyGHCqUXqUQUgm3jnEDgJBas958d6Dm5eY8IVOOpJVdLsY1QrTR3M5G6phx7GNAv
         tiUA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=uWmkF6A7;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id y81-v6si963663qkg.368.2018.06.07.11.07.09
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 07 Jun 2018 11:07:09 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=uWmkF6A7;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:59595 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fQzJU-0001zS-Rk
	for alex.bennee@linaro.org; Thu, 07 Jun 2018 14:07:08 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45934)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fQzJI-0001x9-4X
	for qemu-arm@nongnu.org; Thu, 07 Jun 2018 14:06:57 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fQzJG-0004Mb-Uv
	for qemu-arm@nongnu.org; Thu, 07 Jun 2018 14:06:56 -0400
Received: from mail-qt0-x243.google.com ([2607:f8b0:400d:c0d::243]:37212)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fQzJC-0004JZ-CL; Thu, 07 Jun 2018 14:06:50 -0400
Received: by mail-qt0-x243.google.com with SMTP id q13-v6so10798992qtp.4;
	Thu, 07 Jun 2018 11:06:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=yzlHe4tUYNev+pC2++tMvCAfF2Eg9lnGb+WnsWHanC0=;
	b=uWmkF6A7fDsu/d+hwmmY9r4nRa9vMni0QfXXjC5Kbk0Nz5uVTwf0GRpQlxh04Yu0gm
	09Lrxf446AiNCYfUa2Dd89IrraFZ058SMFuh/5Vm9O/46ziR6J4dVzzJMud12u9646sg
	fCG2k8osCDNo7f+knG3/kkLYfBKdRhOcnm3v7T2glAiM7r2TvPWjWks5pwlDcrFsQ8c2
	ZjniJ9WQo7yJtKwkUVe8bGEB6GAc/RxGdsp/CBWUfyySytL4wb5rLAVSpjlJVisYoPNY
	OWRjWiC3j1QIsv7pe+GilsZ1hxGd1Si5htWVC7JuMI2rFe4AyEd6ELUG1Vc4nN5yesIo
	cfcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:mime-version:content-transfer-encoding;
	bh=yzlHe4tUYNev+pC2++tMvCAfF2Eg9lnGb+WnsWHanC0=;
	b=rOeuLdlcHOv1U6QKXDCDYhQ6UynYtc7KUiLabZHBTivPeacv/kjAmBM4imbzrW8SAy
	4tiCF5VLVm3RXmPiWbDdnLFMJHmwsNMtke0RKRnvfcPI6qlv6h4PBR7+hM3Ts5qJqzhF
	9Bw4s0lvsF87e4AkN82T6+6c8WYtg7D4eUbKoQXvE0ADdiwvY+Z/PY7M/RBvEZ17FUhL
	W6imvyoVSTLdzXyCFlgsl0OCb88AmL931UsqNzpjcRDzmVeoBdkY0N9H6pk//AIN3H2x
	xiN7+Jc7eYVckC3dqXT93dVKUFm53Wqa2zLqZSXj1Wy0i1XnqS42t2QiXHPBlAXmRx/K
	mY6Q==
X-Gm-Message-State: APt69E3cpscb7uWWmLMPc69Nanu6eEbztDB0Kakdpa2iP8QN1hRuXiUl
	DfFnEvye3j/xSj6Wa8YzN/A=
X-Received: by 2002:a0c:92f4:: with SMTP id
	c49-v6mr2694917qvc.101.1528394809873; 
	Thu, 07 Jun 2018 11:06:49 -0700 (PDT)
Received: from x1.local ([138.117.48.222]) by smtp.gmail.com with ESMTPSA id
	s15-v6sm26838414qtc.81.2018.06.07.11.06.46
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 07 Jun 2018 11:06:49 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Alistair Francis <alistair@alistair23.me>,
	Peter Maydell <peter.maydell@linaro.org>
Date: Thu,  7 Jun 2018 15:06:34 -0300
Message-Id: <20180607180641.874-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::243
Subject: [Qemu-arm] [PATCH v2 0/7] sdcard: cleanup the SD_SPEC version
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
Cc: Igor Mitsyanko <i.mitsyanko@gmail.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, qemu-arm@nongnu.org,
	Paul Brook <paul@codesourcery.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: YIs4RrYN9V1k

Since v2:
- heavy documentation improvements
- squashed previous 3+4 "add spec_version property default to v2" for atomicity
- SSI/SD patch downgraded to RFC
- added Alistair R-b tags

v1: http://lists.nongnu.org/archive/html/qemu-devel/2018-06/msg00388.html

Hi,

This series adds a 'spec_version' property to the SD Card device,
to allow to limit some commands to specific spec version range
(some firmwares use this feature to detect which spec version the
card implements).

This [v2: does NOT] restore the SSI/SD support of the Stellaris LM3S6965EVB
board, which allow to stress the SD Card code with a nice integration test
(waiting for another series to get merged to add the Avocado test):

    $ qemu-system-arm -M lm3s6965evb -serial stdio \
      -kernel sd_card.bin -sd sdcard.img

    SD Card Example Program
    Type 'help' for help.

    /> ls
    Open
    listing

    ----A 2012/04/25 17:44        12  README.TXT

       1 File(s),        12 bytes total
       0 Dir(s),      61182K bytes free

    /> cat README.TXT
    Hello World

See:
http://lists.nongnu.org/archive/html/qemu-devel/2012-04/msg03790.html
http://lists.nongnu.org/archive/html/qemu-devel/2018-06/msg00353.html

Regards,

Phil.

[----] : patches are identical
[####] : number of functional differences between upstream/downstream patch
[down] : patch is downstream-only
The flags [FC] indicate (F)unctional and (C)ontextual differences, respectively

001/8:[----] [--] 'sdcard: Update the Configuration Register (SCR) to Spec Version 1.10'
002/8:[----] [--] 'sdcard: Allow commands valid in SPI mode'
003/8:[0017] [FC] 'sdcard: Add a 'spec_version' property'
004/8:[down] 'sdcard: Set Spec v2.00 as default'
005/8:[----] [--] 'hw/sd/ssi-sd: Force cards connected in SPI mode to use Spec v1.10'
006/8:[----] [--] 'sdcard: Disable SEND_IF_COND (CMD8) for Spec v1'
007/8:[----] [--] 'sdcard: Reflect when the Spec v3 is supported in the Config Register (SCR)'
008/8:[----] [--] 'sdcard: Disable CMD19/CMD23 for Spec v2'

Philippe Mathieu-Daudé (7):
  sdcard: Update the Configuration Register (SCR) to Spec Version 1.10
  sdcard: Allow commands valid in SPI mode
  sdcard: Add a 'spec_version' property, default to Spec v2.00
  sdcard: Disable SEND_IF_COND (CMD8) for Spec v1
  sdcard: Reflect when the Spec v3 is supported in the Config Register (SCR)
  sdcard: Disable CMD19/CMD23 for Spec v2
  hw/sd/ssi-sd: Force cards connected in SPI mode to use Spec v1.10

 include/hw/sd/sd.h |  6 ++++++
 hw/sd/sd.c         | 50 +++++++++++++++++++++++++++++-----------------
 hw/sd/ssi-sd.c     |  2 ++
 3 files changed, 40 insertions(+), 18 deletions(-)

-- 
2.17.1

