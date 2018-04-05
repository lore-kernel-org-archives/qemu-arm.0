Received: by 10.28.71.155 with SMTP id m27csp6012630wmi;
        Thu, 5 Apr 2018 05:59:53 -0700 (PDT)
X-Google-Smtp-Source: AIpwx49ZtT8kBCB04dhT1lP4fZxSu0HUd/54JS6TVK17uwEOq2AVjQ8mCRvWdKF5um1NBihBbGgM
X-Received: by 10.200.32.153 with SMTP id 25mr31726993qtd.274.1522933191236;
        Thu, 05 Apr 2018 05:59:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1522933191; cv=none;
        d=google.com; s=arc-20160816;
        b=RtOB8REZ6qYUg0pd8LnLhe6U0YTS484uQCb/yIKJucw+rGPeiw4KddM/kZ7ZYZ1edQ
         bCZRt8ag2FSmeY0HDyc7MOSPl2JsZrSrWJYi5pILTX21sbFQ9Q0oIoods59hymExgLlm
         ExL2P95iBD09y4FN2MihMJUk9j/dDiUFhO5k+/Ah88y2/Y2QzfrRaH7fKR0gMLdVoxoH
         IsBDvkLBB/UTaRnQyW63TKNiSkWaDRnioEEJY+PEqD0XZxnwxL3DEP5KxmZaOMoZZxJh
         +3N18OzbVhk6Mt7LOByWmOeUkFkUEh7+aqw3yb93+sc2YO64VSgaSlJV6+YNIVExB7Lc
         v2cw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=QIAj6UbNpqc2G4t06KgRH7i1zdBI2FNZzvFx+/TQN8w=;
        b=Z27uSvS9eWK/tFwz3JOto+LoZuCyaTER2N688BE62SOGO2S99KhD7KBm2kPS4UjgQv
         vDMk62ufl+MT8VThurDLaTGxfaaRfY+vAA5jlgd/JXbE/l7PMpAqJGnpt3imDnH8zG5W
         U9OTRnlVmMlJB0rQEFm3iFLlO2YW7eZhGIEAuLI4qwRSYcIr89cueCE308iF8QF3RCzQ
         /sEnPlYHTwZEZwht15pIS9YhYSpTFZyN1LdJ0Y9Egbc9TIgtXV2vmQdbPqmsRnm8K9uq
         NfigQ5vsc4VPIQANnXvIlfTch6+NJq06Ta9EcD2Lk5vg2QRdwr1Aq7ifVfNl1t/dMgtz
         DvLA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=ZSh+RUYV;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id c4si2085878qtp.289.2018.04.05.05.59.51
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 05 Apr 2018 05:59:51 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=ZSh+RUYV;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:56183 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1f44UY-0000xC-OP
	for alex.bennee@linaro.org; Thu, 05 Apr 2018 08:59:50 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57706)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1f44UQ-0000wj-Vd
	for qemu-arm@nongnu.org; Thu, 05 Apr 2018 08:59:44 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1f44UP-0000zY-VK
	for qemu-arm@nongnu.org; Thu, 05 Apr 2018 08:59:43 -0400
Received: from mail-ot0-x229.google.com ([2607:f8b0:4003:c0f::229]:41482)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1f44UP-0000zG-PQ
	for qemu-arm@nongnu.org; Thu, 05 Apr 2018 08:59:41 -0400
Received: by mail-ot0-x229.google.com with SMTP id i28-v6so27066738otf.8
	for <qemu-arm@nongnu.org>; Thu, 05 Apr 2018 05:59:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=QIAj6UbNpqc2G4t06KgRH7i1zdBI2FNZzvFx+/TQN8w=;
	b=ZSh+RUYVovmGTUj7vcKo8KRCcTojE6RstdtfPWaHRTW7mzkyf1XZjalmpP+YuKnKCB
	wfcYD6q+bpQpHb4YkDOvimtM09pqD+UbI8OzIymSCVEyC9TACvzmxddYhK8AJTvWHprt
	VUmi8Hzq2nxMVZnougDQLr7rXvUUnf2RHZLHI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=QIAj6UbNpqc2G4t06KgRH7i1zdBI2FNZzvFx+/TQN8w=;
	b=mSjvI9dejspnLvYZ2vIzEPvW2RaTSuJKLuIv4m/RUCKvggoz/svthOwz/227VSn43i
	ojxNd2awqnLVNCXHC/QuaLnmUCT9HLIIiZvuN7+oiCvtxrt/HdG6PY8kpc2Cafw6DhkA
	UE6DcHeFXeQHKwQAf4tUIWN9qYJ5urBOlOXCJjlljX2s2Amny8MSEezhnGa9CBOpVeUt
	lsD7M+NQqp8pyNVK6C0pnUs4KDade0LYH6ZL9LIbEz0vxdjhQo9SLP4ChOpnAi7XOQMO
	bdCGS8rQWAIGpdiFBJEWFYEyBQydRdtGAQ0QVpoxUrIcM8ib8rgU27oIC+04bHbXUx8N
	8gNA==
X-Gm-Message-State: ALQs6tA4hZuPcJdWQBsdXIO06B0KjK4BzqOyJ9VoucaW1jp4TYBD0tc3
	1SqXhmh3dw0PBoC9VYhZw9ytyEdsL9SVFmP9OmYImg==
X-Received: by 2002:a9d:3a45:: with SMTP id
	j63-v6mr12722329otc.126.1522933180818; 
	Thu, 05 Apr 2018 05:59:40 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:2286:0:0:0:0:0 with HTTP;
	Thu, 5 Apr 2018 05:59:20 -0700 (PDT)
In-Reply-To: <1522862420-7484-1-git-send-email-thuth@redhat.com>
References: <1522862420-7484-1-git-send-email-thuth@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 5 Apr 2018 13:59:20 +0100
Message-ID: <CAFEAcA8wMp=9GToj0bZy3et8O2sxk7_zQjxsbkYuzHqJ4eaKaQ@mail.gmail.com>
To: Thomas Huth <thuth@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c0f::229
Subject: Re: [Qemu-arm] [PATCH for-2.12] hw/arm/allwinner-a10: Do not use
 nd_table in instance_init function
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
Cc: Beniamino Galvani <b.galvani@gmail.com>, qemu-arm <qemu-arm@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 7J461q/+zfqX

On 4 April 2018 at 18:20, Thomas Huth <thuth@redhat.com> wrote:
> The instance_init function of a device can be called at any time, even
> if the device is not going to be used (i.e. not going to be realized).
> So a instance_init function must not do things that could cause QEMU
> to exit, like calling qemu_check_nic_model(&nd_table[0], ...) for example.
> But this is what the instance_init function of the allwinner-a10 device
> is currently doing - and this causes QEMU to quit unexpectedly when
> you run the 'device-list-properties' QMP command for example:
>
> $ echo "{'execute':'qmp_capabilities'}"\
>        "{'execute':'device-list-properties',"\
>        " 'arguments':{'typename':'allwinner-a10'}}" \
>        | arm-softmmu/qemu-system-arm -M mps2-an505,accel=qtest -qmp stdio
> {"QMP": {"version": {"qemu": {"micro": 91, "minor": 11, "major": 2},
>  "package": "build-all"}, "capabilities": []}}
> {"return": {}}
> Unsupported NIC model: lan9118
>
> ... and QEMU quits after printing the last line (which should not happen
> just because of running 'device-list-properties' here).
>
> And with the cubieboard, this even causes QEMU to abort():
>
> $ echo "{'execute':'qmp_capabilities'}"\
>        "{'execute':'device-list-properties',"\
>        " 'arguments':{'typename':'allwinner-a10'}}" \
>        | arm-softmmu/qemu-system-arm -M cubieboard,accel=qtest -qmp stdio
> {"QMP": {"version": {"qemu": {"micro": 91, "minor": 11, "major": 2},
>  "package": "build-all"}, "capabilities": []}}
> {"return": {}}
> Unexpected error in error_set_from_qdev_prop_error() at hw/core/qdev-properties.c:1095:
> Property 'allwinner-emac.netdev' can't take value 'hub0port0', it's in use
> Aborted (core dumped)
>
> To fix the problem we've got to move the offending code to the realize
> function instead.
>
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>  I know, an even cleaner fix would likely be to remove serial_hds and
>  nd_table from the device completely and wire it up from the board code
>  instead - but that's a major rework compared to this simple fix here,
>  which we likely should avoid at this point in time of the hard freeze
>  period.
>



Applied to target-arm.next, thanks.

-- PMM
