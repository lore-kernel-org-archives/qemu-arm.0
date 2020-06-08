Received: by 2002:a19:711a:0:0:0:0:0 with SMTP id m26csp5041765lfc;
        Mon, 8 Jun 2020 05:42:40 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx55UzfTZUnxazjJbrhim9YXaA8qn8B8ue9x/cBvtWxzfGkEUgHJyYqiquTYXHpQ9bvV+BO
X-Received: by 2002:a25:2041:: with SMTP id g62mr29077490ybg.429.1591620160494;
        Mon, 08 Jun 2020 05:42:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1591620160; cv=none;
        d=google.com; s=arc-20160816;
        b=XPPrQ1cXOIB93uAyn9E1jeiH+KPL0HemNDV2kpS240VzWCA2bzyPMmUfv4+6gQUKHh
         2gCeUT9rPgs78aoF9Q2hgTbj7p/I+BxsxJROR57fIyhdIUTzObJSgJ3iMXlaHWvHmwq+
         6CSEPAcBjWOlASYnVnks41NX89bRrD3U1CfluI8UbADofbDgRJBM/jPWwuc8Wj0Rb+ZA
         tm+rzCsX2mazE0AkjqeXjhpEgzP1og02rXj1uNqdOJ1HIetf/RA6GQeRnYOJnWdt+CPx
         3zU/WbAy2wT1Qia1txvCC736oFNMBS6Jp3Hz8+AAAvGM4xmIWem9PoAckN8JXVV1N4XM
         Jm1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Omxn7P4FlLl3jBaswxwaVtO3d4iliVsiPp1MUZ1VqPw=;
        b=uTiYcRCwb56Gjz80iJFErAPXNF4tpzXfhLlyV8B0lkRQoJfAIy7RKoDtrdqDeS6wcW
         E6XuMRIhwm+nnNgckoxRZOZEI1dtjzNcpmIjMqwM/TVwkDVkAFrCyaWupgqHv6iKq0SV
         nlZ5NpbGvy7TYdlwKGhDMWdlhZuBfFtOpIna7Y8pU0K0SUHCkxIffHMFmZ8yoMBIxvSB
         qiayMRzP4DYOmsBa2hZ5FZkkcst6p69O/BvtnH0vg9bceDi2GSEb798noaVPS3OPb/GW
         WBHdxH+0zsd/s+CbnlZQEw4KUmVP4k5bYb6ujwqhY7+Zc1/QK7FRYSncRI1/Nj7bSlpE
         Jotw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=a8vuKUnj;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m127si14528754yba.424.2020.06.08.05.42.40
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 08 Jun 2020 05:42:40 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=a8vuKUnj;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:45074 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jiH6t-0007vQ-RR
	for alex.bennee@linaro.org; Mon, 08 Jun 2020 08:42:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41752)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jiH6n-0007uy-0c
 for qemu-arm@nongnu.org; Mon, 08 Jun 2020 08:42:33 -0400
Received: from mail-ot1-x343.google.com ([2607:f8b0:4864:20::343]:40654)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jiH6l-0005dw-RR
 for qemu-arm@nongnu.org; Mon, 08 Jun 2020 08:42:32 -0400
Received: by mail-ot1-x343.google.com with SMTP id s13so13465867otd.7
 for <qemu-arm@nongnu.org>; Mon, 08 Jun 2020 05:42:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Omxn7P4FlLl3jBaswxwaVtO3d4iliVsiPp1MUZ1VqPw=;
 b=a8vuKUnjBOJC/c0w8g0OoH+5eVD12ZleykJ6aqQRDv5n+YRoTadbqkQuGNpNy4RIfQ
 rFOP/XoqFG6xvxyCMA6M5p49ZOyunVqH5B6u/6AR2ieFJe05r00kYqmUnWNfR6e+uI/Z
 ndiXWiXPckksJ07JmT3Nh9KEJAhmabJ+6ZAMj6n+al5CwTTiSuvoQjwoqe1Rd827oHKo
 BnVLyLtnwKRUwaCf38Ov31YpFfx6uhjO3bIgrQrDYoYwC6AMbbDX8COmHi5bKgE6fRS/
 Crpx9v8hf/BGhQcr3gpJwVHhGVWPEuQx70Gjz8Iv4xd5Wrknd42k+MYguiVA8jD0A/+P
 5NGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Omxn7P4FlLl3jBaswxwaVtO3d4iliVsiPp1MUZ1VqPw=;
 b=DDP9tOC8PufQiivmOKk0+mOtJxhNQfxnkUZ4XHrL9Gtg0BjcvpWqNJBme5VBC+BA3Q
 JsHeNx0ojbLd1CZiFR5ZXg8bNA/gON4aXdhmyYrgwT5iy1G0b/SUT0bK+LkHpj+7jZ0B
 6fvsb4aCmmoDWJdkb8XwLMbtFPuhW4g+5x7BL7CPJaYD+AlMdaJRGE9+3eWp6kVThPQI
 EWB2/oSObM51kR1BolKq8dAdeCB/5TTMJJLceZS0SVLVei3HeHhiK2iOF7mdy0rL/Eiq
 OMX3D6q5rXgiFQaOLGG68sq1YhkhYpgshuotm8lFcHdpxbxLpyuWM9A7QQkIsErxWleq
 atXA==
X-Gm-Message-State: AOAM533kbsvwZtuQvEsFrrUYYwrW+sdIxCaNm7IHBHFHv9i434hO26GF
 xV1+h4fOMacOHln1+5BPgrGQAqB8GAn0B8J+xEf6aQ==
X-Received: by 2002:a05:6830:8d:: with SMTP id
 a13mr7502617oto.91.1591620150378; 
 Mon, 08 Jun 2020 05:42:30 -0700 (PDT)
MIME-Version: 1.0
References: <20200604125544.GW28566@vanye>
 <20200604131802.7w4hncgq2gopbw6z@kamzik.brq.redhat.com>
 <20200604160300.GB28566@vanye>
 <CAFEAcA8MTB5VQQbMuSfkGc9JcGeawL_GUY8Pcs3yxT9kdncZJw@mail.gmail.com>
 <20200604162607.GC28566@vanye>
 <CAFEAcA-wX-vKek_Zt5hmjiQNP1utCO7yGJQPcuny1M7xncYsQg@mail.gmail.com>
 <20200608120226.GM28566@vanye>
In-Reply-To: <20200608120226.GM28566@vanye>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 8 Jun 2020 13:42:19 +0100
Message-ID: <CAFEAcA_V3eqzxDRbn-K3C4EKCsHx5rhcMy3NiZ8Y7gB=C3HzNg@mail.gmail.com>
Subject: Re: kvm_target, QEMU_KVM_ARM_TARGET_GENERIC_V8 questions
To: Leif Lindholm <leif@nuviainc.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::343;
 envelope-from=peter.maydell@linaro.org; helo=mail-ot1-x343.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Andrew Jones <drjones@redhat.com>,
 qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
 Rob Herring <robh@kernel.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: /CvmjIV6w5ag

On Mon, 8 Jun 2020 at 13:02, Leif Lindholm <leif@nuviainc.com> wrote:
> On Thu, Jun 04, 2020 at 19:43:06 +0100, Peter Maydell wrote:
> > https://www.kernel.org/doc/Documentation/devicetree/bindings/arm/cpus.yaml
> > is the official list of permitted strings, incidentally.
>
> My feeling is none of the values there are appropriate (arm,armv8
> indicates ARM ltd, but not aarch64 support). I made something up for
> the RFC set. We could always send a patch adding some qemu, or
> generic, target.

arm,armv8 is the generic "for software models" target, which
sounds appropriate enough to me. Anything consuming a dtb
presumably already knows whether it's in AArch64 state. If
you needed to be able to determine that from the device tree
then I think you'd be better off defining a property for it
rather than having some kind of lookup table of "these compat
string values imply 64-bit and these others do not".

However, I've just noticed that when the kernel added this to the
CPU binding list (apparently in passing during the conversion
to yaml) in commit 672951cbd1b70a9ede6f9c6eba4ed6b726d32b03
in 2018, it documented "arm,armv8", whereas the string QEMU uses
when KVM is being used is "arm,arm-v8" with a hyphen (or
"arm,arm-v7" for 32-bit KVM), which is what we've used since
2013. So I guess we need to also add the with-a-hyphen version
to the kernel binding documentation.

thanks
-- PMM
