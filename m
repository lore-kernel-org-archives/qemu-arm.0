Received: by 2002:ac2:4c03:0:0:0:0:0 with SMTP id t3csp3489029lfq;
        Tue, 19 Jan 2021 08:59:13 -0800 (PST)
X-Google-Smtp-Source: ABdhPJx8kVRUptHttyLR4WxIRg7s+FFj82cTA5FoA9n8FH7Civjcd4Yrd9oYOO1uhP+79moLm7Oa
X-Received: by 2002:a25:f401:: with SMTP id q1mr7362752ybd.113.1611075553706;
        Tue, 19 Jan 2021 08:59:13 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1611075553; cv=none;
        d=google.com; s=arc-20160816;
        b=urVwO2Mn+8TBRm/3eA7DlqyRlV2xfFZ6dYMPX/hJnrZcDm0Mld1WGt8J3HZ+ZsrgDZ
         6/SUVJ+cGhhR+ezQSRoWQ9PW3QB6t8VF04h1r7sMEz2eY7tszfXIrlfrrdQbLRpMxxWo
         NbN00aKvJiJ6bobsY0TVTkbPTldvUur1RLo/Ue52H6udueYhaQlINh0ajkZNAajlWVM0
         5ewRauT9PzTqC4AzQbK83ZD489xnXZljW4/52/aCNwS+M41sxXptYDWtIijkzcjnmBXT
         UX4/aXeLlVEYucmSJYJUr2CXqEf5oeWCwtpfRIwSjI4omNgd/h9xPhs0OclN5M4HLdZK
         jW8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Xd+BCL3iHWTvFRJb3pccf1sHG27Ef6cwmx5A6nCxzVY=;
        b=gGXWikE+JVvLQT7cUNRmRYqLxlIjerW2d4McAn1a/bd+/X7YtfJ4BCNoSfsy2Ls/vu
         D72g4f/XubImop+o3f4DCZqrq52a/2p18BhjKxDoUtCUZPXhYWsqCVe7MNmT7MvilRfB
         1Xs94Eu09cmbrsuTQcd/La9aYu8m2MlKF/rnAcWMOTLxUBXKZ2hR2bKT1z8nW2XqOQ91
         +FBFBA846tH7QEGzkYFJlcihElIjgAiayhxcaBd2urY7Cmn9SGA/JX+JD1nQWhSL55e4
         +raLB3Plh8wkVcMp818ZEu5SNogY3WY11o2UAKIriW8C+zgpCAOx+2N8h8wd2V27u+Wr
         MfdQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="ovP+/DaM";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j133si20491272ybb.145.2021.01.19.08.59.13
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 19 Jan 2021 08:59:13 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="ovP+/DaM";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:59140 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1l1uLZ-0004T1-1N
	for alex.bennee@linaro.org; Tue, 19 Jan 2021 11:59:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51990)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l1uIz-0002NG-R6
 for qemu-devel@nongnu.org; Tue, 19 Jan 2021 11:56:35 -0500
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629]:38853)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l1uIx-0002YG-Rv
 for qemu-devel@nongnu.org; Tue, 19 Jan 2021 11:56:33 -0500
Received: by mail-ej1-x629.google.com with SMTP id 6so29498492ejz.5
 for <qemu-devel@nongnu.org>; Tue, 19 Jan 2021 08:56:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Xd+BCL3iHWTvFRJb3pccf1sHG27Ef6cwmx5A6nCxzVY=;
 b=ovP+/DaMBAj5+QlY9eihJX7mjX1MvmZqyPrQEEQdmOkMxRqacEdvYXNWa/tpIZ0NeC
 mtEKmw50s67PdX971WvjX5prKF5WMVSjDhEC7zLZpiW+CKQvGoFis9+uU9Wt9nOSmKB4
 gRweuhX4pe8492RAbG+EiOkqdf9oMdbHbcJoRbfgHd/FAujp5w/K9dAwXDqiNwT2zGlU
 70sJs43xr21rf8/dBNCPyj8b2BWfLKU+szPDinVXP3lOEVJOQs36s/bIbbOiYcRzQasF
 9hwLcWygfJOOTKz1TN5jUiWdaDW1GBcto5lNct8PQAXllHUMKzdFDiEc5g12BSM2gWtd
 h/Ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Xd+BCL3iHWTvFRJb3pccf1sHG27Ef6cwmx5A6nCxzVY=;
 b=DEVyBK40S0iSpf4FkFFBysH/PKaaSEviWA0GMXJUL49zuvebW3lVlJNTQ3PYfGEnM7
 wg5w0z0BnyL4iL8SvBdVNlM/mfZhkvC5b3eiSLQYJT9mbpqOgxGTsHpNN/U0dQngNTuY
 Xu3i8HkNG3FE9wzmfchZFoBn3c6hs8FRD2YarEureJeOHSJrGTyeZD15kVa43bSy6s/L
 fLDgtlSW2aoF+ilkvhHNK+EybjzK5unefoa+4H0Kur/USTobFvi+Zcpb1Op0Ysgw6F04
 kjRm89kSaoLwuIGxul+QWf5yNAYo04H0W4ZmEKrmZvEo0YKF2uOfeyscRmz7hhK7GCRW
 HznA==
X-Gm-Message-State: AOAM533QDy4OghSxIGCqCGI7lD2Fw47u9+4xgDMrKdVsVYK0V6L8GW1b
 7VsUeli5eG5+y9pB5vBHvHdex+TtGJmJFdW3bvY/zQ==
X-Received: by 2002:a17:906:b215:: with SMTP id
 p21mr3496032ejz.407.1611075390261; 
 Tue, 19 Jan 2021 08:56:30 -0800 (PST)
MIME-Version: 1.0
References: <20210115224645.1196742-1-richard.henderson@linaro.org>
 <20210115224645.1196742-4-richard.henderson@linaro.org>
In-Reply-To: <20210115224645.1196742-4-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 19 Jan 2021 16:56:19 +0000
Message-ID: <CAFEAcA9KT7Af1EU2hs5sDQbLHRS3g3g7A_KHDc2ZuZUw0MRmSA@mail.gmail.com>
Subject: Re: [PATCH v3 03/21] exec: Use uintptr_t for guest_base
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::629;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x629.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 9tOpKNHE6+/G

On Fri, 15 Jan 2021 at 22:46, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> This is more descriptive than 'unsigned long'.
> No functional change, since these match on all linux+bsd hosts.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
