Received: by 2002:a17:906:3683:b0:98d:b2f5:1316 with SMTP id a3csp889579ejc;
        Thu, 10 Aug 2023 12:11:27 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHTjiASMsc1NdDPjLoAJXs52bGpT/0Q0JKQ3ZbQwykOsVOBTTQNZEqBiVcmL/sr5OVSbSFg
X-Received: by 2002:a67:eb0f:0:b0:443:571d:c947 with SMTP id a15-20020a67eb0f000000b00443571dc947mr1799570vso.24.1691694686728;
        Thu, 10 Aug 2023 12:11:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1691694686; cv=none;
        d=google.com; s=arc-20160816;
        b=BrJzWlmyX4p3hKwZWZcoJevXPhqjaFjX+dteJlbyAVlC76jgev45WH1CYLDscfmN1W
         dHMcleAf4RzBFzaGERIG9bpP9m8theKYWUdAVT1QCzwdDbLTPuSa403C56Dgv7xPilyo
         LgMFWH7K+iAin9qrNJ8lVyv7A/08ZrbGWoxtVfqrgHx1axrIA5X8wRQt9soVl6wY+xE9
         Y92RT6ZyEjLQyFGzqLPw7U9xisYNQqe0yLdyoftGvZM+3zzE7BhZBLc6ch+CLV3DoGsg
         DkV0gxm+zkxDC7fzwM8+HWlBNkBLgWkiZLFfIs6ilpv4ugDKNqbVqv0ND43O/o0nX6qt
         lJxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=1dPyWzHu7diDYuuF+y/q8xst7+qAPYRhO3VTAThnUEo=;
        fh=GhRAajmaXIVQSCYRsWh6JKKj25My/ZfgM6mKi1yjbAE=;
        b=TCP6EXx4LrMmS+VlyU9oQ+lGsTMWlc/2s2a2y22fLwpm5iJSG6/6p/QkWs94QY4gN3
         w9IUHjwLPI2hJSLiffPVuQ3HcO/sCZp3JZTr5z//6zD1nIHVM/pVhrHUJvxkUPaU6YOz
         kz022NakiTu/+q1fsb9d3MfyIr50piZvsk4vnPa6W3IA9b4j0lbkpqh3X4WM1gtW/CgO
         4IK4I/YfJYOJ23MCx2tF0SynM4i35ThkfC0XR5ujl8Sh5nodH1zFcMBRPhCMdhXtgT73
         4BSwEJeGD6RYuDVkfYZfPYKbFLVu5hsN+yw5B++bXxAd08exi8PNX0vsVgsE/hL2BtHn
         AIEQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=NucXWAG1;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m3-20020a0cdb83000000b0063f74606c80si1192926qvk.543.2023.08.10.12.11.26
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 10 Aug 2023 12:11:26 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=NucXWAG1;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qUB3o-0006i4-5d; Thu, 10 Aug 2023 15:11:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1qUB3m-0006fj-Qg
 for qemu-arm@nongnu.org; Thu, 10 Aug 2023 15:11:02 -0400
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1qUB3l-0006HI-Ag
 for qemu-arm@nongnu.org; Thu, 10 Aug 2023 15:11:02 -0400
Received: by mail-pl1-x635.google.com with SMTP id
 d9443c01a7336-1bc3d94d40fso11266535ad.3
 for <qemu-arm@nongnu.org>; Thu, 10 Aug 2023 12:11:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1691694659; x=1692299459;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=1dPyWzHu7diDYuuF+y/q8xst7+qAPYRhO3VTAThnUEo=;
 b=NucXWAG1cRuXtMI9C5CfJlVfSw7LruDbIe5AvZwIycHh0W63uGPqIPaVHlUrXKC4Ho
 FGLmkZYlIiZIxMtA1uN8rnvcZYH6jLGmnEJ8084AvFYnM0d1zNAaJeV2J1Z5WnuRU1LF
 avH75q95AcxESoZ0WNx6XRoa8e0wwVi0uFrezgbP8HXbHR+1v8z0KN+4zo8181psKYvb
 NJukcLC0OWPDyNL5nE31/2vtm8819YKG3AiwKF8LkVN2e467W3ZEBXeAW5ehdjJadtLu
 OfEblbvIpgeR3MSl54t3i8olqNlL22Gu6DRe8CcJiauX1zh60jtKGNIBJ/jnyGhx46RQ
 Ue0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691694659; x=1692299459;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=1dPyWzHu7diDYuuF+y/q8xst7+qAPYRhO3VTAThnUEo=;
 b=G3+vsRHph9Iii8ZK949XWvG/ziSPynR7qBachPsBtfy0W1twVe2T2n7Yav/Pa5d8Ic
 4ic3ARG07tey4MvcXghRwAhxDk57ecRHwEv5luKtjTPc5OUqEHBj8nXzXp7Xr56++95O
 4ryuFZSHoUCvudNYAaxvKB7tBkhSXyQMEQtH7uveq32eRxtq9tWHYOvQdBU9orizxtSq
 i4DqABW8QbNl5A6KPVjXcwRnktD9+4cTm7FhQ7GruY/ToQQeX5Y25G9czcLZtVJwTz78
 lIsclpNmuRldL23rOk3fN3NO9/bMDuak3f7mqcEhrx6iPpNsjJqh/Ps4SWXngJEwpR0M
 7p4Q==
X-Gm-Message-State: AOJu0YzbPDdnNltQzXy4dLfQFOu5bOa7KJjVrTIAzROG0SzXGNSsepGC
 EW7GcG4eY33FQjod/CLAIz9lFw==
X-Received: by 2002:a17:902:f801:b0:1bd:b073:a55e with SMTP id
 ix1-20020a170902f80100b001bdb073a55emr1137238plb.5.1691694659707; 
 Thu, 10 Aug 2023 12:10:59 -0700 (PDT)
Received: from ?IPV6:2602:47:d483:7301:9e4d:b830:d4fd:9164?
 ([2602:47:d483:7301:9e4d:b830:d4fd:9164])
 by smtp.gmail.com with ESMTPSA id
 z6-20020a170903018600b001bbdf32f011sm2122436plg.269.2023.08.10.12.10.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 10 Aug 2023 12:10:59 -0700 (PDT)
Message-ID: <8793650b-4e48-c4c1-be75-1f79692496d7@linaro.org>
Date: Thu, 10 Aug 2023 12:10:57 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 4/5] target/arm: Support more GM blocksizes
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
References: <20230810023548.412310-1-richard.henderson@linaro.org>
 <20230810023548.412310-5-richard.henderson@linaro.org>
 <CAFEAcA8YcX0qq392chnpVdB2-qjk7Jb-4gBEu-e2uDGka3Ccvg@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <CAFEAcA8YcX0qq392chnpVdB2-qjk7Jb-4gBEu-e2uDGka3Ccvg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::635;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x635.google.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.156,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: bVd1QuF36pP0

On 8/10/23 07:23, Peter Maydell wrote:
>> +    case 4:
>> +        /* 64 bytes -> 4 tags -> 16 result bits */
>> +        ret = cpu_to_le16(*(uint16_t *)tag_mem);
> 
> Does this really make a difference compared to ldw_le_p() ?

ldw_le_p uses memcpy, though only mips and sparc hosts do not have unaligned reads, so 
perhaps it doesn't make much difference.

I had originally been thinking about atomicity, but then noticed that the pseudocode uses 
a loop and so the instruction is therefore non-atomic.


> Is it worth having an assert in CPU realize for an invalid
> blocksize, so that we can catch duff ID register values
> without having to rely on there being a test run that
> uses ldgm/stgm ?

Yes, that's a good idea.


r~
