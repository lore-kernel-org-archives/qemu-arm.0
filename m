Received: by 2002:a19:ee0a:0:0:0:0:0 with SMTP id g10csp5023250lfb;
        Mon, 30 Nov 2020 03:30:00 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwrh1dO10c7upxhdO7xhcwkb4Nr9P2iFi4cyDmbDLPQQwZwFHnjUaqgcXioxeFFmK2n2a0G
X-Received: by 2002:a5b:48a:: with SMTP id n10mr24138311ybp.455.1606735800803;
        Mon, 30 Nov 2020 03:30:00 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1606735800; cv=none;
        d=google.com; s=arc-20160816;
        b=rGo6PHmjpE9+43jTjWYgRaCj/G4rYA7b5wlmHU0kNEI5cx8a94+MW/kny2uaG/gjpF
         9xVB6XAkV28Hc2BMvpBebAdd+8+lIFokAKMuhRF0VVSpk8tziYh9xnAVeweFdUFlEVf7
         nOk4gFVFEYF4WF/WkMzbsIpkYShu42OyVO+ZmcfIK5wZYgssZlFj3fYR6YPI1tKIZs8I
         7xZtP+2O0WrFsdf7H/RoJgZdp1Nk71nHewQzUsahW0Um48Ppx/ZbS4zuCHxQMthy84oJ
         PLKRG7mFv0RNRGRyBXxjpi+sdyJHd6389uTXuVJPhjFHd1wdRC3J5Lge0hZtLUkxDFd/
         qfEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=P+o5O/EdfZlNyxRTfK8vGn1ByagQrBiS+Vc7OCE/rAw=;
        b=ipqwzfAuhbaW2CtgDkqsBFkQtZfoAE3ik1lRBgUb72VFOQHGTlhTh6u+XLMoTEh6X+
         f5iyedu+WGSbOdKQdVcaGadKNqU95BEfuz5dtJL6selPmRKHYGdx0mNunPhlJMA5TRDP
         zph2XKEuHrdv+ZMys4JVqGTZXoxPHWhP4sUd7MqmTMDpSJJs095Go2B82OCLKunfn8aG
         Hnl+3oZVkmU2UROSzvDtKfoaPQucHDd4jTMXuYLtY6vHNEQCv7Lnh5MHjXkcqXeFSkua
         3FX7LzNV729DLknxYmT/vNxrxrQfLE3W/wSESnVgmRwmXNaMaLyZZDvTpltU7ONm/d4w
         FhuQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="geh7I8/l";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e188si16904496yba.40.2020.11.30.03.30.00
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 30 Nov 2020 03:30:00 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="geh7I8/l";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:59240 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kjhNY-0006DS-7E
	for alex.bennee@linaro.org; Mon, 30 Nov 2020 06:30:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38508)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kjhNQ-0006CA-1U
 for qemu-arm@nongnu.org; Mon, 30 Nov 2020 06:29:52 -0500
Received: from mail-ed1-x544.google.com ([2a00:1450:4864:20::544]:33985)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kjhNN-0000Hb-H9
 for qemu-arm@nongnu.org; Mon, 30 Nov 2020 06:29:51 -0500
Received: by mail-ed1-x544.google.com with SMTP id y22so7350582edv.1
 for <qemu-arm@nongnu.org>; Mon, 30 Nov 2020 03:29:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=P+o5O/EdfZlNyxRTfK8vGn1ByagQrBiS+Vc7OCE/rAw=;
 b=geh7I8/l+FpGBuKIfpLVFpoygHk/X0Y2SmtWPwVKXPc8y86k0ZUr8RJe0BknhmESko
 AuOlqeKOpPba6GBkSUkGoaRu0ug/xq4b/Pc1wi98D5cc5gEpbc2v8hZv7/QQA5OSS1Sc
 dav/K2FlLufSEHyUtwR9Fi0/SQ4KKq/LnZKkU4Z9+2fMwNjYuG32BdLI8h0cpxw3Kyxu
 qlF1WntQxydEamlr1w3+a7NF6VyoIptl3J5MyhbBVn5EqmAsOLtuchrlyASoBL5zBypW
 Pqfo6e535IqerZUGEPRhh8s1d/kW9gAkogUFrQF3CRkj94XrPBCBfnrw/oABF2CesXJN
 UH/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=P+o5O/EdfZlNyxRTfK8vGn1ByagQrBiS+Vc7OCE/rAw=;
 b=rxIDQqthFSoBoPCVUcnO5pF7hkkO+QkL6DL0b5fF+gCG1qtpPfNKOrZOP3TcqkCZZS
 gGnICB1yBuL5UEkl1Y4l76J/NcGUQJX2L2GX6Q3XGhpo8FHIEkbepvUM6BeSJGrawGxy
 Z/s4O8zrUhPogYwM1Dyl1NFA3p1zx0Z2DvcevItVXn5U+XQOz/KdxQ9HsVwAvMD/sat1
 h6Sb2M2jYh0WYEgp8GdR9FwqAsuTQyKExY2kaKRlkJhDJJkAB7aDZIz7MDXUNtcNABO5
 do2dkjPuht1eR61vXnnT3lbWMfucP9SAzjCKJof64014O7XgXL2xxFnp1c/qvlDZ/2mH
 EMkQ==
X-Gm-Message-State: AOAM532Vr6wjhU2d4YeWrQZvXpcfteUxKzzARD0RJIRhh/0fpTTG7tkb
 yNpQ1m48DVlekEFzayQHwuVGxw9X95r/ayNAXSx6xw==
X-Received: by 2002:a05:6402:3089:: with SMTP id
 de9mr21011873edb.100.1606735787612; 
 Mon, 30 Nov 2020 03:29:47 -0800 (PST)
MIME-Version: 1.0
References: <20201124023711.1184-1-jiangkunkun@huawei.com>
In-Reply-To: <20201124023711.1184-1-jiangkunkun@huawei.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 30 Nov 2020 11:29:36 +0000
Message-ID: <CAFEAcA_tfEO0FaTq_Ud4FE_j93O0ohx3mGKtm2GoGZDfw-ZPAQ@mail.gmail.com>
Subject: Re: [PATCH] hw/arm/smmuv3: Fix up L1STD_SPAN decoding
To: Kunkun Jiang <jiangkunkun@huawei.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::544;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x544.google.com
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
Cc: Eric Auger <eric.auger@redhat.com>,
 "open list:ARM SMMU" <qemu-arm@nongnu.org>, Keqian Zhu <zhukeqian1@huawei.com>,
 "open list:All patches CC here" <qemu-devel@nongnu.org>,
 wanghaibin.wang@huawei.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: kg5tffOJZKYa

On Tue, 24 Nov 2020 at 02:37, Kunkun Jiang <jiangkunkun@huawei.com> wrote:
>
> Accroding to the SMMUv3 spec, the SPAN field of Level1 Stream Table
> Descriptor is 5 bits([4:0]).
>
> Fixes: 9bde7f0674f(hw/arm/smmuv3: Implement translate callback)
> Signed-off-by: Kunkun Jiang <jiangkunkun@huawei.com>
> ---


Applied to target-arm.next for 6.0, thanks.

-- PMM
