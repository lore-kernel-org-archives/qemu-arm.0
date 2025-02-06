Received: by 2002:a17:505:32ab:b0:1be9:327d:8ee3 with SMTP id js11csp1827492njb;
        Thu, 6 Feb 2025 13:33:27 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCVOQCY3maFzxy0uqxu6PgsFMBB47ThPvUuZuX2Uw2z69DvvpP13a80F37RvevSe59K73GnSfN/xuT34Fg==@linaro.org
X-Google-Smtp-Source: AGHT+IFdRiHBlGB6k/tqoUdjroy/NEeHjHySsFA4FZjoTLDutZiRJ6cDJYA/1CiUseFrK438hYWb
X-Received: by 2002:a05:6214:248c:b0:6d8:accb:5a3d with SMTP id 6a1803df08f44-6e4456dd1f7mr10972066d6.34.1738877607615;
        Thu, 06 Feb 2025 13:33:27 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1738877607; cv=none;
        d=google.com; s=arc-20240605;
        b=XtgPnoJPP/2aTISON9LwZ37uUUNRInvOn9wEH12TR0GKbKhXEnmkSyCb7JjhClG9jz
         kK2/k3ig8KL9sdBDdsOsbi4quGEGs6w54t5vbKPCDeVm6KRwLh/71R4Z+JdYUnPP+fdv
         751P9dlsJLICYHxd3C1PAHL+JvHhiXYdui6Mln4Bl8KCYii+UqKjSVw3uIUqMtALROmR
         OehcfTmqO9FO8X2NaNtkw6us8eMs66Af82rGatR6Mx5sMJXbziiesWE8AGHS19X/KUcK
         tjVVTdg8n4BxrIl8THGMBjfw8Jpd6SSjRvblB3IdbdaTvvOFofmpKobhmoV2tRjZcGpO
         LOTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=mfvmlnluusUMUpKk6ZL+inlTMfV1gsd+jaZ0lcL/wLE=;
        fh=lG4uOo7HHznH7LnHMifFAOXqgoMih69KksUkvJaWgIA=;
        b=PfnIz9i6QWyggFONkq+rmDMbPDNI8AjwJo/jgJzpVA1XtkO2gC7ZAPUB/Ty6pDaCO7
         k0Bh5oLzNry/IMxQlA53L8uBsHEzBF5T45f2roKsMSGc5+AOZjTMYkKo88/eKr0UvtQc
         Vou0hzAhBcyqAod67yi0KojlGKPl06/O59yekNxddIoZsDzZ3GRc8n+vGgFKGI/dcm2I
         WUWWWVgzlkA5NHPM841wXem7P0i1YxxdhXIi/fBI1/LKwK6OGR7EdA1yFUdSOy/R7EIF
         I9RDswGbGxwcLQ3ZJT8DN/TLVcn6ZKIxycKwY1lMLbJnbR0swznkA1L6yuhDY36wXQiz
         0xzA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=fM7buvky;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6e43bac9e4esi18125926d6.265.2025.02.06.13.33.27
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 06 Feb 2025 13:33:27 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=fM7buvky;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tg9UW-0001Ey-4f; Thu, 06 Feb 2025 16:32:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1tg9UU-0001E7-Gw
 for qemu-arm@nongnu.org; Thu, 06 Feb 2025 16:32:54 -0500
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1tg9US-0006z0-JA
 for qemu-arm@nongnu.org; Thu, 06 Feb 2025 16:32:54 -0500
Received: by mail-pl1-x629.google.com with SMTP id
 d9443c01a7336-21f3328f72aso16260035ad.3
 for <qemu-arm@nongnu.org>; Thu, 06 Feb 2025 13:32:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1738877571; x=1739482371; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=mfvmlnluusUMUpKk6ZL+inlTMfV1gsd+jaZ0lcL/wLE=;
 b=fM7buvkyMRdvlUeGs4AGZSlMZFbdwi3VNWbcDSmWJN1NO/Rg1Xw/CEaJzOc7BECc/N
 gZCdIq95H0XXMS/PBu0BepW6hs3vmUqbu7LhI8pEQjqFgMEuA4O19DLRgNt6nRJ1nEyQ
 lYseaqxrrLPyhSVZSzDTb/1WRXK+rfNxYiOsekFv3ewDf2ANT4pxMt25bZ8Iz0kRAo+4
 jAvVLRu5p2ulnrS10SsCfH+TeibYBCXM8W6Lu5pusKC1tZa3D9XzATUisYzA9nXz18Va
 MflQXbM6xe4xKEvJeAPuAhWbjIIAheXTrjN9U7hjYfFuEA0yD9XAKOypjUgxZXbpTUYJ
 g6hA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738877571; x=1739482371;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=mfvmlnluusUMUpKk6ZL+inlTMfV1gsd+jaZ0lcL/wLE=;
 b=MRJzkFAHfzUC8PjgIGsnxSkouLOP5vaLl2DjwnVqs+BE/SQ2xAKjmnM3iR2z9jgHai
 6wlbsVLxuJdnUOhgC48u1Ip6rcIEjlHAplgnC2MnULQD4J0dKyQzPtE0UBOgN3Z5UscG
 cndW/I7MZcCBb2QUr0ky7U6bU27QnV/vOLLRF0auw9Mrh5tjVvQWYCL7YjLxkdPhj5WT
 CHwwS6/wpZEuVPkraijTyYQqVd9aGJEIhp6CdO9o6BPyfbEfQ7zWGGL1Ltq1q1D+LCAN
 lQa8veCI53f0kyGtcekPAs/gmATSsFncApCdajH/nUec+zVahoXYYEn1+0eI2ptBz58P
 iwKQ==
X-Gm-Message-State: AOJu0Yw2YtU63WWQTXjyotadixT2wNocNd4H5mbnsM3Wm+atXLyyWVtP
 ESnMadCUe7Ql/Njr+mn6XALuD3/rYy6VioCY3Ln+WhmwU29nghD8rR17hvh/8aE=
X-Gm-Gg: ASbGnct/uggjLaA6N5LgFRJZYDXD0iTwJhjmZcfxBD3z1k316msl4EpthX6wBmgphD7
 w8LBYgzxhTdOXoYugUNOA8QrAbZMZ7fNGt+D/L9VUYjrR9eIYLAHARew7YHCbhwdErwFhxpeYi6
 ssO8/JksOsECpAUikiC//cIUdhB9qBLtpGMEYiaNb9rPRF1WpdfDPLyvemh+7IEbnq3hW9H1Iwf
 8wnSvD96VqDdEGUNDcvwUFEbZlrTOQupX2AeringC/sB5Cxa3TOgNcLpxjConnvY0s+1Ad2dbl8
 CAaTOCu587f35XiJ0rjsMVArxPeNIl1OaUB4yJceMQX3dZwZT3YE7cw=
X-Received: by 2002:a17:902:e802:b0:21f:4c8b:c514 with SMTP id
 d9443c01a7336-21f4e76391amr12106185ad.45.1738877570744; 
 Thu, 06 Feb 2025 13:32:50 -0800 (PST)
Received: from [192.168.0.4] (71-212-39-66.tukw.qwest.net. [71.212.39.66])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-21f3653ca1csm17568245ad.58.2025.02.06.13.32.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 06 Feb 2025 13:32:50 -0800 (PST)
Message-ID: <09a180ed-ee76-4dec-b6f1-1977c4fe2cb8@linaro.org>
Date: Thu, 6 Feb 2025 13:32:48 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 02/16] hw/net/xilinx_ethlite: Make device endianness
 configurable
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Anton Johansson <anjo@rev.ng>,
 Jason Wang <jasowang@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Alistair Francis <alistair@alistair23.me>, Thomas Huth <thuth@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
References: <20250206131052.30207-1-philmd@linaro.org>
 <20250206131052.30207-3-philmd@linaro.org>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20250206131052.30207-3-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::629;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x629.google.com
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: UkbBK5N8DRRm

On 2/6/25 05:10, Philippe Mathieu-Daudé wrote:
> Replace the DEVICE_NATIVE_ENDIAN MemoryRegionOps by a pair
> of DEVICE_LITTLE_ENDIAN / DEVICE_BIG_ENDIAN.
> Add the "little-endian" property to select the device
> endianness, defaulting to little endian.
> Set the proper endianness on the single machine using the
> device.
> 
> Signed-off-by: Philippe Mathieu-Daudé<philmd@linaro.org>
> ---
>   hw/microblaze/petalogix_s3adsp1800_mmu.c |  1 +
>   hw/net/xilinx_ethlite.c                  | 20 ++++++++++++++------
>   2 files changed, 15 insertions(+), 6 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
