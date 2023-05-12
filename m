Received: by 2002:a17:906:4810:b0:965:a47e:1721 with SMTP id w16csp4844970ejq;
        Fri, 12 May 2023 07:47:04 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ4JMI0WzJ/rZnjcBrLiqb/z0VxWxmF9OkjuXr3SEGR3k8Eg+L/TRCgLju2BohPrT02/ZwhA
X-Received: by 2002:a05:622a:2d4:b0:3f3:8b74:dee1 with SMTP id a20-20020a05622a02d400b003f38b74dee1mr29902119qtx.43.1683902824465;
        Fri, 12 May 2023 07:47:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1683902824; cv=none;
        d=google.com; s=arc-20160816;
        b=NabfdmGjjQkg+QA8T6VgiF5Q2Q90Sg+eRXy9zI8Y+weBsMPcterf3QEbbzeeOiCBpD
         6GmhX3JMacYP0DApUFOSY0DO0rUP8eQ04EV6Gdbj4/Q9kHhujVf+CWKqF2Po21ci8s+b
         yOgxen8u03Egv7c/rrC3gmOQDUqy9XKOyVXC6xwHe0lMIpksLCRZM0Pm4B0ShTc4ER4z
         SwS2iXbxR6Td3m/gVssityDDOSdeut8ZLROsbBUMHNx36c5+js415exgcw/aRzBKq5rF
         N90MNaVd31tJj3jAeuXqj0/KE77BwUv8cF4wWoq/zy8LgCUfzQ7uxYsHHgiolg0c9RJy
         GTYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:cc:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=iPU14pOSY/PCURzbFqEqxjo2Aqsydj5jxb0kRzQ6P2U=;
        b=YJ3B9HeP7gr3mu0iT7tYcW/kNK+JG/SVDl1nh3ddAlcGptf3Nz17stfSbAZy/ku5NU
         Re2rff+GJ/ryOsUxUhHOzoEs4JiVYn8Tm3AxRtzH/hQw+gq5gB3zeML/elebF5VIsvdL
         BKtCzM1KFhSzbHWS2E1az5cWnzS/OnLoAljk+uZuyHciebmu3Ow9tpeEmtgaKLtly5ix
         Ue1mKSe+fM+U9BF7wnocGmZD5G6QtPJutsR1NPWxBW3u0k/NuAjH+HovWHqK/QsayMRu
         DzcT9nsgrNoZagwX//6D9Bztn/2RYFc2jyxDj+BXNfee56mIbSlQN0b/I/uyKKRyulpb
         bXCA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=EEMu1zau;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ou21-20020a05620a621500b0073baa1d934esi8794057qkn.689.2023.05.12.07.47.04
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 12 May 2023 07:47:04 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=EEMu1zau;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pxU2u-0004zL-P4; Fri, 12 May 2023 10:47:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pxU2s-0004lo-PG
 for qemu-devel@nongnu.org; Fri, 12 May 2023 10:46:58 -0400
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pxU2q-0005qN-Fx
 for qemu-devel@nongnu.org; Fri, 12 May 2023 10:46:58 -0400
Received: by mail-ed1-x52d.google.com with SMTP id
 4fb4d7f45d1cf-50bc040c7b8so15250613a12.2
 for <qemu-devel@nongnu.org>; Fri, 12 May 2023 07:46:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683902814; x=1686494814;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=iPU14pOSY/PCURzbFqEqxjo2Aqsydj5jxb0kRzQ6P2U=;
 b=EEMu1zau9+g0iR1edIn5kmkLoSvEVlH9XSLamM3qcF8RCbXvD82PrPGmDuyHxKx8TZ
 AZF7DcXPomRmQF7/lqYUYdbIZ0Ds28z45iTuH4xymEUSclIfPbrXXBlnowgm11X0aiNm
 dD47tr1INuIbzzpJg8IuafUuMkuy7Sjki6q8eiq+k+qGLJvAUVnfs3ey+mnRkgxBYfrh
 G5V0O78+bqvdrqX6tUWU3w1M910lm0/H4w2Ou6azHVrll/2XsKGklFjW+UADZaKJ4Vu2
 6vFuiHQQSmhNG5ekm0Pe3CBuxl/NTZmo7WhFpT/qfgwhODjy4lGJU+UfUnLh1cmamTFx
 9PfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683902814; x=1686494814;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=iPU14pOSY/PCURzbFqEqxjo2Aqsydj5jxb0kRzQ6P2U=;
 b=Lz+Wh8hfBoUsLhKLXKNLJcCUzVb/cI604sLv3mIqEOGP5Ps11YiBc68e/AQvPjn0Bi
 6QyEDQHX7g9Ov/BUL3gJO2xMqS/ZAOXMijGXxTB49G3y2c4qkEd47UESMSd/WMw0Lz5f
 IRgZ6xAb8Ms27c/Gkq0dknMoXQj3fMKzfa2YAvsmaWmOrKMyNGJdiwY3ucGJmUpk67ge
 pfG5D1QUSXuSTDs+Kde57b3AqkLz5TdggIztgMtXrCdU5xW+/WFmG15LYzW2MPN/hLUQ
 d/Rr9QRdYB3oQChbfhuKLCcNMz5vCvlc2vP8KQh+5G2EviC/yJlLsHY1q8W2dK/mewrp
 wYtQ==
X-Gm-Message-State: AC+VfDxGCwsfLSGzT6Z2FVKR3SH8rBPwea1sqLBFTEUtkWY8qKEHe/Os
 iH7tEM3K+er2cPEtSneh4YVhRJ/dkYYsv2Vy2f9/9w==
X-Received: by 2002:a50:fe8c:0:b0:506:ba8d:c317 with SMTP id
 d12-20020a50fe8c000000b00506ba8dc317mr18569012edt.40.1683902814596; Fri, 12
 May 2023 07:46:54 -0700 (PDT)
MIME-Version: 1.0
References: <20230401104953.1325983-1-smostafa@google.com>
In-Reply-To: <20230401104953.1325983-1-smostafa@google.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 12 May 2023 15:46:43 +0100
Message-ID: <CAFEAcA8=sOzRW9QZqrpsLZh6q_erXmj2xfazfKrgg_ESR8Fy9Q@mail.gmail.com>
Subject: Re: [RFC PATCH v3 00/10] Add stage-2 translation for SMMUv3
To: Mostafa Saleh <smostafa@google.com>
Cc: qemu-devel@nongnu.org, jean-philippe@linaro.org, eric.auger@redhat.com, 
 qemu-arm@nongnu.org, richard.henderson@linaro.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::52d;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: Re037lIqQ9Z0

On Sat, 1 Apr 2023 at 11:49, Mostafa Saleh <smostafa@google.com> wrote:
>
> This patch series adds stage-2 translation support for SMMUv3. It is
> controlled by a new system property =E2=80=9Carm-smmuv3.stage=E2=80=9D.
> - When set to =E2=80=9C1=E2=80=9D: Stage-1 only would be advertised and s=
upported (default
> behaviour)
> - When set to =E2=80=9C2=E2=80=9D: Stage-2 only would be advertised and s=
upported.
> - Value =E2=80=9Call=E2=80=9D is reserved for nesting support. However it=
 is not
> implemented in this patch series (more about this in the end)
>
> Features implemented in stage-2 are mostly synonymous with stage-1
> - VMID16.
> - Only AArch64 translation tables are supported.
> - Only little endian translation table supported.
> - Stall is not supported.
> - HTTU is not supported, SW is expected to maintain the Access flag.

Eric: are you planning to review this v3? I think only
patches 2, 4, 5, 8, 10 still need review.

Mostafa: is there anything in particular here that means this
patchset should stay an RFC and isn't ready to go into the tree?

thanks
-- PMM
