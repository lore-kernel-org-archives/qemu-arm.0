Received: by 2002:a17:906:4810:b0:965:a47e:1721 with SMTP id w16csp288135ejq;
        Fri, 5 May 2023 02:36:59 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ73HTuUdbjP6YH4WDUC0apBs8PBz0BvZZHmVPGOnSmATZBZD+ojsInxtYVcU/Bjct+aaE5f
X-Received: by 2002:a05:6214:2628:b0:61a:281b:9a4b with SMTP id gv8-20020a056214262800b0061a281b9a4bmr1328478qvb.0.1683279419168;
        Fri, 05 May 2023 02:36:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1683279419; cv=none;
        d=google.com; s=arc-20160816;
        b=SYnLdVYDP3oZGKtT3SNF4W56YMdy6bXxrsov/eFAReuZAy1IWdXMDTpqhMW6xw9BTC
         JeSb0qzS6qEYslcRe6nzamcFAvlQpeVhZ/grlkODMXZ1XnZLtoso8VSdRa98vp0GViSV
         E831lYV38UqVrFxn2V31eARH+XOEziteZga1QQ7YK1OamKl15yyL94N4d4titg4F5fPR
         tSsO3+AVg8EbCv+BAt7Q3yHn7tZVYFzN/rRKBqbBGQjztqLx/hBgeRZlzVkroV1FIIFK
         jRjKXhUzgASaLEFWbkfcVXVModrc2ZWYE6ZHfgOeAfnUuifbcOzlJGW8/ZgimK2QNvbe
         wgVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:cc:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=rOxAmCxmq4mUmQUBKqSuiGDnmChZNo7gJ0Dlt2ph/T4=;
        b=dYjjFfnqac+FQ+0Yqed5YahPDRFS05i4l9ZwBvGLXPTgCmGvfQQ1MPQU03S/oesoAq
         g1j7SpGrXb0NotzcCFIMzUUb6GMJ67WZFGsCBFkdSG69q7K/xR0NHnKZCchqEiUEovW7
         E4vqZZqXsb8fWvkassHkYYy5G+Vu0WlgD3A/jRqBvRYjWwMqJchRNQ75IbdM5rN9MOtV
         oZjLi4tg3XIIz11tcgp1dKBwdfjNmnp5CoWDzIBuvWQUHWq3SSp58REKL3aofaZIuTbN
         eX3NHX5D6YUjHFePQKxSj0QHwZPc81WnjrWOvy2UDSaM2wezqEmI+PdCxKdIGBi+k5df
         UCgA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="IxMAP7a/";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ke5-20020a056214300500b0061b6fd023cbsi453976qvb.574.2023.05.05.02.36.59
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 05 May 2023 02:36:59 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="IxMAP7a/";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1purrm-00031K-LO; Fri, 05 May 2023 05:36:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1purrk-0002uG-E5
 for qemu-arm@nongnu.org; Fri, 05 May 2023 05:36:40 -0400
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1purri-0003c4-UW
 for qemu-arm@nongnu.org; Fri, 05 May 2023 05:36:40 -0400
Received: by mail-ed1-x533.google.com with SMTP id
 4fb4d7f45d1cf-50b37f3e664so2635638a12.1
 for <qemu-arm@nongnu.org>; Fri, 05 May 2023 02:36:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683279397; x=1685871397;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=rOxAmCxmq4mUmQUBKqSuiGDnmChZNo7gJ0Dlt2ph/T4=;
 b=IxMAP7a/YsZVoKDoPthH7twSLdBtu+z1Mg1s/uv1lQwYGACb9QDrGo0qr8lvrxAAlU
 BeHoLL5rfx3JhmTAjJM8vw4TVYNtlw7dUKA8fBlWoOaS/rgo6w/hR6H/6k8fHbhqMpxc
 7uLvBeS1RoMtcL4QBT8JYYWoauAM/M+XOOSj9mOKpIV+NHPPSIxp8lyBE3ktf9QDB5in
 CEx+TiNLq2Q2s3aOAGyQlEwoRd7Qgljx+lxYOy4f/Ee/dwKG2iYQPxEkaVLRc78PcDej
 OfzRSYV/BL+fhYeNXiC61Av8DSKbG+fvu7isyoj4pqsd9vgLiLm/MX0Uztf+aUa2ybAV
 YhCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683279397; x=1685871397;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=rOxAmCxmq4mUmQUBKqSuiGDnmChZNo7gJ0Dlt2ph/T4=;
 b=HOEP7grXVdRykP8WnzpPE1MEIvbRwYVjcRqLZIL+dJuQcCxjvmMu4rY/UjCk+sFILj
 sEAJo4DMwmyhoFH17yx81bYE7dIVfuGrfLOwXGQ9cRKe3dBAVEL7AacNXKtqYXOqOgh1
 5b/iVdOKQoh+NLm8hBsQB9WozRFNzKI6+PeStccm6A8sfYFbbuUrylnlABSgjZCqDjVC
 jkj/FFRdSs9hj1MbJqNb4xOPF5A8mk+5X6zkcDv00RdAKR4R1UtwBwEUQoanN30ccy/Y
 YoSMzaAEIkRfzdq0qQ48rRFFONMypmSOXH9/tfUr6tkEWf8Kp4Oswd4G1xbIqB78JpUR
 u6zA==
X-Gm-Message-State: AC+VfDxD1+jtU/M9HgINKz1Jj1GxEokm/a/JyrPqUeO+Iqfts7yCXWvU
 dQFyiXIVpAvc9uv2PvtKNeYe/CpIwuKVGl7EivW0Gw==
X-Received: by 2002:aa7:ce18:0:b0:50b:febd:3cde with SMTP id
 d24-20020aa7ce18000000b0050bfebd3cdemr649377edv.42.1683279397303; Fri, 05 May
 2023 02:36:37 -0700 (PDT)
MIME-Version: 1.0
References: <20230503070656.1746170-1-richard.henderson@linaro.org>
 <20230503070656.1746170-10-richard.henderson@linaro.org>
In-Reply-To: <20230503070656.1746170-10-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 5 May 2023 10:36:26 +0100
Message-ID: <CAFEAcA-mXQ5+3bt=uHaQV4YRncp4HJiO03hE2sNRpgC+7xouxw@mail.gmail.com>
Subject: Re: [PATCH v4 09/57] tcg: Unify helper_{be,le}_{ld,st}*
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, git@xen0n.name, gaosong@loongson.cn, 
 philmd@linaro.org, qemu-arm@nongnu.org, qemu-riscv@nongnu.org, 
 qemu-s390x@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::533;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x533.google.com
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
X-TUID: q7Cn4pQ98bY1

On Wed, 3 May 2023 at 08:15, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> With the current structure of cputlb.c, there is no difference
> between the little-endian and big-endian entry points, aside
> from the assert.  Unify the pairs of functions.
>
> Hoist the qemu_{ld,st}_helpers arrays to tcg.c.
>
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
