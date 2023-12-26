Received: by 2002:a17:907:c9e:b0:a27:13b6:eed5 with SMTP id gi30csp424048ejc;
        Tue, 26 Dec 2023 07:22:45 -0800 (PST)
X-Received: by 2002:a05:6000:c5:b0:336:80f7:431c with SMTP id q5-20020a05600000c500b0033680f7431cmr2509180wrx.186.1703604164993;
        Tue, 26 Dec 2023 07:22:44 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1703604164; cv=none;
        d=google.com; s=arc-20160816;
        b=d5UHfiJ83w3d59okp/ysSFphskcO4LezRSWii31d4oAhZ1qGIS4PmjxVwipnQlqpTK
         2lLrhDypuGDUlBvICaNL1PLZKiAb3nTypF5Dg0Lu6Q1hzB1VtWgoWBiTBsnrz/Ii2lj2
         IIcfKgOts1/EcIVkUmqSeJy+tfn4z5tG13HIhfX2KqWLSri0YxvCOyov2rPKN+YHwbhE
         DdPUg5KjxTMlYNNZZCvr6oHnqJkww8x5XgDJWdbcF6MShDsNrvtNeqYil6QMTTdOht1i
         dAzk+bJXtpxsXiSSEGm0CIP7ZManfFjRmsIo87ZXbnO8ic16EASWmTh0zB9GskbmCLvE
         nspw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=TGFyDMwWWcYIPV1sVKqkGaMC3O77Yt2NAwy/JQOu4Nw=;
        fh=/KJbZHPiQhJke5vlvbdxiq9YrpHUQlWkU1Vkr9SpY08=;
        b=GV7cno1ryrJ5oNFzlBXU5WdBrF/xOu9DdHGJ1pq2MlZyYRzAdmfmR50QirYU8zg5sE
         CvyagY1vJY3JZDUhqW3UvAAO5QNouOKzsy9Ui8pP0MYxUJRpdtyxkEl8luopx2W1KwJW
         jBtv4lkW3nQ5dg2ESc3bpC3my/0I+k/AGE7PlSVl33kTfWOASsIn3QkiL6Q7PntUCJnB
         HCn8m4zSpdd9MVh94xzy9lstGhTWKnu5pmD04xhxl6nEzzT+XSiHtrYDKt/XQuccdhPd
         7wOxT9wkgZ7wxr2SsBqNcCjfSwChe9gEpVgfwKLleT0dHcFXC9A42XiUzp5w4TTKA3Lg
         66rg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ksN59t8y;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d7-20020a056000186700b00336c501cc08sor1063856wri.6.2023.12.26.07.22.44
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 26 Dec 2023 07:22:44 -0800 (PST)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ksN59t8y;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1703604164; x=1704208964; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=TGFyDMwWWcYIPV1sVKqkGaMC3O77Yt2NAwy/JQOu4Nw=;
        b=ksN59t8yBDzjhKtzNkP4PUhyBUgSaHZyYOa1D/dFa7HF9v1+6LgjxF/ZgffYaZ4BJP
         WSdxeaKOc9kHKeKSiGQh44Sem1Zpwv8uFZP7wPa10ZiPyg7Jtm6CBPEYox8P5pOVuAmE
         rOCODFyDRZbU/8DUodXfCfOwaYMJeIs+Dfku+119MvNi9nFvMQCiW3lQ2CpjJG68s17E
         fObjCakoEg2FGAcxlre3fzVS6MD+WIC1Df0QCp/qgx32fuIHpaeyuPeQEe0buQA9hO9b
         p1d85NspfeILul1BLm4imtdVjYk3DIBYx/qDAxEE9APVgeP7T8hgB5mE5qAxIH+LyPkE
         Ftpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703604164; x=1704208964;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TGFyDMwWWcYIPV1sVKqkGaMC3O77Yt2NAwy/JQOu4Nw=;
        b=JgwNNXsdRHmBBAPqbi8s2DGTt1aKuwP7XtHIb7rdl2I5sfagZWugDn2/SH51OfYxEn
         PJcnv3YS8wEk8LRnPplKwNOyHBMlgoRx/nL2ujghgmZUfoe6zKSJGjHSk+BgKM26UBxT
         wnKN2XBSsJ+z81XpZrBS01U9MUGcbcCG4GkhUoJ6BSgqQPG+b2QzSvjkGvb3uZ0/x0Ew
         op3txZEhnxdsXRFCOB9kiuHIX2HXvWfj1qn9fsKAI6zDpx2je1sqCDSEZojYqw4ZX99h
         6gFeJRMUMSuIPrj+z+U0wGjj34lkCkuhQjrv9AHwKat6OOGZnCg8yuetdJi8GfhkcJNp
         HMVw==
X-Gm-Message-State: AOJu0YyHnsdnfoPsYbKFEeoMNuH0NzhJsFEjdKqeDZV/6MYdwoQFfaxo
	BwPvdDWngTEd9KtHShKY/9KJavT32dOrkokc
X-Google-Smtp-Source: AGHT+IHA1ALC9hkDL2Z+mTf5dGvup3v7SwA0w9AIfvp5EezpO7Wzhrn4dLcfSylpl3kj+ZvaQJA1GA==
X-Received: by 2002:adf:ea85:0:b0:333:2fd2:3bdf with SMTP id s5-20020adfea85000000b003332fd23bdfmr2519107wrm.152.1703604164518;
        Tue, 26 Dec 2023 07:22:44 -0800 (PST)
Return-Path: <philmd@linaro.org>
Received: from [192.168.19.175] (131.red-88-29-190.dynamicip.rima-tde.net. [88.29.190.131])
        by smtp.gmail.com with ESMTPSA id a4-20020adffb84000000b00336d24b4847sm2762191wrr.114.2023.12.26.07.22.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 26 Dec 2023 07:22:44 -0800 (PST)
Message-ID: <545f08d6-d371-4fe6-a309-30ba2c8571f9@linaro.org>
Date: Tue, 26 Dec 2023 16:22:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 23/24] exec/cpu-all: Extract page-protection definitions
 to page-prot-common.h
Content-Language: en-US
To: Nicholas Piggin <npiggin@gmail.com>, qemu-devel@nongnu.org
Cc: Ilya Leoshkevich <iii@linux.ibm.com>, Peter Xu <peterx@redhat.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Eduardo Habkost <eduardo@habkost.net>, qemu-arm@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-ppc@nongnu.org,
 qemu-s390x@nongnu.org, =?UTF-8?Q?Alex_Benn=C3=A9e?=
 <alex.bennee@linaro.org>, =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?=
 <berrange@redhat.com>, qemu-riscv@nongnu.org,
 David Hildenbrand <david@redhat.com>, Warner Losh <imp@bsdimp.com>,
 Claudio Fontana <cfontana@suse.de>, Brian Cain <bcain@quicinc.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Thomas Huth <thuth@redhat.com>, Riku Voipio <riku.voipio@iki.fi>,
 Kyle Evans <kevans@freebsd.org>, BALATON Zoltan <balaton@eik.bme.hu>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Laurent Vivier <laurent@vivier.eu>, Michael Rolnik <mrolnik@gmail.com>,
 Song Gao <gaosong@loongson.cn>, Huacai Chen <chenhuacai@kernel.org>,
 Aurelien Jarno <aurelien@aurel32.net>, Jiaxun Yang
 <jiaxun.yang@flygoat.com>, Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Chris Wulff <crwulff@gmail.com>, Marek Vasut <marex@denx.de>,
 Stafford Horne <shorne@gmail.com>, =?UTF-8?Q?C=C3=A9dric_Le_Goater?=
 <clg@kaod.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Weiwei Li <liwei1518@gmail.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Artyom Tarasenko <atar4qemu@gmail.com>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Max Filippov <jcmvbkbc@gmail.com>
References: <20231211212003.21686-1-philmd@linaro.org>
 <20231211212003.21686-24-philmd@linaro.org>
 <CXUPHHNKAVYM.129IGW3MNKCSQ@wheely>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <CXUPHHNKAVYM.129IGW3MNKCSQ@wheely>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: digDHjSpXtET

Hi Nicholas,

On 22/12/23 09:06, Nicholas Piggin wrote:
> On Tue Dec 12, 2023 at 7:20 AM AEST, Philippe Mathieu-Daudé wrote:
>> Extract page-protection definitions from "exec/cpu-all.h"
>> to "exec/page-prot-common.h".
>>
>> The list of files requiring the new header was generated
>> using:
>>
>> $ git grep -wE \
>>    'PAGE_(READ|WRITE|EXEC|BITS|VALID|ANON|RESERVED|TARGET_.|PASSTHROUGH)'
> 
> Acked-by: Nicholas Piggin <npiggin@gmail.com> (ppc)
> 
> Looks trivial for ppc, so fine. But what's the difference between
> -common.h and -all.h suffix?

We believe historically '-all' was used for target-specific
headers. However then headers got massaged and some ended
using this suffix, although not anymore target specific.

Today for clarity we prefer using '-common' for generic
(target agnostic) headers, and '-target' for target-specific
ones.

I tried to clarify that here:
https://lore.kernel.org/qemu-devel/20231226150441.97501-1-philmd@linaro.org/

Thanks for your review,

Phil.
