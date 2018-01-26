Received: by 10.28.71.27 with SMTP id u27csp778687wma;
        Fri, 26 Jan 2018 06:40:23 -0800 (PST)
X-Google-Smtp-Source: AH8x224pEGuvVT25OPuyaMQ/umyNMWkKBvS58zFLWrjsEyoXjkv64IFOi3IAyi98nT1+jcWsnTpH
X-Received: by 10.37.208.213 with SMTP id h204mr10980802ybg.159.1516977623114;
        Fri, 26 Jan 2018 06:40:23 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1516977623; cv=none;
        d=google.com; s=arc-20160816;
        b=s45Sf9qgaCEpYAehr/GN4/MVOCSjjWZq4/kZAUuy75znMAst53fy4s409UQntrDd10
         iG7x84mywe+26W70vJpM6vkTY5MPtK4pBZgQxDNpTYFIiIkbkZhIn4CZszLwXqgjID0e
         BeXnBLG6g7qqKaqPITlFwx9i/LgAli3twcmaF6fbn3P0dqR8YB7UCkApDP2d5mid3Kff
         Rdfw8/4tcedVkZT/e6oTUm/RYI+Vm/mTEvgaKEnXebraCkPLRjVPle+p8luse26Leu6c
         d0WhvX/r29e31cYgwD4U73Ktkx+6S8skJCaf+Un+bXKS8iVu84TzCi6M2ii6agMXo/ZY
         AmRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:to:message-id:date:from:references
         :in-reply-to:mime-version:dkim-signature:arc-authentication-results;
        bh=DeAz5Uu/pB+vtBNT3+GlYaayC7g09YtzPWI2sM8goYI=;
        b=UUWC7qiaLXQXdkhWo+hrkker6sYDr80Io4zif3Jpp8HLEBRAAQWu6O+siWbPdxWz1F
         MQLRjdsaeSbj6RiHrUS2ETJRftLk53XvU6f5fKQGzsfyjKCtHyThwWQpOLnMoqqwkQfk
         Z5RenkUEaP3SyzbLbq3Jq1zSK8TE3B3iC54B49P4ppOGRRHvmxAvU3iBYAxguKpINYeb
         Dgja2JdEfzZXMsfJ/FGWpj89Ptqf9AlIG+r181qyWDSbDGR2HXHVMg4bgj9yh+0vC32R
         b2J7SqJ6+QlLzr9BK6VDtEZMHn2g7boS55Yl9Pzz/WsSXRinaWuJKyon3Bmgd38G3WAM
         F7aA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=gji3T+4w;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id c184si3762260yba.483.2018.01.26.06.40.22
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 26 Jan 2018 06:40:23 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=gji3T+4w;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:59339 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ef5B0-0005Nw-Kl
	for alex.bennee@linaro.org; Fri, 26 Jan 2018 09:40:22 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36365)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1ef5Ab-0005Ad-R8
	for qemu-arm@nongnu.org; Fri, 26 Jan 2018 09:39:58 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1ef5Aa-0007ao-Tq
	for qemu-arm@nongnu.org; Fri, 26 Jan 2018 09:39:57 -0500
Received: from mail-oi0-x244.google.com ([2607:f8b0:4003:c06::244]:46249)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1ef5Aa-0007aa-Nj
	for qemu-arm@nongnu.org; Fri, 26 Jan 2018 09:39:56 -0500
Received: by mail-oi0-x244.google.com with SMTP id 8so423425oix.13
	for <qemu-arm@nongnu.org>; Fri, 26 Jan 2018 06:39:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=DeAz5Uu/pB+vtBNT3+GlYaayC7g09YtzPWI2sM8goYI=;
	b=gji3T+4winILOI2RphBg/8XAUarUsUHEp37M96UstbVnjZf4CPedPEImLiy8xwEYvR
	FRFlQwOJmiVbYM3K5yhCiZkwlCfVm+W4rgQQsWf7gWhtVYR0YWwsCYpUm8Ns+WY6VFy5
	C+zmZKeeDAQcOX/UH9dzhNNC8nSoa3WwQJ8AM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=DeAz5Uu/pB+vtBNT3+GlYaayC7g09YtzPWI2sM8goYI=;
	b=ebiED8gxE/YW+SM187M+Qoe75DdkXnHjiLpnqkLyLvxnfr3g9LilO88b26Ot8SdlEo
	Dp1a7YmCO9ib7LTDKFlddbML5d3hDamS9iaAWt2tIyLCA755VkomevQ3EhXjjoKZevol
	qpNg8RJZFGbJ0bzxIfkrmoWLUK3s42l8nvJF5oFc0FcJ2YI3HhoLQGvP5TR/jxwyBN3n
	nLPHKrPuLeNctJiC9ENpTMl8uu8awNcRzLP2rrIvy2bbulkI78Us/sV/pa4E9hAyPHaT
	VpRxevmdJ4U+fzghYcCsLSl6NTmx7JV8UcIfP85NWGZddRe+7FgfdoUxxbJBVoHCKDs1
	jTWw==
X-Gm-Message-State: AKwxytcgp7pKzMY769iNDuQCvYTWA6hKfcCZViDLnisHhLl3bVFwS7I/
	fT8vgRhqDlLmUnnliphAaWqa1verdLuCCu4KSUwa6A==
X-Received: by 10.202.180.133 with SMTP id d127mr13252495oif.328.1516977222341;
	Fri, 26 Jan 2018 06:33:42 -0800 (PST)
MIME-Version: 1.0
Received: by 10.157.61.133 with HTTP; Fri, 26 Jan 2018 06:33:21 -0800 (PST)
In-Reply-To: <d8c2c2ca-5046-f19b-9514-d3cbef3b7c3a@amsat.org>
References: <1512670493-18114-1-git-send-email-peter.maydell@linaro.org>
	<1512670493-18114-5-git-send-email-peter.maydell@linaro.org>
	<d8c2c2ca-5046-f19b-9514-d3cbef3b7c3a@amsat.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 26 Jan 2018 14:33:21 +0000
Message-ID: <CAFEAcA9k2KKrXk+2LQd+X7-RFuDQO96bYSo8xi81zfb80+ApFg@mail.gmail.com>
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c06::244
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH 4/6] target/arm: Add "-cpu max"
 support
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
Cc: "patches@linaro.org" <patches@linaro.org>, qemu-arm <qemu-arm@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Eduardo Habkost <ehabkost@redhat.com>,
	"Richard W . M . Jones" <rjones@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: PJatjOwxIeYQ

On 26 January 2018 at 14:29, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org> =
wrote:
> Hi Peter,
>
> On 12/07/2017 03:14 PM, Peter Maydell wrote:
>> Add support for "-cpu max" for ARM guests. This CPU type behaves
>> like "-cpu host" when KVM is enabled, and like a system CPU with
>> the maximum possible feature set otherwise. (Note that this means
>> it won't be migratable across versions, as we will likely add
>> features to it in future.)
>>
>> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
>> ---

>> +#ifndef TARGET_AARCH64
>> +/* -cpu max: if KVM is enabled, like -cpu host (best possible with this=
 host);
>> + * otherwise, a CPU with as many features enabled as our emulation supp=
orts.
>> + * The version of '-cpu max' for qemu-system-aarch64 is defined in cpu6=
4.c;
>> + * this only needs to handle 32 bits.
>> + */
>> +static void arm_max_initfn(Object *obj)
>> +{
>> +    ARMCPU *cpu =3D ARM_CPU(obj);
>> +
>> +    if (kvm_enabled()) {
>> +        kvm_arm_set_cpu_features_from_host(cpu);
>> +    } else {
>> +        cortex_a15_initfn(obj);> +        /* In future we might add fea=
ture bits here even if the
>> +         * real-world A15 doesn't implement them.
>> +         */
>
> Why not use arm_any_initfn() here?

That function (and the 'any' cpu) are deliberately only
included in the linux-user binaries, not the system-emulation binaries.
(Also arm_any_initfn() only initializes userspace-visible stuff, it
doesn't provide ID register values etc for kernel-visible things.)

> Actually what seems cleaner is to move "any" features here, and kill the
> "any" cpu, using "max" for this purpose.

We can't kill 'any', that would break back-compatibility
of command lines.

thanks
-- PMM
