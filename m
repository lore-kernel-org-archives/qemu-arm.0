Received: by 2002:a5d:51d0:0:0:0:0:0 with SMTP id n16csp3729053wrv;
        Mon, 29 Jul 2019 17:39:02 -0700 (PDT)
X-Received: by 2002:aa7:8202:: with SMTP id k2mr39939948pfi.31.1564447141892;
        Mon, 29 Jul 2019 17:39:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1564447141; cv=none;
        d=google.com; s=arc-20160816;
        b=qW33qWnwKhclUMAQqGV2EoonlJFZrV7g+wU35JYdkxCUEAT64ZUC3r9kXc7kc3HwWZ
         TR0FwxJ4d3UwrbDYcUCg8gdX7KRZYAauH6gVy95cloDN5NuRFDSO91YZM1ua/vZnGqV+
         479yuDAJtu5XCsfQ5SfebukUDT0UmXvPDMV0PH8y8rRHG7s/I/Pe1Frqt6KlvvxueDPI
         BpX9bZrClbG/mIPWPpFgGr+WKly2ZUm2wAmlT6qid+ev58iBYtvddUpwIcf8vib0f7nD
         cmbU2THkbYfnjPjdHFihjM6slaccrX1Cymp8CFO3AInvG3+K9bTKMTahC11hbOfNEccL
         b0jQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:cc:to:subject
         :dkim-signature;
        bh=SHxGOz4FDTbH87+rztjIu6ElAtxs8i8JjXHc55Ce8o0=;
        b=irmmzSavt3zeYfFEiP6Vr8nzUzPxDhMJ30hWHEk/gaZpcrghqhHNZ2kA3eF7+yJUmP
         ysNsjeX5EeiuI2VXFGe17lNN3azR7KXzIGFUpmZCK0qdn/FqGlCF0k+4xtjFyDeEdFCm
         u9VynmRzWRZQ6IKyASybg4rg3P6MYF+d5AL/Bx7zw/zJeTD31wJXJC067rV4jQG5/V0r
         SWZzu2eeKbs1b5VC8UOf4RfKwjeubj/y04uBOwogQjACOWv1DQPfi3xH3YNoSvMQ63TY
         11+0Twu4KcSx44kEbKTEBRXZ8HQDvRgSgzOwtpPOCrPocTa+/qozmgVHstKfLq3fRvk7
         ACCQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=hYfN5axu;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id m93sor75255268pje.1.2019.07.29.17.39.01
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 29 Jul 2019 17:39:01 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=hYfN5axu;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=SHxGOz4FDTbH87+rztjIu6ElAtxs8i8JjXHc55Ce8o0=;
        b=hYfN5axuyAYrKda26vzAlWd7q3YMtYmFDs5bo3E5uyQ1qXccFqOh3Nwa2tN7gdf0Hs
         I2f7Dh72dHjp7L7i4USKbGOIVgaxDrmaY2vLKHQOgmiqvNqrMcC53G2uGTfV1R2uwlqP
         cqkDKMmjz1p5A28GyGUVFkHr82DNoshLBf87KWKkzEkCYm2hEjp7KHLqwxtgxTn02zh0
         D06SDBIxI84rUr1RlO9EZjkv1iU78mSI428zECkOSmfvpXTsRCJeZraWPQWGSKPGSUyB
         WWPumy71n+nmQkA5XaaOrZQogBMgQAm4a9nH07OvnGXJ0fQieO0keOja8sWnNK4O3fpv
         395w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=SHxGOz4FDTbH87+rztjIu6ElAtxs8i8JjXHc55Ce8o0=;
        b=Pn9BnFApCHGM9PGl6oIHUNdkj35pjDYo0BMpvs6cfeufW4WY6vulI6VMA4zH4LNoJa
         R1YBfZF/cw4OdNMa9UPLwv/P25HwbnSIPAL5yaMifKd+Xa9jHe1hFFiNReC2TaPlJuJh
         wzTRXV9LWIETzpOo4hGAMnCc9Zq1Wx2AWPJFM4woFCvZ2yz+HwWAGvDoYsoFNiR+fdrh
         DU5Lwbq+8i26b3WmO4QIS24DdT5mvFx/N+h9dQ+ZR8ymq7WHbLyUWq82YGWfiIYAbpLA
         myDOcH17dP8e/Yw8mh8vJs4/TiNVoz+fSi3QVnxQh/Y/mt+J23lZBTI9sV//KU3F1D00
         MSpQ==
X-Gm-Message-State: APjAAAXdHZ3qiIwzZWkmqQlSc5E9ZLde7uyvcTkIbTNqmod3m8eftCc4
	4Q6ubgiUelupDiTSRcZVQ7DEJC+OaSBsYw==
X-Google-Smtp-Source: APXvYqxaTBXc9TgYc86GS5zcJkOyEFnDPF5r91w3yhEd4ExMZAGhgqDIKfGfPdBgkKIMAXI8jQGr+A==
X-Received: by 2002:a17:90a:ad89:: with SMTP id s9mr115656081pjq.41.1564447140874;
        Mon, 29 Jul 2019 17:39:00 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from [192.168.101.105] ([75.147.178.105])
        by smtp.gmail.com with ESMTPSA id u70sm26546799pgb.20.2019.07.29.17.38.59
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 29 Jul 2019 17:38:59 -0700 (PDT)
Subject: Re: [PATCH 06/67] target/arm: Introduce pc_read
To: Peter Maydell <peter.maydell@linaro.org>
Cc: QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <20190726175032.6769-1-richard.henderson@linaro.org>
 <20190726175032.6769-7-richard.henderson@linaro.org>
 <CAFEAcA_kmuX6bxR50eU_3nTdRcjON2nVTqVWiRamSRe6jui3ig@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <09b930e2-0a92-25a3-4e26-8bea1f437039@linaro.org>
Date: Mon, 29 Jul 2019 17:38:57 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA_kmuX6bxR50eU_3nTdRcjON2nVTqVWiRamSRe6jui3ig@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TUID: 1VmpW5MoM2AT

On 7/29/19 7:05 AM, Peter Maydell wrote:
> On Fri, 26 Jul 2019 at 18:50, Richard Henderson
> <richard.henderson@linaro.org> wrote:
>>
>> We currently have 3 different ways of computing the architectural
>> value of "PC" as seen in the ARM ARM.
>>
>> The value of s->pc has been incremented past the current insn,
>> but that is all.  Thus for a32, PC = s->pc + 4; for t32, PC = s->pc;
>> for t16, PC = s->pc + 2.  These differing computations make it
>> impossible at present to unify the various code paths.
>>
>> Let s->pc_read hold the architectural value of PC for all cases.
>>
>> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
>> ---
>>  target/arm/translate.h | 10 ++++++++
>>  target/arm/translate.c | 53 ++++++++++++++++++------------------------
>>  2 files changed, 32 insertions(+), 31 deletions(-)
>>
>> diff --git a/target/arm/translate.h b/target/arm/translate.h
>> index a20f6e2056..2dfdd8ca66 100644
>> --- a/target/arm/translate.h
>> +++ b/target/arm/translate.h
>> @@ -9,7 +9,17 @@ typedef struct DisasContext {
>>      DisasContextBase base;
>>      const ARMISARegisters *isar;
>>
>> +    /*
>> +     * Summary of the various values for "PC":
>> +     * base.pc_next -- the start of the current insn
>> +     * pc           -- the start of the next insn
> 
> These are confusingly named -- logically "pc_next" ought to
> be the PC of the next instruction and "pc" ought to be
> that of the current one...

Yes, well.  I don't quite remember why "pc_next" was chosen for this field.  It
is the "next" upon entry to tr_foo_disas_insn().  Often the target will
increment s->base.pc_next immediately, so it will also be the "next" insn
throughout translation.  Though that isn't currently the case for ARM.

Once most of the uses of s->pc get moved to s->pc_read, it might be reasonable
to rename the remaining "s->base.pc_next" -> "s->pc_orig" and "s->pc" ->
"s->base.pc_next".  Perhaps that would be clearer, I'm not sure.


>> +     * pc_read      -- the value for "PC" in the ARM ARM;
> 
> nit: this line should end with a colon, rather than a semicolon

Oops, typo.


>> +     *                 in arm mode, the current insn + 8;
>> +     *                 in thumb mode, the current insn + 4;
>> +     *                 in aa64 mode, unused.
>> +     */
>>      target_ulong pc;
>> +    target_ulong pc_read;
>>      target_ulong page_start;
>>      uint32_t insn;
> 
> Why target_ulong rather than uint32_t, given this is
> aarch32 only?

I didn't know if it would stay aarch32 only and it seemed more natural to match
the types.


r~
