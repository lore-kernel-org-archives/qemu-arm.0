Received: by 2002:a5d:51d0:0:0:0:0:0 with SMTP id n16csp7022515wrv;
        Thu, 1 Aug 2019 07:20:56 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxD/vxdBANUA92RzH7XEeeadFIiZAkuDAGVdQKclraXevT7HWnpnDEygnoatHJ4a8/dvNfL
X-Received: by 2002:a1f:5285:: with SMTP id g127mr51570830vkb.83.1564669256756;
        Thu, 01 Aug 2019 07:20:56 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1564669256; cv=pass;
        d=google.com; s=arc-20160816;
        b=R90fSt5hjtR2WZEskUyNdUKpI444X8LrFd5YPP880Xvlli32cuXp/3J2kcKXXR+BF+
         lynXS4TAYV3SSmGPDgQ+g5yC2pg+rY1bmhCTkoemvp1nPKX5vuxlsGX2IS1r8o0BF5Uv
         p9pAcyWEjhDfCF8RSamHpuQ5x797ldYzQV/C6MsUG/F76F6VRiBuk1rnXvRj4XE4AgjA
         D2HCFbL0AXxf3ovxB/UaVV1Gms2Ya+weV1BpYnFj0MbhCd09DIuutxuUyiqC99ePMYpi
         08fK3+/s/xqKVmIMy7Bc0tMyBOjY/I6IkYasOeFtZ1LTlA2v8+EhJ7LXM9scr0HvzU3b
         zfqw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :dkim-signature;
        bh=9/al+RlmCG68yjHS0+nQyhBsMsPmB3jwvG1d2/Kx/6c=;
        b=au/fVniqKGBm6yOlrPjRnltv3Gf2i4pF3qcts3XPO+RFl4Ae8P2B7XG99FLWSXZXfE
         DIcvY8VGPyRpRzRz8OGD0Hh2u4VoqUCN7eC0oNLjJisF6aI4HjScqthhTQxiH6Ys/JT6
         QzHMKETEkYxLHlf4xa2G1Yl/hUVwPsjN1qXNcFZ2iFwRyhAbB+Yl+AVZ2MzBXgJ1zD4M
         H5YLubghWsc/72eZENRg9DbEyVblKmuDay7iyqfEo8epbpHqbcDUsfaFGu0tUWg4cKZo
         8ouo/TA6XlRzHRSsequDO7bE9YFaL/moFvbGFdGFBQHngbo9uUIC2tVGSwF6dihNjrK+
         E1ZQ==
ARC-Authentication-Results: i=2; mx.google.com;
       dkim=pass header.i=@greensocs.com header.s=mail header.b="FLT9z3/o";
       arc=pass (i=1);
       spf=pass (google.com: domain of damien.hedde@greensocs.com designates 5.135.226.135 as permitted sender) smtp.mailfrom=damien.hedde@greensocs.com
Return-Path: <damien.hedde@greensocs.com>
Received: from beetle.greensocs.com (beetle.greensocs.com. [5.135.226.135])
        by mx.google.com with ESMTPS id x5si18014961vsi.291.2019.08.01.07.20.56
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 01 Aug 2019 07:20:56 -0700 (PDT)
Received-SPF: pass (google.com: domain of damien.hedde@greensocs.com designates 5.135.226.135 as permitted sender) client-ip=5.135.226.135;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@greensocs.com header.s=mail header.b="FLT9z3/o";
       arc=pass (i=1);
       spf=pass (google.com: domain of damien.hedde@greensocs.com designates 5.135.226.135 as permitted sender) smtp.mailfrom=damien.hedde@greensocs.com
Received: from [172.16.11.117] (unknown [172.16.11.117])
	by beetle.greensocs.com (Postfix) with ESMTPSA id 4890D96F50;
	Thu,  1 Aug 2019 14:20:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=greensocs.com;
	s=mail; t=1564669254;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9/al+RlmCG68yjHS0+nQyhBsMsPmB3jwvG1d2/Kx/6c=;
	b=FLT9z3/o/CxgwvtVIZVl3Cwv3+Pps5jDo1mU19kl9achq2nRv/kbJ3463lt/tjoH+cJx5Q
	tthfqhVWm+TiQ9vgQxQOWR7dZmnATIdbejEVqvMRlzNeQUAblifDD/qok6WAs1hTvqhrhG
	RWA39rFenrNhBB5pskcC3znMq8GGKOI=
Subject: Re: [Qemu-devel] [PATCH for-4.1] target/arm: Avoid bogus NSACR traps
 on M-profile without Security Extension
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <20190801105742.20036-1-peter.maydell@linaro.org>
From: Damien Hedde <damien.hedde@greensocs.com>
Message-ID: <af347b17-b524-1075-d462-2b0e6eef41a5@greensocs.com>
Date: Thu, 1 Aug 2019 16:20:53 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.1
MIME-Version: 1.0
In-Reply-To: <20190801105742.20036-1-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US-large
Content-Transfer-Encoding: 7bit
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=greensocs.com;
	s=mail; t=1564669254;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9/al+RlmCG68yjHS0+nQyhBsMsPmB3jwvG1d2/Kx/6c=;
	b=nu+c48VnDczwCR2StkbQDAAnq49BC/4KM7Sd4vuQF8o4sj+nM2R30Zx583St1g1H6Z+rgF
	35Tn7Xg2L2VfyvGBCunsXCls+wbkBxjePnwr5MnpMnoMShniP2t98y6eu05vFBYzhoGuRS
	9+5ZIfniBxYprsZKDNy4jn5xm8OBCSQ=
ARC-Seal: i=1; s=mail; d=greensocs.com; t=1564669254; a=rsa-sha256;
	cv=none;
	b=qF7VLBUem9oXMALwJZenCWFpsMLx1nv/hHzHcEJz9C76bm3qblv7thiXRDEyFecCBxkKtF
	R1DOIM+NKpeyFl6uQ8Tp2Tz2CFA/65NIilGpll/rsMlnBZLtiHaeyE+OKmcCG13cKJh4nf
	Q19R1vea/w67vf0SxZuTg8dtPjykJsw=
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=damien smtp.mailfrom=damien.hedde@greensocs.com
X-TUID: wY0FlbmtdvpR


On 8/1/19 12:57 PM, Peter Maydell wrote:
> In Arm v8.0 M-profile CPUs without the Security Extension and also in
> v7M CPUs, there is no NSACR register. However, the code we have to handle
> the FPU does not always check whether the ARM_FEATURE_M_SECURITY bit
> is set before testing whether env->v7m.nsacr permits access to the
> FPU. This means that for a CPU with an FPU but without the Security
> Extension we would always take a bogus fault when trying to stack
> the FPU registers on an exception entry.
> 
> We could fix this by adding extra feature bit checks for all uses,
> but it is simpler to just make the internal value of nsacr 0x3ff

s/0x3ff/0xcff/ I think, given you put 0xcff after and in the code

> ("all non-secure accesses allowed"), since this is not guest
> visible when the Security Extension is not present. This allows
> us to continue to follow the Arm ARM pseudocode which takes a
> similar approach. (In particular, in the v8.1 Arm ARM the register
> is documented as reading as 0xcff in this configuration.)
> 
> Fixes: https://bugs.launchpad.net/qemu/+bug/1838475
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
> I've marked this as for-4.1 because support for M-profile FPU
> is new in this release and this is a pretty bad bug for it.
> It probably doesn't qualify as so bad we need an rc4 but I
> think we need an rc4 anyway and it probably does merit putting
> in at that point.
> 
>  target/arm/cpu.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/target/arm/cpu.c b/target/arm/cpu.c
> index 9eb40ff755f..ec2ab95dbeb 100644
> --- a/target/arm/cpu.c
> +++ b/target/arm/cpu.c
> @@ -266,6 +266,14 @@ static void arm_cpu_reset(CPUState *s)
>               * on ARM_FEATURE_V8 (we don't let the guest see the bit).
>               */
>              env->v7m.aircr = R_V7M_AIRCR_BFHFNMINS_MASK;
> +            /*
> +             * Set NSACR to indicate "NS access permitted to everything";
> +             * this avoids having to have all the tests of it being
> +             * conditional on ARM_FEATURE_M_SECURITY. Note also that from
> +             * v8.1M the guest-visible value of NSACR in a CPU without the
> +             * Security Extension is 0xcff.
> +             */
> +            env->v7m.nsacr = 0xcff;
>          }
>  
>          /* In v7M the reset value of this bit is IMPDEF, but ARM recommends
> 
