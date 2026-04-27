Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1752FF885E
	for <qemu-arm@archiver.kernel.org>; Mon, 27 Apr 2026 09:42:25 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wHITr-0001Fa-3A; Mon, 27 Apr 2026 05:42:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1wHITp-0001F4-Ri
 for qemu-arm@nongnu.org; Mon, 27 Apr 2026 05:42:17 -0400
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1wHITo-000350-Eq
 for qemu-arm@nongnu.org; Mon, 27 Apr 2026 05:42:17 -0400
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-488a88aeec9so124885405e9.2
 for <qemu-arm@nongnu.org>; Mon, 27 Apr 2026 02:42:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1777282935; x=1777887735; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=4YNnNfRTbJRtIq4x5ehgxFda6IiFl7V71AQRLsGxV/8=;
 b=a5HocQFNtHbp6XzRcRQx53ZokdQ6VmpUgEvSVc6S/Fkzj+iFQ8zgFpfXpJAQxYsvyj
 ZXAJylYeFZyZd7GjyK/BKklus9a6TgOZjz8WjaOWMMo5z48jGKEHTSM3ZFA4nnLKitLs
 BGx/1fbOoEL7iSkYdOTvq1YQhz1+YRVpOOIxTQ3cbg7ATGRDsPS9urMZ6HedA5InChUh
 njovSpIgAVRw5NKp2Z5NqfG0NUWnIwdb3yznnFDyVVl4jXJnMXuvvqAsShe2IJngWTb7
 d4Z9vMPSGehnTRDcZWVkjRj7QOSyX5Tb65Xdej+owx9/U1sGBKGIPD9QNOijtN3CTFp6
 GLkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1777282935; x=1777887735;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=4YNnNfRTbJRtIq4x5ehgxFda6IiFl7V71AQRLsGxV/8=;
 b=MEibcsLm84tUAr3/oimDEYthPapm4/mJkGZV6CWL+835pew02V3E7T4XTw6rHTQsR5
 b4hX7FjvLWNnTZpoudx7iXTbu5SURdyksY8IqPdTfBts/LXnfLSxqoLw+a/IdxchEhfR
 A9L0w4WXNfi1lQsStedtGrOS8W56mQnLOh1iahnOuNXAfK4cBBEHVB5pVAH+i0QqKmtJ
 g+eooMVYh7J6fGMJaHhG1rnOvDe6ZCGdOBx4G7CtAp8u8eOseBMVJKNmakGUK0WfVA+F
 cWlTfkI9hP61DhIj7q/B/F1N/GsRAcEddGizKmKxC/QupHrPfVVxttgt+adX6HIVsUsP
 jlcg==
X-Gm-Message-State: AOJu0YyUSPyxxK8TouHGNClEwpsuuSqcxcfUsheMdR54cCr3fBKteUgS
 vz9PYYV3ZPpe7Zw+nh2OpFVVV4jjfudsp6Kg+JRetPmCSHfhgqWVtchDXa6/50428pU=
X-Gm-Gg: AeBDiesxmcm1g2CLmjjd5nsn7WImIGfPnSsTYjxvLx0407swumER1mkrnQLv80o7POs
 CnkZC4mHIrsGhRFYXW1KU0FwbFzeJ4SuKIeeh3an87iGQenv67pIh9UNnhoO7u6//+fYSUkUB6n
 oLIrpYqkVzVG73iLZJ24QPU3y/FrE2maEsYb6LhZWwCTG7dQjwtYFsRR0KBgDG257uADKF96sO8
 H+9y/g2IVnyZLh+F9kdCxnzWM1ZdnmfsIfFKGFs5xC5XjGfnb1FAvbTb9WVJDNXfG8I0ARfVbqy
 3Eg6NDUSXmFX4H4BxciUweRmRdTSkmb5mLHKPRtwUUA3goObpc04ge0DjG0gJdoNKv10MWwynAL
 nUsvwvjsTqn2nyZol8pqa+jNANNUsCRwSayDRcoVTjZkFykx9+Rlt9MfC22xm/DeZcrfN66bv20
 y+wD3Q7l6iYBvZemDGEtiFnVhxf/ndorjNbgKJ1elihBZvUbS4HcUJJ1kUYIp72yt4esE9XYxFz
 I3r
X-Received: by 2002:a05:600d:10:b0:489:1b0c:8b43 with SMTP id
 5b1f17b1804b1-4891b0c8c48mr382510065e9.1.1777282934976; 
 Mon, 27 Apr 2026 02:42:14 -0700 (PDT)
Received: from [192.168.69.210] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4891941e05bsm197566675e9.36.2026.04.27.02.42.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 27 Apr 2026 02:42:14 -0700 (PDT)
Message-ID: <a4fcb37b-dcc5-41fb-8390-d58dcefd08f9@linaro.org>
Date: Mon, 27 Apr 2026 11:42:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 14/84] fpu: Drop parts_div
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org
References: <20260426134002.865628-1-richard.henderson@linaro.org>
 <20260426134002.865628-15-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20260426134002.865628-15-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x335.google.com
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

On 26/4/26 15:38, Richard Henderson wrote:
> Use parts{64,128}_div at each call site.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   fpu/softfloat.c | 24 ++++++++----------------
>   1 file changed, 8 insertions(+), 16 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

