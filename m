Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79BECCA0EE6
	for <qemu-arm@archiver.kernel.org>; Tue, 19 Aug 2025 16:26:09 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uoP9e-0000Gp-73; Tue, 19 Aug 2025 12:25:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1uoP9O-00008J-RW
 for qemu-arm@nongnu.org; Tue, 19 Aug 2025 12:25:33 -0400
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1uoP9L-0002Ql-RW
 for qemu-arm@nongnu.org; Tue, 19 Aug 2025 12:25:30 -0400
Received: by mail-pj1-x1029.google.com with SMTP id
 98e67ed59e1d1-323267b7dfcso5117613a91.1
 for <qemu-arm@nongnu.org>; Tue, 19 Aug 2025 09:25:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1755620724; x=1756225524; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=T9pW//KrxQJg6uWS9DF6bgFeIcH/PuAXnmWOLCfcEmQ=;
 b=xe2uW9z5PkeF0LLbv0XRxRi2K6rYdwrYtwK0KkiipJYVCvZQBDlJvRJwecBQcFhjEE
 Vb6SwSrzECBv6Ql3ZBSq738oVBWL3JlTSc0J0yco73jmOcOAoKbQJ0+5NXlz2tB5n8vQ
 bhQZAx9xKN0YwcT8x4pvxjUApDHo0gNim6aIBtqPcEwbSedBBRVnv0riyz9wt7MwrjO1
 UEqCB5PzfqMuoL9dkWBHRoHsunqpPwXerrr42ARdvvJ9lsaJb1lsbHtLMtkCSsbikrKl
 gSCuoZukFQYMYs/MCFcoxf6cCyfd9GXwgTvX3OhThF4WZMzJHRsoBIi8ZutLk0Dh2I7j
 kTXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755620724; x=1756225524;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=T9pW//KrxQJg6uWS9DF6bgFeIcH/PuAXnmWOLCfcEmQ=;
 b=PfPPHZ0TlUQyHYyGW01mIHs3LzuNKY21HUlgsdbOUe8jq7aksoiQ6xivKuOPJQ5635
 Y1Q7NdM/GC0doMrUGlMDc8vaN1hMD630+YT+2paVxuUJVUJ/kSO1VF6u9Y4Yp+KPQyxZ
 hPV1eyYvvt4pK6tSURXe4F2u9d9NIA2okrNhJonOK7/vqvjMBsH/8bIxHWzC9JwltZoa
 V+M5uwV/YEufoclMzqawOLBSgor/LIF8h1MxAMtwnfNEijm20pGZIrjc/A3k0YB1rdjo
 8WcEpJfsFG+h8/srQU2679x2385QgdeTWhpdU47VBMcr2er5cg3GZr1O46579hbadaEu
 zEDQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVblthDbHN3zBDut85mnSMSEt1LM/oYfnMn6wwCN4JB2XHY0CipQlIQKwQB3UmqTPMqSUYAG7gWSQ==@nongnu.org
X-Gm-Message-State: AOJu0YyO4dqZyguMmwbye6r9FuDeRJi0Y2/kL6SKqm4XPFO8W+8SET7u
 L9jO9UYB1QKmT5u/sJ0jtUxcMN7fPKpsPsV5Vkw5toIdBr3oB1wtVZjFwJ/kHN5tG1s=
X-Gm-Gg: ASbGncsVI5E+wxUVXgAWFiDBr1iBw23BkmKCdL8e+qxphqOQUf3zmR6piHBs56Y3OPu
 1AWpZ3RC2MQPJkvXSCpsrz9nAtmBHCwt6n9h5lwU3B8lMDxWsrymeTO0jyyyfJR6uc8wrwGfhr/
 oEv3OOGwBo3VVo5vk1jCmbNdXtAhhJXPsQyz/g7kXC476T53jBxsy0MgdXQM4kUz9+XRDt6kV1a
 /azYiwVRtrJL4tKrY27zrsqI0JGAY4aWui45f1oWH8Gldj3geDzuA0/IegxzXw3bPrPWF0TrVHa
 ifJbwvVDcpWqKq/KIjCQLSDESGzrNEA1CmLzxKzSvei3FkHbpwCOE8sKfCEf1Xeq6xV7fzagSRC
 HYCvHAPBug4YJoFhAAc7ADiuxQH6aL7tnaWlcgATztEGd+Q==
X-Google-Smtp-Source: AGHT+IGCnhS4KyTK7xqq6w781WHkGdUKBLX6TPfX7d23WEje40YuhaW2JkajL7LcmObgLWg1ip5UIg==
X-Received: by 2002:a17:90a:ec86:b0:312:1c83:58fb with SMTP id
 98e67ed59e1d1-3245e56ce40mr3781603a91.1.1755620724005; 
 Tue, 19 Aug 2025 09:25:24 -0700 (PDT)
Received: from [192.168.1.87] ([38.41.223.211])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-3237e3eef9asm3296885a91.19.2025.08.19.09.25.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 19 Aug 2025 09:25:23 -0700 (PDT)
Message-ID: <3eefa4f1-56ae-40ed-9317-2a3e4e6983ea@linaro.org>
Date: Tue, 19 Aug 2025 09:25:22 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 15/18] whpx: arm64: implement -cpu host
Content-Language: en-US
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Mohamed Mediouni <mohamed@unpredictable.fr>, qemu-devel@nongnu.org,
 =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Igor Mammedov <imammedo@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Roman Bolshakov <rbolshakov@ddn.com>, Phil Dennis-Jordan
 <phil@philjordan.eu>, Ani Sinha <anisinha@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Alexander Graf <agraf@csgraf.de>,
 Mads Ynddal <mads@ynddal.dk>, Sunil Muthuswamy <sunilmut@microsoft.com>,
 Zhao Liu <zhao1.liu@intel.com>, Marcel Apfelbaum
 <marcel.apfelbaum@gmail.com>, Eduardo Habkost <eduardo@habkost.net>,
 Cameron Esfahani <dirty@apple.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Shannon Zhao <shannon.zhaosl@gmail.com>, qemu-arm@nongnu.org,
 Yanan Wang <wangyanan55@huawei.com>
References: <20250808065419.47415-1-mohamed@unpredictable.fr>
 <20250808065419.47415-16-mohamed@unpredictable.fr>
 <CAFEAcA9iQnrKWXPXw2wG3c6gmevOMFQtt48HsJdx8GZz2sd+4Q@mail.gmail.com>
 <8e64fd77-9969-42b3-bbcd-1ed8de910ff9@linaro.org>
 <CAFEAcA9OXu3=HuA9n+Oo0C5K5hTG+kLr9xsM=geBJ_UtCi4_-w@mail.gmail.com>
 <aKSUS2-JrMBX7JXo@redhat.com>
 <1396c8cf-fb2c-4b39-811a-7152bdbe976f@linaro.org>
 <aKShmdP3Pdn-wYgY@redhat.com>
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
In-Reply-To: <aKShmdP3Pdn-wYgY@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1029;
 envelope-from=pierrick.bouvier@linaro.org; helo=mail-pj1-x1029.google.com
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

On 8/19/25 9:08 AM, Daniel P. Berrangé wrote:
> On Tue, Aug 19, 2025 at 08:48:16AM -0700, Pierrick Bouvier wrote:
>> On 8/19/25 8:12 AM, Daniel P. Berrangé wrote:
>>> On Tue, Aug 19, 2025 at 04:06:45PM +0100, Peter Maydell wrote:
>>>> On Tue, 19 Aug 2025 at 16:04, Pierrick Bouvier
>>>> <pierrick.bouvier@linaro.org> wrote:
>>>>>
>>>>> On 8/19/25 6:24 AM, Peter Maydell wrote:
>>>>>> On Fri, 8 Aug 2025 at 07:55, Mohamed Mediouni <mohamed@unpredictable.fr> wrote:
>>>>>> Can you follow the QEMU coding style, please (here and elsewhere)?
>>>>>> Variables and function names should be all lower case,
>>>>>> and variable declarations go at the start of a C code
>>>>>> block, not in the middle of one.
>>>>>>
>>>>>
>>>>> In some cases, including in this function, I feel that the rule to
>>>>> declare variables at the start of a block is not really helpful, and is
>>>>> more related to legacy C than a real point nowadays.
>>>>> As well, it sometimes forces to reuse some variables between various sub
>>>>> blocks, which definitely can create bugs.
>>>>>
>>>>> Anyway, I'm not discussing the existing QEMU coding style, but just
>>>>> asking if for the current context, is it really a problem to declare
>>>>> variable here?
>>>>
>>>> The point of a coding style is to aim for consistency. QEMU
>>>> is pretty terrible at being consistent, but we should try.
>>>> The rule about variables at start of block is not because
>>>> some compilers fail to compile it, but because we think
>>>> it's overall more readable that way.
>>>
>>> There are also potential[1] functional problems with not declaring
>>> at the start of block, because if you have a "goto cleanup" which
>>> jumps over the line of the declaration, the variable will have
>>> undefined state when the 'cleanup:' block is running. This is
>>> something which is very subtle and easily missed when reading the
>>> code flow.
>>>
>>
>> This has nothing to do with where variables are declared, but where they are
>> assigned. The same issue can happen whether or not it's declared at the
>> start of a block.
>>
>> I suspect we use -ftrivial-auto-var-init precisely because we force
>> variables to be declared at start of the scope, i.e. where they don't have
>> any value yet. So, instead of forcing an explicit initialization or rely on
>> compiler warnings for uninitialized values, it was decided to initialize
>> them to 0 by default.
>>
>> If we declared them at the point where they have a defined semantic value,
>> this problem would not exist anyway, out of the goto_cleanup situation,
>> which has the same fundamental issue in both cases.
> 
> It really isn't the same issue when you compare
> 
>    void bar(void) {
>      char *foo = NULL;
> 
>      if (blah)
>         goto cleanup:
> 
>    cleanup:
>      if (foo)
>         ....
>    }
> 
> vs
> 
>    void bar(void) {
>      if (blah)
>         goto cleanup:
> 
>      char *foo = NULL;
>
>      ...some code...
>
>    cleanup:>      if (foo)
>         ....
>    }
> 
> The late declaration of 'foo' is outright misleading to reviewers.
> 
> Its initialization at time of declaration gives the impression
> that 'foo' has well defined value in the 'cleanup' block, when
> that is not actually true. In big methods it is very easy to
> overlook an earlier 'goto' that jumps across a variable declaration
> and initialization.
>

"Big" method is probably the issue there. If it's not possible to follow 
control flow in a given function, it's a strong hint there is a problem 
with its size, independently of any standard. And even though 
goto_cleanup is a legit pattern in C, I still don't get the argument 
about declaring variable far from their definition point in this case.
It seems that we are trying to solve the consequence without really 
understanding the root cause issue.

> Even if not all methods have this problem, the coding standards
> guide us into the habit of writing code that is immune from this
> kind of problem. That habit only forms reliably if we apply the
> coding standards unconditionally, rather than selectively.
>

That's right, but humanly enforced coding standard are usually a waste 
of time for everyone (reviewers and developers).

How many messages and exchanges on the mailing list could we save by 
using something like clang-format on the codebase, and force it to be 
"clean" as part of the CI? There would be no more discussion, as there 
would be only one single and objective source of truth.

> With regards,
> Daniel


