Received: by 10.223.197.9 with SMTP id q9csp858982wrf;
        Thu, 5 Oct 2017 11:58:46 -0700 (PDT)
X-Received: by 10.200.34.167 with SMTP id f36mr34617489qta.173.1507229926087;
        Thu, 05 Oct 2017 11:58:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1507229926; cv=none;
        d=google.com; s=arc-20160816;
        b=aVsueKk4+MkGUw9mJ5O+Py8OXP5o2Wy5g88Tmyr4Yxxw1LRNzoKZA4RzJlVSYXtMcE
         eWt6AO2Lh+JNWstGvRNx2v1dD2IymV6A+800EEE5Bp0ZIgNP2bT7nHVkOhb5stNdXEfV
         VZBHzXMzkdfT6MgvAQFwWyQ6W15qZ8FXAorbObpQBeDWyinkHMvWTnEdoUbv2Kbo8OgM
         OeZBA6YwcsU0g3dDpURvOUv/4gx5AVo1tK5HQ7vaYzh4XOxOzcTZdQUgrTFDRjaRtk7V
         p3oJMLcAoqduMkl+riBntr9oDF816nyLLur0M540bBuAot1x26wCHpqayw7uVh6jFR11
         M5VA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:dkim-signature
         :arc-authentication-results;
        bh=444HxDV7lOXrRPilzfTZ+OLqg3z0XE9X+ZQP9+m9xt4=;
        b=XUmf7oR+B8hLHWBNcVsCRggxqDd+DqOX4rKwIptONCJADij27NoSW6FcSHlJ4jmMdd
         d/vQVLNHOaRGjWAqktsJyAnhSB9xCwHaqIUfduX+rOuzsiLOUXGHfxe1eJzNOmIa9BBu
         UQXRLb2sFOiseS9snoHg0Ieq9T3Bdkpp01yPKJrPGdJgwZViwyR7W9QSpBTFjfcK8HnJ
         +U9mOmGgAQQw2UiZU6FcwxIdTcUo69V/HI1uzlcnr+Xuy2GWoNJdtpnOB5LxEWB8h2S2
         IYfEG+HMrGg/gGhREjgnnQFjdGeAIiT1ssTAhcsiA8yY61TFuDJKn3O6dtd/GMKFykii
         dWFw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=MFWwdcaR;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id n11si416028qkn.539.2017.10.05.11.58.45
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 05 Oct 2017 11:58:46 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=MFWwdcaR;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:41629 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1e0BM5-0005Kb-Hx
	for alex.bennee@linaro.org; Thu, 05 Oct 2017 14:58:45 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50618)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1e0BJu-0003vD-7n
	for qemu-devel@nongnu.org; Thu, 05 Oct 2017 14:56:32 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1e0BJt-0004zk-Ja
	for qemu-devel@nongnu.org; Thu, 05 Oct 2017 14:56:30 -0400
Received: from mail-qt0-x235.google.com ([2607:f8b0:400d:c0d::235]:57207)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1e0BJt-0004zD-Ed
	for qemu-devel@nongnu.org; Thu, 05 Oct 2017 14:56:29 -0400
Received: by mail-qt0-x235.google.com with SMTP id 34so10174047qtb.13
	for <qemu-devel@nongnu.org>; Thu, 05 Oct 2017 11:56:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=444HxDV7lOXrRPilzfTZ+OLqg3z0XE9X+ZQP9+m9xt4=;
	b=MFWwdcaRr4iQGpzXKirmlDrjtYHH9Xoj/5++2OjvhyfcCqr5OvaV2ensd/4vaWNX9D
	qbO2y0J9srcaigEoOZCc9SoL6c0+4YhtioKJouA/AM16kpY5dnH34GUpr5oh6/u0Ef1C
	JxQOGbIyA0xy7PNrpRD9QR35436bJ8dLp++f4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=444HxDV7lOXrRPilzfTZ+OLqg3z0XE9X+ZQP9+m9xt4=;
	b=PDO+pZwzMk0DlwMFVyBA5owhJtVsUIWKhxmPfsjZAYY6DeJxGDLdrMXhAXMpIGGe8Q
	1C+IIPNdWouzWrbBs29s4mtXA6TgV7caZGRT9d9CuDLKXw0bJ5qpSI5Vwu9KeEYeIwQh
	39XH65wP90glm/HFtDZA3BtZ28n9OuNi2FL5vy55dRG1MmKdu5GZHQQaPUzZ2gexpnL3
	rMDD1W7+rlgrJzIXrxqfDdaM9UykzzyfdnSxng00WdwgMLJFdDKjUXcHIrbc1uv9IS+z
	Z5VLJHm0I8JWI/xMR+hgbC5Tqa/0o1v6ud0E6uB4bsG/i72WY7Iasnyhaumawu/I/E0q
	EMkA==
X-Gm-Message-State: AMCzsaVxZP+5uBXUer0c84UQJ7Jg/j7MJdnduo1sufa+Zb6I2ZpCQzB2
	z9nSfE1WA+GFe+O5v1FD53sDzw==
X-Google-Smtp-Source: AOwi7QCOx7hDzyLUnKPG6fq56lvLtHdoeEXlx2X99S7rPuRlj1dB2rgahAhUgJUH7nrVUNWz9tpBbw==
X-Received: by 10.37.184.131 with SMTP id w3mr7377356ybj.387.1507229788759;
	Thu, 05 Oct 2017 11:56:28 -0700 (PDT)
Received: from bigtime.twiddle.net ([2606:a000:7a4a:b100::1b])
	by smtp.gmail.com with ESMTPSA id
	s187sm9029269yws.55.2017.10.05.11.56.27
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 05 Oct 2017 11:56:27 -0700 (PDT)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
References: <1506092407-26985-1-git-send-email-peter.maydell@linaro.org>
	<1506092407-26985-19-git-send-email-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <b7ff6879-f6fd-4efe-f32c-78171462e3c4@linaro.org>
Date: Thu, 5 Oct 2017 14:56:26 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.3.0
MIME-Version: 1.0
In-Reply-To: <1506092407-26985-19-git-send-email-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::235
Subject: Re: [Qemu-devel] [PATCH 18/20] target/arm: Implement BLXNS
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
Cc: patches@linaro.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: +knkuf9r0C8v

On 09/22/2017 11:00 AM, Peter Maydell wrote:
> +void HELPER(v7m_blxns)(CPUARMState *env, uint32_t dest)
> +{
...
> +    if (dest & 1) {
> +        /* target is Secure, so this is just a normal BLX,
> +         * except that the low bit doesn't indicate Thumb/not.
> +         */
> +        env->regs[14] = nextinst;
> +        env->thumb = 1;
> +        env->regs[15] = dest & ~1;
> +        return;
> +    }
...
> +    switch_v7m_security_state(env, dest & 1);
> +    env->thumb = 1;
> +    env->regs[15] = dest & ~1;

dest & 1 is known to be 0.

> +static inline void gen_blxns(DisasContext *s, int rm)
> +{
> +    TCGv_i32 var = load_reg(s, rm);
> +
> +    /* We don't need to sync condexec state, for the same reason as blxns.

s/blxns/bxns/ ?

Otherwise,

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~
