Received: by 2002:a17:907:1627:b0:8ed:b3f:fd98 with SMTP id hb39csp711230ejc;
        Thu, 9 Mar 2023 05:14:03 -0800 (PST)
X-Google-Smtp-Source: AK7set/ggfig2zD31SsnuUgDGRSFQrDs5rjVhIg1evOQZhWkIqkWoym33RgcIe3aCg/l0+eI5Yxf
X-Received: by 2002:a05:622a:104c:b0:3bf:d8e2:ab0e with SMTP id f12-20020a05622a104c00b003bfd8e2ab0emr3494929qte.23.1678367643752;
        Thu, 09 Mar 2023 05:14:03 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1678367643; cv=none;
        d=google.com; s=arc-20160816;
        b=JtpXzOI+xt+zwWcHMZmLplPhwKATN1OJ5BpobZu9bnjb5TjFIVwk0C6KW5xJbQT0qK
         SfAcE8DncuQT/iEl6RL4IzRzhYyo3IAy4B33QyqDWABzM+7ZVGOM+2bttTiCqrNuoWlf
         5oMbuWv1jGanfR5ACZFS6ujpAWUvG5vF+G3wdI/MlCiSHAOQPwV2q+n2zG3atzpacVek
         AyXBko5DnnSFe6IH+iTRwTaAkrIE94iYxBDzgInp8raZy9hXIsKZBlrY7jtFuGD3MDSY
         MhQHtxvcI/9D08gEkjkVg8Unsrbp/+/y34ANaoh0vNrwBQjMroTitBX0tcYoHaTKl3Wv
         Ot5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:cc:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=hPxDwA2qP+yUNTcYliT3FEziP29T0fTAryen8DS7d1A=;
        b=iJPzWF7Jo+MsoNluQ6h8oXw58vwtEpJQpwL5syw7ux6tbq4lx2USWOed45VZBMfUB0
         7iVPZcW+K6KZMnWA3k91YknhjjfQc5KG0DlvpVoYKnx1TnRGi2EbZuK49FZUOLE2sXni
         dMxV41/YmK4ThbAuo1nCJj8IfbyMuF07hf6KaeuvhCN3Pa81fYfAx3Seb81zbp1aYp0I
         NJVjhduChV7ScNsW6nr4Fx8QJa6lIhAlskNy4mFqTE+XZdO5zAIWLO7l4L1iMvccMUKM
         t4lg7P89gdXI1oFATh2JT2d/yvFijLe/IDWWgJpxhebsMiu1YaSMZTOZleuMStdSWXff
         K88A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Fd23fv1m;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w19-20020a05622a135300b003b6953fbb9asi15002940qtk.348.2023.03.09.05.14.03
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 09 Mar 2023 05:14:03 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Fd23fv1m;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1paG5I-0008OL-9i; Thu, 09 Mar 2023 08:13:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1paG5G-0008Ns-TW
 for qemu-arm@nongnu.org; Thu, 09 Mar 2023 08:13:26 -0500
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1paG5E-0000AP-9H
 for qemu-arm@nongnu.org; Thu, 09 Mar 2023 08:13:26 -0500
Received: by mail-pj1-x102d.google.com with SMTP id nn12so2070445pjb.5
 for <qemu-arm@nongnu.org>; Thu, 09 Mar 2023 05:13:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678367603;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=hPxDwA2qP+yUNTcYliT3FEziP29T0fTAryen8DS7d1A=;
 b=Fd23fv1mR5IvA0kVHDDH/JFxyZQ0A5VO8sy0pYMfk/hXcMI0h8vlgFBr7PVHBfOfCu
 qkIIafO3oTxft82W7WgHCVeoHTSLmWXJBYLWiRnd8kgBKPNBDSafjurWcBElqgraGC2g
 iA1XVRoSRnuW35rKmGYZCgVvmc+UE93EsGvLExzO645vQaIDJee0Jd2awBOx8P7T+1ve
 W0vZdsf3V8NuGYvmycxWfG/vwRjezoQA1UE7wH7+dFt0uuJbyg1A0xKT5Nc18E2x4BqD
 9K4ZeSQUFPk1Eb2WLFlwQvbz7Xy7RBsMFNoTVolRXp7kWiN4BL/f1zOuxLPqV931fTVo
 O7XA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678367603;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=hPxDwA2qP+yUNTcYliT3FEziP29T0fTAryen8DS7d1A=;
 b=UO4NbmuYyJtiaOv6Izpz0RYnFS5h6F+SUGxd4+EbDENkmZ5s7ghPLbWtQNQAYkxr/K
 ljMGnXL+g6w5OZev0sZS0WNyME+n8ZXh7ZSErryYE/Lk3LXp28Mih5uzZfUx4yr9ngHq
 ByhjkUP46UoymyjFJ12b1LHlgD+hWlfXt3ARFaPSB8iffbIMzk/IhlQFEXNc8BxQlev+
 PwBstlFVD3jm6vi4E9zdEcP0Vm9dXV/TtCCtRuDEHv1nh2P6WY2zE3hMZGZd61Itod/N
 dAgxK1bqhkMb/Mq+bfZ6vTxqrSDxjhEUN7ub34sUN/hcrq8ydIKmQanAUF2Zttfp5wBd
 oClA==
X-Gm-Message-State: AO0yUKWpizh3CfEPc5ORpmgWkdu06IDhSTutHTBlSgj/yunOTxctuVF8
 2IoEFhvN7NaW2DXV5DvTNI55mrphBK6eN0Jltrzp5w==
X-Received: by 2002:a17:902:7e09:b0:199:6fd:ecf6 with SMTP id
 b9-20020a1709027e0900b0019906fdecf6mr8173178plm.9.1678367601712; Thu, 09 Mar
 2023 05:13:21 -0800 (PST)
MIME-Version: 1.0
References: <20230307155528.3655534-1-clg@kaod.org>
In-Reply-To: <20230307155528.3655534-1-clg@kaod.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 9 Mar 2023 13:13:10 +0000
Message-ID: <CAFEAcA_f3LP_nVrN2oi6xwxY6JpuWruZSdFG7pf1ttfY7d5ZTQ@mail.gmail.com>
Subject: Re: [PULL 0/5] aspeed queue
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::102d;
 envelope-from=peter.maydell@linaro.org; helo=mail-pj1-x102d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: J+ytn8HSQc/r

On Tue, 7 Mar 2023 at 15:55, C=C3=A9dric Le Goater <clg@kaod.org> wrote:
>
> The following changes since commit 817fd33836e73812df2f1907612b57750fcb94=
91:
>
>   Merge tag 'audio-pull-request' of https://gitlab.com/marcandre.lureau/q=
emu into staging (2023-03-06 14:06:06 +0000)
>
> are available in the Git repository at:
>
>   https://github.com/legoater/qemu/ tags/pull-aspeed-20230307
>
> for you to fetch changes up to 7840ba985a7c0fcf90a7318ff1f827f89571cb3c:
>
>   hw/arm/aspeed: Modified BMC FRU byte data in yosemitev2 (2023-03-07 16:=
53:18 +0100)
>
> ----------------------------------------------------------------
> aspeed queue:
>
> * Small adjustments for the newest Meta machines
> * blk_pread_nonzeroes() fix required for pflash and m25p80 devices
> * Improve error reporting on file size for m25p80 devices
>


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/8.0
for any user-visible changes.

-- PMM
