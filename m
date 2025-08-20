Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 080C8CA0EE4
	for <qemu-arm@archiver.kernel.org>; Wed, 20 Aug 2025 12:28:50 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uohvg-0001JJ-Gu; Wed, 20 Aug 2025 08:28:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1uohvQ-0001An-TP
 for qemu-arm@nongnu.org; Wed, 20 Aug 2025 08:28:23 -0400
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1uohvN-0002Uf-Fh
 for qemu-arm@nongnu.org; Wed, 20 Aug 2025 08:28:19 -0400
Received: by mail-ej1-x634.google.com with SMTP id
 a640c23a62f3a-afcb7abfc5cso1076107766b.3
 for <qemu-arm@nongnu.org>; Wed, 20 Aug 2025 05:28:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1755692895; x=1756297695; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=422PxAKD/2cNpjiawG2U3wC+OVjBawGc70AjvvnMmPI=;
 b=Hf2yW+VXsqCu9Apdu1uf+0BHTOj37pTXqCfllrKbLAwvEgF7BeYJrZprm0IYE3YfvU
 d7sbbcP1ht18DesixQyVep1AiA3QgtMquZKoTBvxkvQ84hin8fftcmSYQ+zbcm5hCjw6
 Gi4lo3q2lpo3kuxtWCDvibbeKOeAQ1mL3FddpgfDkLFknAGvivdIVU1M6S0XGWgjxGi3
 jROEtzKDe9w12qfUM7fcPMt1lMGOOlXLwTUcfpv8n4Jtcmh3y6iAeCGnwZIuxmofFEo6
 Oh6mCVi3hJBv8H5ntMPq8v7eKlUhDd47fwgelpnLCSDXK6Sn6F4xV4PnsbVmIky4VXa8
 /dCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755692895; x=1756297695;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=422PxAKD/2cNpjiawG2U3wC+OVjBawGc70AjvvnMmPI=;
 b=vuFzOJ6QgY8WsErR7rmKsy1LYKnrMuzmog75sSC+4/vvOkeCGEJu51pls8Waz/hfdW
 nxthHLwBc/a/UzJMxcoT/aAbcT2zJt9RT2Tf0EBhpGWx+reU387sDIftpVk3sgOWq03Y
 L2KSMFmBYe7q9QyIPHyfhqZUZWNsBVVYGLYL7y1ByctaKSFhrKXTlH0zLb8zhgugukbg
 y7rN84dRbgVfAtx3Gg/W5OIsouDSkRfznPtUIkWgCtbGb004lXyTSKRzVttFyY1U7dAs
 en4YsWfW19JLmO1vaT5ql4/JWVEIoQJoeORd5yP8hbB7jmiqp9ho4cXOEsrcbsF3Siek
 67pw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWWX4f3pn7EOIWwBAPMfkHE74KLzc7BwmLp2M04TMDJmPeiTB1bTqCbS3FScU3LJHo3hQudfhAutg==@nongnu.org
X-Gm-Message-State: AOJu0Yy/biEepKhepFeFf7DdosvaZX/mRebVtzbkYssHlDL3V222XfiR
 K4+cGGgJ89GLQnVSLjaeVGnMbsDh8ErgmWZrC6oDVIC8AqbkJZysoiGfANMSsLClJMY=
X-Gm-Gg: ASbGncs2H0pfAowrGC4ZdxK8xHkUYrFE0pr3t89LK09+mnCYAGjIOtdB3zdtZroPZ8W
 txz9keSJxLurpTjd2qpfZ+uYUPd4pjEaT/l4DvZLfkf6BiusDzQHEQQqkjH0WMHoo97y8zrFccA
 xf2TWhpYxE+MfMheTLBkRJWUBnBQO+RgIWie2Q7/pr7o//hCG3WVE2XcZsaDR/j8/Yv0E37xuZN
 vuo9J8mAt4Z46zcFCiFT5tV6zy3QCm6odqFDIE5tIYmFhr4vCvW6QkG5L/Bbeh5XzQFPjKSFHzC
 FOKet+wHSyG4pdde6bVdg0L6Yem5xKEfYoVPmlAVmamvqF6QddESOZ3GAsoGp4Dui8+phsjZgs1
 iFTj5yz3gLPBUrMHzRBYoHMMUROyOQcpDoHBBqZ6AcvdgV8B8hKt+MNxwv1vVxaHE5C87u2E=
X-Google-Smtp-Source: AGHT+IGVhnfwEDOnKBzNjtgnGtsHoPR7hrtkQIZnD2av7P8oS8OrqwWd5PtrCMjtbbBEVmeL2ZaNkg==
X-Received: by 2002:a17:907:d9f:b0:af9:a162:7fa8 with SMTP id
 a640c23a62f3a-afdf0204dbbmr215899466b.50.1755692895179; 
 Wed, 20 Aug 2025 05:28:15 -0700 (PDT)
Received: from [192.168.69.208] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-afded2b9a98sm177748866b.3.2025.08.20.05.28.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 20 Aug 2025 05:28:14 -0700 (PDT)
Message-ID: <9cd83bad-0146-4d20-bf04-769467732766@linaro.org>
Date: Wed, 20 Aug 2025 14:28:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 46/47] hw/arm/xlnx-versal-virt: add the
 xlnx-versal2-virt machine
To: Luc Michel <luc.michel@amd.com>, qemu-devel@nongnu.org, qemu-arm@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Francisco Iglesias <francisco.iglesias@amd.com>,
 "Edgar E . Iglesias" <edgar.iglesias@amd.com>,
 Alistair Francis <alistair@alistair23.me>,
 Frederic Konrad <frederic.konrad@amd.com>,
 Sai Pavan Boddu <sai.pavan.boddu@amd.com>
References: <20250820082549.69724-1-luc.michel@amd.com>
 <20250820082549.69724-47-luc.michel@amd.com>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20250820082549.69724-47-luc.michel@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::634;
 envelope-from=philmd@linaro.org; helo=mail-ej1-x634.google.com
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

On 20/8/25 10:25, Luc Michel wrote:
> Add the Versal Gen 2 Virtual development machine embedding a
> versal2 SoC. This machine follows the same principle than the
> xlnx-versal-virt machine. It creates its own DTB and feeds it to the
> software payload. This way only implemented devices are exposed to the
> guest and the user does not need to provide a DTB.
> 
> Signed-off-by: Luc Michel <luc.michel@amd.com>
> Reviewed-by: Francisco Iglesias <francisco.iglesias@amd.com>
> ---
>   docs/system/arm/xlnx-versal-virt.rst | 49 ++++++++++++++++++++++++----
>   hw/arm/xlnx-versal-virt.c            | 37 +++++++++++++++++++--
>   2 files changed, 76 insertions(+), 10 deletions(-)
> 
> diff --git a/docs/system/arm/xlnx-versal-virt.rst b/docs/system/arm/xlnx-versal-virt.rst
> index 5d7fa18592b..af56b275413 100644
> --- a/docs/system/arm/xlnx-versal-virt.rst
> +++ b/docs/system/arm/xlnx-versal-virt.rst
> @@ -1,16 +1,18 @@
> -AMD Versal Virt (``amd-versal-virt``)
> -=====================================
> +AMD Versal Virt (``amd-versal-virt``, ``amd-versal2-virt``)
> +===========================================================
>   
>   AMD Versal is a family of heterogeneous multi-core SoCs
>   (System on Chip) that combine traditional hardened CPUs and I/O
>   peripherals in a Processing System (PS) with runtime programmable
>   FPGA logic (PL) and an Artificial Intelligence Engine (AIE).
>   
> -QEMU implements the Versal Series variant of Versal SoCs, with the
> -``amd-versal-virt`` machine. The alias ``xlnx-versal-virt`` is kept for
> -backward compatibility.
> +QEMU implements two variants of Versal SoCs:

"QEMU implements the following Versal SoCs:" in prevision of Gen 3?

> +
> +- Versal (the ``amd-versal-virt`` machine, the alias ``xlnx-versal-virt`` is
> +  kept for backward compatibility)
> +- Versal Gen 2 (the ``amd-versal2-virt`` machine)

