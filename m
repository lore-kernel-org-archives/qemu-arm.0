Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4623DC83F1B
	for <qemu-arm@archiver.kernel.org>; Thu, 10 Jul 2025 17:20:33 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uZuwa-0006Cx-DV; Thu, 10 Jul 2025 13:20:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1uZuVq-00023n-5k
 for qemu-arm@nongnu.org; Thu, 10 Jul 2025 12:52:46 -0400
Received: from mail-ot1-x32d.google.com ([2607:f8b0:4864:20::32d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1uZuVo-0004ge-JR
 for qemu-arm@nongnu.org; Thu, 10 Jul 2025 12:52:45 -0400
Received: by mail-ot1-x32d.google.com with SMTP id
 46e09a7af769-73ce7b40d7aso646744a34.1
 for <qemu-arm@nongnu.org>; Thu, 10 Jul 2025 09:52:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1752166363; x=1752771163; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=AOCKLzvgwyRaVbXc8OUNg3LrwEOBU5DsNKJaUBhRM1E=;
 b=cWX2BCwf6SQdF9VFTPqs754zgjHmeK/Awfmi0WVRjbMXtW8F5kcIuPxq8GwwxP43/Z
 JhnFBmRoc/ATO17lt/vGSqiWvRf+tLcvXI/OQJ87XJO7j8unnEdlenLRSu0GbRH3bsNa
 A2TuZ589LHbTv3mpvE+BT9ERp/HhLpGQcBHMb/Vv4QgxIEesehMMXfb6ptHSkC8qpBXU
 zSRPbQ/4qkHJROd+WhjWuULse1mFXqIPAWSnXWHu9NiWLVbYhe1xryJ+2uNlPw/wSqUs
 3TR+nYOECIrdTO5IDek12Rdi9PoP+/ITREVt8hOTgvQ6OSYwp9aoSIQJgdLhBCAIJSTr
 TORg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752166363; x=1752771163;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=AOCKLzvgwyRaVbXc8OUNg3LrwEOBU5DsNKJaUBhRM1E=;
 b=YEUh2Cy80k59ftXI1OXOFOVVeOTE10T1v2FP+3lsw2H05NunNIooDaMsFTwpEVMSvR
 jLB0oM0zOQOoggWtfOnF2ReoHfJ0kMp6egt6al+Y3pcUsSrzmE/SrPNm+CN1vwul2CIA
 TZoe7J5LpmUR7l0Y2YJtDHrDnDW7YC/7XLnfLcbhtuQh7G4GOPh5JynHgDSBNYDyoCpi
 9n39YBm92KY6EvW12v9f7zGOwohuZEoDBCBx5Ac0v3H5oX++dqAxQ/9e1b9nGqbQebwX
 b9w0Qh4EQl9tiHw+u0XBPJ8tUMXvtb76uJM929K6NmjPhmEHKOkkojPkJT36rx64Xc2Q
 CdTQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWUk0wZhcVtrwhRnPhj4JioSKaIOfn/4lz9gGz0BvnQERBzE0jj5MqonMlKAJHWkKrgT38t+cZmoQ==@nongnu.org
X-Gm-Message-State: AOJu0YyLOR2zyfm+0u5sUzJU3qzRXC73XM0rHQAIWCargAtDjH+JFKOu
 Wg3YUZMw8ZJSGpKfU0ElEdJsado4BW2Kp7Tz3z+rWyPpkZOI+053X0xRYs2kzhyDC01sireaaQg
 q95F0cuo=
X-Gm-Gg: ASbGncvrBunkVq7X/Hyu223uFfGpm6Z6+ym8Rh0g/Cg3lHm5LiKWibxJhBrP2E2GQtA
 MygMQCiLaHoO2XOhJ3oybW5bGqAKxL8rzf441kGDKMNPES+gJRhy4if8dJb3xefDKOYn/IMTvF0
 vQ+1G2XymNYDkqTgBT9HaYSnQMqXyjaCYLCqjH7FhJ2TGVpWWjcTDLZPUFF+HVUrwwbAZXB9a5a
 zyU3CDIry8rP2JY6F8bVjC19LiFnuRzhhZdp3P9u6Wf1Ba+4H3xVzGez07RLguv2N3HEXqj79Ay
 vGFol8E6YhI/PQzYS0oPgzuUM5b9XKlE5Nb+0UZ/NGBfzwAS87y1DQ09rpVajcNJLI+qEc52RJI
 lGhg=
X-Google-Smtp-Source: AGHT+IEn00vcDeUbeBiunbkstGsyHzcrN40DrCEH+0KmljO8SmPVYTFG6/wg9urg61X2H9hXwBPjTA==
X-Received: by 2002:a05:6830:3101:b0:73a:8a05:cd3d with SMTP id
 46e09a7af769-73cee93825cmr2958245a34.0.1752166363158; 
 Thu, 10 Jul 2025 09:52:43 -0700 (PDT)
Received: from [172.20.0.130] ([187.217.227.247])
 by smtp.gmail.com with ESMTPSA id
 46e09a7af769-73cf108a6ebsm265504a34.15.2025.07.10.09.52.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 10 Jul 2025 09:52:42 -0700 (PDT)
Message-ID: <47434f4c-a47f-4995-a434-01c043a023df@linaro.org>
Date: Thu, 10 Jul 2025 10:52:41 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 4/6] target/arm: Add FEAT_TCR2
To: Gustavo Romero <gustavo.romero@linaro.org>, qemu-arm@nongnu.org,
 alex.bennee@linaro.org
Cc: qemu-devel@nongnu.org
References: <20250710163858.1094780-1-gustavo.romero@linaro.org>
 <20250710163858.1094780-5-gustavo.romero@linaro.org>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20250710163858.1094780-5-gustavo.romero@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::32d;
 envelope-from=richard.henderson@linaro.org; helo=mail-ot1-x32d.google.com
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

On 7/10/25 10:38, Gustavo Romero wrote:
> +static CPAccessResult tcr2_el2_access(CPUARMState *env, const ARMCPRegInfo *ri,
> +                                      bool isread)
> +{
> +    if (arm_current_el(env) < 3 && !(env->cp15.scr_el3 & SCR_TCR2EN)) {
> +        return CP_ACCESS_TRAP_EL3;
> +    }

Still missing the arm_feature(env, ARM_FEATURE_EL3) I mentioned.


r~

