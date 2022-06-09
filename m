Received: by 2002:a19:ee12:0:0:0:0:0 with SMTP id g18csp619376lfb;
        Thu, 9 Jun 2022 11:24:39 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz4iRZ8klYHEZWdJAbqJPtVPdL9iHK+JWwN98VrH7UORpOsAnrz1CVHCiLDfi0QcPn5GsZ1
X-Received: by 2002:a05:620a:166f:b0:6a6:c230:f5ba with SMTP id d15-20020a05620a166f00b006a6c230f5bamr13878586qko.280.1654799079614;
        Thu, 09 Jun 2022 11:24:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1654799079; cv=none;
        d=google.com; s=arc-20160816;
        b=vWu/WN3Ozk2LfEgic+9iC9TeavKdQl4YQT/juRlreBUMA4NhOnh1y9R+Bl+ciNMlgL
         DqalSLbVwwW3KnYoiFmfSdpt+06Kh0sNmpXD8uHrOdu85SS6VsO8Xi2bsf6Q7lIbRspG
         DFzUoHzXW/W+F5oAv8GACcrieHRfQdFKQ1qkrYu2JZ+hQiZ59F2ThhAivajFvh8j1Pka
         57RHS1hmxDMJ+tJP7p3du2s6LizTU53hsCq/BbC7BYh0UUv7OUpS9dYvmSHHBi8NTdFW
         j500HuHV/FhOgM8GHWzJF9NrqP4Q0W7CMc2xtmh3ZdiWAjY3Lz6lut7RVUc9KGAsgwGk
         bIJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=6xAVpoqHFm+71KOMFYJQmJ0/62hwCwd48un0G561MT0=;
        b=TTEQRk2zkOXk6WGGbqfdISknqyhsHsQTuHwgky6dnSkN6yktIZs3Ggm2avmMYcLHap
         zeNBUiQ3hUNsmKDnhoXyEsJj/5NxG4i9eJ1berSQO9xH4R/UGKirwh39EXmMd+KLfYQd
         0dpcqfXZgUkJBXzYeqKpQpjuOnMabIPhw2bde0KjiN2BwS5owGRYs/EMgAt4l93guwqQ
         S3T8wS9Fp9klGOIUDrBmr14bnzCbbpre1Fl/c8lqxvGSNMtMZ+kghKgGRWoV336XQ+bE
         pClnE6K3pES+I6iu6TmH9NsnJmRwHv/y/diwfkB4/cmvAqlvDBsGPZY8GPZ6Paji0iHY
         0dtA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=TvlmJYc4;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o18-20020a05622a045200b00304ece78644si6861397qtx.530.2022.06.09.11.24.39
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 09 Jun 2022 11:24:39 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=TvlmJYc4;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:38032 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nzMpj-0006pQ-4U
	for alex.bennee@linaro.org; Thu, 09 Jun 2022 14:24:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45092)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nzL94-0000Vm-HY
 for qemu-devel@nongnu.org; Thu, 09 Jun 2022 12:36:30 -0400
Received: from mail-yw1-x112d.google.com ([2607:f8b0:4864:20::112d]:43829)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nzL92-0004as-RW
 for qemu-devel@nongnu.org; Thu, 09 Jun 2022 12:36:30 -0400
Received: by mail-yw1-x112d.google.com with SMTP id
 00721157ae682-3137316bb69so52222877b3.10
 for <qemu-devel@nongnu.org>; Thu, 09 Jun 2022 09:36:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=6xAVpoqHFm+71KOMFYJQmJ0/62hwCwd48un0G561MT0=;
 b=TvlmJYc4c+NMEpwvQ14RayKyAEHbi2byJWoM9Ob2PhWZBxgpj3UcfcLGallETZnUeq
 fR86vMvMttROLsi5nbs3iklue7IaesSSOLgFIrSf5unntzPLtIYvOQUp580YOt4sXmtR
 Kztr4KcfcgmsuHRHcKlFPQZirnydFrFS5KDJw96iGzkUjp+hCViT9Z8UDSC7wIS3/RiE
 8k2G4WFoF4d2v2rm7w4NofVsYRv5kgDbzUa9eS4tct7cVm1XTfy+s0YehiaRQq6qfE7I
 6+dOQpAPTEXrorb4bFBxmsqiteMx3ckoRo6VE1RW2zKx5BXUIok5TL+SWejWWSJB8WcM
 ogFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=6xAVpoqHFm+71KOMFYJQmJ0/62hwCwd48un0G561MT0=;
 b=IAWZmGHY4b91qm1neYS06GS3IuD88/CUH8Tb7jOwElMZFohZhrg7L37V+zHgTnwKyB
 Y7Ys99QSZWmtncRP9yirJ2oEwIuuKWGpF5cvo2DcmeKxijwSLtJq9/8Sty43OK+mqV5q
 E5Ls2/mXzkBfDCuDEWcv8tQ8HsUkyHG8Ava0KmBBCjIZJHrnWMMrEoilLHz2Lt8rNBoL
 c2QAhMeTtBhS9XObjI7j7BfY55aG03AU+cCQzATzvkbHKGGch4sG+4wZHo3mp/p0atBb
 xrpgI/YDbzcfqe+k9e2NLwjWMwjiLGAsT8O4BKUYL00bgKpNqkm4DnObzhTp/QDBU7D6
 GMBA==
X-Gm-Message-State: AOAM532xKcZiNaw+D/CDtPiNomroMyVkv6DF9sJSOi1ci6Xzq7drCa0N
 ttnb9JLGQNkj8hBbAUsG9Icue9V+Pj4K/vTOTm0gJw==
X-Received: by 2002:a05:690c:808:b0:30c:4f5c:b319 with SMTP id
 bx8-20020a05690c080800b0030c4f5cb319mr42354437ywb.64.1654792587874; Thu, 09
 Jun 2022 09:36:27 -0700 (PDT)
MIME-Version: 1.0
References: <20220607024734.541321-1-richard.henderson@linaro.org>
 <20220607024734.541321-16-richard.henderson@linaro.org>
In-Reply-To: <20220607024734.541321-16-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 9 Jun 2022 17:36:17 +0100
Message-ID: <CAFEAcA8KhDtAjACeDLM05U+kCSM0e0+HYrOw55=_2CszbTwBxg@mail.gmail.com>
Subject: Re: [PATCH v2 15/25] target/arm: Remove TBFLAG_ANY.DEBUG_TARGET_EL
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::112d;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x112d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: u9ZeK7gymfj1

On Tue, 7 Jun 2022 at 03:54, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> We no longer need this value during translation,
> as it is now handled within the helpers.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
