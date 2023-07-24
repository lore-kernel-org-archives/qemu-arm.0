Received: by 2002:a17:906:b78f:b0:98d:b2f5:1316 with SMTP id dt15csp1989576ejb;
        Mon, 24 Jul 2023 09:17:47 -0700 (PDT)
X-Google-Smtp-Source: APBJJlHTqolOWT4B7DfbzfVtuL47Rj0RNrBG6IhRipW6KDYXYa0af/wv0D2Da987OvFL7M9pdLpx
X-Received: by 2002:ac8:5703:0:b0:403:a8d2:85f with SMTP id 3-20020ac85703000000b00403a8d2085fmr262687qtw.33.1690215466869;
        Mon, 24 Jul 2023 09:17:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1690215466; cv=none;
        d=google.com; s=arc-20160816;
        b=bg2zfsxD6WU9o96zdBVVnragIs9Tg1Hs7dyYQh3PtR7ZMX+1kJwsMLNlEsF4asA6Jz
         YwUG1EvTo1JoM6ID3W/sJO+eCKW1EKRGAYEoeddkKRDXVBhlB+oHk2XUDe5yJksmdhxY
         qV7ZJOvb3kDDokIkFJuhpxhnPR9XHLyRP/VDZH1/3R+YirjYHkkBGF/LIfPnz6WGGFii
         l6NDYGFg5YBF6hJtfi8CuN8nN84uTKqhFBmCou3mvotPdnep498JTg5YwvNQ28UgAn1k
         n77p11mq+W2f2DEr/Zvr0rOmJW8wPr5AH2/oPqC+akrnYEJh1ENXyZ+4WSu43Ggn7fn7
         G37Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=JN3MDCdPNG2g6560ElPxOu7MMO4UMoPxvRTcDXdyEfA=;
        fh=XBL7wuOnmyes3GPK3AEoJ+XBo7B8JI753uFIVICnU40=;
        b=pwnr/ppH7s8ZpJBWt95hiaG3HlxhW5JLK7xtaARwKT69AGKMxxbFOqUMynxckf/XJy
         MgFJMjy9uLqSb4+xB9Bd9FSdxtNd47pnMV6WUCvGm+eqRslvmrFhpRt/NohdZTDfcfCU
         ST3Ad92H5s1epwElmsNnP1MV72b5T852+vd7I6yWwAaeJ4xtLTWPruNKuKn5ZA54exmK
         8+qPs5DEfdMm0VlH8OjFFXmueNk9ezCKzQzgT3KcgoLjygs29WWIUpbDnIoLEFzKq9CN
         m5BZx6/l6hmr2n71nEln21MGhDjiovN1ticDh0nfIzY50jFpUJq26xddLqKYtLfbD9s8
         tN3w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=tEyjYvgk;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h21-20020ac87d55000000b00403ac542600si5546751qtb.101.2023.07.24.09.17.46
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 24 Jul 2023 09:17:46 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=tEyjYvgk;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qNyFV-0008D1-80; Mon, 24 Jul 2023 12:17:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qNyFT-0008Cb-KG
 for qemu-arm@nongnu.org; Mon, 24 Jul 2023 12:17:27 -0400
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qNyFR-00073f-Bd
 for qemu-arm@nongnu.org; Mon, 24 Jul 2023 12:17:27 -0400
Received: by mail-ed1-x536.google.com with SMTP id
 4fb4d7f45d1cf-5217bb5ae05so6067933a12.0
 for <qemu-arm@nongnu.org>; Mon, 24 Jul 2023 09:17:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1690215443; x=1690820243;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=JN3MDCdPNG2g6560ElPxOu7MMO4UMoPxvRTcDXdyEfA=;
 b=tEyjYvgkCWZyfb32AuAg5H0jBR+lS+hSUKKHIhArEoaplVCgjKC4uQ382Hzrdgut1S
 Q86UtDm5HD+q/oaMhdhzR0tYwjrqEqzTzYqTrLoy/oquXrTcc1l9lImyNwCc3KxytZRu
 jVKVgrw6Z9aEbZ3RAhL7vCTizAjFn8WE1imw1ScJnRXpvOsixUp66fJglwcgJHaF48H/
 fl3xBbakqe7HIC5rbbegRpMfYEmxnb+Iep7W2sex2Ft5PWuPdz1hvs3ApGHx2RUfifN+
 +5QgiJd7vbFbYsPnV0g+ptNt4Q5kTFj2k4NsDgjF+ZzzPsHlmLMxJ8490/ogrtVKP+x/
 /KCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690215443; x=1690820243;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=JN3MDCdPNG2g6560ElPxOu7MMO4UMoPxvRTcDXdyEfA=;
 b=S5J/ijbW6dqdVHIdJEOxBAd3snwvbDd3c3hl2eKOFGK2XEJCT3OnHXBS5/dv+cdIdW
 Aa+6y5zIpJm4DVi0HA5pMYkZh648lbWxgof7SW59hyRfd9nDHaCxbOcObsVXzZGIrOko
 zvnYoWzV+dcdcbZpbQCoe059Fr1Wax3irYJUsoi27rYYi7saZv8YfZcTA54gvTg9bbR9
 U8Bms1XHD9kybYZpddnbZ2lRef0yRlgI6a7qv1OEFHPLiyFYhA/K7g9XgbawdZmjOQYa
 maEQVBeYph9O/z0JPVCxQDPH27lHuBCnE1utZK1shnZ3RFtL2zQbqE57VsMChXzc0AQ/
 su+g==
X-Gm-Message-State: ABy/qLaQrnvaPcQs0B3wt/1mhjJvntrzMrzdMT+6pWEDRnYludOik5Oz
 Hi2SxM3gfDhR1UzwKxFwk12oZGNBF1GdUqo+qIVVkQ==
X-Received: by 2002:a05:6402:3453:b0:51d:e498:201 with SMTP id
 l19-20020a056402345300b0051de4980201mr8750672edc.27.1690215443123; Mon, 24
 Jul 2023 09:17:23 -0700 (PDT)
MIME-Version: 1.0
References: <20230714232659.76434-1-chris@laplante.io>
 <20230714232659.76434-4-chris@laplante.io>
In-Reply-To: <20230714232659.76434-4-chris@laplante.io>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 24 Jul 2023 17:17:12 +0100
Message-ID: <CAFEAcA8NPQP23Gnf8fURudWt_3O0OhR2eUuwqzG9A3mm2Stuhw@mail.gmail.com>
Subject: Re: [PATCH 3/6] qtest: bail from irq_intercept_in if name is specified
To: Chris Laplante <chris@laplante.io>
Cc: qemu-devel@nongnu.org, Joel Stanley <joel@jms.id.au>, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::536;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x536.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: 7E0aNHHwoG0W

On Sat, 15 Jul 2023 at 00:27, Chris Laplante <chris@laplante.io> wrote:
>
> Named interception of in-GPIOs is not supported yet.
>
> Signed-off-by: Chris Laplante <chris@laplante.io>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
