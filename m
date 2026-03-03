Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 861A4E67A91
	for <qemu-arm@archiver.kernel.org>; Tue,  3 Mar 2026 07:47:13 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vxKTD-0007YE-4I; Tue, 03 Mar 2026 02:47:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1vxKT6-0007Xb-KT
 for qemu-arm@nongnu.org; Tue, 03 Mar 2026 02:47:02 -0500
Received: from mail-pg1-x535.google.com ([2607:f8b0:4864:20::535])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1vxKT4-0005Cg-5S
 for qemu-arm@nongnu.org; Tue, 03 Mar 2026 02:47:00 -0500
Received: by mail-pg1-x535.google.com with SMTP id
 41be03b00d2f7-bde0f62464cso1837757a12.2
 for <qemu-arm@nongnu.org>; Mon, 02 Mar 2026 23:46:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1772524014; x=1773128814; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=p0RAkUlKjRM7IlklcJRykA6UQw5MZ8S7gufnGWL/DFs=;
 b=hWCDmTyijJekK/oiXGQ0YtUHzY8BeJFOjMuoLySker80osdz7YIc85dm53spTvtW7s
 Lsr8KhBuIXMiY7wP74GfmUgfDEvOFQx90fgDkPVLMgpkdLUvO8df3rFbwZyrkiAY2dlT
 GDjoHTKZRrHnVjAue872Fv3libNuSEfBiOzTOshALgtQKEoS7PSS0jbwRYY7m4PAF+R7
 G7jBdTyJUJWPsqdQMxQOmR+lu+s1Eit4GhuHDbvyctD2h7oszCCGph6XX5eUs4ogpx1E
 QAb2G9kMllYtBYAbkJy2B4YrzT2/WN1BpFnoD7qyzolB1UtaPjWJWpnoIQaBidVknUi1
 aeCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772524014; x=1773128814;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=p0RAkUlKjRM7IlklcJRykA6UQw5MZ8S7gufnGWL/DFs=;
 b=nCTrBrl1cXlRHV4rK2GHcsYm8I+7jIdDQy+FIOknya0s4DQp0boPb9B0eevKFECvSl
 MVThCzaOFJwZjw7CdTIKNgZnVc8mz0RvMZxlRWC6/jzEn/1MzvY4eqzS5hG8v86Dl9Fa
 K/dJPWMzTPFjGepV4Mc1rUjV63zEdCJrEPmBmi/1oWJerz6NwwHCeyvw2Ajh5geIDoky
 tGW0jtFcEzmsQJDcVYxALBiavzP81RwewiE5HJRCaSucZWByzDlowJGh5M4vmQ85+oHa
 4Bcl2bVxmYeZCGyrfvQ23rsC749qLDesvHTWZKYOb7mdUVRq3TE1zOzy5FrMNr2/B19u
 OcAw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVwNwDd9w2VBAH5aIauEuXeBieD1p4q9SHF5Yl6CCvVXvndo/gRQbKTVB0pmI6a7OVpItn3I8BVgQ==@nongnu.org
X-Gm-Message-State: AOJu0YxDwS6Js15JxI5p26Gvz0syC4Ff2+LhUSOiPS/9kWN4GWkb8Vai
 rvolI9/8flXOWxQqMziNY/yRpCNIft2ZWkfA23ntfM1ZL4EzEpUNTbgezrGFysGVncc=
X-Gm-Gg: ATEYQzy5zBBin7wwdaF6HT9RAwLMhe5cGacd8rQhLulUfTEjmzvMMrZY2x3o6AffrOE
 Ny8QKSO8WStNisGoUv8V1uFNl8a1PE8e4Nxdc9mBNiPpkHH2V5GtiETO0wZCR1v1YykejDHg1Q1
 Py3uQupmO66tHAO7tztC/kSHYFBuLGkkXZj1QkMvPGAbUd7bGw+Wd800qDHiVDrNTsSCPlplh+V
 1zDUndRYBeJhaRax5ADNskNd7oifziRyreIAT3JIMjSYFbpDqLrmGta/dx2d50p3karpmnxAc6x
 K2CeAKswX+W8+ykKM4D7oqoqLSgfQq05UtLC70usLz8cLyH5J0GJW8zDGS3CRTi7e2uQ9XcP2k0
 JdW0fRZmvz3dgHFK78gkTG/dj3r2rKg99LilUCzeGjuF5+qFLpmwJoN/UiPQKdvc1PZ1Xh9Qu3F
 e6Olgz7l+G8osFT3oZYDDXTruBq0wVPWjVqXdsZVX1+g==
X-Received: by 2002:a17:903:1786:b0:2ad:edc4:1796 with SMTP id
 d9443c01a7336-2ae2e4bc5b6mr145483275ad.39.1772524014122; 
 Mon, 02 Mar 2026 23:46:54 -0800 (PST)
Received: from [192.168.10.140] ([180.233.125.15])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2ae4d83c1a0sm59797545ad.1.2026.03.02.23.46.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 02 Mar 2026 23:46:53 -0800 (PST)
Message-ID: <d5dfad54-ef20-444d-821b-724540d052c4@linaro.org>
Date: Tue, 3 Mar 2026 18:46:47 +1100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 0/2] arm/hvf: Add SME2 support
To: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>, qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Phil_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Alexander Graf <agraf@csgraf.de>, Mads Ynddal <mads@ynddal.dk>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 Mohamed Mediouni <mohamed@unpredictable.fr>
References: <20260303-sme2-hvf-v6-0-b473702d8287@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Content-Language: en-US
In-Reply-To: <20260303-sme2-hvf-v6-0-b473702d8287@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::535;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x535.google.com
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

On 3/3/26 18:42, Manos Pitsidianakis wrote:
> Manos Pitsidianakis (2):
>        hvf/arm: handle FEAT_SME2 migration
>        hvf/arm: expose FEAT_SME2 to guest if available
> 
>   target/arm/hvf/hvf.c           | 312 +++++++++++++++++++++++++++++++++++++++--
>   target/arm/hvf/hvf_sme_stubs.h | 158 +++++++++++++++++++++
>   target/arm/hvf/sysreg.c.inc    |   8 ++
>   target/arm/hvf_arm.h           |  41 ++++++
>   target/arm/machine.c           |   2 +-
>   5 files changed, 505 insertions(+), 16 deletions(-)
> ---

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

