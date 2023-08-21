Received: by 2002:a17:906:5ac8:b0:98d:b2f5:1316 with SMTP id x8csp3470584ejs;
        Mon, 21 Aug 2023 04:55:54 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH/RL8PPQoiMzDUyXYkbexzZzTVp+slpxn/esfxLJQ/EezeS9LWUejtREXFX50l8rFNcl5m
X-Received: by 2002:ac8:4e4e:0:b0:403:eb5b:9569 with SMTP id e14-20020ac84e4e000000b00403eb5b9569mr9021459qtw.21.1692618954022;
        Mon, 21 Aug 2023 04:55:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1692618954; cv=none;
        d=google.com; s=arc-20160816;
        b=jVbCdsus4kXosfWWzG6EsvDCCqWRWdetvxc8Te6GAnRUo+7qW7dFW08SZp+I0kSdvc
         DGdF3xbqGq82J0H76mQreYLOYGMyJu1Wt/U0NfPZJkPNQ0xeXZlcpHKJ5tD1rFnMS0Jd
         Ue/dZtr3azdikS9zUjYfGOCdnEgRSta6E7dU8xJzLMaGIj4Hm1Llnyl6HMr8xOeLzH+6
         2DH8uqHIs7sVm8y4YsRDYPsB9r2UMbdyZ3NxYn0YuZvvpjlr37nzh7dYyNxEsmi1wzYv
         3SQpFlUssuDALt33Vlb/l6tUw58hGM4NCn93W0WhWVPvhyPGkx4fuKwGB4GgRaAwR3Kc
         0jGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=cy0POfvyzG4T921F7DKAmDtOSlVzB6Kg0tm6wZDnhAQ=;
        fh=qQktnNHMF63/lvoaUW87qKTlrnLutpTDl+gH+pSxVgA=;
        b=h+VCxjg9748Hg6TYny+949Rf/vXZmh4GMdLI8ODMOrh3bCp0TpG4ScAduYJp+4eLEY
         m1M30f+0TIHkii6jZxr05bskoNu1GyFhX64/mfzw3wgisyuHb10vCq6W48jZ6gD2pI16
         xkL7VAaIUZpbvo5kAECQozuyPTDOf9/9UflhwW/GXw7S1HjsbIZGMfqQVLDqdN43s4SN
         DI7grKzDtcNHLvSlLzAUzvsfz7Z/kVq1VZfqB+fQXypUjBoyHnEePv+OsK6savTCsYIs
         dCpcyTUEcrcqQFeEhsHcKNvxmD6oKdW7fUZOAU42eR0dykkw1l+1Wt4CVH27iv42wx90
         a9WQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="rku/LCRr";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j19-20020ac85c53000000b0040348b08cc6si4796669qtj.300.2023.08.21.04.55.53
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 21 Aug 2023 04:55:54 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="rku/LCRr";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1qY3Ut-00029v-Ro; Mon, 21 Aug 2023 07:55:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qY3Up-00029L-2W
 for qemu-devel@nongnu.org; Mon, 21 Aug 2023 07:54:59 -0400
Received: from mail-lj1-x22f.google.com ([2a00:1450:4864:20::22f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qY3Um-0003Kz-KX
 for qemu-devel@nongnu.org; Mon, 21 Aug 2023 07:54:58 -0400
Received: by mail-lj1-x22f.google.com with SMTP id
 38308e7fff4ca-2bcb50e194dso22032531fa.3
 for <qemu-devel@nongnu.org>; Mon, 21 Aug 2023 04:54:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1692618894; x=1693223694;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=cy0POfvyzG4T921F7DKAmDtOSlVzB6Kg0tm6wZDnhAQ=;
 b=rku/LCRr1mzzTzYA6pIxCzQwH2ZUnzp8O65B+Q6aFzXMDl5GES3tcpQ+A/We/qRFUE
 sRAHrEP/s8tokZqiOWjGHIuteaaApldL/OGYatcaUls0sXsXWUcB9mz7b6bIMpTM/xmR
 FQFc0gYCQVd4KEJ4SUbOt8WrBN5v+QKVI4KU4Y+e1eDIzddqJCyATdvbVQhtmxDHJ26Q
 Cp02pzAXsJPVVNYfaeky+CwrSJJdxksmlNHqBcjv3n4db0mzgRo/4UheY9ROeHcL1HVS
 F6juNzIKY//blZgZLlnNR6FR/mX9Ef8TbgjmecUekmgJOBKCqI86N8DdRidh23Tb9JAA
 +04g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692618894; x=1693223694;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=cy0POfvyzG4T921F7DKAmDtOSlVzB6Kg0tm6wZDnhAQ=;
 b=UsKo62majzFOjEVBsYepMUQryKyjfyj8ozc4N3+mLUvav2WWPVDNiAgL6W+4iWld3J
 rSpxAEkRLWlP8FeYBKqyL8Hmi/up1GDL/pvzC4/P/n+Aj9GG56nV4YjdI0WVC7XGplFu
 YYgzPsAwlxQzCw4N4J9bZrOEo9VNhZpzf+GCinuqJxDysjIal71vPJU8jhmVrFmyefA/
 CXygpydXvlEMZHsTAL8KTW12aKNlFlYYBwVP2SHasMMOV2JVz+dpi046r1RolFfEj5IZ
 rBIHPCXay4zZcHz9kTDWLoieggCy/ZbqxjEcVGGP1iadIkW4yyIhLMs9wZaVodszcjc2
 JhCg==
X-Gm-Message-State: AOJu0YyP+F2jmYRQUomazWrmxrjnr7JIjcwVmc/SyLg3Ag4Kp8iBdUMP
 Y2k+SuEuhkp2JWnwYUlr+1cWKD61qV1+xa/jJMlEaw==
X-Received: by 2002:ac2:562f:0:b0:4fb:a0f1:f8b8 with SMTP id
 b15-20020ac2562f000000b004fba0f1f8b8mr3702647lff.63.1692618894505; Mon, 21
 Aug 2023 04:54:54 -0700 (PDT)
MIME-Version: 1.0
References: <20230818214255.146905-1-richard.henderson@linaro.org>
In-Reply-To: <20230818214255.146905-1-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 21 Aug 2023 12:54:43 +0100
Message-ID: <CAFEAcA8WYuiuaQg0jw8CnWQn-zjEobLZwa5NpH9KbMof1hkDNg@mail.gmail.com>
Subject: Re: [PATCH] target/arm: Fix SME ST1Q
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, qemu-stable@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::22f;
 envelope-from=peter.maydell@linaro.org; helo=mail-lj1-x22f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: OxvlKDOBn5R+

On Fri, 18 Aug 2023 at 22:43, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> A typo, noted in the bug report, resulting in an
> incorrect write offset.
>
> Cc: qemu-stable@nongnu.org
> Fixes: 7390e0e9ab8 ("target/arm: Implement SME LD1, ST1")
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1833
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/tcg/sme_helper.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied to target-arm-for-8.2, thanks.

-- PMM
