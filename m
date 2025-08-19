Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92BCDCA0EEB
	for <qemu-arm@archiver.kernel.org>; Tue, 19 Aug 2025 15:48:38 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uoOZT-0000kv-8N; Tue, 19 Aug 2025 11:48:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1uoOZR-0000kK-Sd
 for qemu-arm@nongnu.org; Tue, 19 Aug 2025 11:48:21 -0400
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1uoOZQ-0003Z6-71
 for qemu-arm@nongnu.org; Tue, 19 Aug 2025 11:48:21 -0400
Received: by mail-pf1-x431.google.com with SMTP id
 d2e1a72fcca58-76e2ea79219so6260598b3a.2
 for <qemu-arm@nongnu.org>; Tue, 19 Aug 2025 08:48:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1755618498; x=1756223298; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=j6BZc9SKK+UiaMRIB9B2dq1pyKcokINx0nKeKUuluMg=;
 b=L6HtFln2DTHwN7GvRs5yaaoH8hk96Z2up2PbtU2rrLjr0XWyqTopNJgeOrrSUJoGa1
 9egeevewY4mmREwGiBn6Rwgf8CRWM6yduGjQ4Ms7qfYfmpkteXSYyaFF8ycwlEvgbY2v
 iMNnYiVVsdNK/PWZs5JDfxxMVj3FQmZqVaPjajXaKhOOtcsjvxInbKWHlo2nFnsF+4xH
 gMnTWgSpsIGU07lOeIDlcDS5vwJ/YC0+joq710bDeM5qbF7Mrs9XMZ8pXkr+3rNpzg4W
 AIK4uhE+GF++aAIY+r4Uyy5fl4zpQr3YWPi4s1Ds/Qnyjb5pIGHku2f3QQJ7fqJln/sI
 XdlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755618498; x=1756223298;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=j6BZc9SKK+UiaMRIB9B2dq1pyKcokINx0nKeKUuluMg=;
 b=TSaajLaSgLslopl7W3mjolloVFbRoJB8wd1xOmYmGCDsFaCsw8Hg2Wq+OTW/iBFBbG
 rtQI21L6ryhs7t1HOZhwi7yGZhGs/Oom4VkhyhBaJEnDLWVUue+VF4iUjO8nr9ygakA+
 wR6rKj2P/WkP/TF70wMmnjtBQbRKPlk1A7Wvx0ddRodN3PjYft1l1LgOV9yI6AgZ+zAM
 5oueLatPDdctsmsHI4jc6LjmVTDo9PiMFFETk6H+88su/CnE0YSke8AdOQ/Qgie4J2i8
 gqGk4rZjdj23I8b3K0C32G07ZJ9dn0Ev2AEJ/IkNvr39lttXB5MgrOfA4vNrofJD5eaH
 APFA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXhsX4xUo15mTd16xFuM1qXqk34KqR++7vQAU5PfkZre8DWhGZjLkVCrTvXviZncClb2yR5Iwujyw==@nongnu.org
X-Gm-Message-State: AOJu0Yx9OUmSOVH/9tjOLnb7nK7QP7a6p80jMQG0qj57cQ1cJRxgJS6z
 v+uV+JjaUHgBUT9kNx+VxJCNFOHb4DDoXxSkQcDZAnWJmB6Tutkk6U2xR/GzHLISNyk=
X-Gm-Gg: ASbGncv9GU/4NZL9soveVQTpO1TuuCVIMNW5CiBi4oGU7S+8x5UuVQ5XF4ZvMtF7CQI
 oHXHwLMO6YLU3B5X2mboNdM5r49967uRQZ77/YG7wbaMJwJYpXgLYjyz7t5g1z+lP2Ensm41jXR
 c4wHKnPGHc3HddIbO+iqKI6fKxuItX/NhVXSHebsdZmNFH+yQ8N7/CqPzjKtjASMKop7ZBtiGB2
 LUtrNFInQaMiHr+s2vS1n0zn8k9A57qm0y2+rlMB+p2rn+HtZ5PlfFGrBr+HNPUAtRFpCgANpMl
 BnWpH9gdekSUv+StID5PShODzGsEcAfcSRNHcr5+MhG8CRWxY3/WWGQ6UiRIrEB2RlO3TqnShza
 vAGl/7irvXXxWtYyhSzKBHubbFWlD8kpcGQ8=
X-Google-Smtp-Source: AGHT+IHzKdPGnuh5ePrXs3AayZneWjnAdZJOW/mYIOlKo26QEYHuf3tmWHItehL2YcRiWcVOicl7yg==
X-Received: by 2002:a05:6a00:929c:b0:749:bb6:3a8e with SMTP id
 d2e1a72fcca58-76e80eb487cmr3738344b3a.1.1755618498163; 
 Tue, 19 Aug 2025 08:48:18 -0700 (PDT)
Received: from [192.168.1.87] ([38.41.223.211])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-76e7d5242dasm2881479b3a.77.2025.08.19.08.48.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 19 Aug 2025 08:48:17 -0700 (PDT)
Message-ID: <1396c8cf-fb2c-4b39-811a-7152bdbe976f@linaro.org>
Date: Tue, 19 Aug 2025 08:48:16 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 15/18] whpx: arm64: implement -cpu host
Content-Language: en-US
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>
Cc: Mohamed Mediouni <mohamed@unpredictable.fr>, qemu-devel@nongnu.org,
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
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
In-Reply-To: <aKSUS2-JrMBX7JXo@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::431;
 envelope-from=pierrick.bouvier@linaro.org; helo=mail-pf1-x431.google.com
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

On 8/19/25 8:12 AM, Daniel P. Berrangé wrote:
> On Tue, Aug 19, 2025 at 04:06:45PM +0100, Peter Maydell wrote:
>> On Tue, 19 Aug 2025 at 16:04, Pierrick Bouvier
>> <pierrick.bouvier@linaro.org> wrote:
>>>
>>> On 8/19/25 6:24 AM, Peter Maydell wrote:
>>>> On Fri, 8 Aug 2025 at 07:55, Mohamed Mediouni <mohamed@unpredictable.fr> wrote:
>>>> Can you follow the QEMU coding style, please (here and elsewhere)?
>>>> Variables and function names should be all lower case,
>>>> and variable declarations go at the start of a C code
>>>> block, not in the middle of one.
>>>>
>>>
>>> In some cases, including in this function, I feel that the rule to
>>> declare variables at the start of a block is not really helpful, and is
>>> more related to legacy C than a real point nowadays.
>>> As well, it sometimes forces to reuse some variables between various sub
>>> blocks, which definitely can create bugs.
>>>
>>> Anyway, I'm not discussing the existing QEMU coding style, but just
>>> asking if for the current context, is it really a problem to declare
>>> variable here?
>>
>> The point of a coding style is to aim for consistency. QEMU
>> is pretty terrible at being consistent, but we should try.
>> The rule about variables at start of block is not because
>> some compilers fail to compile it, but because we think
>> it's overall more readable that way.
> 
> There are also potential[1] functional problems with not declaring
> at the start of block, because if you have a "goto cleanup" which
> jumps over the line of the declaration, the variable will have
> undefined state when the 'cleanup:' block is running. This is
> something which is very subtle and easily missed when reading the
> code flow.
>

This has nothing to do with where variables are declared, but where they 
are assigned. The same issue can happen whether or not it's declared at 
the start of a block.

I suspect we use -ftrivial-auto-var-init precisely because we force 
variables to be declared at start of the scope, i.e. where they don't 
have any value yet. So, instead of forcing an explicit initialization or 
rely on compiler warnings for uninitialized values, it was decided to 
initialize them to 0 by default.

If we declared them at the point where they have a defined semantic 
value, this problem would not exist anyway, out of the goto_cleanup 
situation, which has the same fundamental issue in both cases.

> With regards,
> Daniel
> 
> [1] I say "potential" because we unconditionally build with
>      -ftrivial-auto-var-init=zero to mitigate this danger
>      in practice.


