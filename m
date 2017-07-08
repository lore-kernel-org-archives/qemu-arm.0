Received: by 10.25.44.15 with SMTP id s15csp1433330lfs;
        Sat, 8 Jul 2017 09:21:14 -0700 (PDT)
X-Received: by 10.55.207.5 with SMTP id e5mr68208131qkj.34.1499530873922;
        Sat, 08 Jul 2017 09:21:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1499530873; cv=none;
        d=google.com; s=arc-20160816;
        b=wntQgrnKlnrGLcHtlL9B5wQCA3wE+3S938fYEyKANWl5rZi9gHj0ZYQxuuniB4ydxq
         OigRCpNwWzHK7mb9QtAfvsAu41rQr0cPFVHcCTqOmgC3PYLwR+aCWLg9RwIQb21d1XaW
         Ik76DnfJKQ6O9wwFoJ++aIIywdohPS3Oaiy7o3BLWVxIMGa3XYRwuAAPE3fLPLqeGTjk
         IrZs98JlbevVj8AFv02XyfPpLBf9Bxvjkcgy0UEaRzqbIrPCmiK6zBZIVIFzUWaa5A36
         axaKIQovuLsKzqwlJnFdznlRpMeWpLSvWIbvbRutXMKOrbiJp5qNU72H+TIoKcAeQVV2
         XP5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject:sender
         :dkim-signature:arc-authentication-results;
        bh=voe8+IX8tsz8ik0ZdqxNidVNCI+dlqngU00ibwKhtZQ=;
        b=KLwzUWSrbTAr+x/Uu78saFeSAJ8bgfnmGGoW9O8hZyPwpHqEdUN3FUKCxnZtXxtAqa
         QsG2i3jlP8d++QwH1pmEt6wM/09qOebVphmU58QU3yiqvSvz0LZBryWMUCMJ9+uebajJ
         Q1o41kMalqiFF646qEme6pbrlBCSVnKs7bPWxtVe8z21i/aupnLBYpr7XEPyKvclXpO3
         jBXA1YB0dLv0mwRM0ygqW1N25ZtmAvAgo9Lix24jBfAQ2RD4a2OgDHFAYUi19a2bB1zt
         H6hBIo+4eqlSm7m4CMCXT7x2aHtTSkFvVgK8yZrv2JuLFF2TQpSieEMk4R7hFKRF2l9I
         iHZQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.b=mqF2idQs;
       spf=pass (google.com: domain of philippe.mathieu.daude@gmail.com designates 2607:f8b0:400d:c0d::22d as permitted sender) smtp.mailfrom=philippe.mathieu.daude@gmail.com
Return-Path: <philippe.mathieu.daude@gmail.com>
Received: from mail-qt0-x22d.google.com (mail-qt0-x22d.google.com. [2607:f8b0:400d:c0d::22d])
        by mx.google.com with ESMTPS id p10si6223225qke.174.2017.07.08.09.21.13
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 08 Jul 2017 09:21:13 -0700 (PDT)
Received-SPF: pass (google.com: domain of philippe.mathieu.daude@gmail.com designates 2607:f8b0:400d:c0d::22d as permitted sender) client-ip=2607:f8b0:400d:c0d::22d;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.b=mqF2idQs;
       spf=pass (google.com: domain of philippe.mathieu.daude@gmail.com designates 2607:f8b0:400d:c0d::22d as permitted sender) smtp.mailfrom=philippe.mathieu.daude@gmail.com
Received: by mail-qt0-x22d.google.com with SMTP id r30so47206410qtc.0;
        Sat, 08 Jul 2017 09:21:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=voe8+IX8tsz8ik0ZdqxNidVNCI+dlqngU00ibwKhtZQ=;
        b=mqF2idQsne0A8FyQQNdWEN9migJUAzIWArdrl5NILuw/v/iB4Tzksc8oNM6SI3SJhp
         O2QV+QuCBj9FvFa8LluFX+lsInhVeDshhOql4h03alQ/z7w0/yvDKKJHB3fUvkPIJPAZ
         byVSmrIODMhpD6ZzSpj8ERnnwHYGLW9p4KcZbn7SkcsoxIczJlOEN8Z5CqHZy3I2jTSQ
         8x6ufaGQFnVhBQBUl4/QxthvgKTbgGfgGHTiRV4gH3htJvWQI9smePsAJLpwXCluW5Xl
         Qh0+4TRAaQieax5GRSQT2c0IIxgrPdKms9VIkvb161fKn0Tltb8RedA9HiI73GJAz5Zx
         O7nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=voe8+IX8tsz8ik0ZdqxNidVNCI+dlqngU00ibwKhtZQ=;
        b=Q7oAO+JB021zFisdA7RW7Tot7znL4lD+ed1M4igoamzUdWYscTeMmS0sOuWcUgI7mv
         C5i4w8vQU5c/yex0HT4eLWpgZ/yBl3hhJBf6x0c7f7Yu9tnoeUKSwY/+0OmZ23kkNENR
         Q48u+xhJC7dWO0B35Wbruf8ezhqWrvTkCgUlA+5I6HZxMbbXcH5k8v+pUrx64JLmfPmc
         cbTqFsE8rUNr3I2/ILPSzSfQw6Bs597tJtm3b4UGIxej4+W1pYYd21W+A59J4lycUqYZ
         0pB8KE8gpPNfVAd/4ouXic39RnZjNyN0zeekIWNqWM00DT9fGRgDE+t/MCYqOFfFG9SQ
         C3Pg==
X-Gm-Message-State: AKS2vOzn/O/m1k1ytmSE6hPN9SJvnh9ds6eNuvYGzpQn4H0iHhKyH/Aq
	SEi7SO67NgUA8ltvOkA=
X-Received: by 10.237.50.132 with SMTP id z4mr79157554qtd.31.1499530872924;
        Sat, 08 Jul 2017 09:21:12 -0700 (PDT)
Return-Path: <philippe.mathieu.daude@gmail.com>
Received: from [192.168.1.240] ([138.117.48.223])
        by smtp.gmail.com with ESMTPSA id g13sm5170919qkh.3.2017.07.08.09.21.08
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 08 Jul 2017 09:21:11 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philippe.mathieu.daude@gmail.com>
Subject: Re: [Qemu-arm] [RFC PATCH] target/arm: ensure eret exits the run-loop
To: Richard Henderson <rth@twiddle.net>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>
Cc: Peter Maydell <peter.maydell@linaro.org>, "Emilio G . Cota"
 <cota@braap.org>, QEMU Developers <qemu-devel@nongnu.org>,
 qemu-arm <qemu-arm@nongnu.org>, Joakim Bech <joakim.bech@linaro.org>,
 Etienne Carriere <etienne.carriere@linaro.org>
References: <20170707161822.29659-1-alex.bennee@linaro.org>
 <87inj49mr1.fsf@linaro.org>
 <CAFEAcA_YvS8OQVTPnvRtWyVuAKO2bccyNALOs1Oq7snTO1WwkA@mail.gmail.com>
 <a391e7e5-0be9-0863-bfb7-88d9168484f3@twiddle.net>
 <87h8yo9k2n.fsf@linaro.org>
 <638cda88-5bd8-2a86-d720-04005fa1c1c8@twiddle.net>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <dfd89c2b-8ed6-0a78-93df-51fb442f0adb@amsat.org>
Date: Sat, 8 Jul 2017 13:21:08 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <638cda88-5bd8-2a86-d720-04005fa1c1c8@twiddle.net>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: gMPf7/ce72sl

Hi Alex,

On 07/07/2017 03:52 PM, Richard Henderson wrote:
> On 07/07/2017 08:29 AM, Alex Bennée wrote:
>>> Naming all of these different exit conditions is certainly
>>> non-trivial.
>>
>> Given the variation of usage this is something that should probably be
>> done after Lluís common run loop goes in and we can beef up the
>> semantics of the various exit conditions.
> 
> Definitely.
> 
>> One thing I have noticed in the ARM translator is DISAS_UPDATE does a:
>>
>>      gen_a64_set_pc_im(dc->pc);
>>
>> I think this is to deal with handling exceptions either side of various
>> instructions. Am I right in thinking this is superfluous now as we can
>> derive the PC from the translated code address?
> 
> Yes and no.
> 
> We have typically distinguished between two kinds of exceptions: those 
> that are dynamic (fp state, page permissions) and those that are static 
> (illegal opcodes).
> 
> For the dynamic, we used to pessimistically save state, but now use the 
> unwinder to restore it.  The unwinding is expensive but is used 
> infrequently (especially compared to the number of load/store insns 
> executed).
> 
> For the static, we know the exception must be raised, and we know the 
> state that must be saved.  By doing that, we save the expense of the 
> unwinding.
> 
> So, for the static case you're talking about, we could get the PC (and 
> other state) back, and remove the explicit stores, but we shouldn't.

While doing changes in this file, can you add a comment around 
DISAS_UPDATE about Richard explanation?

> 
> 
> r~
> 
