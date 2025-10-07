Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6EAB3CAC5B8
	for <qemu-arm@archiver.kernel.org>; Tue,  7 Oct 2025 03:44:12 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1v5yc6-0005xh-Fw; Mon, 06 Oct 2025 23:43:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1v5yc0-0005u3-Fq
 for qemu-arm@nongnu.org; Mon, 06 Oct 2025 23:43:41 -0400
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1v5ybx-00080I-Gb
 for qemu-arm@nongnu.org; Mon, 06 Oct 2025 23:43:39 -0400
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-46e6a6a5e42so28628685e9.0
 for <qemu-arm@nongnu.org>; Mon, 06 Oct 2025 20:43:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1759808615; x=1760413415; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=13jakWWqbOQaG81dRwTLbKHc9qikngdmGX6ZXJXZ3pM=;
 b=wpiEk7W2vGDiQRelIoQiMjcSSj9YbI7cdwlB6WWU99u5A29kK9DM7YU/Q/L/rZj5NC
 X+GJ/9GQRX7/AOnxf03Hi6vz1bplsKTML1XH3V4h44V67Ce4jekjCSN3m+nCe7gZZEC1
 2WmBdK00KgINtMnS7M5jkhcS4eFLbPelVGUXRik79I9XbMfEoDKC8DYUs6k2C3rTov1D
 VqhbNUKLczQ2sKa4xlRryNfK8+cUqzThWtaIAHXTtl3Ahfih0VOibJAZyW99dC0VZlau
 7wm8N0YKTAdRBZ6tKEouzFjtV2YrAKKqWaRoL4xMFLSsLy4NhSOMQ4YPCItXXmLrWBAG
 UgkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759808615; x=1760413415;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=13jakWWqbOQaG81dRwTLbKHc9qikngdmGX6ZXJXZ3pM=;
 b=oinvizVzLSyz1dPfNtNknpHf5aPBtrTiH5XOLokgPR44qyrXulhbrl2rXdklpGCwjk
 0nD+gbr6ILWRgT/oFjZzWRA5u2TZuwbd8hsseOYzoOKiNCaT94iU2BEwiM9d616eUkZW
 ZcC/t8H5eFfHnZ5c523R2otFKHfMiUL04HBwBh/UGd5O5vldXTfa+5ESZWOAAnsKAl8t
 AgIGIWzpkWeJWxt/h1sgxaI6aOxy7XhysLYbQjnYe622pDYTpmHaExTW9EffMFO7IoLf
 d/p3n/QIDGlXLs5Caqb9ZeKBuzdCtghdXWyc4GvTPZ3LskpXGDR5bvqpg0XS47L5sIMF
 BRfw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVPKDsAiPV9JhNwTNmGZxe9bLi8yj2U9zasQNTyA7lWYAfbjHgTL9ZOL4Wuc/Yb9yUYcdPHuEle8w==@nongnu.org
X-Gm-Message-State: AOJu0Yz2gIQ6oNGJ5FA/+HytBKagtyFjgVObsDGsOLcswmuRH0PyiAcS
 q2KS19GvVs9bbnf6VwcWrJNIBeoJBVehTIl7a4+tGgoXewmNbPt8kCKg1t0DdRVBK50=
X-Gm-Gg: ASbGnctWXqJNyUqm6O5AL3DcvRGFHGQzxazWXwgY9C0kD2TxjsC3P8IxykC3nabrgnd
 X7W65XSDh7xWtfJXUC3ldde4g5eBWBKblMFQp+ZDE+GW+AmpbvjCBSOs5X9lQS5AiikluRAwMNV
 2ZIeZpImFKE17sIrLpDDbLQkU/4BBjqygL6GsIDlxJ27Jf50IDOqZzqGyL0n/UbXRBvq61kG2Eg
 1W3BByWdH0PWzb+NoTUQyNVvsLcPZyZUZJn+9//cL7vqi73oIeJq5OXjanqCvYTN/OORtZNfuht
 6P9OVpJSH9HLlEnTAeFT/FcOm70RoLAXIoSDso3QHMmmvvEnaWQ0eTRumb9WQBH1xSyvUdhkN6t
 dhHHJ368zOV8U7Fqn4IadQ53kPE8fjpZ6i6P1D8tgUiiOOb5+Tyr+WQ+6wCveJ13NgIrM90fQXv
 UjJgPb/kuL+MeNIKgMJX5EhBw=
X-Google-Smtp-Source: AGHT+IFOb/iRLbYayf17DOpur/NdDdf56LbrdAsWqfFpCoUG60wk6da1u8P7o3Te/geaTrIt2xj8PQ==
X-Received: by 2002:a05:6000:615:b0:3e9:978e:48fd with SMTP id
 ffacd0b85a97d-4256714cb43mr9604936f8f.23.1759808614949; 
 Mon, 06 Oct 2025 20:43:34 -0700 (PDT)
Received: from [192.168.69.221] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-46e723431f5sm182179515e9.2.2025.10.06.20.43.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Oct 2025 20:43:34 -0700 (PDT)
Message-ID: <1c196a68-0b97-4c60-ae42-9b3643cb1d72@linaro.org>
Date: Tue, 7 Oct 2025 05:43:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 18/24] target/arm/hvf: Keep calling hv_vcpu_run() in loop
Content-Language: en-US
To: Mads Ynddal <mads@ynddal.dk>
Cc: qemu-devel@nongnu.org, Alexander Graf <agraf@csgraf.de>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-arm@nongnu.org,
 Mohamed Mediouni <mohamed@unpredictable.fr>,
 Peter Maydell <peter.maydell@linaro.org>,
 Phil Dennis-Jordan <phil@philjordan.eu>,
 Stefan Hajnoczi <stefanha@redhat.com>, Cameron Esfahani <dirty@apple.com>,
 Roman Bolshakov <rbolshakov@ddn.com>, Paolo Bonzini <pbonzini@redhat.com>
References: <20250903100702.16726-1-philmd@linaro.org>
 <20250903100702.16726-19-philmd@linaro.org>
 <E1EA7ABD-000E-454E-A49F-E8FB5572F831@ynddal.dk>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <E1EA7ABD-000E-454E-A49F-E8FB5572F831@ynddal.dk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x333.google.com
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

On 8/9/25 14:26, Mads Ynddal wrote:
> 
>> On 3 Sep 2025, at 12.06, Philippe Mathieu-Daudé <philmd@linaro.org> wrote:
>>
>> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
>> ---
>> target/arm/hvf/hvf.c | 40 +++++++++++++++++++++-------------------
>> 1 file changed, 21 insertions(+), 19 deletions(-)
> 
> It'd be nice with a commit message justifying the need for the change. I
> assume performance?

Performance is a super positive side effect. Actually I had issues in
the outer vCPU loop because it is only aware of EXCP_* return values,
and the code handling unknown '0' retval is dubious. IOW I'd rather have
the outer loop assert for unknown values, as a programming error.

> 
> Besides that:
> Reviewed-by: Mads Ynddal <mads@ynddal.dk>


