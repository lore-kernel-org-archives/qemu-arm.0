Received: by 2002:a17:906:d149:b0:a5d:17e5:aef9 with SMTP id br9csp1114821ejb;
        Thu, 23 May 2024 07:52:11 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXMjCk2HOlGp5UO1U6+dq76lFElZ5Qh5oc1w0kcIc7goHvsWwuTXdpwCHfH5x41hTNDzSEwUCxTcndFU/+GY4a9aW2mjo3U
X-Google-Smtp-Source: AGHT+IE88ljgV3yd7XJYzguR870QXKeJfIefvULwN0azZefE4LK0pKrlrg9Sk2hqnzHLDMFVp0es
X-Received: by 2002:a05:6870:659f:b0:23f:4548:5c67 with SMTP id 586e51a60fabf-24c68aeedf3mr5646970fac.35.1716475931319;
        Thu, 23 May 2024 07:52:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1716475931; cv=none;
        d=google.com; s=arc-20160816;
        b=Xmbn/XLNzabniwRvyDHf6/zTS9AJVmpKGhQyuraYO6VZRyO+m53RAaPHi/+HZIq2qJ
         WEivuCXrmdjCTk1PC62JyjEsU0DtnNN0DJZkqJXwSJc6zOiDF3RC8fBwv3qEtOwsH83P
         t8g/SbWEQYE56bVk9Cpji/GAEsCz0or8zoSDk8YYaZSCelK0Qwk04V75tHSbeLHYUpSt
         h+iIF5yvTXtnnREfAAZKv5Jk0AU6PaQo6dC8UsQwAN91y5L/XEjja6udWZC+MrIlvcOo
         TPOjGRIljr3GCw0Wjpsjy2ku0x4DaP1FV04GXFtgV+VIa0/4MsDq6LKgGJg5+I/U92Jf
         SNjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=qSFAlNjazZM3ovQ+0GrczowV9ckEVjnH2fjHWTfZhRs=;
        fh=MCovGJLh1lIaLGMXTtQa0XI/R1tpRfzTj2NAMWIQmbI=;
        b=QzHN+U5UdtlBkqEqaUpfUQWdwMfZwDjhMekWrDxjz/zAlhWc0jKVXsgLDvpZECSqkb
         8qCe7sZFn+gP0DguNI/ipvqPin5wPNpzACLRlCqcOYPNZu+Dqa8HnLjncTRU5HJzHMgU
         tMcGzktLevFti2Rzj/Q/VIIX4bz6KSBbZBGPmXyIpofxQnFoeUHWjq2g8jhuLCi+eiA1
         KMV/Zoym5pfUrVV9FXelswxvCcaF7mnFxg7pqH5UEoPcneZD7csOwoj/WWkE8vTeCZgT
         qBOFi2131ArWiX6ADTvYU/TRAKj90XZzAWXyaWq7TwjprzZlkyoelbP6kz1tcR5gVOGf
         pknw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=u8DfTefe;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-43e1a9ec417si122224911cf.511.2024.05.23.07.52.11
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 23 May 2024 07:52:11 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=u8DfTefe;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sA9n2-0007f9-Ae; Thu, 23 May 2024 10:51:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1sA9n0-0007bl-KH
 for qemu-arm@nongnu.org; Thu, 23 May 2024 10:51:30 -0400
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1sA9my-0002ve-9H
 for qemu-arm@nongnu.org; Thu, 23 May 2024 10:51:30 -0400
Received: by mail-pf1-x42c.google.com with SMTP id
 d2e1a72fcca58-6f6bddf57f6so2929049b3a.0
 for <qemu-arm@nongnu.org>; Thu, 23 May 2024 07:51:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1716475886; x=1717080686; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=qSFAlNjazZM3ovQ+0GrczowV9ckEVjnH2fjHWTfZhRs=;
 b=u8DfTefeRIbc6cTvXRMqryIFdVkEn59oBkdj9LTsJ0RNrNnA5MbzXL2bC53mEWfxXi
 lXIgEfCSKKvSHmzEIqrjQ07qOl/felWLs7czgyzS6E8QzxufoKUm5taioSlV/NVsDbSp
 aYOBxTSRjAtjDMV416pMQY8KIXDj9RiTWsrP08hFIX4R49jzH0KbNvPgVQHRFjiHmtDi
 L//3AlSBY1afTjTlay0oFeChFY4IXoX/p9pXQTCsJNw/yMX6wlshVHDb18+0+UiHFYvU
 ldDNdQxF6zLDbbB99cZnfFcaFVu0phLk3VtJa5bDlcLxTADg6IhdHYmUaze8ThCFWA5z
 Kx8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716475886; x=1717080686;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=qSFAlNjazZM3ovQ+0GrczowV9ckEVjnH2fjHWTfZhRs=;
 b=Jo9HfAMCNxrlZ0HVhlu5zf8lkbsYQVqJqgcShxy2/DPOfEHTB27HfRChNDKh1LJuhp
 Ug9n4DMyvPEhDgOjAzBIAfB5QewEk5RVEds+cEVAU+lQNcDtW/q/Iqka9YEqWbhF5gyE
 m4lFyNK7Dl+V3IsUczhABw00oerwBhxLZu23smaUbHdyRap6SjXVGtRidO2GpyDs9s4V
 i2rXhHtGs9o0kWMqd8gG9PAOMPvQiBi7dApRI2Vw7reFhx3dKuItLuRBylXKz8JeUa5D
 980/4u9GpTQo4N6Mx0lwd8+eGInjGyakxPxDJR/QEUE8pDgvZGFNW2I2wiC5GLuWpp8D
 /Xow==
X-Forwarded-Encrypted: i=1;
 AJvYcCWPxJrTRk7UtpsVse33NgQ+CCOITFBPo/fdIP8xTC509HBegt1P3cOHVzFbQR3vHrb/zyYq8UQnRyTf7TISobtpYNrK
X-Gm-Message-State: AOJu0Yz1iOYA4XBO2aiALXrq+aW8mV1HpxgkCn8RgJgLzZRcZNWhcSW0
 V117k8eafozpNaeWy7/aPKZH50LJM7uA//GrK/7Iu/+AcfMXH1BB1phnXUxFfT4=
X-Received: by 2002:a05:6a00:2e95:b0:6f3:ea67:48c3 with SMTP id
 d2e1a72fcca58-6f6d5e6f68amr6680137b3a.0.1716475886037; 
 Thu, 23 May 2024 07:51:26 -0700 (PDT)
Received: from [192.168.0.4] (174-21-72-5.tukw.qwest.net. [174.21.72.5])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-6f4d2af2b1esm24902735b3a.171.2024.05.23.07.51.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 23 May 2024 07:51:25 -0700 (PDT)
Message-ID: <a2ad9461-54f8-457b-87cb-21078b47f14f@linaro.org>
Date: Thu, 23 May 2024 07:51:23 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 30/57] target/arm: Improve vector UQADD, UQSUB, SQADD,
 SQSUB
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
References: <20240506010403.6204-1-richard.henderson@linaro.org>
 <20240506010403.6204-31-richard.henderson@linaro.org>
 <CAFEAcA8t=f15=FQeb4ZVKBDRfcUSS-=YqHETNFrF9U=TnFiBfA@mail.gmail.com>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <CAFEAcA8t=f15=FQeb4ZVKBDRfcUSS-=YqHETNFrF9U=TnFiBfA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
X-TUID: PmNsa8REHkvh

On 5/23/24 07:14, Peter Maydell wrote:
>>   void gen_gvec_uqadd_qc(unsigned vece, uint32_t rd_ofs, uint32_t rn_ofs,
>>                          uint32_t rm_ofs, uint32_t opr_sz, uint32_t max_sz)
>>   {
>>       static const TCGOpcode vecop_list[] = {
>> -        INDEX_op_usadd_vec, INDEX_op_cmp_vec, INDEX_op_add_vec, 0
>> +        INDEX_op_usadd_vec, INDEX_op_add_vec, 0
>>       };
> 
> Why don't we need to add XOR to this list? Is it because we can
> assume we have XOR-of-vector on all vector-capable hosts?

Correct.  There's an assert in tcg_can_emit_vecop_list that (1) baseline vector ops are 
*not* included in the list, and (2) all other ops *are* included in the list.


r~
