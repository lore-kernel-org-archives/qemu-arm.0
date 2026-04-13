Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BD1CF531DE
	for <qemu-arm@archiver.kernel.org>; Mon, 13 Apr 2026 23:09:42 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wCQPD-0008Ng-KQ; Mon, 13 Apr 2026 19:09:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1wCQPC-0008LA-4i
 for qemu-arm@nongnu.org; Mon, 13 Apr 2026 19:09:22 -0400
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1wCQPA-0006xy-QP
 for qemu-arm@nongnu.org; Mon, 13 Apr 2026 19:09:21 -0400
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-488aa77a06eso83009905e9.0
 for <qemu-arm@nongnu.org>; Mon, 13 Apr 2026 16:09:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1776121759; x=1776726559; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=mwFZ1UB1Z24/RVCrJPQo8FdEDCjxtQvwKJkKFTsE7bg=;
 b=HdT26UVZLsUVs0iRufgcCbY8YQHIjcmz/JVs+j0EQYNTUzymwEZHFcgcy3XB3I+IP1
 t98MbmClL+SerZnUuQbD85p5j8CMMnWWEEGDApETrPGYeYloyC/Rh34NbIfXQxLSWahv
 1x/2AweZ8ZpOiqakW7Dhba9prO1mHXk57sBaRKF48XO+Xv9zjoPefZFKzz1ZADAfYRAj
 seggs6q0sxlhAJL3uryU5QH9xyk4EZYX/ofZuXBVztamSpGwda+uEDz1oIVvv3TPYGfh
 BN0Lp9Wcc4haXKp9xTP6toMi94Fv6mN2R9XBzjWD8R3L2DPl/8jjfLJ6vg8Lr6fPJasr
 Llkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1776121759; x=1776726559;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=mwFZ1UB1Z24/RVCrJPQo8FdEDCjxtQvwKJkKFTsE7bg=;
 b=a+Rjj/leFFQF+9HCzFTVFvtGQMdzekZHLXn2DdU8HCMJLZivS8h7zNkAEd5CvoDSfV
 7ZOBYPMmIWZ+RbCCT27/f6tYzwoZimnO/i7Y1XWONvWHc337PpLhRJHOO9OWCiUHt4dx
 f8tj73v7lvNFFOlNL7ipiHUkZTlzAkMaVqVSeyGopvnLWtf06PeUaBKKQE2FMbOs3UuG
 TnHrrf/g0L/pIlDwQ4LgF2EA/gis65gtL6pVZ163kdZSIawRdmiy15kpTd5JoYMkelZs
 c5vhqUkbcO9yoFgnioxiPjzI3ZEvR3J/dCQCYU7KiAS+YplS56iVKv3DKaeI599ntrGI
 1zIA==
X-Forwarded-Encrypted: i=1;
 AFNElJ/SajxXhxVwzyK0G8SVWLV5cG01J8XmU1tD5OaeMSX3VqTY70kGGt83DzXo2EqpeygEAFtwvAiMQg==@nongnu.org
X-Gm-Message-State: AOJu0YzErinOzSA68BaLaRCLjyPwDncM0i5Bb8Z+BXhCXiBvIe8Gu6Ln
 ghzC+RLNrPEn+bP/8xJZNKBOmaMpU44ulkQ+qpoQq8w9qyyMBIu1J5AWkX66rKmV1+U=
X-Gm-Gg: AeBDieuRdZ6nlj03gkL6CHgJxEKlywxr4rB9k8Q9nSytH2ladQ1flm/OvW7k+2Y+VcZ
 6lrsWUFZZk0eybt1wCfvb+a2vLO0jB6kUUB8J8sqiiQONJ2S5VovvJZLYoVaiGnh2PsX5yq6vZE
 uIwaJW1Tzz+cu1Dpt5ORB2/WtRWve2hDpBYyOFFsJEOFIOVGDqdj1xDXrRPJ3/Nh6oINqFyA/qB
 VrP0cmtH9OInbcZAYSqDHzLV4cUF5Gk9mkoe/WQksLvv0sPvJ2fBFG/CWCTUk5JmuO+/jBIs7af
 F3Rbx8Z8Oe5ewAQOTVjEaj8G4AJmKvW1ebUNe3ATYUCabifCwhBQc6s3eDx6bHsmX1J52PBqXjc
 /gxA9/WtpgFdQkVRAI7UPyuAEjoIrGwrMTiUVECJrK34ijUcU4cgwDtjfs+p/ry4xPHJTRHqLnv
 xAbIprPRsTTI1V0rQIvu0NGYGp1wso39Ocytx4rH5F2k8EQ2SFbfSRq6R+/bMDlPHSyQ==
X-Received: by 2002:a05:600c:1f83:b0:488:a82f:bba9 with SMTP id
 5b1f17b1804b1-488d6864dd2mr205247975e9.22.1776121759078; 
 Mon, 13 Apr 2026 16:09:19 -0700 (PDT)
Received: from [192.168.69.228] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-488ee019e44sm2888285e9.15.2026.04.13.16.09.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 13 Apr 2026 16:09:17 -0700 (PDT)
Message-ID: <2fd0f178-e4a1-4e8d-b159-d1f278bb570d@linaro.org>
Date: Tue, 14 Apr 2026 01:09:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 13/65] hw/intc/arm_gicv5: Add defines for GICv5
 architected PPIs
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: Jonathan Cameron <jonathan.cameron@huawei.com>
References: <20260327111700.795099-1-peter.maydell@linaro.org>
 <20260327111700.795099-14-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20260327111700.795099-14-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32c.google.com
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

On 27/3/26 12:16, Peter Maydell wrote:
> The GICv5 defines architected numbers for the PPI sources like the
> generic timer and the PMU; these are different from the ones
> traditionally used by GICv2 and GICv3.  Add defines for them.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> Reviewed-by: Jonathan Cameron <jonathan.cameron@huawei.com>
> ---
>   include/hw/intc/arm_gicv5_types.h | 20 ++++++++++++++++++++
>   1 file changed, 20 insertions(+)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

