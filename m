Received: by 10.25.21.156 with SMTP id 28csp2231847lfv;
        Sat, 6 Aug 2016 03:17:55 -0700 (PDT)
X-Received: by 10.200.54.185 with SMTP id a54mr17652327qtc.63.1470478675592;
        Sat, 06 Aug 2016 03:17:55 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id w58si14007558qtc.98.2016.08.06.03.17.55
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sat, 06 Aug 2016 03:17:55 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:48726 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bVyfz-000889-1I
	for alex.bennee@linaro.org; Sat, 06 Aug 2016 06:17:55 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42995)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <rth7680@gmail.com>) id 1bVyfs-000858-Pi
	for qemu-arm@nongnu.org; Sat, 06 Aug 2016 06:17:49 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <rth7680@gmail.com>) id 1bVyfr-00089m-NZ
	for qemu-arm@nongnu.org; Sat, 06 Aug 2016 06:17:48 -0400
Received: from mail-pa0-x232.google.com ([2607:f8b0:400e:c03::232]:35407)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <rth7680@gmail.com>)
	id 1bVyfm-000890-Al; Sat, 06 Aug 2016 06:17:42 -0400
Received: by mail-pa0-x232.google.com with SMTP id iw10so99792595pac.2;
	Sat, 06 Aug 2016 03:17:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:subject:to:references:cc:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-transfer-encoding;
	bh=6IFpz2c/8ScEUTnKtnX1hd272rowFOVpFPMmOEoobKM=;
	b=pVrRHJp8/Spg4Xi4XJKH9WNYAMydUNUONugCeLUZnqNo5/EAV807J31C8MD7N0OedR
	RbiH7NADFORuAZUMGXrDKDKh9YcNboNwiW5n7yF/B6rWRazP0/IAvWsV/VVEdEnzDYme
	t9fUfa4HoELNbNVG/B57Ziv8Q2QciUsOnqrhzchxf313uDAaI6nxrpysyTDpN81uzHSz
	feKA4Htln9eKDhahjpkoA75xA46Z7792JeooUu8LLWhDpLAP2M4nEuBamHFtx5eyKyAH
	ZHSlJMz5q01p+Zfwe8axrFuVtZDVaSvO6mVNbg/L60LCJ29dCA6R1K+1Zt4Vn24cypX9
	VoIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:sender:subject:to:references:cc:from:message-id
	:date:user-agent:mime-version:in-reply-to:content-transfer-encoding;
	bh=6IFpz2c/8ScEUTnKtnX1hd272rowFOVpFPMmOEoobKM=;
	b=bOrQh9QuiC5TH5GcezU0Lm5IchE/cB6ggThp/ijmDCotbCYb9zwQfgOkucWUZufhCF
	iDiMFXr60mAMh5PTuyB60I2mtY2lIrVil6KmQtQZvj26kTLDLnvgHCcX7vFQ2vtUoWsk
	GmdRNveCAbB31VWI+5oQbpPCY077EY0azs4w78+miU7lP7U8hinCKylHQ2ur6VAQ00hN
	9BjfMmaxMxmvjVxs9BxtQDtcKdybcZ6W6UuGSyIzrQcax0xCP5/9y2HO/XrxZdCEDMy6
	jBoLZ7rQxxu6BIlruYLYhzjXVEUhmLUjloU9UUTlEsv2HNTN1TRFmRHMOvwpgQc3Hyup
	VpSQ==
X-Gm-Message-State: AEkoouuk5s444/zC4mvDfroDsNV6o7POJyIOW0SYOBXZxPFjQX/+bHEyHUvd/LviJzm3Wg==
X-Received: by 10.66.230.195 with SMTP id ta3mr144580445pac.89.1470478660515; 
	Sat, 06 Aug 2016 03:17:40 -0700 (PDT)
Received: from bigtime.twiddle.net ([123.231.63.253])
	by smtp.googlemail.com with ESMTPSA id
	sy7sm17055671pac.42.2016.08.06.03.17.34
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 06 Aug 2016 03:17:39 -0700 (PDT)
To: vijay.kilari@gmail.com, qemu-arm@nongnu.org, peter.maydell@linaro.org,
	pbonzini@redhat.com
References: <1470133216-6758-1-git-send-email-vijay.kilari@gmail.com>
	<1470133216-6758-3-git-send-email-vijay.kilari@gmail.com>
From: Richard Henderson <rth@twiddle.net>
Message-ID: <540c4c1d-1590-4c64-116a-e6b41bd3475e@twiddle.net>
Date: Sat, 6 Aug 2016 15:47:28 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.2.0
MIME-Version: 1.0
In-Reply-To: <1470133216-6758-3-git-send-email-vijay.kilari@gmail.com>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400e:c03::232
Subject: Re: [Qemu-arm] [Qemu-devel] [RFC PATCH v1 2/2] utils: Add prefetch
 for Thunderx platform
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
Cc: Prasun.Kapoor@cavium.com, qemu-devel@nongnu.org,
	Vijaya Kumar K <Vijaya.Kumar@cavium.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: BM+v5csaMDxK

On 08/02/2016 03:50 PM, vijay.kilari@gmail.com wrote:
> +#define VEC_PREFETCH(base, index) \
> +        asm volatile ("prfm pldl1strm, [%x[a]]\n" : : [a]"r"(&base[(index)]))

Is this not __builtin_prefetch(base + index) ?

I.e. you can defined this generically for all targets.

> +#if defined (__aarch64__)
> +    do_prefetch = is_thunder_pass2_cpu();
> +    if (do_prefetch) {
> +        VEC_PREFETCH(p, 8);
> +        VEC_PREFETCH(p, 16);
> +        VEC_PREFETCH(p, 24);
> +    }
> +#endif
> +
>      for (i = BUFFER_FIND_NONZERO_OFFSET_UNROLL_FACTOR;
>           i < len / sizeof(VECTYPE);
>           i += BUFFER_FIND_NONZERO_OFFSET_UNROLL_FACTOR) {
> +
> +#if defined (__aarch64__)
> +        if (do_prefetch) {
> +            VEC_PREFETCH(p, i+32);
> +            VEC_PREFETCH(p, i+40);
> +        }
> +#endif
> +

Surely we shouldn't be adding a conditional around a prefetch inside of the 
inner loop.  Does it really hurt to perform this prefetch for all aarch64 cpus?

I'll note that you're also prefetching too much, off the end of the block, and 
that you're probably not prefetching far enough.  You'd need to break off the 
last iteration(s) of the loop.

I'll note that you're also prefetching too close.  The loop operates on 
8*vecsize units.  In the case of aarch64, 128 byte units.  Both i+32 and i+40 
are within the current loop.  I believe you want to prefetch at

   i + BUFFER_FIND_NONZERO_OFFSET_UNROLL_FACTOR * N

where N is the number of iterations in advance to be fetched.  Probably N is 1 
or 2, unless the memory controller is really slow.


r~
