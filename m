Received: by 10.25.205.13 with SMTP id d13csp10327648lfg;
        Fri, 6 Jan 2017 06:36:16 -0800 (PST)
X-Received: by 10.55.212.1 with SMTP id l1mr11391401qki.188.1483713376316;
        Fri, 06 Jan 2017 06:36:16 -0800 (PST)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id v62si5371722qtd.41.2017.01.06.06.36.15
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 06 Jan 2017 06:36:16 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:53124 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1cPVcr-00076G-JR
	for alex.bennee@linaro.org; Fri, 06 Jan 2017 09:36:13 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57431)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kirkseraph@gmail.com>) id 1cPVcI-000753-4f
	for qemu-devel@nongnu.org; Fri, 06 Jan 2017 09:35:39 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <kirkseraph@gmail.com>) id 1cPVcD-000607-Fj
	for qemu-devel@nongnu.org; Fri, 06 Jan 2017 09:35:38 -0500
Received: from mail-wj0-x242.google.com ([2a00:1450:400c:c01::242]:32783)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <kirkseraph@gmail.com>)
	id 1cPVcD-0005zE-3Z; Fri, 06 Jan 2017 09:35:33 -0500
Received: by mail-wj0-x242.google.com with SMTP id kp2so80306082wjc.0;
	Fri, 06 Jan 2017 06:35:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=date:from:to:cc:subject:message-id:mime-version:content-disposition
	:user-agent; bh=8pDfnNy6CPngO5ee+P817SSceiQu62NJGTofy9ynAdc=;
	b=uFTUi9ZRemjFKfkwrHW50Y/Q/Tata5G1NRlcV3V0ZLm/z5O9/uCX7jhf/f/72Ehbrz
	gjt3zGp+ULW+G0bHibRmh4TmcWfwtW1mpJO/qEvoVspUuMAoKmIvHqVBZcMCxXD6t3Sj
	haf6/rAGsC9rR7CCPVxRRXeM/bmg2KHYdcIbbhPATzSmhZD8CMou8JdR+doYM7djIJl0
	MUV+vBz/zv1VbdpNPWBmc4tfVzxCXoFxa1SkSuMKbFQpE17FAnZRUCg/6hBTiAz19++K
	9gClQN0Lmc//kSzNpXrMXARX1VTvPRBDyuealHYgfdQQ6M9r1lpmcL3WcofDxlcj0hK+
	fMBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
	:content-disposition:user-agent;
	bh=8pDfnNy6CPngO5ee+P817SSceiQu62NJGTofy9ynAdc=;
	b=O+HHwbB0xM3C8s/k12dIpe2hbJGT7MMVGKGP09xbCcRq+7bdhbV2pdIxGHC8JW+9Oj
	IKIy8L2qzysRpCUrxs0DYc4tqlRAsegRsbXjNMvJp9q/+A8Y1dsbzxo8L9oIaSavrRTk
	h59s2VtGRmM3TLulNfeN+x7HSU5UIiqdOps7FwwJ2Noccbtzbn/mMtO6K7tXqEumWIcd
	LigETJ8YFUj1O3+dmuehl42SPSLW6JwkflcPo8zSEhRwIcLXQEKVD14oWsjYv8gKXaMe
	IRs8FGTLuiPY2aZg6xkmVN2FfpIXhDPl5k7OIDWkJCHhrY0RIubA9NjwrhGkN4DwVwIR
	CNJA==
X-Gm-Message-State: AIkVDXJgPBiO2+a8yTWSV1CmaKp1UQQV+5k4FdGsl4grhaghsHab+GgBc2z8uIsj/GPlYw==
X-Received: by 10.223.136.110 with SMTP id e43mr1213364wre.189.1483713330579; 
	Fri, 06 Jan 2017 06:35:30 -0800 (PST)
Received: from localhost (cha92-19-78-239-153-115.fbx.proxad.net.
	[78.239.153.115]) by smtp.gmail.com with ESMTPSA id
	a8sm40832690wjq.44.2017.01.06.06.35.28
	(version=TLS1 cipher=AES128-SHA bits=128/128);
	Fri, 06 Jan 2017 06:35:29 -0800 (PST)
Received: by localhost (sSMTP sendmail emulation);
	Fri, 06 Jan 2017 15:35:27 +0100
Date: Fri, 6 Jan 2017 15:35:27 +0100
From: Seraphime Kirkovski <kirkseraph@gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
Message-ID: <20170106143527.sdto622nm6hflp5b@roojbos.sk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: NeoMutt/20161104 (1.7.1)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2a00:1450:400c:c01::242
Subject: Re: [Qemu-devel] [RESEND PATCH] target-arm/abi32: check for
 segfault in do_kernel_trap
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Riku Voipio <riku.voipio@iki.fi>, QEMU Developers <qemu-devel@nongnu.org>,
	qemu-arm <qemu-arm@nongnu.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: +k0J36Hxwk2E

<riku.voipio@iki.fi>,qemu-arm <qemu-arm@nongnu.org>
Bcc:
Subject: Re: [Qemu-devel] [RESEND PATCH] target-arm/abi32: check for 
segfault in do_kernel_trap
Reply-To: In-Reply-To: 
<CAFEAcA-9aYRHcn1dAD0xuR9H8sJ__HOK9ayWmsK7H-Cr2rj4SQ@mail.gmail.com>

Hi Peter,
thanks for the feedback.

On Thu, Jan 05, 2017 at 02:42:38PM +0000, Peter Maydell wrote:
> If you compare what happens with this segv code with
> what happens for the segvs detected inside
> arm_kernel_cmpxchg64_helper(), there's a difference.
> With this code we will queue the signal and then return,
> skipping the code which updates env->regs[15] and env->thumb.
> The existing codepath for cmpxchg64 doesn't skip that code.
> The effect is that for cmpxchg64 the SEGV signal handler
> will see a PC pointing at the call into the kernel commpage,
> whereas for this code it will see the PC actually in the
> kernel commpage.
> 
> I'm not sure which of these options is the best choice,
> but I do think we should be consistent.

I think it would be safer to keep the current behaviour.

In terms of implementation, I find it would be better to extract the 
__kernel_cmpxchg code in a separate function. On the one hand, this 
would avoid code duplication or strange gotos and make do_kernel_trap
more readable. On the other hand, this would clutter a bit git history.
If it is acceptable, I will send a patch with those changes. If not, 
will try to find a cleaner solution without creating new functions.

Cheers,
Seraphime Kirkovski
