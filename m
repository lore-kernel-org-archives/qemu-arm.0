Received: by 2002:a5d:4506:0:0:0:0:0 with SMTP id s6csp47848wrq;
        Thu, 7 Feb 2019 08:50:40 -0800 (PST)
X-Google-Smtp-Source: AHgI3IYYcQW0ynHsGcpvx7MaBLiLiCZGFXfedlT78MqZRlO4tkjmgDZ1Zk3Wfbqkoo0Lneh0HOaM
X-Received: by 2002:a0d:f743:: with SMTP id h64mr13969085ywf.498.1549558239923;
        Thu, 07 Feb 2019 08:50:39 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1549558239; cv=none;
        d=google.com; s=arc-20160816;
        b=vQINwV7NGwCeqBvbZ0/vByOMPCyvD/MVJcMQHq5Nio0BuzfO+3h44Z5q9dhJX8KV88
         Jjjg+88uewL6tH4vOX3L6sWa8ZsR9frbhkzfgmMX9fqcpYLXheFN9YrdZRaECprBPwS4
         RI+y3gvzA8Fh2tt442imxFUQmPj3RA6my+RgKLVZJxI5vKZI5XbrjDDHcMgC+UOExM7r
         FU18/8mNcSMf9wzezmhmLYnr4JfArFGaF0YrPtoZXM2dazMInuZSkMnjM7OJIkSJCm/I
         xBwcWHYFmq2eNgsDMb3P7ONOWbYtcYAGLDdQVRqPa66HEONvmB8KkMAjVClL2cuImy/+
         TcEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=9CroWiN8JOW7prgD82HaxDRH2FEQ0T9/64TAwNcJ410=;
        b=viwNYY99M6TnlqJc2gOAOa5905SdX1VRIvgrhY88kuwi6NiJJQK6ZCV6yKD/psFVy5
         aP9WaUswuvBiNuAndvSepcZhOnSpKYRtuB2pjJcP00kCFzpJgXrgE2co0HjguO8TE54N
         Po1LPWnBIzqD8h3ZEcYdgL5YSPKCAbyBcw5FztzpxkUIgoyfzKqXkvfxYwg2P4Ad6eVm
         ap1TZkex+2IVi3wQ9pXjl1KZS5BnXE9dDe0K/Dl+gLEs/N0FPVBCWhtuEgYa8u0K9fWE
         F3/mlC4mzhJgMSwsVEm6gDz7k2p2ksHwfdi11ZLbcZ3fWfobcQfSl8OVwWIwFyMjNYTA
         wiAw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=G0LIC6LT;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s195si6499866ybs.199.2019.02.07.08.50.39
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 07 Feb 2019 08:50:39 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=G0LIC6LT;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([127.0.0.1]:43204 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1grmsp-0000od-BU
	for alex.bennee@linaro.org; Thu, 07 Feb 2019 11:50:39 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41652)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1grmpu-0007a5-OT
	for qemu-devel@nongnu.org; Thu, 07 Feb 2019 11:47:39 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1grmps-0005db-8L
	for qemu-devel@nongnu.org; Thu, 07 Feb 2019 11:47:38 -0500
Received: from mail-ot1-x343.google.com ([2607:f8b0:4864:20::343]:41603)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1grmpq-0005Zu-AU
	for qemu-devel@nongnu.org; Thu, 07 Feb 2019 11:47:34 -0500
Received: by mail-ot1-x343.google.com with SMTP id u16so857423otk.8
	for <qemu-devel@nongnu.org>; Thu, 07 Feb 2019 08:47:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=9CroWiN8JOW7prgD82HaxDRH2FEQ0T9/64TAwNcJ410=;
	b=G0LIC6LTOA5qvzhMlrIQW799ohynVGz1ws0pQ2fD7xqyPRrhuuxh2s4KRpxquNitSD
	p8H5s90KQwNN3J3Yxx5MvB5oNMUA3KsaVaxIbtB5Tvop0UMdN5C+xNiosfsdU2/wZj4s
	E3QLkDC6ecDmHvGe0B5K53z8BIDk8B/0AnWVlDPqbMMAlT/y9j0iJQBkXnQ2Uh+FYJiW
	rolzess/ZflzXkVYLXJ50wWFNagB5tuUbrIz1MyUgcK6ZY+Vg1xSYdwILt2iRz85OAZ3
	UB+yCr6tsBM1M5ns3xUQ+aSW5j6fNCOSNQp7yxGXIMZ41bfK4X8w1hTEexR+E4Vna8Cl
	yzEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=9CroWiN8JOW7prgD82HaxDRH2FEQ0T9/64TAwNcJ410=;
	b=Bn8GiVlVBOBYoDVQRFRXzxbuQd1YdRly68A7cTqFMxKHXr+F67vMqVoCwkXab+pBt2
	fWI93hMY4ALDrIpib+27wsqIIBr4dNA3vhO1PKlodCF+GJMGgn+xUqW0zAB4uGeW31Iw
	FWu5eh0GK2O0aJaKb4GHKnYm7M5kGdGWRXCK/7EYUS6zqeWyryEeojIgDYoQwTxngIxr
	OavkLHu+dnT52DuDkoL2skCovGmGm3ZZJClLAqnbs8WAplunfQA4dcGK26dd1zU9zOdg
	jHZZimTUIjEMuKP5940G7CHoOxMrm7se5UD8wawZ0yZs3EfdfI3Erj1kcCw2cePgw5e/
	WF0g==
X-Gm-Message-State: AHQUAuZJ/j7uRlshNtupnSc0r0zdti9ssr+BWgd1lwIYBsP8c+YHjIGx
	+7zFOQ0v7z+BOzBxsN1+CihcIisJ/VuNSSrMOxGvMw==
X-Received: by 2002:aca:1913:: with SMTP id l19mr770084oii.112.1549558051382; 
	Thu, 07 Feb 2019 08:47:31 -0800 (PST)
MIME-Version: 1.0
References: <20190114011122.5995-1-richard.henderson@linaro.org>
	<20190114011122.5995-7-richard.henderson@linaro.org>
In-Reply-To: <20190114011122.5995-7-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 7 Feb 2019 16:47:20 +0000
Message-ID: <CAFEAcA9Kcd6a1Af4ChbOH55XRVWfpeCAexJwxH5AwP8Kn_U0+g@mail.gmail.com>
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::343
Subject: Re: [Qemu-devel] [PATCH 06/17] target/arm: Implement the IRG
 instruction
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: AWCbxir+SSo8

On Mon, 14 Jan 2019 at 01:11, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/helper-a64.h    |  1 +
>  target/arm/mte_helper.c    | 55 ++++++++++++++++++++++++++++++++++++++
>  target/arm/translate-a64.c |  7 +++++
>  3 files changed, 63 insertions(+)
>
> diff --git a/target/arm/helper-a64.h b/target/arm/helper-a64.h
> index fa4c371a47..7a6051fdab 100644
> --- a/target/arm/helper-a64.h
> +++ b/target/arm/helper-a64.h
> @@ -104,3 +104,4 @@ DEF_HELPER_FLAGS_2(xpaci, TCG_CALL_NO_RWG_SE, i64, env, i64)
>  DEF_HELPER_FLAGS_2(xpacd, TCG_CALL_NO_RWG_SE, i64, env, i64)
>
>  DEF_HELPER_FLAGS_2(mte_check, TCG_CALL_NO_WG, i64, env, i64)
> +DEF_HELPER_FLAGS_3(irg, TCG_CALL_NO_RWG, i64, env, i64, i64)
> diff --git a/target/arm/mte_helper.c b/target/arm/mte_helper.c
> index 6f4bc0aa04..1878393fc4 100644
> --- a/target/arm/mte_helper.c
> +++ b/target/arm/mte_helper.c
> @@ -36,6 +36,48 @@ static int allocation_tag_from_addr(uint64_t ptr)
>      return (extract64(ptr, 56, 4) + extract64(ptr, 55, 1)) & 15;
>  }
>
> +/* Like ChooseNonExcludedTag, except that GCR_EL1 is already in.  */

I don't understand this comment -- neither the pseudocode
function nor this code refer to GCR_EL1.

> +static int choose_nonexcluded_tag(int tag, int offset, uint16_t exclude)
> +{
> +    if (exclude != 0xffff) {
> +        int i;
> +        for (i = 0; i < offset; ++i) {
> +            do {
> +                tag = (tag + 1) & 15;
> +            } while (exclude & (1 << tag));
> +        }
> +    }
> +    return tag;

This doesn't seem to do the same thing as ChooseNonExcludedTag()
for the offset==0 case, or for the exclude == 0xffff case.

> +}
> +
> +static int choose_random_nonexcluded_tag(CPUARMState *env, uint16_t exclude)
> +{
> +    /* Ignore GCR_EL1.RRND.  Always produce deterministic results.  */

This comment is trying to say that our IMPDEF choice for GCR_EL1.RRND==1
is "behave the same as if RRND==0", right? I think that would be
clearer as a comment at the callsite, because if you're following
along with the pseudocode you expect the IRG code to do an
"if RRND == 1 then { choose_random_nonexcluded_tag(); } else { ... }".

thanks
-- PMM
