Received: by 2002:a17:906:e92:b0:a3e:79c1:d636 with SMTP id p18csp97606ejf;
        Thu, 22 Feb 2024 09:55:32 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWXdNotByDsx1Ts4YK1HIB5659RcMmNYzRgHDLHa1rmywC/ERwX2caP6KAu/xO5vKoFK2LUks7CfVPAId2gY+kE/XUgmBJf
X-Google-Smtp-Source: AGHT+IGdF5PEbrHvzo0FHZ2DZrVWzeqr8xP9Hd01fwTlhSD2UZTqD3UwRCzOhOw/WlYSJFLc3Zav
X-Received: by 2002:a05:6214:20aa:b0:68f:44c6:7962 with SMTP id 10-20020a05621420aa00b0068f44c67962mr20793199qvd.36.1708624531966;
        Thu, 22 Feb 2024 09:55:31 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1708624531; cv=none;
        d=google.com; s=arc-20160816;
        b=xpR/OWr5pFQMRsRHS4HGuqRUST9TG7qhjU8qAJz9erm+mItC7cKmYKpW4s1EZt2c6G
         wekUiTvvHZeZhubybAfaQI609ZajGqRE3BHl26jqmif0wijRWXTFgXx8k2KtdQE7gP3Q
         Jo+KKOvEAyhXTBxkIWtXPHVUO1L9c+l7SlmTjyEmmWAWHxblt9bN3cPPytJkrSd8LzTt
         wjMjbzlKwoS7EYuP4tgAicwXMs1iNTn3kNUGvTw89o2dJRnCcoe1hrj07iUnlcaLXn1w
         RYRnKzmHDyYJLDG8wqlyiatUUPePunEUbcet1hVZ4KoogTFg8fY17xo6FiRIzAbKfim2
         xiBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=URr/vp1iUOexEEjosHVLdNV2K5nUv92WfGvhsd57vXM=;
        fh=N8XwUfZuFkhKSyEoa2uNH6CuvH/vlvG6ACBMoDB77Tg=;
        b=UxNss3zWDSjcM2H8bEqP2ELZIajkT99B76rrtcRleU2IRlHoIuApiSIYONAhKr0dGo
         c9QCyMpdcdAk+gElmcCEPzDtVtl3Hre0KcTs/a05Uy7zjyG9ZMCtGoSqOY72H23UCvjx
         1Gz9xerdt56Ae7FjLtPBjSARojY52ViN3cUbdqj5QrMluUyXwKy7IbLXvfGyOL7MIC8b
         9SxzgMb26/PvXTSnVQVd3Dj6hGw5IftWKXiKvZg/upXqt0rsg6wep59zxv7Oi4XQ0zWf
         3sSohJEMFnUZxCff/ILp3B70OTsagB8S7QuFAIQ8g81EsLR6UsB42sUh88nUdBI/N/EY
         xoew==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=CnFU1cZW;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id z15-20020a056214040f00b0068cd18bde60si13613346qvx.526.2024.02.22.09.55.31
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 22 Feb 2024 09:55:31 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=CnFU1cZW;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rdDHU-0007iI-1L; Thu, 22 Feb 2024 12:54:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rdDHS-0007hc-Hh
 for qemu-arm@nongnu.org; Thu, 22 Feb 2024 12:54:46 -0500
Received: from mail-lj1-x22a.google.com ([2a00:1450:4864:20::22a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rdDHR-0007z6-0o
 for qemu-arm@nongnu.org; Thu, 22 Feb 2024 12:54:46 -0500
Received: by mail-lj1-x22a.google.com with SMTP id
 38308e7fff4ca-2d240d8baf6so459631fa.3
 for <qemu-arm@nongnu.org>; Thu, 22 Feb 2024 09:54:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1708624483; x=1709229283; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=URr/vp1iUOexEEjosHVLdNV2K5nUv92WfGvhsd57vXM=;
 b=CnFU1cZW4LlzJhFNsZNTEdZtgzcg9dPN3VJI02ZE6ftH1ypMyA6n1jr73ouuuq29ER
 zebPJgpFSnidrpG56LeQlTbmuC6YgK1n69LMcEw2h169STJ3scpaKfMBTCulzZv1YjRY
 mwq3cv9ZtOIZTHZB4KNk81WMrJNjk5lY0Nb82UeSQFCHQXcudZnwcS4XEl3KYPouzaM8
 sXVIyR+JXAwwrBmYfZZNifYK7mWYSS3Y3WyKW1KYhjapfk324AcFk1AEX5x7D45p6dDJ
 SBNDSsvP9jpZz/veD9k5XNXQ0a2yTNwTAQYn8JmOlBOqV0632ypFUPPf0V6rZ0zeViu5
 087Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708624483; x=1709229283;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=URr/vp1iUOexEEjosHVLdNV2K5nUv92WfGvhsd57vXM=;
 b=qCOrp2UlvtY+niuAN83Ds6kgOcaictg2WvNag7cI3IsFGa73neYBFOFP3Gko7Z+Bo9
 CgjIhnuczwpcRlv/AeKLQ7CPqfhzFYZ3x12+fGrTA7Xqiu4EaMNOxT54yCKLWZQzo7Wp
 NJM5fuLNiJAkg51fFhBB/COrpGAO/ZbthbJLUG8ZmzptK1zrujJbtpit4GIKLMZfpqGJ
 hj9uICUFsgmpfvp8EcTPWFTl4SvZ4/EwfLCnkJLJBkZiX+wUJEzKtp3+HAIbb50n0ssf
 pdBSn8o2nfjZzK/aH7zobKsNtZ9RBd7XpShP4gCDkryq9s//H+Tx0dwFvuyXPe6/Alnm
 4Rkg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWlPbW+Ggyh67Je56B+dIqr9mRJIDbCgRdVVr+lmxWoYkGnYLwBIH5b0Z9p+uxjot0ubn3zCgNMwUqUtKtehmyn8p4H
X-Gm-Message-State: AOJu0YxzAeBeizoO5zMUv/DHVM4muqw4D0ldSwdSMqL+4ZSSGEoTvLfG
 JXD4mxmzSr+NgZA/5ITyDQlDm3eGKZ7jaAN3CakZygk0rB2f7YF0zYfZk0MEzHYGpXZO32Uykeu
 kE56Iv11/leuMwS+jAl3DUqpt6jot5X0sBW6VkQ==
X-Received: by 2002:ac2:4a85:0:b0:512:9325:d8fa with SMTP id
 l5-20020ac24a85000000b005129325d8famr11284393lfp.21.1708624483002; Thu, 22
 Feb 2024 09:54:43 -0800 (PST)
MIME-Version: 1.0
References: <20240220091721.82954-1-sai.pavan.boddu@amd.com>
In-Reply-To: <20240220091721.82954-1-sai.pavan.boddu@amd.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 22 Feb 2024 17:54:32 +0000
Message-ID: <CAFEAcA-eQSsXmmLzD=_+1z-YDrj5yg-MdMPLTwzFjRcm1q8ebA@mail.gmail.com>
Subject: Re: [PATCH v2 0/2] OSPI updates
To: Sai Pavan Boddu <sai.pavan.boddu@amd.com>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, qemu-block@nongnu.org, 
 Alistair Francis <alistair@alistair23.me>,
 "Edgar E . Iglesias" <edgar.iglesias@gmail.com>, 
 Kevin Wolf <kwolf@redhat.com>, Francisco Iglesias <frasse.iglesias@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::22a;
 envelope-from=peter.maydell@linaro.org; helo=mail-lj1-x22a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: UPPRUM5xYXhq

On Tue, 20 Feb 2024 at 09:17, Sai Pavan Boddu <sai.pavan.boddu@amd.com> wrote:
>
> Add a new 2Gib octal flash mt35xu02gbba. Add an interface for versal
> virt board to swap the default flash.
>
> Changes for V2:
>   Added type checks for provided flash part name.
>
> Sai Pavan Boddu (2):
>   block: m25p80: Add support of mt35xu02gbba
>   arm: xlnx-versal-virt: Add machine property ospi-flash
>
>  hw/block/m25p80_sfdp.h    |  1 +
>  hw/arm/xlnx-versal-virt.c | 44 ++++++++++++++++++++++++++++++++++++++-
>  hw/block/m25p80.c         |  3 +++
>  hw/block/m25p80_sfdp.c    | 36 ++++++++++++++++++++++++++++++++
>  4 files changed, 83 insertions(+), 1 deletion(-)

Applied to target-arm.next, thanks.

-- PMM
