Received: by 10.28.71.27 with SMTP id u27csp4754719wma;
        Tue, 27 Feb 2018 04:17:08 -0800 (PST)
X-Google-Smtp-Source: AG47ELsRd+E4ikUSxPXvTqXs6Jk7dcvZnhN6Tr0GRwHlOiWYWRZGSSI2zp93FGucokL/QyUhkBoi
X-Received: by 2002:a25:1345:: with SMTP id 66-v6mr9294564ybt.421.1519733828879;
        Tue, 27 Feb 2018 04:17:08 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1519733828; cv=none;
        d=google.com; s=arc-20160816;
        b=J2IhsZTpHOpCcOZ4J6Rc7Ls6ta7Y1UidJ9c72T8OcUthTZPaVg0pT3jtFE/oRgLJGS
         /ZggC0EgIHAwGpCgzXYbVDB7CIiqyU7Ukf/oSPsUoXUlSj22Ls5gavg3UZcAnime2S8E
         DqeMAjAPMntDTrc7L21ONgJGxwp44qmBhB8UpnO98lkhYaIJWkySkQ5o/PNXGRWloCFg
         /VMSd5Djkm6UZ5L90vMIHT7B85nLTF+c5fRHDPzKoA+VrpOEBDeuoWDEhFYE9rfcC3MS
         2l0ac7C2oyiT6PBNW4d0LgDt4LoqUxOwMAuGhB5h9WLS9afQWcgoqfEI3xT1JUEZM/Cp
         psOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=JJttraruJ8uiC8QJ53odfLmRG6duvfUnbtgahsQ/SCs=;
        b=OPOeHurhLNbtMnID3VcMKyYb+AJ5mpax+dAgOgr37Kd8je8fIDil7DA6jiPQ84Ktw7
         2HACSN6KuNKx6cu6ICTXkz61tzQE6RdGgw5q34+p1P8WiL+UZ6X/KcnQggg1yRiOQPxI
         4g3Tq2PSmIJbNQqv2Xqrg9YVOvDOijD2PreHSwR8+bCjHhBrIzFZKylVfB0k9LLl8CKX
         L2APicPG2T5VNbhPuOnlEkmUPtOUEFaQTZsAyevNaHi2XoZI91V6lsnjNujAV9305HW5
         fzzQCTMcTAX3xtF98O1V7X3np6zL7Lefx7XULMRMl0jp6yiYBAHxKXVTo9yeG01OXjOw
         WSpg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=ZYY8c3Px;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id y5si137268ywe.153.2018.02.27.04.17.08
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 27 Feb 2018 04:17:08 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=ZYY8c3Px;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:36538 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eqeBw-0005m2-6u
	for alex.bennee@linaro.org; Tue, 27 Feb 2018 07:17:08 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49792)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1eqeBi-0005l2-Jm
	for qemu-arm@nongnu.org; Tue, 27 Feb 2018 07:16:55 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1eqeBh-0000LT-Ka
	for qemu-arm@nongnu.org; Tue, 27 Feb 2018 07:16:54 -0500
Received: from mail-ot0-x244.google.com ([2607:f8b0:4003:c0f::244]:40867)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1eqeBh-0000Ko-E6
	for qemu-arm@nongnu.org; Tue, 27 Feb 2018 07:16:53 -0500
Received: by mail-ot0-x244.google.com with SMTP id l12so3555326otj.7
	for <qemu-arm@nongnu.org>; Tue, 27 Feb 2018 04:16:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=JJttraruJ8uiC8QJ53odfLmRG6duvfUnbtgahsQ/SCs=;
	b=ZYY8c3PxDlGqtJxY0YlLZTicxmCFcFjszgDGrsJPvc7i8ZOV1wIL2dhkxmZU0BaZ6D
	NWtHzeLEgXyQxZKc5BeDOwDmfOE+RN8S7fKveYHsDecM7XuIdFKMGgMaaBYyZu8QE7kf
	UwmdyBc+fxa8A4AzKCD+/H30ywBJ+o8qwf+v0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=JJttraruJ8uiC8QJ53odfLmRG6duvfUnbtgahsQ/SCs=;
	b=kM+8ZEYZhKn61f/EpVai8qnMOOhRobt7kkEJy2+Uj+WUFdxAr2KIxnpXtmWMOh4L83
	7wS9YHagco4UyVm9ASKsSUPFWD3HGjq13Vn939mAhoVa21J/RPAin0j9IZQgn1in2zmr
	Ox24RWgxTsLYT4sVNQYL2U7flD/ocn2zRFvpHS3n9LPSR33MO5BGqSHDyjlIldFw6Nhu
	pTPlgk27NYkv4z7GmCo1dAXfzDb823PZOKooUeRmLjv4vTFy56sgv7t0OFon3XxXrxE5
	URZGMbDp3ywXCid+tU32iFvb12GY5rJSG9JxtiboQSuXKrzpxhXu1xjzt2Ft6bdHvUfP
	C6lA==
X-Gm-Message-State: APf1xPAqOjQnaKQtubiBloht1hRyE27rM0CSQB0/8SNxTE26Q3rMcd47
	FHIRKHJL0SH04GqRxaeaAIkpJ6fGohzbmGEepp3u0w==
X-Received: by 10.157.7.227 with SMTP id 90mr9573117oto.126.1519733812507;
	Tue, 27 Feb 2018 04:16:52 -0800 (PST)
MIME-Version: 1.0
Received: by 10.157.33.100 with HTTP; Tue, 27 Feb 2018 04:16:32 -0800 (PST)
In-Reply-To: <20180217182323.25885-45-richard.henderson@linaro.org>
References: <20180217182323.25885-1-richard.henderson@linaro.org>
	<20180217182323.25885-45-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 27 Feb 2018 12:16:32 +0000
Message-ID: <CAFEAcA-9n_fF0Z7Z+W+2Tf_5n8unS6jXa67yNKBM-DqrzCpRwA@mail.gmail.com>
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c0f::244
Subject: Re: [Qemu-arm] [PATCH v2 44/67] target/arm: Implement SVE Memory
 Contiguous Load Group
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: WuVE4DpuS7Wx

On 17 February 2018 at 18:23, Richard Henderson
<richard.henderson@linaro.org> wrote:
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Commit message should mention significant missing things
like first-fault/non-fault handling. (In general I would prefer
not to see so many patches which all have one-liner commit
messages.)

> +static void trans_LDFF1_zprr(DisasContext *s, arg_rprr_load *a, uint32_t insn)
> +{
> +    /* FIXME */
> +    trans_LD_zprr(s, a, insn);
> +}
> +
> +static void trans_LDNF1_zpri(DisasContext *s, arg_rpri_load *a, uint32_t insn)
> +{
> +    /* FIXME */
> +    trans_LD_zpri(s, a, insn);
> +}

What are these FIXMEs for? Either they should be fixed, or expanded
into longer comments describing what needs fixing. I assume it is
the missing non-fault/first-fault behaviour...

> diff --git a/target/arm/sve.decode b/target/arm/sve.decode
> index 42d14994a1..d2b3869c58 100644
> --- a/target/arm/sve.decode
> +++ b/target/arm/sve.decode
> @@ -42,9 +42,12 @@
>  %tszimm16_shl  22:2 16:5 !function=tszimm_shl
>
>  # Signed 8-bit immediate, optionally shifted left by 8.
> -%sh8_i8s               5:9 !function=expand_imm_sh8s
> +%sh8_i8s       5:9 !function=expand_imm_sh8s
>  # Unsigned 8-bit immediate, optionally shifted left by 8.
> -%sh8_i8u               5:9 !function=expand_imm_sh8u
> +%sh8_i8u       5:9 !function=expand_imm_sh8u


More changes that should be squashed into earlier patch.


otherwise
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
