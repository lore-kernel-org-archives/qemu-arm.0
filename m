Received: by 2002:a17:906:b2c6:b0:930:eaf4:5c09 with SMTP id cf6csp1222144ejb;
        Thu, 30 Mar 2023 06:00:03 -0700 (PDT)
X-Received: by 2002:adf:f8c3:0:b0:2d2:3dc8:767f with SMTP id f3-20020adff8c3000000b002d23dc8767fmr17559067wrq.29.1680181203706;
        Thu, 30 Mar 2023 06:00:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1680181203; cv=none;
        d=google.com; s=arc-20160816;
        b=ih9lpEIu2/dsWKy/chedVbn19CYMubIJ7qVPQhLfebDbVj75y434AKRqsFgM1jQSYN
         QfbuJFRbeah7SOrne9pSan5gXGOVaSltYRKrAOjoYKSAaOdlgbeioFNQv+41fA6Ut8cw
         wde/PMzSFCEICg17MmAVOFLzBq9g/p3uOe2g+EHFcvdPguDyeUdC+MwIPKb0XEDSRpKY
         mz32kmwHw4dwiaVHavF4L8w/SxsfVgny7c549tOzbGAO1OAMuOsM1dLNq5oGLvepJjKB
         78EhjLXsy2MXAQnGmKz0WYTUjb+lWQDeQM+iH8viL+zhudcVIg2vbKUNK+u28tyf3hqm
         wHXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=ma3XDkiSXLvZWrR7r8V15Ik0qYtB7paYBPWPXT8XiT0=;
        b=TrqKdB3uIcmAJB17PP2OwZ2BQvJK+rvomzeOpLD+cRAVUGEJ2oXdA2zONMYI+w/7Gq
         JK6qefrNsuwQss0wNVuR+7qnIZaxyTFDEzD/Jcpku/VgZMPzJOlkgt78eZrtPaeAKJ+2
         zRRFg+W73lwrV9AKnbUcVWnViRKoOgYb4GEpqIB9/VsWNDnmRbK9JaxIaUI/4Y5OeYoo
         Ggkb6RSckIVyET3L2p935ZD/hHZjHVMRijdQcxkvybkRaDqP235ZWLI8u4a2QJPsPYOE
         2RJ0gdoe5TOlF8+rxbxwY8LmjyauwsAq1OBV/f99WIg4Hk3Fv5roXm/cbUQ0fTXfI52G
         SDow==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ZwVtkTxO;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id z17-20020a5d6411000000b002d87a775b52sor10992594wru.41.2023.03.30.06.00.03
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 30 Mar 2023 06:00:03 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ZwVtkTxO;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680181203;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ma3XDkiSXLvZWrR7r8V15Ik0qYtB7paYBPWPXT8XiT0=;
        b=ZwVtkTxOTovMciFYRHG7xiGL9T7xT8+xbgshuQPsLPF2xNKMq+0mOjR/G3hXmnkHxb
         VqxgHzPmXkE7Z27tX5XMBYwf0faLMtUxDgT7LBwgdG4amVLQD1ynYnnyXgtBpmh381XA
         uG8Hq4CJ80hYheKM1KjEWA7xo4Alh1HcRpjYJPrKkyhrGCxmQxAvwdOP5qDPOhMMpScs
         QRmfHB9VOoSi6GJJqQGS2ZDo0aTXzaqBDYxtrWsooL4r+COZQa7bKm4bc4J2RLcYwbLa
         Ge6WhEPS8+5dseH1faDX5u+y9CzLgNCqZ6NQmCAyY1Zy5uM6UH/Nff6BVJpK5bzcXdpv
         kMhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680181203;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ma3XDkiSXLvZWrR7r8V15Ik0qYtB7paYBPWPXT8XiT0=;
        b=HGYnV1umSpP1AdulEJGgCZtG6TIZUBfWJuIPNQZTHWiGiJfyIiqKqMijdFRLILtntO
         hVfw2c3ow8UcugwrxmhtyT4SlbTOefkB6A/ujPW/8NBtz2pQ0JHItNbldTROMD591GHY
         dEwxorxymMx+KS6ue1fGEgijwemHjhTX/yFpCQzpeyQPrxHwa3Gz3cx8FnDaDtRT97Mw
         UNR0nfwjg480n1moRQYJzwtegwVs5WaAuDS7QVrY8c20vFhjcDzSBHgYPC3U8rvXV8Wx
         z8jgI4HXAEDF3AMnSQlDTrDislW0uRkIu8dIvShowZoQ92wzBhEjM9oxyYCk6K7jvNpD
         Ra9Q==
X-Gm-Message-State: AAQBX9d80g6eWrIaq9Oj1BqM4SvZ/WPa2yUfudkHBh7BM8njjrzaYDsv
	vUUb5+3dozIkAgMtX5t7IWmMdtgGwsVPkah1k7Lu3A==
X-Google-Smtp-Source: AKy350ZDUVbHj88EJiY9u0RdwFigGUru2sysBe981rTiRJBJ3G3n/XuE8VHZ376pO6pPfLzJPk+IYQ==
X-Received: by 2002:adf:f544:0:b0:2cf:f2f9:5aab with SMTP id j4-20020adff544000000b002cff2f95aabmr18948384wrp.20.1680181203327;
        Thu, 30 Mar 2023 06:00:03 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from [192.168.30.216] ([81.0.6.76])
        by smtp.gmail.com with ESMTPSA id o10-20020a5d684a000000b002d89e113691sm23797137wrw.52.2023.03.30.06.00.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Mar 2023 06:00:02 -0700 (PDT)
Message-ID: <6ac0c848-6206-c2f2-f718-68a08b5fe001@linaro.org>
Date: Thu, 30 Mar 2023 15:00:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.9.0
Subject: Re: [PATCH-for-8.0 v3] target/arm: Fix non-TCG build failure by
 inlining pauth_ptr_mask()
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 qemu-arm@nongnu.org, Claudio Fontana <cfontana@suse.de>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Fabiano Rosas <farosas@suse.de>
References: <20230328212516.29592-1-philmd@linaro.org>
 <CAFEAcA_yP9ibO2NOC0pL4SNbPmHtB+TfPm0A06YfC4Mwec5xAQ@mail.gmail.com>
 <CAFEAcA9w0H+j2EbgFDXACno1OF-dCFcb1OuCNksci9vHqW=RPw@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <CAFEAcA9w0H+j2EbgFDXACno1OF-dCFcb1OuCNksci9vHqW=RPw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: ur18V6yqZt4F

On 30/3/23 12:34, Peter Maydell wrote:
> On Thu, 30 Mar 2023 at 11:31, Peter Maydell <peter.maydell@linaro.org> wrote:
>>
>> On Tue, 28 Mar 2023 at 22:25, Philippe Mathieu-Daudé <philmd@linaro.org> wrote:
>>>
>>> aarch64_gdb_get_pauth_reg() -- although disabled since commit
>>> 5787d17a42 ("target/arm: Don't advertise aarch64-pauth.xml to
>>> gdb") is still compiled in. It calls pauth_ptr_mask() which is
>>> located in target/arm/tcg/pauth_helper.c, a TCG specific helper.
>>>
>>> To avoid a linking error when TCG is not enabled:
>>>
>>>    Undefined symbols for architecture arm64:
>>>      "_pauth_ptr_mask", referenced from:
>>>          _aarch64_gdb_get_pauth_reg in target_arm_gdbstub64.c.o
>>>    ld: symbol(s) not found for architecture arm64
>>>    clang: error: linker command failed with exit code 1 (use -v to see invocation)
>>>
>>> - Inline pauth_ptr_mask() in aarch64_gdb_get_pauth_reg()
>>>    (this is the single user),
>>> - Rename pauth_ptr_mask_internal() as pauth_ptr_mask() and
>>>    inline it in "internals.h",
>>>
>>> Fixes: e995d5cce4 ("target/arm: Implement gdbstub pauth extension")
>>> Suggested-by: Richard Henderson <richard.henderson@linaro.org>
>>> Reviewed-by: Fabiano Rosas <farosas@suse.de>
>>> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
>>> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
>>> ---
>>> Supersedes: <20230328133054.6553-1-philmd@linaro.org>
>>>
>>> Since v2:
>>> - Rebased (patch #1 merged)
>>> - Addressed rth's comments
>>> - Added R-b tags
>>> ---
>>>   target/arm/internals.h        | 16 +++++++---------
>>>   target/arm/gdbstub64.c        |  7 +++++--
>>>   target/arm/tcg/pauth_helper.c | 18 +-----------------
>>>   3 files changed, 13 insertions(+), 28 deletions(-)
>>>
>>> diff --git a/target/arm/internals.h b/target/arm/internals.h
>>> index 673519a24a..71f4c6d8a2 100644
>>> --- a/target/arm/internals.h
>>> +++ b/target/arm/internals.h
>>> @@ -1389,15 +1389,13 @@ int exception_target_el(CPUARMState *env);
>>>   bool arm_singlestep_active(CPUARMState *env);
>>>   bool arm_generate_debug_exceptions(CPUARMState *env);
>>>
>>> -/**
>>> - * pauth_ptr_mask:
>>> - * @env: cpu context
>>> - * @ptr: selects between TTBR0 and TTBR1
>>> - * @data: selects between TBI and TBID
>>> - *
>>> - * Return a mask of the bits of @ptr that contain the authentication code.
>>> - */
>>> -uint64_t pauth_ptr_mask(CPUARMState *env, uint64_t ptr, bool data);
>>> +static inline uint64_t pauth_ptr_mask(ARMVAParameters param)
>>> +{
>>> +    int bot_pac_bit = 64 - param.tsz;
>>> +    int top_pac_bit = 64 - 8 * param.tbi;
>>> +
>>> +    return MAKE_64BIT_MASK(bot_pac_bit, top_pac_bit - bot_pac_bit);
>>> +}
>>
>> Any reason for deleting the doc comment ?
> 
> Applied to target-arm.next with a doc comment:
> 
> /**
>   * pauth_ptr_mask:
>   * @param: parameters defining the MMU setup
>   *
>   * Return a mask of the address bits that contain the authentication code,
>   * given the MMU config defined by @param.
>   */

Thank you!
