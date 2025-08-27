Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9361FCA0FF0
	for <qemu-arm@archiver.kernel.org>; Wed, 27 Aug 2025 02:37:40 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1ur62F-0007hl-90; Tue, 26 Aug 2025 22:37:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ur62D-0007gS-Kd
 for qemu-arm@nongnu.org; Tue, 26 Aug 2025 22:37:13 -0400
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ur629-0004vk-Hj
 for qemu-arm@nongnu.org; Tue, 26 Aug 2025 22:37:13 -0400
Received: by mail-pf1-x430.google.com with SMTP id
 d2e1a72fcca58-76e2ea933b7so447253b3a.1
 for <qemu-arm@nongnu.org>; Tue, 26 Aug 2025 19:37:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1756262225; x=1756867025; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=PN1UiIwUnx0TLN7HTYbR8GaxIk1k1o2adWXgiowZkYo=;
 b=uhJPDReCW+upKRdkslJBzKUE15FZk8aKqAiFMstfNDvvXR4kTq68l72m9oNddQixOz
 v/kDEl3nusGCOoc7LR2JHvV5G5UHt/Gv69Iye4KDxXVh4y1jBxyvM9SEPv0IcT6HJE9M
 d1ORzk400TYFw3D7EBZwEpj6YaVZXCO1SjvEoR25wAs+l21Fw51SRnslVXeCfeivauPE
 +uIjEwoQjl319cK6V9oOKABWI899m/lv8Cy3y3Xc661WKNKNijYMBf0W1fqaQ3ppgHLp
 G9VDqNunsNyn5zdghWeIAZ3xeWCH6X7bsAQBaPAm/QzH3ASTeE77P7Asj01hUQ7NmI0M
 qLOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756262225; x=1756867025;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=PN1UiIwUnx0TLN7HTYbR8GaxIk1k1o2adWXgiowZkYo=;
 b=T0ITFM7tDQZvFLNWQVm255tG7S/5Fe5ICnzuP/nPKmtk2wLKGtjjy5K8jqlVhvcgiw
 CuYBOCR9nqKaOuja92Dzd2FnhnN04G2+u3lvzuoGs+PFosXkeOb8GJBcOH7cuO6PS2yD
 gyB/L/Eooc+Jyc0JrRMu4/QCdmWN1ocNc0xvVltP+bbbb3ryjoXifDGfDx8mF0wUgNAr
 Mp1sMv2YwGBTZbLdMJHVbdmo3eMt3htZS6jHSk9vbL2PsM5wAtW0NkUyJOA8zpFEH7FN
 cuig4bNwpzuIydXmCSs2FxdZ2Klwt31zKdXTinP/uluE/klkklxfmQZS7oL5K7XUr9gL
 +7gQ==
X-Gm-Message-State: AOJu0Yx9a5IAmtARbk7+Kt8augCy2rT8+6xah9zycDCEkXV58bWPy87F
 6ogzxExvx97auSelYZM1LhYLHxGMCeORje8wbb15cZGtWwA3z3CBRR1rMJaqZMJ+ROAwJpDp1PK
 yXdykW8w=
X-Gm-Gg: ASbGncuC+U4qxNtjHQWX8uKMC9MKyGLXUDTOBVSINoROvCZzxmO1PmpHKjI/6mGfIrU
 5muzmuF/t2yr8Ll9wVyUH4jA+dA8f5XU08AcRPDWUS2PIHpPM5PBVlEZGY929JYGwN+uUFwIZLL
 4E8lDlFrT6lcKxR7xHVBFOkHHJAbb1/3x5BHkcGD9zkI17vSy9dLW/dhCgoGaL1bWJCPLD4Kd86
 CrjWZ54ihymkXBPt39UkUV7LcnISzIJPTAZuskgq5Y1/iuo+5eVXu7axKlAnyWLTtyOcl+kS2b9
 ramM63GnIIT+XEFMLnUFd8s94H7JO32NO0ltcmzj9RBY4Ypy+4+wH10xXnW8kikhpUlG4YAYLfo
 8GHn/1M32TFVCxfUlt22rgmYZ3brr8c1Lizj7PxTInf4TcMc=
X-Google-Smtp-Source: AGHT+IFDO75FNxA7H/3cx6TxNytQ5nTasFHH2VADHxcGpS6udD27t2pdITwUdx8KtTgpnn4oenH2VQ==
X-Received: by 2002:a05:6a20:3d0d:b0:243:78a:82cc with SMTP id
 adf61e73a8af0-2438fad28e9mr4141669637.25.1756262225351; 
 Tue, 26 Aug 2025 19:37:05 -0700 (PDT)
Received: from [192.168.0.195] ([144.6.121.55])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-772093cac4bsm303493b3a.12.2025.08.26.19.37.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 26 Aug 2025 19:37:04 -0700 (PDT)
Message-ID: <540d4897-df84-4ff3-beaf-059af914d5a4@linaro.org>
Date: Wed, 27 Aug 2025 12:36:57 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] tests/functional: Fix reverse_debugging asset precaching
To: Gustavo Romero <gustavo.romero@linaro.org>, qemu-devel@nongnu.org,
 alex.bennee@linaro.org, thuth@redhat.com
Cc: qemu-arm@nongnu.org
References: <20250827001008.22112-1-gustavo.romero@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Content-Language: en-US
In-Reply-To: <20250827001008.22112-1-gustavo.romero@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::430;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x430.google.com
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

On 8/27/25 10:10, Gustavo Romero wrote:
> This commit fixes the asset precaching in the reverse_debugging test on
> aarch64.
> 
> QemuBaseTest.main() precaches assets (kernel, rootfs, DT blobs, etc.)
> that are defined in variables with the ASSET_ prefix. This works because
> it ultimately calls Asset.precache_test(), which relies on introspection
> to locate these variables.
> 
> If an asset variable is not named with the ASSET_ prefix, precache_test
> cannot find the asset and precaching silently fails. Hence, fix the
> asset precaching by fixing the asset variable name.
> 
> Signed-off-by: Gustavo Romero <gustavo.romero@linaro.org>
> ---
>   tests/functional/test_aarch64_reverse_debug.py | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

