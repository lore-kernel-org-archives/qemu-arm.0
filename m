Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C652CCD5BD5
	for <qemu-arm@archiver.kernel.org>; Thu, 28 May 2026 07:29:29 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wSVB4-00058D-UI; Thu, 28 May 2026 03:29:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1wSVAa-0004w4-6D
 for qemu-arm@nongnu.org; Thu, 28 May 2026 03:28:45 -0400
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1wSVAY-0003Pf-L1
 for qemu-arm@nongnu.org; Thu, 28 May 2026 03:28:43 -0400
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-49050bfe053so30270845e9.3
 for <qemu-arm@nongnu.org>; Thu, 28 May 2026 00:28:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1779953321; x=1780558121; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=vs0Ru16v/kVCmYV5cc1rpyROkSzyZN/jl6POv6UvvZ0=;
 b=ZOozvMRujRhOGW+tzzMor37D4RYxECtpzEHPgf+bhSULuVqsb1hrrlEY5tmN74Gk2f
 0lwkD4dY0rV1YNHYR77uzf4sZ1gvLLFzMV0P96H2eFFAwLceDce1OpQC5UlcBLwd1rSm
 clb1mGZX+LJdqk9JKoWupGEcJKXeBjITH9YNdGXVXmJyswUnAldOr2+8+2vjyNeJGefc
 06jyPKoCawZ4N8de4xFW1XZSHibw5W9DPd+kE1xSLQ6TI+uQuNJLGLEfK5ymbM9EdEBI
 YT54v0d3+xWUkCzX4FnnB6FDkU2Xtz/LzbX0naiycXkbbw9DnfZu7idXNMCQ+Y0u3M/O
 SgBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1779953321; x=1780558121;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=vs0Ru16v/kVCmYV5cc1rpyROkSzyZN/jl6POv6UvvZ0=;
 b=FCp8HZ2BoRpuDFZrBI7HkoMAaQVKj+JNX88ZZTR2NkGE5bEHS7juveSQlvT/oVccWB
 i2dnlkIEzoeAy9w8ikkU/5EG1M2zzdqNChbhhYTyAAXW5xCTGypUM2EbEVVD0SlHgUOl
 1wxvqK4lIrucE1NqpOgMtv3t0vVRgltwm+OqX2e/mhZTene/NJyPWw+UlMeFpDCE9BrG
 PWv12yGU0EsQ3q9rE9OcHmpDA2//2z79PcbhvqeyX7MxV12VDtdtJ2m4A2RTgpTP7fDN
 Pmfv5GrAHx7Y+aCllQlcrU7iIGFUreZGMBu8N6xGNOelUfxnnRbl/MFdiqj/M/3Avobr
 kEbA==
X-Forwarded-Encrypted: i=1;
 AFNElJ9l3aJ1lHxH8cI0pSbzVezRBkwFKZlZXXB0bDE19B85o8Wj/OpvG32E0N7u6s3YxgTs6elSls1qRg==@nongnu.org
X-Gm-Message-State: AOJu0Yy16Qq2NPq/H5jP3qnkYyyQnvMi9A6iLq61AdinRCfWYhaRPx8c
 IclQhVXAmbD3g/h8250s60/4laC+c4unXAqNTz+NCBNLpFVd9wVOtOgRPumIVO/2B5E=
X-Gm-Gg: Acq92OH+uzEXckfH4LHivL016dR39aqgvoS/UIj55wOlA+r7Ehlk9XPES07Mvz0CGPs
 IF0/2i34tBqURKFbQ0tgR31Q3fOLUxkHbvnuSGLRmmCI7kJFL77vrblnwvkwQUyp5u/YaxFpnV1
 kqjqn67xt1o+D6MIA1K8vctBxElXKlAU7+w53wS0CQcg2cGx00TBJNOmx0iSRSVguAYm6T5JYFe
 TDXx4a8DKgn91DDZqKJwSGuWjrqt8pfFZ7OHphxQXeH4Y6BuQ07JHPbtalOUOqEZl37nWSsJXQP
 sGJcfSDtXVrmskNnj5eEk9qoTH37FnGoEwSCukHrZxZUk11jWG8nzMPQgYt3u5xQk+TyNhoxUei
 TejIypF03RKiWn24lOEOEUrXKaYE6ol/iV3S6SM18BIELLXZMLPwElkm+CQrvAmevxYlIhhQjHe
 Q1x4SRwk90y6Wd7u5WmyAicJ+HX/BCPkCs9LgR0NM1EBcmgRL0f/evwBm4w+KbGtmy82uT+cZ/2
 l75
X-Received: by 2002:a05:600d:6451:10b0:48f:d5e8:758c with SMTP id
 5b1f17b1804b1-490426d1a78mr320661265e9.16.1779953321219; 
 Thu, 28 May 2026 00:28:41 -0700 (PDT)
Received: from [192.168.69.207] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49092a92594sm20652775e9.13.2026.05.28.00.28.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 28 May 2026 00:28:39 -0700 (PDT)
Message-ID: <ed66d1df-81a2-4835-a2b8-1e95c905d980@linaro.org>
Date: Thu, 28 May 2026 09:28:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 02/10] target/arm/whpx: move whpx-stub to arm_stubs_ss
Content-Language: en-US
To: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>, qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Alistair Francis <alistair.francis@wdc.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Harsh Prateek Bora <harshpb@linux.ibm.com>,
 Ilya Leoshkevich <iii@linux.ibm.com>, Eric Farman <farman@linux.ibm.com>,
 Weiwei Li <liwei1518@gmail.com>, Helge Deller <deller@gmx.de>,
 Michael Rolnik <mrolnik@gmail.com>, Aurelien Jarno <aurelien@aurel32.net>,
 qemu-arm@nongnu.org, =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@redhat.com>,
 Laurent Vivier <laurent@vivier.eu>, Glenn Miles <milesg@linux.ibm.com>,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Chao Liu <chao.liu.zevorn@gmail.com>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 Artyom Tarasenko <atar4qemu@gmail.com>, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-s390x@nongnu.org, Zhao Liu <zhao1.liu@intel.com>,
 Alex Williamson <alex@shazbot.org>, Brian Cain
 <brian.cain@oss.qualcomm.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-ppc@nongnu.org,
 Palmer Dabbelt <palmer@dabbelt.com>, Jason Wang <jasowang@redhat.com>,
 Stafford Horne <shorne@gmail.com>,
 =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>,
 Max Filippov <jcmvbkbc@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Cornelia Huck <cohuck@redhat.com>, Song Gao <gaosong@loongson.cn>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Yoshinori Sato <yoshinori.sato@nifty.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Mohamed Mediouni <mohamed@unpredictable.fr>, Peter Xu <peterx@redhat.com>,
 Pedro Barbuda <pbarbuda@microsoft.com>, Chinmay Rath <rathc@linux.ibm.com>,
 Matthew Rosato <mjrosato@linux.ibm.com>, qemu-riscv@nongnu.org,
 David Hildenbrand <david@kernel.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@mailo.com>,
 Nicholas Piggin <npiggin@gmail.com>, Aleksandar Rikalo <arikalo@gmail.com>,
 Fabiano Rosas <farosas@suse.de>
References: <20260528051642.115721-1-pierrick.bouvier@oss.qualcomm.com>
 <20260528051642.115721-3-pierrick.bouvier@oss.qualcomm.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20260528051642.115721-3-pierrick.bouvier@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x330.google.com
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

On 28/5/26 07:16, Pierrick Bouvier wrote:
> This eliminates symbol conflicts for whpx symbols on windows-aarch64 host.
> 
> Signed-off-by: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
> ---
>   target/arm/whpx/meson.build | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

