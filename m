Received: by 2002:a5d:6782:0:0:0:0:0 with SMTP id v2-v6csp2820843wru;
        Thu, 2 Aug 2018 22:23:21 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpexG8tOVaAdlg2Kw2APQ5dpCu1/fvhOlgKh2ixqoZzduN4gayUJ19t12JJkwE8ixVaGFmWa
X-Received: by 2002:ac8:290a:: with SMTP id y10-v6mr2407439qty.42.1533273801847;
        Thu, 02 Aug 2018 22:23:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1533273801; cv=none;
        d=google.com; s=arc-20160816;
        b=vzSHBzYicH13F4VBgXYV/1V7dvu8AuciSeDuPci8EMrhGmueEber8iD2w05mUxFuHE
         AIFSSZ/0TpYh3RiP1hNebYkdp+vUzEmFkcnn4d9f4lJ95pneDBMADoKqdt1OiMoo0ABz
         DjXnFrsupNpPy3VT5a19txRUjBSCLV4ZMZrrZVceIKGa+ynltSZKg+iYl5f0zugnUwne
         YhcFOX2sYXQQXmeS/NKeoBZSd9X8TkFErNYza2vOndD6ru7QBs+a2fQuKl6O8Gj4RaTe
         2PWqi/S7QPMyr6C012hgYowysCMckYmHOopfNHxj2fZ+qFPpfzIoshCH0tdVdsWhxVZQ
         Xaeg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:message-id:date:to:from
         :dkim-signature:arc-authentication-results;
        bh=W4xRqbIaN7lU6IcAs5txxjmzBkF8l08UbM4unAuC3OI=;
        b=dq1HkHXMMThpnvOiR3x9D3Ee6/8zgc9CLtlrcvlIPXMdLq3o+eRJqH2vbcp8tPn1J6
         Jep/UA2MAlWJXNNRWBU8JII+Xo49PTsC+z6Q7IqkOAnh1U6BoZayPuHtYkQYH4vCdw2h
         cxAk8H2Do0mfiS6awJMeFc1UwG8MdQsIbjUopIb3kGIqEMw1QSHGfsXr83l37pyQ4obN
         Nra/4pGXpT04VnbRz7p3iWAiOvmxPYmZM0ZOFTmBiA4R1VaTujdgnhFxhBcIwjgL8Pkw
         Ao8uJVmm6An3LWv/8UvXmk3jto/9AwFPIy4spk7ZLg/iOfqlmWUeJNjMpjJUaF4eLHMq
         kcyA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=KR1uoZ74;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id w9-v6si825743qvk.136.2018.08.02.22.23.21
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 02 Aug 2018 22:23:21 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=KR1uoZ74;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:49002 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1flSYb-0002UR-9K
	for alex.bennee@linaro.org; Fri, 03 Aug 2018 01:23:21 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38881)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <joel.stan@gmail.com>) id 1flSXE-0001Y7-0a
	for qemu-arm@nongnu.org; Fri, 03 Aug 2018 01:21:56 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <joel.stan@gmail.com>) id 1flSXD-0004qQ-6s
	for qemu-arm@nongnu.org; Fri, 03 Aug 2018 01:21:56 -0400
Received: from mail-pl0-x244.google.com ([2607:f8b0:400e:c01::244]:45508)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <joel.stan@gmail.com>)
	id 1flSX7-0004oa-8q; Fri, 03 Aug 2018 01:21:49 -0400
Received: by mail-pl0-x244.google.com with SMTP id j8-v6so2033935pll.12;
	Thu, 02 Aug 2018 22:21:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id;
	bh=W4xRqbIaN7lU6IcAs5txxjmzBkF8l08UbM4unAuC3OI=;
	b=KR1uoZ74vLaa6rgcENGMlP+jXOJBZBgixaJsZPHDDGlofOxlmidif2eIrGoXlxbuI+
	jCcPHPPw43ot8NJQVryYSQeic9Ej1aQnb0HBBQYgW6aP2L5RmZ3ELcHnTqDnl7dniYBN
	q2SALbmPSEsFLSjo4oAaG9zYz5eagQc2LyFRfKMohAgn4CHQS0ISSCasasgLd1RL6xDQ
	ntSYlrQeU0kbxkJSKDjXHe8CPKs9xWRtRtBBcXxoppqxIJ94ITMk3gWpJMz1RVdOAW1s
	4xg5pOo4+zyRnle5I5xvxrIC3qk7wWzJiUgF/WmFanRI3vtqsmZe8RBcjtxzcVpGQexK
	v98g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id;
	bh=W4xRqbIaN7lU6IcAs5txxjmzBkF8l08UbM4unAuC3OI=;
	b=SZVAp8+pV7VvcMafVTjiyc1/B+hK6OilXnmE9eeWJv+vw5XFQstChebvqzlBapRwvv
	A15S3usS1PSximImr6HliU41BZ6eCud9fjzCEyU6F12c6ESksE2fiHFFdMtqjBs3l3kB
	6if8hgJSoXYRcfOvDDToGAq6eWLebsz4GYRX5jBubtP2NrQuLMhAAqEXCXxKvvUeioZ5
	JbwSXAeN+J/Krwb6XB3G47SIE4lttol6t0JBgJawKSci2zehF8s/LTG07DW0fhl73g98
	W/7TCJApiSZkVAHw4SEFzN66e6RdhQUbgdMtR3otgoPBnRBdrxC1yw+F0Wye9+R4hQLo
	0W4g==
X-Gm-Message-State: AOUpUlH3ScMw2rZQUp40upwWfj6C5Hu8dwOqV5YJIBsRieI1/KP+x+5L
	39YVD74NrhsvyiKmT912OMY=
X-Received: by 2002:a17:902:15c5:: with SMTP id
	a5-v6mr2104849plh.137.1533273708123; 
	Thu, 02 Aug 2018 22:21:48 -0700 (PDT)
Received: from aurora.jms.id.au ([45.124.203.18])
	by smtp.gmail.com with ESMTPSA id
	v20-v6sm9210680pfk.12.2018.08.02.22.21.43
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 02 Aug 2018 22:21:46 -0700 (PDT)
Received: by aurora.jms.id.au (sSMTP sendmail emulation);
	Fri, 03 Aug 2018 14:51:39 +0930
From: Joel Stanley <joel@jms.id.au>
To: Peter Maydell <peter.maydell@linaro.org>
Date: Fri,  3 Aug 2018 14:51:34 +0930
Message-Id: <20180803052137.10602-1-joel@jms.id.au>
X-Mailer: git-send-email 2.17.1
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c01::244
Subject: [Qemu-arm] [PATCH v4 0/3] arm: Add nRF51 SoC and micro:bit machine
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
Cc: Stefan Hajnoczi <stefanha@gmail.com>,
	=?UTF-8?q?Steffen=20G=C3=B6rtz?= <contrib@steffen-goertz.de>,
	qemu-devel@nongnu.org, qemu-arm@nongnu.org,
	Jim Mussared <jim.mussared@gmail.com>, Julia Suvorova <jusual@mail.ru>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: AuXcRFBQcFwX

v4: Fix number of IRQs
Based-on: 20180725085944.11856-1-stefanha@redhat.com

This short series implements a minimal definition of the Nordic
Semiconductor nRF51, a Cortex-M0 ARM SoC, and the BBC micro:bit, a
machine that will use this SoC.

This work will serve as the base for our Google Summer of Code and
Outreachy interns who will work on implementing a number of features on
top of this base.

I've tested this with a microbit micropython firmware, and checked that
it starts running by looking at it with gdb.

I chose to keep the nrf51 and the microbit seperate, to not confuse the
peripherals that are on the microbit but are not part of the nrf51, and
vice versa.

Joel Stanley (3):
  MAINTAINERS: Add NRF51 entry
  arm: Add Nordic Semiconductor nRF51 SoC
  arm: Add BBC micro:bit machine

 MAINTAINERS                     |   8 +++
 default-configs/arm-softmmu.mak |   1 +
 hw/arm/Makefile.objs            |   1 +
 hw/arm/microbit.c               |  54 +++++++++++++++
 hw/arm/nrf51_soc.c              | 119 ++++++++++++++++++++++++++++++++
 include/hw/arm/nrf51_soc.h      |  42 +++++++++++
 6 files changed, 225 insertions(+)
 create mode 100644 hw/arm/microbit.c
 create mode 100644 hw/arm/nrf51_soc.c
 create mode 100644 include/hw/arm/nrf51_soc.h

-- 
2.17.1

