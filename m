Received: by 10.28.71.155 with SMTP id m27csp812097wmi;
        Fri, 13 Apr 2018 07:19:09 -0700 (PDT)
X-Google-Smtp-Source: AIpwx48m4dgwF9eMqnIRidSQ+76gqyNLBB31xF3DchMvrOrEcQhhnKYeaa/p9wEomHRIMzdfIEYD
X-Received: by 10.55.73.138 with SMTP id w132mr4755335qka.62.1523629149663;
        Fri, 13 Apr 2018 07:19:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1523629149; cv=none;
        d=google.com; s=arc-20160816;
        b=cafoMxEbWtjdR93Zus2URAbnN5eXizom59kROoIzYdue7azsMz92TMM8oPf0y403V5
         28R3XsgLeXHsasnIDEsv5LSJ7ixXBXbE4hImKn1veWd7tfqdrsobtgkcHEXlvSMZP5bz
         jOQwwuhFLRtAbQHnE+zu7uRdTvnGR2HMiMp6/8PcQy0pRBdYaTahzpwy/zJKqs5pY6Eo
         aZL8+a3jhutzjsDxCL92AtUfAADC3DEXQ+Wfct3fnE7HHpuYcJLCITabK6ss6H5AsXRz
         x9p9chXUyrd6oPi6g3CZ9rhkj8rEodUlvPNHnn0gPV7oIS5vfR6Rw2RoIVoxYMPesmxH
         w2Dw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:autocrypt:openpgp:from:references:to
         :arc-authentication-results;
        bh=4lyQygtcWHGbFB5mS/su5V8SHqiuxEP6SmbR0BiB5QI=;
        b=MTNP78chOmP+w9uObQtjMRHausbdceZGyKOylb+jLjYSj5AnJkz/EOZIlip26D1wkD
         R/UdDkMmjoSptc7BAN4sNuAlBM9OqTEjK+Y3qV6XMZWXeWk/0hV6WOBFoh4LwO+/VYIG
         51KqrdaSLPfJnMTbWWxJE3abVESY9nXJVtdygoc+wzXMcF3Oh8AaGdb48036qX+FTTXj
         1h1Q7gFPaIiTIl8WToqplRvVlYUV1tbsell0J0/bVrrWP6QXZEHk+qOE3B0A9b7vzCc1
         5ssuCrS4ccQq2KqknG5biB0BQenG95uAqFLi96KGzz8eoIqgsZRyLv74CC+HmW/rkAU8
         RHsw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id n188si4269105qkf.48.2018.04.13.07.19.09
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 13 Apr 2018 07:19:09 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:56746 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1f6zXh-0007wE-2y
	for alex.bennee@linaro.org; Fri, 13 Apr 2018 10:19:09 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55513)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1f6zXL-0007n3-1a
	for qemu-arm@nongnu.org; Fri, 13 Apr 2018 10:18:52 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1f6zXF-00017b-L3
	for qemu-arm@nongnu.org; Fri, 13 Apr 2018 10:18:47 -0400
Received: from mout.kundenserver.de ([217.72.192.73]:39723)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <laurent@vivier.eu>)
	id 1f6zXF-000169-AB; Fri, 13 Apr 2018 10:18:41 -0400
Received: from [192.168.100.1] ([78.238.229.36]) by mrelayeu.kundenserver.de
	(mreue105 [212.227.15.183]) with ESMTPSA (Nemesis) id
	0LylEN-1eMOmN2RyJ-0169ZG; Fri, 13 Apr 2018 16:18:24 +0200
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
References: <20180412140222.2096-1-peter.maydell@linaro.org>
From: Laurent Vivier <laurent@vivier.eu>
Openpgp: preference=signencrypt
Autocrypt: addr=laurent@vivier.eu; prefer-encrypt=mutual; keydata=
	xsFNBFYFJhkBEAC2me7w2+RizYOKZM+vZCx69GTewOwqzHrrHSG07MUAxJ6AY29/+HYf6EY2
	WoeuLWDmXE7A3oJoIsRecD6BXHTb0OYS20lS608anr3B0xn5g0BX7es9Mw+hV/pL+63EOCVm
	SUVTEQwbGQN62guOKnJJJfphbbv82glIC/Ei4Ky8BwZkUuXd7d5NFJKC9/GDrbWdj75cDNQx
	UZ9XXbXEKY9MHX83Uy7JFoiFDMOVHn55HnncflUncO0zDzY7CxFeQFwYRbsCXOUL9yBtqLer
	Ky8/yjBskIlNrp0uQSt9LMoMsdSjYLYhvk1StsNPg74+s4u0Q6z45+l8RAsgLw5OLtTa+ePM
	JyS7OIGNYxAX6eZk1+91a6tnqfyPcMbduxyBaYXn94HUG162BeuyBkbNoIDkB7pCByed1A7q
	q9/FbuTDwgVGVLYthYSfTtN0Y60OgNkWCMtFwKxRaXt1WFA5ceqinN/XkgA+vf2Ch72zBkJL
	RBIhfOPFv5f2Hkkj0MvsUXpOWaOjatiu0fpPo6Hw14UEpywke1zN4NKubApQOlNKZZC4hu6/
	8pv2t4HRi7s0K88jQYBRPObjrN5+owtI51xMaYzvPitHQ2053LmgsOdN9EKOqZeHAYG2SmRW
	LOxYWKX14YkZI5j/TXfKlTpwSMvXho+efN4kgFvFmP6WT+tPnwARAQABzSNMYXVyZW50IFZp
	dmllciA8bHZpdmllckByZWRoYXQuY29tPsLBeAQTAQIAIgUCVgVQgAIbAwYLCQgHAwIGFQgC
	CQoLBBYCAwECHgECF4AACgkQ8ww4vT8vvjwpgg//fSGy0Rs/t8cPFuzoY1cex4limJQfReLr
	SJXCANg9NOWy/bFK5wunj+h/RCFxIFhZcyXveurkBwYikDPUrBoBRoOJY/BHK0iZo7/WQkur
	6H5losVZtrotmKOGnP/lJYZ3H6OWvXzdz8LL5hb3TvGOP68K8Bn8UsIaZJoeiKhaNR0sOJyI
	YYbgFQPWMHfVwHD/U+/gqRhD7apVysxv5by/pKDln1I5v0cRRH6hd8M8oXgKhF2+rAOL7gvh
	jEHSSWKUlMjC7YwwjSZmUkL+TQyE18e2XBk85X8Da3FznrLiHZFHQ/NzETYxRjnOzD7/kOVy
	gKD/o7asyWQVU65mh/ECrtjfhtCBSYmIIVkopoLaVJ/kEbVJQegT2P6NgERC/31kmTF69vn8
	uQyW11Hk8tyubicByL3/XVBrq4jZdJW3cePNJbTNaT0d/bjMg5zCWHbMErUib2Nellnbg6bc
	2HLDe0NLVPuRZhHUHM9hO/JNnHfvgiRQDh6loNOUnm9Iw2YiVgZNnT4soUehMZ7au8PwSl4I
	KYE4ulJ8RRiydN7fES3IZWmOPlyskp1QMQBD/w16o+lEtY6HSFEzsK3o0vuBRBVp2WKnssVH
	qeeV01ZHw0bvWKjxVNOksP98eJfWLfV9l9e7s6TaAeySKRRubtJ+21PRuYAxKsaueBfUE7ZT
	7zfOwU0EVgUmGQEQALxSQRbl/QOnmssVDxWhHM5TGxl7oLNJms2zmBpcmlrIsn8nNz0rRyxT
	460k2niaTwowSRK8KWVDeAW6ZAaWiYjLlTunoKwvF8vP3JyWpBz0diTxL5o+xpvy/Q6YU3BN
	efdq8Vy3rFsxgW7mMSrI/CxJ667y8ot5DVugeS2NyHfmZlPGE0Nsy7hlebS4liisXOrN3jFz
	asKyUws3VXek4V65lHwB23BVzsnFMn/bw/rPliqXGcwl8CoJu8dSyrCcd1Ibs0/Inq9S9+t0
	VmWiQWfQkz4rvEeTQkp/VfgZ6z98JRW7S6l6eophoWs0/ZyRfOm+QVSqRfFZdxdP2PlGeIFM
	C3fXJgygXJkFPyWkVElr76JTbtSHsGWbt6xUlYHKXWo+xf9WgtLeby3cfSkEchACrxDrQpj+
	Jt/JFP+q997dybkyZ5IoHWuPkn7uZGBrKIHmBunTco1+cKSuRiSCYpBIXZMHCzPgVDjk4viP
	brV9NwRkmaOxVvye0vctJeWvJ6KA7NoAURplIGCqkCRwg0MmLrfoZnK/gRqVJ/f6adhU1oo6
	z4p2/z3PemA0C0ANatgHgBb90cd16AUxpdEQmOCmdNnNJF/3Zt3inzF+NFzHoM5Vwq6rc1JP
	jfC3oqRLJzqAEHBDjQFlqNR3IFCIAo4SYQRBdAHBCzkM4rWyRhuVABEBAAHCwV8EGAECAAkF
	AlYFJhkCGwwACgkQ8ww4vT8vvjwg9w//VQrcnVg3TsjEybxDEUBm8dBmnKqcnTBFmxN5FFtI
	WlEuY8+YMiWRykd8Ln9RJ/98/ghABHz9TN8TRo2b6WimV64FmlVn17Ri6FgFU3xNt9TTEChq
	AcNg88eYryKsYpFwegGpwUlaUaaGh1m9OrTzcQy+klVfZWaVJ9Nw0keoGRGb8j4XjVpL8+2x
	OhXKrM1fzzb8JtAuSbuzZSQPDwQEI5CKKxp7zf76J21YeRrEW4WDznPyVcDTa+tz++q2S/Bp
	P4W98bXCBIuQgs2m+OflERv5c3Ojldp04/S4NEjXEYRWdiCxN7ca5iPml5gLtuvhJMSy36gl
	U6IW9kn30IWuSoBpTkgV7rLUEhh9Ms82VWW/h2TxL8enfx40PrfbDtWwqRID3WY8jLrjKfTd
	R3LW8BnUDNkG+c4FzvvGUs8AvuqxxyHbXAfDx9o/jXfPHVRmJVhSmd+hC3mcQ+4iX5bBPBPM
	oDqSoLt5w9GoQQ6gDVP2ZjTWqwSRMLzNr37rJjZ1pt0DCMMTbiYIUcrhX8eveCJtY7NGWNyx
	FCRkhxRuGcpwPmRVDwOl39MB3iTsRighiMnijkbLXiKoJ5CDVvX5yicNqYJPKh5MFXN1bvsB
	kmYiStMRbrD0HoY1kx5/VozBtc70OU0EB8Wrv9hZD+Ofp0T3KOr1RUHvCZoLURfFhSQ=
Message-ID: <380f519b-03e8-db3c-35db-4fe45aa2424d@vivier.eu>
Date: Fri, 13 Apr 2018 16:18:22 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.7.0
MIME-Version: 1.0
In-Reply-To: <20180412140222.2096-1-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:OBZaHU09Qq6dm4pANv29zabJnRjBmyZwt/lW1pdH4X2mnVIAFjk
	Nj/s4gYqIYEhe/9HeO3cp+APwRRUvA33YRQ6R9ShYHriAGPrXXo+MjjGRVTuj9yNVSyjdue
	ca+Z6e9JkZlqw9LCkS4qk+DeoDUXexKZrTdh5o6n6oXkYRNDOmTLYVN8SlGwL6Lfd+MAa17
	YTaYVPBltvkwps112lbmA==
X-UI-Out-Filterresults: notjunk:1;V01:K0:0KBGQdlhjjs=:oOjbtXgZSqVIoN4AHE1kSc
	NktQApxNHOUdQGWmCs5dOhs8y2Cg9WISQvD7C3jptgrbmOVzTwBCI7km1G4D33QkRix1zzuK6
	95DlEA8Cm8/5t7gzW4kO4VwNRbzO70xic6HBOdGmuFEnfLpx3EMX/8nHbuOOxH81AK7eRlGwN
	n0KmzDbNkCR0PTkGiSFRaG7yqeMnQoeHJUtYmD/nVEKsxT6o9HEHnxH1zHyB3OoUFqZkJxLPj
	ctmAlJbantD9n8IhDtvOwuNuvsMR+BD5LnqdlpcIuCcYx7hNEYaWDw6dZTLpdYF2UriQOWl9Z
	L2KsJ+5UQIImnVjMSJLsy/g76n/hqnMyKUmGjHwxbehyciBZ3h0zkinP3uDj1RdZuR/2gB2LD
	6ZALOnePb9Lg5vWKdaA+NKzxteFPIpMGeH6mFRwVGXm/vDPwFdAJx3RogyX5E0d0bAOKyEg4Q
	du9LRmSTUiAZw31V4Fx7ZagF64ZHehAp8nWF/RsHZEx4zzNyKEAvHzcHc2ER8tUf/CFZkcSQ7
	TKQBSd/fJxAteDfkDFEAbDh5DrIisR28WCKn1ftRiUIGjho5sixsgqhPpsxrw072mcvTNgwkV
	6yJBOngWYeCQarWu94tVvai6yEUJdOMUW3WgFm3hQzr3iGF22H+QHjo42elwMIi62HTEb7GiS
	WnoGsKGAD1aiK3k3Fv+CyUafCggQMO4hN+IO1wqMh65glScMa6yAuASdrpdhdVxQUa/8VGpGI
	rZCe91tyJgqgxpPdNL284iRzG8+BfJnRTBigf4IQoEUnaDbRWOFlt42Cc5g=
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 217.72.192.73
Subject: Re: [Qemu-arm] [PATCH for-2.12] linux-user/signal.c: Put AArch64
 frame record in the right place
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
Cc: Riku Voipio <riku.voipio@iki.fi>, Richard Henderson <rth@twiddle.net>,
	patches@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: OOV5f0QXOGsY

Le 12/04/2018 à 16:02, Peter Maydell a écrit :
> AArch64 stack frames include a 'frame record' which holds a pointer
> to the next frame record in the chain and the LR on entry to the
> function. The procedure calling standard doesn't mandate where
> exactly this frame record is in the stack frame, but for signal
> frames the kernel puts it right at the top. We used to put it
> there too, but in commit 7f0f4208b3a96f22 we accidentally put
> the "enlarge to the 4K reserved space minimum" check after the
> "allow for the frame record" code, rather than before it, with
> the effect that the frame record would be inside the reserved
> space and immediately after the last used part of it.
> 
> Move the frame record back out of the reserved space to where
> we used to put it.
> 
> This bug shouldn't break any sensible guest code, but test
> programs that deliberately look at the internal details
> of the signal frame layout will not find what they are
> expecting to see.
> 
> Fixes: 7f0f4208b3a96f22
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
> I'm marking this as for-2.12 on the basis that it puts our frame
> layout back to exactly what 2.11 had, and so seems safest.
> No sensible guest code should really care, though, so this is
> in the "only if we're doing an rc4" bucket; but I think that the
> softfloat fixes deserve an rc4 anyway.
> 
>  linux-user/signal.c | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/linux-user/signal.c b/linux-user/signal.c
> index 8d9e6e8410..e6dfe0adfd 100644
> --- a/linux-user/signal.c
> +++ b/linux-user/signal.c
> @@ -1843,6 +1843,12 @@ static void target_setup_frame(int usig, struct target_sigaction *ka,
>          layout.total_size += sizeof(struct target_aarch64_ctx);
>      }
>  
> +    /* We must always provide at least the standard 4K reserved space,
> +     * even if we don't use all of it (this is part of the ABI)
> +     */
> +    layout.total_size = MAX(layout.total_size,
> +                            sizeof(struct target_rt_sigframe));
> +
>      /* Reserve space for the return code.  On a real system this would
>       * be within the VDSO.  So, despite the name this is not a "real"
>       * record within the frame.
> @@ -1850,12 +1856,6 @@ static void target_setup_frame(int usig, struct target_sigaction *ka,
>      fr_ofs = layout.total_size;
>      layout.total_size += sizeof(struct target_rt_frame_record);
>  
> -    /* We must always provide at least the standard 4K reserved space,
> -     * even if we don't use all of it (this is part of the ABI)
> -     */
> -    layout.total_size = MAX(layout.total_size,
> -                            sizeof(struct target_rt_sigframe));
> -
>      frame_addr = get_sigframe(ka, env, layout.total_size);
>      trace_user_setup_frame(env, frame_addr);
>      if (!lock_user_struct(VERIFY_WRITE, frame, frame_addr, 0)) {
> 

It's hard to compare this code with the one in kernel, but if I compare
the offset of "fr" in QEMU and the one of "next_frame" they seem identical.

Reviewed-by: Laurent Vivier <laurent@vivier.eu>





