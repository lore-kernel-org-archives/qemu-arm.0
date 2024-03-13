Received: by 2002:a17:907:991a:b0:a45:b507:d90a with SMTP id ka26csp2604417ejc;
        Wed, 13 Mar 2024 10:16:49 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXW9a6TaaMvrCGY0xlSsi2wdQhYEsPNIMpcSobBI+c5uVwsqZtfzOfA++8nCh5KRKaviPWUi0b+3ATQ3Po+lCWNi+RnnBJq
X-Google-Smtp-Source: AGHT+IFLyDFjdWg5Qg78rLyiZdQNnrdUJ/04lc+KkKULxHlCW5nBIZEawpFJ301zT5yfVtGKIKWv
X-Received: by 2002:ad4:58f1:0:b0:691:2393:2a04 with SMTP id di17-20020ad458f1000000b0069123932a04mr521674qvb.32.1710350209558;
        Wed, 13 Mar 2024 10:16:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1710350209; cv=none;
        d=google.com; s=arc-20160816;
        b=AOLF+fAd+5EADnY2UY7lr/wY81lDiWTmVlCuDQIjX31URMzHe/+neEytceHFrNQd8E
         AYEQsVin8jQ32ryeRnmB9jk3ACYwTY4aHWRM3G9zet+74FyMS0VLQdLhmYHiw1krZFeP
         Zm3n+HxXaKHEVHJps62136gHwsRLPlVq7//S5aZXt5J6smP4nt85WERPGk5zEn+bpmbQ
         BG7TUvrggs5b4NjzHyPpPJIkBsCyc8VV+B6dCEtUeWUJG9bLjwYlG0qndLWPqj1O2sCZ
         f5fi0V6NTXFH17M/SnyhtLCMnQVSOP9KkQrmUqvvpkyD/u5/xRa1ISTwM94RSNFbZaWh
         I1cg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=UJWMtCfVTsmWBPRveH0G4AEo2GwXdUG/wQ/ozwSb608=;
        fh=SMeGIPMWi0JoAB5Abyk93fJsyzjYg7EVU0EmTBL1F4E=;
        b=T5P/useoKxNp3FvvrAxWZQ17v9afXsQ0us7JbvEh0jC+kyoSOfYSWVFkdjERVNQ8Nw
         /1zCDB3kMOK1+CNZXtKzsRQbfdI0godWZpsSbJ0nG+7Ty2Kr7ZDfKNuddD9tWcIYFPbO
         ftPFtntf3Ih7IrYfNsYf1So512mAiNKJUV9YXfYpTA70e3GPEUDgIfKIUsShinCkNV7C
         wuUgFE9h0KT7azGXq6izl0sDu7sZRtOnP1bmGH2DruhIaM5grSRa2aq/SpW+K7hd4/y/
         JaFJT3q0FHoeLsgcI9wu2UMUWvbo//Sfz806xaBev/5TTMJGMySJDAks+YI06oj1xL8P
         NUNA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ghCMsm2G;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id gs9-20020a056214226900b0068fb8db15fdsi10107138qvb.54.2024.03.13.10.16.49
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 13 Mar 2024 10:16:49 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ghCMsm2G;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rkSDX-0001eP-9m; Wed, 13 Mar 2024 13:16:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rkSDS-0001Y7-Lz
 for qemu-arm@nongnu.org; Wed, 13 Mar 2024 13:16:38 -0400
Received: from mail-lj1-x235.google.com ([2a00:1450:4864:20::235])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rkSDD-0003uT-0W
 for qemu-arm@nongnu.org; Wed, 13 Mar 2024 13:16:32 -0400
Received: by mail-lj1-x235.google.com with SMTP id
 38308e7fff4ca-2d09cf00214so610241fa.0
 for <qemu-arm@nongnu.org>; Wed, 13 Mar 2024 10:16:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1710350177; x=1710954977; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=UJWMtCfVTsmWBPRveH0G4AEo2GwXdUG/wQ/ozwSb608=;
 b=ghCMsm2GZd0R1yrutzKUQiotZxlR1Y+qYh1GH6otljQYjspriciyxolmyeY9S8D2e4
 V/V9k0dWOwZBLOsMYEET/Kklb+3PN9XmB1f5RIlaGsB6uCwQ0OMxexByehPL1AdChyHD
 AN7VZG3fk0bXUiLGWoaRD2Fls0hv0i8Up033bHQZy03Kx9rf4JMxNomHmhfTd/AZ3M3K
 lq51/f4HysC7QNqVf/lDg+d9wBbDckZInxWYGTSbRz/lhKq2EMbQgLAQS9lZlBV0htVf
 UIMxLeqDBo3zENA+GTFib91T3RBfmesBDNnbK3p6/R2q1xGt3jZr0ApG9ok/RsGOkf67
 9HPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1710350177; x=1710954977;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=UJWMtCfVTsmWBPRveH0G4AEo2GwXdUG/wQ/ozwSb608=;
 b=i/R+A8+m+8fp8pv8rADCQlUAWTY4cbFkQ69MIeJQ3Yho/ruj+loYg5ilvjQ1oHeq0U
 PtdleQx5xsaWP/dM/kClu1WZk79wKtv8AScu5ACvUGmfKG85yCO5slT4MpyyQaNf5fRT
 BYKJnKzh07F+0SvoCYlmGGzoGgD/Qx6oCngzLZhy+8kQKE1n+GWuMBbHOnpyTaCZzhAk
 GcgYwCrLkvnjB4u8vFa45tdeuJMlUmqjD+bgfR2yJjxfwrGjsbqllRN3xRHw5a+HtyHD
 /4GrBHN/buoILO63hzYtOPMd5Zy6zURpTZ6B8rgbERIpVi3mYOIhrHJltMK0jMUHFi+O
 WAZQ==
X-Gm-Message-State: AOJu0YyvQHRy71Y9H4IZ71OO5leLV1ZMZiXCDSTYBnR29XyBXYwe3nvd
 7kjiUVny5BvlUb3KuDWVtESlB1FPEJBH5LNT/9cts4367yTHoRzHeM80k0SJMLS1FsCLjGk4bcn
 AG3FrZuCZDR5cuTO+hqXEBSEE/qXFnnBm2Vy/rw==
X-Received: by 2002:a2e:8297:0:b0:2d4:2958:6daf with SMTP id
 y23-20020a2e8297000000b002d429586dafmr2913501ljg.20.1710350176949; Wed, 13
 Mar 2024 10:16:16 -0700 (PDT)
MIME-Version: 1.0
References: <4f10e5bd.71e7.18e3837dca6.Coremail.zhouxia_icsr@zju.edu.cn>
In-Reply-To: <4f10e5bd.71e7.18e3837dca6.Coremail.zhouxia_icsr@zju.edu.cn>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 13 Mar 2024 17:16:06 +0000
Message-ID: <CAFEAcA_b_VNjR8Z=RzMLW1vuzH6F+XhvhpiEpbE-sW_hpdyXkA@mail.gmail.com>
Subject: Re: Will QEMU Support ARMv8.9-A Permission Indirection & Overlay
 Extensions?
To: Xia Zhou <zhouxia_icsr@zju.edu.cn>
Cc: qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::235;
 envelope-from=peter.maydell@linaro.org; helo=mail-lj1-x235.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: jMELfZInGfLg

On Wed, 13 Mar 2024 at 15:46, Xia Zhou <zhouxia_icsr@zju.edu.cn> wrote:
> Does QEMU-ARM have any plan to support the new permission indirection & overlay extensions of ARMv8.9-A [1]? These features involve FEAT_S1PIE, FEAT_S1POE, FEAT_S2PIE, and FEAT_S2POE. ARM64 Linux has patches for these features [2] [3].

It's likely that we'll support them eventually, but we
usually lag behind the bleeding edge of the architecture
somewhat. I don't know if anybody has any concrete plan to
work on this specific feature.

(This feature is a bit awkward for QEMU because the indirection
isn't permitted to be cached in a TLB, and QEMU's core TCG design
is pretty heavily designed around permissions always being in the
TLB. I don't know if there's a nice way for us to implement it or
if we'd have to flush the TLB every time the guest changed the
overlay permissions...)

-- PMM
