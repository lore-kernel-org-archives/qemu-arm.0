Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp437255lfp;
        Wed, 5 Feb 2020 10:32:02 -0800 (PST)
X-Google-Smtp-Source: APXvYqxpvIH2MgUwfXgDeIkfaPUVHJo5gaoh9UfkjyApD/7iS2mCOOGurzitpShPV4myueQ9/g2X
X-Received: by 2002:a37:a914:: with SMTP id s20mr34462226qke.270.1580927522495;
        Wed, 05 Feb 2020 10:32:02 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1580927522; cv=none;
        d=google.com; s=arc-20160816;
        b=pCGr71iHtcvVwPJxnEtm6G4LNeByGcDQHhkFXQr766J8hMrm7WsGAF9M3CNHI7ysr2
         0dQgD8zju7HLxUQm8qnWWRKOzJgXYlvq4HkgXnulkAcpvN7RnvObLXmCu156255E3G7z
         id6tD+FpmCUN8joj5VQ5eyZ83Na+jPNX9SMjYLW8EIYYbL3Xet2sRk+qai801pF08bZ4
         AKlEG+4MyfajgcXyQPijNwS4VAfk0E87a2HGiQi4Wk/OM5hRom7s0dwzgum/jfxMsMxg
         7IQnKF27WgMYepRkg4kNAsYg8ejATmRWggYAsY/45M21jZ8GPcdYbUV2tPJroplkC8sI
         I//w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :mime-version:dkim-signature;
        bh=y3lSER5qnSPUnHhmmZimK9rvBDv/nkxykzxqVs5RiKs=;
        b=nvSbKde4U+BvPv0Zta57F0XdKn8JYn63cPrkGM75jF6dVecgsfyhUeBbFb7P/bq4I4
         0wQ++9Jl1XVAFaS454WySSjHJm6X6euq1ZipejeK5dMoCfDHDeDD7hZVhWlXFuSL4ess
         sNyNXWw8T3uzfmlsp0ZBUdLdmAkqVWOKS377xYCv6Akk/rZDFMCrNXQCLLADkkiv1dOc
         IJmf0DQ1H8uxysA2PwHhCpN4giUJlC5vCZGuwpfA2AXIVFwgegxa52thgaBLFprA5SgY
         ronGb+KQoh+qFan5tI4uBUmqv98MDJ/CbBUqzZ7uChRZlQyt/YCDeYgSieHu5WQKR9TF
         YBbg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=WOSA7ByU;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g21si220557qtp.41.2020.02.05.10.32.02
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 05 Feb 2020 10:32:02 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=WOSA7ByU;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:54922 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1izPSz-0008Ir-TQ
	for alex.bennee@linaro.org; Wed, 05 Feb 2020 13:32:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41853)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <josemartins90@gmail.com>) id 1izNgL-0006EE-1M
 for qemu-arm@nongnu.org; Wed, 05 Feb 2020 11:37:41 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <josemartins90@gmail.com>) id 1izNgK-0005Bh-2A
 for qemu-arm@nongnu.org; Wed, 05 Feb 2020 11:37:40 -0500
Received: from mail-io1-xd35.google.com ([2607:f8b0:4864:20::d35]:45290)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <josemartins90@gmail.com>)
 id 1izNgJ-000560-UB
 for qemu-arm@nongnu.org; Wed, 05 Feb 2020 11:37:40 -0500
Received: by mail-io1-xd35.google.com with SMTP id i11so2803903ioi.12
 for <qemu-arm@nongnu.org>; Wed, 05 Feb 2020 08:37:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=y3lSER5qnSPUnHhmmZimK9rvBDv/nkxykzxqVs5RiKs=;
 b=WOSA7ByUUrFwqbuZFBT4P3qZZWu/rtOW1KB580AXQNSnxwT9N+wkHfEqF1ME5xHXNY
 RFcsmVpwSWVFIH8ielyXHrVtPu+cHsLlB38T/g4peC83D7qP0Fk7p9grVZJfLeb8HdXm
 XPfx2Nr9TGhwwOZKDaLtmw/K3n2TN7UY8fipgk9EMAVBl6qm6uMkWnA6sGvGE7CAAAkj
 05nT9ycqoxVVGwDVoSVwKYKbttDG9IlrHGrgO5BuwdALFlGjLlOc8ckQFFGuI+m4GwHO
 DevCUfA6JUpwtJqIjRkFJOzUQ/hfQvSfFBDiq/xzV29YHXY9tVhmil+OC2MiqskdmMhX
 7aLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=y3lSER5qnSPUnHhmmZimK9rvBDv/nkxykzxqVs5RiKs=;
 b=KLfa9KF+Fo22mDLVtQmOBJdSJdc9XnOBotqtpOJAzDQkCV5x/ywuckwPGPVx34Xd+S
 VqoFQexu8kqX3RgMAALlVKr+PUAIO1RecSbBuo2ypTpNhNKOuPYmRoN6uRMl/sd5d+Pm
 QsF1tpXYNPkkKAz04lzLIavIpo7jAtVZIqoaEcFirkZppCKAOBkoND5gTndQPnuPqbX3
 iRKpzQfYem75hsS/xqPUenRRR3bZCnOQ9VRV7QFWo/AxwqTKSuMjjRIpnGSFpJ/aly1h
 uPYkCvD4SyrKLndS60O7U7aQIVKvETiNOAp8esQ0b+AlMaysXld7npEULYwE+cQiOkQd
 eslw==
X-Gm-Message-State: APjAAAVULPxaUgMJ8SIztLK+nSNpKZ36uEROBtOBIDLPUvv0WLmMkNzY
 z/pD2VrG+pMm6npgURQS5Jep+mueJRuSBPZcujQu2BTfAtU=
X-Received: by 2002:a6b:c9ca:: with SMTP id
 z193mr27856691iof.276.1580920658158; 
 Wed, 05 Feb 2020 08:37:38 -0800 (PST)
MIME-Version: 1.0
From: Jose Martins <josemartins90@gmail.com>
Date: Wed, 5 Feb 2020 16:37:27 +0000
Message-ID: <CAC41xo2pUsuzOBAG2fFwYiF8cK=cN+0pZYY+-2GTxamhxSw1gA@mail.gmail.com>
Subject: gicv2 virtual interface alias base address
To: qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::d35
X-Mailman-Approved-At: Wed, 05 Feb 2020 13:31:50 -0500
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: jtwATzjwf1fE

Gicv2 specification describes a mandatory global alias region through
which any virtual interface can be accessed by any cpu. Looking at
arm_gic_realize function this region seems to be implemented ( /*Extra
core-specific regions for virtual interfaces. This is required by the
GICv2 specification */). However, I cant figure out what would be its
based address on the memory map. I'm using the virt platform. Can
anyone help me with this?

Thanks in advance,
Jose
