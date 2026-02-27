Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 514E0104891E
	for <qemu-arm@archiver.kernel.org>; Fri, 27 Feb 2026 21:55:12 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vw5n8-000610-4X; Fri, 27 Feb 2026 16:54:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1vw5n6-0005zz-EO
 for qemu-arm@nongnu.org; Fri, 27 Feb 2026 16:54:32 -0500
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1vw5n4-0003q4-97
 for qemu-arm@nongnu.org; Fri, 27 Feb 2026 16:54:32 -0500
Received: by mail-pl1-x629.google.com with SMTP id
 d9443c01a7336-2a8fba3f769so12452585ad.2
 for <qemu-arm@nongnu.org>; Fri, 27 Feb 2026 13:54:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1772229269; x=1772834069; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
 :to:content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=N1QCNbUZCXncakW2sKpOA1tH8cYQK2JAhTTRtB4bwyE=;
 b=n/29N7pASNK+QCULEXO6KBLeScHRn4JGwso1iJyQOITpkzKiSXBj99755Hd2PjQRXN
 prx/wjFXfZ7880cUMTQR59GMQZb72c/f+WvsPTp2zXvVcX51qklpQLVyYW3/T6w9PXiC
 mY3c+WL1SljMIVjLqm3GQVKEDJaEIvNVXjTtjy4f33m3ydwaIbFQ97AGVPAPIKP5CwGm
 7VKXO4C4OogxZUr5EJ3q8ri7l0RBnZ4vwHRvTXDh06sM4XKuJ451VmD1XYqxWnncdkr0
 W2bZqUHF//MrShC6/9iVjJd0pRn5TPnBjrBqGKocH1719agjyOMqGWJGjpAvYtyyWoZ+
 Wbaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772229269; x=1772834069;
 h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
 :to:content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=N1QCNbUZCXncakW2sKpOA1tH8cYQK2JAhTTRtB4bwyE=;
 b=pATeQAg1N57G+USwXZ/JtsVLaqn+xi75m6A6rKZPT2KsCpD3dqsOZQqFQ99ma/8aja
 Lb35P4AKCZrtdGJN5M228L90zNkg1dL10+u65IQmqF05GSaqpdjXodiV4lRWgiALdN1x
 BT+dNJ2SFTkRZB4nsKGA37f3lnSZOJ3L+SfCBN1SjrGjTLp+IjT8Dpr8Kf/2eK3Imxx3
 B0523aV8ewDth0ofqxK9OUegi6pCpRun2CTGfU9k/bdBTOgylZRYiRLPKPZld0hmZBgU
 b4DSCpQRcxtDmC54Y8sv40NPzTQsHu1IzdtzoC4MmoHO73t1t8X7QK5dfvP+B0sKidoj
 AK8Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCVq6EzR2OSUNlp+YtbXDi1+ApFrPKGWF1oMRkseKcqq53bKm9rIdeyEr8E59iK5ywmLA6A5KUTjxg==@nongnu.org
X-Gm-Message-State: AOJu0Yy3A82GwZxkDPTKNH3HFE4anXb9ffCjI/WHypyerqFyAH7Vzuoz
 YyHfQ+ZuwxB1zC9eclXmKpil+Eidb5C1mHWVzhrMmxHnrpC6V2uETKck3JAYy8WThZo=
X-Gm-Gg: ATEYQzzvmkd4FHBLPqWoIKr/s1TWaU5R1xlWjNy/u5K+J9s817KI7EQRsiROE9Ov0I9
 G+crIwToju7EokN5p1SxTpgS7ZKWQCu74hihwAYHylIVooL3VjjSl6vuwoGeIZGL5Y3SZvjVh+q
 Wp6Cf8ST7wuwJYeAVacwswJq0/AOocEPCQvrqosBQxeLP7srhjTDjhjW9NjbkUp03CO2ygoLf5R
 Hr9gJOw/uJcZO/YAW3Z6H61PUNdCgFDuya4khfxo2GnvplYRwEuPmZ1Prnr/P4as5NncjjiWfSs
 OpetR6p29mi1gLdx0+/fGZVIAJruYa+gUgXLYWPy4NosZ6IVrDaVRta4p0Y4bqZZcnpv9FU/LHu
 e7HKdHVhtEMpDNc+mVhc+CrZhjlYSe/HjpyjwACeqZODTfEg18zx4gceJC0dofrsgmx+L7SglQZ
 GTUw+X84WSyBDVKGtgi1chcsFTZthpEzVUnoaJ0ez6VeLXTivcoQHaiuRiiecrOdzGOcV2
X-Received: by 2002:a17:902:dacb:b0:2a7:919c:34c6 with SMTP id
 d9443c01a7336-2ae2e4cd74bmr41611535ad.38.1772229268688; 
 Fri, 27 Feb 2026 13:54:28 -0800 (PST)
Received: from [192.168.1.87] (216-71-219-44.dyn.novuscom.net. [216.71.219.44])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2adfb5b22fesm91486445ad.2.2026.02.27.13.54.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 27 Feb 2026 13:54:28 -0800 (PST)
Message-ID: <efbc1189-408d-4010-8a00-6ddc8aa0b45f@linaro.org>
Date: Fri, 27 Feb 2026 13:54:27 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC v4 30/31] hw/arm/smmuv3: Add secure bank migration and
 secure-impl property
Content-Language: en-US
To: Tao Tang <tangtao1634@phytium.com.cn>, Eric Auger
 <eric.auger@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 Chen Baozi <chenbaozi@phytium.com.cn>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Mostafa Saleh <smostafa@google.com>, Chao Liu <chao.liu.zevorn@gmail.com>
References: <20260221100250.2976287-1-tangtao1634@phytium.com.cn>
 <20260221101926.2997959-1-tangtao1634@phytium.com.cn>
 <831335ed-7463-4020-847a-b65518875376@linaro.org>
 <b5da3509-fff4-4b38-8bcc-a54ad21e7eb0@phytium.com.cn>
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
Autocrypt: addr=pierrick.bouvier@linaro.org; keydata=
 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
 ZtfdHNZotF092MIH0IQC3poExQpV/WBYFAI=
In-Reply-To: <b5da3509-fff4-4b38-8bcc-a54ad21e7eb0@phytium.com.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::629;
 envelope-from=pierrick.bouvier@linaro.org; helo=mail-pl1-x629.google.com
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

On 2/27/26 8:16 AM, Tao Tang wrote:
>> As mentioned before, should we enable it automatically in case
>> secure-memory address space is available at realize time?
> 
> 
> Let me take this opportunity to address the same concern you raised
> across patches #07, #17, and #30 on the secure-impl vs secure-memory topic.
> 
> 
> My initial intent was a demand-driven (lazy) validation model — i.e.
> only validate Secure capability when a device actually declares
> sec-sid=secure and we go through smmu_init_sdev() /
> smmuv3_validate_sec_sid(). That avoids forcing Secure-related
> configuration checks on machines that never exercise Secure DMA.
> 
> That said, I agree with your point that secure-impl=on without a
> corresponding secure-memory link is an unconditional misconfiguration
> and should fail fast at realize time. For v5 I’ll combine both approaches:
> 
> 1) Realize-time inference + fail-fast
> 
> - If a secure-memory address space is wired at realize time, the SMMU
> should “do the right thing out of the box” and enable Secure support
> automatically.
> 
> - If Secure support ends up enabled (either explicitly or via
> auto-inference) but secure-memory is missing, smmuv3_realize() will
> error out with a clear message.
> 
> Importantly, I’ll preserve the explicit user override you mentioned
> (-global arm-smmuv3.secure-impl=off).
> 

This is a good summary.
Let's see what other people think about it, and if they are ok with it.

> 
> 2) Make helpers assume the invariant
> 
> With the realize-time invariant in place, the Secure branch in
> smmu_get_address_space() will no longer “warn + return NULL”; it will
> become an assert (or equivalent hard failure) because the machine
> configuration is already validated.
>

Sounds good.

> 
> 3) Keep the device-level guard
> 
> I will keep smmuv3_validate_sec_sid() as a complementary per-device
> guard. This still matters when the user forces secure-impl=off: if a
> device declares sec-sid=secure, we can reject it immediately with a
> targeted error at device init/hotplug time, which is a different
> granularity than the SMMU-wide realize check.
> 
> 
> I’ll incorporate these changes in the next revision.
> 

Regards,
Pierrick

