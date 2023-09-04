Received: by 2002:a17:906:cc96:b0:9a1:fa4e:495e with SMTP id oq22csp1221407ejb;
        Mon, 4 Sep 2023 02:52:23 -0700 (PDT)
X-Received: by 2002:a50:fc13:0:b0:525:440a:616a with SMTP id i19-20020a50fc13000000b00525440a616amr7111192edr.20.1693821142837;
        Mon, 04 Sep 2023 02:52:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1693821142; cv=none;
        d=google.com; s=arc-20160816;
        b=f23SfFXS5TUkhtq10SD26Nb6D2SHCMAl1jQ2fgiJbuKFt1D5TxDVx1qnPaAfYeejvx
         RWPRwqTYqEWACNUGr3MS73fAZs2/n2oNek4GUXfQ+BQv8Zk6z6tNbRtxsQdwtZg4OTzf
         PWrzqcjgd4cQLMHjQWtF5CzRfN5uz3QW3Lwa59OxjpjXddWvJbcJgiMOQnBLyuzke6wq
         WaG8/YdqdidE5dXjhcSwXwgkvrUHKA5LWvQXA6Mpg/+tNXutx8RscxviBPmaO80W7kaS
         OprbLWjAWyOhG1LSI5Pp3uLocyE4wDklP18ASnTQUpHynMd5O4YI8SuM3jbEAz5h9lYr
         +itQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=PbWx9BTVt6IZAk41F6keTl3viLzVQvBCWj7quW/Ekx0=;
        fh=lXQ+bRJwr+effoDA+nC3GFoM9AYF2wIl+GhcN9iwy3U=;
        b=NdujEv/ZF3tU2YslEOXIoiyIk7GET7fXQfmExvrtyWdwxzFJZSLDqjv7LuClt+J+dx
         Pp6ReGbHdDFDvraiNSqZKnh9PffWq34g9qg4cc6WSfqToHbCdjPUqY1xiIqkkxhruzCn
         jn2/VJCP/+DAHBydPN4vqk77DOv2PmV0F7qXIJ3NizMjuFmDx2JJa4lrk4nMCwblW1Tv
         0518o49r7iDs6P90+MZUsFLjr1TXkPG4YJluFrObrSd1QrY4hJWf361hkpjLUfjAzXkl
         zaeJYg5/dLw5PgiKTrVEQ/qd0ETWto8qDnXfqM4s0wxbcMyfSCQH0PJXTFbqCjd5EQrP
         JKnA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=KGZbtJch;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d29-20020a50cd5d000000b00523c7b685easor3208086edj.6.2023.09.04.02.52.22
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 04 Sep 2023 02:52:22 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=KGZbtJch;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1693821142; x=1694425942; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=PbWx9BTVt6IZAk41F6keTl3viLzVQvBCWj7quW/Ekx0=;
        b=KGZbtJch9NMWknFPRBQ1VW+Q+CJJ0d37E7YKMiwzfBz1nk1PirQThiCOSLOn066ED0
         0dDfpwcmIyghH8Iqy6V0Hp/eVBvrQvCHdAcDkaiysVMkxwglUbOr9dkhlrU5EqTnC826
         YRT572nbzppOvtbq1aodWjl9ZYbRdlse+uHSgpcAWWixEUZ3q136f4yYfyccMYsxkliw
         QXl0tJz2hT5LS51N5bSEbBUej91vn1GLImo4s4iiEAKRsFcV5zczQDZ0OkenvsX0QIiA
         AcACx4TqY6Ue4/LQ5iv7DTIuX2/v1pR1gBk8DYlcIZN99CuBPw+gkBaqlgBwMroHPylq
         sT3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693821142; x=1694425942;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PbWx9BTVt6IZAk41F6keTl3viLzVQvBCWj7quW/Ekx0=;
        b=Lc+hp/S+VVtlEFa+zs4ilD2tBjZijRUCrTqhYJKzpFcDInesQTidNVfAVfPB+VkZso
         +FlfyHGlY1rdOFCOJ3EZ5Pl0vgCQDdOndwsSg4YA0TcS+m0eRpkz7kZcGJrvtKa7is+2
         P6+QF7FPtjTGN64kCVj1z+CioieXs1OFIk9SbY4JZ42+yXwyKdnn4559lUQAT2AI0C7V
         8QZ3VVnYRJMWHTvAASniIUsury+0TtbWMwyyxaJBScZJU2DZijrRZ3rxA9paaOq16F10
         qtqSDVqglLkQ89NVoPMDBGpmomTix0uri4txnN3IXX+v9Gro5gRIwkfR7apgOPel3WJ+
         6KWg==
X-Gm-Message-State: AOJu0Yxd8DuBN7SSumQGJvkp5mpIr8ZZjuMizcPHkuwHQGAzOnhbm/Sc
	Y2A/W/d+Q1csI9zB1L/h4n1Df97n
X-Google-Smtp-Source: AGHT+IEn/EYPM8FkYGNw/UMiwOiYdITtzlKFwWtxTtpnIkG3IAuZVwB3NelMjbkjWtPW/X9N+5iVtw==
X-Received: by 2002:aa7:da45:0:b0:523:c19d:a521 with SMTP id w5-20020aa7da45000000b00523c19da521mr6492059eds.40.1693821142480;
        Mon, 04 Sep 2023 02:52:22 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from [192.168.69.115] ([176.187.209.227])
        by smtp.gmail.com with ESMTPSA id s2-20020a056402164200b00521953ce6e0sm5592012edx.93.2023.09.04.02.52.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 04 Sep 2023 02:52:22 -0700 (PDT)
Message-ID: <02cc70e4-31cc-6e0d-0e74-e4efdc5848f6@linaro.org>
Date: Mon, 4 Sep 2023 11:52:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.15.0
Subject: Re: [PATCH 4/8] hw/core/cpu: Return static value with gdb_arch_name()
Content-Language: en-US
To: Michael Tokarev <mjt@tls.msk.ru>, Akihiko Odaki <akihiko.odaki@daynix.com>
Cc: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Mikhail Tyutin <m.tyutin@yadro.com>, Aleksandr Anenkov
 <a.anenkov@yadro.com>, qemu-devel@nongnu.org,
 Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Yanan Wang <wangyanan55@huawei.com>, Peter Maydell
 <peter.maydell@linaro.org>, Song Gao <gaosong@loongson.cn>,
 Xiaojuan Yang <yangxiaojuan@loongson.cn>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 David Gibson <david@gibson.dropbear.id.au>, Greg Kurz <groug@kaod.org>,
 Nicholas Piggin <npiggin@gmail.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Weiwei Li <liweiwei@iscas.ac.cn>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 David Hildenbrand <david@redhat.com>, Ilya Leoshkevich <iii@linux.ibm.com>,
 Thomas Huth <thuth@redhat.com>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 "open list:ARM TCG CPUs" <qemu-arm@nongnu.org>,
 "open list:PowerPC TCG CPUs" <qemu-ppc@nongnu.org>,
 "open list:RISC-V TCG CPUs" <qemu-riscv@nongnu.org>,
 "open list:S390 TCG CPUs" <qemu-s390x@nongnu.org>
References: <20230903043030.20708-1-akihiko.odaki@daynix.com>
 <20230903043030.20708-5-akihiko.odaki@daynix.com>
 <fe9021cf-727f-aa8b-c22a-7432ce928fb6@tls.msk.ru>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <fe9021cf-727f-aa8b-c22a-7432ce928fb6@tls.msk.ru>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TUID: Cq+RXuH0CsOC

On 4/9/23 07:54, Michael Tokarev wrote:
> 03.09.2023 07:30, Akihiko Odaki wrote:
>> All implementations of gdb_arch_name() returns dynamic duplicates of
>> static strings. It's also unlikely that there will be an implementation
>> of gdb_arch_name() that returns a truly dynamic value due to the nature
>> of the function returning a well-known identifiers. Qualify the value
>> gdb_arch_name() with const and make all of its implementations return
>> static strings.
> 
> Why it needs to be a function, can't it be a char pointer
> initialized at the cpu init time?

For x86_gdb_arch_name() or ppc_gdb_arch_name() we could by
moving the #ifdef'ry, but for arm_gdb_arch_name() we'd need
to add a specific class for the iwMMXt CPU. Not sure worth
it...
