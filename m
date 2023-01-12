Received: by 2002:a17:907:c68a:b0:84d:2074:29bb with SMTP id ue10csp4944767ejc;
        Thu, 12 Jan 2023 09:16:49 -0800 (PST)
X-Google-Smtp-Source: AMrXdXvvj/hFMaV3dwAZ8fgHfZBD/6DxFsNgKcUmzktn++8S/sEuxIraGF0kLMdRs65Mz6+Ree4X
X-Received: by 2002:a81:114f:0:b0:481:cce6:3d11 with SMTP id 76-20020a81114f000000b00481cce63d11mr6751303ywr.34.1673543809157;
        Thu, 12 Jan 2023 09:16:49 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1673543809; cv=none;
        d=google.com; s=arc-20160816;
        b=sUbE9HF+1F/Pv6XfEzeJWQ7Dwdw3ItjVoBsCdJTXYuzVg+udqgxMy5eRHPCeztEDBD
         YLi2aSksWdCkMKRDYfZRMKyPb1E/UBxgoLRmdvaihWDN7I9MXMSa32QPkfMYMeXRuvBm
         CHQ8/sXHb7iWwiMZorrWWATMgZxgmx+L2Jm4GDxNmuT8ZeynwJrH653HjyoOyOZDlfem
         KitA9/ZcE9B/RneeYIGehfEndZVH7eM17Hh+9aGptwyFaYLy8LTY//sGNAal0QwKWdNt
         QM3d7uVNDzDphujA4vrEULnl08XHX4tTpFjpna1NmSStpG5bcAISali815wdCdKC+EM2
         L/Iw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:cc:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=AQyVx0IdRWpHLbGelfrUjYulJdp6Ei5FE5FnSXaI8gk=;
        b=Qj91aqyOB5HxakkBlAatGJpGF/73bFhcLag8ASqJM62YNlFFpdwpCob2517D+tLqNU
         4ubUeVC0XrW9g79R5qadtGRPU/8U4VNtGWF6pF5c2rkb2V8iZqrUtGfTH6zUM7IGpbCT
         uQaHzwZDadW4LEax677SGMH7kkYDgeVfUP7aQLN0gPLak6YwlIbXr+BNsxk8hzktnpcK
         TBrK7bdN1F+7/MS7iE0x95EfWINNHgodCY3ARAUA2BSA+ahS3+gxwCgjEm10vIcQVEEr
         V2k9j/8wDjX2+PBzcRSEKGVC06xdbz+mVoDUWs6G7Z8i3yP5jM5bwSnvpEc0tVzn4TS6
         iACw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=gIpNYedi;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c5-20020a05620a268500b006fa0c9602adsi10452627qkp.86.2023.01.12.09.16.49
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 12 Jan 2023 09:16:49 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=gIpNYedi;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pG1Bo-0003IV-9A; Thu, 12 Jan 2023 12:16:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pG1Bn-0003IN-5A
 for qemu-arm@nongnu.org; Thu, 12 Jan 2023 12:16:31 -0500
Received: from mail-pg1-x52e.google.com ([2607:f8b0:4864:20::52e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pG1Bl-00072P-Hc
 for qemu-arm@nongnu.org; Thu, 12 Jan 2023 12:16:30 -0500
Received: by mail-pg1-x52e.google.com with SMTP id f3so13231685pgc.2
 for <qemu-arm@nongnu.org>; Thu, 12 Jan 2023 09:16:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=AQyVx0IdRWpHLbGelfrUjYulJdp6Ei5FE5FnSXaI8gk=;
 b=gIpNYediTeq7GhERuTD1gvFh6pzqleYpNfGaQz9vrxFdwajW4u2sCHewBEESdu01kT
 H2cFbMoBVDRYFNoSAXB7MtHSxYr4169ocxIx3Nu4CY2yCWSualx03LOst/Re94QJwwgA
 /OX/N3leeGq43rd7iZSAka+q1+hYcoMkRwB59YfvlJzSGuWdJMz4hIqJakA7+5wrmlH9
 kSEf0ImxEorO1AUdnoprdN5/kmKvUjBYZ/AvhtSrFe7yH0fIcVf88yFvNoCUTnWPwhtN
 CHSFrJse4U3Tgqh4DtEzb+paFkVHTFfHN8h4HSd8jm1h9At85IsrTyUVZMJDlvpOv07m
 1Dwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=AQyVx0IdRWpHLbGelfrUjYulJdp6Ei5FE5FnSXaI8gk=;
 b=c1yvPS616BMDkzsIrlyFouw+RdVy0gWtdmxuqtj6Op+Pkpzp4ltiZZUy+dkDoHh4bS
 Ke7neQCveLSusuzpMxncZMONyAnYGLKNRhjXam8MdBAycsBuMM0vI3bEOGQ8hBHSpvb0
 RqCI99Gh0rpg8I1UxbENauN45PW0FrPxaLFiAnfHxpsQWPPcEEKG1pkBeSvIZ/rmwDpr
 Y7mAIptu8SJaV0vRCEuLWE5E4kN3QaG+rXrv7hlKs5o409e9i+w4Lm7dumhpCoaDGinx
 pySULQmqY6+as4gvZJxz1DxYSQa5zdamMzUimvFhD0x5oYxSS97oLFMTu4Kddfp8g3qd
 me9g==
X-Gm-Message-State: AFqh2kqYE7XeuZgM5qaE8WzidsNSaXTvrXCVx3o60Dx/HYC9azbxNJbb
 20wd1r0jp1AiEelQ+F0dJ0Owsez1ysWp8Nz1nWz0QA==
X-Received: by 2002:a63:9d47:0:b0:4af:9f91:54d1 with SMTP id
 i68-20020a639d47000000b004af9f9154d1mr1217956pgd.192.1673543787989; Thu, 12
 Jan 2023 09:16:27 -0800 (PST)
MIME-Version: 1.0
References: <20230109140306.23161-1-philmd@linaro.org>
In-Reply-To: <20230109140306.23161-1-philmd@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 12 Jan 2023 17:16:16 +0000
Message-ID: <CAFEAcA_wwb4fG88w6z1MwJ=K-eaH=_furD+abqMsDiVNmUHzLw@mail.gmail.com>
Subject: Re: [PATCH 00/14] hw/arm: QOM OBJECT_DECLARE_SIMPLE_TYPE cleanups
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, 
 Havard Skinnemoen <hskinnemoen@google.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, 
 Alistair Francis <alistair@alistair23.me>,
 Eduardo Habkost <eduardo@habkost.net>, Tyrone Ting <kfting@nuvoton.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::52e;
 envelope-from=peter.maydell@linaro.org; helo=mail-pg1-x52e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: UMbfVkoA16GQ

On Mon, 9 Jan 2023 at 14:03, Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org=
> wrote:
>
> These patches certainly look as churn, but they are required to
> be able to update the OBJECT_DECLARE_SIMPLE_TYPE() macro...
>
> Except the OMAP related files, the rest seems to have been
> merged shortly after automatic script conversion from commit
> 8063396bf3 ("Use OBJECT_DECLARE_SIMPLE_TYPE when possible")
> was run, so missed the QOM cleanup.
>
> So here we go with yet another boring cleanup series.
>



Applied to target-arm.next, thanks.

-- PMM
