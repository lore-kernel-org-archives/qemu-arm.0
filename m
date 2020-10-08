Received: by 2002:ac2:4c26:0:0:0:0:0 with SMTP id u6csp1221834lfq;
        Thu, 8 Oct 2020 03:53:22 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwqv7l0bq2YP0XE9NewTZP0Hya04x7LSFdQ1wYvwWnTTZlvdy/8pq64tDPHZ5g6BlG5WqOP
X-Received: by 2002:a25:705:: with SMTP id 5mr10331038ybh.239.1602154402199;
        Thu, 08 Oct 2020 03:53:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1602154402; cv=none;
        d=google.com; s=arc-20160816;
        b=XEkyFBiMCk1Oh22NHb2+HDhBRyO7FQNgGCA4MJOIcMI8hCYb+CjSHOaiVkKulmG3/K
         t7IiwISm4N6sc42xTEr8CmbY8ZJQqDryO+7soOljMP1+AkTpOhS4qmpFtX0tOh+1N/Lp
         /nwIgXxB8HkxYH8JoWzFNbzsavOZ5+OcloHH/Kt0NBPkHgtNsgsGNCUo+kfyzqjTbWMr
         pC0N6GhuNk/00vdffqMGi7y0zc7GyIZhtN7s0jU8vSaNfsNMVdJN4QkLg8Nxc6PVffYs
         Ofy5ZNzI3w6LVyi7CplkOvk8VD8UTg8UiaDD1CZU0r7SHecPHp2XupokoZn8gT96mMG2
         oRrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=P/L2AJxkh/7mOAakV/ngtfO8L7gKMlV7eFU2IyI1ul8=;
        b=H9VVpDG+IDRMeGheqqbaTSb376W4gN6WIMY93F5e2cIRf74C9LheP3X4q1M3+bvbFD
         HTUKHLUPS0QsrxDdDkvPgqH57OtizDA2NrvTUnEfazBTDKz/iktz7Kq9By169HzkYRTu
         BcUUtBFTnqF0ug7Q97NQk/7G3wSy/uhCKq0ujiv2BzzDNDvjn6I1ZBtXU0rq9kzdhVyc
         IOba6b0e6QjTJY5h7vY88lHG0srKEVlOYMV5TXaImbMddLvDsjiAkLC9tQqLKIowRWVt
         nUIYfk5GBXjfbCU4E3QdGbnpTI0Y5A5KS9oQ/VY5KXosQVf5mFAm1VspQf/hWVImGSow
         a/4g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=ojvy2QD1;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t5si4305239ybf.296.2020.10.08.03.53.22
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 08 Oct 2020 03:53:22 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=ojvy2QD1;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:37024 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kQTY1-0001Cu-I6
	for alex.bennee@linaro.org; Thu, 08 Oct 2020 06:53:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41292)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kQTXs-0001BV-6l
 for qemu-arm@nongnu.org; Thu, 08 Oct 2020 06:53:12 -0400
Received: from mail-ej1-x644.google.com ([2a00:1450:4864:20::644]:43943)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kQTXp-0000BF-6U
 for qemu-arm@nongnu.org; Thu, 08 Oct 2020 06:53:11 -0400
Received: by mail-ej1-x644.google.com with SMTP id md26so7414176ejb.10
 for <qemu-arm@nongnu.org>; Thu, 08 Oct 2020 03:53:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=P/L2AJxkh/7mOAakV/ngtfO8L7gKMlV7eFU2IyI1ul8=;
 b=ojvy2QD1t75wqBXL3O81r6wTWNops1BVCa3oc6g1H+VT2DFItLbuYNcXsEYJBorWl5
 nv7S9TexYYnXl/ktjRuiYRuQb/FX77x3mSQOPCuTmu8mR6wn1pM5T32Rr0WZRJLihIYj
 lnpnVt6k2oUT5HR3lhKa2RhGRqqpFF7xjShwKNnumBXMj1T1N5gIujZZfq06MTyhPaPS
 yVuGYI+yCmsEQyjbZsfqNPXuTq9NK/0wX0tZ5COY7HMw1VbjzagfFKOBvSIXeQjv1jvh
 PQZ7pr38p6KV/2t5L8/JLFts7/B8EL6T+LgIZgbW8sN40Pfv2+tJxhVTNy+XKw8GPBbP
 2H4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=P/L2AJxkh/7mOAakV/ngtfO8L7gKMlV7eFU2IyI1ul8=;
 b=h2S3VFdt5L7dfmKxdzQOFK5IqUzOzsnnB687WWYYNnMXbgVsIpp8IZlABVSYRGwH5Q
 zRb7j1PfWlyhKgMgwRulWuK7KDjYIiTpX5EneRa2LV4QBLbekbBnhYZQoMxXTRBp1qYB
 VoYEZIyfMZfXPIhvsasnDpFZVMQc09a73r7ZpOm0xzsphoaXaPmlCZDLgsByf00cnGtL
 rAMr2udcUc+8CqOEfLljK332mj25AaOa70O1syv+hMF/Ctmu8vIf2fogMxQ1qUersFJs
 Gl53I/hrGj7eASauaPzghTDONNWO1WtsnhIEu+cTCHR4y09t4cBGPjVIocSdWqz4MqWN
 za5Q==
X-Gm-Message-State: AOAM533K5CJ8tY2PgQzWYGe5SVj/RVonqXcTKh0+mwL+MTnZ7Pk9OdXk
 7wvzC0CvcYA5clEFEUk/9nx6wASIkG5cNG7g/mxzgQ==
X-Received: by 2002:a17:907:4365:: with SMTP id
 nd5mr8336982ejb.56.1602154387427; 
 Thu, 08 Oct 2020 03:53:07 -0700 (PDT)
MIME-Version: 1.0
References: <20201007100732.4103790-1-graeme@nuviainc.com>
In-Reply-To: <20201007100732.4103790-1-graeme@nuviainc.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 8 Oct 2020 11:52:56 +0100
Message-ID: <CAFEAcA_P=u7DXLTEZpAQmRvqt7yNNiPNMJ4GTBwUJ+dBvAUKBA@mail.gmail.com>
Subject: Re: [PATCH v2 0/2] hw/arm/sbsa-ref : small fixes to smmuv3
 initialisation
To: Graeme Gregory <graeme@nuviainc.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::644;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x644.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Leif Lindholm <leif@nuviainc.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
 qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
 Radoslaw Biernacki <rad@semihalf.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ZjNe44EKr2cu

On Wed, 7 Oct 2020 at 11:07, Graeme Gregory <graeme@nuviainc.com> wrote:
>
> Fix two issues with the smmuv3 initialisation, first where a previous
> patch had transposed an i to a 1. The second an assumption that the
> IRQs allocated were meant to be unique and not 0 based.
>
> v1->v2
>  - split into two patches
>  - previously sent as v1 post split by accident, resending for clarity
>  - added Reviewed-by
>
> Graeme Gregory (2):
>   hw/arm/sbsa-ref : Fix SMMUv3 Initialisation
>   hw/arm/sbsa-ref : allocate IRQs for SMMUv3
>
>  hw/arm/sbsa-ref.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)



Applied to target-arm.next, thanks.

-- PMM
