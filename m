Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D4D0C8303C
	for <qemu-arm@archiver.kernel.org>; Tue,  8 Jul 2025 20:50:53 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uZFFF-0002Dy-2s; Tue, 08 Jul 2025 16:48:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1uZE4F-0007ri-VQ
 for qemu-arm@nongnu.org; Tue, 08 Jul 2025 15:33:39 -0400
Received: from mail-oo1-xc2b.google.com ([2607:f8b0:4864:20::c2b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1uZE43-0003r2-OD
 for qemu-arm@nongnu.org; Tue, 08 Jul 2025 15:33:23 -0400
Received: by mail-oo1-xc2b.google.com with SMTP id
 006d021491bc7-6119b103132so152373eaf.1
 for <qemu-arm@nongnu.org>; Tue, 08 Jul 2025 12:33:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1752003187; x=1752607987; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=NHI/pe/hYxCWaN7ZHnWIgGI8hQCDTXyWj/FvjsArrTs=;
 b=Wm/g4Hvl226UcDNQy4TSxg8uJwOwGJB1zV0OENrsXSt9xmD1RQY98F8uSfpDelyfrT
 Ndmyb/U/JpybOy8A/dy4PAc1i2ipjDvnfbNetUUHv2ElzHxTb4Py259Ui+4P9uDfRXcI
 Nn5WVRwQ0wrIJT1XnB7+Y94uEAf0+asecmGC6HSWXrkNeJBIiezKUUc8eV2wpiqxIudI
 F2Ue3nMrhaGGKweJMHhNsI5fu7Lf12d1zmhJ0fNKL7a269MWdkTkXuoUiD5+RuRhBNi0
 e+HPJAiZJYPS/SkhlaG8F1/QZ8cgGtHcVdbGEBdb+Uce0/iBC2XWYb7FJMOIfPqjxRFO
 IDtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752003187; x=1752607987;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=NHI/pe/hYxCWaN7ZHnWIgGI8hQCDTXyWj/FvjsArrTs=;
 b=BGWbkTy5HK972CgdtV5tOuzzzjxexR5WtyBgI8PJ9QmdmL6sjv/zX6xCDirn0QnyXZ
 8YzaIBGhjFG8/WFXTBElG4k28oq/DqultOVY7DuwuUq+oz2XvsMY8T56JORyuPjz+5Fl
 bpEbfC/3h+1DxbI0dAYsNFxmJgK6ATgGSOx52r70SqYilzcEr0hetOvd6GCp3Rffc40d
 xxe2Iz9MZv87vMz9Qgo1XZe5BagcBykzOg2uUjUFGyf24xJq1oVTs5X6dF2i/Iq1WThL
 PWL+7svGYUUSbprJxHKpWymuZOygzcAtAgwQGD+/YH6nvuJZQZcl542gvPegTKb13Tuo
 pzkA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVa/SSqjt4FfMXHmUaknT6INn4TcKKpOW+BHOQ4LaHRUYnauoV9SJ4vBgLg+JLzUwi3m11FHsH8PA==@nongnu.org
X-Gm-Message-State: AOJu0YwPr+SR86FtSA/5bHkxYe/0jiAlM8UoNmo54Pe2hzBqCH6yF4am
 yhe/BVkbyYSR1uxOmUnvGQ0XIJ59HqAXogPUGrYEAYqqgzw8P+5CAZrxeoseTwvLDqjrbZCgzKf
 9l9A+
X-Gm-Gg: ASbGncu+EPpQJKLdVY+sIATRwkbOgwkJiHvcPMKYn+Mx+e3p/gWl69KIOj/+GHQ/jQI
 c/VB9MVfoVwkIZLnM8+RKfaCO8MbJ0Q6Sy4QXmlRPSdauee6ZKDCRmxzuSFEIePBNFSEeLBZ0H8
 SU0pOlYlaarFOB+hMDdfLdi0XN+BzzkuyA69WoYYpJFllrsKlyYyp2qevqj4ATkLtrLjR9Osua3
 aKiR4Te4RQjh1VVAj6a/ti7D+SloTSsbpCXPpjuihLRlt8tuVwCqUZUPqCsOArPe6hgRVfn/tbL
 m1ywR/WO66KR9uqmvK/lCMnRHw2P8RGx8JGp88G5ylO9SFJckg+6sUSmwBpmsA4PHMZPwmabYiB
 Tx70F1RebSA==
X-Google-Smtp-Source: AGHT+IHVgoyd0HH+KmsdHkQpMJxYW0hptSnGBPEC8SUBQ0yvzQICg0NnhyPOCx14mOIWwKBsXyhJFQ==
X-Received: by 2002:a05:6a00:1ad0:b0:744:a240:fb1b with SMTP id
 d2e1a72fcca58-74d2678c6c4mr5240287b3a.5.1751996182113; 
 Tue, 08 Jul 2025 10:36:22 -0700 (PDT)
Received: from [192.168.1.87] ([38.41.223.211])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-74ce42cefccsm12116590b3a.156.2025.07.08.10.36.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Jul 2025 10:36:21 -0700 (PDT)
Message-ID: <e319122d-f7f6-4b37-930e-87d2750557f3@linaro.org>
Date: Tue, 8 Jul 2025 10:36:20 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH-for-10.1? v7 8/8] hw/virtio: Build various files once
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>,
 =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>,
 qemu-arm@nongnu.org, qemu-s390x@nongnu.org,
 "Michael S. Tsirkin" <mst@redhat.com>, qemu-riscv@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>, qemu-block@nongnu.org,
 qemu-ppc@nongnu.org, Kevin Wolf <kwolf@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>
References: <20250708171949.62500-1-philmd@linaro.org>
 <20250708171949.62500-9-philmd@linaro.org>
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
In-Reply-To: <20250708171949.62500-9-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::c2b;
 envelope-from=pierrick.bouvier@linaro.org; helo=mail-oo1-xc2b.google.com
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

On 7/8/25 10:19 AM, Philippe Mathieu-Daudé wrote:
> Now that various VirtIO files don't use target specific
> API anymore, we can move them to the system_ss[] source
> set to build them once.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> Reviewed-by: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
> ---
> MST prefers to defer this one to 10.2.
> 
>   hw/virtio/virtio-config-io.c |  1 -
>   hw/block/meson.build         |  6 ++++--
>   hw/virtio/meson.build        | 20 +++++++++++---------
>   3 files changed, 15 insertions(+), 12 deletions(-)

Good job!
Reviewed-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>


