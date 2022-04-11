Received: by 2002:ac2:5ccb:0:0:0:0:0 with SMTP id f11csp1797189lfq;
        Mon, 11 Apr 2022 10:49:17 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwFGZnP8f6J4sW2wM/zwXVG5N5CIEQ5G3PBy8kYusaEMI5p5qraaMly2CSSS5aFBqyVJ28f
X-Received: by 2002:a25:1a89:0:b0:641:25b0:4257 with SMTP id a131-20020a251a89000000b0064125b04257mr7553165yba.553.1649699357285;
        Mon, 11 Apr 2022 10:49:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1649699357; cv=none;
        d=google.com; s=arc-20160816;
        b=z/rBffvo8AwN8aQRi1S8/G5eQmajVRmynoFFsrTw/LRwp2pMoQ/n9zYkJbOuRTP3x2
         MXFMVLEjV64SpGAr2aoas6Y0wb61w7YW741aQEWNKmC/wRpeO0AeUhk5At4/nRZ1m2gd
         W4WnfuSqqw/VVJ5NPUXbCx8nUJKHcWLtXenbvDf3U5EiTFstnpnc1u+tVphCjQgpd3Mi
         cszm5b7rYE2MTi3A0qSjT6jhcLsfuaQqN70wl8C895H+LzqOiszrOYfjUty07a9rLi0t
         7WGTkVhCicZhPgaaaFmbvzrVMwP8RGIm5SEgAuJB9U8jisepQGh82Tpb9VraIfJkxLzd
         CEpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=WmdfrTiE5HMntn41iTvPYVO4OrYKZDbyYz2XDT/n0yQ=;
        b=Snraur19hHlBjqt2RXprKzd2vsXp2FkyMdcqvt4bNYgJ2FnMlPeeeQTMm0mYFgjpDh
         hziILFZaR/bb6/yp75RFTp+ChkI+D86nAd0rFQcbt+kHIJxqh3VC9qNwMAsmuF2sApkw
         51EfmN1jPh4Sw7H7mNoo33G+YOmyisW+YK4M71d3tcqWKeNmmc3q87Qdee6Abm1XHvSG
         +txvZGCxSsH04PI9UTO9vWjJ4/x9J6zUrwAKQQDZbxZniEpev4S2qkDjNRiI3xLEZUHn
         CQpSMrnidpmSchI7KPBOCxEfKPPHPHA9pXMU16P5+sxLMk5f6WM9B12XJ/WRHgPyXcks
         Mnsw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="YR/LO8F9";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s128-20020a815e86000000b002ec45b1b230si1128207ywb.215.2022.04.11.10.49.17
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 11 Apr 2022 10:49:17 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="YR/LO8F9";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:35384 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ndyA8-0000qW-Nd
	for alex.bennee@linaro.org; Mon, 11 Apr 2022 13:49:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58220)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ndy9g-0000pO-WB
 for qemu-arm@nongnu.org; Mon, 11 Apr 2022 13:48:49 -0400
Received: from mail-yw1-x112c.google.com ([2607:f8b0:4864:20::112c]:42826)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ndy9f-0004i7-Id
 for qemu-arm@nongnu.org; Mon, 11 Apr 2022 13:48:48 -0400
Received: by mail-yw1-x112c.google.com with SMTP id
 00721157ae682-2ed65e63afcso15073917b3.9
 for <qemu-arm@nongnu.org>; Mon, 11 Apr 2022 10:48:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=WmdfrTiE5HMntn41iTvPYVO4OrYKZDbyYz2XDT/n0yQ=;
 b=YR/LO8F9sQ7ZEkdJbcoSP0WnnAk6hdQhAI+QmVL7tl884Cv+Y3Bc35AEbSQA3TIT0Z
 U4cF17EjqFVC9PTj3vbbaGI73rI0qxO6I34L4s1BQnSlETPagHk5uNtSF1QnHQG3+7Ff
 uME+dviQxNzLqtzZcQXa6q6IsYlihG/8O3u2miCQufKROR4ddnepwztH7xLk1ArOvAsj
 RWvjrS6Yo9EBg8LlwITPqu2nQQgwOG632CF2AtM2rJC1106TO0NE21zPZ2MxJZj+L2A8
 lp/Abj1iW5gBvs+GRwC1Dw+hUtQbVZWWZiS1FOVYLCEikT9eoijf1kO+0mcCnaOcealU
 xlmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=WmdfrTiE5HMntn41iTvPYVO4OrYKZDbyYz2XDT/n0yQ=;
 b=CSsW6d5dw3z3PyJZb/eOFROFeWlaQSWK1mehQYW3eHWHuUxk43xyL8BujAsiw/2pAp
 HWpOITRZMOLDx12FK3j5aRNYEGilAk09VjqT0ySZi9GpUEHugqSc2dm82V0raI/3ghlj
 kHiEnegzeNamFhqIqz2GpW/a43cFkNjvH7q3wIXH5JDxjZiXmtB2fwTn3B4waWhF32P7
 5w6AOcpzDGdWv0fZ9AV2O3HaWbUd0wUA9Mdk5Az8t/EuOKwq7w07IfTtcnARrnTUGjme
 TKNHO18zZWPDK5XZvTa73itjXwibieU2j7U/SrhMWgGALlfWnEgPe51dAH4EWFpZa82D
 a/Lg==
X-Gm-Message-State: AOAM53263ggeVeghH4Pw9tEHWiSjdInFx24eWXA0jaRLBJVqguSLgh61
 EOw16Y2jCIpVDI4RsID5Ct+YEKIb609EcoZRXkGe8w==
X-Received: by 2002:a81:6642:0:b0:2eb:c364:b8e1 with SMTP id
 a63-20020a816642000000b002ebc364b8e1mr17695396ywc.64.1649699326572; Mon, 11
 Apr 2022 10:48:46 -0700 (PDT)
MIME-Version: 1.0
References: <20220409000742.293691-1-richard.henderson@linaro.org>
 <20220409000742.293691-9-richard.henderson@linaro.org>
 <CAFEAcA-b5RHzJ0BxeyswL6C6Cr-6fzRF_a0SVkLdWQo4Xs6=dQ@mail.gmail.com>
In-Reply-To: <CAFEAcA-b5RHzJ0BxeyswL6C6Cr-6fzRF_a0SVkLdWQo4Xs6=dQ@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 11 Apr 2022 18:48:35 +0100
Message-ID: <CAFEAcA8w6VySz=LUk4bps+hqGAs_1QsjafO7OFgvnyRW9ybnmQ@mail.gmail.com>
Subject: Re: [PATCH 08/16] target/arm: Enable FEAT_Debugv8p2 for -cpu max
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::112c;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x112c.google.com
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
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: +pkMo1DuCty7

On Mon, 11 Apr 2022 at 14:09, Peter Maydell <peter.maydell@linaro.org> wrote:
>
> On Sat, 9 Apr 2022 at 01:18, Richard Henderson
> <richard.henderson@linaro.org> wrote:
> >
> > The only portion of FEAT_Debugv8p2 that is relevant to QEMU
> > is CONTEXTIDR_EL2, which is also conditionally implemented
> > with FEAT_VHE.  The rest of the debug extension concerns the
> > External debug interface, which is outside the scope of QEMU.
> >
> > Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> > ---
> >  target/arm/cpu.c     | 1 +
> >  target/arm/cpu64.c   | 1 +
> >  target/arm/cpu_tcg.c | 2 ++
> >  3 files changed, 4 insertions(+)
> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

...except that I've just remembered that this patch, and the
others in this and the other series that add support for new
FEAT_* need to update the list in docs/system/arm/emulation.rst
of all the features we implement.

thanks
-- PMM
