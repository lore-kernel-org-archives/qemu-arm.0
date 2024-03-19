Received: by 2002:a17:906:aa04:b0:a46:bbde:2c08 with SMTP id ko4csp1515205ejb;
        Tue, 19 Mar 2024 12:26:50 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVwqiujlbYDxEb4ZraAfHnVfDE+QyfY+O9zuqB5fZPqWkOs10Vd5/u/wuAdwomg187WWPDwiCO9EXPwoEPj+oCU+MEa02L6
X-Google-Smtp-Source: AGHT+IE1o+xsj1yCV5UrpmQRFuvTbXb9l2cfRW69m8Xb0X1dR5TvLwX/aKoZ4/LfBsZ/+aFrBrHW
X-Received: by 2002:a05:6214:c4e:b0:696:22ab:3c0 with SMTP id r14-20020a0562140c4e00b0069622ab03c0mr7148785qvj.63.1710876409710;
        Tue, 19 Mar 2024 12:26:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1710876409; cv=none;
        d=google.com; s=arc-20160816;
        b=UFoIv/UepX03KY9lqHm7EpD5b/XG7wLyUVRrEYBXGgRtdHCZCMTt70+6I+HMumooUV
         v8hSR920LYj4m1qMHCQL5NNDXU2CFC/Wp794+6MsLLZmv78eHfK0htKWr4N7HMBKZCIm
         DhALj42H67+zB6/yaIu8hbVroQ/iLakRniQZfs3+lqzX6m15JwQhvAcjxgx54hcZp6k2
         nXPjv4XlKmqhupzelWzFjBe0SqC17PAfQgRpbBNj8jYvDbgCvmapMebuAg4KxySIUPFd
         tx5dVSIssdU/N3IBJTv+HJENeSdZH1ezqTj1Ub5k20HxoWY4B0uNhDzzW1mPSngTEvmR
         Iixw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=HpQ3X6Lgu0pz4QjyV48H9UCXm4tRHs7K2dJ1EJJ4V8I=;
        fh=EI5Zz0kH3SJYEu5/YF1YxBIZcKSUQ+66nKDKPZDbzJI=;
        b=t6FAZBzwSV8SjuU6imct2fGKVM7FWSAPQk3R9mP4COoURKLDxs4bxVnNfwAay5UQNS
         NTdkyYO6U0RDClbKlBSiuzrssNSHvUd34zPAcj4rayf69CF5gIyFPpXYftb13Cf+Nb8d
         KSk6TmewFA9jilWOjFF5KwhsymvtLBngHVSCt7KXEwZuWQ/3anxFCapma5NK/AXl0eyt
         swtYrYp9VYetswHmEczq1F1occiR+uvBTjzfI5Wxp7NlCGxN4XKiO6HOYJdr6FS9jKIa
         d7LDeUq1RNUt5qXdqYsNiJxa37i51PkUqJJhNdSYxDjOOUPDimeQh6ACC7BYCV8YwmUg
         fKOw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=m0Ddcer0;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id lz6-20020a0562145c4600b0069163f623b8si11012613qvb.20.2024.03.19.12.26.49
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 19 Mar 2024 12:26:49 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=m0Ddcer0;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rmf6g-0001MW-Up; Tue, 19 Mar 2024 15:26:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rmf6f-0001MD-Uh
 for qemu-arm@nongnu.org; Tue, 19 Mar 2024 15:26:41 -0400
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rmf6a-0006FZ-Ox
 for qemu-arm@nongnu.org; Tue, 19 Mar 2024 15:26:41 -0400
Received: by mail-ed1-x536.google.com with SMTP id
 4fb4d7f45d1cf-568aa282ccdso6008918a12.3
 for <qemu-arm@nongnu.org>; Tue, 19 Mar 2024 12:26:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1710876395; x=1711481195; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=HpQ3X6Lgu0pz4QjyV48H9UCXm4tRHs7K2dJ1EJJ4V8I=;
 b=m0Ddcer0QW3Pmi3mDN210k46W5ALv/4AvpAuGTMAkElcktzTx+KEy0JBSRDPwPuA+P
 qAMEWPcfAQZdgme7bDzjCKw/FYOfQ6p1xypX2hLoExAXC5nXZrYfi0DiP02muxP4yHih
 e0Lz/t+gKp9zPjUdz0G3H/kjTjPrVYAa4ODKeDXYGW1L2Wl3yUR90UdeIBqkfxID3B5i
 BYWchzocuKsnG2XvBATfX5bJW75BW0jv4ZVfCemVKnbLflTeFCixwQq6bYg8kevhV7rv
 dW8X0sM+wjPjn62HzI8eRi4m4KZ5zh5G8Y4HWjeM4C2DOGW7CQSANyHy6WMBk8TrFcT7
 MwOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1710876395; x=1711481195;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=HpQ3X6Lgu0pz4QjyV48H9UCXm4tRHs7K2dJ1EJJ4V8I=;
 b=KvC64Kg18/jCGYmVx+H0HVSdnwo+9jf9WGU/k/ie7SZGiV+GlG8PImPJrzP8fKU7aP
 b+70w1k2G0M9v8WjDNmz3LFtAoglqBlAcZcswPNP2DVsTI1gIJ4uaAfUPs4vjDbood7b
 i/2Ztx0YdESL5yv3OjSE+U1wYYiiSrgop045vhVyg5XhJvvbS9pVFHgp46T5zyJbqeVY
 IDWmS5eiTlfQFFKbzrv+xCb1n5zus17Brfbn83SGor6fR1dfikZnrDNVBdO2EvIyEC6p
 BenKz2f13ucsjpudqg/wU/wTw7q/fVZVIrE1ZeY715vfgQGA61Wyor33QFEjb5wh9i0U
 7MHA==
X-Forwarded-Encrypted: i=1;
 AJvYcCX6EyNELk1Jyo3AEmjVK1nPsnMPkI5Xsg19KNitcVadR3QMEadmamrFHfgGXTUldfUVf4WtvGFQpPDqzf/xIGZoQg+o
X-Gm-Message-State: AOJu0YzjYu4SmTbu7Di+PsnaOwnFszi0A7aSsPV184sKliUpcDl7RWsi
 chYoyTmBSO0W/7UPK6zrgPpKRx2BcilRT4Dk5qCswGy8QbV4phviXi6bonNqGmopg/S3bcy7okg
 2ysUbKAJq7kCTmPe4PyQJKfR2i0w1hN/ggEmgqfGRP6rTHenX
X-Received: by 2002:a05:6402:5001:b0:567:fb9b:37d5 with SMTP id
 p1-20020a056402500100b00567fb9b37d5mr10656218eda.32.1710876395101; Tue, 19
 Mar 2024 12:26:35 -0700 (PDT)
MIME-Version: 1.0
References: <20240318093546.2786144-1-ruanjinjie@huawei.com>
 <20240318093546.2786144-7-ruanjinjie@huawei.com>
 <CAFEAcA_xSHAJnn0_O9=zGo9u8omzhuB_WvuMo9gf7wKt8OVDmw@mail.gmail.com>
 <cb5d981a-6db4-479c-9eaa-bca49c40bc72@linaro.org>
In-Reply-To: <cb5d981a-6db4-479c-9eaa-bca49c40bc72@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 19 Mar 2024 19:26:24 +0000
Message-ID: <CAFEAcA9bKcu0FrfqRGg6bbtNX1kYR04_oian_5YXaduq_a3W3Q@mail.gmail.com>
Subject: Re: [RFC PATCH v8 06/23] target/arm: Add support for Non-maskable
 Interrupt
To: Richard Henderson <richard.henderson@linaro.org>
Cc: Jinjie Ruan <ruanjinjie@huawei.com>, eduardo@habkost.net,
 marcel.apfelbaum@gmail.com, 
 philmd@linaro.org, wangyanan55@huawei.com, qemu-devel@nongnu.org, 
 qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::536;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x536.google.com
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
X-TUID: ZsbC+89xIw55

On Tue, 19 Mar 2024 at 18:51, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> On 3/19/24 07:28, Peter Maydell wrote:
> >>       switch (excp_idx) {
> >> +    case EXCP_NMI:
> >> +        pstate_unmasked = !allIntMask;
> >> +        break;
> >> +
> >> +    case EXCP_VNMI:
> >> +        if ((!(hcr_el2 & HCR_IMO) && !(hcr_el2 & HCR_FMO)) ||
> >> +             (hcr_el2 & HCR_TGE)) {
> >> +            /* VNMIs(VIRQs or VFIQs) are only taken when hypervized.  */
> >> +            return false;
> >> +        }
> >
> > VINMI and VFNMI aren't the same thing: do we definitely want to
> > merge them into one EXCP_VNMI ?
>
> We do not, which is why VFNMI is going through EXCP_VFIQ.  A previous version did, and I
> see the comment did not change to match the new implementation.

Why do we put VFNMI through VFIQ, though? They're not
the same thing either... I think I would find this less
confusing if we implemented what the spec says and distinguished
all of (IRQ, FIQ, IRQ-with-superpriority and FIQ-with-superpriority).

> > The use of the _eff() versions of the functions here is
> > correct but it introduces a new case where we need to
> > reevaluate the status of the VNMI etc interrupt status:
> > when we change from Secure to NonSecure or when we change
> > SCR_EL3.EEL2 or SCR_EL3.HXEN. We either need to make sure
> > we reevaluate when we drop from EL3 to EL2 (which would be
> > OK since VINMI and VFNMI can't be taken at EL3 and none of
> > these bits can change except at EL3) or else make the calls
> > to reevaluate them when we write to SCR_EL3. At least, I don't
> > think we currently reevaluate these bits on an EL change.
>
> We re-evaluate these bits on EL change via gicv3_cpuif_el_change_hook.

Only if the GIC is connected to the VIRQ and VFIQ interrupt lines,
which it doesn't in theory have to be (though in practice it
usually will be). Plus it feels a bit fragile against
somebody deciding to put in a "this line hasn't changed state
so don't bother calling the handler again" optimization in the
future.

thanks
-- PMM
