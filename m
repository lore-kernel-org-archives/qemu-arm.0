Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp1459077lfm;
        Thu, 25 Jun 2020 09:26:18 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy7+nGh7NypqHP2TDjSak3B7WBHR4byUqe0PrZiSUijqtacYjXKGw0atmxM7Dyw9MtF4nEm
X-Received: by 2002:a25:23c4:: with SMTP id j187mr54050694ybj.219.1593102378340;
        Thu, 25 Jun 2020 09:26:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1593102378; cv=none;
        d=google.com; s=arc-20160816;
        b=NOdciidhw0n0kwDqoGmb8Wi4+f6KPX/TFX7/dPjHegh+tWm2nnPEoAb31SPPSWrXIt
         6Jh3+yUmjoNSQP/IKaO+Z3BAawNkWZF11V3Xnszxt/inO/0/3NmcAG4TQZi+XnuthfIq
         3dVV3NL/fj/BtLZE1R8cMN6EblVv4R6DolFTYs4fXQZR9y8/4eYj0TVcuQBUv0x1XY1t
         dSROb3jntMh2yDs/BGFnQaqH1G+QuD9apzOrpDh3+lImeiviJmXwaqzEBqTxOckyFqbu
         +aVO3hcEzqJDWZ6oRLOpGl5t021D965Gjh+h/FMzMOlNwMfR5EJxRWGeyWWW6woZMifJ
         J3gA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Q4NICn2rH9wRXLsNbSacQr+mTFRLOs/zOXykNRuPmDw=;
        b=eM/tFIuh+2Vc4KrA3cqcekApj+7VhLV7qnBM4JBGC4oDaW/Gq24dYGpAbUYNVQAB1L
         ap+rxKYyQLsx4T0e3ptxCg+7FV5VuyhwfycSkSyNKnosjQx7zpjsV5xOuyDvyw2A6POL
         efZoj6XT93ylYzPILh1HTGFPEfzoaegPOJyMVJujgxZmoTu+RwngNvt/rtscS+OGByu4
         T0Puf6kxQL7M+s4Jw5s3S1bbx+ITphCn4nkmBO0nO5DxbEeAtNMCdfm2GrUL7rqApZ3G
         6GZLIzg+/8JDGHajUtGo8j/Z73g8LNf2YBLvDbKX0B8RH1upaC/O+OnNWvmN9r1EfCA9
         f5FQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=E7nOy4Wh;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l126si11464267ybc.480.2020.06.25.09.26.18
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 25 Jun 2020 09:26:18 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=E7nOy4Wh;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:60076 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1joUhd-0000Gt-Ll
	for alex.bennee@linaro.org; Thu, 25 Jun 2020 12:26:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56274)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1joUhM-0000E4-1b
 for qemu-arm@nongnu.org; Thu, 25 Jun 2020 12:26:00 -0400
Received: from mail-oi1-x241.google.com ([2607:f8b0:4864:20::241]:43750)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1joUhJ-0001nW-43
 for qemu-arm@nongnu.org; Thu, 25 Jun 2020 12:25:59 -0400
Received: by mail-oi1-x241.google.com with SMTP id s10so5237639oih.10
 for <qemu-arm@nongnu.org>; Thu, 25 Jun 2020 09:25:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Q4NICn2rH9wRXLsNbSacQr+mTFRLOs/zOXykNRuPmDw=;
 b=E7nOy4WhTn4Y6T562b2h68Z/JAsJ6nEe28zCJPmT7gKdp21Bp2S3o8beGrvjYTxhyb
 KvKFZKqVLnSpKGC+ErUYm/k1NA2+WewSuAaJ8e6VL2tU1b/bQ1pWGMpqo5aCW342cXTE
 YQoMuYllnmnaWhoBOth4gItxVksIRm0Gqu9ejSKKzEpcGewFrFodZc3eAszmyNVkmgG9
 HXaqRLRGtPj8m/BVdEkWTuWoqnMtMajhlrr+DDi/v68QS8U9V1vkP6uZNvLTV8jGKbpo
 26Iv8WPuetz4JoRZ419xzYrAG99333xTxIYbDjlaBsAEqss7oIYt6mlKKHShmfQsda0n
 oVfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Q4NICn2rH9wRXLsNbSacQr+mTFRLOs/zOXykNRuPmDw=;
 b=dZAO24L33UjbFXqoIj179zI83Th/NORpNU6BVLF0aHoJZGZS611QfmarHPgv00Q4eH
 8mNsXEQQrbMg6Z8Y45i56Qt6z+UAjg/wTf1p0bg6J303P3jTvXPHkVWSeis1ooTAJVhz
 RVChSJd+vKRwkI53CK6RD+dRdmOLO3+LBmZvMl3ZUyLsjiypk/GJO5kFjXwH3eK4TCHc
 9PjEF4gZmQ5asJ9rJOf/dHaT0tjXEarVdR103QLREjNWZ5Bp+VT/EM8OxzUA0uRMR7qu
 uRPvU2dK7GmbNg7XmUc/4JmwKmFc8xkQTIFVU1qhvPd9jFioqcqcvZT4aE1sHVIp99GA
 6NJA==
X-Gm-Message-State: AOAM531yElkALhL1nxV3v/SdKR/hAOxayPhbQvnSGtG+noRbpY69ayo0
 IVX2R1Hql1KcX955SbrbRkskf9VQH2xtOcZnhDEWQQ==
X-Received: by 2002:aca:1a07:: with SMTP id a7mr2946481oia.163.1593102355864; 
 Thu, 25 Jun 2020 09:25:55 -0700 (PDT)
MIME-Version: 1.0
References: <20200605041733.415188-1-richard.henderson@linaro.org>
 <20200605041733.415188-4-richard.henderson@linaro.org>
In-Reply-To: <20200605041733.415188-4-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 25 Jun 2020 17:25:45 +0100
Message-ID: <CAFEAcA-y4zVO059kyULgqJmY0_sRUUDREryQ3Zp54zkw9ykGTg@mail.gmail.com>
Subject: Re: [PATCH v2 03/17] linux-user: Check for overflow in access_ok
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::241;
 envelope-from=peter.maydell@linaro.org; helo=mail-oi1-x241.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
 Stephen Long <steplong@quicinc.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: YqDFAXQuSKJe

On Fri, 5 Jun 2020 at 05:17, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Verify that addr + size - 1 does not wrap around.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  linux-user/qemu.h | 17 ++++++++++++-----
>  1 file changed, 12 insertions(+), 5 deletions(-)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
