Received: by 2002:a17:906:aa04:b0:a46:bbde:2c08 with SMTP id ko4csp1764328ejb;
        Wed, 20 Mar 2024 00:10:51 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVUz+RlQrN4Udt22t0cSBpB/RdpwqwlGawAz2aJZpwhhmmLbjC6C9YToZGm5y0YGZAWQMOeeOKEdxdBT55mzFwVQD8uXg39
X-Google-Smtp-Source: AGHT+IE1rEuf9oMjoEOSbGNJZQKUQnce45tDHMPUKp4J/DSIZLnUFY4kZTs26t0NYZ8rERopsAyg
X-Received: by 2002:a05:620a:44d2:b0:789:e801:69d4 with SMTP id y18-20020a05620a44d200b00789e80169d4mr17864752qkp.66.1710918650870;
        Wed, 20 Mar 2024 00:10:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1710918650; cv=none;
        d=google.com; s=arc-20160816;
        b=BbaoaGWJgs3ZCe7kvjrqhI6p5sMOqAuKVxf03W1OnTE0TZPwY5DPcik5bpZxJNAXT8
         a9l5oLtABeqs/snvVF/BSAoa34kmT3e2Gedpx8/f86uAmQFIFn6CSrtzMBMnH6qRPzYa
         KxSem0cbeb/RO017MqkuD1RzJMWlN6gJ2Kba9NNfjBVbiy45t9E3c/Nc+xmyKHTPuoud
         VSD2V/Ka2wItv6VCu3V7/JnJdL7jlg932s/t0eReBmC80tSTQaJMKOfTP+enki+kD81d
         4nHB6cdydcpHQKLQ6vb97zMo2F6k44L4CEBgbl/HUABIA+wTZ5YcSzurSa56SdEIGrKX
         d4dA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=9TCCyf82sNabPMIvnlMd5F1b2YXxnDB1L4NUWQP6dko=;
        fh=N8b0IeeOAO1o4K8O4hxqrdL0zwxCzbe5yr9TLr8J91Q=;
        b=l4BVoOL3dyasGGi+6Y9RflgzuQJmEMC8O04NymvfgKKbGmzT0Sam84JSLmqkwftaEe
         9GjOVpk2FC3nzzHbPTuH86eeBN1Z5fx5oK9uHhhkYKUOLn5dnnk/+6rkzAMQFEVcnUa2
         YrURMnlamNxbByvOw75ad5x6caS26TtYolSFmG5wmgC2vppOtpW9BBiT0OyeTVlIFV39
         XTreZhTw02YgX97T88NlqVhVmy7c2J/7nBrVzbD6naHU7fSqkv1Fid4eWAjg4iBBsGvF
         MwYu+G673eo1zL+9ZOZYiEDthu826y18gcwWaVNQFZDEfn0YOrKFBf2JZJsXNPhVohY2
         BXNw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=vWht2Amm;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id wl9-20020a05620a57c900b00789faaef7c7si6775169qkn.268.2024.03.20.00.10.50
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 20 Mar 2024 00:10:50 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=vWht2Amm;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rmq5M-0005hw-NQ; Wed, 20 Mar 2024 03:10:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rmq5K-0005g1-Md
 for qemu-arm@nongnu.org; Wed, 20 Mar 2024 03:10:02 -0400
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rmq5E-0007CZ-GW
 for qemu-arm@nongnu.org; Wed, 20 Mar 2024 03:10:02 -0400
Received: by mail-ej1-x62e.google.com with SMTP id
 a640c23a62f3a-a46ba1a05e0so414510366b.3
 for <qemu-arm@nongnu.org>; Wed, 20 Mar 2024 00:09:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1710918594; x=1711523394; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=9TCCyf82sNabPMIvnlMd5F1b2YXxnDB1L4NUWQP6dko=;
 b=vWht2AmmWQWMTQMEWwEClP/BkrqueULLfmVba//3b7ws2MNW5kCaC/OdBfT5VMx5YT
 WrP7k0wE0ZEL/Dzt9p4CPDDtUrYMpJqqsLvmbLMfHFeet2zcT+FLJHPRcNdwBMcMcI6m
 IhG35nrJhW0iOY3tA8cTeyuLBY0m6cVgDFpizLmW1C5AD/lDaTBD0rgvQahTqF+5ziZL
 uMK+NgLPZuwryu1kLFuLqPbN7y/JwNP31X1gppVOaUg9LKPyHBNco0LiJ+px4Xk3qZn2
 dGCmoBQ9FJesR48Y5N8eoeX8gpBLYSGslnLy+1CapfBvYvaCfMyX3EZFKLjRPrnbL5HQ
 V5uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1710918594; x=1711523394;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=9TCCyf82sNabPMIvnlMd5F1b2YXxnDB1L4NUWQP6dko=;
 b=RPrtlCuHGbYQoU4co8kSuzoLbeIc9kJHXX9ARrkTkkxom3yiZckqw2RSBe5z115aVQ
 E9lG/uJa5DeWgmvt7y0T0QsmXVL9hW29QdPX6NZdxzKbx20krkVnepe4Nq+5UG5fwm8i
 cpDTsMYNHKAoJiGQeWg0Ft7248QL/n7r1tjsIIZj2ZHEmrEdr53YIHMS3D/RsUPHxwgN
 xuxmeAT3srzcafdhRn3mdhSrDUZM4QcmfZiFzZAm3NMH5AvFO+Z4zDAUIs6tVaXLA5AW
 qONcAULDInezcpPsxSGTA/Y5mZZB62ssjxaP86K6+od0Qoukk/ctV1vOmG9MZhd8gExM
 JWEA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVF046/WDiVrKaG9acNO8smSXc5rKVU7SNV4KAB80IBqVtICi9s4E3reZH9G+uVY7g8Yldy8NJBQAqK800q0C6+4LTy
X-Gm-Message-State: AOJu0Yxcf0Tvuj7vD0XrDh83NstXVwt5gYJlv8HEVnpzU82Z4kozffqE
 Ff8MeXnbAaFKDN8UPms8MC49fG4O/Y3y8nqc00dkebYxLAy4KkrblDg8PD+V0l4=
X-Received: by 2002:a17:906:fcc6:b0:a46:2b87:9f38 with SMTP id
 qx6-20020a170906fcc600b00a462b879f38mr2718997ejb.29.1710918594489; 
 Wed, 20 Mar 2024 00:09:54 -0700 (PDT)
Received: from [192.168.69.100] ([176.176.156.105])
 by smtp.gmail.com with ESMTPSA id
 st6-20020a170907c08600b00a46af639a77sm4151594ejc.172.2024.03.20.00.09.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 20 Mar 2024 00:09:54 -0700 (PDT)
Message-ID: <c022abf3-0db9-4a17-9d53-f735368e6066@linaro.org>
Date: Wed, 20 Mar 2024 08:09:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH-for-9.1 22/27] target/s390x: Convert to
 TCGCPUOps::get_cpu_state()
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-s390x@nongnu.org, qemu-ppc@nongnu.org, qemu-arm@nongnu.org,
 qemu-riscv@nongnu.org, Anton Johansson <anjo@rev.ng>,
 Thomas Huth <thuth@redhat.com>, David Hildenbrand <david@redhat.com>,
 Ilya Leoshkevich <iii@linux.ibm.com>
References: <20240319154258.71206-1-philmd@linaro.org>
 <20240319154258.71206-23-philmd@linaro.org>
 <ad0792cc-a782-47d8-9a18-c66883d9f6d1@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <ad0792cc-a782-47d8-9a18-c66883d9f6d1@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62e;
 envelope-from=philmd@linaro.org; helo=mail-ej1-x62e.google.com
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
X-TUID: P9nOFjqJ8xwJ

On 19/3/24 22:05, Richard Henderson wrote:
> On 3/19/24 05:42, Philippe Mathieu-Daudé wrote:
>> Convert cpu_get_tb_cpu_state() to TCGCPUOps::get_cpu_state().
>>
>> Note, now s390x_get_cpu_state() is restricted to TCG.
>>
>> Signed-off-by: Philippe Mathieu-Daudé<philmd@linaro.org>
>> ---
>>   target/s390x/cpu.h            | 30 ------------------------------
>>   target/s390x/s390x-internal.h |  2 ++
>>   target/s390x/cpu.c            |  1 +
>>   target/s390x/tcg/mem_helper.c |  2 +-
>>   target/s390x/tcg/translate.c  | 23 +++++++++++++++++++++++
>>   5 files changed, 27 insertions(+), 31 deletions(-)
> 
> Why is the function in translate.c, not cpu.c (with or without ifdefs)?

My understanding is target/foo/tcg/ is better for TCG-specific handlers,
less #ifdef'ry and stubs. Then bar_helper.c are meant for TCG helpers
(including "exec/helper-proto.h").

Can you think of a better file (new name?) in tcg/ or do you rather
keep it in the main cpu.c?

Thanks,

Phil.

