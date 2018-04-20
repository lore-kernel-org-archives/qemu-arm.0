Received: by 10.28.4.212 with SMTP id 203csp1093924wme;
        Fri, 20 Apr 2018 11:56:05 -0700 (PDT)
X-Google-Smtp-Source: AB8JxZr+yFe6lM4Z5oOSgVZ/nNKrHHVBDEiyw2LButKvMlSqmW3yv0mu/i+Yjg7DQoxg57RtUaFt
X-Received: by 10.55.23.94 with SMTP id i91mr11217769qkh.308.1524250565476;
        Fri, 20 Apr 2018 11:56:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1524250565; cv=none;
        d=google.com; s=arc-20160816;
        b=Nvt9peKyBLZmZqBdoPZtk7j5JB782cH9tBG+C9mc9i4Hgkb8lLRKryh00BOqKNbF2U
         f7SM1gPGhFWSAObjPizruTcP2rpfbqVHfrNiVRxXvMsn/7Rk7RIgB4hma8BWAyefOYjf
         2j3ylOVA77CqV0x/28NIQHlT+kyAxcgvlvFUjLOOkl2/xFgkhNGhZJvHX2lBMautQUJE
         qK/oF2GBWl6rwezTrsnfU9EdO5A9ahTo6RWnTRDn5DoxXoAmimkPiKEzBUUz6QmLOOKW
         4t47gLIsS/GcBOKrO/0DL+awGzhTP47yPGHikMFLujqt8OM7arbHaVApHAU3rSmqSfaC
         zahA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to
         :dkim-signature:arc-authentication-results;
        bh=IN3EDMCqPFBjB7Y9R3Iag4uXInkbXIj38bbLLKxgB9Q=;
        b=uoh5KeDK6n/Rl3znALXSZhtJIO3NNU31Ad9OPYdHpKqSFyG5DUQtwcL+8ZZJ8f10Og
         49silBELJLjA/Q1TiaHwxTipaTwohA68l2j3TmM3I2L+tktIGHmupjKwWIvTbbhUJ91f
         Jx6UZuOrDRFDnuF6XT1J7+phBVmLh64BfBePdbfYjKEmOy6EEpYFLAUJGYBlVxtDZn8j
         MfIm09LDnpUn1Q+mwNCZuo6qiXir0CjNgVGyjX76HuAg8KWIpNkN2SFXTj/f68Tu1aZA
         hWD7QVa+GQEU9vxL9dlK3Ar0T3SrTshvxj1BULYSrfL1Ve0uOdRN8i388oCmQfIT2dh0
         vQ0Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=i16gHVim;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id x196si8102172qka.34.2018.04.20.11.56.05
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 20 Apr 2018 11:56:05 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=i16gHVim;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:52825 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1f9bCW-0005eS-Tt
	for alex.bennee@linaro.org; Fri, 20 Apr 2018 14:56:04 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60505)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1f9bBr-0005ct-Sk
	for qemu-devel@nongnu.org; Fri, 20 Apr 2018 14:55:25 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1f9bBo-0001ym-Bz
	for qemu-devel@nongnu.org; Fri, 20 Apr 2018 14:55:23 -0400
Received: from mail-qt0-x243.google.com ([2607:f8b0:400d:c0d::243]:41196)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1f9bBm-0001y2-Bt; Fri, 20 Apr 2018 14:55:19 -0400
Received: by mail-qt0-x243.google.com with SMTP id d3-v6so10913797qth.8;
	Fri, 20 Apr 2018 11:55:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:cc:references:from:openpgp:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=IN3EDMCqPFBjB7Y9R3Iag4uXInkbXIj38bbLLKxgB9Q=;
	b=i16gHVimgRM642plKRbBzHufVw2zGUIASVV7si0KvQiwTU+P49OCJXxIqIrbWYz1Uy
	IS3u6v7yzlRqAxadj7czbypFXA/LUB/eqTrXmjYWOtUMcfcQa+qr0Vt3XTNEuhfpZnML
	jOpQD9NUS8hoKzMJp+Wmok5OE6VmS3R9cLW43wfRat6mbtqMmQlt8RT1YPTvSjB0/J0V
	a90hvPyXYIG+jaupfo451mbgarRganV+WJfRIGHgn4QhR60C+YQLqgsPm+INmNDUkKWA
	VFtk5L5Ar96G/4J2z/KeHM5O8TgZ8VHqYZrzINcq3T0HhXBVUsd6noh6mAMiN01Vxaob
	kiPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:cc:references:from:openpgp
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-language:content-transfer-encoding;
	bh=IN3EDMCqPFBjB7Y9R3Iag4uXInkbXIj38bbLLKxgB9Q=;
	b=RWlTXzkCNeB6t6tPP/N30gnfvXfnNWldL/JbOEA1k7v3fF0bfQIKL55/MTHDW7cjIK
	uBmAQPKaMVXLgZmzj/Gda0Blg5DNXOrP9MKqBygNcw7iW7+XFjlK6GAg3ad7T8+iEQND
	Cso6SuQ6l8IOJbKNyoEM//n+dsD8g1iDIKYUXJiCf75hx08Yqeo4/1PVYZI2jyvH/dlj
	2rd/UnCN3xaeSexxABPncJEBc61ROQWwmrAUOo3pogriUIU9v/Ty4UD6fqJ6MwLSo6O6
	SLd5Neld36gyviKdPuJsotydjz9xv8uQf0zYbDQjYcW0gprP8EDc4R9W+avg4+m/tqR4
	j2AQ==
X-Gm-Message-State: ALQs6tB6QapVFGOobqEJ0tbax11hj7vUxjK/sB8O2W3yRUk8APhx5O5G
	HrBZtQx9ytgPSRwHLb1Fc28=
X-Received: by 2002:aed:3069:: with SMTP id
	96-v6mr12293314qte.283.1524250517828; 
	Fri, 20 Apr 2018 11:55:17 -0700 (PDT)
Received: from [192.168.1.11] ([138.117.48.212])
	by smtp.gmail.com with ESMTPSA id
	r20sm5131054qke.79.2018.04.20.11.55.14
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 20 Apr 2018 11:55:16 -0700 (PDT)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
References: <20180420155547.9497-1-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Openpgp: id=FAABE75E12917221DCFD6BB2E3E32C2CDEADC0DE;
	url=http://pgp.mit.edu/pks/lookup?op=get&search=0xE3E32C2CDEADC0DE
Message-ID: <e972d5b4-4740-228e-014e-15686d0b1dc1@amsat.org>
Date: Fri, 20 Apr 2018 15:55:12 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.7.0
MIME-Version: 1.0
In-Reply-To: <20180420155547.9497-1-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::243
Subject: Re: [Qemu-devel] [PATCH] hw/arm/raspi: Don't bother setting
 default_cpu_type
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
Cc: Igor Mammedov <imammedo@redhat.com>,
	Andrew Baumann <Andrew.Baumann@microsoft.com>, patches@linaro.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: /Qjj2fAi3BB/

On 04/20/2018 12:55 PM, Peter Maydell wrote:
> In commit 210f47840dd62, we changed the bcm2836 SoC object to
> always create a CPU of the correct type for that SoC model. This
> makes the default_cpu_type settings in the MachineClass structs
> for the raspi2 and raspi3 boards redundant. We didn't change
> those at the time because it would have meant a temporary
> regression in a corner case of error handling if the user
> requested a non-existing CPU type. The -cpu parse handling
> changes in 2278b93941d42c3 mean that it no longer implicitly
> depends on default_cpu_type for this to work, so we can now
> delete the redundant default_cpu_type fields.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

> ---
> Tidying up a loose end from the raspi changes I did last month...
> 
>  hw/arm/raspi.c | 2 --
>  1 file changed, 2 deletions(-)
> 
> diff --git a/hw/arm/raspi.c b/hw/arm/raspi.c
> index 955a7c4e80..66899c28dc 100644
> --- a/hw/arm/raspi.c
> +++ b/hw/arm/raspi.c
> @@ -226,7 +226,6 @@ static void raspi2_machine_init(MachineClass *mc)
>      mc->no_parallel = 1;
>      mc->no_floppy = 1;
>      mc->no_cdrom = 1;
> -    mc->default_cpu_type = ARM_CPU_TYPE_NAME("cortex-a7");
>      mc->max_cpus = BCM283X_NCPUS;
>      mc->min_cpus = BCM283X_NCPUS;
>      mc->default_cpus = BCM283X_NCPUS;
> @@ -249,7 +248,6 @@ static void raspi3_machine_init(MachineClass *mc)
>      mc->no_parallel = 1;
>      mc->no_floppy = 1;
>      mc->no_cdrom = 1;
> -    mc->default_cpu_type = ARM_CPU_TYPE_NAME("cortex-a53");
>      mc->max_cpus = BCM283X_NCPUS;
>      mc->min_cpus = BCM283X_NCPUS;
>      mc->default_cpus = BCM283X_NCPUS;
> 
