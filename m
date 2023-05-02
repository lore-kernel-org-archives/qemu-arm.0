Received: by 2002:a17:906:779e:b0:94e:fe67:1757 with SMTP id s30csp2066353ejm;
        Tue, 2 May 2023 03:04:31 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ663kag5rQwjaVmeyRxMALTCWdr3ZIIgH4IRNe30bJePCumKK3c3EzQMuyd2LuupmlJNgwQ
X-Received: by 2002:a05:6214:212d:b0:5c2:6493:f631 with SMTP id r13-20020a056214212d00b005c26493f631mr3767036qvc.51.1683021871241;
        Tue, 02 May 2023 03:04:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1683021871; cv=none;
        d=google.com; s=arc-20160816;
        b=n23ndKhMJ0lpwRQvY4YRZjIcQi3ZJfhehvG/RPR7vNW55x8hLiDKpF6SRF9wmowK+m
         2QxohhD5ewvZg2bQ6uRUCrFFtbQVWswKbrQn9q4TKFZrVKRyAdZjz6CMyMA0GEK/y7PJ
         lzTKHDIUPqTOjAUa/5K5V2Intrbee4lHbZPJ+yLPwXw7vrtnZG2H2SkMSZbA6b1D2Zrn
         hZj3UWYCBx9Afmzr6boC3KiXvIipG6uCJzNJa+SFjn7koQbrZZt48VQazeIaUC71qSXi
         TObsig7QkYdglT8A4PY+DMkPyU7ay9CFauKRZfFY4sPxbg+FcfYq0cPJQngk/I/aEwhF
         2qjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:cc:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=F2efKstLuFSV2MwPlPlbWp39OrAzVcirlyPZoHjWxX8=;
        b=DpEm/C6uQnelaPpOB6BZOxb49QV+eyfbugyPOAj+4IqS2+vdkhg8+JJ0Sv25MVU3L/
         sN+WbjJJ+b29kSK1LS6c18Y60/1R8gUe0u95thQNHdzllJPzf8RkKIhoxH7lVXZbxLwh
         2EgKh5h66PzHxomJWvWXav/xoM3bsMnxkqIFds/FGPGvsbxAEK0ZjMHCKEqEFoZLL7So
         UYlSwXzNzpzKY/42vThZjcvRnWLVD6i1tkuNAOWiR0fdBiqsNOMTfQJxGiNERHfUSD3S
         H658q8oLBPO4IrR4zXr17+ODD7F3P3ThnR9euK2uk58LeU7z+GvGL5arIOVO2vtMr29H
         DLFQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=WXgrKH9T;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 16-20020a370310000000b0074a8a66d1d2si16923856qkd.366.2023.05.02.03.04.31
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 02 May 2023 03:04:31 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=WXgrKH9T;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1ptmrW-0007MO-T3; Tue, 02 May 2023 06:03:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ptmrS-0007LX-Ja
 for qemu-arm@nongnu.org; Tue, 02 May 2023 06:03:56 -0400
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ptmrP-00034c-NZ
 for qemu-arm@nongnu.org; Tue, 02 May 2023 06:03:54 -0400
Received: by mail-ed1-x531.google.com with SMTP id
 4fb4d7f45d1cf-506c04dd879so6043893a12.3
 for <qemu-arm@nongnu.org>; Tue, 02 May 2023 03:03:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683021825; x=1685613825;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=F2efKstLuFSV2MwPlPlbWp39OrAzVcirlyPZoHjWxX8=;
 b=WXgrKH9TumB8FN41nv5jkLm5kp9sv/0rQgdAgH6QETpu33M0KGkYACVYKeiWjL3Lad
 tlvZQCXvbkZath0dQF3Ge/5I9e9XC2/p4RvQOqv5XSDT5rmCqm4666UyPSpyS1+FrzWV
 UA7l2H9UmeLLhJycoAbqRdTXTfsjnZMvMnrCjcVA0KbPZhgYhT/yrcbpF2ipx+NuamZV
 fp7dIRA1PZkCjXh/w8jdJ/Nq6xcb8o9ubVxH0SST3OGNEyoSGkxvIHSanDCjyvsNRKXX
 qpFT1O+F6jlMNiJgm6H/tiTvjEiCI5I+yP4GKcMfJsP7bTaqJlV9qPfXK2iv59OAe7w8
 HC+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683021825; x=1685613825;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=F2efKstLuFSV2MwPlPlbWp39OrAzVcirlyPZoHjWxX8=;
 b=RCdTA1cAaxC7tI9gGdeXvPArh5j2aDfyzseeuX8AsZO7+GubjnpikXOgYYVY4w1ADW
 v6Q1ngOhgKsQv6GisoJJ2fqnNbzqkteRmQFr8KsdFK+hwmyt0oTD2EbKTV09rwd20mth
 jhzAW8K5NCtwsXa1tWo1sBtE4UhVsC0cXwnV9exYoj3frpiIS86UUy6Tjw2qroWFEhWj
 hVJfeudBe0JjXIRMgjXU7Ihus0DtoxFt9Np0DJpHTnzGsy8jGyvz0D72I9X6c/ESM6eZ
 v4svdGAKFkknvqPZ8IqmkKfnlz81qfRRjBQA1Let7jZxqfqFM+W4pcLDvlhOb11pJA1Q
 actw==
X-Gm-Message-State: AC+VfDxoLuMxv1JNmiaCnlW+iA/RTb7QfV2C0fUg2GZRqsRfUQ3Zw2C8
 QzdIpqbAtG4X5513IV7E3hnBQneKzgn1ZL9Whx+GGQ==
X-Received: by 2002:aa7:c1c3:0:b0:506:82b7:10c3 with SMTP id
 d3-20020aa7c1c3000000b0050682b710c3mr7358687edp.41.1683021823680; Tue, 02 May
 2023 03:03:43 -0700 (PDT)
MIME-Version: 1.0
References: <20221003173810.1933849-1-venture@google.com>
 <CAFEAcA9x7oC9sQy8XNJ8-WRc3X=qBVL1nMLB==dGM=+O5Z-CAQ@mail.gmail.com>
 <CAO=notw1yJeKPdjU65dAXbDgY0y8u1s5MDCcymLqCiw=pTcRiw@mail.gmail.com>
In-Reply-To: <CAO=notw1yJeKPdjU65dAXbDgY0y8u1s5MDCcymLqCiw=pTcRiw@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 2 May 2023 11:03:32 +0100
Message-ID: <CAFEAcA-c1fYqxaeJrWntfhhna9i4nb35MXtn6YTS6MrH8KYyww@mail.gmail.com>
Subject: Re: [PATCH v2] hw/net: npcm7xx_emc: set MAC in register space
To: Patrick Venture <venture@google.com>
Cc: hskinnemoen@google.com, kfting@nuvoton.com, qemu-devel@nongnu.org, 
 qemu-arm@nongnu.org, jasowang@redhat.com, Hao Wu <wuhaotsh@google.com>, 
 =?UTF-8?Q?Phil_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::531;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x531.google.com
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
X-TUID: Cmadl9Bl8LSm

On Tue, 25 Apr 2023 at 21:49, Patrick Venture <venture@google.com> wrote:
>
>
>
> On Thu, Oct 6, 2022 at 6:18=E2=80=AFAM Peter Maydell <peter.maydell@linar=
o.org> wrote:
>>
>> On Mon, 3 Oct 2022 at 18:38, Patrick Venture <venture@google.com> wrote:
>> >
>> > The MAC address set from Qemu wasn't being saved into the register spa=
ce.
>> >
>> > Reviewed-by: Hao Wu <wuhaotsh@google.com>
>> > Signed-off-by: Patrick Venture <venture@google.com>
>> > ---
>> > v2: only set the registers from qemu on reset
>> >     once registers set, only read and write to them
>>
>>
>>
>> Applied to target-arm.next, thanks.
>
>
> I think this was missed.  Please take a look.

Oops, I'm not sure where that got lost. I've applied it
to target-arm.next for real this time. (I corrected the
placement of the variable declaration but have not made
the changes to use the ld*_p/st*_p functions Philippe suggests,
because in this patch we're just moving that bit of code
from one place to another.)

thanks
-- PMM
