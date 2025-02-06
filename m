Received: by 2002:a17:505:32ab:b0:1be9:327d:8ee3 with SMTP id js11csp1694643njb;
        Thu, 6 Feb 2025 09:30:20 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWgNnBEDvj1ywp6769KlLzZCg0HTVXPWz+hofKnK9z7oeAnxGgbjnH/0HaulrxGkXbMtl8UW/j//F920Q==@linaro.org
X-Google-Smtp-Source: AGHT+IGOk4qs1p6N3UWy7EtVSUlEFlnfqr/VjR0crLINxI7LD+fPdB1v4ROzKuYQR+o2XCPuurbY
X-Received: by 2002:a05:620a:4509:b0:7b6:d70a:86d6 with SMTP id af79cd13be357-7c03a040713mr1230475085a.36.1738863020463;
        Thu, 06 Feb 2025 09:30:20 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1738863020; cv=none;
        d=google.com; s=arc-20240605;
        b=cJm6h1A0l/rRHlsaqx2eonZ3WA3MPeYue2/ZtI594oSxD6OZbfe0puCNWsVpx3T5fx
         uns57cs2rY+tUcxLpHpvAiUaM1OdtBI76KTYZ6vFdwJz5H+sJoTR2AIsMzsagSTnOoiE
         qPKKX9wICvwnY5vhkgXYIy3CXdDkatlDAce0121hlaM18StmnMPyiq3965uorLK5zRJt
         oaVQgo+GA5B7wDtdMk+0PqsYj6C13GCrm0HhovfgYb8lc+ZG7DOJnlesJCCBm+JGD826
         YJ+qyD2mO31y2Zl7mlGWFwE2phbYA+8W3CbR4UXktlTi/+Oja6bwYjKyewyyrBgsE9m+
         HSEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=Q6m7e5WkjKXqAzgBYgPTfbRSg36ajEe8STBwhv4A5YI=;
        fh=uu8epp/FqKo/+5aWcIjJKh+s3lq1uuQurWEC7L12/k4=;
        b=Yesdj+5G1VXslihthCkoYnpOSYfit5c1mpDrdDzV5MqEdy1HNmvhielmYdkD3C1FiM
         Up7pebpZZvAD0k86e7lItr8M/bOvbDhXbWKQv9RTOgSK8l8Xjd3z6/HQ+4/YOIa+FVfB
         8cQLl/ilerO7QqOp+8U7cihgmqNaG6SSUwsp0xsSzjNMVTtwugn024h4EremIxDYAtqq
         4Vmr4YO93N7ahFkXukkbfcT9Jg32iaX4/ug8eVr5/PIJYVVgi6xt7QtqEhRNaXD4pTCk
         9S2j2L/kFLMtyFMmWfhmXLhTCXJ59WoMnXaN0XOkgOtKo7KbUBlgTP/X2VmliBycr4Ia
         trvg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=niZum1Dh;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7c041e0a274si155927185a.175.2025.02.06.09.30.20
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 06 Feb 2025 09:30:20 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=niZum1Dh;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tg5hj-0008Og-F7; Thu, 06 Feb 2025 12:30:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tg5he-0008Ne-Lp
 for qemu-arm@nongnu.org; Thu, 06 Feb 2025 12:30:14 -0500
Received: from mail-yb1-xb34.google.com ([2607:f8b0:4864:20::b34])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tg5hc-00023a-R4
 for qemu-arm@nongnu.org; Thu, 06 Feb 2025 12:30:14 -0500
Received: by mail-yb1-xb34.google.com with SMTP id
 3f1490d57ef6-e5b1c4b952dso1006859276.0
 for <qemu-arm@nongnu.org>; Thu, 06 Feb 2025 09:30:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1738863011; x=1739467811; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=Q6m7e5WkjKXqAzgBYgPTfbRSg36ajEe8STBwhv4A5YI=;
 b=niZum1DhaZz7vGQrXVmJLao1LQHcAvvKuvbLNuD2C+L7QDo22DslEwwrfGdLKTUM/7
 F4aUrb86U9OxX627ygaIqdONgv/R9EEJ01fnlisNlCMFpUyBoYmfuJA5sjIT5sx3XmUN
 vbimZ3nx5lsQlFOGwFhzJWTdg6RqoG8DOdugK63YA9k4vSF5rpREhfhfPd6gAmROynA3
 t4S5Bjkh/vFcCip1HLpuyXwa0hVdibvGm9jQMTsacIP8FdzyrZmze6wFIPQOKP++SgIX
 RC3AI3Cuu7DJjUEQtq2HJt8en72Tpu84jxUpXxIGtCMu3FcNX6ePXkQxjWpDoSkbLohD
 gWDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738863011; x=1739467811;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Q6m7e5WkjKXqAzgBYgPTfbRSg36ajEe8STBwhv4A5YI=;
 b=Lv8UKtMkMwZ9Xz+8k+BY96YqqXx9oD19MRR0GVByDCScBcFGEAbA+be6cSSmYXNR0s
 pZaxrl+kMQxRIXXP9xK/5p31CbaEvP6H2CNKJjnWvd9eUljo253KsFvQ+7vxIJKPnu4a
 0BGFrBkfbQpw5PlFIzOLxEvi5OdyjwA3DVMsUP1MUW++zFIEtqU2ulWftg0U3jrHkAcJ
 52BM5XwY4CHclTidg5hcWfK5x0rGofWpXyACIjFLsDGk9ZectU0pbpwdFYZSdq3C5cX8
 6PktZ+GeLUSTkgYdR6AoKBchwepJ24GsoiB6AqD07NUk8n/dZRopPKUlmQP3QpszBK6k
 iGeA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVsgoVxKunq7lSVARczMvrQbL/45ABfGdrH6aeQG5CVYbXwupFVIudqQGaKh8Bi4n6Hv/Ubhoa4SA==@nongnu.org
X-Gm-Message-State: AOJu0YxA7yQG4+GBrIbPIvtv7lU0RFGVBTVz2/YWiCl4H/4Z5qUMKel9
 Ve/HCl/W9h1qkSt3Tf8E8mI2f+5wMbrpSZYU+2EwF6Id8eqvyWI60+JN4CJLaYpAYz/cQadFHJJ
 9DPEgdXsTpkzI8xwpZ4fi6psxoAbm1ZSVyzg/ylJJPxhStYdE
X-Gm-Gg: ASbGncvGInoXPVd+GIXXQo2S00WbJvclRmiiluh5GeQrn4ma/s1Ps5gK+BZ3G350lzt
 5AJW82FbQUFsgJphwuQqpKHUinaU4lH4vB87xk85bDK9bXUbFJYIHQdghMVAglU1DTQyzX4SQoQ
 ==
X-Received: by 2002:a05:6902:15c2:b0:e5a:b05e:4da5 with SMTP id
 3f1490d57ef6-e5b25c1431emr6154603276.43.1738863011519; Thu, 06 Feb 2025
 09:30:11 -0800 (PST)
MIME-Version: 1.0
References: <20250204092112.26957-1-shentey@gmail.com>
 <20250204092112.26957-15-shentey@gmail.com>
In-Reply-To: <20250204092112.26957-15-shentey@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 6 Feb 2025 17:30:00 +0000
X-Gm-Features: AWEUYZm42NKXchJXoEJvQl-vwwIzttiaru7ReU2Q-WiY6NoWEfSNZ8Bxvp52CbY
Message-ID: <CAFEAcA--TOmLJaJR98uhk+tSuZPr1eZKqsEwf2wPRAW1ypSncQ@mail.gmail.com>
Subject: Re: [PATCH v2 14/18] hw/arm/fsl-imx8mp: Add Ethernet controller
To: Bernhard Beschow <shentey@gmail.com>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, 
 Andrey Smirnov <andrew.smirnov@gmail.com>, Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b34;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb34.google.com
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: 0Ng0GmVhPfSG

On Tue, 4 Feb 2025 at 09:21, Bernhard Beschow <shentey@gmail.com> wrote:
>
> The i.MX 8M Plus SoC actually has two ethernet controllers, the usual ENET one
> and a Designware one. There is no device model for the latter, so only add the
> ENET one.
>
> Signed-off-by: Bernhard Beschow <shentey@gmail.com>
> ---
>  docs/system/arm/imx8mp-evk.rst |  1 +
>  include/hw/arm/fsl-imx8mp.h    |  8 ++++++++
>  hw/arm/fsl-imx8mp.c            | 24 ++++++++++++++++++++++++
>  hw/arm/imx8mp-evk.c            |  1 +
>  hw/arm/Kconfig                 |  1 +
>  5 files changed, 35 insertions(+)
>


Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
