Received: by 10.25.0.147 with SMTP id 141csp1465628lfa;
        Mon, 6 Mar 2017 09:08:07 -0800 (PST)
X-Received: by 10.200.57.162 with SMTP id v31mr18617705qte.173.1488820087195;
        Mon, 06 Mar 2017 09:08:07 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id s52si3347482qtc.326.2017.03.06.09.08.06
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 06 Mar 2017 09:08:07 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:45189 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ckw7A-0005mn-B9
	for alex.bennee@linaro.org; Mon, 06 Mar 2017 12:08:04 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40293)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <k.kozlowski.k@gmail.com>) id 1ckw75-0005l4-TF
	for qemu-arm@nongnu.org; Mon, 06 Mar 2017 12:08:00 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <k.kozlowski.k@gmail.com>) id 1ckw72-0008Vq-NV
	for qemu-arm@nongnu.org; Mon, 06 Mar 2017 12:07:59 -0500
Received: from mail-wr0-f194.google.com ([209.85.128.194]:35468)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <k.kozlowski.k@gmail.com>)
	id 1ckw72-0008UZ-Hs; Mon, 06 Mar 2017 12:07:56 -0500
Received: by mail-wr0-f194.google.com with SMTP id u108so18576042wrb.2;
	Mon, 06 Mar 2017 09:07:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=n4JSjPJi/UaE7Gu4Z6vNvNdqS2A8RPWpG+TNvezc+Ls=;
	b=Xr7dI1BluY7SuAoVKXFxcaW3/indoz/WukhKUueEZDu9XnP7rkkRld0ocWvzByEaWh
	A5mf6p1Ui3aR4tLyzIgHufdXYhqIcy5tRbPoOcVqoKmz97gLBRzrrxcuizEhcBY3zYgW
	HYcXk6BTKrHFeZrXtehQ2zDU4jl2J6Oof+DelWm+GJw3C+dkO5C29sjuzHgUb2mF2N/o
	N3zeTP18BoolJV+fcmZzGx4MNzVT5cLfudGq5i74e3x+MrU1xIPWBtPHlh11mYNAqwt1
	uThXCGvWfCTkx47Xp9aMB4T3Hzww2uRxoU2rMZHASA6yzxwZgRzS3IH5hX1eNB1pMU+n
	GF/g==
X-Gm-Message-State: AMke39k4xHn2MaetYVntn2gPXuOB2XUsYAq5VVsRtBTgmR/i1b9pxNTdRO/blj99z9IHQg==
X-Received: by 10.223.144.65 with SMTP id h59mr17653134wrh.30.1488820075150;
	Mon, 06 Mar 2017 09:07:55 -0800 (PST)
Received: from kozik-lap (bzq-109-67-52-244.red.bezeqint.net. [109.67.52.244])
	by smtp.googlemail.com with ESMTPSA id
	j26sm4185037wrb.69.2017.03.06.09.07.53
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 06 Mar 2017 09:07:54 -0800 (PST)
Date: Mon, 6 Mar 2017 19:07:51 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Eric Blake <eblake@redhat.com>
Message-ID: <20170306170751.jr7cgwsz3yqq2kd2@kozik-lap>
References: <20170305214857.9510-1-krzk@kernel.org>
	<f441f1d9-b312-5f96-0fbf-53a46a8b16a8@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <f441f1d9-b312-5f96-0fbf-53a46a8b16a8@redhat.com>
User-Agent: Mutt/1.6.2-neo (2016-08-21)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.128.194
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH 1/3] hw/arm/exynos: Convert
 fprintf to error_report()
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
Cc: Igor Mitsyanko <i.mitsyanko@gmail.com>,
	Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: TcCwWU4vefnC

On Mon, Mar 06, 2017 at 10:55:12AM -0600, Eric Blake wrote:
> On 03/05/2017 03:48 PM, Krzysztof Kozlowski wrote:
> > error_report() is preferred over fprintf() for logging errors.  Also
> > remove square brackets [] and additional new line characters in printed
> > messages.
> > 
> > Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> > ---
> 
> I don't see a 0/3 cover letter. When sending multiple patches, it's
> always best to package them in-reply-to the cover letter ('git config
> format.coverLetter auto' makes it easy to remember).

The patches are trivial cleanups without any dependencies so the cover
letter would be one sentence of "trivial cleanup". :)

If that's the practice in qemu, I can send them, no problem.

> 
> 
> > @@ -101,9 +102,8 @@ static Exynos4210State *exynos4_boards_init_common(MachineState *machine,
> >      MachineClass *mc = MACHINE_GET_CLASS(machine);
> >  
> >      if (smp_cpus != EXYNOS4210_NCPUS && !qtest_enabled()) {
> > -        fprintf(stderr, "%s board supports only %d CPU cores. Ignoring smp_cpus"
> > -                " value.\n",
> > -                mc->name, EXYNOS4210_NCPUS);
> > +        error_report("%s board supports only %d CPU cores. Ignoring smp_cpus value.",
> 
> Most uses of error_report() avoid trailing dot.

Sure, I can rephrase it to one sentence without dot.

Best regards,
Krzysztof

