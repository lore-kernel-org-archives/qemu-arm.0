Received: by 2002:a5d:4c4c:0:0:0:0:0 with SMTP id n12-v6csp3919813wrt;
        Fri, 19 Oct 2018 07:44:03 -0700 (PDT)
X-Google-Smtp-Source: ACcGV62ENyP1YaY8Gy4lDppWqmBmNJJ9MPhtDOkpVvanFCjOL6Q0e5FFig7sPCcZ44rwrxo9ivrG
X-Received: by 2002:ae9:e804:: with SMTP id a4-v6mr31749142qkg.242.1539960242925;
        Fri, 19 Oct 2018 07:44:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1539960242; cv=none;
        d=google.com; s=arc-20160816;
        b=EJXRH0mwjQ9YAGrUd4l0bI1+QKZ39jw0ywqhbYZHCDHbeKoxiAq+6RPXRtLRTTNv3x
         864uafeRhFSmWoo194Xr3BAS83pnRzq+Wrmq+n4rj1FT0mk24u0/9gh0QhfOLGBRUQn7
         6/Ctw0g8hf2gH6B58WegsqmLpy8VpY+6M8hgBCZdu8/4WdkpKMXEeB11l63ejmtqnebF
         llJtEh/jl+szWD4l1dWm7TlDprJeaN7LhKLD+Pa5iNKVbXph3dpZdpM1+FFpUnKxK0L0
         p2PizoOFqnVFyyqNUjlCTwfDAAKtBIzJusudFulvd7bCfFjueC+6zLicxTicllUP3HmV
         8FgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature;
        bh=Ov9opVY29Z3R/WzNzSxU6aWId7S1eR4B4NA6IxQ++Nk=;
        b=d6WARFcrzrpwd3n2I4yTBlXNI66SFCJ2y7rgATNPoTHrcDw1mVEDBHdbnAdPzXsJ2t
         fx1Y27X7WrygL3+4X5pw60qch087ZkhLmzMPFvzuzwDYysLd5yMBj4XxUHlil4ZQhB/F
         T38cB1cGgB/t+zz7r2pK7ZE18Xg0Jazx/DoJNuXt+61PQm9c4d0vRTD2ESlYVapqV8Gy
         a/XgeDjYhU73Dl9suSzQZFcYuFsB+rra3qfezPeeChGJIRVIPb9jIvfIUGdUrpId3SzJ
         CZYk0qEJoTc75gsTDswRdIs/8Uh5nQ7wO5++IxGphBx06VC86ML4gOy1OcMw2g8EkXDK
         F2Ww==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=NsPT6HGA;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id j184-v6si38169qka.181.2018.10.19.07.44.02
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 19 Oct 2018 07:44:02 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=NsPT6HGA;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:50957 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gDW0Q-0006ci-GH
	for alex.bennee@linaro.org; Fri, 19 Oct 2018 10:44:02 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59984)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1gDW0F-0006c5-2P
	for qemu-arm@nongnu.org; Fri, 19 Oct 2018 10:43:51 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1gDW0E-0007Ct-7g
	for qemu-arm@nongnu.org; Fri, 19 Oct 2018 10:43:50 -0400
Received: from mail-ot1-x344.google.com ([2607:f8b0:4864:20::344]:34978)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1gDW0D-0007BL-Q5
	for qemu-arm@nongnu.org; Fri, 19 Oct 2018 10:43:50 -0400
Received: by mail-ot1-x344.google.com with SMTP id 14so29420626oth.2
	for <qemu-arm@nongnu.org>; Fri, 19 Oct 2018 07:43:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=Ov9opVY29Z3R/WzNzSxU6aWId7S1eR4B4NA6IxQ++Nk=;
	b=NsPT6HGAZdBOyDsLF7SO+3hyiqDJkURmKMTApnnxJujfKab5YRJk1+r8h4VGP3aOLP
	d34QFNDe8wGLF0295uoY4XdrSHraz2lZQsy6aSQWeoT2zwsni3FoEHW7f3CExbFLtPnL
	9EtRRJnMIJzk6yL651kbPFGyi/rKgERy2k5to=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=Ov9opVY29Z3R/WzNzSxU6aWId7S1eR4B4NA6IxQ++Nk=;
	b=EFt4iy+imYbGY6YdNR0O11x9EV2fUesEJbYfg5Le+LW/vJcyQxjIK/zxLdbFMaurhm
	F+AeFAnUjmDZrcG65ZsslixZnWeLMng3omiN2a+g+m9cb+n6hJ+dM6e9SMP/ELELsXzf
	Q3uAeCpGa/ipTUJa6+FgmNSLbyCUf9KUBI2n493m5J4hZNYkMyYefyVbKUwqwM/uq6Xt
	1TvAkinUdpdbhNI0ADiyYzGA6ysJ2JqY8ycy99Yiy6b92gc8mKON9TQX0pAN54VcMbmb
	oi//UfcEORkCaYNViPwOU+sWDL2f78C69LthpXomQn8t7xR8VHXjvTj5N5IM1CpDJbjl
	pF1A==
X-Gm-Message-State: ABuFfojXXrAovl1Fan31xNBnk6vHeWliuX3AqKX9XBKrr76icdkqq0IQ
	kfr0D8ZC1lxd08y7U8vaGOwBcMlBbhjcC4N2O97qWg==
X-Received: by 2002:a9d:44d7:: with SMTP id p23mr21710288otg.316.1539960228945;
	Fri, 19 Oct 2018 07:43:48 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:7c90:0:0:0:0:0 with HTTP; Fri, 19 Oct 2018 07:43:28
	-0700 (PDT)
In-Reply-To: <a6b421a6-439e-ac87-0f96-b28ca349bc70@redhat.com>
References: <1539954845-26716-1-git-send-email-thuth@redhat.com>
	<1539954845-26716-5-git-send-email-thuth@redhat.com>
	<CAFEAcA-ahq3Y4sgs=Vijq_fsDPgX4JuG0gGdMwE5oOLOrsvxjQ@mail.gmail.com>
	<a6b421a6-439e-ac87-0f96-b28ca349bc70@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 19 Oct 2018 15:43:28 +0100
Message-ID: <CAFEAcA9Pb5Dw9zu5_esYwor+MEmUJ=f4ZZqifui9qyJdKWbTiQ@mail.gmail.com>
To: Thomas Huth <thuth@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::344
Subject: Re: [Qemu-arm] [PATCH 4/5] configs: Add a CONFIG_UNIMP switch for
 the "unimplemented-device"
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
Cc: "Edgar E. Iglesias" <edgar.iglesias@xilinx.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Alistair Francis <alistair.francis@xilinx.com>,
	qemu-arm <qemu-arm@nongnu.org>, qemu-ppc <qemu-ppc@nongnu.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	=?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: +FPBMIN+laJT

On 19 October 2018 at 15:40, Thomas Huth <thuth@redhat.com> wrote:
> Anyway, it's also not only about speeding up the compilation process for
> people who don't want to use the corresponding targets, this is also
> very useful for downstream distributions of QEMU who want to make sure
> to not compile-in more devices than urgently needed. For example we
> disable this device here and the others in downstream RHEL version of
> QEMU, and I guess it might be interesting for nemu, too. So having more
> flexibility here in the Makefiles would be really great to decrease the
> burden with downstream-specific patches...

I think if we want to support this for downstreams we need
to look at something better than the default-configs/
mechanism for it. (Perhaps the kconfig-alike Paolo mentioned
in a previous thread?)

My dividing line for "should something go in a specific
architecture's default-configs/ list" is "is this an SoC
or real piece of hardware that is naturally limited to
one or a few SoCs".

thanks
-- PMM
