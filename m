Received: by 2002:a5d:4301:0:0:0:0:0 with SMTP id h1-v6csp7636065wrq;
        Thu, 28 Jun 2018 09:42:56 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpdvbK9wZ1XdDplwgog4U/rxnDnQfg/qLIznhJiKL6OM2X/hyliftvgqxKLAz/HH2l7YHbq/
X-Received: by 2002:a37:34cb:: with SMTP id b194-v6mr9718992qka.258.1530204176761;
        Thu, 28 Jun 2018 09:42:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1530204176; cv=none;
        d=google.com; s=arc-20160816;
        b=HuriM/hWKcEMUtuSLRnsPqI12TiP7EO+5Pax6KsJYbK73rPfu2gYgfQKmE+LqAHYwQ
         CW5+Q1QOHzKXDrx5m+dgQn5sU46YuI1iUFF4PXqwDhUy5ppenR+oJkJunBMtKFzlzFfy
         IZWC4rkOKqerbBxIqusswo/LevnmCNZ/+LpwcmH6C9VuY53Z4A/jcVSj1q4+q5nZKpV9
         1HVt758Uvws6USO6cHuYfWCLZ2PCD6QDws9+hv8KBG3yzJB3I5Vvt7JdHdPlQkEGS6s7
         9iNFITEUDh5KN1skF/4ZEVZCOdBlvNNtEeWbKdAOqMTQwaY+y70kt6ufol0CkaeLMmhG
         nFYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=6nLkirANBTc35lT+VwwTg6cuY+PF/5Xkl8QyG2S2Alo=;
        b=gztRoNslegeFDQR8yFWZWWy8f1jtJ7tdqC3y3O1CCFmNUca397ObaUWstx7A2xUabC
         JxryhR8GoK+b7CiIcj/vFa2DIAL0+y2UhN9V28ZkryT0hzV58kCiGJhPvScCtPxf+cUW
         daxjq9yITsXWnWmlCY42AFCL7FWewSh8jsV9OuP7OaygvEKvTaUsjHA9+J2SL0127WlD
         +Y6+T+i8Mcre5JRXg03QD6R9Jt0jJ+PdkvzWSc/JpgJfBd+8JguzZ6Srmkz2+I94ATw8
         MsgcrcKSJnOefWVmX1uR7wEE3hvpnjRlzON3n9Qy4AAxtWi0sXqYSklG9fvH7QdJX8ly
         Wn3g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=fqGEoMCq;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 2-v6si6634658qki.21.2018.06.28.09.42.56
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 28 Jun 2018 09:42:56 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=fqGEoMCq;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:37577 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fYa0W-0005H8-BU
	for alex.bennee@linaro.org; Thu, 28 Jun 2018 12:42:56 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51794)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fYa0O-0005Gx-Vd
	for qemu-arm@nongnu.org; Thu, 28 Jun 2018 12:42:49 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fYa0N-0006FA-Vg
	for qemu-arm@nongnu.org; Thu, 28 Jun 2018 12:42:49 -0400
Received: from mail-ot0-x243.google.com ([2607:f8b0:4003:c0f::243]:42984)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1fYa0N-0006EW-QG
	for qemu-arm@nongnu.org; Thu, 28 Jun 2018 12:42:47 -0400
Received: by mail-ot0-x243.google.com with SMTP id n24-v6so6843808otl.9
	for <qemu-arm@nongnu.org>; Thu, 28 Jun 2018 09:42:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=6nLkirANBTc35lT+VwwTg6cuY+PF/5Xkl8QyG2S2Alo=;
	b=fqGEoMCqZukwkFbnmUqjjv8LMLXYHkjXNP/hVz8mbZWrisCBnEw2TaE7BpSVwdLJxr
	ruy+R/NMTjy4IrngfBD0C+QjRuNB3msyrFF2TpihGXZFoL6qEZvNCoQfC0uZMA/hJjJf
	cLdiURcAMpp2XBVKJENZVWYKi97t/wp8uuD+c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=6nLkirANBTc35lT+VwwTg6cuY+PF/5Xkl8QyG2S2Alo=;
	b=jja8KsQ4TjeL3P6L78aWC2l/5WKSU137LbD81Rp2YQ2ykT6omglacRNMEVTutY0ooq
	fe6laOFl1eJoZYt3U259z9kls7F3ix0INM4VxktjmAZ/qTnot0y+kHHB9IRPExE6LLLZ
	zU1T4p2IRIuDC5k8RXlMlJFkLV9TabyRqZI7mYhvgxHSw4sqyTUae+/m1yJ1gsnHWxhy
	pCIip9EEfXwf4gsqoG7aiDl39P5T3GdIXRWbw4o1naby87L5JIEmpd5Zsp2tDpfwMkwi
	l6N6KTFRRh4vaE2cvd7Zw0k4j6QnEuEssiyrNxERvL/po5bt3GLp6/xDrGR18ey0RzCR
	MhAw==
X-Gm-Message-State: APt69E1ru0pbbsPdHezwaEL3xKZAs0z4a/YKF7fJovGMrbBBn+lrKCdP
	SzYv+AzmDT2gvCLRGQqmsXkxszJM5u+LPiGm01+7Str/
X-Received: by 2002:a9d:64c3:: with SMTP id
	n3-v6mr6964414otl.210.1530204167100; 
	Thu, 28 Jun 2018 09:42:47 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:902:0:0:0:0:0 with HTTP;
	Thu, 28 Jun 2018 09:42:26 -0700 (PDT)
In-Reply-To: <1529699547-17044-1-git-send-email-alindsay@codeaurora.org>
References: <1529699547-17044-1-git-send-email-alindsay@codeaurora.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 28 Jun 2018 17:42:26 +0100
Message-ID: <CAFEAcA8gS4GD0UYpR4nKRzF6eSSJd7F8fYw48UEsyQQUJxe8sg@mail.gmail.com>
To: Aaron Lindsay <alindsay@codeaurora.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c0f::243
Subject: Re: [Qemu-arm] [PATCH v5 00/13] More fully implement ARM PMUv3
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
Cc: Michael Spradling <mspradli@codeaurora.org>,
	Digant Desai <digantd@codeaurora.org>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Alistair Francis <alistair.francis@xilinx.com>,
	qemu-arm <qemu-arm@nongnu.org>, Aaron Lindsay <aclindsa@gmail.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: N7C/pEJ50FiW

On 22 June 2018 at 21:32, Aaron Lindsay <alindsay@codeaurora.org> wrote:
> The ARM PMU implementation currently contains a basic cycle counter, but it is
> often useful to gather counts of other events and filter them based on
> execution mode. These patches flesh out the implementations of various PMU
> registers including PM[X]EVCNTR and PM[X]EVTYPER, add a struct definition to
> represent arbitrary counter types, implement mode filtering, send interrupts on
> counter overflow, and add instruction, cycle, and software increment events.
>
> Since v4 I've added improved V7VE handling with Peter's direction, fixed up a
> few patch staging issues, and fixed a bug causing cycle counter overflow to be
> checked every instruction.

Hi; I've reviewed some of the simpler parts of this, but I
suspect I'm not going to get to the rest of it for a bit (the
softfreeze deadline is next Tuesday, so it's a busy time of
the release cycle for me). For the moment I'm going to take
patches 4, 5 and 12 into target-arm.next, which should at least
reduce the size of the patchset for next time.

thanks
-- PMM
