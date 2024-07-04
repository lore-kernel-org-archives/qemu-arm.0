Received: by 2002:a17:505:564d:b0:1be9:327d:8ee3 with SMTP id jl13csp781286njb;
        Thu, 4 Jul 2024 11:25:24 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXaZ5j621gun7c62FjIe0skurrZqvLulgWWxH1xnqOGVzy7SYcxxTGnhjWmYHa3vGYMNWyVYliYp4qz+Y/fQJ3HHcJddtae
X-Google-Smtp-Source: AGHT+IFcjtyb/130klEOioIeei+6+DpJe6S9pS5jt1BzZH5k3p9yX8QVQxMSe98YP/sBwflx0568
X-Received: by 2002:a9d:62d7:0:b0:700:d11d:6805 with SMTP id 46e09a7af769-7034a73a513mr3030828a34.5.1720117524332;
        Thu, 04 Jul 2024 11:25:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1720117524; cv=none;
        d=google.com; s=arc-20160816;
        b=xDZkc84X5Z1aJE5ADxPMDg2OulnoWt//PIr+RO96CBp8LgtSbjelZVFEM68ynAqEhK
         JTsbeIBLu0jW523p4w+wyswq2AmnGuo1kQJH1qK9yJlXqtHBmEW9FUWau6JjTf4eMXSC
         IgFurbGn8UrQKIhPdujMF8/fExLCWihForDYX6thrzQWt6pR8s5r5Jcd0/CF1iNU1JJ4
         KTOY/wDlqtoaA4PJUnASPCOVLk+vyS7IEr5nqJKutXXE8r4xjC390a+VmJsZ2ZKRiJU9
         HfUdvjsmTXFGa1fVW6wFyd6krdVd5hHKLSjkwl4NkL5nohZbYlrL63cZUxqGkuo4/nEZ
         B6zw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=O9HMrFcVZDenmphTehp9py7axRg9tQZVyNoIrqkiERM=;
        fh=EBIJu/+LE3TayWv6pHtT0Wmmsa/CxgrWRjDLn4h0Ho4=;
        b=F2xuYLHo36h0kVeyyWCIw64t8RlFx8cAAEModlKHgQAth/pDMp9JapgZEyRjScv1qO
         jjz/jnpIK/bTBxZ2FBAONFoytKicqdnXycbCzYRAd/fu1wqxarkwYp8cnc5xeRUc4g07
         rVEUa9mMWJ0fqbC5kmhZI1K5brJa9eWOd9SNfA/GMV7FilyiisKW3qsQj3ZVC1iNnzsr
         gQJQXVp5apTAsYwp7ti2/n70zBmpZHY4yTfl7KZGPoroNwSiWpKzZksvD8h/MzyYVgbK
         8iCwa3FEo8k2Ucb8AYdbIrZPjEUScAvi4DINYTWYIUWA6rXRcFRtfmgoELXuMVmcXxJ4
         Bqzg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=WLPfAzVt;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-79d692f13aasi1658154985a.251.2024.07.04.11.25.24
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 04 Jul 2024 11:25:24 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=WLPfAzVt;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sPR8Y-0001dm-Jp; Thu, 04 Jul 2024 14:24:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1sPR8P-0001Xe-2c
 for qemu-arm@nongnu.org; Thu, 04 Jul 2024 14:24:45 -0400
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1sPR8N-00007g-AX
 for qemu-arm@nongnu.org; Thu, 04 Jul 2024 14:24:44 -0400
Received: by mail-pl1-x631.google.com with SMTP id
 d9443c01a7336-1fb457b53c8so987825ad.0
 for <qemu-arm@nongnu.org>; Thu, 04 Jul 2024 11:24:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1720117481; x=1720722281; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=O9HMrFcVZDenmphTehp9py7axRg9tQZVyNoIrqkiERM=;
 b=WLPfAzVtiGyfjhcSfVXkkpkTPaYAzn9g6zYhaVnhRt+ivw+qy8+Zmcd17ZfGu9qA7y
 /mnMB/B8U1JEeTjzGOoXCb/Np7GCNcPRaCt0cpu7ol8NdmDWGS9tyElmXDvxbzKnHYx7
 17KiBhvlAZKBffAOctM/OyAck3c0x5VK0r1X5qAy0cLSb149zRgHKlZh9WVH96ioQP1F
 x52ahZY2SJnG8/6U9zHrTsYq7rjqlJ9pqGf/O4uFp54lX33+1C5wHer2FxX4fI3yKX1p
 gC1X9Wd8hFYXujDHlwvvx4jz/rQ1XWikMxvSQuOqfBIuIpOzJL8MQddO/fp0R4Onr7Nv
 xZeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720117481; x=1720722281;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=O9HMrFcVZDenmphTehp9py7axRg9tQZVyNoIrqkiERM=;
 b=FkmLE+NuqruJXOGFxJFxOyjfkMRGBeiVwbIoxNmKT/GsbJVM8eIcVo9yAxfg7dG7cU
 57Hs1RVQZr6Xrwxcf883FelMvaHStFQpb9qp9c7RoWwCalFf+182GSMwqulfImmjAdNs
 v1gsGs+px5tXmBnBvv6bln4imqZmEGB/JIMMRMNDoLrw4/IAGhrkIgdEwaaDXxLH44x/
 oUjib8MBE1X8r+rb5djJ65m/9hGH2PrY2bq9B/WYDJ9qmftH/UclT/giDyNRfz6A8G1A
 w/58vtDFRGKi1nEQ2W39/Ko90oBwJqd+bXdwC8lrM9rFTnnhyW6esvl7mjwDM+rUXu+v
 CK7w==
X-Forwarded-Encrypted: i=1;
 AJvYcCVBDFY8gDr6Vt6e89/T0Amh2eiSG4Cymm/8GtzT7hakSxB89nx03bokj2x5940JzV1bRMXoWHUyA0yvvW69KqIk5M+k
X-Gm-Message-State: AOJu0Yyx2Yn50hRdyQSrAOpgqqvCqdVWxcsvPXlGCEyLYaw4QN1Gj4wG
 uXOLy50H/IeVw4iZEhgX26jSGRh0LuPLs2Xn/WDVR9GUcUqN5vndsJ9qLl4Ikzo=
X-Received: by 2002:a17:902:f693:b0:1f7:1706:25ba with SMTP id
 d9443c01a7336-1fb33e17bf7mr18111975ad.15.1720117481167; 
 Thu, 04 Jul 2024 11:24:41 -0700 (PDT)
Received: from [192.168.0.4] (174-21-76-141.tukw.qwest.net. [174.21.76.141])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-1fac0ba60a2sm129029805ad.0.2024.07.04.11.24.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 04 Jul 2024 11:24:40 -0700 (PDT)
Message-ID: <c69acef3-aba9-4171-8b9b-167025827b4e@linaro.org>
Date: Thu, 4 Jul 2024 11:24:38 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] target/arm: Always build Aarch64 gdbstub helpers
To: Peter Maydell <peter.maydell@linaro.org>
Cc: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org, Gustavo Romero <gustavo.romero@linaro.org>,
 qemu-arm@nongnu.org, Anton Johansson <anjo@rev.ng>
References: <20240619124903.56898-1-philmd@linaro.org>
 <42de8f25-3624-4e7c-b38c-ad8e3b8e61a4@linaro.org>
 <83667101-daba-43ea-ba33-1df547020cd9@linaro.org>
 <ebfa6ca6-d93e-45b3-8786-cb52505e2d7c@linaro.org>
 <CAFEAcA9bqgFwxsbvKFLUiGu=ThzF0zAy7-rD+7Yo4yNEoi4Pbg@mail.gmail.com>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <CAFEAcA9bqgFwxsbvKFLUiGu=ThzF0zAy7-rD+7Yo4yNEoi4Pbg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::631;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x631.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: EIGO7Z6ww4c/

On 7/4/24 08:01, Peter Maydell wrote:
> On Fri, 28 Jun 2024 at 17:50, Richard Henderson
> <richard.henderson@linaro.org> wrote:
>>
>> On 6/28/24 09:37, Philippe Mathieu-Daudé wrote:
>>> On 28/6/24 16:31, Richard Henderson wrote:
>>>> On 6/19/24 05:49, Philippe Mathieu-Daudé wrote:
>>>>> Merge gdbstub64.c in gdbstub.c and remove uses of
>>>>> target specific TARGET_AARCH64 definition.
>>>>> Small step toward single ARM/Aarch64 binary.
>>>>>
>>>>> Philippe Mathieu-Daudé (2):
>>>>>     target/arm: Merge gdbstub64.c within gdbstub.c
>>>>>     target/arm: Always build Aarch64 gdbstub helpers
>>>>>
>>>>>    target/arm/cpu.h       |   8 +-
>>>>>    target/arm/internals.h |   2 -
>>>>>    target/arm/gdbstub.c   | 363 +++++++++++++++++++++++++++++++++++++-
>>>>>    target/arm/gdbstub64.c | 383 -----------------------------------------
>>>>>    target/arm/meson.build |   1 -
>>>>>    5 files changed, 364 insertions(+), 393 deletions(-)
>>>>>    delete mode 100644 target/arm/gdbstub64.c
>>>>>
>>>>
>>>> Are we attempting a single binary for user-only as well?
>>>
>>> No, due to ABI constraints, right? I did a user-emulation
>>> smoke build, no failure, did I miss something?
>>
>> Well, no.  But qemu-arm does not need gdbstub64.c.
>> Given TARGET_AARCH64 will be set on a combined build, I'm not sure what is the fix?
> 
> Richard: I'm a bit confused about where we are with this
> patchset. Do your comments mean:
>   * this patchset is OK for system emulation but we
>     should (later) think also about user-mode ?
>   * this patchset has a problem with user-mode so it
>     needs rethinking ?
>   * something else ?

I'm confused about what this patch set improves.

It doesn't remove ifdefs; they're still there in gdbstub.c.  The code that handles aarch64 
is now in gdbstub instead of segregated into gdbstub64.c, so we have one larger file for 
no obvious benefit.

Was there some other build problem that I missed?  Because I don't see how it advances the 
stated goal of "a single ARM/AArch64 binary".


r~
