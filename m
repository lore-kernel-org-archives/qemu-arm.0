Received: by 2002:a17:906:4810:b0:965:a47e:1721 with SMTP id w16csp291379ejq;
        Fri, 5 May 2023 02:44:01 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ7pGbuyc6RDBKh0FEDaUtsdYg4VpbPc5NHvyHr7yfMt88JpziT1wMGS43epDDkSqkZkVB9C
X-Received: by 2002:ac8:5c4e:0:b0:3f1:feb1:ea04 with SMTP id j14-20020ac85c4e000000b003f1feb1ea04mr1459158qtj.15.1683279840821;
        Fri, 05 May 2023 02:44:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1683279840; cv=none;
        d=google.com; s=arc-20160816;
        b=pbxLPRVu8zghuaAN7VvEoUcIQy4UNZV70Z+Nxl7vEk+2brLP7+tiM+wO8uZcTjRdAo
         KNdVX1Gokaakq8X67bAOnobDeOR19MMkBCji9gRd/SU9f1Ly9xkyADXvbc6aRIPys11N
         GEHg+GZwEAFlz5j5lbFnJomWTo2WaRcM6Ws3nxMh/yNZ8V1p7pWtVJuyS59Me8Ei1VNg
         2eQ1rXqT7Au86W0rRleIwYcMUxDGDYP2iEg9/8Mhh5toIVZULFy8k2WZkRXNPjOWStYK
         7cPg2NDdMS6fNO5rvSwahIENQO9g0fCXcfCvxTh31kpt9xts4qlxXgrhO4n90yO8rXMD
         6GAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=PuJ6ae1PfjSdTsIRD02OPAtk9Uf/WGazrcd7M5Rziwg=;
        b=aMPs0behTuXl+yw4TSQX6ez/svQN/rn94HInuZDTbwvLq7zSpiYVDHrRLJWMI7ZfYw
         5TNqs3GV0MkOX0cUssv76yQ9fs/+5R3xfpREQM5ers1vaTMSV9hZBxj+vHlHUFolpSG3
         nPD4i4sjJcZwL+PVWkZZOAnK6sDHevFUj5Ts65cQ9no8kip3oe0T2bX/NOgdiJVlF3Qf
         rZ5LVk3hRBFmDEWGA8szHUNg5coROQZgm4tqE4m7HgxXGUnCgEa4IXdYIgR1kVrg6Na2
         Lmk47OjhVKGs3HZPhZZSkCHzjCKToNfUFX8SuPVxN5Qmd+9jGGZZBLzxKTUOe4tefmwn
         EzRQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ck7+UQcl;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y7-20020a05622a120700b003e4daeee942si441775qtx.187.2023.05.05.02.44.00
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 05 May 2023 02:44:00 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ck7+UQcl;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1puryN-0005u6-Fr; Fri, 05 May 2023 05:43:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1puryK-0005tV-5g
 for qemu-devel@nongnu.org; Fri, 05 May 2023 05:43:28 -0400
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1puryI-0005cM-Av
 for qemu-devel@nongnu.org; Fri, 05 May 2023 05:43:27 -0400
Received: by mail-ed1-x533.google.com with SMTP id
 4fb4d7f45d1cf-50bc0117683so2760588a12.1
 for <qemu-devel@nongnu.org>; Fri, 05 May 2023 02:43:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683279804; x=1685871804;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=PuJ6ae1PfjSdTsIRD02OPAtk9Uf/WGazrcd7M5Rziwg=;
 b=ck7+UQclXU9s4MoKUOzA8cbA6Mcczv0ywJjq3Ok9Fay8muZiO34ZtpFFlinzzoZCWt
 zgaR/YdPbJO8YlbV7egVpYCDR5BhZOK/84htj/PEcTzspXvaIb/geIvtZRS+uXYWzeoF
 evno5+4iFQBZhMkeQeSLJgxNMwLgs0/9VEAg2lvionLS7KPMwG5D6UVuaufgbfAy0ZEq
 OcX/E93jOub3ve+jnKDlmDDv4zqJP4tTqncGEfI/Lma+4NghTapH5+1mB2Ozu+ADihsq
 WAZV3NSVwSp1IpOsiGqTsOfVsIEUF4rIIER0hWQQHkA9wcmxOINeimQW5qBEvIcqxGTa
 q9Yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683279804; x=1685871804;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=PuJ6ae1PfjSdTsIRD02OPAtk9Uf/WGazrcd7M5Rziwg=;
 b=ftAQi0+XuT/s4JdvrZII9V+DSxEJf2Rg6skAhFBmMaOyu8tqz9yQMaFzjE5egDiVxI
 tiO1ps1hJwZizTbX3E8HxTxFCWPNMSKz0usLrOwxiabNy/0QIjpGX/ZjecF1gSMyq0Rz
 maDiUwUCPeaaqZChJf8feRkH5HDHtS9kKQB5z59T4vLFOv8q7VDafw8xTEJUWsENrfee
 gtyuAjIOQxKK8MZkWrnykbFvl1st/QdoBSZGAMZsgdQ/+jmSbdCOq093Wes+Rdksrabj
 7+l3qLzDzwGciMNio1lJkUS79PDgwyiQEnzKpVx7D9s8T6XypDJ72ysdShhkITcfHJr5
 DKOQ==
X-Gm-Message-State: AC+VfDw9KAgjcsN1GRjHVIeAX1ARbbF+eXSe5E9zTkkswGhT4YlEhbnA
 zv5GENo/KdMn3RGTOofD8+Fg/kPEkXaY3p0/0gT6ZA==
X-Received: by 2002:aa7:d355:0:b0:50b:d5d1:7409 with SMTP id
 m21-20020aa7d355000000b0050bd5d17409mr794305edr.23.1683279804312; Fri, 05 May
 2023 02:43:24 -0700 (PDT)
MIME-Version: 1.0
References: <20230503070656.1746170-1-richard.henderson@linaro.org>
 <20230503070656.1746170-11-richard.henderson@linaro.org>
In-Reply-To: <20230503070656.1746170-11-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 5 May 2023 10:43:13 +0100
Message-ID: <CAFEAcA976E5VFD53HE05v61QCKy3ZmiBNfP+PQYpZ8t+wZKvFA@mail.gmail.com>
Subject: Re: [PATCH v4 10/57] accel/tcg: Implement helper_{ld,
 st}*_mmu for user-only
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, git@xen0n.name, gaosong@loongson.cn, 
 philmd@linaro.org, qemu-arm@nongnu.org, qemu-riscv@nongnu.org, 
 qemu-s390x@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::533;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x533.google.com
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
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: ks320a1j/jos

On Wed, 3 May 2023 at 08:23, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> TCG backends may need to defer to a helper to implement
> the atomicity required by a given operation.  Mirror the
> interface used in system mode.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  include/tcg/tcg-ldst.h |   6 +-
>  accel/tcg/user-exec.c  | 393 ++++++++++++++++++++++++++++-------------
>  tcg/tcg.c              |   6 +-
>  3 files changed, 278 insertions(+), 127 deletions(-)
>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
