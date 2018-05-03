Received: by 10.28.4.212 with SMTP id 203csp1969375wme;
        Thu, 3 May 2018 07:27:25 -0700 (PDT)
X-Google-Smtp-Source: AB8JxZo40Hq8QqANP7CIikCZnuaPy6sk6mXleoHobTWSuZidhJhiD+evkGlyd6ogcDEYWUDe1IAB
X-Received: by 10.55.73.69 with SMTP id w66mr18048991qka.288.1525357644959;
        Thu, 03 May 2018 07:27:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1525357644; cv=none;
        d=google.com; s=arc-20160816;
        b=ePuRNSMTd6YJNVzjm4O0qsVFqgjfrw09JFE+srTHDG+eFtmp4fNdlus87HdYqI+U8s
         gumcLyHJUUFd+YKUVmb3KfnCnBCj6GxGmV+nPHLbDq4N9/e3VOQMG5uvlR2OX8Xg1yip
         6r0/moKm9uZ+oW4lP7GYenZARnxIs1C+mXwC+6HmwOwj6OxPsstVd6GSekT1WwwmT2ow
         CEhFJkiWhzUVmaYjWoSRmchC+ZWzalt4PgnPfqoZJC7DYAQmx0uXWV74rw429THWsJaQ
         oGMjxlPM0tsQfdWxVp25UTsMB8jGBjs4fB39yU48qfrbkHuQ0BBj+I9T1u6WvFnx5/bd
         NkuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=DxUPh/WUijlBCHW2KdSfE/jJBfmm+bfqhoglO5m075A=;
        b=eaQ0BCTwVjCO8TBNEunwffcpblB0K+djYMKPVF8uqMu069w8Te1kSjYOLM7IU++hBq
         zYNCS8adkYf1rAN6Ge4IKCj6fi7Y+PfG10QA2Qltmd3O5LNki7GJA5I7YNTY3ucDJXLA
         wPpL0yy6tdHdl3TVzWKg3V/p3/TWi/LWdu3nlC1jhLSW17hKHLjnhI66h2IzE3nAKsAc
         1w5TJTf9eoUWLdAA7JrRF4aNVVxWxX6/6//e4fYwNFXR8CKINNNQl8jDs+kROlIsxlXb
         3NKuIH+Qj1g+PX7XuuTtxvMc00vQ0sd/1ptYRpjm8259+Z4ZeQF94KmUCjgE6ns1FGWo
         j+eg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=TA2fzCVa;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id a1-v6si3854336qvc.261.2018.05.03.07.27.24
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 03 May 2018 07:27:24 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=TA2fzCVa;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:56916 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fEFCe-0004S9-Gn
	for alex.bennee@linaro.org; Thu, 03 May 2018 10:27:24 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50657)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fEFCU-0004QZ-K2
	for qemu-arm@nongnu.org; Thu, 03 May 2018 10:27:15 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fEFCT-0003AW-Qx
	for qemu-arm@nongnu.org; Thu, 03 May 2018 10:27:14 -0400
Received: from mail-ot0-x241.google.com ([2607:f8b0:4003:c0f::241]:46496)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1fEFCT-0003AH-LE
	for qemu-arm@nongnu.org; Thu, 03 May 2018 10:27:13 -0400
Received: by mail-ot0-x241.google.com with SMTP id t1-v6so20811114ott.13
	for <qemu-arm@nongnu.org>; Thu, 03 May 2018 07:27:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=DxUPh/WUijlBCHW2KdSfE/jJBfmm+bfqhoglO5m075A=;
	b=TA2fzCVa1lEd8wgo8g8XZwH9aVubK4FDBICJ6q84WhGZpX0/KbqYZIqzYLi+Udlrd6
	gXDoICKIT1kp6kpKEn3FFv5PL4ePtAK0rwB+cEcljY/Kn1GvKAqMMEKLEaD1OPOtIHMB
	2pUXdHs2PDb19CXhZy9AeoOmf4pkPjhH1J9bY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=DxUPh/WUijlBCHW2KdSfE/jJBfmm+bfqhoglO5m075A=;
	b=aGFM5fRl94XwHVfvQ9uxjtlmrBYMh08XV4Xj5pHfu1INVuz3tFEIJ3/KUgTpHqDSlf
	q0c8T99D1UzQYGq8YSYKK6Y0DULXGepeJZV9M/jfm1BosPwcJbQrooqjUi9eL5lAEyMO
	5/0PorZKSrLx8qwmnC16do7KxmDDFOuu6zNdTLX5n2ulIRbHEQpFxdLwtL+oliD8WbW6
	tR+3OPqwoaUBRyDVEnwLw1ebo8TeYlQXAnn6ti3PW6Hls1Gz4Oyo4cHyR60Skz/whe32
	jWixjfKT9ZDIGPbPm/PkiYkPfSBaDOnO88dJJVohfbU1enD3ApHV4Sf6w/HYSeOMMFva
	LFvA==
X-Gm-Message-State: ALQs6tB0AhGQiEWTjbFlN/Op9c+PDrs8m5KUtUr3GvNxF24fqcELdHQm
	uidslaM74Hf8FjjaIevRmz6VYKa/R09Wkq/UfO94Ow==
X-Received: by 2002:a9d:255b:: with SMTP id
	j27-v6mr17814308otd.316.1525357633058; 
	Thu, 03 May 2018 07:27:13 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:40fb:0:0:0:0:0 with HTTP;
	Thu, 3 May 2018 07:26:52 -0700 (PDT)
In-Reply-To: <20180427002651.28356-10-richard.henderson@linaro.org>
References: <20180427002651.28356-1-richard.henderson@linaro.org>
	<20180427002651.28356-10-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 3 May 2018 15:26:52 +0100
Message-ID: <CAFEAcA9v7C-TPtE-4SLrhNGXyO+SbN5WiYVkXSkiMxUaFKieRQ@mail.gmail.com>
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c0f::241
Subject: Re: [Qemu-arm] [PATCH 9/9] target/arm: Enable
 ARM_FEATURE_V8_ATOMICS for user-only
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
X-TUID: d9o4JgJCtSiX

On 27 April 2018 at 01:26, Richard Henderson
<richard.henderson@linaro.org> wrote:
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/cpu64.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
> index 991d764674..c50dcd4077 100644
> --- a/target/arm/cpu64.c
> +++ b/target/arm/cpu64.c
> @@ -248,6 +248,7 @@ static void aarch64_max_initfn(Object *obj)
>          set_feature(&cpu->env, ARM_FEATURE_V8_SM4);
>          set_feature(&cpu->env, ARM_FEATURE_V8_PMULL);
>          set_feature(&cpu->env, ARM_FEATURE_CRC);
> +        set_feature(&cpu->env, ARM_FEATURE_V8_ATOMICS);
>          set_feature(&cpu->env, ARM_FEATURE_V8_RDM);
>          set_feature(&cpu->env, ARM_FEATURE_V8_FP16);
>          set_feature(&cpu->env, ARM_FEATURE_V8_FCMA);
> --

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
