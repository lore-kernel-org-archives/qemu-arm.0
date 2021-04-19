Received: by 2002:a19:ee0d:0:0:0:0:0 with SMTP id g13csp1353509lfb;
        Mon, 19 Apr 2021 10:12:56 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyCbzcrjjkKeGWBuBBM66eQIg2avzKSRyu3De5ldQRH2mQ/n/zdq3N2gZpfrkIpE9iHkXze
X-Received: by 2002:a05:6e02:cad:: with SMTP id 13mr17958036ilg.77.1618852375844;
        Mon, 19 Apr 2021 10:12:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1618852375; cv=none;
        d=google.com; s=arc-20160816;
        b=VoZDDX9jhrsW7e8oMw+3VoOZGzrWWoSkW7b/7YlGl1GTGt8br5R0l/EA3PK402QL/R
         OM+sbh2KfHPQoLG3fmGh+zelok91K+i7ksdTX8pYhPMDYXc/WsgDbQtv4UIWYowsYQBI
         2+bW4NMTrLSshwfAUgZbwSKc41FHWPsUKbY36cbsfoyqDw7SQPmUv5Pl76XHiPtMK+wa
         +dpUmCtNFa4XUXt2P9xSXMCeVqwLwi/MCiiRkkwCQACe20pQ8IS1rNvA1LDu6/CmoM8/
         k6kRPkseIPk7QOs4gEZVzJmqszv6moILN9imapPsske9/CHPEtkgIeitDr9ie9BsokUs
         /0xA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=WSJ2TLskuUFwZbWmYxchmTIoDhwxzt2StyCFqzxmeQk=;
        b=Q9TbbNuSqnd3ALWcgCtJOIyg391OyEnzypZZNtnXukz0ProLduum8zvfewy0QUDedI
         SJsUQvo3WH0pwIzmgum3wNf0ZEDB98NmjUhGjzxZTLsBYQnCn4lstd2oXzsvfNMN4/Fa
         P3F4wvp4P8QNZAMc6h0HV+eznWgcubgsaB1D5o6KJO8quTgdBsAt3TXJqgazuDay/wUj
         VOnoJNM3up4ZO6OT9wwJW/c5J8SdE6ybnV0lomSb863DXyr4VoqqvwLGR2S7NlP9ux2m
         p50OEG0EAYZw8bKfUSA5PoYnhhjs7qiuUeMV5htK94/akBPRYcc+0npu+V9RXIY3rihe
         hDTQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=PSqrGWzN;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f21si13276921ioo.37.2021.04.19.10.12.55
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 19 Apr 2021 10:12:55 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=PSqrGWzN;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:36574 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lYXSB-0005Jz-6c
	for alex.bennee@linaro.org; Mon, 19 Apr 2021 13:12:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48872)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lYXPo-0002FP-7Y
 for qemu-arm@nongnu.org; Mon, 19 Apr 2021 13:10:28 -0400
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d]:41792)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lYXPj-0006fe-Q3
 for qemu-arm@nongnu.org; Mon, 19 Apr 2021 13:10:27 -0400
Received: by mail-ej1-x62d.google.com with SMTP id mh2so32530405ejb.8
 for <qemu-arm@nongnu.org>; Mon, 19 Apr 2021 10:10:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=WSJ2TLskuUFwZbWmYxchmTIoDhwxzt2StyCFqzxmeQk=;
 b=PSqrGWzNIv2B5+czkE3N0MlBZu9RMZOvem7vW8Kt2vDcTSphe7zttQKN4Otmr5y4gq
 yRTyy6jkblLDRt0mRyKAPi8sxScHCZRP1iIc/ynPYiTbCh7RG0dCgY5hc5YorJn8x/jv
 xIMusEpRRILQIljG4qvDWAYm2p0DOWH1haK8jhiJOIY6y7CaTjPEJO/+q3HcB80RW8Ci
 wgTuDTn9+1/TI4nDbKsrHmzX1IA0jgUKPUvwFb11mnpEZVGqctEwPMVNzDC9JakQvXZC
 Qp5SrLyHZN9m0ornbHN6XCHb+vNgi7K3tJJnhr0z0ke3LDgyZEm+0TK6bIn5WkWY7znB
 PB8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=WSJ2TLskuUFwZbWmYxchmTIoDhwxzt2StyCFqzxmeQk=;
 b=Fu4PvKzOir34zp/lSG7XW9wiFQulGY534+VdQsTGc2VWlFeW7iiWJZYteebj3J8D7v
 XJLlFjgiuZg7QUF/KirA//Hgd/ewCi71EuuDrcfjE7xXueirSbiE2oincZ219rS5C5ra
 yqKEvSXBeGwSS7uXm5GohDsdQw3KcJwmwmghO0fg9cVaLzI44K8hKAbE9a+P3qPzFNO+
 pVIjimLcQBiyfdmgBqogcyvHTiiBSqoFPsDrEss3kXrY9s92ycfRhcPA4KqagvIEHE2X
 flo2Hs0isYMvHcj69Y6r9XjfZOzWmeTMZ56wd5PWWQsx4iVZKE+BamOTYYnmyd8Sl/fZ
 SZtQ==
X-Gm-Message-State: AOAM531fjEaUB5pOwux73shCRkC/tGOmLJSBf9kHW+QYAMogd34Qw+G2
 u1HTqyw+o9AJiP5vFhbhy2lBCMicKxXAzkdRVF9BXsoQoMA=
X-Received: by 2002:a17:906:29ca:: with SMTP id
 y10mr23723490eje.250.1618852222452; 
 Mon, 19 Apr 2021 10:10:22 -0700 (PDT)
MIME-Version: 1.0
References: <20210416185959.1520974-1-richard.henderson@linaro.org>
 <20210416185959.1520974-22-richard.henderson@linaro.org>
In-Reply-To: <20210416185959.1520974-22-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 19 Apr 2021 18:09:30 +0100
Message-ID: <CAFEAcA80T3e4hOWvR+8QoNvtrWv+tgHsds=2idbLD1DfQ7fVLQ@mail.gmail.com>
Subject: Re: [PATCH v4 21/30] target/arm: Enforce alignment for VLDn (all
 lanes)
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::62d;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: hiGyPJjwIIvb

On Fri, 16 Apr 2021 at 20:18, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
> v2: Fix alignment for n in {2, 4}.
> ---
>  target/arm/translate.h          |  1 +
>  target/arm/translate.c          | 15 +++++++++++++
>  target/arm/translate-neon.c.inc | 37 +++++++++++++++++++++++++--------
>  3 files changed, 44 insertions(+), 9 deletions(-)
>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
