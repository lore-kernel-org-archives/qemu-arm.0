Received: by 10.25.0.6 with SMTP id 6csp827482lfa;
        Sat, 13 May 2017 15:54:31 -0700 (PDT)
X-Received: by 10.237.58.227 with SMTP id o90mr3398703qte.134.1494716071283;
        Sat, 13 May 2017 15:54:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1494716071; cv=none;
        d=google.com; s=arc-20160816;
        b=P/ohmiFiKA41CalYiafFmeq1rBIfMP2ypqnPWurJ03TM1DHU0mLeLPcrTSa7XeX0MU
         3khZBH6BUvAjehPBVDKNeb2T6FvDRs8AZToe6BjFsnoSl+GkYb5xbNA95d0gsiH9gJ/W
         3DR4AmPQY/haRQbI+LnNZnqdrQdHGzkVXcc4Hm1gNnn4rCW+7rCmqI7yJLLX/OVKr8Qi
         vZaq7MzO/aMC48w0Q5GjsGGDqXwWu4lKweZS39buOcS2ootyJ7fWLtXkFVirUp6d6sEE
         O0cYfJ9C6xhiIWnoAdfBEHng8plUhc8MKCMkqIYeMXuDdj4szVzbxIoUWqxl4XERpE0i
         0YtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:cc:references:to:subject:sender:dkim-signature
         :arc-authentication-results;
        bh=sYf2UKEh42Yh/YksFAWTAZfy5pXOexdhsHJIAbZFhQQ=;
        b=rdAoMQHSjtSNA2bMg8c2LH0S+9IU+EwMTW8JheN4YuRsKQGkVrIxkrAlCGl3r2lMv5
         LrBsx6AKwx0MgjaO6iDSMpetE9p9cevPm/tXrFK5k8EXj6uS60hNnP37AvQpmOdtzJJr
         3Lnoe+ZyKPuec7ThSUqL/UmQ7Oz3OqepQ4SoCtrD2rjAGq/CPQy1XGaHfZfiLHPn6wtl
         Cxuv+1zvMGoAVUkZl8NiAyb4S7nv4Ye/X7S3qP/Jarb8k/bdVN3W7dhxLKDskENjKxhP
         HzMKgQyzuNjlm++oTy/ho7ZTcovAT4WddjjxU2CeZNbaW2sFEHBdwzYpBnBlFQnoN7Lt
         Hk1A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com;
       spf=pass (google.com: domain of philippe.mathieu.daude@gmail.com designates 2607:f8b0:400d:c0d::242 as permitted sender) smtp.mailfrom=philippe.mathieu.daude@gmail.com
Return-Path: <philippe.mathieu.daude@gmail.com>
Received: from mail-qt0-x242.google.com (mail-qt0-x242.google.com. [2607:f8b0:400d:c0d::242])
        by mx.google.com with ESMTPS id p123si7161743qkf.234.2017.05.13.15.54.31
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 13 May 2017 15:54:31 -0700 (PDT)
Received-SPF: pass (google.com: domain of philippe.mathieu.daude@gmail.com designates 2607:f8b0:400d:c0d::242 as permitted sender) client-ip=2607:f8b0:400d:c0d::242;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com;
       spf=pass (google.com: domain of philippe.mathieu.daude@gmail.com designates 2607:f8b0:400d:c0d::242 as permitted sender) smtp.mailfrom=philippe.mathieu.daude@gmail.com
Received: by mail-qt0-x242.google.com with SMTP id r58so11187503qtb.2;
        Sat, 13 May 2017 15:54:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:references:cc:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding;
        bh=sYf2UKEh42Yh/YksFAWTAZfy5pXOexdhsHJIAbZFhQQ=;
        b=dTQPixyaezX/5WpdUuhNs+a9CnaljYYm3rB5RhgEFuGF0rKQx+M2gH5m22zQZABpdT
         lvFcbAggdwxNC8UhR2Hn+Fz2+odWGqz/K5y9kR+Nt5NfLxuUsrsoV7gQ9C+Cv/OsuRpZ
         Q/uD0KKPsa1TxlWPj+sdZ54gbR0igDjcudXu9gXHITfG1zMxIL0A6ETJEs4wWrYHG8Ew
         juRFOLt42XeR7zMdJfJAFqCqHfsc2lTqKH6ZayLS7mqhJF9hZKZ6q+DoOFOafc8zcm50
         JdXNMIhmNMH1jqPLWMKBxN4Ee7pfGz7kEhv1OqnkvAFm+2oA8Fazh23E+7qkRro/g2RD
         QBig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:references:cc:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-transfer-encoding;
        bh=sYf2UKEh42Yh/YksFAWTAZfy5pXOexdhsHJIAbZFhQQ=;
        b=PVRTcngEOicJIU68kKLnNyidqJ++/O4/XVlpe0cD2bu18A9v/x6tI0DDLA2EbW0lCs
         VjKO1qIRJKZyE5jkgiefQOY4rGipqUEPy6ZZLfp1K/B7A4bVOPKCgbesfuLoA4tCUVP2
         xaXsYe0HfG7lVqboyD5Kb5U9sbKBTXT8MuW16VHR6o9lYUp5dICGK9HRx+9s8Rdu4gHj
         GYr1mcnBP3ni9Fi7mJioIA0aT+HrO4zWGwNZcB+Jojgpt5TIH7S5Pj06oJgeRcACrdtd
         Wc15PW4MDXPnMp+NnITeWexB3TxORqXRg2nhUQNFU3Wuocndc3kepMQeqXUL595tdE2V
         QtSg==
X-Gm-Message-State: AODbwcDzB30QMK08Wbacz8ZllqXJ/997KT3VB3ZA/1Igc6Gc1Rz5DPGo
	NQvhkmgk4dJnXFeNJA1rPg==
X-Received: by 10.237.55.98 with SMTP id i89mr9804927qtb.162.1494716070766;
        Sat, 13 May 2017 15:54:30 -0700 (PDT)
Return-Path: <philippe.mathieu.daude@gmail.com>
Received: from [192.168.1.10] ([138.117.48.226])
        by smtp.gmail.com with ESMTPSA id s21sm5059613qtc.58.2017.05.13.15.54.28
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 13 May 2017 15:54:29 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philippe.mathieu.daude@gmail.com>
Subject: Re: [Qemu-devel] [PATCH 01/13] arm: Use the mmu_idx we're passed in
 arm_cpu_do_unaligned_access()
To: Alistair Francis <alistair.francis@xilinx.com>,
 Peter Maydell <peter.maydell@linaro.org>
References: <1493122030-32191-1-git-send-email-peter.maydell@linaro.org>
 <1493122030-32191-2-git-send-email-peter.maydell@linaro.org>
 <CAKmqyKMPX+=acJqRKkncy=s4G3C04Q8grD9PdSiPs8f1RuVRxg@mail.gmail.com>
Cc: qemu-arm <qemu-arm@nongnu.org>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Patch Tracking <patches@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <85907ff4-9947-d5b2-5ec4-7d64fbd6c3e8@amsat.org>
Date: Sat, 13 May 2017 19:54:26 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
 Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <CAKmqyKMPX+=acJqRKkncy=s4G3C04Q8grD9PdSiPs8f1RuVRxg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: vZoEGZFGvd8L

On 05/02/2017 07:05 PM, Alistair Francis wrote:
> On Tue, Apr 25, 2017 at 5:06 AM, Peter Maydell <peter.maydell@linaro.org> wrote:
>> When identifying the DFSR format for an alignment fault, use
>> the mmu index that we are passed, rather than calling cpu_mmu_index()
>> to get the mmu index for the current CPU state. This doesn't actually
>> make any difference since the only cases where the current MMU index
>> differs from the index used for the load are the "unprivileged
>> load/store" instructions, and in that case the mmu index may
>> differ but the translation regime is the same (apart from the
>> "use from Hyp mode" case which is UNPREDICTABLE).
>> However it's the more logical thing to do.
>>
>> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
>
> Reviewed-by: Alistair Francis <alistair.francis@xilinx.com>

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

> Thanks,
>
> Alistair
>
>> ---
>>  target/arm/op_helper.c | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/target/arm/op_helper.c b/target/arm/op_helper.c
>> index 156b825..de24815 100644
>> --- a/target/arm/op_helper.c
>> +++ b/target/arm/op_helper.c
>> @@ -208,7 +208,7 @@ void arm_cpu_do_unaligned_access(CPUState *cs, vaddr vaddr,
>>      /* the DFSR for an alignment fault depends on whether we're using
>>       * the LPAE long descriptor format, or the short descriptor format
>>       */
>> -    if (arm_s1_regime_using_lpae_format(env, cpu_mmu_index(env, false))) {
>> +    if (arm_s1_regime_using_lpae_format(env, mmu_idx)) {
>>          env->exception.fsr = (1 << 9) | 0x21;
>>      } else {
>>          env->exception.fsr = 0x1;
>> --
>> 2.7.4
>>
>>
>
