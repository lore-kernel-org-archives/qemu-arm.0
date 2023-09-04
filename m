Received: by 2002:a17:906:cc96:b0:9a1:fa4e:495e with SMTP id oq22csp1125646ejb;
        Sun, 3 Sep 2023 23:01:03 -0700 (PDT)
X-Received: by 2002:a05:6a00:22c9:b0:68c:3ef6:2179 with SMTP id f9-20020a056a0022c900b0068c3ef62179mr8438917pfj.29.1693807262772;
        Sun, 03 Sep 2023 23:01:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1693807262; cv=none;
        d=google.com; s=arc-20160816;
        b=iaSJumjn5wAUgnM26vOoSkk7XRGjXcqnm9gjC/Mhxp3DcrsGPyHiQjPXYFsxbjGzdP
         +hoYuyIERgJl60QOqaybrIjgTOarCmaZnc+e6ig4qXgvzdr9t3f3R1er3/iM5ggBqn58
         E2YrXJ+k69M/MZolQXocZn2PopLY+7GFdKkK+MJiS4BbT9flJn2GZMm9DWGLGYxNUJU1
         v7CX3yLDdHHCJuJZhuQ+AEnKi4FnF16Bt6w+3sAnmuNZLBlen66j00CnYE76y6V+A/Iq
         34ZsQ+602s2aRizPI44czBXHuTnEbsWMXGmSx6w7jFtZFbvbgXMvV2nGcu3vyA/PWyPu
         THOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=PKX2wX1++1hQlRMPiKnO2ihU7HrlYOE5r5rNNc37le0=;
        fh=54Rkt2S6OLx8KLiSPqWlz1/j57oHl8/eYydc1J19l8I=;
        b=ipeaHjqSTToC8SDHU27l4lmJgSTo8BFqr+GJc9/hacTILglCaWyylAhpjkM4iHQ4Zb
         FMdxbS/PtWwPtKd6MIpSuiggMxl2Q0BlemNp3AMgJjYoE2qdnDJpySl4f5qEBTPeBokp
         Y7TEgz3k6nCzdNgisLGbixHAWGFkq1I5i8QvfZcICfjWrvfo+gKbpxFV1U+P/hmpZpxS
         hd4JI86vhP9ueqCeeNGikhS7elITzLyFa300UWKpCWHjxAzwu24W7Zwc+Izp8UCf+PmB
         4+xuSG6R72oB3cHFUr3vxvbLuMW08GN0/Ux2nmMvQcRH0ilhaxbK0Gs3PEC2/FQhmN3x
         hG9w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@daynix-com.20230601.gappssmtp.com header.s=20230601 header.b=YqpYGmdj;
       spf=neutral (google.com: 209.85.220.41 is neither permitted nor denied by best guess record for domain of akihiko.odaki@daynix.com) smtp.mailfrom=akihiko.odaki@daynix.com
Return-Path: <akihiko.odaki@daynix.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id z21-20020aa79495000000b00687ae144514sor5040266pfk.6.2023.09.03.23.01.02
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Sun, 03 Sep 2023 23:01:02 -0700 (PDT)
Received-SPF: neutral (google.com: 209.85.220.41 is neither permitted nor denied by best guess record for domain of akihiko.odaki@daynix.com) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@daynix-com.20230601.gappssmtp.com header.s=20230601 header.b=YqpYGmdj;
       spf=neutral (google.com: 209.85.220.41 is neither permitted nor denied by best guess record for domain of akihiko.odaki@daynix.com) smtp.mailfrom=akihiko.odaki@daynix.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=daynix-com.20230601.gappssmtp.com; s=20230601; t=1693807262; x=1694412062; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=PKX2wX1++1hQlRMPiKnO2ihU7HrlYOE5r5rNNc37le0=;
        b=YqpYGmdjVekiNePAks16U0qmYMHQaIDn3K3tEGX1VAz7w2ItryLRSWOXELb39Q9Smb
         zRY82ptAesU9AbuSMFBKct55sDtFrawZJIR+sqIJKhUrjhPBOumSLi4gIJOs3d6mlIXk
         OajAabmbHLUSjvTE/5559lVH9nK6NIFbzGJs8FzilXR/aJy5kYYjdCQVh7snxYt7nE4O
         mp7wGxqrfWdYXgFTYf4uSyUPuvOp6Eul8OvV75JroR56XSGa3yRG5epN9GcQCYgZ8zog
         xQs/8E1fTFKH3ZQMO/Vn8gqW06bGvkhMIMENNtKf7itFO9Z2qXtBiAQ/DHUzHak6rNJ+
         gqPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693807262; x=1694412062;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PKX2wX1++1hQlRMPiKnO2ihU7HrlYOE5r5rNNc37le0=;
        b=DPAYt17WQT5fmLzsWNQ2R/8Hk3xe73DgNbNEiqKfb7NMNqy+tEptmX8YZUe2/oY61J
         /+dlsqeorwjgA40jdaAThNnQhG9J8GNKP6dsvsSPdV/Ji9b39C85RvKBloPumTRvLgVh
         3nRVf48YD7BmTW/KtSyHRSKjf8+8Ri30lXHsbIS1OWPQuz7PD6/oMCCah2bJv9p2Ziq1
         kVSzpnzcdVHr4VsxFIwTugpqXwJ69HTyTbTqwjJpPor6X1QOUazqRzMOFxlnvN5q9agv
         73Qhhhi6iSEfMx9M/kAT0yqdRLbEUgcuvTu5eA8c1y3pn9Amz4IpcNSiI5Fh1H7ND8v9
         TADg==
X-Gm-Message-State: AOJu0YydB1TtwX6jp1KDlIuYFNBXUfi+MI+t1FP2YXkWaRKoxVtRgdH2
	7E/Zd0pwtZkYLQ0bFH484yoQPA==
X-Google-Smtp-Source: AGHT+IGeWiUE/6ZyA1xR5+BfB2DnOzt0Jjn9WjzH3OaZA63fXHBY2XDg8LbblsX1jETDeKa0YBskLQ==
X-Received: by 2002:a05:6a20:6a1f:b0:137:2f8c:fab0 with SMTP id p31-20020a056a206a1f00b001372f8cfab0mr8424857pzk.49.1693807262231;
        Sun, 03 Sep 2023 23:01:02 -0700 (PDT)
Return-Path: <akihiko.odaki@daynix.com>
Received: from ?IPV6:2400:4050:a840:1e00:78d2:b862:10a7:d486? ([2400:4050:a840:1e00:78d2:b862:10a7:d486])
        by smtp.gmail.com with ESMTPSA id i15-20020a63bf4f000000b00565e96d9874sm6076958pgo.89.2023.09.03.23.00.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 03 Sep 2023 23:01:01 -0700 (PDT)
Message-ID: <64f2030b-2d56-4ecb-9b8d-fd4f3a8eda68@daynix.com>
Date: Mon, 4 Sep 2023 15:00:54 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/8] hw/core/cpu: Return static value with gdb_arch_name()
To: Michael Tokarev <mjt@tls.msk.ru>
Cc: =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Mikhail Tyutin <m.tyutin@yadro.com>, Aleksandr Anenkov
 <a.anenkov@yadro.com>, qemu-devel@nongnu.org,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Yanan Wang <wangyanan55@huawei.com>, Peter Maydell
 <peter.maydell@linaro.org>, Song Gao <gaosong@loongson.cn>,
 Xiaojuan Yang <yangxiaojuan@loongson.cn>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>,
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
Content-Language: en-US
From: Akihiko Odaki <akihiko.odaki@daynix.com>
In-Reply-To: <fe9021cf-727f-aa8b-c22a-7432ce928fb6@tls.msk.ru>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TUID: PVcb5bHLQ3NN

On 2023/09/04 14:54, Michael Tokarev wrote:
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

There is no real reason I guess. Either is fine in my opinion.

> 
> Reviewed-By: Michael Tokarev <mjt@tls.msk.ru>
> 
> (What a huge list of recipients in the Cc..)
> 
> /mjt
