Received: by 2002:a5d:4506:0:0:0:0:0 with SMTP id s6csp108700wrq;
        Thu, 7 Feb 2019 09:45:46 -0800 (PST)
X-Google-Smtp-Source: AHgI3IYKAgmWhjboB5ZRClf1/77D7w2FgBXD6SQDMWqhCy7/X15uqUwOrj+N7sX+m9mbzTgaD6f5
X-Received: by 2002:a25:a1a3:: with SMTP id a32mr13947203ybi.296.1549561545958;
        Thu, 07 Feb 2019 09:45:45 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1549561545; cv=none;
        d=google.com; s=arc-20160816;
        b=Dy658EGrO8NQPlrCXyPj88RN0Hzh4Q5CY61nIYc7Y9VrXmgN3Uk7jft28crEapwFFt
         kpRbvIhuhRnhFFZsaEdfqhZCLqYNMpt1V9C732gGp2kzjiRRKqpn4fmyRdTU/wvpZdLy
         J8kOG2Y6W+SePaw3+poYTkL8pmeTZ57iN6TNo7twvQYLH6GDJIuxIWhE+NuoBS6Dkkbo
         bmRB1QXSiAUPH2Ek0orAKZLoa/paidJ27QSseSnaWlyA0ZRM4vhXwkgRk/ZhXYdfvf6X
         eUjRxyt9lbp7Iln27+8eP770D74keLP/bL4yJqJrv/Fa6n59aRcuTg2zCC4b06UlrQxX
         zyZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=/kGkGlsdqYTc4o9HHWmU5CoEPVKfzGoPjPzspfIsMWc=;
        b=GKVBUOdyrZO/MCqkOAemc1bIQaFeZLjTzVRV6npkm/XmKqiTc3ayufwrKHWpLE029K
         xVjJYz9o0UJZqlImSyEdMcHhiFB/2ydJwKWIDeB9Weho/aBXle7k3wnOXUNZRghvK03H
         Ycv30Khzk3K4z0WpaRHCA69YTyWE9B8hgKzoVPhUJGTYCX1Puk7aAL07iZ0tGAmCjcYJ
         qdlbbrjvK+pMmG1tx7LKp85f5RdDGiGAE8U637wIxDIhJFP9wNVLbO8I9ezDl0o4e1kl
         qCk/qGyA2DUo3XXkRtm5/JDUU5/PX63naKjeewXXGVUveFh7gFrT8ZYAxlcf7FGhrlcS
         DpFw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Gua0BpHO;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t11si6070586ybb.275.2019.02.07.09.45.45
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 07 Feb 2019 09:45:45 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Gua0BpHO;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([127.0.0.1]:44242 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1grnk9-0004ZM-DN
	for alex.bennee@linaro.org; Thu, 07 Feb 2019 12:45:45 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54765)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1grnjK-0004Xp-70
	for qemu-devel@nongnu.org; Thu, 07 Feb 2019 12:44:54 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1grnjG-0004Dx-K9
	for qemu-devel@nongnu.org; Thu, 07 Feb 2019 12:44:52 -0500
Received: from mail-ot1-x342.google.com ([2607:f8b0:4864:20::342]:43821)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1grnjG-0004Dg-Eh
	for qemu-devel@nongnu.org; Thu, 07 Feb 2019 12:44:50 -0500
Received: by mail-ot1-x342.google.com with SMTP id a11so1175436otr.10
	for <qemu-devel@nongnu.org>; Thu, 07 Feb 2019 09:44:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=/kGkGlsdqYTc4o9HHWmU5CoEPVKfzGoPjPzspfIsMWc=;
	b=Gua0BpHOoxeP16S5y07n4r/EAEfY3zQkVS+Lr3nGZRvxqKfxclwflEhlvlbmARo8at
	+phtI3CvB6iwtaR2pOz+Yt4p9ELlXVo7+jl0gE8FAZMyM9YRqzPwuC08oVptJKW4gK9U
	b+y1R+uggo1toPWqmysVc4l/SK0uD2GbeB9X63aCsmgc0JbfpDYaobEvm8AyMff/Lovf
	QLE3/YcgBMiYyUgQjB7i1xkmJmv1s7d2sqcr9duQ9w/eIW5pNTcjV6XnlKEWM03b0KVf
	tix/a7JsTdAyXW6WVXo6a+q16U+06lPvksllSPAXkWM0XfvN27d3lscuPGy/EnYZrc+b
	Fu0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=/kGkGlsdqYTc4o9HHWmU5CoEPVKfzGoPjPzspfIsMWc=;
	b=qz7Vxq7IdO9OufqWg/ID7FsyK31Lj9dKbgTabT1Bdce1IEuFeew+XlMfzk+4RBmF7l
	9RKoLXhroXtDxVWWwtu5aFjrRycw0lCI3ZKGfKaydxRDIQwGrqp8OrwuEjJWGb10ejB8
	cwpsxUmm6bJ9vVyHOnOlMLE/IGeOFEttqxi1y/0QjBh8CHYTwvFHTrqZK1x4JxnlzlLD
	WTsHe0cxFRMgh9pQ/6ZJLD8iHTZDK8FjyX05BhBBdAb7qImHvs5ZvRrI8c6TUfsz0z0s
	qJ9+ESPqVYJt8CHY5qReizC+oO54RUSubv0M561VQxic/A7yRI0CLQpBnHwgtbhDd0pX
	GT4A==
X-Gm-Message-State: AHQUAuYoqaqdHuzsw9wJqlpsauw6tHB9C1ZAgxwOjKB0a6s2KcemBBMU
	TUKyZQc/SBSzcDf5SrAYcIHCbO61b+MEXH0lA1ourg==
X-Received: by 2002:a9d:5a81:: with SMTP id w1mr1190167oth.317.1549561489747; 
	Thu, 07 Feb 2019 09:44:49 -0800 (PST)
MIME-Version: 1.0
References: <20190114011122.5995-1-richard.henderson@linaro.org>
	<20190114011122.5995-14-richard.henderson@linaro.org>
In-Reply-To: <20190114011122.5995-14-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 7 Feb 2019 17:44:38 +0000
Message-ID: <CAFEAcA9c_Fw1YNjV9Gnat6ymHSBVvcfH8xZDgoC2ENAuzCqrTg@mail.gmail.com>
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::342
Subject: Re: [Qemu-devel] [PATCH 13/17] target/arm: Set PSTATE.TCO on
 exception entry
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
X-TUID: WvnQ7lMi9kDp

On Mon, 14 Jan 2019 at 01:12, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> R0085 specifies that exception handlers begin with tag checks overridden.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/helper.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/target/arm/helper.c b/target/arm/helper.c
> index df43deb0f8..1e9ccf0b2e 100644
> --- a/target/arm/helper.c
> +++ b/target/arm/helper.c
> @@ -8830,7 +8830,7 @@ static void arm_cpu_do_interrupt_aarch64(CPUState *cs)
>      qemu_log_mask(CPU_LOG_INT, "...with ELR 0x%" PRIx64 "\n",
>                    env->elr_el[new_el]);
>
> -    pstate_write(env, PSTATE_DAIF | new_mode);
> +    pstate_write(env, PSTATE_DAIF | PSTATE_TCO | new_mode);
>      env->aarch64 = 1;
>      aarch64_restore_sp(env, new_el);

PSTATE_TCO being set doesn't affect codegen for non-MTE CPUs,
right?

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
