Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC11AFF8875
	for <qemu-arm@archiver.kernel.org>; Wed, 29 Apr 2026 18:42:56 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wI9s1-00068D-3Z; Wed, 29 Apr 2026 14:42:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1wI9rp-00064Z-7X
 for qemu-arm@nongnu.org; Wed, 29 Apr 2026 14:42:38 -0400
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1wI9rn-0001SD-J2
 for qemu-arm@nongnu.org; Wed, 29 Apr 2026 14:42:36 -0400
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-488e1a8ac40so632115e9.2
 for <qemu-arm@nongnu.org>; Wed, 29 Apr 2026 11:42:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1777488154; x=1778092954; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=kyP7dILdhqqu7QMIF3xGaTiSW8Leb41A9fFUr/EASvo=;
 b=C+EGrygU+GB6Jn8DSp2E0IanE5Dy7HXtoMuHGpBbSchLxJHLItvv+XwoFr5/AHajzs
 K91hupBt9JNciiltsHeBsH1WHYYHJwDy+cCovLXVlm4nybbUF9twH8Rgkt2nmKbJC8Ti
 GXtguNhSRLkWlH8DPyDrAsv8hvKl017c09LvKp04nZBzZWsgrBOnTfpKkj+45UUjtL/H
 TWYWthpW5x4DCEqxktfQmRfFO/j5EFUleFyDl4H7zQ9BYo+LVKFkyBMEzS0GRwMtDcGB
 U1kU3DBAwg9FmEDIXDeq/r0Ayb8YVNhllWMOSFLN4VZ+S79dlcbSkvIKST8wXLsu743I
 r2dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1777488154; x=1778092954;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=kyP7dILdhqqu7QMIF3xGaTiSW8Leb41A9fFUr/EASvo=;
 b=Cf2WpBv5MUOthUacIn0RrfX4G/Q6dqe8JGR2N+iY7UufBTCPAcGfrjvV4nlOBEiHTb
 mwGkSG6ZI9zqRj+8UBHybxsGTRQRcJzY4PBadt54ln12ummvsnk6KzuvJCFXJHrL5sRG
 zNjC6mv6IkrTT2i499ENsZ2l0LHmd/gQLCtVtTBZ2DjxP58H43GjnKNYmudNAr0U+o61
 0wjiL8kPqApTGkHEiyCeTkkuiEMN9V0qdLdaV2tJitytKkY7BZS/KgIP/PVMGjEe2biS
 mO7wQmYsEJBPpwde8hOP4MiRYTmjx5QKxiRXUB7Vfz1YTEGx+0SfSeK79VSVHirpzsPU
 Uk3A==
X-Gm-Message-State: AOJu0YyPmdBhlvTI5Hycmg2kSiDaj0YcE7E4fJG3e2wdnPTeNGRwHw4Q
 TSRKp2OJzmUNI93hwtfPRETy377rS8uDEluVEYSh6jIGcfD9c2KTE87H8Xm3Nsfmu8K9wff2yCW
 UWxMcYoA=
X-Gm-Gg: AeBDietCA4Tl6G96bryA2ARm04sj0Tlmt2+cUd19f4f7fvU5Kt4uQt9Y1FW9suDgOUI
 zRnyYE2kYgov1cZlxbq80Xo85bWOlpYBsvcr9bdHDb4W8YOuUAE4Dz1556gg/AG0+hOF4fL88ne
 PJhh1kMGK+JMda/zV6mSQNSp7RAY7TkxTCKZIqqPlIzbwh/cPZtF3PlpVz4RHOBwttCskEBfpQb
 QLiH15H+AbJgHvuVLabln2gmPMjyOWT6lE9zMPNcW6E5uJDj3uxaW7N6Uwj2jSURJ4TGmY+fLwL
 1PR9uYSoizo9GhIdCoaUwTKkYoaPAh8iFpMCzVNP+j8PIBNAaajrt38CaQ5OdgnEvpy5r2qXUhN
 3NEyGTrmeuzBpyPK7LXyGPxsqVMcwbWmuqB+/AdcwMvHzNov3UFiDuUbOimz9IWPwnd8lg9EdRN
 ne1noxVUWAZ5N83mNE4zDVol131sth0awj7yP+6Xx7qYoFK+P50kq1sxaFidFxwS6R3+/hylqWZ
 iEk
X-Received: by 2002:a05:600c:3496:b0:48a:52f2:a0f1 with SMTP id
 5b1f17b1804b1-48a77b05c83mr153200475e9.18.1777488153779; 
 Wed, 29 Apr 2026 11:42:33 -0700 (PDT)
Received: from [192.168.69.210] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48a82307f28sm13344805e9.13.2026.04.29.11.42.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 29 Apr 2026 11:42:33 -0700 (PDT)
Message-ID: <24027350-7437-4cc7-9485-4eb1f1d57e0a@linaro.org>
Date: Wed, 29 Apr 2026 20:42:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 33/84] fpu: Return struct from float4_e2m1_unpack_canonical
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org
References: <20260426134002.865628-1-richard.henderson@linaro.org>
 <20260426134002.865628-34-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20260426134002.865628-34-richard.henderson@linaro.org>
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

On 26/4/26 15:39, Richard Henderson wrote:
> Inline float4_e2m1_unpack_raw at the same time.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   fpu/softfloat.c | 17 +++++------------
>   1 file changed, 5 insertions(+), 12 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

