Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70FB3E9273E
	for <qemu-arm@archiver.kernel.org>; Mon, 29 Dec 2025 17:53:25 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vaHQW-0004r3-Mo; Mon, 29 Dec 2025 12:53:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1vaHQS-0004kH-FK
 for qemu-arm@nongnu.org; Mon, 29 Dec 2025 12:53:03 -0500
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1vaHQR-0003xN-15
 for qemu-arm@nongnu.org; Mon, 29 Dec 2025 12:53:00 -0500
Received: by mail-pl1-x636.google.com with SMTP id
 d9443c01a7336-2a0a95200e8so80543515ad.0
 for <qemu-arm@nongnu.org>; Mon, 29 Dec 2025 09:52:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1767030777; x=1767635577; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=JXVKq/HEthezyNMxbCgoWKubtztbF9R/uCreixEgfcU=;
 b=P4+8qSpM1BX4q/gpPXe+Kh5KKfV2D4CR+qsnhPjoh21qqkjUWxxQ2Jrej/pl1Tf7KN
 4BffeiGfTe+UT63itvZewrr/XrrVns5QASpYh3u96aMl8cHzoPK4zPlvrF0ULLNq3bV8
 xG4Gnl1QXnSY/bfTR8eglGWuU8We/DdNtW9zW3fUjaluB7i1l/JBL7DE3HMJlzTN66Iq
 TJftjCk44AeJfR+QH4ywuFJ3bL0vYaj4sl/K540OTi06JCt34sGLVgaatre6b7K1uYtT
 54T28OksmeStzEptfqk5dl0KfY4qIIBzUI3/kPXRBwPSaaEixqn7zDMwqgve+1QwYVCf
 ehYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767030777; x=1767635577;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=JXVKq/HEthezyNMxbCgoWKubtztbF9R/uCreixEgfcU=;
 b=QDv8eJ585N/r3I+bBx9gs9bxhCHKJcCAGFT/gRsYo3wSejbAKDN4sjVeYeeCkx0LHW
 c+Q4VktybwMDQNJDDsC4ljDPj6oB6zPU14MVQtPsy35SQ/4a8VLdWavOGsuOuMzyneXQ
 sxMIUqus7c72txteimS9IG+WsmcpSPcpvMFoLmP0TDH9B3EdsLlgFhGzWlLkGBM6DEgb
 7AvZBx4biDfBDK/hrLMKgRRZE3Kr0qNFM4CL193JWZqEnYaAxK4k/DeJhOGQb8uR6Fkz
 dutMtPIXQ3WyomM/PB1WgKXhh8tSXjDz8cE5HNHh7g9Oz/+pQhPnejSHCJ4IAhEUqD7V
 1EVw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVw03t9scOhlGd7SOINX8gjXCcsGeHyV2JBgRhrp/A2ID6abi2sz/98ghPRDM4i9gq00Qf3q4vPSQ==@nongnu.org
X-Gm-Message-State: AOJu0YzlTiYi1rVzcZKMZ4IMTIMSC8d2RrwzBTfFSld3VFiBORUIt21R
 rnwzFaOwOO+B97D5tFGoxBCIHMLsxJ+qOvEYZfrdmo14Pd3+LJ0+YonnRzrtPTIKmV8=
X-Gm-Gg: AY/fxX4yPzK/ip7bD/RDaVM6lpF/H+sN/QUgMgdD721E0FkQGOEOn6i4FbWJTHwMAh/
 QM+c21Z8TP7T5Rp8lrlVDaB0O8mn5ndNnvNAyoa0mXlBmMuXBpEzf4sYO30hFoluuvFfLNo643S
 MgUg85Ncx6UlcvPzHdyXwwqb/I3mzE7MG8iNFsThK5A2kwHe4KtGDZe/z0yi+pT0MUH8ZP6Dgcx
 XG1pzxQx/eTTV7JMUc2WDOC07HHmFFilzbuCRpN4R/2ccxKSju4OHyrU99uXUAEeb2QmLqsvgMq
 sV2iUUs96JCrICQGAAStLLZVso74Is9XywLKYDreXDtmewUpAuG9sWVOZcwoBtNG3zf3zY4XYtC
 r/vRxeA1oWLlvvlIOEkLcSr7qU3vDZ/GcDiNZ8ZkcTnNYmUaBoY7QKYLxwrOodlTs7o6D0RM2L2
 lY0SP+gy2Tmhdx70sViE1UwGe1i1+majenv0uxa+ABD7EK6PIpv0tp3r9F
X-Google-Smtp-Source: AGHT+IE8OINlogN+WfsdC+idVXsEeRftu34+jwS7SuX9GeIq8z0GhKxIEvVbbEonrNhYvUm6LW37KQ==
X-Received: by 2002:a17:902:f70f:b0:29e:9387:f2b9 with SMTP id
 d9443c01a7336-2a2f232bab4mr277428275ad.24.1767030777287; 
 Mon, 29 Dec 2025 09:52:57 -0800 (PST)
Received: from [192.168.1.87] (216-71-219-44.dyn.novuscom.net. [216.71.219.44])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2a322d76a19sm229092615ad.101.2025.12.29.09.52.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 29 Dec 2025 09:52:56 -0800 (PST)
Message-ID: <bf7b5707-2b4d-4153-9aa9-155b677b6c44@linaro.org>
Date: Mon, 29 Dec 2025 09:52:56 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v12 07/28] hw: arm: virt: rework MSI-X configuration
Content-Language: en-US
To: Mohamed Mediouni <mohamed@unpredictable.fr>, qemu-devel@nongnu.org
Cc: Alexander Graf <agraf@csgraf.de>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Shannon Zhao <shannon.zhaosl@gmail.com>,
 Eduardo Habkost <eduardo@habkost.net>,
 Phil Dennis-Jordan <phil@philjordan.eu>, Zhao Liu <zhao1.liu@intel.com>,
 =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 kvm@vger.kernel.org, Roman Bolshakov <rbolshakov@ddn.com>,
 Pedro Barbuda <pbarbuda@microsoft.com>, qemu-arm@nongnu.org,
 Akihiko Odaki <odaki@rsg.ci.i.u-tokyo.ac.jp>,
 Yanan Wang <wangyanan55@huawei.com>, Peter Xu <peterx@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>, Peter Maydell
 <peter.maydell@linaro.org>, =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?=
 <philmd@linaro.org>, Ani Sinha <anisinha@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Mads Ynddal <mads@ynddal.dk>,
 Cameron Esfahani <dirty@apple.com>
References: <20251228235422.30383-1-mohamed@unpredictable.fr>
 <20251228235422.30383-8-mohamed@unpredictable.fr>
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
In-Reply-To: <20251228235422.30383-8-mohamed@unpredictable.fr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::636;
 envelope-from=pierrick.bouvier@linaro.org; helo=mail-pl1-x636.google.com
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

On 12/28/25 3:54 PM, Mohamed Mediouni wrote:
> Introduce a -M msi= argument to be able to control MSI-X support independently
> from ITS, as part of supporting GICv3 + GICv2m platforms.
> 
> Remove vms->its as it's no longer needed after that change.
> 
> Signed-off-by: Mohamed Mediouni <mohamed@unpredictable.fr>
> ---
>   hw/arm/virt-acpi-build.c |   3 +-
>   hw/arm/virt.c            | 112 +++++++++++++++++++++++++++++++--------
>   include/hw/arm/virt.h    |   4 +-
>   3 files changed, 95 insertions(+), 24 deletions(-)
Reviewed-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>


