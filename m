Received: by 2002:a17:906:4810:b0:965:a47e:1721 with SMTP id w16csp427085ejq;
        Fri, 5 May 2023 06:42:11 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ6U+YUEKuzZn5+k4MNHnHhsXl2n/ddQcMV0zEiOjLf41NayWB5CiljM5p3puEZ5bOXNK5cd
X-Received: by 2002:a05:6214:c6c:b0:5b6:eef9:b8f7 with SMTP id t12-20020a0562140c6c00b005b6eef9b8f7mr1853632qvj.6.1683294131143;
        Fri, 05 May 2023 06:42:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1683294131; cv=none;
        d=google.com; s=arc-20160816;
        b=YJmfkUhLa43q/s5TyznqKIWDknOUzkCQCdNR/6iP88EzxJm61NE/kvEH9L+xmyj5hb
         tSuqwg0Hz9m+9lbtveTEbkPZuGW+iqWI3Uue3t+w0+Tt0mCinTiXm6N4Amuv39nVKvfJ
         bfZG61eoQEWdWk1BXX0sUp/YlypGYdmu/g5Dcd3vwlD0FTdcmy2TJ5CsAPpIYByqZmHH
         TGxUi+mfYgcUyKWymE8kdYni+ZUGe3qVmWIWnBPhaJBBUb3A2nkjgtdKO5mBCktpe7d1
         TL5oYPIBSRL7gbL5nYOo6dzOQmTkjdQYzJ5Wh/zkaVaX97WUIknOr1y13X7b8ua3Un5f
         CNXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=7f5h1iRZb1+tDkLxOl0fFHf+gL+y5D18jFkKmHbEb/g=;
        b=TTFG8NWQfHKzbTu0NewW8wLdWGOUqC6UIP07xXf8w238cdXYsCbhCkGpgeLxSJCInI
         JZo86xwQvf5WNH31ee0rKWgo0mOoxq1hj0F9/MjBAr4JuwZasYkIU1INWSk2XjPep/D2
         DtcHJ7RkKpdFBiEFLa4L4OA/Bs3WawON820jm+bZNaV/E0by5Yr6NYIJOrOVTuP6RrGV
         lUI6/2qRsCyJYWslN2zUXA+mcPNEr/wGNqAmlExp1SVca2dYW7TCtpigTIU2wQAj9ILB
         FbnnAElY7EpFWuXG6mC10LQYLcxM5r0Tvbss9r+ay40JB5HA9lz+gvZ0cNd2HqCUhvHL
         A8iQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=yJPaqQ00;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u9-20020a05622a14c900b003f202c08d3fsi592435qtx.209.2023.05.05.06.42.10
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 05 May 2023 06:42:11 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=yJPaqQ00;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1puvgs-0000dQ-7l; Fri, 05 May 2023 09:41:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1puvgq-0000cc-Jn
 for qemu-arm@nongnu.org; Fri, 05 May 2023 09:41:40 -0400
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1puvgn-0007I5-JY
 for qemu-arm@nongnu.org; Fri, 05 May 2023 09:41:39 -0400
Received: by mail-ed1-x52d.google.com with SMTP id
 4fb4d7f45d1cf-50be17a1eceso3415193a12.2
 for <qemu-arm@nongnu.org>; Fri, 05 May 2023 06:41:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683294096; x=1685886096;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=7f5h1iRZb1+tDkLxOl0fFHf+gL+y5D18jFkKmHbEb/g=;
 b=yJPaqQ00/KJmQbXoIb6NFRd2HPNWf6NLeVpuC2MyDevHxgGzpD90pOJACg9MCskezj
 oIKsvLmLZGtHbj5pkwyuL3yIXIseS6K4CqTMrF29DxSI179yCw8wYP5RCYYauBoTgmRl
 YBOyKL0buoJBLAdiU7HtOp5Y2OpHasx79Itu0ZIMwQoAQxxPkqN4KvD+17jVfGMQvRSl
 yI45SNtKAjAGvLIl7e9GkLHNn1RwFe/J+KZhmg+pct9J36N1PPA32FsJc3zFf5jhNhpE
 18+PVyzEv1KuB5MeU1+Xh5jB6RQ2GEYtrpmSQRfsNBwYggbOooX2wXhGjjDxiFH+69hf
 CfKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683294096; x=1685886096;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=7f5h1iRZb1+tDkLxOl0fFHf+gL+y5D18jFkKmHbEb/g=;
 b=e+glGqBs7me8XfulsRxQobEMPgU+1ttm/sndWxlBTh0tIZFozjSblYRsYUwdCKq8f5
 1ssE1gm0S2ZSgxk9sgSYqNbL33/5z+G1bS425qFBWj+ejKGX/1B/Ro/HzX6QeUd0sPjW
 NnBKUv928MqwnDlGQA6jflGEAPxusF2MTlBZBFAgEtbDAf5IyeCaLHWCrqQMD6sFTwUK
 ANf8sw2K6NSM/wp/uvKeKzBceB5iifW8QQQxH9dFEdPuFdb+W559auxh6fMV/+MTwpdB
 dXy+FDe5kiTb8DnLByhkA160kxuyyICBo8oDNvbYBWCzmsPi8sRUKESUwlg51hw5H1y+
 XIPA==
X-Gm-Message-State: AC+VfDwB5Ey7twlMGt6Z5oGAhWb/mv7ba1yOf7pdiUJRwuPX/sQQxE4O
 zULx6pOI78cHx/cfvJwazsYZIbqNdZr2LHPauP8NYQ==
X-Received: by 2002:aa7:c241:0:b0:509:f31f:b570 with SMTP id
 y1-20020aa7c241000000b00509f31fb570mr1435960edo.23.1683294095764; Fri, 05 May
 2023 06:41:35 -0700 (PDT)
MIME-Version: 1.0
References: <20230503070656.1746170-1-richard.henderson@linaro.org>
 <20230503070656.1746170-56-richard.henderson@linaro.org>
In-Reply-To: <20230503070656.1746170-56-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 5 May 2023 14:41:24 +0100
Message-ID: <CAFEAcA9UhVw_x_1WAgNBWB6NNfpLAt=ALXAZ+Thcg+rbNhcGUg@mail.gmail.com>
Subject: Re: [PATCH v4 55/57] tcg/aarch64: Support 128-bit load/store
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, git@xen0n.name, gaosong@loongson.cn, 
 philmd@linaro.org, qemu-arm@nongnu.org, qemu-riscv@nongnu.org, 
 qemu-s390x@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52d;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
X-TUID: gmFyEn/L1lY8

On Wed, 3 May 2023 at 08:21, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Use LDXP+STXP when LSE2 is not present and 16-byte atomicity is required,
> and LDP/STP otherwise.  This requires allocating a second general-purpose
> temporary, as Rs cannot overlap Rn in STXP.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  tcg/aarch64/tcg-target-con-set.h |   2 +
>  tcg/aarch64/tcg-target.h         |   2 +-
>  tcg/aarch64/tcg-target.c.inc     | 181 ++++++++++++++++++++++++++++++-
>  3 files changed, 181 insertions(+), 4 deletions(-)
>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
