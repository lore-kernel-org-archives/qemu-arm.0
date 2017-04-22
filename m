Received: by 10.25.0.144 with SMTP id 138csp795383lfa;
        Sat, 22 Apr 2017 12:08:12 -0700 (PDT)
X-Received: by 10.55.220.193 with SMTP id v184mr13073970qki.42.1492888092279;
        Sat, 22 Apr 2017 12:08:12 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id z207si13626374qka.242.2017.04.22.12.08.12
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sat, 22 Apr 2017 12:08:12 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:36603 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1d20OB-0008NK-Mo
	for alex.bennee@linaro.org; Sat, 22 Apr 2017 15:08:11 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47633)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <k.kozlowski.k@gmail.com>) id 1d20O2-0008M3-3Z
	for qemu-arm@nongnu.org; Sat, 22 Apr 2017 15:08:03 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <k.kozlowski.k@gmail.com>) id 1d20Ny-00072V-0F
	for qemu-arm@nongnu.org; Sat, 22 Apr 2017 15:08:02 -0400
Received: from mail-wr0-f193.google.com ([209.85.128.193]:32945)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <k.kozlowski.k@gmail.com>)
	id 1d20Nx-00072K-Pr; Sat, 22 Apr 2017 15:07:57 -0400
Received: by mail-wr0-f193.google.com with SMTP id w50so11362765wrc.0;
	Sat, 22 Apr 2017 12:07:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=KspGebNBH/jrQiVtjNRG1EZXVo6ZYh+hK24t6+U+0mk=;
	b=mT7GpHdUd+eh5P8yQWxI8J8cpd8QqJjd/g2xGTh0YMOa4aJvPTplKUigAzJACIdvH2
	luauJ0881aIYVxE/ZdMAfA4KuowwnKMmDSWO/yQUsbW4X8XyJDxjc2VT2bM/RE4+vp5k
	S+mYAu7tV0GsqrBPj5BlRA9fLaN2iY2hn+tXdN8CZ1QGnBp0QkV2VcU8vtZALVEOYfnT
	aOj8SEhbibW0koqbhKobWpgJ14Pc6RXrvuZNXA1/C0RJVqIW4mSjBzN32unfeHMfFkRM
	ioIAJgOvYYf78u4hgUT2c08n4hOEfT5DZDhnb3Q3hOtj3BBatvarfw9HYLfRW1NFnXVn
	JN5Q==
X-Gm-Message-State: AN3rC/7RexUd4v0ue3RCOrQE31NsJXKrEcfP+UJa5Kq3KVmZaOpVL/rC
	Kfd4K+oBYFGPCQ==
X-Received: by 10.223.134.145 with SMTP id 17mr2597105wrx.130.1492888076476;
	Sat, 22 Apr 2017 12:07:56 -0700 (PDT)
Received: from kozik-lap (pub082136089155.dh-hfc.datazug.ch. [82.136.89.155])
	by smtp.googlemail.com with ESMTPSA id
	u66sm6555534wmd.24.2017.04.22.12.07.55
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Sat, 22 Apr 2017 12:07:55 -0700 (PDT)
Date: Sat, 22 Apr 2017 21:07:54 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Peter Maydell <peter.maydell@linaro.org>
Message-ID: <20170422190754.3tsrihhj5e57r2sy@kozik-lap>
References: <20170416151604.22506-1-krzk@kernel.org>
	<CAFEAcA915o-MYNYwPQXpAs7sWS=4ft_iXG41uZx=S27JuutH7Q@mail.gmail.com>
	<20170422184632.nm2s7shuo34ukswd@kozik-lap>
	<CAFEAcA-8JJtYjAzq=gXJsRHTnO2xiu_EdFEsMR174jh=G0zW8A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAFEAcA-8JJtYjAzq=gXJsRHTnO2xiu_EdFEsMR174jh=G0zW8A@mail.gmail.com>
User-Agent: Mutt/1.6.2-neo (2016-08-21)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.128.193
Subject: Re: [Qemu-arm] [RFC] hw/arm/exynos: Add generic SDHCI devices
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
Cc: Igor Mitsyanko <i.mitsyanko@gmail.com>, qemu-arm <qemu-arm@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: LjfbowBhO7+q

On Sat, Apr 22, 2017 at 08:05:41PM +0100, Peter Maydell wrote:
> On 22 April 2017 at 19:46, Krzysztof Kozlowski <krzk@kernel.org> wrote:
> > On Thu, Apr 20, 2017 at 02:51:00PM +0100, Peter Maydell wrote:
> >> Incidentally someday maybe we should convert this Exynos4210 code
> >> to a proper QOM SoC container object, but that would be a lot of
> >> work.
> >
> > Any existing platforms which I could take as an good example? Maybe I'll
> > have some time to do it.
> 
> The Xilinx ones, or stm32f205_soc, maybe. Basically the idea
> is that instead of having a random function which is doing
> a lot of instantiation of SoC devices, you have a QoM device
> which encapsulates all this, and the board level code just
> creates and configures that device.

Right, I've seen this pattern. Thanks for the hint.

Best regards,
Krzysztof

