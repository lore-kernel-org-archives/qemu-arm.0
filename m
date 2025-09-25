Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D307CAC5A7
	for <qemu-arm@archiver.kernel.org>; Thu, 25 Sep 2025 11:16:15 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1v1jx6-0007gL-Sf; Thu, 25 Sep 2025 07:15:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1v1jx5-0007gB-75
 for qemu-arm@nongnu.org; Thu, 25 Sep 2025 07:15:55 -0400
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1v1jwy-0005Sj-NQ
 for qemu-arm@nongnu.org; Thu, 25 Sep 2025 07:15:54 -0400
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-3ee64bc6b85so846297f8f.3
 for <qemu-arm@nongnu.org>; Thu, 25 Sep 2025 04:15:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1758798943; x=1759403743; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=sMYjTsHmfVG0HjhjDQVuB/zVz84PBqibJP6NCHOIBnA=;
 b=f8YMFgHHrIq96sMwDgvcogriqMqvBjaPThM4IxucXgXRzpNnjbDkLcdRUicMIwEiW8
 XnKBUWrtmSk/Ky4FASSv+aK9ra6Wj3ajgdDALxP5BTSwREK20BodqBvVsTEDcK5hjv/G
 YDHw83MuATOK+5vhsDUBwJZxx5bGpkFHgU3fOK7wuQO0z0AsdjZBqjpxKpjJ0NES4j5/
 SSzMf2tObwiKTnxKeng5mXmvoue3wHNR4X4RcOP7zQw4HttcBFhpdvnX6rPaQx/SMcHw
 yW68Cj9n/L72mqPGC7LuJHtl4+gs/ZrKGFd/5MzYMFFn6Cx0bGwng9s9bC8Q6nS+05sI
 DluQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758798943; x=1759403743;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=sMYjTsHmfVG0HjhjDQVuB/zVz84PBqibJP6NCHOIBnA=;
 b=ovbdnIomAlumwLbCnBiVcjjXbTRGyLCO8ivla+kLSdtU9hAqWBlHi0TfDokhQlZpIz
 24JScTD8RY8iCZAvH9mMSaBCV9w8WamjY7Flot2WrzsQhMrf5XaI5y6NeKUC6PIVpt0/
 oHobLwuKtSokY4O5I+Xv5PhSFwxPsInTXDML8gy12bK7KQHgSrUkpLOYACgmB9z+vvXF
 iL3xGx26qiGTyGkkdnPKUe9YtJCtDNkOpH/uqraOlkFVGFnc6i012OLKRIiAwSNNrivs
 zNg+1a+zw0NZbR7el1aPpJA27BwLEOZtiZ6WL5qoKNXZeb4ZIZTUoyYzXc8bCzWWQklo
 rAMA==
X-Gm-Message-State: AOJu0Yyc72onh1pVcf08qr241SmADSGvhMZU69v7FcxhX3sfvsplxDjS
 xs+x4fLpJwCDjEA/2coWEnxx8lhxti6s5cTf1lq+D47Q7ct3j/V3+2lNYDjxJ/nUVj0=
X-Gm-Gg: ASbGnct52YV8V5SnOPh0OAHU9YBeSeTyoUu8vN+pk9RNO5XN+EXU3TF3XQgZw0fbPaW
 9Rzyxvou5Y0lHnUQedT88P77tTSPTIt/L1zqbEnD8Trglux6UbPQTP0KXwhPci5wEIRD9XlhAgj
 BQlIHWeLTM8Dxogqz6jV5m6YUMlhrovQcT1Up8/+dXtduDjIQwz+kjfkvXGzYGkedxkzedX11vu
 ZWZM3rlzE5am1V/AcGAVduPPjkfVKwSKNuXrae5YzokbySCuPFF9g0HJlTNBbY9pPHcIbXnYzY8
 pDWuWVd+whyuvKRGNQrQmOnINQ24s2hV5cxeFYLByvP+PA/y39Vl0N1if6vLIR2785hBF+UTv38
 gDcR+UOMKTwnVNkeN9c1n6E12mdd/OM4PMaPiy7yWRnpuqd4FI50HAOifUtzzgXUswA==
X-Google-Smtp-Source: AGHT+IEEX1p+/13S6LmmpBYo92Wm7qd0GyfG05xUUAa01EPdSvDwe+/9ptu07ozbU+y87FcwMP3qFA==
X-Received: by 2002:a05:6000:310e:b0:3ee:14db:6ffc with SMTP id
 ffacd0b85a97d-40e43b08e37mr2708317f8f.19.1758798943362; 
 Thu, 25 Sep 2025 04:15:43 -0700 (PDT)
Received: from [192.168.69.221] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-40fb72fb1a3sm2625242f8f.10.2025.09.25.04.15.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 25 Sep 2025 04:15:42 -0700 (PDT)
Message-ID: <88d64ca1-79ae-4637-8a12-05a556d07a44@linaro.org>
Date: Thu, 25 Sep 2025 13:15:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 27/36] target/arm: Remove name argument to alloc_cpreg
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, peter.maydell@linaro.org
References: <20250916142238.664316-1-richard.henderson@linaro.org>
 <20250916142238.664316-28-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20250916142238.664316-28-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x429.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 T_SPF_TEMPERROR=0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

On 16/9/25 16:22, Richard Henderson wrote:
> All callers now pass in->name, so take the value from there.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/arm/helper.c | 12 ++++++------
>   1 file changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/target/arm/helper.c b/target/arm/helper.c
> index 71dd094fac..da3dd073d3 100644
> --- a/target/arm/helper.c
> +++ b/target/arm/helper.c
> @@ -7421,9 +7421,9 @@ void register_cp_regs_for_features(ARMCPU *cpu)
>    * Copy a ARMCPRegInfo structure, allocating it along with the name
>    * and an optional suffix to the name.
>    */
> -static ARMCPRegInfo *alloc_cpreg(const ARMCPRegInfo *in,
> -                                 const char *name, const char *suffix)
> +static ARMCPRegInfo *alloc_cpreg(const ARMCPRegInfo *in, const char *suffix)
>   {
> +    const char *name = in->name;

This is internal API call, but still, should we assert for non-NULL?
Regardless,

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Tested-by: Philippe Mathieu-Daudé <philmd@linaro.org>

>       size_t name_len = strlen(name);
>       size_t suff_len = suffix ? strlen(suffix) : 0;
>       ARMCPRegInfo *out = g_malloc(sizeof(*in) + name_len + suff_len + 1);


