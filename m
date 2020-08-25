Received: by 2002:a19:ad09:0:0:0:0:0 with SMTP id t9csp69464lfc;
        Tue, 25 Aug 2020 11:07:38 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyXEuWYpLPqI8cuoVOteow/EGXffIqwdbHbSyc697nQHjAJcouZah3p6narV1gFycqZgUpu
X-Received: by 2002:a1f:2895:: with SMTP id o143mr6763427vko.59.1598378858188;
        Tue, 25 Aug 2020 11:07:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1598378858; cv=none;
        d=google.com; s=arc-20160816;
        b=UVyCPrCQJwyE9/SdKwM+ndTy4QS5gVaYkbFA/VdS/1bX9gTFytLbbvKOWFYvGhnzvt
         3VIc5CsxR/CWc3IKM3HYP3QbXquRlf16bjMeFQP4hVd5FLAM36w+mfJ6gc1gL7fFanOa
         X6WWx43OdzAghKI1V+hTJVT+iJ8eGsPsD6P2I9AKrVYQwKHyVmmaVMMYfWKzRpRMbdeg
         k1VWQM7n7Nso6K3jtRiQT+o7rfI76fodHcikViPaksN6YcWykKDyx5Uamt80M+fjWWeb
         d/9dmB9w9tCPquvobcxwgRR94RrnhCxcWIPwDWKuwd1tNw/SRPs+1pVZCVcumO2mXe71
         uZWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=kJEcbaf28P/KD5jILeDCqI2O0wX7kBvNU1uqxYW9ECw=;
        b=kpSXWYkYdOV5G2igLW1ZEjBeP4YnzJe8lh7kqrqCLjrkX1FqotaF+OhJw0Ide3+vjw
         e92zRic7/DknGh6VvqdpXx1V/WVRTv9GAuWywoqjI+aSHjHh5TnTgrYtHFpm/YE83vWy
         U1nwrRltfwTNScYCeaLYfPsLwUI3ZufpxMVVFqQxl3n1J5XAF0XrLtaB4vLVB4f1QjOi
         OF6bl+ymkmh9b1QmBclVCxlQzRmtkcoZFjC9/eFZRoKZUq0tchCzNiEY0IU84lSvYobu
         RabO7FaG4Qsf5G++b9G4OUMyriXYTLd+8ZLtLADWljrsLlRwkr87ttH07xSQfc2Zekej
         Fjzw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=pA1dICU9;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b24si941352vsq.243.2020.08.25.11.07.38
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 25 Aug 2020 11:07:38 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=pA1dICU9;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:40500 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kAdM9-0000Ol-In
	for alex.bennee@linaro.org; Tue, 25 Aug 2020 14:07:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48926)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kAdLM-0008Gp-Q6
 for qemu-devel@nongnu.org; Tue, 25 Aug 2020 14:06:48 -0400
Received: from mail-pj1-x1042.google.com ([2607:f8b0:4864:20::1042]:38462)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kAdLJ-0004ga-PS
 for qemu-devel@nongnu.org; Tue, 25 Aug 2020 14:06:47 -0400
Received: by mail-pj1-x1042.google.com with SMTP id ep8so1633664pjb.3
 for <qemu-devel@nongnu.org>; Tue, 25 Aug 2020 11:06:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=kJEcbaf28P/KD5jILeDCqI2O0wX7kBvNU1uqxYW9ECw=;
 b=pA1dICU9HNosP4Efw+3S/ejIdkR8/v4AYna5HOZ5KoYgwSpHz3zYPPha9iIzQUf42K
 rkUoq0WURQ2AmUKtzDbAfeqV+kadGs+qM8V4KqkpfBJZh2e/ydch1v7Hy/5VTLTVnSGK
 fwCck65xp5VYklm3zp7ws0+oeo6xXFRIK1efQvSob5hm5DkcGqSx5J7Nsb/J0OsU6M2I
 p6s9yMVZmsxKPN4XHPJY4c5hA5FF/0Ez5yI/kzl+OCBZrGDoHWvBPkgz+mwUPcu2mavs
 3xZzRy9nz585WRR5jCvDZZixmc99sb0sJ+KGb6vf/xnZQRxKqoQCzG0WcXqh4CJ91UOs
 dbsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=kJEcbaf28P/KD5jILeDCqI2O0wX7kBvNU1uqxYW9ECw=;
 b=jClOyVKPkFHLPd2HXaMTkuWcTsQkjU5u+58GIAh0ma+iW67dH5wKsQTeMSYz/8+q9A
 K91icHGiU9qOHQ6GHend3/7uxXT+rXme/gkAhANFuPEKvOgVL3ofppXMFREPpeMuBe1l
 qeJu1ZySc1y+cHhiFdUfSROj1Irg6Z7UrLnTPX++EQ+ZP0loJK07y5TAW3E41JOvsymj
 FpypiVqFnT0rvhAwppCPpSe7HdXyuRz23yyfRhxg5rVZgjiM73ETbL3eAaY+/3qEHPHg
 7teN2lnT/mp/VvPWK24+5UFjI3KKl3wDMukPXKwa5whk628XH/aXoUUgzBOUWk6DsNhx
 Y6gA==
X-Gm-Message-State: AOAM531RPgvb/IKrIyxlqOZWh3WnYe9HnjwK+0k6f0H1ATFMQ3NozhEg
 RHWZTNHNiCW5FSjZEHGC3hDsGEWFjUoaxA==
X-Received: by 2002:a17:90b:788:: with SMTP id l8mr2568982pjz.25.1598378803430; 
 Tue, 25 Aug 2020 11:06:43 -0700 (PDT)
Received: from [192.168.81.79]
 (h216-228-167-147.bendor.dedicated.static.tds.net. [216.228.167.147])
 by smtp.gmail.com with ESMTPSA id b185sm15999003pfg.71.2020.08.25.11.06.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 25 Aug 2020 11:06:42 -0700 (PDT)
Subject: Re: [PATCH 02/22] target/arm: Use correct ID register check for
 aa32_fp16_arith
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20200824142934.20850-1-peter.maydell@linaro.org>
 <20200824142934.20850-3-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <0a7f9574-2d82-9c32-ca37-e5fad0e9bb42@linaro.org>
Date: Tue, 25 Aug 2020 11:06:40 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200824142934.20850-3-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1042;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1042.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -46
X-Spam_score: -4.7
X-Spam_bar: ----
X-Spam_report: (-4.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.602,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: i1lPTWc7xA3B

On 8/24/20 7:29 AM, Peter Maydell wrote:
> The aa32_fp16_arith feature check function currently looks at the
> AArch64 ID_AA64PFR0 register. This is (as the comment notes) not
> correct. The bogus check was put in mostly to allow testing of the
> fp16 variants of the VCMLA instructions and it was something of
> a mistake that we allowed them to exist in master.
> 
> Switch the feature check function to testing VMFR1.FPHP, which is
> what it ought to be.
> 
> This will remove emulation of the VCMLA and VCADD insns from
> AArch32 code running on an AArch64 '-cpu max' using system emulation.
> (They were never enabled for aarch32 linux-user and system-emulation.)
> Since we weren't advertising their existence via the AArch32 ID
> register, well-behaved guests wouldn't have been using them anyway.
> 
> Once we have implemented all the AArch32 support for the FP16 extension
> we will advertise it in the MVFR1 ID register field, which will reenable
> these insns along with all the others.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
> I don't expect that any guests will have been using these insns,
> but in any case the fp16 work will be all done before the next
> QEMU release and the insns re-enabled...
> ---
>  target/arm/cpu.h | 7 +------
>  1 file changed, 1 insertion(+), 6 deletions(-)

Cc qemu-stable, for the bug fix?
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

