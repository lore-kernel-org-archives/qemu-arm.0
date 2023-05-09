Received: by 2002:a17:906:4810:b0:965:a47e:1721 with SMTP id w16csp2776911ejq;
        Tue, 9 May 2023 07:53:03 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ6VuwqAI3O39X5UI/lYv16dZIJFFy9SX+Fhj0GGGJmlDqVdvL57Yg5l74qzDTw06f5Y595Q
X-Received: by 2002:a05:6214:76c:b0:61b:5faf:9a72 with SMTP id f12-20020a056214076c00b0061b5faf9a72mr29260637qvz.3.1683643982827;
        Tue, 09 May 2023 07:53:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1683643982; cv=none;
        d=google.com; s=arc-20160816;
        b=cxmzd87NeFYms/tvBqzJt7C8i0XRfVjEwPtd5WdZh32yzaA3qvsIusa5dy4PVK99K+
         MFGhjylj3fBWrRKcqK8v79WjCBeR62CjMRlrL1yBcCJzBsXzzx4d/P4xuwrVanhH41f2
         TzzcvlPd6cYmRKWbP/0FjZgCWKWBuSXYlWXVrV2SLnZ7HIQXMNwSF+yyu7uBiXoUqmZY
         6+wRCsryZ8ZR8tDSg0KeYsqZVt1afic53AmG7nFCopF2NXIBkOcuLLexGy4j9aHJzDpZ
         ChpIIvkQmpgOZ2QqCq26JymHVuDskVzyH+pv+zBeY2SjU7NOGrhZU9UlCvdIj0oqKo68
         zLhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:to:content-language:subject:user-agent
         :mime-version:date:message-id:dkim-signature;
        bh=6q5dcj20VdG+ResSqRCQ8wjaFZk71lyYKIG9sYhRXWs=;
        b=iY+pP7BDvz1CUmmgnTkQ9op+YKHk1NZnDtI8TjdSLFm+AhhXb/x6DaBt/bhrDaSUl7
         7g8niLwZhzACJyhs17YNshty2VkUEaCkdUJDKSgBww6xAh9DDpNCOnwbZZS9mPUWxBMx
         VBLBgEzH4aE4qYDl3wiCiQ6QL4suSzx3T/q3HGpNVKsJ2MQeqR2M6SdZWtwl8dtBxMRY
         LAvGioHifcCkEH4bPCHn6D59WY28mayMHyEm7uTmU+wqO4zww1/1tqXiJliZojFYr6gr
         du533Y7wmcx/cvZXybd16acXh2vMtb652smhu5Vj9t4r0mcZXsDF+WycEfV4PQW9nfyM
         E63g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="hmria/Ib";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id jq12-20020ad45fcc000000b0062114e0ad47si966054qvb.302.2023.05.09.07.53.02
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 09 May 2023 07:53:02 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="hmria/Ib";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pwOi0-0004JQ-Fi; Tue, 09 May 2023 10:52:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pwOhz-0004Iw-5u
 for qemu-arm@nongnu.org; Tue, 09 May 2023 10:52:55 -0400
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pwOhx-0002lD-EX
 for qemu-arm@nongnu.org; Tue, 09 May 2023 10:52:54 -0400
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-30626f4d74aso3837509f8f.0
 for <qemu-arm@nongnu.org>; Tue, 09 May 2023 07:52:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683643972; x=1686235972;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=6q5dcj20VdG+ResSqRCQ8wjaFZk71lyYKIG9sYhRXWs=;
 b=hmria/Ibp/9OF6YgtXlL1KsC5WNbROLUOocuykpLTQeJ7MmTfj2b8z30JCm+VkQE2w
 DaELp7lYRfGEt+WZdc2c5VeOc+w2b2xceQWOqG/VChoChcsAHLKfYXOZX/9ogHDRt1gs
 Lu8RkvAtkgeEqDtV5GrMOvq1G0OHgtyeZ4YgYuXRjAJckxZ05M1DvXrA0kUunYUPZiEk
 UhIMz4n1UGshwhMSjRIRgVYiH2UN5nD47EwvPejDMLhkYJFGequ2bebddDNRCFFesSDF
 spCAvKFL7C34Y4nYmNPdPMLWeIPjrwiouDtrrhHP1562uRJuWGxIhvfrOEoQXLFS32/f
 bRIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683643972; x=1686235972;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=6q5dcj20VdG+ResSqRCQ8wjaFZk71lyYKIG9sYhRXWs=;
 b=Zc3NRNyWXCZDZNSVxjS7TC4Lmk/8TdLDnDkYChYaqIwakyJTqF06PWzEpvaqi5m8qG
 3cNFH/a8h3AguCRljhN78IH/u7DsDnF+lUFfvNQ1BznygQcQ0Q7LeGpdCHbG8x62QrAY
 dqB9mSJj8J8B/IMbPC8vz+SCHHRJFWEoaoCojY/ZVFE/GJZwCnQ37BMgAfkKBifWBX+n
 mUHfYYsgIx/Qi4JB5DsCqyIfRXBVSmcW8mQJuM4sSuzTtIdah7HWXaaeZ1KX0r25V4rl
 rOL8T3C31l4bir7tJP0+pLxT393Els1M3IioBolglYrFydaaVeNfOl2BHkrZ8oAYCKqC
 2csA==
X-Gm-Message-State: AC+VfDyxp//ICK1BPQtgz1321cvk22td1e/wy/6kSQ3NK0HIrbR7mAZ4
 Pa6yKc5KWnaxnpbTw9Vt5+zlZw==
X-Received: by 2002:a5d:68c1:0:b0:306:28fa:16a7 with SMTP id
 p1-20020a5d68c1000000b0030628fa16a7mr10065602wrw.43.1683643971745; 
 Tue, 09 May 2023 07:52:51 -0700 (PDT)
Received: from [192.168.11.23] ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 o4-20020a5d4a84000000b003062b6a522bsm14691469wrq.96.2023.05.09.07.52.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 09 May 2023 07:52:51 -0700 (PDT)
Message-ID: <eda69f90-3223-3c0a-e791-4e651009dc0e@linaro.org>
Date: Tue, 9 May 2023 15:52:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH] target/arm: Correct AArch64.S2MinTxSZ 32-bit EL1 input
 size check
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20230509092059.3176487-1-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230509092059.3176487-1-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x42c.google.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.421,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: yC2Mrk9X9/xy

On 5/9/23 10:20, Peter Maydell wrote:
> In check_s2_mmu_setup() we have a check that is attempting to
> implement the part of AArch64.S2MinTxSZ that is specific to when EL1
> is AArch32:
> 
>      if !s1aarch64 then
>          // EL1 is AArch32
>          min_txsz = Min(min_txsz, 24);
> 
> Unfortunately we got this wrong in two ways:
> 
> (1) The minimum txsz corresponds to a maximum inputsize, but we got
> the sense of the comparison wrong and were faulting for all
> inputsizes less than 40 bits
> 
> (2) We try to implement this as an extra check that happens after
> we've done the same txsz checks we would do for an AArch64 EL1, but
> in fact the pseudocode is*loosening*  the requirements, so that txsz
> values that would fault for an AArch64 EL1 do not fault for AArch32
> EL1, because it does Min(old_min, 24), not Max(old_min, 24).
> 
> You can see this also in the text of the Arm ARM in table D8-8, which
> shows that where the implemented PA size is less than 40 bits an
> AArch32 EL1 is still OK with a configured stage2 T0SZ for a 40 bit
> IPA, whereas if EL1 is AArch64 then the T0SZ must be big enough to
> constrain the IPA to the implemented PA size.
> 
> Because of part (2), we can't do this as a separate check, but
> have to integrate it into aa64_va_parameters(). Add a new argument
> to that function to indicate that EL1 is 32-bit. All the existing
> callsites except the one in get_phys_addr_lpae() can pass 'false',
> because they are either doing a lookup for a stage 1 regime or
> else they don't care about the tsz/tsz_oob fields.
> 
> Cc:qemu-stable@nongnu.org
> Resolves:https://gitlab.com/qemu-project/qemu/-/issues/1627
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
> Since we pass the CPUARMState to aa64_va_parameters(), it would be
> possible to have that function call arm_el_is_aa64(env, 1) itself;
> but since that seems a rather non-obvious thing for the function to
> be doing and a potentially more transient (or at least "not
> configured yet") bit of CPU state than the translation regime
> configuration, I preferred to have the callers pass in the
> information explicitly.  I don't feel super strongly about this
> though, so we could do it the other way if you prefer.
> ---

I prefer the extra argument, as you've done.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~
