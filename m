Received: by 2002:a19:2d51:0:0:0:0:0 with SMTP id t17csp1155947lft;
        Fri, 1 Jul 2022 04:21:18 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1voiLcYrQuWvLBfrEYV4Oe/YHer4LOrYszu8sWojFHjRVxJzvGC9EyXwGkN4ftuPEjpUdCG
X-Received: by 2002:a37:6841:0:b0:6ae:eb59:7fa with SMTP id d62-20020a376841000000b006aeeb5907famr9885883qkc.37.1656674478036;
        Fri, 01 Jul 2022 04:21:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1656674478; cv=none;
        d=google.com; s=arc-20160816;
        b=baOSmg8Y15JNDH9LBSZ/ztB6Bl2qVwD5nkJIcZIq8Qi6vFEClZ3D+K3ERC+0+cv4qv
         xdPI/iBCbiHkV/oAKn7MF6SRH2PvHzp+haT6XKnJ9+UISkl3Sz2HXZGbC6dMTKqz4TgQ
         KbnhIyaDSvB1Vr7BMGRPOXbiRDQZ7L3KTwkr3/RcQhQeLtlvn0BsjFq6Ln6XiqbYacLZ
         KEKNuNNIYGBmpjVfdiZqgwAdbsUxohFBRrCjz4UGyi+eY87wufSzyT9W9Xm9wPvoJz0L
         SFfFHZuv5oWuZaUbs92aPcOJ2MIpL9YDbHU1wZA5cA4QdOPmW5jNuazE/EKOyhfzDh+d
         MnEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=NDaXfNacei7vWPMabr8USaitPReqjtROD7TtCYdu3DE=;
        b=oIpTis9Y1f+pE+f3Ijl1hwteyrXDQbG+Cgsp7PHP/rsX42nsLg+AnP2gB2JAQjpPlU
         AJLTa6xmUGWlovj+ycwYBr5F785XM6n/XeCy49UY0LPfXUiS0nMbzBJ0mo7kBsx0roCv
         hQqSVbLO39xleUaXve5Y4PF9R8VN5SQlbUb363riMJMYA4zIyPLdkZZJWwgaoyKPOivz
         vTQn9BwIVXdOdYddKIMbfRQSLx34pUy/8XOGv0sVV7F8olEZQuT4sx2n68WUoBQvZJNc
         LzL5mn8PRTO+FTmJw0v7ahJa72bG/EBOLrOCY/uE+2RocOHK0U4xOdfDOI8hNlelrXjf
         5/VQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=OU3Urmtw;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m14-20020aed27ce000000b00304f1a0781csi12257170qtg.171.2022.07.01.04.21.17
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 01 Jul 2022 04:21:18 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=OU3Urmtw;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:51650 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1o7Ei5-0007WP-Cm
	for alex.bennee@linaro.org; Fri, 01 Jul 2022 07:21:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54448)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o7EdT-0002Xg-2k
 for qemu-devel@nongnu.org; Fri, 01 Jul 2022 07:16:32 -0400
Received: from mail-yw1-x1135.google.com ([2607:f8b0:4864:20::1135]:45856)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o7EdQ-0000g4-LG
 for qemu-devel@nongnu.org; Fri, 01 Jul 2022 07:16:30 -0400
Received: by mail-yw1-x1135.google.com with SMTP id
 00721157ae682-31bf3656517so19928467b3.12
 for <qemu-devel@nongnu.org>; Fri, 01 Jul 2022 04:16:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=NDaXfNacei7vWPMabr8USaitPReqjtROD7TtCYdu3DE=;
 b=OU3UrmtwWLbgBmmV2e757DXo8SP34+Ff+ByBvsY+ibYKi26eyZGYyVvcJjlN8qTuoG
 TfwPxpkHJZN+SYGpbtODP5COrs5oKCtIewPRXcQrNfnpR2D6SY357mGnmt0XgJeDsYKi
 2DMbL2GVFKOwVedZR9PvcVmZpgYHi0WlMpZt1pwdHrrTv/4RCki8YGT6FB3i4cfAZe11
 AixtfR1c0EoNKlWcmfES7sQnkc1168iF9vv9Mw4aA+wyG39Wtg+bSjErFrlrWyBUmYR2
 yGGZrQjPbarRGso+eFNZi71CXUK7XgZGZ6+ZTkRGU7Nl6vbz5SQ8XbYk+663Sm6d76fu
 /nLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=NDaXfNacei7vWPMabr8USaitPReqjtROD7TtCYdu3DE=;
 b=yK1cw8CbB3dUlPAgtFz7kJi2rO1UaU2fweN/pdMh99x+G0QCyfwv733BV3ye0XVef3
 tcDvDIZBfHd3b5mVqDkdgPxl/BRcllrjxM+83ax6xvIWlyecWXEcZN8BogqNY5qU1XgF
 DQT3qxLUo46Kqkv/ljFgt/wR5Hi3YTQpAn67YiHE5HnH+jVnWdJ/9RreAcEy9rvD2g13
 9HouRtfrXEQJ1jh14y+yIXPdjO7Y33zidkKptpCDCx8q30qw4vok3Mj+DhJUj5HBd475
 FA0uVYL+ylrYiSXKiN9sZZKYn5K1j3ak8GNINhzlXV2JVZZTS6KDnBhp2sJwOznkub1c
 q8gA==
X-Gm-Message-State: AJIora9+b9EHI27Nn27TAaT9C6Lc6t/sWNs30Udzb4jHvxbrVyd+dbF5
 y0ULLqXuZVQE1PA4kuDrAPwPj7dPLssQLQ63YLQaQg==
X-Received: by 2002:a81:8d08:0:b0:317:a4cd:d65d with SMTP id
 d8-20020a818d08000000b00317a4cdd65dmr15662372ywg.329.1656674185885; Fri, 01
 Jul 2022 04:16:25 -0700 (PDT)
MIME-Version: 1.0
References: <20220628042117.368549-1-richard.henderson@linaro.org>
 <20220628042117.368549-6-richard.henderson@linaro.org>
In-Reply-To: <20220628042117.368549-6-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 1 Jul 2022 12:15:48 +0100
Message-ID: <CAFEAcA8fD4UCjL3bN9k6FO=Ok_9Kb63HEEaqxCSz7S7msiagaA@mail.gmail.com>
Subject: Re: [PATCH v4 05/45] target/arm: Mark RDFFR, WRFFR,
 SETFFR as non-streaming
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1135;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1135.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: /0ELAExEDNrC

On Tue, 28 Jun 2022 at 05:26, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Mark these as a non-streaming instructions, which should trap
> if full a64 support is not enabled in streaming mode.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
