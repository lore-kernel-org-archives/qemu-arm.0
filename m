Received: by 2002:a17:906:3b11:0:0:0:0 with SMTP id g17csp705625ejf;
        Thu, 11 Aug 2022 12:11:03 -0700 (PDT)
X-Google-Smtp-Source: AA6agR7MuCOHyBTi5esOSHAMTkEtv5h18mMPF4VXazVWOWQs+JXWWpLjxN2tYlmrFCI8Hfg4W0Yg
X-Received: by 2002:a05:6214:5003:b0:474:a0c1:99b2 with SMTP id jo3-20020a056214500300b00474a0c199b2mr569894qvb.64.1660245063076;
        Thu, 11 Aug 2022 12:11:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1660245063; cv=none;
        d=google.com; s=arc-20160816;
        b=degXW1reY9DHe3y4N48QeEL9uYL9FzEzypYYK5T91XOKVZ0vW+NYwjLG5vUnKsfbui
         FI3559mQmBvJALad1mlBas1di+87PAUZXzp+vbfNbcwC40FPP/DfMrdu5oG2D8rOEG3m
         BwBkjUoA11A0xUxHHbVKzGGRrLfkJ4JZPjyR2ynf+JBhVPqMcmE4nLKuGCKgg+5B0JAo
         AAn2xpydJX9QJhsHG5z5iFXOmxJMYsN/EQvf9VShCoayCL9t3Z3tttHabDOLvCuKRKyy
         1477+mcCgaO5Cb4INgFqfKy23hX6Uhs24zM6jGoJdpLs1wvykz1sNxFW9jkua8t5LmJk
         Wp8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=H+6KarpXTJi2BQ7Om1X+mS0kZETovXqKWh4rqtsJMtk=;
        b=e6+ziA2B6trZ+6j/quSvD4zsC3J9fs60rSw65TVQsul39SnIo5YJfsyKXXnsQgj+rx
         RJVCk8CAoRrm7+2b1mJsnwiwPpFn0NYiNH1zy+NAq1CBiGaaGCPgNoNL4o5NOrDxUowh
         KlHl2QPLxwautB4j//fJEm3EVHpFGsbpnIJe10pGdAXFa5OTXmwb0vc0wOGX6UPEXobI
         8H0XDlQ7NaCMs8sZAEQkJkG82LwKOWeFwWl0hX7qWkZJcfE0Y1b3wPe3vJmUMnh0Bucp
         fPNEMEpiHZNIS6C5E4d3Hb9NjAajAktrUGvZEGp7f8Tn4VuemieKjjPaaLkEDnkoNUOB
         rreQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=akxTDVKm;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u17-20020a37ab11000000b006b99b3e1faesi56378qke.303.2022.08.11.12.11.02
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 11 Aug 2022 12:11:03 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=akxTDVKm;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:40058 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1oMDaA-00042G-Hr
	for alex.bennee@linaro.org; Thu, 11 Aug 2022 15:11:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34708)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oMDYv-000389-20
 for qemu-arm@nongnu.org; Thu, 11 Aug 2022 15:09:45 -0400
Received: from mail-yw1-x1129.google.com ([2607:f8b0:4864:20::1129]:39912)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oMDYt-00013o-KU
 for qemu-arm@nongnu.org; Thu, 11 Aug 2022 15:09:44 -0400
Received: by mail-yw1-x1129.google.com with SMTP id
 00721157ae682-328a1cff250so182282787b3.6
 for <qemu-arm@nongnu.org>; Thu, 11 Aug 2022 12:09:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc;
 bh=H+6KarpXTJi2BQ7Om1X+mS0kZETovXqKWh4rqtsJMtk=;
 b=akxTDVKm4JWwAFoG8mWcidQpWYNKmDTmEZjBm9emjsRajSk0TR8MuHhKGyDlyg/LaH
 Zzv2aVPD7qxPVKIwPcrg+6jP5ZqORCNsm5w6eQA1BthcMDg7m9EE3oD17c62cj467RT8
 H0slacsNtEYZymzlbW71PM8FoZqkliKkflBMTGHc8p6L34CVcizKHkR84co3RPWjXhUh
 MZy0Dncuqu/qE2ArUXV44YYfPDvbQSYpm4XpBOIPd4ZIM+aMCqMdQBd/UNG2qwpqXWO8
 mWYuXUMHfI8Qk14jBcCqchsclciVqtmQKwgnyGcbFEOFLTWQdMWU/kXkfoeeH+16P9VG
 jzvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=H+6KarpXTJi2BQ7Om1X+mS0kZETovXqKWh4rqtsJMtk=;
 b=VD2d6gtCQiOY3EuEiAJAH5G2Lr6Ki9VGcXWyyQyyzw2fpKPi4/JShAumWR5zoPH23/
 gu5412ozmGgT4rBYgFhd7K2uMDePJPu1mmB/BiP3BG6L3uwMJWHQVkUAXkNiJ+66zM9R
 INTAG+SoGncpl5r7vUDh3aguc7gkp0QEme0IeQ+2ijcbmxWecpGezhm1nnOyQJZg2hGP
 Lna8uj7NTbv0+zCP4RzLWw+d5LRjVR2ekHBWEG+jB2iGrbuU8ExF63XhNlSqewqXnyfj
 IQWFEwcIOj3wJzY5t12F3t6QzF3/wqreSQ5SLuXL7LBTXqUW/GeG15OENqddkjMOZPtR
 nU8Q==
X-Gm-Message-State: ACgBeo2pTDvnUVvT+yIr9xtEL5Lgkwh6IIA0+JVqo+XH+Qz7lXqu/JKO
 oSEa6gaM60FYYwbuEXwO3qkJRyM/phxHG0cJeCxgOQ==
X-Received: by 2002:a81:9942:0:b0:326:5dab:8915 with SMTP id
 q63-20020a819942000000b003265dab8915mr678625ywg.10.1660244982378; Thu, 11 Aug
 2022 12:09:42 -0700 (PDT)
MIME-Version: 1.0
References: <20220811171619.1154755-1-peter.maydell@linaro.org>
 <20220811171619.1154755-6-peter.maydell@linaro.org>
 <34861211-e1f0-31d0-9619-9b99953ff031@linaro.org>
In-Reply-To: <34861211-e1f0-31d0-9619-9b99953ff031@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 11 Aug 2022 20:09:01 +0100
Message-ID: <CAFEAcA8mD=VXyEwAoSjNVYGc-bEib6N13GEoLMDtuSZ2VYuMVA@mail.gmail.com>
Subject: Re: [PATCH 05/10] target/arm: Honour MDCR_EL2.HPMD in Secure EL2
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1129;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1129.google.com
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
X-TUID: 7PfGdfcp+YbL

On Thu, 11 Aug 2022 at 18:48, Richard Henderson
<richard.henderson@linaro.org> wrote:
> You can use |= for bool as well.  You don't need the short-circuting of || here.

That seems like the kind of thing that -Wbool-operation is likely to
warn about either now or in future, though...

-- PMM
