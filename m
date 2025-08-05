Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 733E6C87FCB
	for <qemu-arm@archiver.kernel.org>; Tue,  5 Aug 2025 14:17:54 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1ujITj-00048B-Dm; Tue, 05 Aug 2025 10:17:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ujISw-0003Ia-VV
 for qemu-arm@nongnu.org; Tue, 05 Aug 2025 10:16:36 -0400
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ujISu-0000eo-BW
 for qemu-arm@nongnu.org; Tue, 05 Aug 2025 10:16:33 -0400
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-459e3926cbbso3339245e9.1
 for <qemu-arm@nongnu.org>; Tue, 05 Aug 2025 07:16:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1754403389; x=1755008189; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=xdgf9y4Wu53PPu1l33glavlXF/mRl+Ce7VqICr08l80=;
 b=cjSuHaKXh2JuspMsKaOE6mcvLPYh96BksUTjpEzrYG5yQnB8X5NMsj15TyzvXiQzeS
 1gceOLGYtyLXkXbwp53xqgcpLTNlQ2gzgApq51NiYXj4gkyTqn0a202UwP0ExEm8GZUM
 Nt0+tXxfA4fNrRjKx5pRzwr0Y77bWq5Yavvci8z6okNk+DbINPeZhrDy/Oay2cLAizm3
 wVZLTq14GZQNCUDwg35KnCNhUTxJaK3ykRiUAd2HiwmqnebI2jm3rt1t6KNIYMLTs8wy
 D0g4xHOKIdsaFMTtAdV7Wp3AQdgKAfsofpbLt5e6TBOermOLUP6nF6/pk4aHaSF5lZm2
 g0kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754403389; x=1755008189;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=xdgf9y4Wu53PPu1l33glavlXF/mRl+Ce7VqICr08l80=;
 b=Xoe/qceQ8a27PEajdAzbo+K1g84KHsv/fN7ZeKiAg88r9vRUzqG4Om972fDAfw2nBV
 wrN/iYMxpF7Vu4ya12u3IfgbesbUuQri1m2OaSWVChHGsEEbREz5MRLau74okYD9UUgK
 ro5uUHq0wrc8s2yJta6Tz6K/Up8erblYByV4cxMVNTKqwE0rPsDuJwUydnULPEZWWgVO
 6K+ExnVWuz0MvvhVZoLEqMKQgcvC12Y7DQWurM5POpb6ObkGGrDx5kr3APqJgeTf5b2y
 ZupgMwXNtaX9bvvDaBwVV3otFP+4c6eTBvWPEFus/k7IWOREFg5ehjcRTPIQx5rdKQHb
 Y89Q==
X-Gm-Message-State: AOJu0YzkM5PTOqWn697dhnG98tTnkflezzqiMxEkT11MvDpNWnoimuMI
 d1RVqsArUjVju4ALt2DrL980+cUuWJaFZMzN3QeqH2JsgXOA4E320d/TQBkriRXQrxI=
X-Gm-Gg: ASbGncsWNOhln8j/kOQHz0Boz0OsVzcWG9Uk+y4b054qaRZLcw3JtZXUlDEuUM/mD7W
 08RGSp9B317Ot8u+A0LJ0TFdYnLn2sIfHrZ+ayp46ivK0M2vJTFqi6DYusTCVCim6oFOPBu4sJk
 ySx4RyWQUE0qoZFSU4PbKv8cxyjcvJIpV67KWxP2Wk1/ckVKjteNiN2plxuPx3Qcb6/UkF2NHXO
 wGGMeqgOoki+qNY5CL/xsi8j163ecya+JTgu3NQ3QNzM8DbkP+Xj7sKoXN+2/SUcWx2ufofc4io
 +Dj2J8OZLvUN+LNjG9sbFO59O/y5L4rvcI/mYAsVHjMdSqNYqn2TGAQIM2SBHT2xqIs+kENLh8q
 /gtNjDwp8envxWE3FjNcuf0PWe7T0F4T2UD831p7dMD4v0ZHIMgrvEyRGRItqrhRBOjoyClYnKZ
 HU
X-Google-Smtp-Source: AGHT+IE6yVt6MdeM7KOyHzbJWuFu74/E1wd6riuNV1+v7VEM5NrggCPFdc7CvLX3RLYI9Nobndy7Gg==
X-Received: by 2002:a05:600c:a0b:b0:456:fd4:5322 with SMTP id
 5b1f17b1804b1-458b69dde9dmr102754305e9.11.1754403388674; 
 Tue, 05 Aug 2025 07:16:28 -0700 (PDT)
Received: from [192.168.69.210] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3b79c3ac574sm19384010f8f.5.2025.08.05.07.16.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 05 Aug 2025 07:16:27 -0700 (PDT)
Message-ID: <f9a79dda-83a8-4cbf-9a3d-dde4fcc0eb48@linaro.org>
Date: Tue, 5 Aug 2025 16:16:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-10.2] hw/arm/virt: Include 'system/system.h'
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@redhat.com>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>
References: <20250731144019.1403591-1-clg@redhat.com>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20250731144019.1403591-1-clg@redhat.com>
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

On 31/7/25 16:40, Cédric Le Goater wrote:
> hw/arm/virt.c should include 'system/system.h' for :
> 
>    serial_hd()

3 other files miss it:

$ git grep -L system/system $(git grep -wl serial_hd)
hw/arm/virt.c
hw/isa/isa-superio.c
hw/mips/loongson3_virt.c
hw/mips/malta.c
include/system/system.h

Anyhow,
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

>    qemu_add_machine_init_done_notifier()
> 
> Signed-off-by: Cédric Le Goater <clg@redhat.com>
> ---
>   hw/arm/virt.c | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> index ef6be3660f5fb38da84235c32dc2d13a5c61889c..e1b6241f7bee4c2fddde31c512561e87229cebc2 100644
> --- a/hw/arm/virt.c
> +++ b/hw/arm/virt.c
> @@ -50,6 +50,7 @@
>   #include "system/kvm.h"
>   #include "system/hvf.h"
>   #include "system/qtest.h"
> +#include "system/system.h"
>   #include "hw/loader.h"
>   #include "qapi/error.h"
>   #include "qemu/bitops.h"


