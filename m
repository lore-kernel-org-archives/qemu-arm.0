Received: by 2002:a19:3859:0:0:0:0:0 with SMTP id d25csp1525257lfj;
        Tue, 3 May 2022 09:21:00 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx7aEDefvuSks454D+85E11WFxF9o/Nj+fSl4irtKHmgIj5BKWZptejwWNJe5ghJ6aDcUvj
X-Received: by 2002:ac8:5905:0:b0:2f3:9fdd:22f1 with SMTP id 5-20020ac85905000000b002f39fdd22f1mr12739897qty.191.1651594860445;
        Tue, 03 May 2022 09:21:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1651594860; cv=none;
        d=google.com; s=arc-20160816;
        b=NGa5ThZ5XQwDep1ApOVhlMV3JDzS3qHfy0a+qCl+lWyLnio6+VWWbrTXYzxfbi60ee
         HAvvA2vccEDUuZ2L6aEF57ui/gRjRQFOo2o+9Hm0IkUWIwlEJWuZELWyOJrQH3dW/X0+
         faXhUb5b5E+CD70SkpSfgdmJuvyGIR3fi8c6ij1yktKxm4Qkmx3ES0oRjrawXXuWFyW9
         +YGUpheCcZN81BXr9wEnC9F3w25GwFiJFbk6uM457kA2UCcbeAJ/eMODvPinOPbj8z0n
         VkE4kvKPmNNF+8RXww7mp9lmY+jFja8MzRhwKp9J37GywicCXYuNqpUvDIt5i18cnckR
         wrUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=57n9bGA/rUiywM8/d7Y1gpObCrKAMHIAmQA5u6lSyyM=;
        b=mDOP6/QGR0vvehuiBxTee/nXxNNkhwCBoRY3AknDsKKtnNPKyEtFNrLZTturFRdRUc
         Q+M5FXG/venxIt8pWJW2Cg3fNOZm/xotHpf1JxKE05b2pEBQ/CyE9AOqPnIEz+aEoz1H
         XQh3o8TBYPzfysuapoqi3BSFzianP0+q8SFXGdtj6vxsxfdcb5CLnB6ZOW+jk+HULuq/
         hKjoHrF5Fvo+iq7dhnpr+8MEyVZZpmoB7LAWQ4rKEfeby6D517wbHDQxED7p2ZEkS6Z4
         p1MBVihWb40AaCqI7yGiKXYMKLkNcYfuOhBCFoRZ49fE4zrZMJXsaka4EzyRcEOsYqxA
         ZdVQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=IjojFcoe;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a188-20020a37b1c5000000b0067e4be23a35si7421183qkf.634.2022.05.03.09.21.00
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 03 May 2022 09:21:00 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=IjojFcoe;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:35178 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nlvGl-0002DC-Tu
	for alex.bennee@linaro.org; Tue, 03 May 2022 12:20:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43972)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nlvCv-00062D-Fc
 for qemu-arm@nongnu.org; Tue, 03 May 2022 12:17:01 -0400
Received: from mail-yw1-x1132.google.com ([2607:f8b0:4864:20::1132]:40039)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nlvCt-0005ir-S1
 for qemu-arm@nongnu.org; Tue, 03 May 2022 12:17:01 -0400
Received: by mail-yw1-x1132.google.com with SMTP id
 00721157ae682-2f7ca2ce255so185174037b3.7
 for <qemu-arm@nongnu.org>; Tue, 03 May 2022 09:16:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=57n9bGA/rUiywM8/d7Y1gpObCrKAMHIAmQA5u6lSyyM=;
 b=IjojFcoesvuC5O9fb2UY12kS6+8I5ZH63ff4pyj6I5vO/54JumcW0xpc9BzqUtgSSB
 1Cw3+kZjlN+mfPEns/w/3RLA7DCwsfpHIpQ6/aj7VP1CTSz7Jan7ttBgtzOt2CM35zeH
 3ZS7ZbB1DzM1XqSyEgob5aWLaCFe8sIUp4bl8HdUK5bSfW0bZBjiy1HDHnMPStlrf1e8
 aXJ3zHafjPgI+xyccOjCRdjZHX8DwN88BLswSkpmXUrAB3uqSKLh10bPE0mJds1ylaF5
 rilU4aBPDR216afRhLduESm+e/8y+ixyr+satTbVu6qdQaJzdcYC7U7GqPGGqE83U7aq
 ZZpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=57n9bGA/rUiywM8/d7Y1gpObCrKAMHIAmQA5u6lSyyM=;
 b=3YNmDYjx6o9iwefCeUY2CntS/by+X2CmHmOSkDdxpn4swuYK1fEExPdhzRWL/n0gsb
 hNN7ZIssVIG17NdL3r1Qh9wlFtI+wMfl2JZ3KT0LJWkZS1k89Jhig0/PU+Sdvot7dp2u
 4O6DWteHEEpQiJLe8QHwhka5zJY+fPNn2hi/enS43mpSOvVGcoQv+ViifjQpOBQ39PE2
 YM1hs4o8eeHZ6eSNL2nuJ1vaHnDZvjoy6Y63xsfCH1U58OZA9Jbhyxqwz2eW9Ls1he6e
 ucEyXvsYAaW2TyLJYd1cULGvt71sT0SJ1x9HL8b5blfGDbYddwwuxKF14UD5Gwprwtbd
 QfTQ==
X-Gm-Message-State: AOAM530+WRkDaDQQ8l9zkzgy5A1tcPX394QmcuQxv2C9ylQ5Fs7GcPeN
 TieXkuLSpTh441XFbCwMRXGdoVvQ1o8vjKcrI4BoYvWKgwM=
X-Received: by 2002:a81:ac57:0:b0:2f1:99ec:91a2 with SMTP id
 z23-20020a81ac57000000b002f199ec91a2mr15862459ywj.329.1651594618686; Tue, 03
 May 2022 09:16:58 -0700 (PDT)
MIME-Version: 1.0
References: <20220501055028.646596-1-richard.henderson@linaro.org>
 <20220501055028.646596-17-richard.henderson@linaro.org>
In-Reply-To: <20220501055028.646596-17-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 3 May 2022 17:16:47 +0100
Message-ID: <CAFEAcA-xxShWfJkB=wok_EZoi5fFtKDcyxfPF-3XAmjLYk_yeg@mail.gmail.com>
Subject: Re: [PATCH v4 16/45] target/arm: Hoist isbanked computation in
 add_cpreg_to_hashtable
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1132;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1132.google.com
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
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 8bi1p86jNIlA

On Sun, 1 May 2022 at 07:24, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Computing isbanked only once makes the code
> a bit easier to read.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/helper.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
