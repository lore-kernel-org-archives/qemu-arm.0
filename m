Received: by 10.25.44.15 with SMTP id s15csp996925lfs;
        Fri, 14 Jul 2017 07:23:38 -0700 (PDT)
X-Received: by 10.223.164.23 with SMTP id d23mr4695912wra.58.1500042218257;
        Fri, 14 Jul 2017 07:23:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1500042218; cv=none;
        d=google.com; s=arc-20160816;
        b=auAx2bUiY0BMDYielCBnRsZiRteopRoXDsb42GcR2fjqMPxDXu8R5q3kb3mEnXTSBg
         5r3bCFDo4IBj1/tTNlWWtq4zFRLFXB9gsTWis4so1IXXFNMNfBwwxYLWQqNx3ND53NCE
         WAgigKFiABccE0sHTGY7e/T8VDcQAyvUvVHeVEFNb9Hc18042XBTofnapoEQsF+IGIYz
         at6I7wPiweeEvgto6dRvY2f8wxqVTo5NPbXSZWRdBXmmpSIZvdI7XHeTEIea1iubQNyY
         QhgmyUslf11UL93pKEaljbgakTGFbAF/5mys8qF9APmO/k7dutQVLd6ni+LcgJ6LxK+c
         SKHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=wYDdYozdViDDsosDOkEmVw/dw44VrJD+0kIVGAoQ6s4=;
        b=aMVAKB/f+rLuza+erzEAUfPUliz6rlBWYIwLeTiZvdh7fcIh7rxG+0p7eDCfAZaP+V
         KV8VXm6jufwQ5mDqnRE0Dfov0NsOwb97jKCronCzIDRgE6FwLdkNxoqAFSq6DW8u7wQT
         cmYDzJWqN9JEx41T3UpTqRNLON48v2eRLUY/eLnFX+83Q+0fNHqD9zp/ojOAQ6ghSC+m
         5BrZtXAL6csp0ANm47hvJuRx7xywCJgHgn7wV9Yv6IoLVs70irgDqYwyciQxiBeP+wps
         PpE0iwHAPxNv12MRlr2s7xiu47BnRWE7LxWfaQxJUqhUZ+WPzfIiuaoM4i3fBr/qjDfj
         LvcQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.b=XauwzqNx;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 2a00:1450:400c:c09::235 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-wm0-x235.google.com (mail-wm0-x235.google.com. [2a00:1450:400c:c09::235])
        by mx.google.com with ESMTPS id 123si2452331wmn.71.2017.07.14.07.23.38
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 14 Jul 2017 07:23:38 -0700 (PDT)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 2a00:1450:400c:c09::235 as permitted sender) client-ip=2a00:1450:400c:c09::235;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.b=XauwzqNx;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 2a00:1450:400c:c09::235 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: by mail-wm0-x235.google.com with SMTP id 62so21990272wmw.1
        for <alex.bennee@linaro.org>; Fri, 14 Jul 2017 07:23:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=wYDdYozdViDDsosDOkEmVw/dw44VrJD+0kIVGAoQ6s4=;
        b=XauwzqNxbbQ4Cm4SYW2nQDxF4UJAkSEnfyK6RlJycoFGlV0ehH498n/WFo7hBG5/87
         RfZ4jLLFWW6Nw2KErPI6JISlzetB70gr28gc12p/BLChYZDWCs78YVZFMvVf40VTxRqF
         kz/2wL0okkw9NBfOF5/Jr+Ltfq9KtQ6LICxwA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=wYDdYozdViDDsosDOkEmVw/dw44VrJD+0kIVGAoQ6s4=;
        b=d4PlbmPg4vHqnAdZ/ocF8ToSZ4TbXcDxE7bu/LGlAkjzYhIi/PzFlO9p0eQSIdGptl
         EgYlpzBrLBvVZYckUehL635AI6xTgZOBk6RQ05mLm6QqSW59NrlfUsC6HzMEQ3CMqCTf
         DnKKUeCg17T582IX7SRsHoFM7AAZrZw1xxdHbgYvOHmVYg6kGpjSkTnGZyjaaPdeN0By
         7X0k2BD5g991MBTcVzP26yl4r7Ln1Xw73fFb8ZEuKc9KfDurz5aeeUG/7MB5XSRHlo73
         D2/GGjQU0vU9d/7byVqOyDLHD0XPSHlvRQ3uLl2RgmKIIcWH+bzrYrYT9fdzRJb2kYQx
         ZJwQ==
X-Gm-Message-State: AIVw110qWMVGbJmansQrnZZOhxePy56kNZseQZztS7FzCbjfEs+CVvqy
	uBNXDotl8pufuYM0Si0KA8QrU1mizL1w3bEygw==
X-Received: by 10.28.228.85 with SMTP id b82mr2831220wmh.65.1500042217767;
 Fri, 14 Jul 2017 07:23:37 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.134.2 with HTTP; Fri, 14 Jul 2017 07:23:17 -0700 (PDT)
In-Reply-To: <20170713141928.25419-1-alex.bennee@linaro.org>
References: <20170713141928.25419-1-alex.bennee@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 14 Jul 2017 15:23:17 +0100
Message-ID: <CAFEAcA_CCDU+7N8dqL5mRjAKNVQYa4m9j_mkhv1jHZMVKSSk5g@mail.gmail.com>
Subject: Re: [PATCH v4 0/6] arm: fixes for eret, isb and DISAS_UPDATE handling
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: VEKuvccoUefw

On 13 July 2017 at 15:19, Alex Benn=C3=A9e <alex.bennee@linaro.org> wrote:
> Hi Peter,
>
> All reviews are now in and I've tested against AArch64 OPTEE xtest
> suite and it fixes the hang. Apart from review tags there was one
> minor tweak to gen_goto_tb so it always sets s->is_jmp =3D
> DISAS_TB_JUMP;
>
> I reckon these are ready to be taken into the ARM tree now.
>

Applied to target-arm.next, thanks. We can fix up the long
standing oddity of masking bit 0 of s->pc in a different patch.

-- PMM
