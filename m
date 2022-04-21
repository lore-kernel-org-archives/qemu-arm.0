Received: by 2002:a19:e348:0:0:0:0:0 with SMTP id c8csp243817lfk;
        Thu, 21 Apr 2022 03:37:15 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzCn724cXXfR4ZqaTbEs9HIjbTjG/g8N37WupVKOnEUcJq4/hAfc9mDNP4ay4zZE+T8UxF/
X-Received: by 2002:a37:594:0:b0:69e:cab5:b5a5 with SMTP id 142-20020a370594000000b0069ecab5b5a5mr6746871qkf.555.1650537435094;
        Thu, 21 Apr 2022 03:37:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1650537435; cv=none;
        d=google.com; s=arc-20160816;
        b=DhT+sgjERk3E7NuXVZpjMg0YT3F18FJ+daoJszCzM7PseoXwU2V6HX1Crg8MwGh7i6
         w9jxYwYcT5zIXoyx5NS26Vle7uM5hB45zVY0bBdmMqpzwzhpZsziPloYEqjrMwbKDtji
         ZzqLnW6IZEr9QULKyKe3ed9yHAsKdY+RQNuq8S/gDtTtM/iEeiUpa8taP22jFg/xSyoU
         Kmhd6TbHgyKeZ3/mQgtyEsuYjK2926sOEYWbWN8XUNNmWdArWde1p98B6VPAo55tLg/t
         /KoyqRYoIcABhuEmkk4ZQ+mkDjCR15EoaYiZZv6c0T+EjkldEqVUtjw/VpMg0KyOz79/
         icXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=5IeXp5BZ/Lq4abNTc4ertLKWbmpOp/1JUq40+2cF+gE=;
        b=U5EmYijQ6WcZrCbU2lK2n0kjkKLMo5O3BaLmnqWwO5hRKLWiEulEyKayZ4WfCupKw6
         072O2ado7PzBkakI8fxiBj67R/6RgNCg+j7KLAN/9mb7gmFg/4kwj8+ctflVIsaQeiqa
         EPo33Qpgks3X1gAffY+lrKAq9gUb2l4BLYt+4xEJVkKq4uvA5IhZrFG5kimBXpbZzMyw
         zZXZKZHTjhGqzZ6RoK9bqlyACTjFzql+oe7OQVo4SIvdlzTXBI4faHoMsrWj77IKtzDv
         jRCQRGT+P7PH2iYAr1Cn7LuqoDVQynJMS0+eVe+g/MkajD/agEeRvBWVsAT6bqD46diZ
         zSTg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=i2p+boBM;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m2-20020a05620a24c200b0069e951d7d55si1348749qkn.163.2022.04.21.03.37.14
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 21 Apr 2022 03:37:15 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=i2p+boBM;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:53532 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nhUBW-00079o-KT
	for alex.bennee@linaro.org; Thu, 21 Apr 2022 06:37:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44220)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nhU27-0001G2-LH
 for qemu-arm@nongnu.org; Thu, 21 Apr 2022 06:27:31 -0400
Received: from mail-yb1-xb29.google.com ([2607:f8b0:4864:20::b29]:45634)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nhU25-0001sX-VK
 for qemu-arm@nongnu.org; Thu, 21 Apr 2022 06:27:31 -0400
Received: by mail-yb1-xb29.google.com with SMTP id g14so4585615ybj.12
 for <qemu-arm@nongnu.org>; Thu, 21 Apr 2022 03:27:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=5IeXp5BZ/Lq4abNTc4ertLKWbmpOp/1JUq40+2cF+gE=;
 b=i2p+boBMkO66POGkuC0CeoLBjnidpcdbEG1pfZUlSDRvEQqmtHVRMTPajMFspTfS+c
 S+lKAGWJcwUjBq9HniCRhOwgf/4wRc4bDX/9PkAuC+aMaFwgxgTsI5ObfcQgOzOlnsqz
 /6jmZv5lt3i5AlJk1HiTOgMToF0ZjW66NprradlYulsjwi7QRLakkXLQVG+IH4C+2tAk
 t+jL7E8PRQcf1SmRNcgMVkha7RpqerV2Mm6l+y8lKqpoF0TZsraPcZ3iroLJU4p/+xkb
 vEEsz3oyecX4XY7YlLm+EK1vsZJKppBMyv4kes88lqMUb6HZanNpbiMpB58ifYyS/7fy
 IfLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=5IeXp5BZ/Lq4abNTc4ertLKWbmpOp/1JUq40+2cF+gE=;
 b=xr94Gc7jsDfJE17t42aY6sdYVxiIxehbOC0+hOKa/hozUrxU0i7dbxCHU3By6hHHPg
 GqN+dNx6ditJKampJXDiWq2U83aIs2oIjeaSVAr3ZbV1Bl9syths8s8HcxFMhQYUTZEG
 v6zp0gwGUjKjCPk2wecQPfAr+uNdUYwNBWlqbr+qU22S94TrNIF02o+Xolg6LKZu/oOF
 7EgGvzNLu98xh6AgjvCrXHs+Tb2U4mfSSEBtXMKTFkff0C1OEAX5EclwLqmP1CBpPfOU
 a4UtuJFAdoONn0PgoVth3Bxa1BvheUUhnrb+TOe+W5ZgfxyOwBZyJHHLcPTb2ONp3yNq
 2AkA==
X-Gm-Message-State: AOAM533rixmtH9H+2gpvN6EnFykQSqHEwjb7v6Dy8Z0e4aGlSSyBCG9R
 axXhJGPuOsk3kZv6FPRyzyhVF4R5tDeFdUhWdWDwJQ==
X-Received: by 2002:a05:6902:34f:b0:645:463a:b824 with SMTP id
 e15-20020a056902034f00b00645463ab824mr10662950ybs.39.1650536848803; Thu, 21
 Apr 2022 03:27:28 -0700 (PDT)
MIME-Version: 1.0
References: <20220413231456.35811-1-heinrich.schuchardt@canonical.com>
In-Reply-To: <20220413231456.35811-1-heinrich.schuchardt@canonical.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 21 Apr 2022 11:27:17 +0100
Message-ID: <CAFEAcA-1Tbx8GkAH8aKGy_n9z=OHpCF_wJYMBsbMwSoyEtsx9Q@mail.gmail.com>
Subject: Re: [PATCH] hw/arm/virt: impact of gic-version on max CPUs
To: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b29;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb29.google.com
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
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: My08+Okg4CAn

On Thu, 14 Apr 2022 at 00:15, Heinrich Schuchardt
<heinrich.schuchardt@canonical.com> wrote:
>
> Describe that the gic-version influences the maximum number of CPUs.
>
> Signed-off-by: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
> ---
>  docs/system/arm/virt.rst | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)


Applied to target-arm.next, thanks. I tweaked the punctuation a
bit to use a full stop instead of a hyphen.

-- PMM
