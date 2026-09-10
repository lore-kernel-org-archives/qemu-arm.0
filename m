Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A836C79FBF
	for <qemu-arm@archiver.kernel.org>; Thu, 10 Sep 2026 19:54:18 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1x4kpn-0002W7-9C; Thu, 10 Sep 2026 15:53:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1x4khs-0000C9-0t
 for qemu-arm@nongnu.org; Thu, 10 Sep 2026 15:45:30 -0400
Received: from mail-pg1-x52e.google.com ([2607:f8b0:4864:20::52e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1x4khk-0008LH-Ud
 for qemu-arm@nongnu.org; Thu, 10 Sep 2026 15:45:10 -0400
Received: by mail-pg1-x52e.google.com with SMTP id
 41be03b00d2f7-ca12086c06eso222389a12.0
 for <qemu-arm@nongnu.org>; Thu, 10 Sep 2026 12:44:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1789069482; x=1789674282; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=8zETsqRvX4XGj+oOnGQ4sYZWQHFp84w9PP72l0AJz8U=;
 b=eYgdz2cYC/Wmm3ooFKr3I+SfTDBpBCoVehyyDSt0AzHldens2a3yoR+uUIdPefRr8+
 R3jb9CLuySzk1lf86ltUW7jYmn/BoS+tu3rUSIipAT+r9HS7NVvxpUrpM2fTSkFKFUNL
 vErE7w4Bj/TUiNHLBFeq8HBSsK9kZ5lTGGtZ0drdGmOYJwoh319v+9kpRx5i9Qpvhmxb
 HW2uHa45/nFz79SBfqzW1NZK3zl8pscVJoFMQ1qA6fxzcScCRzUBLQI2Eib3f5zObLDT
 jnzdkAI718G7Ns0MPw+2702Vi3Y3VFhKazEnrtRxl7h1iIg8N+ZNN6C1E7bIDgqMftLp
 7dTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1789069482; x=1789674282;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=8zETsqRvX4XGj+oOnGQ4sYZWQHFp84w9PP72l0AJz8U=;
 b=L9Cqah0UB2mzuHQp5OviaXOD+69PS1cwnqSHH9qbpLjjxvBe+tjnGyAlb8NBcEGBLx
 2mgjezB032HGz7fv2mJ/2HCaO+qkDoTM8X+X//dIpamoiAuDVuPASwEA/ibkW/N+QhoU
 ff8xK9AH8WVkWkyiEkzA7ReZ6528tHHkHRlhI/rdmk/GQhaBnadilY5NpfjmAoImyGIb
 tIk7g6x3LFo8eU+jOrqMOQibplwARjCqzWZpUoL7DhLsi2wuCtK7BJ2bc/qrdkGXRrbH
 CAsDBGcVUU5VovtRsHl6lDFKHPGgLb0+1p9ndg+H8d9gUdRh6DPKXm2QLJi+18w+eGhK
 cd4g==
X-Forwarded-Encrypted: i=1;
 AKwUvBw88BDdQlCjtd26rUEq97TrzrDoNq9BYJKZiGp887/xmV9oNYL4fpfeNwSwRehjOl1xOZt9bEHhoA==@nongnu.org
X-Gm-Message-State: AFuF++kLM2366BZbvJu4CFxfnwaKALrCnAU5R+tcsnl2ttCG4n8ZJ/JJ
 0yo7N9GvQe5BqkDr7O4WrMkeBB3WIEywi3ypS5W9XUwUt4ndgfNO0jyGm2/p3g7vlmc=
X-Gm-Gg: AYBFou1zRTs+nhVcshoZfQO1G5LZNxE0qP9pwReWu9h9erDRrubzhl3n0KtNm+cnYUW
 4h0g9uwewItVY2CrgrJCeAG3BoX++3CrAJazE2zpwvFr0ZNHR/WK33YPxZ0eI+G9zZ8clDY+70a
 R9cJqQ2yjFcN7+UpgPyf1+yN6xG3HngFIytxPaCThxSPWoSQ3DV6BGCrhMKRLXLhyWM9KBwkqb9
 94KDz8WqX166ae7salwkBk16HQR4C551/nSByHI6MvW4cNpgICeULd7V7wHczc867NAaQhTf2aM
 lGvXAHnuxqj0Ea1O+oVwtTM34IVMGmtt51nBySvl4LaxOJ89EXPdxBRRPDVuRDliKsRIIEaInKf
 F5AulTHAhnAgD9uI26P4gMxgtCAqQCaTbPGi8tMd+xFRtkRVL+qfmyF+szqFpzosL6UaJ0fO6Sj
 d8AOhvxz22YpB1L6wDim9xuA6d0w8o3dR8wzCXfEHdCpT03JUmVkxPzY4Yvcb5ekNLb0/XWYqjq
 m/I5+uNZw1jNag=
X-Received: by 2002:a05:6a21:6f88:b0:3da:755f:a031 with SMTP id
 adf61e73a8af0-3daed20b238mr923398637.12.1789069481818; 
 Thu, 10 Sep 2026 12:44:41 -0700 (PDT)
Received: from [10.171.0.227] ([98.155.112.169])
 by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-33ba4e9a8a9sm287837eec.13.2026.09.10.12.44.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 10 Sep 2026 12:44:41 -0700 (PDT)
Message-ID: <714d9088-2a70-414c-9b41-a86966a1e8d9@linaro.org>
Date: Thu, 10 Sep 2026 09:44:36 -1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 07/21] target/avr: Constify CPUAVRState for some
 cpu_*() getters
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>,
 qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, Zhao Liu <zhao1.liu@intel.com>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>,
 Michael Rolnik <mrolnik@gmail.com>
References: <20260901095229.72018-1-philmd@oss.qualcomm.com>
 <20260901095229.72018-8-philmd@oss.qualcomm.com>
From: Richard Henderson <richard.henderson@linaro.org>
Content-Language: en-US
In-Reply-To: <20260901095229.72018-8-philmd@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52e.google.com
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

On 8/31/26 23:52, Philippe Mathieu-Daudé wrote:
> Add the const qualifier to CPUAVRState when the
> argument is accessed without modification.
> 
> Signed-off-by: Philippe Mathieu-Daudé<philmd@oss.qualcomm.com>
> Reviewed-by: Marc-André Lureau<marcandre.lureau@redhat.com>
> ---
>   target/avr/cpu.h | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

