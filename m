Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp113238wrt;
        Mon, 10 Dec 2018 19:11:21 -0800 (PST)
X-Google-Smtp-Source: AFSGD/Vezvm7GhW+LYL8qkhECr4vHKCr3B7Q/O/iNQXJ5bdL38jXIeuzKuWejk52AUxosd1NBQdp
X-Received: by 2002:ae9:dc43:: with SMTP id q64mr12904445qkf.223.1544497881446;
        Mon, 10 Dec 2018 19:11:21 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1544497881; cv=none;
        d=google.com; s=arc-20160816;
        b=E5YAyr7rpDyYQIspdS4mMvl2l+C5XBAx/YmHMzpN21BpRaAzWx4zz3GczcUcX6G2aS
         deWP3/sTr6LDL8IdUimBJ9KqGlq73bmxuyH+RrUbRpEivTeEuNnb0641FQPVBm3XJ/VD
         xfHNmvUzCdcjLNNygk/p4tkZ6noX1DofjYEas93v9wyUQBdUjT/UqPo4RWdsEtVr1otn
         nlpRMn9P6wM1sza9P9zmSk4/yC6WliSZvnTqTpPEDpro3DyHjz+nna72Vh0Y9fsk4aG9
         P5QDiXO6rwPCpperR/6OTsasx0z+b02LxCSKuQ1JwsDhzaXNSCS007RE0YbuoR/8SHWp
         uksA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:message-id:date:to:from
         :dkim-signature;
        bh=M7YlWbKS2Ws/iXaWS29PWzogSvXy2fCaDYzbGVsIWL8=;
        b=g9jBLsSd5F6+e8BuP2tvmc/bBEs4Lr5uyimIU3rQA4pubUtzPEvfn/09Irf3W/aZPt
         fuqwBiViVo4v9jLp1yoirJhW3aamO2FDF5FHIQ4z/tOvCCPDCOLmy0DGOL2V/4vCIo7e
         KqV+G3Dp+ddZYyQ5W2uinFEKjL6iON7wW8vDQAc4Q7d+VVpwq8cA1AWfFCehNh4QUEfX
         Vf3/g4h3zpvyg/7bShCWFDxgYP52pbJZO4Wa0pNdsBEo10XJgTF8469cMSFXst+eodou
         9x4PGVFINNuTUb44V43vMVdQYFdgdEZnkObrNzH+IsOeJwms6t3J4aDyW1Zpv49SpqEM
         ZxJw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b="M4qR/iwT";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id q8si2753996qvr.202.2018.12.10.19.11.21
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 10 Dec 2018 19:11:21 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b="M4qR/iwT";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:35731 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gWYS8-0003Ny-Sy
	for alex.bennee@linaro.org; Mon, 10 Dec 2018 22:11:20 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41055)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <joel.stan@gmail.com>) id 1gWYRu-0003NU-Jt
	for qemu-arm@nongnu.org; Mon, 10 Dec 2018 22:11:07 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <joel.stan@gmail.com>) id 1gWYRp-0005Cw-EI
	for qemu-arm@nongnu.org; Mon, 10 Dec 2018 22:11:06 -0500
Received: from mail-pg1-x544.google.com ([2607:f8b0:4864:20::544]:40506)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <joel.stan@gmail.com>)
	id 1gWYRp-0005Bv-57; Mon, 10 Dec 2018 22:11:01 -0500
Received: by mail-pg1-x544.google.com with SMTP id z10so5949774pgp.7;
	Mon, 10 Dec 2018 19:11:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=M7YlWbKS2Ws/iXaWS29PWzogSvXy2fCaDYzbGVsIWL8=;
	b=M4qR/iwTZVzOW7mzGQ3ZQBak+oXHV7wZldm/F5FJ4+0v6FknS4Gedt3y3+AcM0/mnt
	98PwcVUxB3vSQohYAHk8POX4LGDUwdhIi951OXObKqpU0aIShMiYktYYHRolnWdtCesL
	TXMxlYiZ6gCBznDljVkDioAXi1iPRdmXf5kn5VW8WpVBo3SjBlNHU1s0jW8bvIzK2qg4
	fr4KUJEKZISTYz1rnmukcqeV7C4MziZBzXfq8MNkGgyb/jXNFl70dJQD1xk/k5ZOGckw
	f73QFVs90qz2HQ1xvxvpxV1MG00zf9pio1kaqeZPEuh/uOGIBW6kZRQCyude0v3vEab9
	e80w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:mime-version:content-transfer-encoding;
	bh=M7YlWbKS2Ws/iXaWS29PWzogSvXy2fCaDYzbGVsIWL8=;
	b=jBNgOkNYP9UAw4ezFg/3CZGxSv6EgMsfrsD070egm3tser5cxFBud7sTnIwxJt8XtM
	4L6l1i85/fUvM6pTgCb6PB40i23QTpuSn/MN2Gp+sqZSjK2VTW+85vo+diTiOXVB1RfI
	Zbt2RLch+IJ9DHhrkfyZutgQTB6JZhxXZApTKZzTE/RDMH89wu3NZR13ZH+409SwJUtF
	pwLwfbzQ9oZ2w7E5mM/DlloHDwUYzrIdMvh9UtFD7QbdHXcXILAZShkD5dRXz5oM8Gxs
	fSpK/yZVXc+y09d49OnXVEN31ng6YFYiWijLStRdBiqZtJvbjWfSm1yQ2dPNKhuKw9SW
	jT9w==
X-Gm-Message-State: AA+aEWYlvaLXhTHdpev6KJBfCEx0cmD74Q1dTChpPmOIbb9lBo7J4h+M
	EpqvIevz9yJx91jFn/lkgyQ=
X-Received: by 2002:a63:790e:: with SMTP id u14mr13069741pgc.452.1544497859983;
	Mon, 10 Dec 2018 19:10:59 -0800 (PST)
Received: from aurora.jms.id.au ([45.124.203.15])
	by smtp.gmail.com with ESMTPSA id
	12sm12835482pgd.35.2018.12.10.19.10.56
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 10 Dec 2018 19:10:59 -0800 (PST)
Received: by aurora.jms.id.au (sSMTP sendmail emulation);
	Tue, 11 Dec 2018 13:40:53 +1030
From: Joel Stanley <joel@jms.id.au>
To: Peter Maydell <peter.maydell@linaro.org>,
	=?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Date: Tue, 11 Dec 2018 13:40:42 +1030
Message-Id: <20181211031044.27628-1-joel@jms.id.au>
X-Mailer: git-send-email 2.19.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::544
Subject: [Qemu-arm] [PATCH 0/2] arm: aspeed: Allow the guest to exit
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
Cc: Andrew Jeffery <andrew@aj.id.au>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: EiZ58bw1u/36

This series adds a feature to the ASPEED machine that allows the guest
to cause itself to exit. It was tested with romulus-bmc and palmetto-bmc
with a Linux kernel as the guest.

To test:

 cd linux
 $ export ARCH=arm CROSS_COMPILE=arm-linux-gnueabi-
 $ make aspeed_g4_defconfig
 $ ./scripts/config -e CONFIG_POWER_RESET_SYSCON_POWEROFF -e CONFIG_POWER_RESET
 $ make -j$(nproc)
 $ qemu-system-arm -M palmetto-bmc -nographic \
    -kernel arch/arm/boot/zImage \
    -dtb arch/arm/boot/dts/aspeed-bmc-opp-palmetto.dtb \
    -initrd ~/buildroot-arm.cpio.xz

Joel Stanley (2):
  aspeed: Add syscon-poweroff to guest device tree
  aspeed/scu: Implement power off register

 hw/arm/aspeed.c      | 33 +++++++++++++++++++++++++++++++++
 hw/misc/aspeed_scu.c |  5 +++++
 2 files changed, 38 insertions(+)

-- 
2.19.1

