Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp1804105lfm;
        Thu, 18 Jun 2020 09:30:07 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz/P4r680W5A4E+ymCSxPpzxkQz/vkMufJ1SHcaF2tMQxjLg1Ok3S6eBrqKIiwy6r07LA1+
X-Received: by 2002:ac5:c94b:: with SMTP id s11mr4306414vkm.8.1592497807146;
        Thu, 18 Jun 2020 09:30:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1592497807; cv=none;
        d=google.com; s=arc-20160816;
        b=qKAKOJptWIh1qcgVOL+NnriNvYnYkminPvfBhwdrAq0fSrzkr2jPCCPpW4eEumkf9U
         TAirqZFcMJTHVz8POZAR4j2/f+tGA+IUFj8uawWt0LeVGCc51JFhpAlVIgqBqSnG5Bbg
         M0/QIpyu34Q9moPcW8vHCrjgBa304Wm7Ci73u6edAe1BK+nz8BysMJIJ/6rlU5tEsmIz
         UfA/a+StQhoZEGTPiEjb/sVv5p5hEoZHstOfmr4abuUrq2GWVPiXWeVgrmJa5Dp38wNy
         bt/t0mTzaHsu3qNq76jODfP5g/vhlRUV3JQwbD2BvNBGb6OBcZiYcXNWc2i4K5Ektcks
         p1SQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=p0UQiUF33jF1gDDSPvXQLHMcCRkJKJSj3orBSTxGf7c=;
        b=xftzHXSBbOLdnU0OEZkajwjgqsdh2e4aIXgnvgZTOJWBYPo5eUz8CwcFvg1VNRy6Oo
         81ppAXjoqVanVoA4t8sHOXgLUNy6IOpwoBr/J0GxbIBsRmI2ed+wzKnmTN0FrY0ENmVn
         VgDe/9F19RQmT4rBsVhngOphdLreUGCOBaUEsGDypWLFRQUAIARStgi1WOt3YrXidoTb
         YjDzijtAZJUheDX+IqUe+Jwbao44rPk7WQO29Un7jaa7Apfeky7r6nkVYz46YMM9vhn5
         +zqtYHZi6jRDdntUYxT2BWGrG6v9ckacGql/XJdTL0F3X5tXiDsew+VXVprzJNkjerfv
         giVQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="XP/eBI/R";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g7si474041vsr.267.2020.06.18.09.30.06
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 18 Jun 2020 09:30:07 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="XP/eBI/R";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:50494 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jlxQU-0005es-EB
	for alex.bennee@linaro.org; Thu, 18 Jun 2020 12:30:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49660)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jlxQJ-0005dS-2h
 for qemu-arm@nongnu.org; Thu, 18 Jun 2020 12:29:55 -0400
Received: from mail-ot1-x341.google.com ([2607:f8b0:4864:20::341]:36690)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jlxQH-00023B-Iy
 for qemu-arm@nongnu.org; Thu, 18 Jun 2020 12:29:54 -0400
Received: by mail-ot1-x341.google.com with SMTP id 97so5013032otg.3
 for <qemu-arm@nongnu.org>; Thu, 18 Jun 2020 09:29:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=p0UQiUF33jF1gDDSPvXQLHMcCRkJKJSj3orBSTxGf7c=;
 b=XP/eBI/RL38Okkr+hQVVjb25R0WueyRFTVACGBP4LqyglGqEA5JWz/aGiOnzilopHd
 /wJJZwKYdWYRGJdGGMsCZsXFzXTKftG88Xk5YL/RvwXyT6pG8V9RwiMdpRZS/fGvsQwc
 y6meYr/xavdXaDeoInAPd27l3HoWC3DrLoz1GWNVp2vmqQMnFBFVn/d3yy01WOpjwOOF
 jBIyPvvsA2B0ODQoKwQEBaq+hITcfCGjcKNT5OoG/l1GyfVr6T7sUNHExP9nENroW5EK
 n/MGipehA7V+M3dFtYCY8aCjiNjA7ujsCsdK0wfTF142J1dOSkY8uqG4a5HSxVB0SkTf
 KirQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=p0UQiUF33jF1gDDSPvXQLHMcCRkJKJSj3orBSTxGf7c=;
 b=RBT93lXH9n/aPU0wbpisTEF5NrWuJB0CC74OerYkKPrkIxqL5upYeQECjdTKaLo0S7
 MfXPvXoLvhBaScwxOIJafvEbiiw7+TfUdFW6uzLxew72/hwKpE3lxoUQM8J2hfeMGA5p
 60yfHbBxBxh/5YZqNp63pylc7PQruYTp4Gc5hciH/BAWs5ueTJMvJXpamLsUOCiO2N55
 yuqgCvdR7/rY/CR17+WLITXCEkUTaifqChLFDRlNsJR+EU5HtLn3GRO8vV1NUnWy2bdD
 6yGWrUwog3wbd+SnXaR8Ksnm+zqWB1DKlOz3dDjVG4xW0of7yPwO4EE01uHNXLM2JN9y
 PC0Q==
X-Gm-Message-State: AOAM531IjQgzyYQq+KclQyvgHS0Tiz+PLyGK/MiQuhqifBTQ4bVEHrc2
 rUnwp4RYKvtYtKF9gS9AxeQEQdYOwSHxxee79Du6ig==
X-Received: by 2002:a05:6830:18da:: with SMTP id
 v26mr4346308ote.135.1592497792307; 
 Thu, 18 Jun 2020 09:29:52 -0700 (PDT)
MIME-Version: 1.0
References: <20200603011317.473934-1-richard.henderson@linaro.org>
 <20200603011317.473934-22-richard.henderson@linaro.org>
In-Reply-To: <20200603011317.473934-22-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 18 Jun 2020 17:29:41 +0100
Message-ID: <CAFEAcA8+bJtVn+tsBr--WBYJ5f0PzhEL_Z4M7eULX3sHm9yWyQ@mail.gmail.com>
Subject: Re: [PATCH v7 21/42] target/arm: Move regime_el to internals.h
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::341;
 envelope-from=peter.maydell@linaro.org; helo=mail-ot1-x341.google.com
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
X-TUID: cU3TVK26cB4C

On Wed, 3 Jun 2020 at 02:13, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> We will shortly need this in mte_helper.c as well.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/internals.h | 36 ++++++++++++++++++++++++++++++++++++
>  target/arm/helper.c    | 36 ------------------------------------
>  2 files changed, 36 insertions(+), 36 deletions(-)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
