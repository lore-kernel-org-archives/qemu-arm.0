Received: by 2002:a17:906:494d:b0:a0d:e0d9:b5bf with SMTP id f13csp1161423ejt;
        Mon, 27 Nov 2023 07:39:46 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFBQPvUWmRkCwm+nSrRmp/V/Pm7Tdx0FagJgaiqC0vDoxnWMJ/TBFaGi1Q5BDU17iEeaYkr
X-Received: by 2002:ad4:5761:0:b0:67a:35e9:3a93 with SMTP id r1-20020ad45761000000b0067a35e93a93mr8401841qvx.8.1701099586307;
        Mon, 27 Nov 2023 07:39:46 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1701099586; cv=none;
        d=google.com; s=arc-20160816;
        b=RV5vB7esWHVK0UGYsD4feHVQmbaI614UzpnS7HLmjxZS2HNsWvIBH5Wuhdtj/30yeM
         RwIwThaBDajiLlUehPAvpQzYrP0b1K5stKkcEN5Rah1WO64fJyAV9pWUHIIm93HIeDt1
         9wwWboswqM2qPAqQe7lLgK91mSsNl5dG+Ux/Gej3IU76Pj668H5zCU0CiWRRWl46f4tL
         4jsZBJLmAr8O3n/1gV03yl8pq+6puvnqU91+3ApYyXF0vhtpWpAOEifxhBNYaZkgv5GW
         Q1ERLpT7cSEj45j6j0F0LJH30Jh5H65br4E65gquI0PKWoN3bkdezQwlXIzuQSnNdrh6
         G81g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=l2PDJzhJCzfCpI7ibyz+gkjE41VqY5k7sYsjfM2g0Js=;
        fh=7pPsnu8h7fWdn2K5WVU5jW0LEU3r5vLGueb84Fxmpfs=;
        b=JbIwYa6mZ9GL3cfsgYAgIjURQ8Fv7poGtjVP+1olcemhUZFx9wlRuxsbqrORlLedON
         o/aAanV08hNT1LRn1ogSQ/6dSl/9W7+7z2Om/L68d4RsCwHTS1nE11SRTR91tFry2/FA
         iwPw8GW5D1Q189V8kicO4htzNU86xYPdFnbCVmX5z0EL+Se6JFXog9L5H2SMx7GP1PKX
         qgd+mdbkHw/Gn3S5dIsmYWEYe8tP6LXDsdJbTH0u5UIk3Nne9n6+3uk0XQvRPz83c5bF
         SQfB56cBYp6Go/r2oBHQfYlTtkv3GfzJDS7B00FSr0/pWeTUd+YkldSs08jP5yidI5C7
         Dmng==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=jl0qFRS0;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id fe17-20020a0562140b9100b0067a26350ad0si5366370qvb.279.2023.11.27.07.39.46
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 27 Nov 2023 07:39:46 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=jl0qFRS0;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1r7dhc-0007d2-4k; Mon, 27 Nov 2023 10:39:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1r7dhY-0007bK-QN
 for qemu-arm@nongnu.org; Mon, 27 Nov 2023 10:39:13 -0500
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1r7dhX-00050b-8b
 for qemu-arm@nongnu.org; Mon, 27 Nov 2023 10:39:12 -0500
Received: by mail-ed1-x52c.google.com with SMTP id
 4fb4d7f45d1cf-54b1812ae1fso2895133a12.1
 for <qemu-arm@nongnu.org>; Mon, 27 Nov 2023 07:39:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1701099547; x=1701704347; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=l2PDJzhJCzfCpI7ibyz+gkjE41VqY5k7sYsjfM2g0Js=;
 b=jl0qFRS0kyisYb44x8N3UlLu3K6+GYGczzJME8d+IJfvfsSXa5k6B2Jrl4Xvshvtmc
 jKDXfTLk2qVggZxO62P/91HcU6rBJfv91tW9/qq/DcxqHDptXyQG0N2+2C53C3V10XpQ
 Gu14gKTERH1SCds/Pde9Yl/ETIz9cjQcJ71gIdG4/NaPBavOhGdcNUEbqurT3M6F0ssy
 c8TQz5QNGjC9pIO6TOOJjwfBtgSZaTP6yihgje9Xu1aFuoAf4qZSOudNGTXmEv7He1w9
 502Pox7suJsa/ZzV8ZE+cDDwNInHBaFQmnjKnWfFkDH/NnR9Qi8/Z8taOJV0dWWSXTyq
 nL0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701099547; x=1701704347;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=l2PDJzhJCzfCpI7ibyz+gkjE41VqY5k7sYsjfM2g0Js=;
 b=DcdgTGIB9Bpm3z0BKCKG09OZVFEroGLe6/5hLsps3gld1pKpk2gXJdNmSNE6caP2GQ
 hNiC5nMEg1JNoIkbzGxq9B8ruVJ5fId0Za0uvJpdY8SbnQMe+4oXfkvHqw9T3kmRPY8P
 lKLXsjdzhVKUuVx1XKyJ0zZW1u5pAJo7eQzar0byQG9Jemo+EDP61sBcIVqy+3WCRT3B
 XaA2yIpFXVTipYQasyUH6ibOputH/mrFBX+8Yydm3vB5O9GiVewz6B2JllkTRiJVGgGH
 qcMnwgsbI6Fv1qmUjQwt9UADw+HLfQmIXB3GH/j9whcUeHn9usLWPe0bObnqOtDUds4e
 w/UQ==
X-Gm-Message-State: AOJu0YwqAGbL/9KJREHv+RH+E2iTV5rDYaHz9oMWjrbEjcOjsdN1WvcW
 LlLJOe+CeJ7pKpAOMR4ogGpW7CJdnWrmPWQ8bQ3rSw==
X-Received: by 2002:a50:c292:0:b0:53d:b59c:8f91 with SMTP id
 o18-20020a50c292000000b0053db59c8f91mr7620026edf.27.1701099547741; Mon, 27
 Nov 2023 07:39:07 -0800 (PST)
MIME-Version: 1.0
References: <20231124143505.1493184-1-fkonrad@amd.com>
In-Reply-To: <20231124143505.1493184-1-fkonrad@amd.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 27 Nov 2023 15:38:56 +0000
Message-ID: <CAFEAcA8mqZHCC5+AWswWvCRXTyxOx4ezxtE5MaB+7irJ0q2ecA@mail.gmail.com>
Subject: Re: [PATCH v1 0/3] ZynqMP / Versal: various fixes
To: Frederic Konrad <fkonrad@amd.com>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, francisco.iglesias@amd.com, 
 edgar.iglesias@gmail.com, alistair@alistair23.me, luc.michel@amd.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52c;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52c.google.com
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
X-TUID: DB3ei/Bl0iBw

On Fri, 24 Nov 2023 at 14:35, Frederic Konrad <fkonrad@amd.com> wrote:
>
> Hi,
>
> Those are various simple fixes for ZynqMP:
>   * 1: fixes a possible out of bound access in the SPI model.
>   * 2: is a trivial fix for documentation url.
>   * 3: is a log guest error fix for the CSU DMA.
>



Applied to target-arm.next, thanks.

-- PMM
