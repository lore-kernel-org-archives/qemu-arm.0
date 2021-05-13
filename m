Received: by 2002:a19:e20e:0:0:0:0:0 with SMTP id z14csp782417lfg;
        Thu, 13 May 2021 12:34:07 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy7I5yGIb/OgXOaT0jdr76jX9UA4PJ6+mpeizUQIKDzJdawphwx1zj8SP/d+0XCZo6Lt5V8
X-Received: by 2002:aca:ab50:: with SMTP id u77mr10775206oie.153.1620934447263;
        Thu, 13 May 2021 12:34:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1620934447; cv=none;
        d=google.com; s=arc-20160816;
        b=Ef6jl8wxfesOuWf2ZlJVlsX7DGJcUNv6umEJ3izhYPzdfNenVquO2Fc9+xe61dZGeC
         Cov5im4ofyW6Wi9d2Lh6Q6kwS81m1B+6P6SjsCRdvc1PrM3it9Pwd5Sarohh5ZZLnS8e
         jIjgAWP9a01WBKp/jx4i5nFebUwzClKYsRwvUgORNZnX3L6aW6ZyTcuYDEo6rgqHTACg
         gZfw5vgaKBhBGefHfXXrHu1lhkw+RB2MrV2QcrozD+Gf7y1zg3x/LHJaUthLUieRJNIW
         ElliFlo/NNt7d/8BHXHyKA4uUUhGTyjGHKxl/NKznGZaoWpivJMmSDGgUXIfUUUkyAJZ
         RxdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=42iItySau6MSPOAIBGtD7QOJ0jV0uP84/eMt9gv/qsw=;
        b=hvKgl9lNoMzM0pvfzZVCoDydm7XjVspwNGbNQWNzFYOMxVoEH35eNfTqNQrlsZUagi
         8Prv6NOsffKqfslsB+Xa15bEf1EcPZ33rpiVFzxBqiy8hG80Y91eavB/JsAmeY/yk0Fw
         J4GHNYQoBl0t5FOVyQ1GcFWt/mYBXQw2N6N0KwCB8QiNgY5odgW4ER+XtVM3ItWJXQi+
         VvUiTGtSTgTQOWroQvgqNRK4ArkhFuZXTCGRmOj2RbbSIdAYrG6OLMUQSxKAMpD20RF+
         UhvVkwXS2w4CtyLLCLyfKdSe/H9VHxPZIA9D8Wu8EwfacSW4JCjahq+XVwQxd4BIp7uZ
         pmNw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=tmImfZl2;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e4si4494948oth.114.2021.05.13.12.34.07
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 13 May 2021 12:34:07 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=tmImfZl2;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:50372 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lhH5y-0006u6-IK
	for alex.bennee@linaro.org; Thu, 13 May 2021 15:34:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50142)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lhH5f-0006QE-QB
 for qemu-arm@nongnu.org; Thu, 13 May 2021 15:33:47 -0400
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d]:44845)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lhH5d-0003c7-8I
 for qemu-arm@nongnu.org; Thu, 13 May 2021 15:33:47 -0400
Received: by mail-ed1-x52d.google.com with SMTP id t15so4538310edr.11
 for <qemu-arm@nongnu.org>; Thu, 13 May 2021 12:33:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=42iItySau6MSPOAIBGtD7QOJ0jV0uP84/eMt9gv/qsw=;
 b=tmImfZl2bKPvr8GRPX4XrU/0ohShP5o4DPdQKArHviq1Gc7eC6lcgwRJXksXf63+e3
 IELE8q0FfbLpwL6tfY4nq+Kvtnpqp3M6lLSkOhxFQEpnN4Rl3KGbkBoZZ0oNeJi9cG51
 9+JlLDRtrXxYYTlEeGxzYjVciHzwR8WViqutAaIZPTFQ6hLOJVvRDHnXuABhV5xPeBh2
 lBTnskcBIxtmksguqGUk01BOhMjiAuWk8wTAMM4JCs5Vp6D8ytJ2TiqipiVQzyYuvLnC
 N7lsDaqS1KaLnQiK8hjyYw3ISjXFJSn193r6tbn69MdfdWeIRsyG810Ci843F8L6+bRd
 NtAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=42iItySau6MSPOAIBGtD7QOJ0jV0uP84/eMt9gv/qsw=;
 b=eowmRsYVsI9QOW4FMidqE1BUtDpV+dxLi43Gjg//o+qhSETSRHcqGZ03+/bnTQrJDf
 7gDLvDPwwIw3q11Cf+jDKUJntx/ga2WxSN7eXzUP4BAndNfHSiUoT85Vc1/5AGWcKua2
 KToajYGMaZgZHwy0Dlmx4F4vSobOzOvW4u/LHWg4YYeyBWW1jizBIf8owsOPydF1o6sx
 w0mDrjwol5yKEiVpnNXXwqK0LdIwoaIXQppA7MJpdH/ytVHYAYn4pnLAZMuk+lbHx4u2
 yW7S+u4EnsMS+8UyA3DHRJj94Jofkhq0hxY2lfx2Tivn9L1oK7KTXutUoRquFcK2IbO6
 0LTQ==
X-Gm-Message-State: AOAM530V2UbySVgGFv+mwFXoDOg+rZATnP7do43udserLRT7MA+TUVcR
 MqYq++hrk84XOprUKbLFRl/qT4HL+ioKdHVRaM+Htw==
X-Received: by 2002:a05:6402:19a:: with SMTP id
 r26mr51359550edv.44.1620934422947; 
 Thu, 13 May 2021 12:33:42 -0700 (PDT)
MIME-Version: 1.0
References: <20210430202610.1136687-1-richard.henderson@linaro.org>
 <20210430202610.1136687-82-richard.henderson@linaro.org>
In-Reply-To: <20210430202610.1136687-82-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 13 May 2021 20:33:31 +0100
Message-ID: <CAFEAcA8S47Vh55p57f2hpMMwnf=GK1-SZeZ4gBVX6uvNzPg9-g@mail.gmail.com>
Subject: Re: [PATCH v6 81/82] linux-user/aarch64: Enable hwcap bits for sve2
 and related extensions
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52d;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52d.google.com
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: tTx1ayYkfHs3

On Fri, 30 Apr 2021 at 22:43, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  linux-user/elfload.c | 10 ++++++++++
>  1 file changed, 10 insertions(+)
>


Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
