Received: by 2002:adf:c793:0:0:0:0:0 with SMTP id l19csp858757wrg;
        Thu, 16 May 2019 09:39:22 -0700 (PDT)
X-Google-Smtp-Source: APXvYqz5VyrC6SiYM/74oJfHtyK7ObhVNBzBYkd4pPwgNpnIJoUM2lWN9ekFhyhrZSORDKMVrjjF
X-Received: by 2002:a17:906:58d:: with SMTP id 13mr24074839ejn.36.1558024762015;
        Thu, 16 May 2019 09:39:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1558024762; cv=none;
        d=google.com; s=arc-20160816;
        b=lJp7EDS6fSuxnPjKNi8QnbS+RWuz4TRyL6hnctNlfe4WelQykwszgetY2MjVG928VX
         bnG3/SxTjChZ8VwXSdGWKVAPgxrFXwYTXIXlbjhK5N1kANHyMjE++dZndGpv1H1/nmid
         YeN/yzHAeYfTKkaWwWWYOs532KK10Rs4sXWv6NqYPwy8SA/oNdom8fRsCWb1wRsyLz9+
         xoDq6oJkyIbgR5NKjzl/iy290PgrjDufDNeg5JeJtYspjvIe8g617R2WyiRb0QLoaLl7
         RyRflJAkoqkoD6LEsP3Y4NxzPae0iSUfws0531UQkbBGU6fCRuG1DesCSSzYgHyRaywD
         UNLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:message-id:date:to:from
         :dkim-signature;
        bh=MME9Oi3lbo4MAHkzTc5YE7+1fkWaadRrcOOldw06nOU=;
        b=RALUqGf6xtQ+NPcefMEoCkeuqi8yHiUit0wyDVL3c4iMXzLe73ui2WpNGWyb37+rXT
         aUfxYaNd2g9J626HUtxVn52ctUelglkjMrj0e3B3+5slMemTx6Y5oWYkEvdgNfznCd2V
         CizhQpKbE7mUOdAUeNzRVYVtOw9GmZoYoAoAVOsyfZTHHHJwIGYP750kJFpcbs4R67UH
         VeOwJhAV1htCUHd0QJ/EBVmPsQtuOpbfeers3jO+ASD3jv3X08ZE2hKjvMFtj+dhTSln
         a46ekDaz+4418xpnMaS/HZvRem4BlaqCi7B0sg6cAYybECcC5xqU+zyZQcYg/hYeIXVt
         V8rw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=c1EsU55i;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w11si665300edb.418.2019.05.16.09.39.21
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 16 May 2019 09:39:22 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=c1EsU55i;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([127.0.0.1]:60877 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hRJPd-0004MS-2D
	for alex.bennee@linaro.org; Thu, 16 May 2019 12:39:21 -0400
Received: from eggs.gnu.org ([209.51.188.92]:51763)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1hRJPM-0004MB-HF
	for qemu-arm@nongnu.org; Thu, 16 May 2019 12:39:05 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1hRJPL-0002kU-1t
	for qemu-arm@nongnu.org; Thu, 16 May 2019 12:39:04 -0400
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442]:43688)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1hRJPK-0002kC-Qn
	for qemu-arm@nongnu.org; Thu, 16 May 2019 12:39:02 -0400
Received: by mail-wr1-x442.google.com with SMTP id r4so4112435wro.10
	for <qemu-arm@nongnu.org>; Thu, 16 May 2019 09:39:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=MME9Oi3lbo4MAHkzTc5YE7+1fkWaadRrcOOldw06nOU=;
	b=c1EsU55iMq+G5ZVcp1lYVXDVOb7ReiW8ApKU2iubMgou/I5Vh/8yFAuWVjoyqnT6oy
	mN5tSWtJyFw1hVe5psFpXwdePy7DK1ZFxKlXEcUqU4tQdr+IWcnkph646AKOEuO8pP07
	v8Q1LwaeV5hHS+4KkgFYLgS1iKk/BgtaC++O+pxbf+nkZUUNPwFTEf2MVOZX4ZptGS7Z
	Kjq9T8rlGkJSnUfb+/TbTTgDDOh2XhiiKgFKK0LntB+jiJ8Q+apwldqqiD47aiqm7oCC
	J9ZYrGX/ZrwiNNEk6NilB+KC/mwQ9B2/8/6/Ubwx3v6Ll0kinppPooAVbJlTVCfQnDuW
	YJbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=MME9Oi3lbo4MAHkzTc5YE7+1fkWaadRrcOOldw06nOU=;
	b=cKOoFmw0SuZrMW1Xev6iedtr+uqAmG9X9qfDv4VljmcrSLY09N9FPHXMel+YS1gbfv
	lQZfzJDCyvBXaQDo1SGjEpvhBUa3aN3RiHdjp9VykK5Ggj8hQlO5xiUAXSZc7ss44vfa
	t2zC19mrj9LAPiKXjuqwUNhbgS4BQQH+BofUoyCd+eq26ez29Jwp+3F2u0VSyzi3jO3e
	T7DHbUA6alWp3lF7401YOkbHnV15+uSJqIEezGjFHciRpTbdmpCqNecf+p7PmGcPK0ai
	3CriMwFoh7C9lQTr0VitH9WaYcTbxrvRF6i/TSSkicQ70kbdKvfJrfXJ/V3cwVeVN7wP
	ziww==
X-Gm-Message-State: APjAAAVD9TQ6wnwpQSeRp3vQPh+Y2I+EiMEabWyc17b9sLsHuBO4LLBk
	ex1jRt9onyTrmBGpTeKiNXkEtmzltJY=
X-Received: by 2002:a5d:68d2:: with SMTP id p18mr24540206wrw.56.1558024741179; 
	Thu, 16 May 2019 09:39:01 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
	by smtp.gmail.com with ESMTPSA id
	y130sm6702844wmc.44.2019.05.16.09.39.00
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 16 May 2019 09:39:00 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Thu, 16 May 2019 17:38:54 +0100
Message-Id: <20190516163857.6430-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::442
Subject: [Qemu-arm] [PATCH 0/3] arm: Clean up and rename hw/arm/arm.h to
 hw/arm/boot.h
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 3HMveuFhwvD2

The header hw/arm/arm.h used to be a general bucket for
putting all kinds of arm-related declarations in. It now
has mostly kernel-boot related declarations, with one
exception: the declaration of the system_clock_scale global.
This patchset:
 * moves system_clock_scale to armv7m_systick.h (since that
   is the only device that uses it)
 * deletes some unnecessary #includes of hw/arm/arm.h
 * renames it to hw/arm/boot.h, since it now only has
   declarations relating to hw/arm/boot.c functionality

Since system_clock_scale is a weird thing, I have included
in the first patch an expansion of the comment describing
it to be clearer about what it does, and also a TODO note
sketching out how we could go about eradicating this global.

thanks
-- PMM

Peter Maydell (3):
  arm: Move system_clock_scale to armv7m_systick.h
  arm: Remove unnecessary includes of hw/arm/arm.h
  arm: Rename hw/arm/arm.h to hw/arm/boot.h

 include/hw/arm/allwinner-a10.h    |  2 +-
 include/hw/arm/aspeed_soc.h       |  2 +-
 include/hw/arm/bcm2836.h          |  2 +-
 include/hw/arm/{arm.h => boot.h}  | 12 ++++--------
 include/hw/arm/fsl-imx25.h        |  2 +-
 include/hw/arm/fsl-imx31.h        |  2 +-
 include/hw/arm/fsl-imx6.h         |  2 +-
 include/hw/arm/fsl-imx6ul.h       |  2 +-
 include/hw/arm/fsl-imx7.h         |  2 +-
 include/hw/arm/virt.h             |  2 +-
 include/hw/arm/xlnx-versal.h      |  2 +-
 include/hw/arm/xlnx-zynqmp.h      |  2 +-
 include/hw/timer/armv7m_systick.h | 22 ++++++++++++++++++++++
 hw/arm/armsse.c                   |  2 +-
 hw/arm/armv7m.c                   |  2 +-
 hw/arm/aspeed.c                   |  2 +-
 hw/arm/boot.c                     |  2 +-
 hw/arm/collie.c                   |  2 +-
 hw/arm/exynos4210.c               |  2 +-
 hw/arm/exynos4_boards.c           |  2 +-
 hw/arm/highbank.c                 |  2 +-
 hw/arm/integratorcp.c             |  2 +-
 hw/arm/mainstone.c                |  2 +-
 hw/arm/microbit.c                 |  2 +-
 hw/arm/mps2-tz.c                  |  2 +-
 hw/arm/mps2.c                     |  2 +-
 hw/arm/msf2-soc.c                 |  2 +-
 hw/arm/msf2-som.c                 |  2 +-
 hw/arm/musca.c                    |  2 +-
 hw/arm/musicpal.c                 |  2 +-
 hw/arm/netduino2.c                |  2 +-
 hw/arm/nrf51_soc.c                |  2 +-
 hw/arm/nseries.c                  |  2 +-
 hw/arm/omap1.c                    |  2 +-
 hw/arm/omap2.c                    |  2 +-
 hw/arm/omap_sx1.c                 |  2 +-
 hw/arm/palm.c                     |  2 +-
 hw/arm/raspi.c                    |  2 +-
 hw/arm/realview.c                 |  2 +-
 hw/arm/spitz.c                    |  2 +-
 hw/arm/stellaris.c                |  2 +-
 hw/arm/stm32f205_soc.c            |  2 +-
 hw/arm/strongarm.c                |  2 +-
 hw/arm/tosa.c                     |  2 +-
 hw/arm/versatilepb.c              |  2 +-
 hw/arm/vexpress.c                 |  2 +-
 hw/arm/virt.c                     |  2 +-
 hw/arm/xilinx_zynq.c              |  2 +-
 hw/arm/xlnx-versal.c              |  2 +-
 hw/arm/z2.c                       |  2 +-
 hw/intc/armv7m_nvic.c             |  1 -
 target/arm/arm-semi.c             |  1 -
 target/arm/cpu.c                  |  1 -
 target/arm/cpu64.c                |  1 -
 target/arm/kvm.c                  |  1 -
 target/arm/kvm32.c                |  1 -
 target/arm/kvm64.c                |  1 -
 57 files changed, 74 insertions(+), 63 deletions(-)
 rename include/hw/arm/{arm.h => boot.h} (96%)

-- 
2.20.1

