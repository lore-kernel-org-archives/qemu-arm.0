Received: by 2002:a17:906:bc5a:b0:a46:bbde:2c08 with SMTP id s26csp224906ejv;
        Wed, 20 Mar 2024 19:22:07 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVLiRVps9MWxqURcR7NORj0uEP9r0fRYd6UTrFNmlT3GjSDovDeHwGpFS6/xKsXorY80HDAVdWQwG35EGYt24DOI0OSN/LC
X-Google-Smtp-Source: AGHT+IFIZsHaJbyyPpoFcOKAGTy5vdSvA2Sh2bvMgY4/vK8qsLyhnqT7seDQ8POUq/TNb4SJ8EgX
X-Received: by 2002:a05:6122:2981:b0:4d4:20cb:8c0 with SMTP id fn1-20020a056122298100b004d420cb08c0mr7912067vkb.8.1710987727118;
        Wed, 20 Mar 2024 19:22:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1710987727; cv=none;
        d=google.com; s=arc-20160816;
        b=tkL2CseIRULLtQ713w2wqoir7ZLSd0v0wpatscAgFjUxNf+JcuOHZqTMJZtGQ1ttHh
         icP8SpWrMDg9/oHiDC6Nl7ShxJqtbOFzY5BZ4jaR/uff7/2+/T84MlpTcmyeJU57wNQs
         WmeYsseZLXQ1lfubIsbAs3MdUOvkUi2kSAmyXArYCBbGWTPy+XPXNbtgZ+S52CzJvntX
         BuAizyXZhtPAKGpjbos9ZLnKvCfV7V0Om/5TzAxSn6L4HQMgNv2SS/MzPW0CmIRXgT/Y
         t4pd4cRqzWomjCoGl2A+oTlIVSBX15z7WSHC4Ue0hP0v75ErTYDwv3R/UlKnQ2HsE8CU
         PnwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=7oMOvImn/q2QnsEoKEH9BRQSY8LnCLAmhNBL1UMRvwk=;
        fh=ucNU6PqoeziNdtNocb0THR3gV/rWWiAm6/yiKpeLcoQ=;
        b=i12yIxQAGWbX5DZQG+UaAfVfzKuFJoP5aFPZyz2qzJGPttH27qqajcQf+7KlAT3Kfc
         aeNcynLlx8Wf9wC9Zom+Ap23/OlVFGBJx6X0QA8fC6yptj0AdN2rC5tTg2PGK8AzMQYn
         tjQ9R3CSdwbghBYKg4Ht1OgfpTHPo57Rb1x5z6nnT48WDG+kue3t8MJedPzHpMw7oPe/
         yMTzut1BBRQtXiivcq6x79lo1/wT2iMa8ujG9FX0EmwsqImeuacrU5U/RBvugZy8ebwM
         +PihpEMPxwIZWzTi21/+6VlpJ5hYp5F1ACjgPz0/tiU+UQ8bwbDSOrOYzpDdTCw2jCqx
         MNCg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=f2da8609;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o7-20020ad45c87000000b0068f89d82bb1si14904586qvh.155.2024.03.20.19.22.06
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 20 Mar 2024 19:22:07 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=f2da8609;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rn83C-0001iN-IT; Wed, 20 Mar 2024 22:21:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1rn83B-0001hS-6U
 for qemu-arm@nongnu.org; Wed, 20 Mar 2024 22:21:01 -0400
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1rn839-0002b4-Er
 for qemu-arm@nongnu.org; Wed, 20 Mar 2024 22:21:00 -0400
Received: by mail-pf1-x429.google.com with SMTP id
 d2e1a72fcca58-6e709e0c123so488659b3a.1
 for <qemu-arm@nongnu.org>; Wed, 20 Mar 2024 19:20:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1710987657; x=1711592457; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=7oMOvImn/q2QnsEoKEH9BRQSY8LnCLAmhNBL1UMRvwk=;
 b=f2da8609bqrOKiVpIjXDIhY1no2Do7/WqFo6OpVvnYTIHH64l9b6gsr+wvLxDeMCS5
 YUP3LvJo0dOTXibJxhKbwqbwk6LvL7mQ0KGtCjYd9lNT8t4+zkpwDLWfxvxfOPj0wcVA
 u8gisPETiWu19lTmfUNYNWAmHYQ0jCWyV0DferPjyhoqrPQJLUadIpeL02fdh6bzbl/l
 nhrUO/0iYoBkjLdUVrDP5pPmyz0E8Y0XFkvZImeBIBIHxgg8hxIzDg6jIf6yb8rKFzu4
 sVqCxp72mKtotkDRKwwwaANhw6XIKhm1dLMQNA11zypGBiQCwTFIAG59jS/MsF0MI+Qg
 Rc4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1710987657; x=1711592457;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=7oMOvImn/q2QnsEoKEH9BRQSY8LnCLAmhNBL1UMRvwk=;
 b=hsT77GSp/PKoUtQYPnDlv12Qe14j1o+m9Msn+gdNoEu/wbpuVPWILDcJSdNxsWvGQG
 J8W0TPhzJuFHU23/tLiDPomfUnEqWhCMAbl/8beRTgsahwwgmSnslRXZWvVwoBRe1e0i
 5OlfuMVfJNbNqt8JVXdDAnhqAl4JtJDXWo+nHmKjguUoH527YB2aLIrNJJ1xtUfR/+yX
 ronF6O2JdzXHr225IAFrtOoSIsCqQJdwcZ+36+XCZAKsM+GGjQGdseVudoFIPH5cEtv1
 D8BmQb8KbaZ1aK/bzD4x4lEhWMdCHpNMkigA4LWXQvNxeq8l7NcIFAgqu8Np4Q1oGJOi
 AdTA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXCIKvE1cPHiM/BTlWQSuq44/vf2xESwpP3SpTY3+1aOOcvXeExpjTABkphbYgUwpTktiI4o+Y8j4THMRoxt2ORJl5B
X-Gm-Message-State: AOJu0YwzBWsGWseeYOv+QazdlpGtArmhWDtT2lNIPVfoJOlscVTaxggW
 JMe7BdKajsIW0iB2M3iJFfIzUjF8/xCppgblor+Ezmzyydh8L6oN32B2Xg51XxufNmYcAwwysOF
 v
X-Received: by 2002:a05:6a00:1702:b0:6e7:117:c5d5 with SMTP id
 h2-20020a056a00170200b006e70117c5d5mr7789207pfc.23.1710987656889; 
 Wed, 20 Mar 2024 19:20:56 -0700 (PDT)
Received: from [172.20.1.19] (173-197-098-125.biz.spectrum.com.
 [173.197.98.125]) by smtp.gmail.com with ESMTPSA id
 q20-20020a62ae14000000b006e6c38cbe96sm12372727pff.29.2024.03.20.19.20.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 20 Mar 2024 19:20:56 -0700 (PDT)
Message-ID: <ea557fdd-e133-4347-83dd-3f88d8ab04b2@linaro.org>
Date: Wed, 20 Mar 2024 16:20:52 -1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH-for-9.1 22/27] target/s390x: Convert to
 TCGCPUOps::get_cpu_state()
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: qemu-s390x@nongnu.org, qemu-ppc@nongnu.org, qemu-arm@nongnu.org,
 qemu-riscv@nongnu.org, Anton Johansson <anjo@rev.ng>,
 Thomas Huth <thuth@redhat.com>, David Hildenbrand <david@redhat.com>,
 Ilya Leoshkevich <iii@linux.ibm.com>
References: <20240319154258.71206-1-philmd@linaro.org>
 <20240319154258.71206-23-philmd@linaro.org>
 <ad0792cc-a782-47d8-9a18-c66883d9f6d1@linaro.org>
 <c022abf3-0db9-4a17-9d53-f735368e6066@linaro.org>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <c022abf3-0db9-4a17-9d53-f735368e6066@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::429;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x429.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: c8WTDT0vA+JC

On 3/19/24 21:09, Philippe Mathieu-Daudé wrote:
> On 19/3/24 22:05, Richard Henderson wrote:
>> On 3/19/24 05:42, Philippe Mathieu-Daudé wrote:
>>> Convert cpu_get_tb_cpu_state() to TCGCPUOps::get_cpu_state().
>>>
>>> Note, now s390x_get_cpu_state() is restricted to TCG.
>>>
>>> Signed-off-by: Philippe Mathieu-Daudé<philmd@linaro.org>
>>> ---
>>>   target/s390x/cpu.h            | 30 ------------------------------
>>>   target/s390x/s390x-internal.h |  2 ++
>>>   target/s390x/cpu.c            |  1 +
>>>   target/s390x/tcg/mem_helper.c |  2 +-
>>>   target/s390x/tcg/translate.c  | 23 +++++++++++++++++++++++
>>>   5 files changed, 27 insertions(+), 31 deletions(-)
>>
>> Why is the function in translate.c, not cpu.c (with or without ifdefs)?
> 
> My understanding is target/foo/tcg/ is better for TCG-specific handlers,
> less #ifdef'ry and stubs. Then bar_helper.c are meant for TCG helpers
> (including "exec/helper-proto.h").
> 
> Can you think of a better file (new name?) in tcg/ or do you rather
> keep it in the main cpu.c?

Given that all other targets to this point used cpu.c, I would prefer s390x and sparc to 
not be the only exceptions.


r~

