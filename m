Received: by 2002:a19:e20e:0:0:0:0:0 with SMTP id z14csp4794231lfg;
        Wed, 12 May 2021 01:56:14 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxB3ndtBUriOVQmj5iJm7f0qYtFfAHn8FfYYXYUt+2k0ra28pqeH/1W6dEKZFYQErkD4vRH
X-Received: by 2002:ae9:f114:: with SMTP id k20mr32416173qkg.386.1620809774655;
        Wed, 12 May 2021 01:56:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1620809774; cv=none;
        d=google.com; s=arc-20160816;
        b=ScWCW6MeVMjL+Eag786jvD+w08vCSz9IvLYdP54RrDK0/MBIHd3phBLgqpVN3p3T2V
         HMhO3u3U6HxPpqLXvz2+0q22/b0fCWsOr/F9bdFvQTF+h9nKJRa1zEAIyPrItYm8UefH
         rhZbAFhKNAEzU59NWO6gCZLPnimiYw6DA8jB9FohzsRfXKJUupVJUvLXvklt838BKqJz
         IVS2794OR2ojX5C3XvG94av6xnOOhgIq/x9E8CoVpk9aO9vNelIspFcqz+Z1R7EnKV6r
         5M49tdmhEiZm1YDHrzcgLTrFB8qfpo8H+g3SOT3k6QWuL5kMJFXD2k6lv1rqPjdpwLdX
         Lflw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=oEltHz3chvau/X6PpcSo+oMiv15kQnkzjRA91FojxEk=;
        b=SaYt3n/OUR98HYRZbwaD0ADbFzOuQ+h0rRmaNVAoxuiGhlCup0jYlw8taC5GI0UB0h
         ZBqgy5nDuS+dPGiOW3B5DBjR5d03PTkYR280uzcvotMrPoqKzK3PT6lhQmRq0K8uDEK2
         NaqbSbDoMtN7VYGW3WfU+cPM7bJ4olThapdQiMfWmvpCho4gHcXjOfU8YXSgDO3pxOi+
         niciADAf/5+qrGR75p0BL3GaNJ8EmlGHLcSCI04Lub/vAT+sKCD9axZ0p7fM9qKdK6XY
         OAvW4/jjVyuNDJ91U/RyVz4JLKG1agrtrFndU27i4WSE0ARayNZE7chqNRCS780Pi/uy
         zxlw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Ww8ry+wz;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g185si14680942qkd.165.2021.05.12.01.56.14
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 12 May 2021 01:56:14 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Ww8ry+wz;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:53460 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lgkf8-0005EK-1K
	for alex.bennee@linaro.org; Wed, 12 May 2021 04:56:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42886)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lgkek-0005Cd-Pn
 for qemu-arm@nongnu.org; Wed, 12 May 2021 04:55:50 -0400
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636]:45822)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lgkeh-0002yb-HU
 for qemu-arm@nongnu.org; Wed, 12 May 2021 04:55:50 -0400
Received: by mail-ej1-x636.google.com with SMTP id c22so5725431ejd.12
 for <qemu-arm@nongnu.org>; Wed, 12 May 2021 01:55:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=oEltHz3chvau/X6PpcSo+oMiv15kQnkzjRA91FojxEk=;
 b=Ww8ry+wzNJhVdRLM9QQqxJ996YlTWWllWIQ5dHMgnEj4gqb5sogSnY8lZO7XO+lD8g
 AKErDh22ulUElLhmcLe0SPI0rOQC8h+8sXHNdt7Z3Q3BPykgKqiTlyPlsTL9+dNtsq9F
 ljsGS8BhXclGo2RX7U6tVxct+Humx3vv0I67xAQm5wzKb0myD3a/4rjmeM+SrBowElJN
 Ekwn1UUe0pfRyloT2VvMkD/SOM15UGVw1hKbNYg6P6DpPh8hFEKZBc81QzHdSJYJrc5H
 koBCKm9cET5m7087vueHYBv3Cvsobk2mtwAo2L09+Omi2HmXUmgRlfttnblCleybhH3S
 bJnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=oEltHz3chvau/X6PpcSo+oMiv15kQnkzjRA91FojxEk=;
 b=JWyrbj6v02D1hfFwsQQMU3MsUjPGQrtR5LsMnWfn4AZnGnh+47qThGEH7tvHvYFmTh
 itLDrbyDpr/u/yz5o8sDV2L/SxgnriDARFs/kyAJ6TqTi1/TLucmiHwJaxjuOt0yAaq0
 tlwwA7JZq3GqKhB1NYBdSCTex156iH5ZfFURhsOVHTeNibhuvhW/vxJq6KqrDTWqBA7Q
 gDWh7DSVGBkkFfUvNUJMhERCrJoempA5da9g3Gnyyj2OYSQ7AfvRHc2AqgRNziK/aA30
 vqt1O02GsSObqU3gsIf/0mqDJlTtxSHbc5x7U+qqvCR0g2gqDgOtru68hy9CgpT5/tXN
 MPUw==
X-Gm-Message-State: AOAM530Zy9had9/QFNBZFjP1n/oXxwdUBQHaYAzfP6lKstFQAxTKQ7lX
 4LJPpoCkNeF1EtHNFY0LLmQAa8NK7Uj0iMgITaWMUCscTFY=
X-Received: by 2002:a17:906:254c:: with SMTP id
 j12mr6094019ejb.4.1620809745689; 
 Wed, 12 May 2021 01:55:45 -0700 (PDT)
MIME-Version: 1.0
References: <20210430202610.1136687-1-richard.henderson@linaro.org>
 <20210430202610.1136687-28-richard.henderson@linaro.org>
In-Reply-To: <20210430202610.1136687-28-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 12 May 2021 09:54:32 +0100
Message-ID: <CAFEAcA_RCZbL+s81KY2QRXRugEnbH4sjj30Hc3WQy_D9ySGnpw@mail.gmail.com>
Subject: Re: [PATCH v6 27/82] target/arm: Implement SVE2 SQSHRUN, SQRSHRUN
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::636;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x636.google.com
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
X-TUID: 8rghbbgwM86S

On Fri, 30 Apr 2021 at 21:44, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/helper-sve.h    | 16 +++++++
>  target/arm/sve.decode      |  4 ++
>  target/arm/sve_helper.c    | 35 ++++++++++++++
>  target/arm/translate-sve.c | 98 ++++++++++++++++++++++++++++++++++++++
>  4 files changed, 153 insertions(+)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
