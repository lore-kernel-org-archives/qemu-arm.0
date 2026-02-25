Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ABFEFFD45EF
	for <qemu-arm@archiver.kernel.org>; Wed, 25 Feb 2026 20:19:09 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vvLLI-0006mc-G1; Wed, 25 Feb 2026 15:18:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1vvLLG-0006lQ-I5
 for qemu-arm@nongnu.org; Wed, 25 Feb 2026 15:18:42 -0500
Received: from mail-pg1-x531.google.com ([2607:f8b0:4864:20::531])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1vvLLC-0000ZG-KB
 for qemu-arm@nongnu.org; Wed, 25 Feb 2026 15:18:41 -0500
Received: by mail-pg1-x531.google.com with SMTP id
 41be03b00d2f7-c6e248aa446so13598a12.1
 for <qemu-arm@nongnu.org>; Wed, 25 Feb 2026 12:18:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1772050716; x=1772655516; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
 :to:content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=ZNlQFwMqMuLFiV6Ec6fch2th8mXUyy2BNv0FX7a27Ys=;
 b=Ov6vdMOn5Gj0Y2ULijbHFHwE7VdMfUzXjnJmZHrKIVKh1wqTqsZXzT4scvvKzl1zm3
 JBQl5mfsX21uuICBxwWFlQbZVu251jY3BR3T9/QHy9mv/Qhowrz8nJhXbQ7P2dBnxbnN
 mCL4bqdGbO26X5sSMoBgIbXuSOYM11AVZHPoSuSsodoNcgZj/TZpjFbK/YWregSHY5nb
 bGiowpKjHOetbKeXK8Nbre6URmIVF+lea/dxWKogqQSM2hnMcwYKe76y7S5cuiPFa9Ye
 z1Tbcqj3OFzmzpxy4jTiTvYnTOlqlYONr8nyYAqcpyrvaw9KD6/u8or+da1N5tSJaEHY
 ATEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772050716; x=1772655516;
 h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
 :to:content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ZNlQFwMqMuLFiV6Ec6fch2th8mXUyy2BNv0FX7a27Ys=;
 b=G100QskbtDxwN0bmxXTl7XTr8vguO33SfizWVz7yet2VacdHgjQ9ejIPAncjudqegY
 3ueGcF+AHwv7Z7SJuif/Cg/7yG/pSBRrpmf5dY0QbeYSPA+Br1VM5omphH0bKaWLEZmJ
 nxowwSyNpCSYAaRMIYhKQ0SPZtGzzQJlSX00n/evUYdm6VWudQTc1sNqr4uVqrag+45r
 5/EjKCUvqRTImrIHAdWjdH2WPD84lMuGmLhKOKGb1DhMZmTOlyu8zuwb/Kf4HKGr7mXc
 74H26iiE8G3X5rjr7W7CeINEj63pvKDfSbxGPswvl7l5nslLiOpHoTn3P+Atr4HVHxUt
 y8RA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWaNwQb/Cf4ZMVIH4pAQgLq7hTpMcVwx87HtqwYhoKhGmreaByhRqG63pk7EE1Lv0ss32eG0hH9yQ==@nongnu.org
X-Gm-Message-State: AOJu0YyAJNDo34DI0N7ITZXPP9T++EFcAN4uk61qRvXJVbuF8tljCe3T
 JSgHYoMfFYZkbmq+mFrBRe5/IyV/h+ATaSmMLgfNLw6+Jp3ojCRx5bxspzRD2dPBZ1Y=
X-Gm-Gg: ATEYQzwYHcAMAuO97cq7TsyfFlmWw2AYBMaqiu8EDvq/iSThafv/68jwGwIjwCIu4J7
 hd1MMYvX5rIPHRJGDbLQ9yvkTKLKXSDLsMhLevyJjZ6dmqpUjqkgsOIiMBUtz4oBga9vfZbOM2F
 dcrn5kctwK+NmHIEdk0N0k2sLjSwG10j50l1zNot7ZIPp/G3jO8LqkHCwJI1lLNt41mlkBma2hR
 mOy4tzszTreP8AQgHS7+f3e53EPYWSjfetZaaEv843rjGkOC4qNPjttmKLGt++Zb694fP+oj8hX
 I8jtQlhF3nr6yDAVhlOtknPW+iPRFi7P4iNdWCyEE8rHE95yFPeKG798rRCnsHSZuMTzyPXzV5L
 1J0XmM1sUkkvofbJwP5z4k7qSQMuBnron+zagL8NNDwwy88vxr/1gHROsUok22MYY3Xle0HNwJ7
 uRJjpdGR2NBauGr8QEFArh26golVWeKldcWFbTwVxYp1sfh01GNDnP4hc10ME+BvXIZ8yYODQUS
 vjIsJE=
X-Received: by 2002:a17:90b:4b11:b0:356:24c8:229d with SMTP id
 98e67ed59e1d1-358ae8a48b4mr13746414a91.21.1772050715977; 
 Wed, 25 Feb 2026 12:18:35 -0800 (PST)
Received: from [192.168.1.87] (216-71-219-44.dyn.novuscom.net. [216.71.219.44])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-359134938ccsm1121419a91.13.2026.02.25.12.18.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 25 Feb 2026 12:18:35 -0800 (PST)
Message-ID: <01a2c1ad-1240-42b9-b94a-7b8cf1ab864b@linaro.org>
Date: Wed, 25 Feb 2026 12:18:34 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC v4 01/31] hw/arm/smmuv3-common: Fix incorrect reserved mask
 for SMMU CR0 register
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
 <20260221100250.2976287-2-tangtao1634@phytium.com.cn>
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
Autocrypt: addr=pierrick.bouvier@linaro.org; keydata=
 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
 ZtfdHNZotF092MIH0IQC3poExQpV/WBYFAI=
In-Reply-To: <20260221100250.2976287-2-tangtao1634@phytium.com.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::531;
 envelope-from=pierrick.bouvier@linaro.org; helo=mail-pg1-x531.google.com
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

On 2/21/26 2:02 AM, Tao Tang wrote:
> The current definition of the SMMU_CR0_RESERVED mask is incorrect.
> It mistakenly treats bit 10 (DPT_WALK_EN) as a reserved bit while
> treating bit 9 (RES0) as an implemented bit.
> 
> According to the SMMU architecture specification, the layout for CR0 is:
> | 31:11| RES0           |
> | 10   | DPT_WALK_EN    |
> | 9    | RES0           |
> | 8:6  | VMW            |
> | 5    | RES0           |
> | 4    | ATSCHK         |
> | 3    | CMDQEN         |
> | 2    | EVENTQEN       |
> | 1    | PRIQEN         |
> | 0    | SMMUEN         |
> 
> Signed-off-by: Tao Tang <tangtao1634@phytium.com.cn>
> Reviewed-by: Eric Auger <eric.auger@redhat.com>
> Link: https://lists.gnu.org/archive/html/qemu-arm/2025-06/msg00088.html
> ---
>   include/hw/arm/smmuv3-common.h | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 

Reviewed-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>

