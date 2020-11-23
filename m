Received: by 2002:a19:ee0a:0:0:0:0:0 with SMTP id g10csp3480098lfb;
        Mon, 23 Nov 2020 02:54:24 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyeEVRy8OEuGxG/Nst9K7sEYwu35LH/G5EcAEZgL/5NyFUtmgowHfAd59RW60EYaPseHkvj
X-Received: by 2002:a25:c010:: with SMTP id c16mr31597287ybf.142.1606128864102;
        Mon, 23 Nov 2020 02:54:24 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1606128864; cv=none;
        d=google.com; s=arc-20160816;
        b=SV43LxX2E6/c4xYBCGJxDt1uaXvV3rQ1dg1sIl2QGnfxgY8vvDXxttUimZc1xCIXZT
         EyLSPSf30pQzlWMtOUJS2cwxHveolEODnJsig/wjUeEqvSvXNAD3i2FGXh6e0HcMQTBS
         0awM8uFoEaIFwS+P2QhVqM/XqkrsVdo1hsxx/5uP0BFg0s8Gi7l/Cpvsaug4IdVAfE9D
         BewLZnkAByEf6QYPa6oLKM4Du+8LVlolhRK1aWYQH6UQEs5OGX/JjCpI26D96sQlAsjP
         M3J/BGEF2zJe09cD4LMT9FMhX/NmbejShZ/21htauHI1Vn5GfExnuIGFFDoB1qmk/P+l
         z6Iw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=tSz0F43sKLBmBUM2wLbeZuTPj30ukEkPQPdZNLAmqOo=;
        b=fQpqPdSL5oJBHE7X8VHcsw+L3OcY4qWEmADV0cc1A+BlfCsEeVjljAXZ7RpLjtQO1T
         QkeafCiFWmH5tukh8wXqQeyhbAtQNJtBw0WMGE9mUq+8g7U/dLPYSdjHC+9sxN8evUbd
         6sABOd9be8KSLVbqW4L4SEj0Osr5imCCwZcJqV4pSbQ5758mj6fqOX/la+aO/8bKEDFm
         3KbkTSkUnJb1eRe5fw4F+5J+Vr2wlbqaandPJ1Zj/JRi35mGc4elAn39mfrWWafJ6L+I
         R/30Drys9ZJSXyd9bxeVcaDuvgfaGelj/vpLnM6vFd8Z45x/Qdyi1rTfx9y6pl0NMTZp
         c+Gg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=M4ivXn7t;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s138si12253110ybc.348.2020.11.23.02.54.23
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 23 Nov 2020 02:54:24 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=M4ivXn7t;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:44266 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kh9UF-0003PV-Ec
	for alex.bennee@linaro.org; Mon, 23 Nov 2020 05:54:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44244)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kh9U9-0003PK-65
 for qemu-arm@nongnu.org; Mon, 23 Nov 2020 05:54:17 -0500
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531]:44569)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kh9U7-0001RG-NL
 for qemu-arm@nongnu.org; Mon, 23 Nov 2020 05:54:16 -0500
Received: by mail-ed1-x531.google.com with SMTP id l5so16567652edq.11
 for <qemu-arm@nongnu.org>; Mon, 23 Nov 2020 02:54:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=tSz0F43sKLBmBUM2wLbeZuTPj30ukEkPQPdZNLAmqOo=;
 b=M4ivXn7tfIW4DaTYNVYbWJd1p2QEXMzrWtJLQzckMRMzj8ksY52YUj4lcYLVtGdmEj
 Ow8b35w1+OT99fayPsIEs8SEIvKr8kpbHHgvaCn5uJL5Xi4PhArNmicuoq1UOOLH6KSl
 bvUWbDN6ZghPLjQuLXzyKY/zBm8pIFjxgvOzYwhP0rd03yFPT+EC1iELM6mgUKq9oxfK
 z39ztGRkM3nC56i1vD7wR2TDE+DISyt2j/ZSxGDw/zLyWuZrYrtAeO2wSgj3yVvXYZbO
 PakzdG0698N1FWHbWRUofNym1VjnoegQqWrDkpRP1mlJO9Da4osIDwc1Xt+nSAGEmNYx
 WuQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=tSz0F43sKLBmBUM2wLbeZuTPj30ukEkPQPdZNLAmqOo=;
 b=DzXrQlXhram01Hw+4hQvGnRpTerJMCMO/3bYsg+/cKEEe+CD4ycC4CFYJaJhU7bXw2
 0qiKE+7/Iu5XF9kDOFKq6GCneRCCyZHcfhry+XeFvxNb4KjvdHmzsvyzuLFAdBdinOjQ
 8Vb1Dl70/+vKeAHMUHYSjz5LVwPdznheJPJ6bWFrrAODrTeMyFVzXjkQZBeKz3XyptiU
 vvkdGPcAm8MEpa2FvQFAexfIm3GCTPpmXOpdV/memHKATLBKWhmtiE9ckaKXGU/1ljiS
 cvbT6nR3WhUCk1AcAmFz3gkSwl33W4aiSMVtuHObnCh4CdBXb5gi1wEp+V1vGepVFmmC
 Udmw==
X-Gm-Message-State: AOAM532FG+9n2cCJAgz61jpEyAcv60eXcQyHS+l5H8WWCxK7MO0Nqnjm
 wJma3M8H3GoRDbUVRtjKSGXz/IeBjo46KKmSh2i48g==
X-Received: by 2002:aa7:db8a:: with SMTP id u10mr47342220edt.204.1606128854238; 
 Mon, 23 Nov 2020 02:54:14 -0800 (PST)
MIME-Version: 1.0
References: <20201120173953.2539469-1-f4bug@amsat.org>
In-Reply-To: <20201120173953.2539469-1-f4bug@amsat.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 23 Nov 2020 10:54:03 +0000
Message-ID: <CAFEAcA-=_STKckzXdrkf2LP0zo-Jp88vcGzi3x=ZfdeGN+qzuA@mail.gmail.com>
Subject: Re: [PATCH-for-5.2 v2 0/4] docs/system/arm: Document raspi/tosa boards
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::531;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x531.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Libvirt <libvir-list@redhat.com>, QEMU Developers <qemu-devel@nongnu.org>,
 Andrew Baumann <Andrew.Baumann@microsoft.com>,
 Andrew Jeffery <andrew@aj.id.au>, qemu-arm <qemu-arm@nongnu.org>,
 Joel Stanley <joel@jms.id.au>, Andrzej Zaborowski <balrogg@gmail.com>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Wle7Gtc7FOjv

On Fri, 20 Nov 2020 at 17:39, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>=
 wrote:
>
> - Deprecate raspi2/raspi3 machine aliases
> - Document the Raspberry Pi boards
> - Document LED on OpenPOWER Witherspoon
> - Document Sharp Zaurus SL-6000 Tosa
>
> Since v1:
> - cover docs/system/arm/raspi.rst in MAINTAINERS
> - Addressed Peter review comments
> - Added R-b tags
>
> Philippe Mathieu-Daud=C3=A9 (4):
>   docs/system: Deprecate raspi2/raspi3 machine aliases
>   docs/system/arm: Document the various raspi boards
>   docs/system/arm: Document OpenPOWER Witherspoon BMC model Front LEDs
>   docs/system/arm: Document the Sharp Zaurus SL-6000



Applied to target-arm.next, thanks.

-- PMM
