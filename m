Received: by 2002:a17:906:a84b:b0:7c1:2a22:dc39 with SMTP id dx11csp1637423ejb;
        Fri, 16 Dec 2022 11:11:02 -0800 (PST)
X-Received: by 2002:a05:6808:4046:b0:35e:cbc9:d960 with SMTP id cz6-20020a056808404600b0035ecbc9d960mr4759004oib.44.1671217861901;
        Fri, 16 Dec 2022 11:11:01 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1671217861; cv=none;
        d=google.com; s=arc-20160816;
        b=Yb5bgGeM61v53rBnbD1Q4FeYAZYMMbP6hcPm5GWa7HlLY8ScoHP3/CaduzZMeP62TP
         5d9A97m7kRSe5dcTbrrG7ifK8hEC9kwOKGu9ydJK8ec7UMRyaDXJ6jtgT21l4BIbqvU8
         9FrjxHVP0C+C9aOFTRK9guibzqCKqsGxtg9JUoILIjv64sWtVXJXS6/nVXI9D8hj3Tte
         L9uTMipSoy0Dkb61YC5Zap3F26XU8tVrlhjUt0Bf8DECpAu+MC90Hzw3/JSJl+2AUY3l
         2wLvuIiFLAPHRymDBjHwfqhn5JJMOjtSoCZgMI9gVGxjzEWl05BJygek1W3afiCWKxsA
         VQVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=DGgasZbe+nbeaQD47kDP2TvPiT7vquSS0cydi/6k3dk=;
        b=ds2jv08V7WVgu7XuISJgqerdabBx3hzAGiHc+tx5IKmdKLZCxJp4BlJyKwh59NBh1j
         VjlDDxn+adJaIvEyJNtUkxLhjsLjGfpGWCxjwwZnudYRX+8WPlLQuqrzWz8UNRml+CTG
         PUzS88Mq0AIghlKo/RAkLEsoZkzDrdOKIaaSthGuEaQX+qLcmTAZEMb0RxY/Ly+dha6F
         7PCYLlJpsHxlZzD4+s8RF/rhzVUaNcApGMymZd8vZjV6hujkJYgd13Q/QtxkhWGaiGqA
         092NmL9HCJiPiZpPxE9X6p8ShjfC6uvWBr+VVeg7hDpXyf47zwlSTRP31vlQSLwrnIuj
         a34w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b=CEb0mzUH;
       spf=pass (google.com: domain of danielhb413@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=danielhb413@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <danielhb413@gmail.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id b10-20020acab20a000000b003544a4cd245sor677501oif.99.2022.12.16.11.11.01
        (Google Transport Security);
        Fri, 16 Dec 2022 11:11:01 -0800 (PST)
Received-SPF: pass (google.com: domain of danielhb413@gmail.com designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b=CEb0mzUH;
       spf=pass (google.com: domain of danielhb413@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=danielhb413@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=DGgasZbe+nbeaQD47kDP2TvPiT7vquSS0cydi/6k3dk=;
        b=CEb0mzUH/2bQ8Y75q6FOcnNWAJM9OhO+aFe4CDXgznV8ExxJcY7sUjCsMecR6ZdJuF
         5RYSBT2PsB3h4ul6FqzTvTHW4sI5QEmZr8NXNlWHK/mBEtSrufIUpCxx1q6q2S6M3tOF
         +r76qEywHHcX0AmUqmZyvAQgIRf/b1TBqfgpPW9Irv88Vjz3MlYtzGU8nf/KGseLM+e9
         2w59C18LnBBggrbgutmtW+EMkXNMAI51Hrb4x1gGHc5KQpWyWJnaMAwb1QapKmOFmhMM
         wexefdZ0ZBwe9xRYXfMg+YyAgbJrzVU+JooBp8+j5QGL0LSVZcLkh3KwT2cu87sYJl1x
         u+1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DGgasZbe+nbeaQD47kDP2TvPiT7vquSS0cydi/6k3dk=;
        b=p5K+1zf4y69yXqtsXuOnrqd+kYZZ9AM8ZiyXiK6LMqtpMSPhSnYfzu1m+cGVYcBwqg
         gjF3qsBumoK6aZleTk450Imqv6EsvwuT2cIS+NjysT6ioFSh+m+K128dABilhovJxmuW
         8JGIgBWio8rYnxW6Smf4M/OtHRqdEDWRRcMHL3fgcMpetmLK0SvmHuRyyxo8KkZ012Cp
         Dag5f+qtm17PGUn2mExRSE1TkIERiFpLAtD4mMkmr5IkV8kBGTGQh5d4QMrTCQBIVJMt
         zIhG+SlpFi016m0VWo1x94YxuWQGFwbMp4ZcX0Fslx8g6HOsJQH2lTEim5oHYkLtIu6s
         gL+A==
X-Gm-Message-State: AFqh2kopOGmrLQla7I3psT3LvMEeHfWwwxBJ90hjF3EjycgHoCvkvC3m
	MqChO5+s1QJS0UVxao1yq21nlc3+iiU=
X-Google-Smtp-Source: AMrXdXsEMDjqfAfjZXlVP+e5mRFpXAvMtObai32rVXzPpfiJj4DCPZkPAa2UEOMonwr3B7x7BG2B7w==
X-Received: by 2002:a05:6808:308d:b0:35e:da33:21b with SMTP id bl13-20020a056808308d00b0035eda33021bmr4029469oib.45.1671217861253;
        Fri, 16 Dec 2022 11:11:01 -0800 (PST)
Return-Path: <danielhb413@gmail.com>
Received: from [192.168.68.106] (201-43-103-101.dsl.telesp.net.br. [201.43.103.101])
        by smtp.gmail.com with ESMTPSA id l24-20020a9d6a98000000b006705e35c4e2sm1187063otq.35.2022.12.16.11.10.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 Dec 2022 11:11:00 -0800 (PST)
Message-ID: <e8c3fdcb-81f1-7067-217c-c49e8748b84a@gmail.com>
Date: Fri, 16 Dec 2022 16:10:56 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [RFC PATCH-for-8.0 2/3] hw/ppc/spapr: Replace tswap64(HPTE) by
 cpu_to_be64(HPTE)
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, BALATON Zoltan <balaton@eik.bme.hu>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Alistair Francis <alistair@alistair23.me>,
 David Gibson <david@gibson.dropbear.id.au>, Jason Wang
 <jasowang@redhat.com>, =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 Greg Kurz <groug@kaod.org>, qemu-arm@nongnu.org,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, qemu-ppc@nongnu.org
References: <20221213125218.39868-1-philmd@linaro.org>
 <20221213125218.39868-3-philmd@linaro.org>
 <CAFEAcA96ncqvN9iXybCd2SrVKJ9CKsu5t3_GtdNt1ZEDAkFt0w@mail.gmail.com>
From: Daniel Henrique Barboza <danielhb413@gmail.com>
In-Reply-To: <CAFEAcA96ncqvN9iXybCd2SrVKJ9CKsu5t3_GtdNt1ZEDAkFt0w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: cf6duoz0yagf



On 12/13/22 10:51, Peter Maydell wrote:
> On Tue, 13 Dec 2022 at 12:52, Philippe Mathieu-Daudé <philmd@linaro.org> wrote:
>>
>> The tswap64() calls introduced in commit 4be21d561d ("pseries:
>> savevm support for pseries machine") are used to store the HTAB
>> in the migration stream (see savevm_htab_handlers) and are in
>> big-endian format.
> 
> I think they're reading the run-time spapr->htab data structure
> (some of which is stuck onto the wire as a stream-of-bytes buffer
> and some of which is not). But either way, it's a target-endian
> data structure, because the code in hw/ppc/spapr_softmmu.c which
> reads and writes entries in it is using ldq_p() and stq_p(),
> and the current in-tree version of these macros is doing a
> "read host 64-bit and convert to/from target endianness wih tswap64".
> 
>>   #define HPTE(_table, _i)   (void *)(((uint64_t *)(_table)) + ((_i) * 2))
>> -#define HPTE_VALID(_hpte)  (tswap64(*((uint64_t *)(_hpte))) & HPTE64_V_VALID)
>> -#define HPTE_DIRTY(_hpte)  (tswap64(*((uint64_t *)(_hpte))) & HPTE64_V_HPTE_DIRTY)
>> -#define CLEAN_HPTE(_hpte)  ((*(uint64_t *)(_hpte)) &= tswap64(~HPTE64_V_HPTE_DIRTY))
>> -#define DIRTY_HPTE(_hpte)  ((*(uint64_t *)(_hpte)) |= tswap64(HPTE64_V_HPTE_DIRTY))
>> +#define HPTE_VALID(_hpte)  (be64_to_cpu(*((uint64_t *)(_hpte))) & HPTE64_V_VALID)
>> +#define HPTE_DIRTY(_hpte)  (be64_to_cpu(*((uint64_t *)(_hpte))) & HPTE64_V_HPTE_DIRTY)
>> +#define CLEAN_HPTE(_hpte)  ((*(uint64_t *)(_hpte)) &= cpu_to_be64(~HPTE64_V_HPTE_DIRTY))
>> +#define DIRTY_HPTE(_hpte)  ((*(uint64_t *)(_hpte)) |= cpu_to_be64(HPTE64_V_HPTE_DIRTY))
> 
> This means we now have one file that's accessing this data structure
> as "this is target-endian", and one file that's accessing it as
> "this is big-endian". It happens that that ends up meaning the same
> thing because PPC is always TARGET_BIG_ENDIAN, but it seems a bit
> inconsistent.
> 
> We should decide whether we're thinking of the data structure
> as target-endian or big-endian and change all the accessors
> appropriately (or none of them -- currently we're completely
> consistent about treating it as "target endian", I think).

Yes, most if not all accesses are being handled as "target endian", even
though the target is always big endian.

IIUC the idea behind Phil's cleanups is exactly to replace uses of
"target-something" if the endianess of the host is irrelevant, which
is the case for ppc64. We would then change the semantics of the code
gradually to make it consistent again.

However, I don't feel comfortable acking this patch alone since 4be21d561d
is from David and I don't know if there's a great design behind the use of
tswap64() to manipulate the hpte. David, would you care to comment?



Daniel

  

> 
> I also think that "cast a pointer into a byte-array to uint64_t*
> and then dereference it" is less preferable than using ldq_p()
> and stq_p(), but that's arguably a separate thing.
> 
> thanks
> -- PMM
