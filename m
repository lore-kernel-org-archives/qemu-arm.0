Received: by 2002:a17:907:270b:b0:a66:557b:2f6e with SMTP id w11csp134022ejk;
        Thu, 30 May 2024 03:31:12 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXOsy35qBIpazbQdCTDAeKof/ZVh6S90Ju9M0BNVfUuyJxYeM7Re0ir/AHwwMrNXIneMq3NVpTVbDigZVbEaZaNjUMDN0X2
X-Google-Smtp-Source: AGHT+IGErdhi979NZGcKRaD8y7jjaduQJU95nnTwDTqHdSysu0nHITOo9XFsYPxF3XmWOxhPZE5E
X-Received: by 2002:a05:6808:1a0f:b0:3c9:c439:bd2d with SMTP id 5614622812f47-3d1dccf072dmr1993119b6e.43.1717065072503;
        Thu, 30 May 2024 03:31:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1717065072; cv=none;
        d=google.com; s=arc-20160816;
        b=R6Q0hxvVzsjy/escAk8XOTLmb7FMt6sJSN2Q7A9aXMlTzGy8jFpX8j8buKD+o23yZA
         szwYGKbUBZ31HwxoJVRO5GPKFYT8rJ/7tLAUs440XfqaWSXFueeGwsTmfJu8T+sM4U9r
         G0cbsgeGm+lPajIWYBuZbj3TfzJpvNQhteBIQmeoPt69TGU1ftUOwh5U6nKM0scOWFPp
         sVAqAfHo0HjG6kXJ4A/MgSBkSBUIsphMdOf04I78AJy/XqJs0FnpN9lj5MTnbKz4CxB7
         E2PXeWP0ooXDPDtlGqxYyK+YcOfLKQ3YsoOLeq897F+nHdHrjA1HNQ9VVNgr5ncxJ2LH
         zh+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=uThypw/HPvw4P8WDz2IRhO+g65TKOdufmMLi1ChnOkU=;
        fh=tlsJP1+/ae1RfCzW4DZFIj0ce0WyWbonJxD9ULmk6mo=;
        b=rq7VVhsVxYrsZlPweOSkRLfp/awSbCI5oMP2M/RgkWH/hJgQ3ZGLJH4tCfdeXBBqqr
         PRmBwRasFQXu6CO1MZYLg32vyuDN9pzc49f2SHORN6sYug6wjmNOWvJo5BjUcX2f16BA
         F9ZnjO2ksnIsk2FUKuHjgAIqGyQKedgj/y8sf1NXLU/Zx7dQoE5AAG1br0TaEL7t46aV
         8Or0M/8H12JJ/iLMYLQwkKOhIzdI1+w29nQcS1DQnVxSOQZxa0jiVbAYKCNd50e9MG/7
         uXOQNOwYDnhCHrdpyCe/mnTytZSpVOOvWyyxSJ9SAZ903RNT6idb2oFU+F8s2NsqS5g3
         5P4w==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="N8VsOW/6";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6ae1172b0a5si8413056d6.460.2024.05.30.03.31.12
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 30 May 2024 03:31:12 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="N8VsOW/6";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sCd3b-0001Rt-V1; Thu, 30 May 2024 06:30:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1sCd3X-0001Mp-Ev
 for qemu-arm@nongnu.org; Thu, 30 May 2024 06:30:49 -0400
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1sCd3V-0000r4-SX
 for qemu-arm@nongnu.org; Thu, 30 May 2024 06:30:47 -0400
Received: by mail-ed1-x530.google.com with SMTP id
 4fb4d7f45d1cf-5785eab8d5dso772226a12.3
 for <qemu-arm@nongnu.org>; Thu, 30 May 2024 03:30:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1717065043; x=1717669843; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=uThypw/HPvw4P8WDz2IRhO+g65TKOdufmMLi1ChnOkU=;
 b=N8VsOW/6B2eL8fuwnphQuL7sjR2b41zLTJu0QjUmglp0np2dxGh7HzS0MgDQnOSqAc
 TAGYdPyTVqwHkhNTrBliIV2/HhoaALKyDk2EGX9SYq874xhkNgPdGWNsrvIe/t5tqBl3
 RM2xGAQZXHkfj6go/VLQxl1+jzp2cipLlSN2CXvjAxgDSTlwFRt3MaLVeYPZabU3+b0g
 r8xGGUG7gOb8JT2UyHEisH+mmE3E3ttTK97VG9Ls4CK1nwV6JsrsVybyCyeiY5ZBsDOR
 XZU4SPXibU+gFIx1MH4cQ3GbQbIAWGpkfNnmUQmobKVC+HCvlokJcq1s28ApkMdgdARE
 giig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717065043; x=1717669843;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=uThypw/HPvw4P8WDz2IRhO+g65TKOdufmMLi1ChnOkU=;
 b=bNDNHtHUS8aDPUlHxRJZKnxJci3+j8WvHQkRNoFEhwHii6stoAf+QLnFcWqp8CQOm7
 QJGv1yEY8M/YRRHTsnBb7ODnuvjFF4Ewttzn2l6QYIbSJ5tEKmajC2U0Mg0DPaR1FO12
 VJH6qQwH8/ZXfDTVnTlugAyl8hvR6EYHGQRraES/PNzmxUDj4rLTYP1Le51Uw+i9xWZB
 aFtyBd1w0rv8jArv4lbDt7/rGqJIMQgVPCQkHEGs245p4vpt7ht1yIG+W16f1jSU1dSO
 DDhcOrsTUEVVwJKEWCAa9IYen62GIjhqnoWCE239LZec5F1wwXA33Jsexcgn3d202f3r
 WFDQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXiyZ9skow5j9s4etksA/v66t0j9cf34PcYTmHQXsT4g0mlp66U745SvGJlpjZF2RJTRwF26jWFBjqbFQqBBw48m9XP
X-Gm-Message-State: AOJu0Yx9qwNOZZeOeUo8SpOMyBLT/Ju9fs03GMJTKmVX4qtR5rKVSwDo
 tWEAK7sNwBHGtSEN9jDgOy8uR2WjEpkqS+MUCFbF5fDatqeg6zh3URqhNyJTfW+lh8w6ApBeHsb
 laEMx95xXNtXsvKZVT9QID8UHJ0alDWEIMmb+Ww==
X-Received: by 2002:a50:d5d4:0:b0:56e:238e:372c with SMTP id
 4fb4d7f45d1cf-57a1796a2famr1153871a12.26.1717065043321; Thu, 30 May 2024
 03:30:43 -0700 (PDT)
MIME-Version: 1.0
References: <20240524120837.10057-1-sebastian.huber@embedded-brains.de>
In-Reply-To: <20240524120837.10057-1-sebastian.huber@embedded-brains.de>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 30 May 2024 11:30:32 +0100
Message-ID: <CAFEAcA81fqWKXL_7m6LTi0-zkmtMQC0RY6_ZNP49cdWCVJK+1Q@mail.gmail.com>
Subject: Re: [PATCH v2 0/2] Zynq 7000 Improvements
To: Sebastian Huber <sebastian.huber@embedded-brains.de>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::530;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x530.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: zARIb3N1I6+z

On Fri, 24 May 2024 at 13:08, Sebastian Huber
<sebastian.huber@embedded-brains.de> wrote:
>
> v2:
>
> * Add Kconfig support
>
> * Add array of CPUs to ZynqMachineState
>
> * Add FIQ support
>
> Sebastian Huber (2):
>   hw/arm/xilinx_zynq: Add cache controller
>   hw/arm/xilinx_zynq: Support up to two CPU cores



Applied to target-arm.next, thanks.

-- PMM
