Received: by 2002:a17:906:4f0b:b0:a47:c39e:cbe with SMTP id t11csp979946eju;
        Fri, 5 Apr 2024 06:25:50 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUqPG4HRezSRjPBIudkvBPEBLKNQo1Qy1jJYQp/iAQahGAjK6NSWL3EmRWmffHcr/Vl3ri7fwQhNIXFbOpfWE/cc9kd3gs+
X-Google-Smtp-Source: AGHT+IG3rwcFI2lpyzxDEiZi8sjDPszGpz68e6cdDIuWbQDNhPgLW28rVkRS8jTHRU6i4JnDIfb8
X-Received: by 2002:a05:622a:183:b0:431:503b:69ae with SMTP id s3-20020a05622a018300b00431503b69aemr3843641qtw.6.1712323549787;
        Fri, 05 Apr 2024 06:25:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1712323549; cv=none;
        d=google.com; s=arc-20160816;
        b=IsIg3yyl/6ExofWqu2kqVnnqPtYwdzMyIx3vyPo23GEmA1+iLJymXqry7pzJPTNgVr
         aCF6OMm5zfqhpHAr4dmtzFTCI40INe5BNeByOWmn0fIKsuQR7vfI2ESpwYeqaKLJ92If
         NiJhB+FPqaPt1gRagNWknUb47ArcSTmRZ8MW9V0xdbNy7pUqXydrGwl5tYIbDV8dsXUW
         RLj8yrxBv1PeVBbcI1c56Cmc987GCo9xj/haowpf7Y93H2D7lzTa27/ddaj6KoSgcOee
         oddSzNggXz6e7poZ9CP7te6nTK51paCE644Zz/EBudrdHw6eNjTpQ65DPyLJpGPrlHd3
         Wn1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=/faHNRafUdRJhvfF+2DKc8//5g/kYkjcQe6IuY2hny0=;
        fh=cbrcKLTZn21hQFRe34Znz5u/AQ46ZxTZx7FzZBIbLXI=;
        b=eZ0/A1arBHzBWefqIYasxR2YCRlqD7QWDzD5+/akF8fAWwOVsfDZtibKI4xpU5Btbq
         2j5ImsWoJW/MHfaNrl8aUzrXd7S/ewLptBTvPzks8RiavmB2uQbhez1hM9py4eVBU9g3
         PUGy0s1vzttIVNFfyxq0j2VW5ltw19aNGCVPGXf/Sri4uYsJF0cioOeISo1yV8oVl4HV
         AkYS+dBKun4ysGgT+KEsExYgDZ2VVVWcnBOM9ypr9Teo0Gc9RMIMsGxNbnJZcDML7VKF
         FNFH94Fg+nGV6Sw9ry0UdFWHi7lRmatVlDu5M31s+N3x2007sCFw3kUCvy6XcZFCh632
         xbHw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=lryVQd6F;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n16-20020a05622a041000b0043175068184si1824780qtx.76.2024.04.05.06.25.49
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 05 Apr 2024 06:25:49 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=lryVQd6F;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rsjZK-0002jX-JT; Fri, 05 Apr 2024 09:25:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rsjZI-0002j3-C2
 for qemu-arm@nongnu.org; Fri, 05 Apr 2024 09:25:20 -0400
Received: from mail-lf1-x12c.google.com ([2a00:1450:4864:20::12c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rsjZF-0006R4-Qt
 for qemu-arm@nongnu.org; Fri, 05 Apr 2024 09:25:20 -0400
Received: by mail-lf1-x12c.google.com with SMTP id
 2adb3069b0e04-516d0c004b1so2008672e87.2
 for <qemu-arm@nongnu.org>; Fri, 05 Apr 2024 06:25:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1712323515; x=1712928315; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=/faHNRafUdRJhvfF+2DKc8//5g/kYkjcQe6IuY2hny0=;
 b=lryVQd6FzGLXtkZsuXbC8gZXgMLScKPj+vPxRfbUlJ2o6oFGhEPrAHM2iUayO8H8vK
 YibeU6kMdscTUg5swXnp1wxzhwcLvpzsADyBMMNkWq5dfhm3swiboYxehWLd+CWWOebr
 FHQYz3bWWKotvVlRUKNLP7fTbaKqJcQdRRsmt3yK0fiatJGrox+KlDtbBUUwucI2JEgX
 3mOo1cYaQNXCJZClPVbkSukSkwhmv15Y38FYejEvr/BH2nOpHB7hVGrgBZZ1SaTT7bw6
 CY7I+x4/Vj27dZzvItVShRJQ+IOf5hWlChtdEa30u3UnJ8t9nHmo95ZbAHiOjIt/HCB+
 6RmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712323515; x=1712928315;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=/faHNRafUdRJhvfF+2DKc8//5g/kYkjcQe6IuY2hny0=;
 b=Gyt3BaeNAoSCR1Yk3/3OZmMnvdorzDTCPVsxY8UaEspkNW3Jg41NHBuJd84w5umyjT
 a/D4NZ01Vwm7TqiOt9UXr0cL5OaxssFkauAJI/+8jMKngQFePfMmRbNsz6UaoPzq7fh2
 IoB4d6PIAS1o548YYkE9dtHQ/Q1vqAOhXgSQwTPCPc7ITpETCzJnxXskmQAzWGzREWRH
 7TNR90hvRNBUkLfIXAgzjLtJdKErUreBkzO6TjG20HDRCSKdid92KYz1mJCwZ3fyPG7s
 vLxSrqeGwIE672t3Gk58+He3nL8+Seo0guuC3crs3nFyaBuSmMPLgXe47H3BUR1zihSZ
 GcSQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVZGQ77VrMvkJtHO3dWsdkyGE2wut543ckn32p7fPZUrJfDstkmaqmVOg1AOUWE3Kwbcxt87KK1b9HoijK3H1b12bIN
X-Gm-Message-State: AOJu0YxWuql7DREEz2X40vgaBAWie+qiQugD3wV8adzzQgFD9UbDbm8X
 9s2xdJY0JjNPeSEV+DfS5CHtvMqsgkKq3DuWZVHvRW/aemw9wgWwxCapW4wggcl+47EzuJe56wN
 SXyklMt2/YJhG5v7G7U/w0UQ3bEHzBvArx6TZ7Q==
X-Received: by 2002:a19:ad0b:0:b0:516:d264:1ce8 with SMTP id
 t11-20020a19ad0b000000b00516d2641ce8mr1144916lfc.19.1712323515550; Fri, 05
 Apr 2024 06:25:15 -0700 (PDT)
MIME-Version: 1.0
References: <20240403101611.3204086-1-ruanjinjie@huawei.com>
 <20240403101611.3204086-14-ruanjinjie@huawei.com>
In-Reply-To: <20240403101611.3204086-14-ruanjinjie@huawei.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 5 Apr 2024 14:25:04 +0100
Message-ID: <CAFEAcA-Jf4H4r4BVzPvDZGsm26T1QUjtaOAh+Ln2e=o2Gty-kQ@mail.gmail.com>
Subject: Re: [PATCH v12 13/23] hw/intc/arm_gicv3: Add has-nmi property to
 GICv3 device
To: Jinjie Ruan <ruanjinjie@huawei.com>
Cc: eduardo@habkost.net, marcel.apfelbaum@gmail.com, philmd@linaro.org, 
 wangyanan55@huawei.com, richard.henderson@linaro.org, qemu-devel@nongnu.org, 
 qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::12c;
 envelope-from=peter.maydell@linaro.org; helo=mail-lf1-x12c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: gx4ZMd/1VhO5

On Wed, 3 Apr 2024 at 11:18, Jinjie Ruan <ruanjinjie@huawei.com> wrote:
>
> Add a property has-nmi to the GICv3 device, and use this to set
> the NMI bit in the GICD_TYPER register. This isn't visible to
> guests yet because the property defaults to false and we won't
> set it in the board code until we've landed all of the changes
> needed to implement FEAT_GICV3_NMI.
>
> Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>


> diff --git a/hw/intc/arm_gicv3_common.c b/hw/intc/arm_gicv3_common.c
> index c52f060026..2d2cea6858 100644
> --- a/hw/intc/arm_gicv3_common.c
> +++ b/hw/intc/arm_gicv3_common.c
> @@ -569,6 +569,7 @@ static Property arm_gicv3_common_properties[] = {
>      DEFINE_PROP_UINT32("num-irq", GICv3State, num_irq, 32),
>      DEFINE_PROP_UINT32("revision", GICv3State, revision, 3),
>      DEFINE_PROP_BOOL("has-lpi", GICv3State, lpi_enable, 0),
> +    DEFINE_PROP_BOOL("has-nmi", GICv3State, nmi_support, 0),
>      DEFINE_PROP_BOOL("has-security-extensions", GICv3State, security_extn, 0),
>      /*
>       * Compatibility property: force 8 bits of physical priority, even

I was thinking about how we'll (eventually) want to handle NMI
for non-TCG cases (KVM, hvf), and I realised there's a missing
piece here: we want to make it an error to try to set has-nmi=true
for the KVM GICv3, because it doesn't support NMIs yet.

So in hw/intc/arm_gicv3_kvm.c:kvm_arm_gicv3_realize(), we want
to add a check similar to the existing "fail if s->revision != 3"
and "fail if s->security_extn" that does

    if (s->nmi_support) {
        error_setg(errp, "NMI is not supported with the in-kernel GIC");
        return;
    }

(There are some work-in-progress kernel patches for NMI support
in the in-kernel GIC, but nothing has landed yet. When it does
we'll then be able to add the support in the QEMU code.)

thanks
-- PMM
