Received: by 2002:a17:906:e92:b0:a3e:79c1:d636 with SMTP id p18csp2158051ejf;
        Mon, 26 Feb 2024 08:20:13 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCW4oJad3nv8gsj6Jdm/J0Uq4DnTG3wB4SzOvLeGuega9FesXWVMO+taV5osHvyHQNrEADaNj329WbPsHaWWa5t93ttaA6l7
X-Google-Smtp-Source: AGHT+IGkYAwNQDjdiULXF2pjLVeJXO7Z1yAg5ZaYKRpWP6mvEhZlMeQi9xACnOM7PwlYtoBtJ3hX
X-Received: by 2002:a05:620a:145b:b0:787:7ec4:ead with SMTP id i27-20020a05620a145b00b007877ec40eadmr8235797qkl.39.1708964412831;
        Mon, 26 Feb 2024 08:20:12 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1708964412; cv=none;
        d=google.com; s=arc-20160816;
        b=jH1a8ENQRSVsbrl3bDPQ+Z0kX1nXEo7qMfJOqHmk4RFcCCVBmMiQuh+xvWeB6ca+j3
         /tKGVmSgmK7gLY88sLTmPUIs3skgI8d2dMsluRjdYVSY0ghe3eWlkgbIRQalVLgWhwdT
         lhz89WzA2DS525uGdIWNnm6y+lxxQ9yBFZ9Zf2MIuiEdPZQZC6b1Ln7VYiEC7j2IYY1q
         ERn1P8SlK8JvQJh8MYwUo8klBYQ//iG/K9ceRFKLDNmckJvJiJj/myHfEgfxz8haBMAl
         6UOYrNvwBDzMuptJFIN+rRHC4Q7JKyUx1fIpO1wxjzStZnBqRc1ATE9px6fNJlTluxME
         rzyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=+tLwqQUXOygN0IToXUe0UPa5F59lxtKfsMeguCfpxiM=;
        fh=gdBed72JnSifzQdV0PLkUCrNnp2PjbNCgzXbyzmTG1w=;
        b=lX2QqrG9sOYnZQFH9D60JkLOIca/zWgv3Is4bmMbrY8gBflfc2EqbU+hMLMMV445se
         QPaMQ/t6QH/kDIZLp+Yqwd74IycKNB6J5DbfrWjAPj8LMOR4ETwGTWlV2KMrblQ/A/tO
         o7smCzD94ahJ9SuaNtl5eY38AQAPX2VDFmHz9vAVGvJGW42f/iWTgXW6zzGg5/cn03Tq
         kMV6Pg9Oa9btC8YxeooYsReqt92ZFO/nnMR5vx+dNEFMEyiQHtaZ1yYE8LK1u0aTaWai
         JrWhlAWpDYnI3uygJbkqCtHlnLYu71iuYTQ/eE8uDpieQpyQ3NtXbegHlKtK5rO+umt3
         3njQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=KubF9kc7;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id xz23-20020a05620a5e1700b00787720524f9si5282017qkn.124.2024.02.26.08.20.12
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 26 Feb 2024 08:20:12 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=KubF9kc7;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1redhr-00067u-Lm; Mon, 26 Feb 2024 11:19:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1redhq-000676-4q
 for qemu-arm@nongnu.org; Mon, 26 Feb 2024 11:19:54 -0500
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1redho-0008PJ-Nq
 for qemu-arm@nongnu.org; Mon, 26 Feb 2024 11:19:53 -0500
Received: by mail-ed1-x52e.google.com with SMTP id
 4fb4d7f45d1cf-5648d92919dso4275250a12.1
 for <qemu-arm@nongnu.org>; Mon, 26 Feb 2024 08:19:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1708964390; x=1709569190; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=+tLwqQUXOygN0IToXUe0UPa5F59lxtKfsMeguCfpxiM=;
 b=KubF9kc71w45iEYQDoGbap9Kxzf7C//rMyoyl5Ak2Kv4QYYD6dDsDyUgRYvEq+S9Y8
 G44iFtZyzQOrka2+Inslxh9X31a0ba53JjLmYI7EWOFcKIDSxlFkS4IU2JGKXefjCBBL
 4FHx3HnoCNS/f1/kgerK5A+gz83m3Xn437VKP7b8nrMDgyveKp7jTp7Nyu/92BOm/V5L
 Yjt3A/ufsmB7DvUP1OK6eG8093jTFzckcP4fFlSeCYr0ZHMU3cpCTI6wzE2x2jMDJiTY
 Mo7V3SV+8dOXxWojL0rRd6EvfTygHuqv943lhcxc1PCO2ye4KuuhNX1hAGsZbq+MnNa9
 D52w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708964390; x=1709569190;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=+tLwqQUXOygN0IToXUe0UPa5F59lxtKfsMeguCfpxiM=;
 b=ZAXGLYjFhl9+X5YrtmyQLcua4wTx8IV9iIXYJwubcnyJw13R7NJps6tYKzhFYjnWZU
 Hc5kGNb2Va0ADjYIPQ2hCoVwiqEHT++09eOGR2NwMxwTGi1ucxU287pZzJ0G8EVE7Dfn
 k0NrC3Ib67t9eF85Pu57PE8+92fld6d0GfcAiR3wj22CLjEXWirMpACNjZCBz9siQiao
 GMvP6NYhQ6GrDO/w1PuDQm9QmPmPrhTBWeLqJmR1a7L08aTC9ZpSgwJXGHB1mLJp0IQO
 qQX3tyqXz8f6r1w5jIef5AEh5OwOXs4HHwS+fbNSxZI2EIRDfJ3D8AYm8m6sB9wb+xcX
 y1Dw==
X-Gm-Message-State: AOJu0YyWqdeSTM9/Z/sx6BS40DcuR1QAtb/5cwktRCB/uRIsJI3Z/Bp4
 BH+0wKznHNr61DAVicClLCiTZPTxCmJ8xsu/Y8KAGTy7cQZhRKYcW6d+bAAaP6DtrYL62W5EJ8P
 +bQJxuVchFpXdZDPjAEfxDLDlgMsHqrY9DireBQ==
X-Received: by 2002:a05:6402:643:b0:565:1780:9398 with SMTP id
 u3-20020a056402064300b0056517809398mr5102351edx.39.1708964390291; Mon, 26 Feb
 2024 08:19:50 -0800 (PST)
MIME-Version: 1.0
References: <20240226000259.2752893-1-sergey.kambalin@auriga.com>
 <20240226000259.2752893-19-sergey.kambalin@auriga.com>
In-Reply-To: <20240226000259.2752893-19-sergey.kambalin@auriga.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 26 Feb 2024 16:19:39 +0000
Message-ID: <CAFEAcA_Wkzxx4swxK5aBBNdxfBAE3GtgoCPRMYvtTw5AN6oEMw@mail.gmail.com>
Subject: Re: [PATCH v6 18/41] Add clock_isp stub
To: Sergey Kambalin <serg.oker@gmail.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, 
 Sergey Kambalin <sergey.kambalin@auriga.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52e;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: 5ufw+Strny3u

On Mon, 26 Feb 2024 at 00:08, Sergey Kambalin <serg.oker@gmail.com> wrote:
>
> Signed-off-by: Sergey Kambalin <sergey.kambalin@auriga.com>
> ---
>  hw/arm/bcm2838_peripherals.c         | 6 ++++++
>  include/hw/arm/bcm2838_peripherals.h | 1 +
>  2 files changed, 7 insertions(+)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
