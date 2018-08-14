Received: by 2002:a5d:6782:0:0:0:0:0 with SMTP id v2-v6csp4160163wru;
        Tue, 14 Aug 2018 07:44:57 -0700 (PDT)
X-Google-Smtp-Source: AA+uWPzmjzAHobLlVNjybjuUKfJ9q3MciC2nc4qmFmBj2IgXkpGVSxsh+9mvf9EUbgX7MdcYeV2a
X-Received: by 2002:a0c:873d:: with SMTP id 58-v6mr19488206qvh.199.1534257897734;
        Tue, 14 Aug 2018 07:44:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1534257897; cv=none;
        d=google.com; s=arc-20160816;
        b=JqDdw9+XxhGtGkmM2E6IBI5S15hMVLqBO5vmMsHWtZEZTFPmVi/s+rotT5HaunwXUP
         hsMHmeOIBUFNgDDo1ol8u3IRVGTzrQwOYM1RbTllI0p+QuDjAAq8iqYiSqTnqMNoDErU
         LtqWdbh+fsb/jfgY9A/s0xfAXn1mEBSy0WxQTQCpaNtsntnplTtaK1sPPQDL7pFbG4Y7
         iHvRw2icjvn0Tnv9qNc1DKtMYAkEsISZToDqEvNWm232bTgiNH1GOTFfulBOAJ5zfgTL
         Eji88ysWvrPlTnGSWmZDjRRrCHdZHoa4NOo6EoDNJtVlkAss0wA7F1+1D+u2XbsEpJcM
         wJXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:message-id:date:to:from
         :arc-authentication-results;
        bh=irFJvWDKYnKOYi6t+m839ifFKuzswq/HuXE3UBqu7Bs=;
        b=RRGLkwp5Trk4OsC73ff66SR5NUUhsPGoFuhljQZIcPb6DnAScQT1CYXvV0iXLUPAsH
         orDCsAiD/C50En3n6Ny/8k5rbXN+9SMZDD9BLL/btdIQ/VUqBGMYljwsG8Yol+s6+Mos
         cGG4JDzjXV2zzouqqqhQqd5PNK8Yz61B5FW+rVUVvRHjldZRinmlgy5if53k66KT0AsN
         Cf81lO9imwYwfYZ16gqGkogsMmNZB+zMvFWOEkOmAInwGhzaCzjY/Nm8GNg1zlV1FHf6
         92YJLLrYdv0Z/t0JsouwvFo3LsTO6wY1/qc4yh9BptPwe1+gxUvZ4kw5cq67UNpM5a3S
         AiSg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 21-v6si8111162qtp.70.2018.08.14.07.44.57
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 14 Aug 2018 07:44:57 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:44630 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fpaZ7-0005uv-60
	for alex.bennee@linaro.org; Tue, 14 Aug 2018 10:44:57 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48552)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1fpaYs-0005uT-DW
	for qemu-arm@nongnu.org; Tue, 14 Aug 2018 10:44:43 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1fpaYr-00048c-BH
	for qemu-arm@nongnu.org; Tue, 14 Aug 2018 10:44:42 -0400
Received: from orth.archaic.org.uk ([2001:8b0:1d0::2]:44374)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <pm215@archaic.org.uk>)
	id 1fpaYr-00046w-3i; Tue, 14 Aug 2018 10:44:41 -0400
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.89)
	(envelope-from <pm215@archaic.org.uk>)
	id 1fpaYo-0006yW-IQ; Tue, 14 Aug 2018 15:44:38 +0100
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Tue, 14 Aug 2018 15:44:28 +0100
Message-Id: <20180814144436.679-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.18.0
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2001:8b0:1d0::2
Subject: [Qemu-arm] [PATCH 0/8] arm/raspi: Make fb handle virtual viewport
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
Cc: patches@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: IbOi6pzaW/m4

The raspi framebuffer supports a virtual viewport which can
be set up so that the virtual framebuffer size is larger than
the physical screen size, and the displayed area is at some
offset within this virtual framebuffer area. This patchset
implements that support.

To do that I had to do a fair amount of refactoring, because
getting the viewport code to work correctly and prevent the
guest from making it fall over by specifying silly offsets
or sizes requires that we properly validate and clip the
config that the guest sends us.

Note that the documentation in places like
https://github.com/raspberrypi/firmware/wiki/Mailbox-property-interface
has various errors in it. The behaviour implemented here
corresponds to how a hardware raspi2 I tested seems to behave,
using test programs based on the code from
http://www.valvers.com/open-software/raspberry-pi/step05-bare-metal-programming-in-c-pt5/

(I was a little bit hampered because I couldn't get the rpi
to actually *display* anything to the HDMI port, so mostly
I was testing the edge case behaviour of attempting to set
and read back various config values.)

This series fixes this bug:
https://bugs.launchpad.net/qemu/+bug/1777672

thanks
-- PMM

Peter Maydell (8):
  hw/misc/bcm2835_fb: Move config fields to their own struct
  hw/misc/bcm2835_property: Track fb settings using BCM2835FBConfig
  hw/display/bcm2835_fb: Drop unused size and pitch fields
  hw/display/bcm2835_fb: Reset resolution, etc correctly
  hw/display/bcm2835_fb: Abstract out calculation of pitch, size
  hw/display/bcm2835_fb: Fix handling of virtual framebuffer
  hw/display/bcm2835_fb: Validate config settings
  hw/display/bcm2835_fb: Validate bcm2835_fb_mbox_push() config

 include/hw/display/bcm2835_fb.h |  59 +++++++--
 hw/display/bcm2835_fb.c         | 218 +++++++++++++++++++-------------
 hw/misc/bcm2835_property.c      | 123 +++++++++---------
 3 files changed, 240 insertions(+), 160 deletions(-)

-- 
2.18.0

