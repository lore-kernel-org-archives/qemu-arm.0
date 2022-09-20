Received: by 2002:a17:906:b088:0:0:0:0 with SMTP id x8csp1854023ejy;
        Tue, 20 Sep 2022 08:15:47 -0700 (PDT)
X-Received: by 2002:a05:6402:d05:b0:425:b5c8:faeb with SMTP id eb5-20020a0564020d0500b00425b5c8faebmr20052406edb.273.1663686947137;
        Tue, 20 Sep 2022 08:15:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1663686947; cv=none;
        d=google.com; s=arc-20160816;
        b=UyytKWJ77E18VoGHZIw4vcqOaE8rKarl2C1r3D1Fnh3UxaGKkCwgRTmCdS7KG7Aspa
         99ADZsaK7ADTgfYlAFV1OqNuc8C17qZFbP2zezjZbH+//oPNMPWOsvxy+gSEnM7KYWYe
         mLPHqcT7oaiu26gfg1u86XNyjN7E9ZI8E117t3+ppGik/d9w2rvOf17KWY0Ps3lo+o7S
         hdOn33GJEgo48SIbgaKHFowz+hBnKq3GFbBOCPAaJ+Z9om1e+0NmJHEn6NfqkAnQI7HG
         euivqXPhg3s1tKXP+FPvXODFLuvWQE5xeOpSnm0o+WzY51r9AXmaoUl7iJm1DIA2xO8y
         3oAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=KkaEiZ02EouUlGaMhxNtZcD46s5sk3AH0Nj2KAp+eNs=;
        b=RFeYBzs2N9JN60DqaaJPYtDvedOZe4t/GVl0bI6WWuzDiq5atWpllZHD2W//aNQV/J
         Y4swCeznUWSiZlghP8+TGxNLF7tBmSCgEpJ8m3qiFXXMLWTb/yN+Kg6qnqm03QmZ2quw
         /aMDEOQGhhGVRwMxmv1TTJ2Q49wIl5x1CDvrKEHdJMzaQIwhb9ecXqIckktSDKWF5T+4
         8XPIuAWvkhdyAfpMAfRZkmCi//w9lFyswzs1ySjWuKPbcn8wcI2VonKEdmVirTy+cnQH
         2N/qW6CdQiCRB3QrPRz1JpwsSvT2FWb9M3nQ51AM3X7PGvjPUXDxau7gtaL6SotxaIaT
         9w0A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=jqpZGJtm;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id p15-20020a170906784f00b00781132aefc9sor906446ejm.94.2022.09.20.08.15.47
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 20 Sep 2022 08:15:47 -0700 (PDT)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=jqpZGJtm;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date;
        bh=KkaEiZ02EouUlGaMhxNtZcD46s5sk3AH0Nj2KAp+eNs=;
        b=jqpZGJtmZcagf6mJvd3lSNasvS2kyNZRjPFptXqjgCYzx0Z6LCzxw6VYTEInaKfNcY
         MFq4or75HbVT4PWgcfTtce6BDiCFmGIvZ+5nDfHuIPIVedee+oiVHR5v2K67ooKajWII
         I/lX+RwS/CTXyJ/ycR0S930RdigteHlL4ArDvhAjcW/oeviXhAXvf2eDMpUU5dwVI3sz
         lOHl122G07R9Lpoj2nc4E1iWeooqadPNnbBAIvCTpdAxfL42o6VYZK2o16W7xFHgA32z
         cbn5MJTqkSgwdvyR9BPtuYWXYBmMSrX0bRmd3KJUJiniIfpM/KiA0Qw6YlV4HoQfQhxd
         9CYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date;
        bh=KkaEiZ02EouUlGaMhxNtZcD46s5sk3AH0Nj2KAp+eNs=;
        b=2nU+crraAYyIS3MtV35oRo+qUkPLvSd4tlzQilKqBee7hLRqddf7RG5RFhN+i6zbau
         9MoJHnJWBFmcKWFwym5MXs1U+Sbx84FUFQJ4qO5RjM0neKnfON0YBp0cnTSVagK3rJSV
         6tFIwU4KgyF2Z3TwAjbhon1FkWXyTpPVespmi8VvJvbVtXp55h75aRk8w+TQK88oYJy8
         7ZfaeJ1lLAr8aji1AxDo5oLCOj/HEip/nok0nXjlQ4nNH9ewQ2JKZcjI21ceUpdkUomc
         y8QSH1658ffmKIAhEBHyNoqDzpoU5FU/b8NgRsf6TVPlOx+EJ6qkH/xoHp4su0LDpBu0
         1Qtw==
X-Gm-Message-State: ACrzQf3XmFdByi4PcnKmqnvbdGjMoioXA0CwnnFYvkeeVeGZoZt12+Bi
	TNHlFFbH33PAY4NZpdDmgPSC8EEBSZlqPu3Ic7v5c76R
X-Google-Smtp-Source: AMsMyM70R5QG+nctBXeLp/H9QHRQ+JmwGikJbU2Oe65sLIy2FRZVy1nvcCOhwuv4lcuRvOzaRNAwq8f00PqnsjkQ3KA=
X-Received: by 2002:a17:907:86a5:b0:780:156d:e842 with SMTP id
 qa37-20020a17090786a500b00780156de842mr17131369ejc.555.1663686946832; Tue, 20
 Sep 2022 08:15:46 -0700 (PDT)
MIME-Version: 1.0
References: <20220822152741.1617527-1-richard.henderson@linaro.org> <20220822152741.1617527-19-richard.henderson@linaro.org>
In-Reply-To: <20220822152741.1617527-19-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 20 Sep 2022 16:15:34 +0100
Message-ID: <CAFEAcA8+rX2tspDcXHpQ5d7en3ykYfde2B5X=vaKxRwzrgxsnw@mail.gmail.com>
Subject: Re: [PATCH v2 18/66] target/arm: Add secure parameter to get_phys_addr_pmsav7
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, 
	=?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: tgiloD/aSGrf

On Mon, 22 Aug 2022 at 16:58, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Remove the use of regime_is_secure from get_phys_addr_pmsav7,
> using the new parameter instead.
>
> Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
