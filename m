Received: by 2002:a17:906:1917:b0:98d:b2f5:1316 with SMTP id a23csp5595417eje;
        Mon, 17 Jul 2023 03:07:12 -0700 (PDT)
X-Google-Smtp-Source: APBJJlH30997KoWZWuud238RT7Epc7cqTTQ6tSXVUWzxibovxrIpljxV5+gbJ5W/aKVut22qtraq
X-Received: by 2002:a05:620a:2801:b0:765:4073:efce with SMTP id f1-20020a05620a280100b007654073efcemr15760835qkp.19.1689588432581;
        Mon, 17 Jul 2023 03:07:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1689588432; cv=none;
        d=google.com; s=arc-20160816;
        b=fDEdCSgU8rXcMr4wwycK5iaE2F6dRB+y79ysGbZPsNQxpAoQuja+qhyj09HmA2m4vT
         R4HfqHWiQtEBleLMho94UKa3nhgd7hYnaX5P59MXAy2S4bClaofdRi4lOP1cVG5b8RCf
         tfRFdbp03uat9JeemUpVQQ0nDY+9QLhTWeCtPB1PRiTMfhH9V+K1E99ZsNu8iW4GSRdb
         Y066AmkT8Pud6Q3/rz5ONbuAFtMKfFXwBRA/5bU9QmJt/YSWcbOGZKwOHy3QYATdEUeo
         KDCvwTw2TbyQN8VsH62Zd/vn3JxnSI5wpdr2b/EWfKEG7AtFLHla6C1wX0h60lBG1Lc+
         I9+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=ZXioWKpL1zjv4no09PxR4pj9jStifUansD0PqqrGhlI=;
        fh=wn3+cteJrN0CZhF2JIVnoyz2euzWjlsGoL0HnyOpTkA=;
        b=pwiMVlMGJPaOe8ii6tpNx9UZdoDRr595wouBr33mWkxTnm5WZnWyd9uPTe+pWsPeOM
         Hy48AjIJiv1EUD/KrjBJy/6fj9RaNvYkTyhQr3C/P1RCzQTMSWeCaKxcS7E4c6xTBS8G
         F9a+AxnWLZN7p64TDIunfOz+Z00vE+FmziIw3jR1Q2Wnx88ZALPmgkRfgkN7+oWqhDzD
         oU32hPJPD/gR7Qd5bGBRX2gd9bctfxeioL/ivnddJ04pGC9l9X43Vw/0T18ME+68RyFV
         jDem+KMOeeEt7bMixqAv3nnuV+XisTgBnbPrcf8UJiXH9Yat8DjyV5x9An3yrIRb7tHe
         kNxQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ACsK8U3r;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o6-20020a375a06000000b0076719299da1si7455021qkb.766.2023.07.17.03.07.12
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 17 Jul 2023 03:07:12 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ACsK8U3r;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qLL8A-0007GS-BJ; Mon, 17 Jul 2023 06:07:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qLL87-0007GD-Lc
 for qemu-arm@nongnu.org; Mon, 17 Jul 2023 06:07:01 -0400
Received: from mail-lf1-x131.google.com ([2a00:1450:4864:20::131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qLL82-00035t-OM
 for qemu-arm@nongnu.org; Mon, 17 Jul 2023 06:06:59 -0400
Received: by mail-lf1-x131.google.com with SMTP id
 2adb3069b0e04-4fbf1f6c771so6825327e87.1
 for <qemu-arm@nongnu.org>; Mon, 17 Jul 2023 03:06:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1689588413; x=1692180413;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=ZXioWKpL1zjv4no09PxR4pj9jStifUansD0PqqrGhlI=;
 b=ACsK8U3rK1UvG3rqTMzVNLiHQqrYu4Y5z1v+WToKTZ8MkFcjW3dMak8H1Z8vOYSDpn
 /va/DV0mUoDuJxbbnFoVCf65P+k28MJwHMrkW2ogCs3MsHTidsQho7b9REgOiO7ZYd8X
 p06wZemuRvxDPNAsuShS9GbY/KnycfZb/oNU1Dm2GWNEacXyCHZxbaRDdqg0/zAs6zLi
 BsHMm8DA8YLZ1sfJESGN68jwBMYbnB5H6FRJb1MCuNvYPWgmlyubC4kPlaPjQpWThHkX
 3JgXyAXV3xG42y9rpgEV4D6SyQ9pDIJfnXVXVGyO9mShCcbs30UfB0fL0RCrTIHhqhOo
 bNIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689588413; x=1692180413;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ZXioWKpL1zjv4no09PxR4pj9jStifUansD0PqqrGhlI=;
 b=l7BN9A+mxxQZlAR8E2aFtrMvj4zfm6lB9CD3/UE+N5JwHaWdCo9NA0okhqd6bjg7Uk
 fUgEhmiSbRTXY44RXqFdjWEkbCXvPGmvFJ6hDzh9LAu5b1P2yzrYQ1IDyJWuwwNgzIlQ
 2MfNdfvPZOGGpYp+bQTgvbzl29CSjVChZ708ZU88NAfZ5lt/dyVBWlG1xf6CyFKLRUEr
 Cs82tlwB2yKPf1zDVCnL8VHh89gKWpq8VmQt1pYFhQNo9LfJreB3EwN3FWnMj5oaQt0u
 s9LEC3YH24P3LFVXFhYhzRy2XsWB/8SkdAOoJZPhGyuB4Etmf/oTnQ0qOtSN7ztZgVJ7
 rVgg==
X-Gm-Message-State: ABy/qLasFvBoY1jMUkVr6cdJAt72RpYZQplBqdmUMg5DxpzKZ7xsnULg
 Hzfsko4X0fkqRlPTfFWVTKQVwz0IRBAdlYbabmSqBQ==
X-Received: by 2002:ac2:4e89:0:b0:4fb:9341:9921 with SMTP id
 o9-20020ac24e89000000b004fb93419921mr6484794lfr.52.1689588412717; Mon, 17 Jul
 2023 03:06:52 -0700 (PDT)
MIME-Version: 1.0
References: <20230426211607.2054776-1-tong.ho@amd.com>
In-Reply-To: <20230426211607.2054776-1-tong.ho@amd.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 17 Jul 2023 11:06:41 +0100
Message-ID: <CAFEAcA9m0E9AQr=KaaeyLE8o=YQWO25uEq3su-mQ4+Td4wBxow@mail.gmail.com>
Subject: Re: [PATCH] hw/nvram: Avoid unnecessary Xilinx eFuse backstore write
To: Tong Ho <tong.ho@amd.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, alistair@alistair23.me, 
 edgar.iglesias@gmail.comi, frasse.iglesias@gmail.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::131;
 envelope-from=peter.maydell@linaro.org; helo=mail-lf1-x131.google.com
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
X-TUID: jNUDH2oM7iCi

On Wed, 26 Apr 2023 at 22:16, Tong Ho <tong.ho@amd.com> wrote:
>
> Add a check in the bit-set operation to write the backstore
> only if the affected bit is 0 before.
>
> With this in place, there will be no need for callers to
> do the checking in order to avoid unnecessary writes.
>
> Signed-off-by: Tong Ho <tong.ho@amd.com>
> ---



Applied to target-arm.next, thanks.

-- PMM
