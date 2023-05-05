Received: by 2002:a17:906:4810:b0:965:a47e:1721 with SMTP id w16csp394162ejq;
        Fri, 5 May 2023 05:54:43 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ5gynQNlxWdwK/kc90weydY/N2P3JUF2WS9NQBIAstjMDc4O5d066nKFdMpe2/pL9dJc1gP
X-Received: by 2002:ac8:5d49:0:b0:3e6:45e7:f170 with SMTP id g9-20020ac85d49000000b003e645e7f170mr1755133qtx.50.1683291283672;
        Fri, 05 May 2023 05:54:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1683291283; cv=none;
        d=google.com; s=arc-20160816;
        b=gA7R+rx1WdX4GKx4pv0y1pfHAydaNheeLoQSjNqiUKf+vUVAbA9nc21k+FsU+CIogZ
         uNEtW4Vhs9aooiK3Sg59OcIvwA592R/ezgiK2GRykZ/g6oNKb4VNp54fWZ72KGkxdMb7
         OjgHvOSlk9k6T1GVd54UA7zRy+iLMm3+dQ6PbC9S13b1NpXmBmjPJrAPoXGnB6AMj9UO
         xiCbgeg0fc7QAJxelO0aHrvR7qTcMwcsv4/000XNeCYC1Ato4YMDGgp9GR+7hs/K14p3
         jOUHJ+Soakc4PduYziETyC/vJ/YUzz8RgiZX8R28Ua/Dvkbr3lUA4BWg1jA09UDMXkjs
         Lomw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=gIaB6wxaHA8JX27HckklAFPn5k8+MPI9gGbFFNuzkfo=;
        b=UwgIPMOEszEUp+b8juj6kYyDBhL2KhUJ1jVnkhRtwi9yFNts099ipGfYDcQZrFss1M
         lKYnU5yVYpuB/DnCyGorXZEJCiTT3HMq5ikw53pobUZMcPFD8rc1b9tfQfa/x8yIW6OO
         mDtUBn6HRcR9+bPuyctMA99IYN6OI3dKtWkAC/7W0oG1jwjMk6HH9JOl0jHqKURHkJLs
         oP3Bp1kNpv+PVNJJWwdaLAomtGsrP1PFO4bubZSD07l4d0dRSf6HAiivnOs8kjZKD5do
         wXaaXn06/H623XJEDlgMxrbzsHnSGPeADPaLDgTv3GJZDu72RZgFLfjHXjMZGsgl8KYE
         64UQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ALsoxFt8;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p18-20020a05622a049200b003e9a78b58f7si525565qtx.702.2023.05.05.05.54.43
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 05 May 2023 05:54:43 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ALsoxFt8;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1puuwy-00053S-7s; Fri, 05 May 2023 08:54:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1puuww-00052l-2M
 for qemu-arm@nongnu.org; Fri, 05 May 2023 08:54:14 -0400
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1puuwt-000598-Gz
 for qemu-arm@nongnu.org; Fri, 05 May 2023 08:54:13 -0400
Received: by mail-ed1-x536.google.com with SMTP id
 4fb4d7f45d1cf-50be17a1eceso3295344a12.2
 for <qemu-arm@nongnu.org>; Fri, 05 May 2023 05:54:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683291249; x=1685883249;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=gIaB6wxaHA8JX27HckklAFPn5k8+MPI9gGbFFNuzkfo=;
 b=ALsoxFt8FoBKtvQ+ysp7go2iTs5HqNxBNsQd7SrhDCqCPdrRTUsaS2/BxT38BLygrs
 XMVYH8AstKJwtTNyLd8DXrloaC+mqUlfGYvKvwM8ON6PkNwvjkt56jtt64hdzAyOqHy2
 LwRmdo9yq6j1rTYkeF/oiIkNeLmBPE1AyKv4HL6JG6YHkmV5u6oSePsew3hVIdRSCA6W
 s+xbJ0DYB/vHvjsoZ14S7kFYdVjJIGj6HwKItFMGvitnosEvKZw01TVV3aCt9CmnyD8s
 ZwlOVpZOQRvJh6gZiZ/maISPksHSjI/EtVpGfBcIzQ0JcO5yHN+6px3PzaCTvQCbqBuX
 t/jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683291249; x=1685883249;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=gIaB6wxaHA8JX27HckklAFPn5k8+MPI9gGbFFNuzkfo=;
 b=ZrFEDByHp6nQvdhg5FOhKKCiYyU71w/rZ4RSg7XG+JcQnLyWFtT0pdkgDWabZJUiVD
 r+lD4OxrJ+1yvW2LPrL+w9/Y9JMpwaIhFIeCvVyshUzqpext4AqnKbMQ4dtK4Zskt47L
 lygvNPC3QZ84ZBKdxxdmAWbHk2MyYEG9Jd8DldkTyXcEa/KnFidID+fVS/HrzyNdXylp
 tCLa8nobQTIOCNGgTyP3nUm2XMlgXGYquy04UUdBJAJo+RUL7aFFQMjFeuzBYHuKUolv
 P4oWH7kn2/pR3x2ZRk++0mw1+EU6N1VpcTYckYkxEucMmQPVHUC3+vT2OUIVk6WBiOyl
 kyQQ==
X-Gm-Message-State: AC+VfDymjdmHX+vzCCPZBwmq5lFaYXpMiuezCCO1kYqBvJ6oWeUpbwOt
 p3To6htlSp4Bq70rqRBM8d0GEb1N0t6MHVJsNtRgjpsKl0Gr3aPF
X-Received: by 2002:aa7:dd0f:0:b0:50c:4b1:8912 with SMTP id
 i15-20020aa7dd0f000000b0050c04b18912mr1286060edv.15.1683291248738; Fri, 05
 May 2023 05:54:08 -0700 (PDT)
MIME-Version: 1.0
References: <20230503070656.1746170-1-richard.henderson@linaro.org>
 <20230503070656.1746170-42-richard.henderson@linaro.org>
In-Reply-To: <20230503070656.1746170-42-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 5 May 2023 13:53:58 +0100
Message-ID: <CAFEAcA8PfOFt6+VfanS+hAhtugSmXo+V8KQd=z-P8vKFN8WZgg@mail.gmail.com>
Subject: Re: [PATCH v4 41/57] tcg: Support TCG_TYPE_I128 in tcg_out_{ld,
 st}_helper_{args, ret}
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, git@xen0n.name, gaosong@loongson.cn, 
 philmd@linaro.org, qemu-arm@nongnu.org, qemu-riscv@nongnu.org, 
 qemu-s390x@nongnu.org
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
X-TUID: CjBkJ/LvLzY1

On Wed, 3 May 2023 at 08:12, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
