Received: by 2002:a19:6b17:0:0:0:0:0 with SMTP id d23csp436441lfa;
        Fri, 23 Oct 2020 04:36:32 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxS++cc+0bDQpxXQU6U7b+7qI1bIuO8eD9X88keSsEuWYc90wCRfpQI70k/9hs7uqo9f+tn
X-Received: by 2002:a25:3303:: with SMTP id z3mr2811617ybz.9.1603452992347;
        Fri, 23 Oct 2020 04:36:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1603452992; cv=none;
        d=google.com; s=arc-20160816;
        b=W2sAvq+CbSF3GxsXN+UsGQle8SILInSEdxr+Om8TNGmHCkop7pSzCWclo3kBqeBEIf
         CMXmakAPxMhvbPgm831m1fQHZVggTLCrefATgj9Pk0GngiTdh7atjtwe2c3TtMNKMFN7
         hqR2rQEW9Sp5L/8QdKdXjlJhriAT+YBL+llpupV0PGRNdW+SHeOQB11eZqJJwllmXkC7
         BTT0CJoVt86Nwa6OBm8zzaNyCZOYgwEawqqs9BRlqqRj8uribcrvooumBfTM7jeqZ7/M
         72UNeGUEj0tIaJbYIJI35/CAJ7ksHI91fWzT5j41cWnHifYUoPFVwSpB9v5XmQ0o0pTf
         +7RQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=jfXHH5WuqJm+72/h8E93hQ4Ys/i5xCqPEgRGw9GYTnI=;
        b=ARAaO5yGncWonnwyIaRKrPq+tpP+VwOYHKATXzTA/nMRyKUV7ygr9F18XJkjxJleQa
         c+4r2BDqeEVm+oWgXQDK8EO0ZCbbrmd9JoFB/VVImfZxp2kG15dUcNvUEQKGfR4IsZlK
         dLJwsRoEdp7vhd5E8lZg/lJmr4xwuFT2PaYOcVJayJ2pk/CvAxygbJZJ8cFelDy78J/2
         KZmFseRNUo1c09wigzVqc4dPbyO+Apa0dzPDTVdYN7Sw1Z7oujB+USOuRRqRQbl3fFaS
         4ErnOme4PdGFKd3qpytwH2DF/jdzu57Swe6/Idn+ts/ynyeSqaopGRfFV2ChG9cT4CHl
         Ci1w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="fDWLpd/n";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p6si1311091ybl.445.2020.10.23.04.36.32
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 23 Oct 2020 04:36:32 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="fDWLpd/n";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:56898 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kVvN1-0006Z9-PQ
	for alex.bennee@linaro.org; Fri, 23 Oct 2020 07:36:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55056)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kVvMr-0006Vn-KI
 for qemu-arm@nongnu.org; Fri, 23 Oct 2020 07:36:21 -0400
Received: from mail-ed1-x544.google.com ([2a00:1450:4864:20::544]:42729)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kVvMo-00024c-Cg
 for qemu-arm@nongnu.org; Fri, 23 Oct 2020 07:36:21 -0400
Received: by mail-ed1-x544.google.com with SMTP id v19so1202569edx.9
 for <qemu-arm@nongnu.org>; Fri, 23 Oct 2020 04:36:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=jfXHH5WuqJm+72/h8E93hQ4Ys/i5xCqPEgRGw9GYTnI=;
 b=fDWLpd/nAqfyreCQzwVUXf2WOmv/qPLmzP77ulIhc+NjSgFsUV3zysfltr1haBwty3
 hMqS3MphPUl/2zuVg9jhTV9wWUj0QDnabVn/C9/DQqM3ajBREyB+uz2s3fVhbXyqjXrt
 UqC8QngT3Wq5KQ7Ypnt9gPrQjIxRIKyuRZgvYc/l38LANdEY2XnZhizbC27jdCuyU2Fq
 xK8KQEfix1spJt/ZY1l7FosvjBcs19ExVSxCJ62FCTvsA8VcoEwifdCx7/C7u2Xifo98
 cjgGxoToALtIjtH9/NwKqjU+kff2FAKJaVKBvAFZfoJqvNUCk0mWlnJsQXA1t4v6Qm9C
 8dbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=jfXHH5WuqJm+72/h8E93hQ4Ys/i5xCqPEgRGw9GYTnI=;
 b=TT/C9VI8wTHoxwq0vv9PAU85dxEfNs9/rOodpdw/fp4uW2XQpcz3JkwrUpNVUPz96Z
 OqzZuL1stcOioDwzJ2OF7GlqA3UynAG6YkujnpDhqQBiLfdI638m676vYXqtH9EsqQxR
 TfeM/NpGuvrGqK0p0AW1ANJvyjAFQ6orH5Sm+GdDOqLwMp1pYFTYjgLpcd1mflTGRMMD
 hgSg95DnqM17HBbD2cYKaw33UbOtx73ZVla0osF/gmfnywkFo+2BGRdGRZm6oTAAZEsz
 RuU+9ibSpdZSOAcjnxyUSdFI9z0fGfO8IEMbAt3HwdqCfMxAjgEcj3cbV7m+xOmKh9Kv
 X32w==
X-Gm-Message-State: AOAM532+j3Ffnj5w6WM+lKI4TJ6AbA79JG3nAPu7YK23Xmkz1Jhsrzhk
 c1LZxhoAQBVuigiST/HHSyZ8iz9eGExZbLSw23kxcg==
X-Received: by 2002:aa7:c683:: with SMTP id n3mr1684811edq.146.1603452976330; 
 Fri, 23 Oct 2020 04:36:16 -0700 (PDT)
MIME-Version: 1.0
References: <20201023071022.24916-1-kraxel@redhat.com>
In-Reply-To: <20201023071022.24916-1-kraxel@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 23 Oct 2020 12:36:05 +0100
Message-ID: <CAFEAcA-gEeHUJtuF9CX4XhXh6dnANNut-TJWz0nM8obAmMa3yA@mail.gmail.com>
Subject: Re: [PATCH 0/8] arm/virt: add usb support
To: Gerd Hoffmann <kraxel@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::544;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x544.google.com
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
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Sergio Lopez <slp@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Sai Pavan Boddu <sai.pavan.boddu@xilinx.com>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Shannon Zhao <shannon.zhaosl@gmail.com>, qemu-arm <qemu-arm@nongnu.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Richard Henderson <rth@twiddle.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: +tJPbi61fnhu

On Fri, 23 Oct 2020 at 08:10, Gerd Hoffmann <kraxel@redhat.com> wrote:
>
> Bring new microvm goodies to arm virt too.  Wire up
> -machine usb=on, add sysbus-xhci in case it is enabled.

So my question here is the usual one -- why can't we
just use a PCI USB controller ?

thanks
-- PMM
