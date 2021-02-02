Received: by 2002:a19:e8d:0:0:0:0:0 with SMTP id 135csp185649lfo;
        Tue, 2 Feb 2021 06:57:36 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxGvt5b3GOBQdhOpbYXwkz5qyouc8lLl66+/UXDjr77Ln+QqfitjfWqmEl2TFsBkllGXshA
X-Received: by 2002:a25:2041:: with SMTP id g62mr33962542ybg.152.1612277856742;
        Tue, 02 Feb 2021 06:57:36 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1612277856; cv=none;
        d=google.com; s=arc-20160816;
        b=aY0SBlc+mQmm6DMc8K1Ru1QX69QuKH4m68h/TYcp6HHdtvxRonwi7a6jVqOa5+Eoi2
         6YYXgB1hzh3wtc3Fbe7gM4SY5dHJo/vmREzUq0M+Y1COd3CM9iJEEw1q+dQ7G3cFvgey
         jTxQEgbCeYeOhY1OgFONub5pMnQmIHEakaBEEMPDUZp7j9qZRCf/xjNCJ3MSrHZ+yDra
         79OjK7ntK567MzA/lvG+kM15+FBm0Z2LsVl33W83R7gIc/aJ4ba2zVgb+uvcRsLS8VVk
         NMGf199DUQIqZgv5oQCZhol4xDgWrjGW9hUndDeMWBo8euSpHxRXi7fGoQSlDviq4ihb
         iU1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=h/SpySeyFodIB7F00VfYI8PGZe4jEagsQRXiN768hS8=;
        b=ptXK4sOzwgQUxAwzgOtoJgkOYRhrX5eYsFem9VpSzn9Ax3VxCqUAp+nOJ13di+2GCW
         Cck5rXb9w21TxIX5TZFQN91mMLxxWhObt3pY13kvTUny0FwkNxSUY2SY/kcP9PvRTFO7
         8ZTv8JqWddWwaKBPpm/RNX9O1FQ8ZFXBN5Mi1p4S6Vx4uZ/NrhUBjsAieCgpm9fqZtIP
         6yG54cwuXuMRf4ms3PdUo+7w/0NLimdWF6lDrLr1Bzjsge+a3fYlOirnNE1NKj0DbbN6
         LWWpjgDydVL2gqrczUQaqgey4OUZtYmQRCBeu3Ys2q6MFtje78auYfoYM5vvDIx3LX26
         pieg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=OAV9s9bH;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u1si23425916ybk.9.2021.02.02.06.57.36
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 02 Feb 2021 06:57:36 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=OAV9s9bH;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:59202 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1l6x7Y-0003s8-3a
	for alex.bennee@linaro.org; Tue, 02 Feb 2021 09:57:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46988)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l6wrS-0008Ri-MY
 for qemu-arm@nongnu.org; Tue, 02 Feb 2021 09:40:58 -0500
Received: from mail-lj1-x229.google.com ([2a00:1450:4864:20::229]:34744)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l6wrQ-0000Yx-6e
 for qemu-arm@nongnu.org; Tue, 02 Feb 2021 09:40:58 -0500
Received: by mail-lj1-x229.google.com with SMTP id b20so16378703ljo.1
 for <qemu-arm@nongnu.org>; Tue, 02 Feb 2021 06:40:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=h/SpySeyFodIB7F00VfYI8PGZe4jEagsQRXiN768hS8=;
 b=OAV9s9bHddnPkLcnHV/TbrJrcHWjA3EOI5hQoy5jNrIK8n82Q6kQ8HXcSLu+ngS+qN
 OOGGJworasx0lV036AIDQIoSzUqUSI9t1quuWmAyqnQYzkYAPpLDpuTmhSD2n0JQszSV
 pRPP/iwx3k1ER/d8rugkawpCedrrQdlnop+BHzlToEkg7MKuBB3Byy7dBSjHE7IiWwnj
 fo+g9VpjB4UE5vOKTQEXI+sgwcy0x11l59orVOt3l+obzIyLBiq7WcgOddNGMtIj4nNC
 m2sjJCM1P5zHg7NGclBwe1QnYFo64AoVj4ztZ2N12VeLBhRNdr1UCfl+ia1QwxNxq0T6
 01Gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=h/SpySeyFodIB7F00VfYI8PGZe4jEagsQRXiN768hS8=;
 b=cwiLtU4xBU14Hk1xLAND5LH2ZJU7NI+TeK3gpLUSxOMd+TiwwbQHzhUrHmUmwpTXRs
 bjcC/+e9/b/4dKFWpfTJCz6fv7UNXy+lUNz5jfJY31sOJc6TFmhGC+sPC//AydVnmBTJ
 ItgIaNNzPGPaELgIdutOOTmVJdchQW2V699cQ4Ty5iHjm+kc9AH4yTjPPGoZZgXZJvAe
 aDQdxqeRh2zutcQL/nRSKDfcBKBXFLkMNOLo8u12Ujcsfwvpf6xXrLcl8dV+0t4gH7Rm
 +Pbr+KZTaO/NGuq6J9ITBEzp/gTZ559HdNRKHsTCyDw6UpIPDMj24x+OnbKKsg3iYLwj
 CXSA==
X-Gm-Message-State: AOAM530eD+tJE7g1ibCQGAknqXLLcJI/VvitlnEmwQ7dzWic13pWOW1c
 g2e+OSaSAwCN205H/g6BU7wuL1SvXIkOv2yMP21mas2zdtY=
X-Received: by 2002:a17:906:2747:: with SMTP id
 a7mr23521700ejd.250.1612276851857; 
 Tue, 02 Feb 2021 06:40:51 -0800 (PST)
MIME-Version: 1.0
References: <20210128224141.638790-1-richard.henderson@linaro.org>
 <20210128224141.638790-14-richard.henderson@linaro.org>
In-Reply-To: <20210128224141.638790-14-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 2 Feb 2021 14:40:40 +0000
Message-ID: <CAFEAcA86a3YhEUOc35iZ90sq-LVDjj+Bknb2=0UhxiCZPerZVw@mail.gmail.com>
Subject: Re: [PATCH v4 13/23] target/arm: Improve gen_top_byte_ignore
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::229;
 envelope-from=peter.maydell@linaro.org; helo=mail-lj1-x229.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: No4bShrpBDyy

On Thu, 28 Jan 2021 at 22:42, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Use simple arithmetic instead of a conditional
> move when tbi0 != tbi1.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/translate-a64.c | 25 ++++++++++++++-----------
>  1 file changed, 14 insertions(+), 11 deletions(-)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
