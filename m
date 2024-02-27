Received: by 2002:a17:906:e92:b0:a3e:79c1:d636 with SMTP id p18csp2814278ejf;
        Tue, 27 Feb 2024 09:22:03 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCVt6YyhEKSo9ao1c0932ojd+EU4v4mLtiVNXKz57OsqGsLg0ViD5iki0fhuypwkCSXSCB7zyA9jaIbM1flsRxfiz4yZqTEj
X-Google-Smtp-Source: AGHT+IHjfGkRaW9x+lUxsiuy+qJTBRQi/QX733kqdvKrvSHmjPsD3kKwCAC6M2LUB/Pc+gx8Z2v3
X-Received: by 2002:a05:6808:a02:b0:3c1:9c6b:c50b with SMTP id n2-20020a0568080a0200b003c19c6bc50bmr2630908oij.23.1709054522821;
        Tue, 27 Feb 2024 09:22:02 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1709054522; cv=none;
        d=google.com; s=arc-20160816;
        b=vKVnzrAOwiPAnfUyS3ZsvLlJyJjMZCKohWrdqJU0FvxYOPD2pBt2YzorcSQx36QZoF
         eSLlW/4LyYOeMy6VUuD645VLjMgfpanX6yRAvsrXGY+/Mus6uRbEyCY3hwcOTwf8VTyp
         Y2feS2t7Kh3XBm8n4gv2RCmcgwXOyTI/ZG+vwZkpW0hsNnLCmC1fl5GAdiIvjVnwMF2F
         hfhJZtaDf613kKFaly2Hm+LILrV67v3/v6ictBqxwEZgf89sP3MNHzpJ0eHaSTgTGZaz
         BTj+UnKvn8rTB5k+IlJdlYnKxSAWcbRHxk1VlgljWZ591OfeiDn6bZtl23mlHBCifkGU
         s/5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:cc:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=2KfBsfSw3AQk6ca8hw7vMplw/8fGwK8SO5GqjuWlrKU=;
        fh=iZ15d4C/vwim2WU33Uos72qXBpwDMVx/Ii2xYmy36R8=;
        b=n6r54rVWcPq7MXmtM7b1/wQ2tMrKANkftApWDXonwWQ5SgGAUdz2NNuVqMDpsApmmT
         RediJu13LCvL4skPrXlNVjfKx/M67oCSkBS7Awx3e/WBwpo3qo6dMm4U0AvnsO4Uo1Us
         Zi23SiHcq8GcrVsPA9gqHYeEgro76JeCk/tufaXkH3krilRAz4xZ+VbWBxxtiD4E90dW
         md58+lRWhTOMi+pX24eDsDxL6yAcooaC/A/yeUtP8/ZJeY2z2w5H65vHekH39fUkppB6
         iRLcpjOGd6aqI4zgOsVtPIJO/17PxYUb1MXMd94I1RA/eH3a/NgiZtYvPj5e/f1nDyDk
         Lepw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=eAIRNCxV;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h22-20020a05622a171600b0042df53e3aefsi8138333qtk.794.2024.02.27.09.22.02
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 27 Feb 2024 09:22:02 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=eAIRNCxV;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1rf19D-0006HV-VD; Tue, 27 Feb 2024 12:21:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rf18u-0006EA-Mq
 for qemu-devel@nongnu.org; Tue, 27 Feb 2024 12:21:25 -0500
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rf18s-0000x4-CG
 for qemu-devel@nongnu.org; Tue, 27 Feb 2024 12:21:23 -0500
Received: by mail-ed1-x535.google.com with SMTP id
 4fb4d7f45d1cf-563cb3ba9daso4895570a12.3
 for <qemu-devel@nongnu.org>; Tue, 27 Feb 2024 09:21:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1709054480; x=1709659280; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=2KfBsfSw3AQk6ca8hw7vMplw/8fGwK8SO5GqjuWlrKU=;
 b=eAIRNCxVJx9I5zYW5ap3lf6Jli8LWB/kU10xdMGH0E0xbIfxPDuq/1n5dCi0J4IDWF
 DeHQijDw6sXfzSS7EiG6dr3tgi1k2sRaRCp3pjJJs4v45iAQr54Cz7igPFxdAsyhIyjI
 n30G7ZejGBhbvJl9gMKdlF7wVSMdWjGZhyUrUfxgw0YT3MvVe/m/ZUJ/jGCBjbAowrRS
 S21El5aL6EvHMufacaqecD3JyglrjdTMEx4r20cNDWJV1AW/PiNeNFzvt1vvCS2PNP08
 l+39jBLOKSs904xWe5dm4ojYATBGw4anFe1dV5peFnvM2ks5MT45cdtY16qbKZzY9l7u
 7KUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709054480; x=1709659280;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=2KfBsfSw3AQk6ca8hw7vMplw/8fGwK8SO5GqjuWlrKU=;
 b=HCZGSQdiz9OU5ZyE3npcP7Vk5QB4sp0LY7j4jr5X4Q/I+oURjfy2hGcpsSPE70GPA6
 s0BTyeNrxUfp256f/RgFdAAq0jowArpoGrAqInau/hWb932qKU3Uo12lhOJRl/TGevCL
 L3g/gEyX2HQ6Y6bf8Muw3JA1KlWVkgDal7l1XMqkoVYGAV16W7iFQtZM3Iush9VONNNA
 vOr9Hmm7TIS10xKbvlcP8UslixPwx+FrGrSKeKunZ023oq70DCmspuqKR6llBDzbB9kJ
 zoefAF/XjjWMU/8/g+GM4uSZBVzpt5qAAOPBlno2KOPX3YrhzwZg023chS6M2mLr7u2T
 v6GQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVxnF+jPCgcVIKvzZpO8PabR4H4XBr107VMcPX1ha/iMUsSC/kvElqWZ9azgOzFWrLtS6UeXZK/tkd9H5HRnY5wvtP9/+8=
X-Gm-Message-State: AOJu0YxkHyZ6fNUY7DfJgvquoB/nkf2Y2AV1ImWGnc450v0+KuEGyp5m
 LhhEWgCoNBe83154y7J9mSXOK1pS9M4KPcAv0mJpPyfSH97Xi/Zyw5ekSG+OqsTRBdcOjpLEt9y
 SWBxjnwvLrvIXAtAPwNhkLOLzypZL1IfNBN/K/A==
X-Received: by 2002:aa7:dd12:0:b0:565:7c9e:97e6 with SMTP id
 i18-20020aa7dd12000000b005657c9e97e6mr6398741edv.11.1709054479974; Tue, 27
 Feb 2024 09:21:19 -0800 (PST)
MIME-Version: 1.0
References: <20240227125201.414060-1-clg@kaod.org>
In-Reply-To: <20240227125201.414060-1-clg@kaod.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 27 Feb 2024 17:21:09 +0000
Message-ID: <CAFEAcA9SabyrJ=ydVmvAuAj+dqk5mPOaTLBdNjAE=pd9vzz_zA@mail.gmail.com>
Subject: Re: [PULL 0/2] aspeed queue
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::535;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x535.google.com
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
X-TUID: tQkUwPkLSRrf

On Tue, 27 Feb 2024 at 12:53, C=C3=A9dric Le Goater <clg@kaod.org> wrote:
>
> The following changes since commit 1b330dafcdc34315f6837ff3af34dbb4b31063=
73:
>
>   Merge tag 'edk2-stable202402-20240226-pull-request' of https://gitlab.c=
om/kraxel/qemu into staging (2024-02-26 21:28:11 +0000)
>
> are available in the Git repository at:
>
>   https://github.com/legoater/qemu/ tags/pull-aspeed-20240227
>
> for you to fetch changes up to db052d0eafe86c336d512dba99a1ec7c5c553f63:
>
>   aspeed: fix hardcode boot address 0 (2024-02-27 13:47:05 +0100)
>
> ----------------------------------------------------------------
> aspeed queue:
>
> * Add support for UART0, in preparation of AST2700 models


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/9.0
for any user-visible changes.

-- PMM
