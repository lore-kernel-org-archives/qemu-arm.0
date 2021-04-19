Received: by 2002:a19:ee0d:0:0:0:0:0 with SMTP id g13csp1210611lfb;
        Mon, 19 Apr 2021 07:16:29 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz8Cdw7BnArsk9EgP+kJxP+QjoM1txgcmnsvL7sGwR1Nlpn1/U+Bc8dx3MI//fkpja0Lnnt
X-Received: by 2002:a05:6602:22c3:: with SMTP id e3mr5353138ioe.132.1618841789616;
        Mon, 19 Apr 2021 07:16:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1618841789; cv=none;
        d=google.com; s=arc-20160816;
        b=1Ljh5Rv/UmERlGvwZQh+8C8pE2hdLnB/Bozl50U38I++h/SHwqwhqBMMDFZZviCyZl
         I+y89TrMqzQX3DVW76Y2+HEDkgxu2x99jlXzJIANZo/m3JYI7XQ7NaW8iYrR06HtWfXI
         eOEM7Jd2VtPP/DoO+DFyon9wAKK1Vt3UH++flmbnVuLDpvyglFf9i4Bbqx9EDa/lUFmY
         2hAB6z+MiIyHkGBL+tGVPzWoFsrC9TVPPyVgKjm43w15yWmIyk13I4xleYLe4kKmpcoc
         6hzTDDnLv7pm1XeOc2LuvXr2BIoZpCxqI1v2Dq/C1ke0anPiJEg4GjOFqOv8VPmJN1pJ
         OYPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=4J5sr6PwANRancW/ie4I7xlz0adNZGtOCEgqzGoDJlg=;
        b=UzpwkYYnLAXTjtZxRW2dfKyiz1uCUgSkLQDMh4X1UTzyLNaFsvUQXoSnigY2LYyiVi
         FgLrfSAfaBHL59YblPxkO37CkPjRzPuqFju569tIQpyqzWaz4ndCIyAirG06YO8RpiEm
         bF+uDc3p6s7U0+w4zniAz2uyEdVTFnyiOevTPBFNi97d+I8L6RmfaT1l/tdLx0om+SLY
         LTsrxuHOrqwSxPHZx1qfhVKGd6KmW7C0H7lPHzd3ANFwDRE7rBLXHNgrFZFzwhuDj4hY
         UAHxjCEtAlWCrhX0DGqS37xYbQg8uUdGLj+jfPNSUEtis/3MQ1q2d/MfQYB0iUzVTmr9
         dItw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=kGpIg4Js;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m1si11625172ilh.96.2021.04.19.07.16.29
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 19 Apr 2021 07:16:29 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=kGpIg4Js;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:49808 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lYUhQ-0003jI-Vs
	for alex.bennee@linaro.org; Mon, 19 Apr 2021 10:16:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34096)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lYUhC-0003e9-6W
 for qemu-arm@nongnu.org; Mon, 19 Apr 2021 10:16:14 -0400
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533]:39637)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lYUh9-0000RL-7Y
 for qemu-arm@nongnu.org; Mon, 19 Apr 2021 10:16:13 -0400
Received: by mail-ed1-x533.google.com with SMTP id g17so40215072edm.6
 for <qemu-arm@nongnu.org>; Mon, 19 Apr 2021 07:16:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=4J5sr6PwANRancW/ie4I7xlz0adNZGtOCEgqzGoDJlg=;
 b=kGpIg4JsScFv39USW8WPcgvZKIZt3OTvpj49d0Hjr4ifg2S2xLNEksptwmJq/+b4LO
 EQd3Et2Ywn4MxHArBEmSXAJUJqDgJXmwV2r3XAMiai99fJSuW6ud8z4swnQLYQxzMQh/
 RVaqs7ptnD1TlnU9ER6Z/Ox43QOk5Be2N9O3A0n4NmcoroljtQgwBx74yRNHJWwvjftq
 2/v2YluXnT1tVTI5AY+GSbg87+Av1BOFfTaSimn9YAW7YQDx1svDZhMUvLVRNGFElrh6
 3/nJ9GlxD0VIxR62eLh8zPhxjepLInr/+ly+ZrPTSa19I7B1yOr+vDaIo/daetIaIN6U
 IgPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=4J5sr6PwANRancW/ie4I7xlz0adNZGtOCEgqzGoDJlg=;
 b=l55rTNZP4fMAxdPWAISnVz6zQ66/LaukRe+3ltUWp0v/9rW9pQGnVY9o+bFJmn0tUn
 CU2G3xq4b+aqTyeDzvMP6rF9ytuQ6xdPhYxTYdcADSn5ziUacwFkFjbbYjR17mKE6Mgf
 7jkQ4PXZ7OLW8sohlI9uuXqqflOgocV/xSgIGthukaEdrYuvg3F0nEMSnO7dEbH4BglK
 rg6py8R6Ep4fLM/wJ/UPTGUSZ9uwObLfDFcGcAWhZZ17vdEU+ZeiYjdugUb/xTUQHgf5
 qh89tNAEL6n2mAiSPxzkkAovCwJ9IhqFSVhUh42M3OnuVwhADnQuH6ZnqYgB/GF9NXTT
 sbyw==
X-Gm-Message-State: AOAM532bRhQczzOYqisAztiEVb6pQIuct0KswDmp//EwFt/EcutiXwCv
 ItwbJ99JlmxDijCrcEqIIJKx+3gROHBTBVj+QaEr9A==
X-Received: by 2002:a05:6402:c:: with SMTP id
 d12mr25502887edu.100.1618841769353; 
 Mon, 19 Apr 2021 07:16:09 -0700 (PDT)
MIME-Version: 1.0
References: <20210331064713.1782-1-jiangkunkun@huawei.com>
 <480ded69-5141-9eed-9326-365260d05fe0@redhat.com>
In-Reply-To: <480ded69-5141-9eed-9326-365260d05fe0@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 19 Apr 2021 15:15:18 +0100
Message-ID: <CAFEAcA8AMX3DEMND-4ZUnDuOOE4EoG8f3z_jwyeUZgiRKKJJLQ@mail.gmail.com>
Subject: Re: [PATCH] hw/arm/smmuv3: Support 16K translation granule
To: Auger Eric <eric.auger@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::533;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x533.google.com
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
Cc: Kunkun Jiang <jiangkunkun@huawei.com>,
 "open list:All patches CC here" <qemu-devel@nongnu.org>,
 Peter Xu <peterx@redhat.com>, "open list:ARM SMMU" <qemu-arm@nongnu.org>,
 Shameerali Kolothum Thodi <shameerali.kolothum.thodi@huawei.com>,
 Zenghui Yu <yuzenghui@huawei.com>, wanghaibin.wang@huawei.com,
 Keqian Zhu <zhukeqian1@huawei.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: hpqM+i0IeLhK

On Wed, 7 Apr 2021 at 09:41, Auger Eric <eric.auger@redhat.com> wrote:
>
> Hi Kunkun,
>
> On 3/31/21 8:47 AM, Kunkun Jiang wrote:
> > The driver can query some bits in SMMUv3 IDR5 to learn which
> > translation granules are supported. Arm recommends that SMMUv3
> > implementations support at least 4K and 64K granules. But in
> > the vSMMUv3, there seems to be no reason not to support 16K
> > translation granule. In addition, if 16K is not supported,
> > vSVA will failed to be enabled in the future for 16K guest
> > kernel. So it'd better to support it.
> >
> > Signed-off-by: Kunkun Jiang <jiangkunkun@huawei.com>
>
> Looks good to me.
> Reviewed-by: Eric Auger <eric.auger@redhat.com>
> Tested-by: Eric Auger <eric.auger@redhat.com>



Applied to target-arm.next (for 6.1), thanks.

-- PMM
