Received: by 2002:a19:e348:0:0:0:0:0 with SMTP id c8csp379803lfk;
        Fri, 22 Apr 2022 04:44:10 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxD2IN1iTNQzZdG+rmyFSa0axhkKyHHppftrRRU9Img3DWoqIk2SKTb3lDvEHArJdx80st5
X-Received: by 2002:a05:622a:102:b0:2f1:f86d:3c26 with SMTP id u2-20020a05622a010200b002f1f86d3c26mr2764564qtw.490.1650627850249;
        Fri, 22 Apr 2022 04:44:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1650627850; cv=none;
        d=google.com; s=arc-20160816;
        b=nzMROTdTpPOM3uTGyOaixEFDgJzhh4AAwrXgAsQKnaRaXuqKVotSNBAaH5zU3gGi2T
         WIH0xKxt6g2zbMae0MXvwtpoPz7WIsLIjheHUd2ksxPqeT7Ivoc121V9EAds7r3HomUk
         OvIpcKcqFKt1wZelfFyLIgnGl61gxFW0vBebfd92ti5VVOpcYYSsHHQJUukkXHq65j2B
         ZUmsmzahUnEJW8vOFRjxD0216hjzdOxQyKcYhpKQXAeS3iDOa4Z5ss0jXqL9fdPEg6nU
         zkC0HYiTkJDyBQp8k94zxMByqyrCN4ynKYN2gbbJHki9iRGLOdaescbwZ5LEAsvgwcKs
         vtXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=rRmNnSHf+ODPhAE7K0fD97Ygw0w2yu3EL7tiZYeq9Cw=;
        b=kLexy8RMmipJCI9EZN8obVbor1rKYcnEKFW9uwljrkkee3wcgCpTo/dne3yOnmtZnP
         Un+rcvaSeC0enz4uJAraGkCa1kLA0y1Yne0Rk//9RB8PskEvjIaKztrZ4J7lZdsitL1q
         JUO//trxfE+cp6RKQsiEQNe8MfrbjUTyU4ph1mUvBa/Kmhbak1rh30qUN4nOyLPDYgxl
         DGrXOfAqwcoiXC1od6FkvJUApfy6qGgnhZ1zRhBLMb6SyDdGmkjbCX6Owllk70RIZKW4
         aqgpQGIlXhMNreNq5ge6jrmophO7FWzO8SeW47kBKApSodVzYblmyvKj+XuKDSVXsWoQ
         h8BA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=a97JEInv;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u64-20020a376043000000b0069e6b779ce4si2047197qkb.378.2022.04.22.04.44.10
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 22 Apr 2022 04:44:10 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=a97JEInv;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:60624 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nhrhp-0004k1-NF
	for alex.bennee@linaro.org; Fri, 22 Apr 2022 07:44:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38084)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nhqpn-0005Ux-Rt
 for qemu-arm@nongnu.org; Fri, 22 Apr 2022 06:48:22 -0400
Received: from mail-yb1-xb31.google.com ([2607:f8b0:4864:20::b31]:38734)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nhqpm-0000rU-Ag
 for qemu-arm@nongnu.org; Fri, 22 Apr 2022 06:48:19 -0400
Received: by mail-yb1-xb31.google.com with SMTP id v10so4963214ybe.5
 for <qemu-arm@nongnu.org>; Fri, 22 Apr 2022 03:48:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=rRmNnSHf+ODPhAE7K0fD97Ygw0w2yu3EL7tiZYeq9Cw=;
 b=a97JEInvNSYkKXPgwjQMUBHGwnwu8QAef6dTttg+XrfpoY5y3shQOOjv6R5pHSbo9W
 9Bf5hWXW7CC9mZNR/IGsMNE3sVdZOmkM49waIoFgaXY5LHNCAuVBt3F6affPZ9YVngg0
 VnYl/bIYiSfbRygeuPjpHxrGFmUb2cDx3/K+J/1LdHOsMkhOomDPtIGFXz7zibT6+5ca
 O8PRRcaHwKlYp0Vl3zhOii/OYfrRaScPo5QcR+XjeYATkf2OaHtu+vEjQQtqZ5oEkXci
 9r0ve0pSr/IX8NQxlQ4XMe9Zykw6USyrzcxBk8GQ5X5OSUnFjS46QaUYNiHrzcbW+GQ+
 J2KQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=rRmNnSHf+ODPhAE7K0fD97Ygw0w2yu3EL7tiZYeq9Cw=;
 b=WQzTDPiPODwEvwm0fBF02XGyCtJKsppWvnSLDPILV37LniwdBTHzQm5glF/MflxQ9Y
 SxAjjsBACQFOjFQZSHhsdWXJxP2G0ihIRDRbmSBVKjf3TxUJtpmXj50p31tQHAPw4Ubu
 BNpFL11iE44LSE08tAKPars8OkrcXa0ei7NLsaQ/LHzLCIuF+DbmgJa4jqCVQcVRYhRv
 WQb7Gf/RI2Ln3EIaFifZWx7GMgYtEjjBlfjEkRHhQbWqXrfuTIgt41ND/UR3JTn37gHX
 alWL1Lx25qvNjaOdh1pviM+zk9iF69xqKzGvYir5LmxkHgUA9kJafSsbv8Hh+PKO3al+
 9ShA==
X-Gm-Message-State: AOAM5332WoQyYoNFYenWZrqeJLVzPA9nPlJq/2A0KAI+RjdQq7A4xsjK
 CFpa6cAwgrzcanKNvfL0AXVxpmDNXBTSU4umufdD8w==
X-Received: by 2002:a25:cf4d:0:b0:645:755c:a5af with SMTP id
 f74-20020a25cf4d000000b00645755ca5afmr3664681ybg.140.1650624497427; Fri, 22
 Apr 2022 03:48:17 -0700 (PDT)
MIME-Version: 1.0
References: <20220417174426.711829-1-richard.henderson@linaro.org>
 <20220417174426.711829-35-richard.henderson@linaro.org>
In-Reply-To: <20220417174426.711829-35-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 22 Apr 2022 11:48:06 +0100
Message-ID: <CAFEAcA-X0BnHkxSsx=QpM6bWvBZQ-xEfawiNF2-mSXSy8vfEMg@mail.gmail.com>
Subject: Re: [PATCH v3 34/60] target/arm: Cleanup add_cpreg_to_hashtable
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b31;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb31.google.com
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
X-TUID: oqUXXiYZs7cd

On Sun, 17 Apr 2022 at 19:22, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Use a single memory allocation for name and reginfo.
> Perform the override check early; use assert not printf+abort.
> Use a switch statement to validate state.

I think this patch is trying to do too many things in one commit.

thanks
-- PMM
