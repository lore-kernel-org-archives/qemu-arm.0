Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3588CAC5BB
	for <qemu-arm@archiver.kernel.org>; Wed,  1 Oct 2025 18:39:09 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1v41j5-0005Wt-Qk; Wed, 01 Oct 2025 14:38:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1v41j0-0005Rk-JW
 for qemu-arm@nongnu.org; Wed, 01 Oct 2025 14:38:52 -0400
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1v41if-0007VW-JO
 for qemu-arm@nongnu.org; Wed, 01 Oct 2025 14:38:49 -0400
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-46e491a5b96so893325e9.2
 for <qemu-arm@nongnu.org>; Wed, 01 Oct 2025 11:38:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1759343902; x=1759948702; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=3/bwK0Puit+/BlxX00s7LpTO74tTRI4xjl/ObzNkssw=;
 b=yJnhzy+4hs1zI5Zboa7tzn4GvL7v4jIlqMrxrqABCClJaSWqhmBKF6IeS5uFP4xQjr
 sU1gpiPfjvJB4aS4w4rlz5L1yCI3DBd3hM1JTeBEbZvD9zCs6ic2LFLUp1gUD2x1xpGy
 ATbeZFHTBO24asKSi8Gypi5KqPWdOA+aRL+EjVxhP5k3HqKE0rQCeinx6Q+V6/YNK8A9
 CSAhjwP7R/nkGbQz3y1I63m5wWtZfSzV9sMSlMjVWUO256oqMz2NRoa9vZ5KaRaiIO0x
 wLxv4v5XM/v0dG7W/ngWNErZxrRyeJ2R5C4mycEG26JseYkDE9px6k/pwu7s8yubsdeA
 8LTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759343902; x=1759948702;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=3/bwK0Puit+/BlxX00s7LpTO74tTRI4xjl/ObzNkssw=;
 b=b5IJKOKXD2cp9PVkOh5AtyjSSfycP3U41phpXSK13+bSptDmEGBlnY4llvX2p7VMVk
 PNBVj6Vbla+BYZnTfEt2PmgMtSeer6fUCVV/+5NDsgT4OFjL5e6TkaFQVnioCOk1o2SS
 /WH4pMRs5YR/uJDfZrCXJRi7tKc9CWbmCUpMCVzhOZ080ZxykkbJb/T/GxIyTkcwv9D+
 FbeJCfRWSTo33CxJt+oaJzuhH/YCSsv+vAerkdsGH2w64u9MYBQJAnGgTUtb0YontbsO
 NuGYUZfmHy+3WcathfvnbY19PDyXKn/Ucni2wIaEcaxw0SGYD6R0y9vXnRhEGo2rwDfI
 FD7g==
X-Forwarded-Encrypted: i=1;
 AJvYcCXotU88+M90z+Js3irPNP/RJEMlw4rT41EZXOp5CHagP//3Cu7RgTM59zSBg5oAU/qqvWENZHn+EA==@nongnu.org
X-Gm-Message-State: AOJu0YwrG5/Q1vRXGYT3x/UBngjq9IQMtdS9GYC9iGIOaS8ycDeuf9Vh
 /QCUh1+89u3PCP3eWuE4BD5z7pkXO3SEJR+j7wqfQZMcMWeIZvvXFx6iSkIMFWdK3nU=
X-Gm-Gg: ASbGnctt6VajnL2VpGh+tAHZDHc2rPCyV99aZQRxMGvsZeAKEy9tj1mS+AUFMmaN0dc
 EG6OxHXNdbpaLxCD2Ut6Jsml8qIjoYApfd9UjZp2Y14pmtQSqOMNQxrjqv87VeIAq6eYqKaKrNJ
 UnWoF22v8s+jpA5efm0F3Qxv1Q4uj6B0zDtFSJ/9Ia5aQ+g2svaJKd4CKgJNrdU85Bpk7tzw5of
 T0mTcBq4MOfY9X9TBhRmzhJPlnhAbyTvtTLmrcmwypgPhE7hSImI55v4dTPfm9mSl4Gsk20pRZn
 DPp+PTBu8aUxokf6n9MePL3253uzuDGAmMcK8C+yBXtqFiMENRTqiqQmbQ8wxyFWxCdffGFNbH7
 JxN3IvaypLDod4hJq1k05eCKUFO/XCM5SFLZZ3UII9ICAkpS7nw40yaop3JlyiOMmMLrgRW4gfI
 EKvrX/JiBKVK1K2YjGfiA=
X-Google-Smtp-Source: AGHT+IGx6UiTpbvYa5RVE+Ww2cUlmGQoD+6deTu6MRRli7uzDzb8L4c1jhtw/9ZS+I6gAwit2m2h1A==
X-Received: by 2002:a05:600c:c093:b0:45b:4a98:91cf with SMTP id
 5b1f17b1804b1-46e61faa217mr24206275e9.15.1759343901417; 
 Wed, 01 Oct 2025 11:38:21 -0700 (PDT)
Received: from [192.168.69.221] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-46e675b557fsm25329725e9.0.2025.10.01.11.38.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 01 Oct 2025 11:38:20 -0700 (PDT)
Message-ID: <5556bf04-0a3e-4963-83e5-a7ff25d65567@linaro.org>
Date: Wed, 1 Oct 2025 20:38:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 00/22] hw/core/cpu: Remove @CPUState::as field
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, qemu-s390x@nongnu.org,
 qemu-riscv@nongnu.org, qemu-ppc@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>, Peter Xu
 <peterx@redhat.com>, armbru@redhat.com
References: <20251001150529.14122-1-philmd@linaro.org>
 <CAFEAcA-daogqBPxt72qTM6BuMuD1wuw+vXZwxLUQftwY2FZk=w@mail.gmail.com>
 <b5280074-e87c-4838-b816-eb9e42dd090c@linaro.org>
 <2a53049c-01e2-4f0e-ac51-f55d50173b22@linaro.org>
In-Reply-To: <2a53049c-01e2-4f0e-ac51-f55d50173b22@linaro.org>
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
 T_SPF_TEMPERROR=0.01 autolearn=unavailable autolearn_force=no
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

Hi,

On 1/10/25 18:42, Philippe Mathieu-Daudé wrote:
> On 1/10/25 18:35, Richard Henderson wrote:
>> On 10/1/25 09:08, Peter Maydell wrote:


>>> Targets that use multiple address spaces need to be careful
>>> about which AS they use by definition. Unless we have a
>>> track record of code in those targets carelessly using
>>> cpu->as when it should do something else, I'm not sure
>>> that there's a benefit that makes it worth making the
>>> "use the one and only AS this CPU will ever have" more awkward.
>>
>> I agree.
>>
>> Moreover, '0' as a default is just as bad as cpu->as, because you're 
>> giving no thought to the selection.  Similarly using 
>> MEMATTRS_UNSPECIFIED.  When such things matter, we need the real 
>> attributes and/or as piped down from the proper memory reference.

W.r.t MEMATTRS_UNSPECIFIED, is it better to have a legacy API using
it discreetly under the hood, or have it explicit by using the
recommended API without changing the default values?

To kill a legacy API such replacement is worthwhile IMHO,
otherwise the code stays in a limbo, we have issues with
developpers using different APIs / styles, etc. Also maintainers
are Cc'ed during conversion series, so they can suggest better
replacement for defaults such MEMATTRS_UNSPECIFIED.

Regards,

Phil.

