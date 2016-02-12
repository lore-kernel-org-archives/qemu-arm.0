Received: by 10.25.159.19 with SMTP id i19csp703979lfe;
        Fri, 12 Feb 2016 01:34:57 -0800 (PST)
X-Received: by 10.140.106.165 with SMTP id e34mr563603qgf.23.1455269697326;
        Fri, 12 Feb 2016 01:34:57 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id g17si14911813qge.21.2016.02.12.01.34.57
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 12 Feb 2016 01:34:57 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@gmail.com;
       dmarc=fail (p=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:59164 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aUA7s-0002RD-IP
	for alex.bennee@linaro.org; Fri, 12 Feb 2016 04:34:56 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58633)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <serge.fdrv@gmail.com>) id 1aUA7q-0002Qo-20
	for qemu-arm@nongnu.org; Fri, 12 Feb 2016 04:34:54 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <serge.fdrv@gmail.com>) id 1aUA7l-0001at-32
	for qemu-arm@nongnu.org; Fri, 12 Feb 2016 04:34:53 -0500
Received: from mail-lb0-x242.google.com ([2a00:1450:4010:c04::242]:35685)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <serge.fdrv@gmail.com>)
	id 1aUA7k-0001aO-M6; Fri, 12 Feb 2016 04:34:49 -0500
Received: by mail-lb0-x242.google.com with SMTP id dx9so3334692lbc.2;
	Fri, 12 Feb 2016 01:34:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:to:references:cc:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-type:content-transfer-encoding;
	bh=Ws/KLMmxq7Tel+9iTIvGMUvJZsH3OTNP76mNr1PhWlk=;
	b=L4n6h9j98p2gy3EeRaRtXYixRlufzgXO/xzvPTKLLQ/+ThBN4faIdhy1YYxthuzfxd
	N3cnpjLndV9LW5OnxgqOS/pNz1cO7tJnTqKz07FNQpJdGvGVjh5eXCnGTLWcQLUINND/
	6RgDnvOArvAyu+zhV+amtTxtjSWluCrv5DdZ264ObgbsZ5dp/vgaUplRM8f5ejVVI8Xl
	qWbRCxcPx1LmFaOCX4LnRkgPrBuk1FbjeidemQOON6IHcH/0lUnGthamdhT9n5RR/zF7
	80cjgpqHGfUXL+rjIujyWM5vheizeGH0YT6qByEXMJRSdcFQ8K/rr1Wv1Bt9oLylB6FM
	myPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:to:references:cc:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-type
	:content-transfer-encoding;
	bh=Ws/KLMmxq7Tel+9iTIvGMUvJZsH3OTNP76mNr1PhWlk=;
	b=NFd8g141mwIltT1IFthWE5RxKaFV5fgWTyeiGmhLXHsI8jJguudIiKRwol+53v6QFo
	RSXpjvyYkItI0d7qri/DibeAi8qhAzOn6SUW7HlfBJxhTwxmZ5j61zII5Xp3D5WFZd5Z
	vOFIWb9hjoCB2/ow3hRdKQMio9Yb0a5TXcuTOpreRikipemJ4MFqrk7zxHRp1YC/MLTz
	7vtG2oIX+BeRpMU0uIyTedjX+sI2PXUyujN1yVR6Nv8WWfyJkyi03NjZqlNFxItvwa7O
	iQeFNJLLET6Ddd7PEeTQir5oTnFbBMh1QtOjVyXIaz2Zfp3IptUuGqVwfd0aczl93uLQ
	NdJw==
X-Gm-Message-State: AG10YOQQFfX9ptwgEPX9fIAv9wMsHuOWJETRTysgj4J34wSEbJOop3QQHm/wQJ3pTpDHeg==
X-Received: by 10.112.147.41 with SMTP id th9mr238385lbb.74.1455269687747;
	Fri, 12 Feb 2016 01:34:47 -0800 (PST)
Received: from [192.168.0.71] (broadband-46-188-121-154.2com.net.
	[46.188.121.154]) by smtp.googlemail.com with ESMTPSA id
	g74sm1793622lfi.1.2016.02.12.01.34.46
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 12 Feb 2016 01:34:46 -0800 (PST)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
References: <1455217909-28317-1-git-send-email-peter.maydell@linaro.org>
	<1455217909-28317-5-git-send-email-peter.maydell@linaro.org>
From: Sergey Fedorov <serge.fdrv@gmail.com>
Message-ID: <56BDA736.3070008@gmail.com>
Date: Fri, 12 Feb 2016 12:34:46 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.5.1
MIME-Version: 1.0
In-Reply-To: <1455217909-28317-5-git-send-email-peter.maydell@linaro.org>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2a00:1450:4010:c04::242
Cc: qemu-arm@nongnu.org, patches@linaro.org
Subject: Re: [Qemu-arm] [PATCH 4/4] target-arm: UNDEF in the UNPREDICTABLE
 SRS-from-System case
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: 2g6WAQFlnEll

On 11.02.2016 22:11, Peter Maydell wrote:
> Make get_r13_banked() raise an exception at runtime for the
> corner case of SRS from System mode, so that we can UNDEF it;
> this brings us in to line with the ARM ARM's set of permitted
> CONSTRAINED UNPREDICTABLE choices.
>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

It's a bit misleading that the name "get_r13_banked" says nothing about
SRS instruction but raises an SRS-specific exception. Though, it's only
used for SRS and there seems to be no other candidate to use it; so

Reviewed-by: Sergey Fedorov <serge.fdrv@gmail.com>

> ---
>  target-arm/op_helper.c | 8 ++++++++
>  target-arm/translate.c | 9 +++++----
>  2 files changed, 13 insertions(+), 4 deletions(-)
>
> diff --git a/target-arm/op_helper.c b/target-arm/op_helper.c
> index 05f97a7..8183108 100644
> --- a/target-arm/op_helper.c
> +++ b/target-arm/op_helper.c
> @@ -474,6 +474,14 @@ uint32_t HELPER(get_r13_banked)(CPUARMState *env, uint32_t mode)
>  #if defined(CONFIG_USER_ONLY)
>      g_assert_not_reached();
>  #endif
> +    if ((env->uncached_cpsr & CPSR_M) == ARM_CPU_MODE_SYS) {
> +        /* SRS instruction is UNPREDICTABLE from System mode; we UNDEF.
> +         * Other UNPREDICTABLE and UNDEF cases were caught at translate time.
> +         */
> +        raise_exception(env, EXCP_UDEF, syn_uncategorized(),
> +                        exception_target_el(env));
> +    }
> +
>      if ((env->uncached_cpsr & CPSR_M) == mode) {
>          return env->regs[13];
>      } else {
> diff --git a/target-arm/translate.c b/target-arm/translate.c
> index 7bceb05..e69145d 100644
> --- a/target-arm/translate.c
> +++ b/target-arm/translate.c
> @@ -7590,10 +7590,7 @@ static void gen_srs(DisasContext *s,
>       * -- not a valid mode number
>       * -- a mode that's at a higher exception level
>       * -- Monitor, if we are Non-secure
> -     * For the UNPREDICTABLE cases we choose to UNDEF, except that for
> -     * "current mode is System" we will write a garbage SPSR.
> -     * (This is because we don't have access to our current mode here
> -     * and would have to do a runtime check to UNDEF for System.)
> +     * For the UNPREDICTABLE cases we choose to UNDEF.
>       */
>      if (s->current_el == 1 && !s->ns) {
>          gen_exception_insn(s, 4, EXCP_UDEF, syn_uncategorized(), 3);
> @@ -7639,6 +7636,9 @@ static void gen_srs(DisasContext *s,
>  
>      addr = tcg_temp_new_i32();
>      tmp = tcg_const_i32(mode);
> +    /* get_r13_banked() will raise an exception if called from System mode */
> +    gen_set_condexec(s);
> +    gen_set_pc_im(s, s->pc - 4);
>      gen_helper_get_r13_banked(addr, cpu_env, tmp);
>      tcg_temp_free_i32(tmp);
>      switch (amode) {
> @@ -7688,6 +7688,7 @@ static void gen_srs(DisasContext *s,
>          tcg_temp_free_i32(tmp);
>      }
>      tcg_temp_free_i32(addr);
> +    s->is_jmp = DISAS_UPDATE;
>  }
>  
>  static void disas_arm_insn(DisasContext *s, unsigned int insn)

