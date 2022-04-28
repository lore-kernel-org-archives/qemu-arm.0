Received: by 2002:a05:6512:230d:0:0:0:0 with SMTP id o13csp1634889lfu;
        Thu, 28 Apr 2022 03:54:07 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzGmKrx5Y7kCPpNxdOV6L/2vCZoaCQyELRoyT3d8eLTKu+FDS+TfoudDSZ9fq4GhUrI/cwh
X-Received: by 2002:a05:620a:2849:b0:687:651:54ee with SMTP id h9-20020a05620a284900b00687065154eemr19464066qkp.446.1651143247109;
        Thu, 28 Apr 2022 03:54:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1651143247; cv=none;
        d=google.com; s=arc-20160816;
        b=iPTZrNEVEcRxCNFEzIXnsN84d9+O0wtCRHVbRoa1or08SyKs/U9W+cFrQE1Czb000R
         IviKeFHY5kMjfPF2gHg2Cn2ayhBHiThs+/kEew0fkS4ufQouy5FhBW2u0adwc6MEFj6J
         OWth1CXWZWbMqaXjDq7XmiQyH7Q6sDWOOoOe+23myEKjNaZKPLGPBurLAqG+5kb4l6BT
         mt43NxgmkAuW8FU0En1748Gjoh6muz1hjypN9WNR3GTvgygKaQml5QZ6ze0oG+E7V36e
         EYg7IU/vVjO16AdpgAfU9H6aThRXbjL1rFww/fQ2bm8Nko9AxFUeBo77nR54nAWHkNFn
         4kfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=k5TuOxiyQm6qvQ60UMEvgpz6IVAjnYnTYGiGPKJzv5w=;
        b=dulhWMj0d/hTyoImjLRjz6OgokVGcAcM9mwuRukaH2DCLTBDIX2Jo2+O9rBFtItM35
         7E5xNh5dNisbqkIUmZ/oFxlU1Z4sJvjluU3RzZW7v+L6sm0G+ka4PCIvB3HSniSFWzY3
         FHlgPKDgcrNtFYLnMAPu9REL28r9PQtWKPOTj8/6AdNsdxRTbZM32bKwL2OFs8H3Aje6
         A4bGOV7ix9lSFrJy7j0HBU55knTvHzDsxFPf4H/HuVUyk+TjsYORJClEC9zV/sujD0RF
         dRzsz0SMXbxNxHLv4aoATq9BKhf+yLd6DhMcUN6Aih0tenRHfQhdqLsp6jlGG0oCUk6X
         OFvQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=mIfUT7e9;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s9-20020a05620a29c900b0069ecff2f07esi1798476qkp.719.2022.04.28.03.54.06
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 28 Apr 2022 03:54:07 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=mIfUT7e9;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:35250 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nk1mg-0003Ln-Hh
	for alex.bennee@linaro.org; Thu, 28 Apr 2022 06:54:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44964)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nk17V-0001x5-ME
 for qemu-arm@nongnu.org; Thu, 28 Apr 2022 06:11:35 -0400
Received: from mail-yb1-xb34.google.com ([2607:f8b0:4864:20::b34]:41557)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nk17T-0003ku-3n
 for qemu-arm@nongnu.org; Thu, 28 Apr 2022 06:11:32 -0400
Received: by mail-yb1-xb34.google.com with SMTP id s30so8103873ybi.8
 for <qemu-arm@nongnu.org>; Thu, 28 Apr 2022 03:11:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=k5TuOxiyQm6qvQ60UMEvgpz6IVAjnYnTYGiGPKJzv5w=;
 b=mIfUT7e9IQ1vxy2v9gtiIYZQxTObvhH5JDhtdrh+fwrDTbA/4WjFnaof1qbOOHCZHH
 OCVaBLI8HEeoVi1vaaGPD/xuAIkIdQSipKNc47ORGnUbFm7vo7WH5i7SpBvmxK+2dt4/
 s1oK+rY7dFsc+ZXO+r6Ykb3wb/vLPY2QxYlDGHH/LPQv/v/6sIdJWpQpnFJJyec3rhvo
 V8jsZml7jDnSEB6jF5HbtqHqUixHlUhIa+/J5Fu+26Xpt2xB5ndH/JbD6oy9LDbx505p
 XNYOrNdIP4Fi6frGS3XSWNucoAQfSkG3Cjc66kKvWdU7yIG80nqStrrIzBZZEV15xYBt
 jHiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=k5TuOxiyQm6qvQ60UMEvgpz6IVAjnYnTYGiGPKJzv5w=;
 b=zBwdejeSCsFu7UydzUt/d1AjPsgIEkzHnSeUiDh+DUEshTbDpef43iuT+XAWtJg6xB
 zld29fGKj4oAHHDDBDHdNsQN2MlHBi/KVnrwjoCIMulyOFbZBKDc6Ym7DDGmXAnjVqKR
 NIG5Gu5ApMn8YMhTnyCuYWhAanIOZQrGfGl1KY4dqCCW0iZpqPLxAyLrP0VHZfQO1RDX
 92NtPt+koJesskz2EcWuHpf625xrgsxIcgJQqzj4EEWj26unpFTRNFZdJeQmiiLZOgbr
 jDnEPSlk3xnSWupc0IEm9YUhgClWnx+ylt50x2FSVWiFI8E2I6ixHZb7Tc0A8eJ5pi0S
 fATw==
X-Gm-Message-State: AOAM533xZVgBquGZaH+tkzQIZTPcyCdJv5PvAnhnMI7RHFRpQQjpebUB
 rLWzgXThcAyN/Y9iezfuXpwQBTQt9d5WGzjoijJuTg==
X-Received: by 2002:a25:cf4d:0:b0:645:755c:a5af with SMTP id
 f74-20020a25cf4d000000b00645755ca5afmr28799237ybg.140.1651140690120; Thu, 28
 Apr 2022 03:11:30 -0700 (PDT)
MIME-Version: 1.0
References: <20220426163043.100432-1-richard.henderson@linaro.org>
 <20220426163043.100432-21-richard.henderson@linaro.org>
In-Reply-To: <20220426163043.100432-21-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 28 Apr 2022 11:11:19 +0100
Message-ID: <CAFEAcA8Jb-BLbq0V0kJg0tBg-ts63WQWpbR7NAvGVF0Sge8Mgw@mail.gmail.com>
Subject: Re: [PATCH 20/47] target/arm: Use tcg_constant in 2misc expanders
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b34;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb34.google.com
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
X-TUID: G3N2ZOohMWCM

On Tue, 26 Apr 2022 at 17:49, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/translate-a64.c | 40 ++++++++++----------------------------
>  1 file changed, 10 insertions(+), 30 deletions(-)
>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
