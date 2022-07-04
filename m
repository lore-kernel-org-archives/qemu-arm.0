Received: by 2002:a19:2d51:0:0:0:0:0 with SMTP id t17csp3255401lft;
        Mon, 4 Jul 2022 07:09:04 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1utv8NC28HnBZTjv74nXAIV+vFNuuk9ISaRwp+xVkGlOCYSQ1fTquX7aVXRgYvPZ4n1juw7
X-Received: by 2002:a05:6214:5296:b0:470:47b8:6d6d with SMTP id kj22-20020a056214529600b0047047b86d6dmr28865421qvb.15.1656943744818;
        Mon, 04 Jul 2022 07:09:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1656943744; cv=none;
        d=google.com; s=arc-20160816;
        b=TrZ4TKosXOK6PMjtHs9ZIwip80bKaRhrazk+8b5gxyKph9z7eLlloOAMET82ShOJ5T
         oqfofoBgo5fPqusLhLoBxiXmXFr7YRO8j+acTk1LT4OHFfh0NA75+gfF68smGo2auxwS
         sT/kG9uvv3qiaBT5b31VO2VcgLshZkpqPdhRswNyk6eFjJ5LIKquLckoU+UomOzN3VVD
         xcuBgV3Q+sHB/BmLfwYY1W3s4UtaCw6zlVdllg0kZ5P+E7VEJTcgl0xmHxZa62JAsD2c
         uJHVsvoN/w+sGBf4dQiQS2F0zlYNBa7u8T4n4G1c6muQOFAcUvj7JpuML42e+H/6A4ny
         lLdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=QPJjiOHqnw5Yj+j/5NJgs1q4gjd5PxZb5RAnPLtTAss=;
        b=0Z7dpI5fl01i5vGEem86hDwEwo2g1llvplcFdhs1uYr+utYIvxKH3IDXk0KF8WxB4N
         sILzm/lFAyQivt3fLAORa5KCYVyoGelc3soo3KbXq9fuBvd9EXzqB4JNFXWYSqw/VOm/
         /NTzSpg+U2Pd1Ap7SOY+TJ3wznoZRpn482fXb84P4I4COjwZ/snEpQ3DIR2kgkRPocwo
         ZxtwuxTlEfPvptZbcySFmckp9h4pJ4A8YqKiFDnaVpuarM7c7xEk1/+Wu0JKVozoYUlT
         NE2JU/5HvvBY3Tz3AvtPrjoy44oN0wyvXdn9fxrGICrVqu3Dfc+hdB8ZB0yHD7IwRcHI
         FUmw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=JhEPM0xu;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id r127-20020a37a885000000b006a707d61304si16396018qke.292.2022.07.04.07.09.04
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 04 Jul 2022 07:09:04 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=JhEPM0xu;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:35498 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1o8Ml6-0005qY-8d
	for alex.bennee@linaro.org; Mon, 04 Jul 2022 10:09:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37932)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o8M8c-0001Qe-Na
 for qemu-devel@nongnu.org; Mon, 04 Jul 2022 09:29:18 -0400
Received: from mail-yb1-xb2e.google.com ([2607:f8b0:4864:20::b2e]:40634)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o8M8b-0003ys-0i
 for qemu-devel@nongnu.org; Mon, 04 Jul 2022 09:29:18 -0400
Received: by mail-yb1-xb2e.google.com with SMTP id o2so11644275yba.7
 for <qemu-devel@nongnu.org>; Mon, 04 Jul 2022 06:29:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=QPJjiOHqnw5Yj+j/5NJgs1q4gjd5PxZb5RAnPLtTAss=;
 b=JhEPM0xuoqx5KzVmfm0nW6gMWTWYwR/lu4Kz6dXBFjBAxjVL+hIQAg5Z9CuI+Mp/Vm
 QXkpVANWEnqT+quWGDU2e9Nyophu3gWXMikHMu2uv3i6gzJ3cubbltuyJG6sdJYZ7gJ0
 LzN6HkDB7Zdj+7l+nJvUB+hcneccgd+4LqTS6EkfKGUJPTNMZAzvF8klnEe0SpBOOa/5
 Bc7WJdIqWCPdrK6+PfZyMF0tjxTwPoBbV5bUDpeR1F9nLHy21OxUQR9DbrfuyC8oPQ4v
 b3jhUn9j5HAzyQMClncZDVj3zM/qLrSR3lv8F+TRkt2AgGFeZyagZFDGbsI1aG/Wn4ce
 YbEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=QPJjiOHqnw5Yj+j/5NJgs1q4gjd5PxZb5RAnPLtTAss=;
 b=Ty+/ddAOd7NT0R7ZJd6T7y7HsJZszjhfpv5jYKHIZeWPKK6jWIc59n/Aq8YMmXgGub
 XhbFA/rOjkwrHw2kwY4lz2bfKGgH0kFBC7GSiLMrbxi368ZPdmydrE0RAHKGXz0kcHv8
 bowLDleFHSscgVpNGs4k0QVjjUe3hjC8XepfjKvD3+AXBtd1kX7EjJdpDoIMeilAjKP0
 A3CwC+qGJslmTpDmBPcMq/WjTfyUT8KsyLDx5+hRxu20/y9fm7g42/vjzcj2VjAcq7XJ
 nc5K8qUliu+e15xwsg5T4p1Vl+5XnyMtzy6lsK71EiKxuhAc94+oxffzLjb5otuPXsmc
 WRsQ==
X-Gm-Message-State: AJIora9Cu4Iz66hufl+lWVXxa2GF95xIRSiuXIJ5ZeKXJLeDL8pIDJU0
 gDEeUXpfr0btP6hMfW9e7sbpznja51W6zcugQ6YFqA==
X-Received: by 2002:a25:500e:0:b0:66e:4c27:6223 with SMTP id
 e14-20020a25500e000000b0066e4c276223mr4912145ybb.85.1656941355578; Mon, 04
 Jul 2022 06:29:15 -0700 (PDT)
MIME-Version: 1.0
References: <20220629124026.1077021-1-mark.cave-ayland@ilande.co.uk>
 <20220629124026.1077021-31-mark.cave-ayland@ilande.co.uk>
In-Reply-To: <20220629124026.1077021-31-mark.cave-ayland@ilande.co.uk>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 4 Jul 2022 14:29:04 +0100
Message-ID: <CAFEAcA9bQp1NysqrZotfGvhYmUHhn9L9ydL1ozpKQwxEqfhCEA@mail.gmail.com>
Subject: Re: [PATCH 30/40] lasips2: standardise on lp name for LASIPS2Port
 variables
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Cc: richard.henderson@linaro.org, deller@gmx.de, svens@stackframe.org, 
 mst@redhat.com, pbonzini@redhat.com, hpoussin@reactos.org, 
 aleksandar.rikalo@syrmia.com, f4bug@amsat.org, qemu-devel@nongnu.org, 
 qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2e;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb2e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: mllwwqIkXtML

On Wed, 29 Jun 2022 at 13:41, Mark Cave-Ayland
<mark.cave-ayland@ilande.co.uk> wrote:
>
> This is shorter to type and keeps the naming convention consistent within the
> LASIPS2 device.
>
> Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
> ---

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
