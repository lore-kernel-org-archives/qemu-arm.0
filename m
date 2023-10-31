Received: by 2002:a17:906:70a:b0:9d0:bf65:29fa with SMTP id y10csp319679ejb;
        Tue, 31 Oct 2023 07:23:27 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFJnP90J2fI1sW5ufpg1ZwQZlje9Kkjr8frGPjUZGpPo5EBZgMQJkRvOX52TSVeO+ONd2X4
X-Received: by 2002:a05:620a:4514:b0:775:7d81:f8bb with SMTP id t20-20020a05620a451400b007757d81f8bbmr17069949qkp.11.1698762207560;
        Tue, 31 Oct 2023 07:23:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1698762207; cv=none;
        d=google.com; s=arc-20160816;
        b=bcTsy51kJrbNioFpYWgcwatbHmtH/LbffLNYvaGfzVxM6zIdAEf1psn3QZ2K7YO5/k
         Q9zH/FjPCqTnr1wh21AaKutYOy3irVSX+2+4xbCfthJ8s3DWpt8efxHS63FnM3Jxau0U
         K3EDz/XpeNgVjLVl7gA4QwTcZ60i1odZcmFc8lZrTiP8Spi8VsmW0Hwu7mpc7NR++xqD
         8L3JeOZkjfqe1p3OR8gzbjZIYm778BeW/KLXbB31UFyhS1zn4EGemWeAnT74cA+FrxC/
         /0JskqNd0RgvPhyoDgVAofXGTI2fjYlPhgPkg/6+hwYeIEdCfCVxq0oo+gVCgi1465Lq
         mJ6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=/8Nilxmvy1oMbEpx2HDo0XnG9uQmJ/Z0DBhjyvb4FL0=;
        fh=voaqrkqYixqEBBpyrqL2FJPE03j1T+iT7WN2EADg3YI=;
        b=XjEl36KtL9lneBLblZtUA6YpyTf3yOU9U68gPHik0oLBN8cKi57YwkiplsPBBUbwq6
         uqHiw0m9SsAkY8YQoDbCOidhWPM90IQYKhbZPjuwMefoJeCfTGehXVdmdpDJIrRgBlah
         tKAJCtG2/yieeInj3QCFXjKUWsR6ON+4L54qoGtniEux/UDXOSzqihoOvV2xTzXJ229A
         ytlRmX+bFtfGoxZYWcwjqKIbfBaYLQjv22dG0bQnRJWh18m6FvRmi06oSMFcj/Mcf+nj
         Z0hIy7mzHSAJqR0OAExdJ64L5r877nAeNujSGv11tjYX10T8mgyljt4PgX19CiHyPCD1
         UUww==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=g+WzPBv5;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y26-20020a05620a09da00b007771d46fd50si1148271qky.111.2023.10.31.07.23.27
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 31 Oct 2023 07:23:27 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=g+WzPBv5;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qxpeJ-0003f7-32; Tue, 31 Oct 2023 10:23:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qxpeH-0003eO-DU
 for qemu-arm@nongnu.org; Tue, 31 Oct 2023 10:23:17 -0400
Received: from mail-lf1-x12d.google.com ([2a00:1450:4864:20::12d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qxpe4-0006Oa-I6
 for qemu-arm@nongnu.org; Tue, 31 Oct 2023 10:23:17 -0400
Received: by mail-lf1-x12d.google.com with SMTP id
 2adb3069b0e04-50939d39d0fso114097e87.1
 for <qemu-arm@nongnu.org>; Tue, 31 Oct 2023 07:23:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1698762182; x=1699366982; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=/8Nilxmvy1oMbEpx2HDo0XnG9uQmJ/Z0DBhjyvb4FL0=;
 b=g+WzPBv5TB7gUtEiKDytTMiYgdrtgeCdn2So1G7Yu77GY+PQEeIQy0nWXWL3kKEQ5z
 PpDtKdDE34Hag8bUSV0LHLSr3azcrMSNFAlQp0xr9Slg/WJd7yolHXEp6kGawiv4yUGR
 K5UH5MiWO0oVxlGysVkvhWiS04HUFYXFszg3rGn4iJT/BU1xnLe4SqAtM4A2R6F94tTn
 atMdj05Z3yau9HQlG0Pc1+uvhRLCeFPE2kAE8TWaNCrrADnKU6XMdFlvftyHJDd2Qd22
 4Ua+Rthewsd5p8WoJ4weOTFiZVaiWqUtm0oZ8JFao309uBDX8QlmweHVolN/SotCmIhB
 lkeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698762182; x=1699366982;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=/8Nilxmvy1oMbEpx2HDo0XnG9uQmJ/Z0DBhjyvb4FL0=;
 b=YU64KzCYPY5nZ1qiV8iZYaGp4DeMinHr9Ppyo/c2mwRRJIBInRVzp7dVtNaxU5Hkm/
 IH0r94B4/c6Hb6Ab8bRIv2kaGRS46qfg8jNxgOmo2j6DbhAj8cNKuG9c8AKiAnT0DoXb
 Tb4upJ3pXdp3S2p1T5Ykp1ZGI/yuzlaXxTKSqTtdtJVyySHHjXWTclGt513jgXVNuSfa
 4ISY83l+NPOiJj2m/VMu++FerwzdvRETEVLdjYel/l8lt377nx7Fg51BtSpDx4oA4VXH
 FEapZ35b3GpUCzDvUdrMYVmzbXqgSmpt4E82Pfp+gqTQXJ210El+Kb+a70v3P8kBceyF
 uwuA==
X-Gm-Message-State: AOJu0YxxM8zBScfLazZcu2LoTqfBR99en8Jd7w+uLXKABq+jY8waDjFG
 jXBfnQurgMjGhDz7FJ+tezMDL/mzcyxTJV7wJ3F3onSL5ssfE8v5
X-Received: by 2002:ac2:4d81:0:b0:503:388f:30a3 with SMTP id
 g1-20020ac24d81000000b00503388f30a3mr9191715lfe.26.1698762181949; Tue, 31 Oct
 2023 07:23:01 -0700 (PDT)
MIME-Version: 1.0
References: <20231027060709.242388-1-thuth@redhat.com>
In-Reply-To: <20231027060709.242388-1-thuth@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 31 Oct 2023 14:22:51 +0000
Message-ID: <CAFEAcA_299ZdoWs2kb9mUJc_thzEztuP_ou_uHs+p-z7Kf1y6Q@mail.gmail.com>
Subject: Re: [PATCH] MAINTAINERS: Make sure that gicv3_internal.h is covered,
 too
To: Thomas Huth <thuth@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, qemu-trivial@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::12d;
 envelope-from=peter.maydell@linaro.org; helo=mail-lf1-x12d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001,
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
X-TUID: vNl9Q+l4bU23

On Fri, 27 Oct 2023 at 07:07, Thomas Huth <thuth@redhat.com> wrote:
>
> gic_internal.h is already covered by the "ARM cores" section.
> Let's adapt the entry with a wildcard to cover gicv3_internal.h, too.
>
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>  MAINTAINERS | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied to target-arm.next, thanks. (Let me know if you'd rather
take it via some other route to avoid possible conflicts with
other MAINTAINERS updates you've been doing, though it looks to
me like this is probably not going to run into conflicts.)

-- PMM
