Received: by 10.28.71.155 with SMTP id m27csp2646337wmi;
        Mon, 9 Apr 2018 07:49:37 -0700 (PDT)
X-Google-Smtp-Source: AIpwx4+GHRPw5i/qQ6YDqz7q3iq7UQ0vM+56BJYlMQWojOyGcS2kUpZs4Nm5bzmtxgm/ZWZCmV04
X-Received: by 10.55.15.81 with SMTP id z78mr50936093qkg.104.1523285377604;
        Mon, 09 Apr 2018 07:49:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1523285377; cv=none;
        d=google.com; s=arc-20160816;
        b=jwijNicejnC3sFkwBke/mZ5j8PDWpu15FJ4jlc8Kbr1bmgxjtevgJ/0KKf9kGZProM
         1MZo4B4k2bezYfQH9Ra4l+NyCy2egYvA+xpEE0VMpGGT3/scUJTKF3G/hf8KHd2P1HcW
         6HMiQYBbz9vq8z0VOBgYs7Qo+TE01F1gbbR88SL/nXFP0i3+mBn97jjP7WnkM7SZtLOs
         tOP0u5fFOiYyZMg1wQ/YdM0tN9HzqH+rkHW/S8g7YU2rBanILLKdh/RLp+RB6v+N1b9E
         8pBYhLeqwnXUhaGdZKH97V7s7x4VHGcB5j3xWBuq6fsuD56+G8NCr/iFH756pw/ZYmxs
         osiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:autocrypt:openpgp:from:references:to
         :arc-authentication-results;
        bh=ORKU/BBzC6Qry5/daEqxy1ijeJ0GSW/nqvhKya+zDs4=;
        b=ck/de2yuSRtwu0sOPAMBOez+swyB1XEpmhKejKNsHKevcqMTob6ArPdWSJbOUh2b+R
         u4RhX5IiBdbX293vYZipiggvAahS2m2zzvDZ6X6k5wtva8qlPooc2FK2HLZtxOCfFJXt
         aGLqOcXXdhNQ7ETwA/bLyM6MC4NR1xAzcQLjWVYXOcRpwgRnTf6yHLK34o1Tw8t4qLUF
         iuye2YCaz23WSY2rP8j1EFkyEuZAm3MQVBzoYpiHhs7Rm05tmNnW20ls+ZMArFwpD/6z
         Um43VNmF+bAgI55boNAC6rxGi7hCs31zAydOU9Lr9/Lm8QoIwl4cRIdP1pGiREE2Kqov
         RHLA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id n137si587519qke.4.2018.04.09.07.49.37
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 09 Apr 2018 07:49:37 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:44018 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1f5Y6z-0003i7-2B
	for alex.bennee@linaro.org; Mon, 09 Apr 2018 10:49:37 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58721)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1f5Y6n-0003fi-Tm
	for qemu-arm@nongnu.org; Mon, 09 Apr 2018 10:49:27 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1f5Y6k-0003uU-1L
	for qemu-arm@nongnu.org; Mon, 09 Apr 2018 10:49:25 -0400
Received: from mout.kundenserver.de ([212.227.126.133]:39855)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <laurent@vivier.eu>)
	id 1f5Y6j-0003tp-NJ; Mon, 09 Apr 2018 10:49:21 -0400
Received: from [192.168.100.1] ([78.238.229.36]) by mrelayeu.kundenserver.de
	(mreue001 [212.227.15.167]) with ESMTPSA (Nemesis) id
	0Lc3GP-1eg4ek3OtB-00jXj6; Mon, 09 Apr 2018 16:49:00 +0200
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
References: <20180409140714.26841-1-peter.maydell@linaro.org>
From: Laurent Vivier <laurent@vivier.eu>
Openpgp: preference=signencrypt
Autocrypt: addr=laurent@vivier.eu; prefer-encrypt=mutual; keydata=
	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
Message-ID: <0df7ebc7-421b-3ee7-bc45-4aafa3801009@vivier.eu>
Date: Mon, 9 Apr 2018 16:48:57 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.7.0
MIME-Version: 1.0
In-Reply-To: <20180409140714.26841-1-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:FC18bOUYonKTfM2R3939O45xWtQsEBp6Zc5jYJpkQ9hFucy1+9H
	3JoGV8JQ03waMy2MsQ9CmCYDWTIkN6R8dY0a3zJW+br7EHSjfdkftm925XEGHJJKIiRM9P9
	sbP/7IREyiISdwL0IX7pOxFa+dW+5nFYHFiKeuAQPLgo0QYo1H0M8uOVkvLo3pHl7Lzjmv6
	Yy76OxKijLKyE9c9myo8Q==
X-UI-Out-Filterresults: notjunk:1;V01:K0:9e/CHLDKU/w=:FRvIWVKjPxR8wy6C2zU4N1
	G2QT8PB1QvQNPQYR0AgEF9Q6oC5T9fWGcZMeo0e27U984s8u4cAqBHfG1F/rLsY8yEdzVssMp
	nvDAjG4YLx4Q1fyVcrXmUz81qcvkAjFTb0XspkX8f9v3okhnkrF4Z3PWZwnsqWyQBBu1zvkyS
	0KBwp8Rv9QdMCz7Vgxc6d4lod7nvdCSwaMI6ARGXN+8WY0HDnRUdUGaxJKJhohtnq2FOUjpVk
	orr014+Xm+PvlKdj+HHg2TpxpOX58eTewyXU9LNqMuqNVsJ+1psXVqg+MEZIMCF+KT764mOnC
	i2UeYKNtXLgDAuEZYcyzm4VCiWPe5Q60K9OS0aFkCrVBvqH7mnjWu0VAZs2Jsi7e4pkb4pZst
	XDeb7dKy3TEheJ5mZ8gdb4kllaOIm9l5t4kaFNP5n3V/XK1emC496rf4qnjygtE0Uh4OU67lY
	FryGTfjOGNS4/vOQKcRsodhW/50PEpI/vdLqjguq+ZuavTOxOr7OyxefYrHvSxEL6cTYDRtJ0
	4XilbYV2M1xYWhJtF/VNfkFt1jOuLUk41yobB+2fdBCNASk1SscLhovjVUmaaCH29RPcg5roC
	gK7sMN/BbmUdrCFnZO3qDs0+dO5DxYrntIfaePnPyX7tujAm85SMQao6HadvVbIVeBrHhsNng
	3eatyjWGybe4t9cNuPt3CAIVJeTSVp4ReMHLAFxxIHnUiAi2Y0sLsmXBofbuIIyaJupTJgRlz
	4oLSKlVtpSvi+H6oCe4EGq9YyfVSVRFGbPGG8oh5z2HONXJTJTBSvNlLawk=
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 212.227.126.133
Subject: Re: [Qemu-arm] [PATCH for-2.12] linux-user/signal.c: Ensure AArch64
 signal frame isn't too small
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
	Richard Henwood <richard.henwood@arm.com>, patches@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: oAxP3Ahkio1Q

Le 09/04/2018 à 16:07, Peter Maydell a écrit :
> The AArch64 signal frame design was extended for SVE in commit
> 8c5931de0ac77388096d79ceb, so that instead of having a fixed setup we
> now add various records to the frame, with some of them possibly
> overflowing into an extra space outside the original 4K reserved
> block in the target_sigcontext.  However, we failed to ensure that we
> always at least allocate the 4K reserved block.  This is ABI, and
> some userspace programs rely on it.  In particular the dash shell
> would segfault if the frame wasn't as big enough.
> 
> (Compare the kernel's sigframe_size() function in
> arch/arm64/kernel/signal.c.)
> 
> Reported-by: Richard Henwood <richard.henwood@arm.com>
> Fixes: https://bugs.launchpad.net/bugs/1761535
> Fixes: 8c5931de0ac77388096d79ceb
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  linux-user/signal.c | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/linux-user/signal.c b/linux-user/signal.c
> index 046d4c8aa0..8d9e6e8410 100644
> --- a/linux-user/signal.c
> +++ b/linux-user/signal.c
> @@ -1850,6 +1850,12 @@ static void target_setup_frame(int usig, struct target_sigaction *ka,
>      fr_ofs = layout.total_size;
>      layout.total_size += sizeof(struct target_rt_frame_record);
>  
> +    /* We must always provide at least the standard 4K reserved space,
> +     * even if we don't use all of it (this is part of the ABI)
> +     */
> +    layout.total_size = MAX(layout.total_size,
> +                            sizeof(struct target_rt_sigframe));
> +
>      frame_addr = get_sigframe(ka, env, layout.total_size);
>      trace_user_setup_frame(env, frame_addr);
>      if (!lock_user_struct(VERIFY_WRITE, frame, frame_addr, 0)) {
> 

Reviewed-by: Laurent Vivier <laurent@vivier.eu>

