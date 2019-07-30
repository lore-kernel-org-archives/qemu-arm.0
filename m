Received: by 2002:a5d:51d0:0:0:0:0:0 with SMTP id n16csp3742885wrv;
        Mon, 29 Jul 2019 17:57:35 -0700 (PDT)
X-Received: by 2002:a62:5c01:: with SMTP id q1mr16896036pfb.53.1564448254902;
        Mon, 29 Jul 2019 17:57:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1564448254; cv=none;
        d=google.com; s=arc-20160816;
        b=Xnq/RqHMKt5zGq34An+NJyO7YXRiB/LN4SiKln5luQAJPRbCe9QHkNt37ozLudjEFK
         drXFZ+UBRfVfrj62/R5Qi/+u/wYngE+TPXDJU//WbRd8T+ObkBehfniVNMZ3Q6LkDWy0
         +g7cqOZwVBH0erKvPDoS+kqwVoJz4RIByKxjHFt0Bm9p7MojMiMGwW1j7MTsnenh6y00
         d6nxjOCdsIv1GhOhTwKl5vE6tcGLUIvLyUGKvqk07Bju/+dXQx2NXQpghgfIoCinrjfN
         K/fo2QwpaUW8DC9W0pFhNV+4q36Vv6TOf1EUPzPpMPuC1EttmP7qIGARwomf1r9r2aCQ
         HJCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:cc:to:subject
         :dkim-signature;
        bh=esrCG6HfxpWpYhrk5c7Xqz0WWHxzjIRuUMh3KVljiLY=;
        b=RYJQb+7Bb/qvsEJM8gXgxlvIWzT46ETfBu5ACMY4qcTN8kHISFRub46WYEmAkFyvTt
         XkwmCwX8stjJ+K6ZjaWedhSs0NckOJCHdU+80Bl3Gd2+59hyC+LBzIlC9IKYCmxgYsgT
         a0p9Nn3sRK7yN5idX8XeDwWV2JgY9ssCFU7pgz3gdhvlf7TwzbJmsD6S84YpqnaxRHEn
         FOPbQwivS/HpV1Aac6mD6IpV5MtqQzc4AWOunb3yVxJe6NCFuYlpbhYi5sJ2F3BBvvKs
         +04fuGZo+wnuCci1VYC8uadNQ5Ca1VHiK+NDV2xQqev1RX4QtRRksfDb59/DXpb5N28j
         OdHw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=t3ITc092;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id d64sor22146711pgc.69.2019.07.29.17.57.34
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 29 Jul 2019 17:57:34 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=t3ITc092;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=esrCG6HfxpWpYhrk5c7Xqz0WWHxzjIRuUMh3KVljiLY=;
        b=t3ITc092eLc6++yaikhVL3DVwWbdIrLGhMNQ0JlTCZHd1p9pA4PbWw8l/9QTwmArcI
         GWoVturtvh7o7eVENk7L58Zs/VSGXDeFL4bhenP+NEh28EHM4y8z4Sq4XbG6aNmom452
         2Nt9mnuDbcGMI5RLmJRoWfTqmap0mZ1itfweiLqVkpm2lp9eSBEeiao7ZlLbLke8iRRS
         3Ux42cy7b3cAD3mQgxzKuloCzkrj8nXrS7uVCVA6/aXHvFUQQF/ZGzhuiF1bGEd03Unn
         Z23h7ikx/snVByURRAYkxBEy95eXfxS5kWOVhnan9LAHQwMA22F/b+mH0rlR2N1SBbEh
         hpUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=esrCG6HfxpWpYhrk5c7Xqz0WWHxzjIRuUMh3KVljiLY=;
        b=uDlzZ+xCAlb3hsR7qStx8t4s0Sl/k9D3jm0I1LwkND6GOAJI6FzvM3wXoF/wZfut/C
         +9kB6PaePMu7N3Sd6UkflbSrQinO9ZHxn9YDdgZzM3RzBI9d/uuZE9SHMVEM0+n2Y++1
         AkWSLtyLgCTrfbSykhEFzl82LAkiTk4HKRZU1g0mXoGrPpCX+IBCVVkQhR739laV4vyl
         PR1q0lUqCRohCYi3InZcHGZdme8FGrK7MtSLLacK+MCtzCdo6eTB70nKlwTaj4Rs3njK
         nTekLpVXhjtlP1nLBHzTU4jbbCcE5REFXl3yEzphc4Z7tbeuLA96bRnOb7Emx++ZAnPv
         piJw==
X-Gm-Message-State: APjAAAW9thJftgPbiaWijtQ7vGD5eCe96i6xhnJs1oPk8tDf816+V7ei
	AMUOyyAU0TQAFue58VNdv161pOsTbFZ3/g==
X-Google-Smtp-Source: APXvYqxLMpRzsoexi6Tu0g5PXjmE6TMWpnvjQLMeCFmVe73bznFElY419zg9aLx7Zv92GtwxNgR3bA==
X-Received: by 2002:a63:2252:: with SMTP id t18mr106902673pgm.5.1564448254072;
        Mon, 29 Jul 2019 17:57:34 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from [192.168.101.105] ([75.147.178.105])
        by smtp.gmail.com with ESMTPSA id j12sm54558458pff.4.2019.07.29.17.57.32
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 29 Jul 2019 17:57:33 -0700 (PDT)
Subject: Re: [PATCH 10/67] target/arm: Move test for AL into arm_skip_unless
To: Peter Maydell <peter.maydell@linaro.org>
Cc: QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <20190726175032.6769-1-richard.henderson@linaro.org>
 <20190726175032.6769-11-richard.henderson@linaro.org>
 <CAFEAcA83GM6wgWs1xGygmqCoir=CXtFXYkzPBMdUeb638kCzmw@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <28a5710a-37a7-2d6a-1609-5218d5e8e931@linaro.org>
Date: Mon, 29 Jul 2019 17:57:31 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA83GM6wgWs1xGygmqCoir=CXtFXYkzPBMdUeb638kCzmw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TUID: lzA/dVgONoHf

On 7/29/19 7:32 AM, Peter Maydell wrote:
> On Fri, 26 Jul 2019 at 18:50, Richard Henderson
> <richard.henderson@linaro.org> wrote:
>>
>> We will shortly be calling this function much more often.
>>
>> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
>> ---
>>  target/arm/translate.c | 28 ++++++++++++----------------
>>  1 file changed, 12 insertions(+), 16 deletions(-)
>>
>> diff --git a/target/arm/translate.c b/target/arm/translate.c
>> index 53c46fcdc4..36419025db 100644
>> --- a/target/arm/translate.c
>> +++ b/target/arm/translate.c
>> @@ -7705,8 +7705,14 @@ static void arm_gen_condlabel(DisasContext *s)
>>  /* Skip this instruction if the ARM condition is false */
>>  static void arm_skip_unless(DisasContext *s, uint32_t cond)
>>  {
>> -    arm_gen_condlabel(s);
>> -    arm_gen_test_cc(cond ^ 1, s->condlabel);
>> +    /*
>> +     * Conditionally skip the insn. Note that both 0xe and 0xf mean
>> +     * "always"; 0xf is not "never".
>> +     */
>> +    if (cond < 0xe) {
>> +        arm_gen_condlabel(s);
>> +        arm_gen_test_cc(cond ^ 1, s->condlabel);
>> +    }
>>  }
>>
>>  static void disas_arm_insn(DisasContext *s, unsigned int insn)
>> @@ -7944,11 +7950,9 @@ static void disas_arm_insn(DisasContext *s, unsigned int insn)
>>          }
>>          goto illegal_op;
>>      }
>> -    if (cond != 0xe) {
>> -        /* if not always execute, we generate a conditional jump to
>> -           next instruction */
>> -        arm_skip_unless(s, cond);
>> -    }
>> +
>> +    arm_skip_unless(s, cond);
>> +
>>      if ((insn & 0x0f900000) == 0x03000000) {
>>          if ((insn & (1 << 21)) == 0) {
>>              ARCH(6T2);
>> @@ -12095,15 +12099,7 @@ static void thumb_tr_translate_insn(DisasContextBase *dcbase, CPUState *cpu)
>>      dc->insn = insn;
>>
>>      if (dc->condexec_mask && !thumb_insn_is_unconditional(dc, insn)) {
>> -        uint32_t cond = dc->condexec_cond;
>> -
>> -        /*
>> -         * Conditionally skip the insn. Note that both 0xe and 0xf mean
>> -         * "always"; 0xf is not "never".
>> -         */
>> -        if (cond < 0x0e) {
>> -            arm_skip_unless(dc, cond);
>> -        }
>> +        arm_skip_unless(dc, dc->condexec_cond);
>>      }
> 
> In the other callsites for arm_skip_unless() the cond argument
> can never be 0xe or 0xf.
> 
> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

In my original version I included cond in the fields collected by decodetree,
and so every single trans_* function called arm_skip_unless, so that would not
be the case there.

I discarded that in the version posted here, but I still think it might be a
cleaner design overall.

In the short term, maybe I should just discard this patch?


r~
