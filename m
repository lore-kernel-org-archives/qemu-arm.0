Received: by 10.28.173.206 with SMTP id w197csp2679803wme;
        Mon, 15 Jan 2018 04:46:14 -0800 (PST)
X-Google-Smtp-Source: ACJfBovzZGv9B2+kSa4dal5U3HlV0FiPd8u05FwO3gY+gjLyLGPfgMFsnz/0+dPPc++EmjKjob0F
X-Received: by 10.37.69.87 with SMTP id s84mr30484501yba.167.1516020374269;
        Mon, 15 Jan 2018 04:46:14 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1516020374; cv=none;
        d=google.com; s=arc-20160816;
        b=JR3Kd2Uj/qFczEXZXeapZAoNCq+WY9b5g7P8GYB4i6nXcAAe4GGrk4xMexZhPlR34W
         ZYmH7eMaotvV0Kb7ClyrRbIqlALg/iTVkMfeahz3XpWHStjM8o9mUFnLOYCDyvAo5Mp3
         6N5rf2QEblvrXYJ8uTYKXeZnrhQx8TkKeWby2B/8HyOwFg/53VjL5ACkWjt3dbG+PNXI
         LPndYRIrHGMmYE+nAMCGTpuc51keAhWlaDEoquUEggatfiszEEFIL2BTW+3stiWQ+4+Y
         +q2seOQFfB800HLqf141ihi10M0jw4UPZB8etSvi+CMtUoxqAXhZ+CFQJiDT7M3RNtfR
         4KAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:message-id:date:to:from
         :dkim-signature:arc-authentication-results;
        bh=avxTmlkGb3AeX/H3hM9PKyFnt7plPp8991nmOsfxYnQ=;
        b=PootGMxTzPO7/vXucI4ytvbQgh8NC2rmM3YHtUVdp+67EhQIvFWuWV+LYYebyl0nN+
         lfIGGYTI90gUxWAS9s2d/yjdeY6fQqA+DjzWuaVO+mrSB52vcBCCQ8mfDYecHwFskHyZ
         TD4nU8oHIH72uNk5t4s1XtuMb09HRA8wun+weBWLQ4C2R5ZEqzYFs+iZnmg9i3CztD45
         C/KaR3ENnbujzd61uHKG1KDgFIkjGu1Nq7KQ+TY2iKXcoXQS+d/FU8JbeZILYGCUaBGv
         XvTasuZiVZWKpvpubc4+nZBEtM/a+HUdrg8qj2JYXUWGTwyjFV2SNjUcDUZMWEKSGsnu
         lxog==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=YZX433AK;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id w12si684725ywi.497.2018.01.15.04.46.14
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 15 Jan 2018 04:46:14 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=YZX433AK;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:33650 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eb49V-0007Gi-O6
	for alex.bennee@linaro.org; Mon, 15 Jan 2018 07:46:13 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36861)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <ard.biesheuvel@linaro.org>) id 1eb49J-0007GO-Rn
	for qemu-arm@nongnu.org; Mon, 15 Jan 2018 07:46:02 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <ard.biesheuvel@linaro.org>) id 1eb49F-00028w-0U
	for qemu-arm@nongnu.org; Mon, 15 Jan 2018 07:46:01 -0500
Received: from mail-wm0-x244.google.com ([2a00:1450:400c:c09::244]:41497)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <ard.biesheuvel@linaro.org>)
	id 1eb49E-00027w-QF
	for qemu-arm@nongnu.org; Mon, 15 Jan 2018 07:45:56 -0500
Received: by mail-wm0-x244.google.com with SMTP id f71so1679072wmf.0
	for <qemu-arm@nongnu.org>; Mon, 15 Jan 2018 04:45:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id;
	bh=avxTmlkGb3AeX/H3hM9PKyFnt7plPp8991nmOsfxYnQ=;
	b=YZX433AKiTam95jpCOWKKEKnKq6fXQRMuIz/51Uu9w8f+ggMk/NkTNAJZubVbv4lpL
	qDw8pO742gPrjUXVQN9RIQDM/FiZI3aQq7vWh9/C/ZqeFs1lSLtZx+mW3QkTnd82jZgM
	hafRx74vXBWQFioYsyWoqBqG4j7GVzSRKF/+4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=avxTmlkGb3AeX/H3hM9PKyFnt7plPp8991nmOsfxYnQ=;
	b=EMFVZl3TmOV6m98QqB2EZOBcElm96GpK3+jpuimMSrNp9aC6GlGmjvqa84ZzHoH2zH
	05ULYJslTPVb1UE3wCwXHPLfmLWf2ctNAvlHv5719JhntHsQlO/VnIDcXk/QWIkRfKrA
	kyp/N+dKF0D9gYrMrZFS9Mjb/kcBTjg1dBD8cuwNF50H2pLwL54bJIoNkZzrLFFG0D4K
	q8dBvSNzumNnfuEzoCO7dTBPzrMEoy9F5OPFI+PQoHew3eQWs+oOg8meMkIvnI6Z4k+d
	7oYNAp0wbbVS1G4rNxUfn28+MRZ7yvRireadN6tIyyyd+9qA7AfiJHfxdCOrV6z96NC7
	L12w==
X-Gm-Message-State: AKwxytdhJY2fy6TfnrftmxyiJOsHMQvruPvJZaLG87MAz7LmhOQi+gks
	JJf1KVS3uYJ9JAZTc1TeSEIEFgWaVTE=
X-Received: by 10.28.116.16 with SMTP id p16mr6133764wmc.21.1516020354961;
	Mon, 15 Jan 2018 04:45:54 -0800 (PST)
Received: from localhost.localdomain ([160.90.52.105])
	by smtp.gmail.com with ESMTPSA id
	i71sm16816701wmd.1.2018.01.15.04.45.53
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 15 Jan 2018 04:45:54 -0800 (PST)
From: Ard Biesheuvel <ard.biesheuvel@linaro.org>
To: qemu-arm@nongnu.org
Date: Mon, 15 Jan 2018 12:45:43 +0000
Message-Id: <20180115124546.7253-1-ard.biesheuvel@linaro.org>
X-Mailer: git-send-email 2.11.0
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c09::244
Subject: [Qemu-arm] [PATCH v2 0/3] target-arm: add SHA512 and SHA3
 instruction support
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
Cc: peter.maydell@linaro.org, Ard Biesheuvel <ard.biesheuvel@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Y84AvQeER8R/

This v2 is a follow-up to the single patch 'target/arm: implement SHA-512
instructions' sent out on the 9th of January.

Changes since v1:
- update SHA512 patch to adhere more closely to the existing style, and to
  the way the instruction encodings are classified in the ARM ARM (#1)
- add patch implementing the new SHA3 instructions EOR3/RAX1/XAR/BCAX (#2)
- enable support for these instructions in user mode emulation (#3)

Ard Biesheuvel (3):
  target/arm: implement SHA-512 instructions
  target/arm: implement SHA-3 instructions
  target/arm: enable user-mode SHA-512 and SHA-3 instruction support

 linux-user/elfload.c       |  17 ++
 target/arm/cpu.h           |   2 +
 target/arm/cpu64.c         |   2 +
 target/arm/crypto_helper.c | 224 +++++++++++++++++++-
 target/arm/helper.h        |  10 +
 target/arm/translate-a64.c | 202 ++++++++++++++++++
 6 files changed, 456 insertions(+), 1 deletion(-)

-- 
2.11.0

