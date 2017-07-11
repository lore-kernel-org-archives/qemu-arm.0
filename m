Received: by 10.25.44.15 with SMTP id s15csp5110481lfs;
        Tue, 11 Jul 2017 10:08:52 -0700 (PDT)
X-Received: by 10.55.34.140 with SMTP id i134mr1247529qki.38.1499792928363;
        Tue, 11 Jul 2017 10:08:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1499792928; cv=none;
        d=google.com; s=arc-20160816;
        b=eUqdVQusBp7tcLimJ7TDtg9JpA6ybRMb34SS8sp4s3qs1Y1pGDioc2xg46ZKY6TYwR
         JeebByvtyQ8GL6mvhcc3AGBoojiqZKMFEG3BR/nO1uZDc2+Yz9imcahlzR7A5JAwGZyV
         9zKNV9be+YYDYSe4pSUrY/9I8n4hq36b0GXH9lwuEgiyEq05vg9ga4vfPuncX2ldKgbF
         HzIyfwipKU+62dsve+ZMFF6lR9F5ByWzSTtBhdPPR3/FDN3xGfG4WR3apnCqW9vmBmij
         Tp92roMNle8Rmbu9DbnMMT/b8zP+oMCjH1JeY0/L8Jj+wZeZdJ+e7bXgEzYVR7xM7vPW
         pFlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject:sender
         :dkim-signature:arc-authentication-results;
        bh=dzoJHCty6SJOzFt2H0+lq9nN17NtntXpLaSJNn2RRdQ=;
        b=Vk2mKSJa7mQbzyLPyvgdOhdNMkQwI7y6xPefbMEl0mZ6S0dK/qQCFr3ic4oSmx6h2u
         ncdYH4BdU8F7PG8xRxS7s2rtb51DFYJP/WnY3OnLWhigrtKOocdHCYZXAu79AWWpx5QW
         Fgg5R3y0UBTEC0aY2ZYQZ1qZTKpembucm3ZQ9aXHda4ZDXpI93y+fuoR0SI93TuwyuoS
         eQWECBDfE4b2PYCd3byV6Ped/3WCH6Nb9PAaQAjDVyYPh7yUq3KXkX7MWVLlKbXKM1xR
         rFzW7N1o7d0t21HKsHGDQTLTr042LR33zamrAhMDVfjm3oGnWhAo+ZzQHlDnhqPZO/G1
         8vmg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.b=NeL2+a05;
       spf=pass (google.com: domain of rth7680@gmail.com designates 2607:f8b0:400d:c09::235 as permitted sender) smtp.mailfrom=rth7680@gmail.com
Return-Path: <rth7680@gmail.com>
Received: from mail-qk0-x235.google.com (mail-qk0-x235.google.com. [2607:f8b0:400d:c09::235])
        by mx.google.com with ESMTPS id p37si419857qtp.188.2017.07.11.10.08.47
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 11 Jul 2017 10:08:47 -0700 (PDT)
Received-SPF: pass (google.com: domain of rth7680@gmail.com designates 2607:f8b0:400d:c09::235 as permitted sender) client-ip=2607:f8b0:400d:c09::235;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.b=NeL2+a05;
       spf=pass (google.com: domain of rth7680@gmail.com designates 2607:f8b0:400d:c09::235 as permitted sender) smtp.mailfrom=rth7680@gmail.com
Received: by mail-qk0-x235.google.com with SMTP id 16so9402419qkg.2;
        Tue, 11 Jul 2017 10:08:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=dzoJHCty6SJOzFt2H0+lq9nN17NtntXpLaSJNn2RRdQ=;
        b=NeL2+a05LIbdrONphtj19hXJW0ww7HFluqRtqYPgXCBEb+p97ggNHbmKgvKEg7FrI+
         sDSouVk8+lmmazq/b+jXzMXIlO1UGbiFGpj4yiH/aU1Ur8m9YlJiRYt2sAWI/gKJb34b
         u/RylSYylU6kkM8gTiPS3FiGbb0qddqyKwz0XVOla7fTF12LLdSIWhPIFzY9wcXBpSAX
         atPoj+ttsTkU0ei3618x0MRr0FJMaO8lj/bGINOu7jtEt+EbLNPZ/3Of/4pR1QletlL/
         kyxF6X7FY4xTgcR/OTDf3L+oqOeoDyM4lyhDGQRbSXu/LcUWbrlRWKtnrn1IqCYydhr2
         pkcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=dzoJHCty6SJOzFt2H0+lq9nN17NtntXpLaSJNn2RRdQ=;
        b=NoK/9dL9h+WHCeHfpMrWopX0cAFd5CYq+z3cEw/8YIm6IOjYEfLvDoVNNnTJK6Bbpr
         Y7N/9aUj0w9mT4XNmrvGhY3F8vHrkQ0uGmYLKG9xJqdDSFZQ4xV8Cn5IZ6/2GRx1WMHJ
         HIKadID9N1jqGxEMp7ViOK4FgT54tj3hn1xsxfN11zyIVQ4E7b3AsKzPN8I4wfm0q13g
         Z988isJRpta/8Ob2XJQhisz6dl7zvlxFmZSfdrOjeOMcFWlXroh6T9bDvQmvR/f7l4HB
         aziFV52dF47Hw+2O9dqWiTeeai93PKtvnIIwcHPUIG2pD2h1paSHExmTTyGomNkn7iC4
         hfCw==
X-Gm-Message-State: AIVw1115IiYau8n+0cBHCdhiXgFWXwedD4pmRiB9lIFTaRtG0pZGmJrt
	farIEluKmDD12ldCOO4=
X-Received: by 10.55.94.70 with SMTP id s67mr1150556qkb.256.1499792927513;
        Tue, 11 Jul 2017 10:08:47 -0700 (PDT)
Return-Path: <rth7680@gmail.com>
Received: from bigtime.twiddle.net (rrcs-173-197-98-123.west.biz.rr.com. [173.197.98.123])
        by smtp.googlemail.com with ESMTPSA id b13sm430300qta.25.2017.07.11.10.08.44
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 11 Jul 2017 10:08:46 -0700 (PDT)
Sender: Richard Henderson <rth7680@gmail.com>
Subject: Re: [PATCH v2 4/5] target/arm: use DISAS_JUMP for ISB handling
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Cc: peter.maydell@linaro.org, cota@braap.org, qemu-devel@nongnu.org,
 "open list:ARM" <qemu-arm@nongnu.org>
References: <20170710192128.9048-1-alex.bennee@linaro.org>
 <20170710192128.9048-5-alex.bennee@linaro.org>
 <e21159d2-42aa-1b08-5ea9-2f367a8e452f@twiddle.net>
 <87lgnv9y50.fsf@linaro.org>
From: Richard Henderson <rth@twiddle.net>
Message-ID: <72e9af8d-bf60-58cf-7509-a5c337f2605b@twiddle.net>
Date: Tue, 11 Jul 2017 07:08:41 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <87lgnv9y50.fsf@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: dxYWgN4SP3eJ

On 07/10/2017 10:27 PM, Alex Bennée wrote:
> 
> Richard Henderson <rth@twiddle.net> writes:
> 
>> On 07/10/2017 09:21 AM, Alex Bennée wrote:
>>> -        s->is_jmp = DISAS_UPDATE;
>>> +        gen_a64_set_pc_im(s->pc);
>>> +        s->is_jmp = DISAS_JUMP;
>>
>> Better would be gen_goto_tb.  The destination is known, so there's no
>> need to go through lookup_and_goto_ptr.  You still get the icount_decr
>> check at the start of the linked TB, which is what you're looking for.
>>
>> Interesting that a64's gen_goto_tb sets is_jmp, but a32 does not...
> 
> Hmm the only caller that is not already in the exit path sets it. Maybe
> I should push the s->is_jmp to the a32 gen_goto_tb? I can then do the
> same in both.

Sounds reasonable.


r~
