Received: by 2002:a17:906:4f0b:b0:a47:c39e:cbe with SMTP id t11csp286292eju;
        Thu, 4 Apr 2024 07:14:28 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVHTNzXg/gLtjMYZjhNtgfoZufljmHf32tTrR2Oae5kSh1sIqleDrMUDL1iE/wsELvwXvp3/tGiyFzMJSTrKyMm5zBXnkpi
X-Google-Smtp-Source: AGHT+IEPkx+S5lsKi9Re0wSNsIxPO9Y+x4ZhKSI5+v7cf78xHPMbE7EKfL0lICtQDPgiryKBloMA
X-Received: by 2002:a05:620a:28c2:b0:78b:ea24:cf66 with SMTP id l2-20020a05620a28c200b0078bea24cf66mr3438534qkp.55.1712240067828;
        Thu, 04 Apr 2024 07:14:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1712240067; cv=none;
        d=google.com; s=arc-20160816;
        b=nKIIaXGyYmBkiozIlqlbqRitvKkqQ+P2BY4BG9PQQU0cC+n/Qx8SSwZ69UYCcLasjX
         X4JHl4CIxg+wQEQ6bk5EqekdwXkLuhELoCKuA7QegoUnZcC0KnvcRMyMqorgAa6xrIO0
         IDckz0D9rPHhZbQNNgFuxf9iX2yNoTxadbbBOajlkN6HKCrb8l6tTS8Dl2MjCXmNSt3O
         q3RROeeroXchB/ba391qyrCk+C97+Np13DfCcRjnH1+cy6EdUnZEUiNNcKjYC4S8dyuZ
         FBOcN7FZuAm5zTy0kGwKVakTSByAJ7Bi5IsEK2rZ/VrH/jGDmVRDSJtHTOyHb5G2vV4d
         CQ0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=Kw8qSm+jj7rowiqyw2J7UwXOS57ueFbUIQr2KQjl2JA=;
        fh=RCi6BpPOSxuwrn4bstce56WWVbF3BgYSkXhepxIpvlM=;
        b=daFBTrCShYZfT5OXUmGPv9pbI3p0Y88dTVzElh42wj1jdW8Tr0ygk2bC3w6BHbDiem
         HnwcfqzF6cBxHdh6SjWcw+uJjMaeUro+jKMOgyXTJ9E838xJ377lyj9SCb2OHsua1ixA
         Lg+LvONjqJMs/kWvtVm9olvcmv92iHE0h9RXmsNfqcJ+JFa88+9PHS16lYjKW2yOoCei
         qF+NNuxqwedBh2S4x4eePbab4DCCeWVOZzx2Q7F6z26rQyD1lnFL5QrQiDyB/fqXqryf
         TL73E+v8Ziz1GQv9MEN45udPi/XJEj0BszQdpOrSY/DlhA1sIR5+c+TCDM+cr27S39GY
         qN+g==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=e3onnncS;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ee14-20020a05620a800e00b0078be8098a0bsi9100451qkb.385.2024.04.04.07.14.27
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 04 Apr 2024 07:14:27 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=e3onnncS;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rsNqy-0003IS-6t; Thu, 04 Apr 2024 10:14:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rsNqt-0003HC-21
 for qemu-arm@nongnu.org; Thu, 04 Apr 2024 10:14:05 -0400
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rsNqr-0007qT-Kb
 for qemu-arm@nongnu.org; Thu, 04 Apr 2024 10:14:02 -0400
Received: by mail-ed1-x52f.google.com with SMTP id
 4fb4d7f45d1cf-56e1e6e1d01so961970a12.1
 for <qemu-arm@nongnu.org>; Thu, 04 Apr 2024 07:14:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1712240039; x=1712844839; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=Kw8qSm+jj7rowiqyw2J7UwXOS57ueFbUIQr2KQjl2JA=;
 b=e3onnncSO41qGZ4cAHHM1nK0qYxJOtlKYOBnzLcj8FBKzIMREBEwpRdDX858NG+i1l
 q2AYSNPoj9YxzEGTyjEZ39wPMn3qYPaVW1RQ/07K4qB+Jnlm0xM9HJ1vT7PP63EXwxdu
 PZE53oSsnpB8CxPrM0oJS0IMQcm2fEUvKvzuDO14nincpzyGf8uET663SqnYtjtjmFi9
 mLg7CpkFCiTJI4IwkBbDGLX0o/5+v7EcZI/RA5atpS88oV5AxVbHpSrNLjrI8R2Uis5e
 97HBhKoOQqAX9k53+2kb6mjvkkYKoQell5HWajKIF/rXMADf2mHnE/e8qxfVz/icQNgS
 kPmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712240039; x=1712844839;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Kw8qSm+jj7rowiqyw2J7UwXOS57ueFbUIQr2KQjl2JA=;
 b=kxZKwxmvk5IXQeXXQ8Yplv8Zf2tQ71vxcwwfns6xRYHXQr7x8jDL1q5pBZ/olNO+Jm
 bHoILkZXBB2s31omgQHJ77++HZfl2u4aYdG/PQAp2hUib8ddOGQPEX5ChoTz0UuERXwU
 OQN0PQn+pHUKa2HlzkYQwsfoOURbZkluPXmMAcNUxdu5kbStOirDZf5VV4taYwMxMPc0
 mobm3Im7kXaza9/YlaoZ4LM0gTuL/c3Jv43sMuB9wwNJvPjMSTRdbeL5Fksetvg628d4
 RAs/ZokxBeojL8HphQyfO6JWmyDyJx3262iwo1qsitsPJdg0S1u5BTxtj6veJgJxo5Ry
 peDg==
X-Forwarded-Encrypted: i=1;
 AJvYcCW61gDZgZDeFaC0A/531lDx1tKJyZj175c6esT+hIprdrapdqo9PRDzZ0Z2DTWvbg+EpNHADcq+H+rGrNTgJzu2B34b
X-Gm-Message-State: AOJu0Yy5g4o7V/EWF1kHKOQ3zg8ClLS4/omeU7DiHt550f92ZVy+F/iE
 xTsyY/6QLWQYhUddC+B8a/G+hrVvfht/6ZZNVGvDccijU/kcZ9iHje2G8H1zTvotkx3Jq6085/o
 MF46Hbl+ztsJYYjnRowT0+Rw54Z3m0SfViCcUUg==
X-Received: by 2002:a50:d4d4:0:b0:56b:defb:3b59 with SMTP id
 e20-20020a50d4d4000000b0056bdefb3b59mr1598780edj.19.1712240039130; Thu, 04
 Apr 2024 07:13:59 -0700 (PDT)
MIME-Version: 1.0
References: <20240403101611.3204086-1-ruanjinjie@huawei.com>
 <20240403101611.3204086-6-ruanjinjie@huawei.com>
In-Reply-To: <20240403101611.3204086-6-ruanjinjie@huawei.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 4 Apr 2024 15:13:48 +0100
Message-ID: <CAFEAcA__1g2zD-d3HWP=N5i4Ln2bmskx3QHp3tVOga5-MteCvg@mail.gmail.com>
Subject: Re: [PATCH v12 05/23] target/arm: Support MSR access to ALLINT
To: Jinjie Ruan <ruanjinjie@huawei.com>
Cc: eduardo@habkost.net, marcel.apfelbaum@gmail.com, philmd@linaro.org, 
 wangyanan55@huawei.com, richard.henderson@linaro.org, qemu-devel@nongnu.org, 
 qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52f;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: R/1CGtNB98Fr

On Wed, 3 Apr 2024 at 11:17, Jinjie Ruan <ruanjinjie@huawei.com> wrote:
>
> Support ALLINT msr access as follow:
>         mrs <xt>, ALLINT        // read allint
>         msr ALLINT, <xt>        // write allint with imm
>
> Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> ---

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
