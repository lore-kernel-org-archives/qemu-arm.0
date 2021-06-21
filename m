Received: by 2002:a19:ca1d:0:0:0:0:0 with SMTP id a29csp1924397lfg;
        Mon, 21 Jun 2021 03:42:30 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzF5m6Nqzwe0eBrzPvLKlqm4dlhhJU5nGohTSHiZ7Pspn4inoAB1MsFunl02YfKK8DitLju
X-Received: by 2002:a1f:c644:: with SMTP id w65mr13519938vkf.12.1624272150744;
        Mon, 21 Jun 2021 03:42:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1624272150; cv=none;
        d=google.com; s=arc-20160816;
        b=xAAgFqtz8xORgUVtvIHRbTJipd+QD3sl6cbW+Qwt/4kQLiJbRYZslUv+woy7uObg6E
         XJfXIZ2NjtGGDw4jyLaA2qDptVYg/M6lSJmsQEfK4JoTEa1OA9N8mG2RSZdOubLT7qoV
         T6sYjZtJzRN8Xb0X4+fb+6cJJ+9mveKR70LcAnUfv5h8Rxg/6cQwsNBiVxopsODa1uKr
         ++BlpOho6RAx/8trgLfLTtwIDzbzJJVGYJjMVz4/jjAydvfuZa0+3Ti8+ll97m7fRA4U
         /8u9LKwtRWxoHUAeoEY1grygmO3QEeMUKTccukChNV3V2CMR24nCDfjsDAptqEEg0nIG
         SR3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=euDIMfdif4hfuxSIEYdj+9uKBob9bmEhRYjfTESE64E=;
        b=Js/cYP6GgQZUFHTJ1uokxGA5K6MTJJ2ZNttFm+yE9XiXjEmROuH+3dAIYY3pjdnp8+
         0Y11z/FgzmLTyuhMIC+XcHyZpUz5KipicgMdD+aZJoMwGKZM4ikwQagdz8DO9ioM/AqQ
         cD7lVG4t0cB0bKsLmWDkqj33AK1CIIX7Avx9dvhJaSD4VnKINWFFXuCbfSWqQYfDHJal
         OlRuITFz7DOQ+X2CxrugB97kL5C2jNMSiQSf1CU07wo6ehdbkL6mzbr0y56eSaI8hoGi
         /CEQzGDPlWXK1O30Iwxr2IEc51WJd8RP4AC1e8yVJnYqEUT23BM3Mbm1JVhOBXm/mGVq
         gu4Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="zfM7y/FU";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n11si9753890vsm.198.2021.06.21.03.42.30
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 21 Jun 2021 03:42:30 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="zfM7y/FU";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:39844 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lvHNt-0006l8-VO
	for alex.bennee@linaro.org; Mon, 21 Jun 2021 06:42:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39662)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lvH3I-0004Ja-GK
 for qemu-arm@nongnu.org; Mon, 21 Jun 2021 06:21:12 -0400
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f]:38739)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lvH3G-0003C5-N3
 for qemu-arm@nongnu.org; Mon, 21 Jun 2021 06:21:12 -0400
Received: by mail-ed1-x52f.google.com with SMTP id t7so18139777edd.5
 for <qemu-arm@nongnu.org>; Mon, 21 Jun 2021 03:21:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=euDIMfdif4hfuxSIEYdj+9uKBob9bmEhRYjfTESE64E=;
 b=zfM7y/FUFrg9hYPDNJQ5epCK6asud0HhR37cZu5af9jA3HGwdqcVI7gIkV8Ju11Nd2
 /t//6tm2mjiEUdAH6BuUH/dfu9y0MCXoprCb2Dvz2JJhadaVystVgOq3mOUkGOdnjgZN
 d3uFGznwFcUeaMC/eyxvYUq0BOJ6g6nKl0fQaltLy/0Yq0BsR3aaT98+MT7z3DP6ouGR
 PUwzpyBp8TadIPp/ysVp5pP8+vcR85IjTlSb0OgMF+JTGQFU/Eb+FsYgSuW8Nlpvs/zo
 y5xfD1wCWSbPiKlNr7ZnGeavTA7D6pFzllNJLjmZVXxeRwnAkEr/WVvcC6ZAtN1IqULS
 JpSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=euDIMfdif4hfuxSIEYdj+9uKBob9bmEhRYjfTESE64E=;
 b=YNomFB6NpmGJWGnLA5kSashOvAufZWpmMN0qnOQ+R0ljOwX96tFxAZ73Pqoz7svF4I
 nnHolwH7LV9zy+RCoQ5PVjFRuhy8LOV1UgMJW6dm+AoiV4z1aBF0bZ1TbdZU8OTvJ5Vj
 gLbEMlqcA7uHGerzXzpop880mEnFADYHYWIJ9zF6Zeq+fJrkioJjB1sl9Cs5W1O5eU9V
 w7Re47DjFQrWpti2R8TtIBoshvq2ltBEa7rX+KCFXPa8FYk69l7I2DCxHTvwuo5v3oqj
 TtBQjq3Gqb3DA4um2GdAGkVoCx9uvR9F8No8qmhiP1OV0PhrnaJrs66TzZG2Zl+K9zRd
 c3yQ==
X-Gm-Message-State: AOAM531wzqEvTXeOIQ602OLpeu/ru1UTdcVoXDTZ/F4Or8qoZ6UC6BbK
 iiJpzO4SjtzNMdQSY94ib/SMRAou/x/rRmghdrIsLQ==
X-Received: by 2002:a05:6402:3553:: with SMTP id
 f19mr8383125edd.52.1624270868587; 
 Mon, 21 Jun 2021 03:21:08 -0700 (PDT)
MIME-Version: 1.0
References: <20210621013439.1791385-1-richard.henderson@linaro.org>
 <20210621013439.1791385-6-richard.henderson@linaro.org>
In-Reply-To: <20210621013439.1791385-6-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 21 Jun 2021 11:20:32 +0100
Message-ID: <CAFEAcA_nSzp4VYrqDV_AQYAnvRnHGc-XFR+O=3AdWM0r+OOrdA@mail.gmail.com>
Subject: Re: [PATCH 05/26] target/arm: Use translator_use_goto_tb
To: Richard Henderson <richard.henderson@linaro.org>
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: YI/T91SRbA+X

On Mon, 21 Jun 2021 at 02:42, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Put a wrapper in translate.h, which also checks for ss_active.
> The ss_active test was incorrectly missing from the a32 version.

True, but we almost never call gen_goto_tb() when ss_active
(which makes sense because we generate code to raise a singlestep
exception instead). The only cases I think where we do call
gen_goto_tb() are ISB and SB; everything else calls gen_jmp_tb()
or otherwise handles the is_singlestepping() case.

thanks
-- PMM
