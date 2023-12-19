Received: by 2002:a17:906:d96:b0:a23:4dac:818 with SMTP id m22csp1590813eji;
        Tue, 19 Dec 2023 08:06:20 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHiCqUE4rPGguROGIFp65Dc6oFVKiQI/VmAKXIoItN1Lc+ffX65UGz/bh6Go+0xhEJJ6RQ6
X-Received: by 2002:a05:6214:2468:b0:67f:62c6:dc61 with SMTP id im8-20020a056214246800b0067f62c6dc61mr1051016qvb.69.1703001980595;
        Tue, 19 Dec 2023 08:06:20 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1703001980; cv=none;
        d=google.com; s=arc-20160816;
        b=e2ohwikTLI1myYR8ag3a0IuSjYDMJUvFCFyVOkqARJy9guCSTk6hT28IQbGd6VISHf
         yGZCXWbCNDWDkzM46T0ZJxVQMSe0BPh3IaZe0TzDDbu6z7+8ts9lFOkVRWWA2Cy0xnIs
         jIsamWFHxcVdkeq0so2QRJzoNqtiTqNFyiQCr2fIDSdjoJidTll9z71DazAgs6Wxrztf
         W5A7nk2lmjf+9hylvAk+V1DOYOLrFR0uGt1ujsbQNE/pUncaH8cw+snVySUdJ/gQx9di
         yjdvfmBlthzStO5H1T1Cb1sNaQ9cNE3sUJlEteUaZk5SWG5w6xLR77XzNV8+dn7abHJT
         OnNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=fOKdS/r03mPWw+5f0KyqZFD6OmzNmBSvAaVBFMMXsTA=;
        fh=2WHa1aBydZHOwlLWGyq1MgG017vpq3PjtKc+e48RhbQ=;
        b=tk/IxmVwYZAHEbMJqJIM99qCNOV+2RY7jX2WZSfKXPZj7fZIgVBWlurWiAk8eFKLzG
         MFX4ooAoijPAqrcPfuh+3vdge/9Mpv5ak1vjAEJGjRAUlqRjHSaVj2qT8k+BZpQkm+ak
         kY4rZVHrKgIQxfqTP0ra54f3qY7uIWb0SXssUo5EM6XBKyXaB/e0Rhlccu/favUt6IB0
         LfLLJf/e8xLNbvH+q9aZa/ipKpKfYr4wbDYfEvpSt4wnLWBgiRICgazhpB2fVQyXuqP8
         eV5LyN17gHonCuqtQ7a0aopXW7Jsb5zTmv9IQcCcBq4Yfj7MsVqC+BtIC6ShTXCxTy46
         9+gQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=vHDjRkD9;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w6-20020a0ce106000000b0067f2fc7fb70si7066811qvk.249.2023.12.19.08.06.20
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 19 Dec 2023 08:06:20 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=vHDjRkD9;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rFcbI-0002Rk-1f; Tue, 19 Dec 2023 11:05:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rFcbC-0002O2-78
 for qemu-arm@nongnu.org; Tue, 19 Dec 2023 11:05:39 -0500
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rFcb4-0002S5-Jk
 for qemu-arm@nongnu.org; Tue, 19 Dec 2023 11:05:32 -0500
Received: by mail-ed1-x52b.google.com with SMTP id
 4fb4d7f45d1cf-553b3ee88c0so246075a12.0
 for <qemu-arm@nongnu.org>; Tue, 19 Dec 2023 08:05:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1703001924; x=1703606724; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=fOKdS/r03mPWw+5f0KyqZFD6OmzNmBSvAaVBFMMXsTA=;
 b=vHDjRkD98UAgdCEfCcnFLk1CHlna6dgqejKgc80mk7oWNXzQpiexDyqwjPh+pyrM5K
 2ZztMSEHOCKLdCCpayW4vMIbyByhynZRhaxhQzB8MZivG5d1w/RC05pl/tS0Xei/tz9J
 a4EA3IGS3u7yKQRcew7ditZ8ysu7O138J7yBD6gXR76x5lj8wpytzHpWoXyzLicgDx5g
 bafyzjH8tRpRUTgPVdSEGDJtVPBrWeynn4oZLexbA6PS/f7DwMAdTdhnLOCTq3DSachC
 kw3JO2mFak9Z4f68LioY4qxsIZdOJ4qBt0Y5APEqiKZhicYNAGq0ZwE8WjIP+nada5z1
 Kchg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1703001924; x=1703606724;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=fOKdS/r03mPWw+5f0KyqZFD6OmzNmBSvAaVBFMMXsTA=;
 b=nohmtv4rHubwYEf4Uc1rL7nyVuoh0kAGC1xx1WPb37Hnwprt0kDwck4fPsMTFxnh/3
 4uw0hyy3qmULByUeOhycY4W26VLyFzhSaAzXlqTcg3WJFLT3qlKhvEarGMgDq0bJIy4p
 KXyJlLHOuU3aqpUFP9VhQK9yZbjLrQd6e1+b251/KP2v6RtS3zZ7m2tivc5OhpCHmQvQ
 xjYMdx0IhlwpfiMj5aqIkeZZpR2A3TfURw6oXywb9g5bx1dNThqjIBC5iBr3Qt3X3yv2
 byZZ5EW6TkodItgl/NQ+FLaPpNIhIX1JBeqtwM+egmtHPdY+V6QIodAD2q4LPzqyE4Ry
 oQAQ==
X-Gm-Message-State: AOJu0Yzq/5kTsEsDag8BjLHtrYxO8OVL/nJV2CoMBgaWM8RXd6T5R5/m
 A8feMq9mE+LQduXtpeoe5y9lBzQrvyyJF/deDrz+Rg==
X-Received: by 2002:a05:6402:604:b0:553:b3ee:5840 with SMTP id
 n4-20020a056402060400b00553b3ee5840mr159074edv.79.1703001924393; Tue, 19 Dec
 2023 08:05:24 -0800 (PST)
MIME-Version: 1.0
References: <20231216182740.3305724-1-sam@rfc1149.net>
 <878r5tqnyu.fsf@rfc1149.net>
In-Reply-To: <878r5tqnyu.fsf@rfc1149.net>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 19 Dec 2023 16:05:12 +0000
Message-ID: <CAFEAcA8sTLZSQdqZmNGSv4yp3TZvq86kwbhU8gFmK2=j8vVZhQ@mail.gmail.com>
Subject: Re: [PATCH 0/3] Add "num-prio-bits" property for Cortex-M devices
To: Samuel Tardieu <sam@rfc1149.net>
Cc: qemu-devel@nongnu.org, Anton Kochkov <anton.kochkov@proton.me>,
 qemu-arm@nongnu.org, 
 Alexandre Iooss <erdnaxe@crans.org>, Alistair Francis <alistair@alistair23.me>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52b;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52b.google.com
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
X-TUID: i31lXLFjT3qC

On Sun, 17 Dec 2023 at 07:37, Samuel Tardieu <sam@rfc1149.net> wrote:
>
>
> > Samuel Tardieu (3):
> >   hw/intc/armv7m_nvic: add "num-prio-bits" property
> >   hw/arm/armv7m: alias the NVIC "num-prio-bits" property
> >   hw/arm/socs: configure priority bits for existing SOCs
>
> Any idea to why patchew fails to apply thoses patches? The mbox at
> <https://patchew.org/QEMU/20231216182740.3305724-1-sam@rfc1149.net/>
> applies cleanly on master AFAICS.

This is because you put a Based-on: tag in the cover letter.
Based-on: means "please apply this other patch first before this
series, because there is a dependency" (we use it for things
like "this patchset has to sit on top of some other cleanup
patchset I sent last week and which hasn't got into git yet").
So patchew applied Anton's original patch from 2022, and then tried
to apply your three patches on top of that, which caused a conflict.

Anyway, I just wanted to say that this patchset is on my
todo list to review but I'm not going to be able to get to
it before I break for Christmas, so I'll get back to it
in January. Thanks for the contribution!

-- PMM
