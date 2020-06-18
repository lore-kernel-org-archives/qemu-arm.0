Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp1524670lfm;
        Thu, 18 Jun 2020 04:03:34 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJykQS5mlLgF4ximalllath6yfZapOlUyJlAkDxTvvgMoz1aF/zwWrx9rTm1ZlIDbhz6S4yC
X-Received: by 2002:a25:6807:: with SMTP id d7mr6049828ybc.202.1592478214654;
        Thu, 18 Jun 2020 04:03:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1592478214; cv=none;
        d=google.com; s=arc-20160816;
        b=vH58BqrdBBfW66wUjF8V8SzUvqqRNUDEFIPDJV2j8noQ8OcxCMgwjMRY0nPVxb8JXd
         +DzdryQZYuJpyXyuW4OqaVjggvH7qZkrEYeX4rnDtsRXFUJcPIPvIZ3oVdvoxWud0DzS
         p6B782D2WWMobifRX5FZq3Hs+uP+VBoXuNx4JsUL1eMGQ8yz2ZlCIl16eAnmL0ztv7/v
         LFTs/6pBOuJi2pr6javupC2ALYiYo6uO5Cq2KFRh65FenpWN05ZgnNQKSyMOyt7S4UlU
         0wGXZDeHp8k2bCF/fltoYmtfrDboxEZFEt+H6tC/IS8czKKl1znUJTlJearizJ29DuX+
         RJQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=sblb7qlJdr34B47GIhwzR92sWkubK3mKOcyUPBBcXEc=;
        b=LDBnTOsehQ7Pdu7K2r7GEDXhfBj2AbNW+x8aEBycf2LAvDgLJa5CekMdFCWuBJSE1F
         7VQY8q0IdBv3KTU6q9ZIZIIRzYUdaHjs0+RGlLDgnVBOOwp3KTDyQ5+elo8OV4WBrgF4
         X94vVY0da2hR0hsUatQtsg9omxEQNHTKUHLaI53vq8luBCmYjkCfHtQDnu1/0BgRdoeJ
         VwlddASFLp2f09ghODVIQwbKzcIvHMjNgZk+TvVLyFUbId6hkc5zTRX2WrpGFvzISarK
         8hJweUPWOpCNLnDc2xLL87IEGwppE6hpvxFt1gwadEy24SA4MzC6YBGxNjEV2IuB7UKC
         QCBA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=ucaUpmgo;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y11si2334754ybm.53.2020.06.18.04.03.34
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 18 Jun 2020 04:03:34 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=ucaUpmgo;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:58558 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jlsKU-0005FV-1T
	for alex.bennee@linaro.org; Thu, 18 Jun 2020 07:03:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52488)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jlsKI-0005E0-HW
 for qemu-arm@nongnu.org; Thu, 18 Jun 2020 07:03:22 -0400
Received: from mail-oi1-x244.google.com ([2607:f8b0:4864:20::244]:41935)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jlsKG-0004i5-U8
 for qemu-arm@nongnu.org; Thu, 18 Jun 2020 07:03:22 -0400
Received: by mail-oi1-x244.google.com with SMTP id a21so4672512oic.8
 for <qemu-arm@nongnu.org>; Thu, 18 Jun 2020 04:03:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=sblb7qlJdr34B47GIhwzR92sWkubK3mKOcyUPBBcXEc=;
 b=ucaUpmgop2q4eutZnwqY+teLFGqoyUvnu3KAlbRfpht+f/MBPDOEgjtztvBwmdLyhF
 O6s2lxvmHzn1JsuDMCUXCC5EVNQdktCxyVxgwJMM1Xg4C2XhH2fKFRK9K2toM7dj6MJW
 An3WliX9wJPevEblMBWkeVqBD1IQcIoyugeDH5B1c43iOOjK7cgxGvMqZNrvpJbFdAN0
 uzVqY3qZpkZDHt1HKxrTWy+aox852goEAiPUzkSikiJ/cadFY/1oiScRjn5XnV0ch4FN
 DJdVy4qExsLxKJa7kNQp1Rh7cb6+agBt0e9ooWbFLeUcVKAYEdNDDwrEplU9L0ygK+xo
 1glQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=sblb7qlJdr34B47GIhwzR92sWkubK3mKOcyUPBBcXEc=;
 b=nTWvvm4MQxnTbXLuvtetwEZ4bcNKFSJxqvml2fJAfb5HtvhgXCU7tZ/kO15ZaM0e1l
 tWGcdinMwDXcN6orEczfMLM+8gRYySu//P2Ym9N1rJ5BzOnMhAl+FuCggEGa9+xP9mvM
 S2VVYHZjWH5HBGnjlKJilocELsBO5iVQFQfOgmH1qIQU97fDxDC0HEhxGIKZMYuDzrEZ
 pukRAx0JkkwtH1YinO6N1E0lRXo8Hc+RMDuxxJaT2E1eyV1d7yXx6pu42K2/gonSpHt0
 xgx1pTOgwtNsxR73GB6CvPAyJZjdRwvBU9XAwgim2kkC8nODCaEieOba4FpKgBGIqC29
 0cXg==
X-Gm-Message-State: AOAM532vILYOjJTHQS2dYC8Vdiin+K3xUkq59vu37XyefDpMYDErSM+p
 hVwSSO0AYufwRH0Qr4U39wXdj07OiD2rhSE9I8PeXg==
X-Received: by 2002:aca:1a07:: with SMTP id a7mr2351759oia.163.1592478199972; 
 Thu, 18 Jun 2020 04:03:19 -0700 (PDT)
MIME-Version: 1.0
References: <20200603011317.473934-1-richard.henderson@linaro.org>
 <20200603011317.473934-6-richard.henderson@linaro.org>
In-Reply-To: <20200603011317.473934-6-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 18 Jun 2020 12:03:08 +0100
Message-ID: <CAFEAcA_dbXptwF6GiQ=o2sM5Wvbrv+fVegxS4HYOo8fP_w2ifg@mail.gmail.com>
Subject: Re: [PATCH v7 05/42] target/arm: Rename DISAS_UPDATE to
 DISAS_UPDATE_EXIT
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::244;
 envelope-from=peter.maydell@linaro.org; helo=mail-oi1-x244.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
 Stephen Long <steplong@quicinc.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 4cNOM/8R2Zw6

On Wed, 3 Jun 2020 at 02:13, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Emphasize that the is_jmp option exits to the main loop.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
