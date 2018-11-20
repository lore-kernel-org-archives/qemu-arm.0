Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp620741wrt;
        Tue, 20 Nov 2018 06:23:07 -0800 (PST)
X-Google-Smtp-Source: AJdET5eHWeqLZVvi9O5qcIdQXcvGNnfCL3i31BfoN7l88OP08z128z3ABgjVxB4cnZORyJ0N7U8D
X-Received: by 2002:a0d:f302:: with SMTP id c2-v6mr2041201ywf.337.1542723787573;
        Tue, 20 Nov 2018 06:23:07 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1542723787; cv=none;
        d=google.com; s=arc-20160816;
        b=1GFD69DY7qQYrtCKVWgVgab5n0GSMHwXam7KJFcM/urQfkbaclYOyq6WwqQu6kqj9K
         qMuJi58nVj6WTwGh70IhfADVCzbvi1p+Y+sZ4HgnB4Xc8GtlwIc8JK7UuiY9G3IAJzab
         gmbUgpjzXqwqi5+ELwp+4FkoDeX/AWtGGQ2LOIyALJkQddHsAqYou0n9LQrB+eXE1XBP
         GgJIEX3EpVREWaown+XOq5AwyVV+xga84XILn+G/qaB6v0lWDbUeyWSg7/J8qZYvNaxv
         /1KLfu7tOcjfb4kTDKvdiH2cIqIGYbhzyteThGdndzD9VWCK2eRbc41UdZ3Qp+AsT9P+
         sY5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:to:message-id:date:from:references
         :in-reply-to:mime-version:dkim-signature;
        bh=ffLNgoLvQu6kGCK4YZEvVdpoAy47U2uC4fsHx7UcpaM=;
        b=YCS/reiN02A90ZjVOnyBogUw9Xio94JIvIEhHOCDIzz72ukCKJYknvtDnroxtVrAPY
         BcJcOy1IIBRYouQ7mPYkXt68aKW4N0L/YgJL9rHIzn9iCwi7Nzi9muEhXw99zjHL/G4b
         6pMzXJZ1ONrCCp5RBQVuhbv0NGd6PuTs5iV8SDXByGbWiFyFNHEhs1bUpn/qMuqsB64F
         FDZGyZa1SgYyK4QNwbCHTOpKbnxi1pINWFgoHc+92i3KkGo9NhHPuzuVR4WqlnwtyE8a
         55fGXwGeBv+r2MdljQIoW6EU/ZR+UMo7EqYUp9wOYClc4siCWsqFrBFG7et/xiJCyCL2
         FcTA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="blcN/a1j";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id d78-v6si4355243ywd.281.2018.11.20.06.23.07
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 20 Nov 2018 06:23:07 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="blcN/a1j";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:34042 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gP6vi-0002p4-UU
	for alex.bennee@linaro.org; Tue, 20 Nov 2018 09:23:06 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37673)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1gP6vZ-0002od-EE
	for qemu-arm@nongnu.org; Tue, 20 Nov 2018 09:22:59 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1gP6vY-0001G8-M4
	for qemu-arm@nongnu.org; Tue, 20 Nov 2018 09:22:57 -0500
Received: from mail-ot1-x341.google.com ([2607:f8b0:4864:20::341]:47036)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1gP6vY-0001Fn-HX
	for qemu-arm@nongnu.org; Tue, 20 Nov 2018 09:22:56 -0500
Received: by mail-ot1-x341.google.com with SMTP id w25so1759571otm.13
	for <qemu-arm@nongnu.org>; Tue, 20 Nov 2018 06:22:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=ffLNgoLvQu6kGCK4YZEvVdpoAy47U2uC4fsHx7UcpaM=;
	b=blcN/a1jmGMkxRwHKzHzfjNq3srvf1nxHFVF5wDjTw7pvQgrzHfVUBB3VGZR2OXbW4
	InOArM6n2RGTN7eAjFXR8XiD8WR2dRA/+DFKYxl5rL0Pg9ocFFKZjaTtYpQi55/BYGaA
	/u9QjWeSBcFoQ0v7H+dpa0lpBWxei1CCnAIEA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=ffLNgoLvQu6kGCK4YZEvVdpoAy47U2uC4fsHx7UcpaM=;
	b=ho3vJ2QUFA33juN3dmygvt0eLKX/xVZa8FwxiZUAeVVV7AQRmHIw/PizRCNfRUcSHc
	OHZBFhH5DLXLzRKFjiullH1/Sy+JOQOVmCyyfKXoJyyQ37ByILzXLtYmmx1FCfjUvsG3
	iGoqAXQ21qBkvTUCR2mY8TaKwaOKa40UNja9ef471e9Un/Qfw7P14K1pKZqKiGrrMrP2
	tkl+UjPoqHZEzVOC8ItiOig0crJITOp5wC5SYl/svqzAxx5PebJ85efYVue54/7oyWI0
	ZjYXFlFzj0mbRf9xTtvBHnbe0v2LG/Z7Z+zHfshF1kqcY5AQnuHa0IcU4yRB2QKKW+76
	8jig==
X-Gm-Message-State: AA+aEWbvnYTq23gDRKfxGg1FiOlBJ6ZiVykf4f/5qFBO5X2E/RpZLKYB
	EJZ3bKZDwSHYuk+4YHkXR+Oaw8v4MxOH4jwerm3kJw==
X-Received: by 2002:a9d:12d:: with SMTP id 42mr1221670otu.352.1542723775861;
	Tue, 20 Nov 2018 06:22:55 -0800 (PST)
MIME-Version: 1.0
Received: by 2002:a9d:4b0e:0:0:0:0:0 with HTTP; Tue, 20 Nov 2018 06:22:35
	-0800 (PST)
In-Reply-To: <1542365406-81310-2-git-send-email-peng.hao2@zte.com.cn>
References: <1542365406-81310-1-git-send-email-peng.hao2@zte.com.cn>
	<1542365406-81310-2-git-send-email-peng.hao2@zte.com.cn>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 20 Nov 2018 14:22:35 +0000
Message-ID: <CAFEAcA_6ZpUaGPpzHy=gcH31_PRuQ-avWRs_4dRrFOj1mP4BUg@mail.gmail.com>
To: Peng Hao <peng.hao2@zte.com.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::341
Subject: Re: [Qemu-arm] [PATCH V7 1/6] hw/misc/pvpanic: Build the pvpanic
 device in $(common-obj)
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
Cc: Andrew Jones <drjones@redhat.com>, qemu-arm <qemu-arm@nongnu.org>,
	=?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
	QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: rm83sgGbUZL3

On 16 November 2018 at 10:50, Peng Hao <peng.hao2@zte.com.cn> wrote:
> From: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
>
> The 'pvpanic' ISA device can be use by any machine with an ISA bus.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>

Hi, Peng -- this should have your Signed-off-by: line
below Philippe's. This shows that the patch passed through
you rather than coming directly from Philippe.

Other than that,
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
