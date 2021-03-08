Received: by 2002:a19:6d5:0:0:0:0:0 with SMTP id 204csp2020609lfg;
        Mon, 8 Mar 2021 09:12:52 -0800 (PST)
X-Google-Smtp-Source: ABdhPJymc64Y/GaYTmWnaonVwCWKoP2F6nZsmEZIklBECviKBx6uqbzo7wuhPNO8FEYvsPVldQ/q
X-Received: by 2002:a05:6602:3144:: with SMTP id m4mr19014276ioy.103.1615223572686;
        Mon, 08 Mar 2021 09:12:52 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1615223572; cv=none;
        d=google.com; s=arc-20160816;
        b=zzJEs98AFJjf9IZuHSgGuNI17ZcU+O8wfBHnULc4dKxl78/crTR1dqLOSTL8IcOopr
         onszJYLxRxaOz2hVzxF5mAFgReLQtXkr1KeaZl65XiFfUSDFqh1pmZpOS38wPFL/YKwu
         CSrsBBFY0AEHKcR/bkVQf7cIi6clesVdJE+sgdvGukYc9lqBmLXV4SLD2AF9obCQAvb3
         OZBzA2m+Xh/waAiCdnrekDzdnOEsqQg6rhrqciA4gX9vf4vMdN3HPlVr/q65hCR3yNkO
         bljeJ78RvFaX0RqOxJvNlIxY222ppNOgdc3c8iBoVNwgnUALrzt+8vYn4T4kjZNQAQ2i
         tBhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=jU5KAwICWSXyosyYi6jcxOIm/tqKDkJhcUYvpnVwKDw=;
        b=NzolDadPvGSzhwssIVexoLgf2V6LZIKX+XSUwuK9Whwzj6NLP/IgA/q6+W3pYaAAQd
         ULxhVsePa5mE+IkM9B9vr+Vc1WLSynLH/fYSIRU7sTvnD1zZ3Li2VvfE4NC0LRLYIVJL
         v3RHlqiRfN+nBDZL9OCOgdLtVbU2jZ14+RYXExmbvZ66COesU7qeBoaCwSIGXHccJmZK
         Fx9AnA3Sq3dtoVTVKLkUrAvblo1PLlfO+pj36sj9EmfBrrefCIq59rs4Lpi+z3Jt7Mwi
         fBlKGsuhkBXGOGks0+dgKxHvyE/qWz/GZCkxm9U5O1nLpv5Sxp0vlshWM7U/pK+/qWvK
         aUIQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=OhuuEvLh;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 190si11188612iow.71.2021.03.08.09.12.52
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 08 Mar 2021 09:12:52 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=OhuuEvLh;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:39806 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lJJR5-0005nI-Uy
	for alex.bennee@linaro.org; Mon, 08 Mar 2021 12:12:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45524)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lJJBQ-0004Lt-Ei
 for qemu-arm@nongnu.org; Mon, 08 Mar 2021 11:56:40 -0500
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f]:39368)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lJJBO-0008Sl-S5
 for qemu-arm@nongnu.org; Mon, 08 Mar 2021 11:56:40 -0500
Received: by mail-ej1-x62f.google.com with SMTP id p7so10336130eju.6
 for <qemu-arm@nongnu.org>; Mon, 08 Mar 2021 08:56:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=jU5KAwICWSXyosyYi6jcxOIm/tqKDkJhcUYvpnVwKDw=;
 b=OhuuEvLhaC+Pc5Fc2HVjJ3QLzH8iLRf35NyGM4oj2ARQ+lRnlvEEvedlIe4XNCNf2O
 szpUXQOc0+XMgtOfjQRUCGIoE8IqMHaurjN7mfcD5veeGrCFH/s66yXbXyHumR0U8BzC
 JKA4+mKx9cTDQ2mIEP173o5tuOgiAlG36PDClE4jFtpTb1kCRvjA78+/Ty4+jYPdcq9K
 vQTynUP5iJ9o4l7OpitYG13IptiO3hJ+E4uEWuBUW4a2f1w3ay49UY33JI26JF66Ze+z
 nhjtZZaWmSiAYGZnyrucbUeiCCN+zv2E3w8d28LaNrCOpkPPallodoaFumAv0vQA05ie
 epXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=jU5KAwICWSXyosyYi6jcxOIm/tqKDkJhcUYvpnVwKDw=;
 b=O4hxQKl5P0ammpgCg4G1fL/aP0mRODEDtUA9n+pxZ/dapM86qptO0DRm+dTdE92mEy
 Wo+/7O/ah8fogXlFDgImiY6EpnXOIJUMGdqGk11BLX0OCtI/kghjzO38sw6ySjEN9bVm
 up8bQvVNR542knerOr2s68Q901ixMrcBe9f/f0FT1jWFo1yE7CZ67GhqbvxsRWZqSPcq
 eLYvVB3WgYs4eGHBSimgnvENuoenrw88i/9XnJrGyHaD+QHbwOecSHq9WbBTXmh37Thm
 yzYCGgsUcls9/9yAf9TpF90Mvci4rRf3lhuIQounV/AuHp6QcK3XddpLyKSGwQf3QI3u
 eEvg==
X-Gm-Message-State: AOAM5326EEgQwgw+TTwre7xw6kf+iodQZL2s2JrMhv7kVcD0w4HI9sli
 Uw41XYnW2bxmHPwr0RrbB0NbGCxY+aC++peWADbUeA==
X-Received: by 2002:a17:906:66cc:: with SMTP id
 k12mr15525092ejp.382.1615222597011; 
 Mon, 08 Mar 2021 08:56:37 -0800 (PST)
MIME-Version: 1.0
References: <20210306151801.2388182-1-f4bug@amsat.org>
In-Reply-To: <20210306151801.2388182-1-f4bug@amsat.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 8 Mar 2021 16:56:20 +0000
Message-ID: <CAFEAcA8i4W-SjYXYb3zH6rHQ8rFQuQUa0PaaO5TpB=qb43YfaQ@mail.gmail.com>
Subject: Re: [PATCH v3] target/arm: Restrict v7A TCG cpus to TCG accel
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::62f;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62f.google.com
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
Cc: Rebecca Cran <rebecca@nuviainc.com>, qemu-arm <qemu-arm@nongnu.org>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: wxVn6vtbut1P

On Sat, 6 Mar 2021 at 15:18, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org> =
wrote:
>
> KVM requires the target cpu to be at least ARMv8 architecture
> (support on ARMv7 has been dropped in commit 82bf7ae84ce:
> "target/arm: Remove KVM support for 32-bit Arm hosts").
>
> A KVM-only build won't be able to run TCG cpus, move the
> v7A CPU definitions to cpu_tcg.c.
>
> Reported-by: Peter Maydell <peter.maydell@linaro.org>
> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> ---
> v3: Rebased on ed84a60ca80 ("target/arm: Set ID_PFR2.SSBS
>     to 1 for "max" 32-bit CPU")

Applied to target-arm.next, thanks.

(I forgot to edit the commit message of patch 2 in the arm pullreq,
but it's not a big deal.)

-- PMM
