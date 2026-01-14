Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76D92D3CC88
	for <qemu-arm@archiver.kernel.org>; Wed, 14 Jan 2026 23:40:07 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vgASk-0008Ga-Mv; Wed, 14 Jan 2026 18:39:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1vgASj-0008Fa-O2
 for qemu-arm@nongnu.org; Wed, 14 Jan 2026 18:39:41 -0500
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1vgASi-0005UY-3L
 for qemu-arm@nongnu.org; Wed, 14 Jan 2026 18:39:41 -0500
Received: by mail-pl1-x633.google.com with SMTP id
 d9443c01a7336-2a110548cdeso2600885ad.0
 for <qemu-arm@nongnu.org>; Wed, 14 Jan 2026 15:39:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1768433978; x=1769038778; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=R2FqAeIgTLxlJAHEqyaSx4oxF5sBS9zn1KQsbpWEH/A=;
 b=wMTK8phOvD0e1W71R3b2lE5alPNYF0btGxGaIMf5DEi2Qle+EWGfgxaruxlJELaL8R
 V0pmXNne86Uz1bb+LC2WJViNafeCHSQcMV1Hm3Ga+VbFvjdOjvwpxR1jUJEHFpsuq40G
 Yut7Om3V2faoJVonOsPJ0wgOjvCVxhTF1QkNVkh5wc9EuCbTxYnj31uQsvDiC5q/q4+z
 FHhVkC6iiHlj2F/1w+jCM1VfRQ/0PgGTeeYvbJInUom8b088Jk1TTXfD1+L7cSeB/wd1
 CqKklZjh9yScuXi9ZPDRmDgu4138/vg7MpBx1kiTsZ33wO83oHrnQ/rSLcqT7/Gu7dy/
 mf6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768433978; x=1769038778;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=R2FqAeIgTLxlJAHEqyaSx4oxF5sBS9zn1KQsbpWEH/A=;
 b=mmZVnoP3w+l3HEAJyGTlGpX3WJHD6gnL/xg+Fq71oJxE3SCMgM9QAKHEd2yCoCQeqa
 9Mlp8pqrqcmSqpZ+7TJ9lRdi98xVeDshEmKm6iqzWGwgkUYt7BezJcYvSOTvInLGE53i
 8FLHUrQbu85RhL9gjP4vJWBwTDLSoRjxvJx3DYH4bT/tt5L1T+hFWfH1V+s6AyBPOIsx
 RIw1x8FhOky0d/E2+0yLBY7rXqoU7Anj+V/hA3i2HCDh4HBPMxciVDBEIpW2yGjFv3Sa
 755dnseQivmzN9P97gbjaSFCIQNugO4p3X9ssS/GxOwlsjzJmo6zqhPhMckV1yEIamRk
 mVuQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVxsckDp3A6BrEjHrrqqEGTOq0uX8VXUfDOc4DGEx5AF1DLBiXvPHwUvKJkA/jkDXzO/E1uQ+6yeA==@nongnu.org
X-Gm-Message-State: AOJu0YzC18L5tz9SczDausHMRarmRGBcdCxmfS89a6cA8eqsfItd3zkb
 md7dYK1+Qzawr7y2LfvBNAH8PqiWwcnsiyCusi10Q8uZf3YQ3EioE0MTg/ZXInU24a8=
X-Gm-Gg: AY/fxX4gt58gyKy4Til5BpO7qE77DM+MXgkADoxOjvv9iwippUysdR907lxVTY/N+XY
 3ELX/aj/agQw/ZdLxI9iCMzS4trIlkX2Df9RUJx50nWff2tbynMhFh9zPOw+BuLBYSSCa8GCSw5
 guzao4JAPpqkmNEWRPTSbcAGPjka7VQVjgLHZNzUiteEA9POJydL91JmvtvcI4Y/dyajlsOiQ71
 T+GIXM/fFrWRhE0mpShhSQbSFLdJ0qAGurKacY+lPa3NLXYp8SVHhykwJgcE1pl3BdYG8fdX2/F
 xirvEmXzYVwQ6XvXOjn4RGUKB4FFMp5pT49rleEeEQCdYVB2KcE2lE7XnZv6dNdOG6tpIJBYdNB
 5ljZ8F9WzxUKxA/I3Gt9yR7Bb5oT/SRPkmpAcOR3yUEJDOHeE7QJyQ6a+jOy30ugXqDXzOtFjt7
 guJcAbt/VqufQoFvxuPDx16mI4YakCJIud9qEZRi/8lq00QsOg+sGiGy7h
X-Received: by 2002:a17:902:f651:b0:295:592e:7633 with SMTP id
 d9443c01a7336-2a599e2b429mr45782425ad.29.1768433978102; 
 Wed, 14 Jan 2026 15:39:38 -0800 (PST)
Received: from [192.168.1.87] (216-71-219-44.dyn.novuscom.net. [216.71.219.44])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2a3e3c3a2eesm71298595ad.6.2026.01.14.15.39.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 14 Jan 2026 15:39:37 -0800 (PST)
Message-ID: <9fba7ded-d31d-4789-b83d-efcc96f5448e@linaro.org>
Date: Wed, 14 Jan 2026 15:39:36 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC v8 0/7] hw/misc: Introduce a generalized IOMMU test framework
Content-Language: en-US
To: Tao Tang <tangtao1634@phytium.com.cn>, Paolo Bonzini
 <pbonzini@redhat.com>, Fabiano Rosas <farosas@suse.de>,
 Laurent Vivier <lvivier@redhat.com>, Eric Auger <eric.auger@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 Chen Baozi <chenbaozi@phytium.com.cn>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Jean-Philippe Brucker <jean-philippe@linaro.org>,
 Mostafa Saleh <smostafa@google.com>,
 CLEMENT MATHIEU--DRIF <clement.mathieu--drif@eviden.com>
References: <20251224034647.2596434-1-tangtao1634@phytium.com.cn>
 <6d50c3fe-e235-48e8-b461-fe0689f12070@phytium.com.cn>
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
In-Reply-To: <6d50c3fe-e235-48e8-b461-fe0689f12070@phytium.com.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::633;
 envelope-from=pierrick.bouvier@linaro.org; helo=mail-pl1-x633.google.com
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

On 1/14/26 5:30 AM, Tao Tang wrote:
> 
> A gentle ping on this series. Any further suggestions would be greatly
> appreciated.
> 
> 
> Link:
> 
> https://lore.kernel.org/qemu-devel/20251224034647.2596434-1-tangtao1634@phytium.com.cn/
> 
> 
> Best regards,
> 
> Tao
> 
This version is in good shape and is ready to be merged.
Eric, do you feel like merging it, or would you prefer someone else to 
pick it up?

Regards,
Pierrick

