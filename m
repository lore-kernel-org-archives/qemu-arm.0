Received: by 2002:a17:906:cc96:b0:9a1:fa4e:495e with SMTP id oq22csp1455730ejb;
        Mon, 4 Sep 2023 09:34:44 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHvMt0rEstH5D0snvg/u9F1HguxPaMMzEXHKykCI9AWtauq+0A5V++5DvTYCec0QCkLWGwt
X-Received: by 2002:a05:6808:18a6:b0:3a8:472b:febf with SMTP id bi38-20020a05680818a600b003a8472bfebfmr13228807oib.21.1693845284562;
        Mon, 04 Sep 2023 09:34:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1693845284; cv=none;
        d=google.com; s=arc-20160816;
        b=QmSvrqbu3gciPKXYXwemtU6UEe7JY25VufVZGVQuO/YXjUVQ7lHqVDX89ruX7+X+09
         7rcDbi/Y+VhxfGzy/pivrzso6ehDxSapd36BIqv+T/+GYQNaO5VF/fDvpQrAvqGDx2V1
         jM1CPlTkPJSFfkeHRfkwzH2RwJj7tSa+KSD/BXdoR4/TlV42EPIvi+ouuRMv69/mGqIu
         62C3/y0tSgcjlBt6zpVHy22cV5t2rzf+NYljTf8yTxEhNBgANNGnYStLTK36+TWTUTx0
         /ocexxfM5warBdFeFrOVoWxZzPPkgDaw5NkMxqQ0OtUkUNgSb/D23cZUJMiwF6ayt2Bt
         BJYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:cc:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=PVf0ec9JUJet4Pqt/mpA4aToBYy39TdMPg+NqqnicEk=;
        fh=5TE/jZ1h2bhPrD3QkSAmhSQ6mfW/X9+Tq0vet300EKs=;
        b=agipYcdKZ5/CPAy2vc/KHNR6RHiYUMCLRY7kGFErpICxq7tPLjzy6o0i6fUFtDkyPi
         OAvhJAZPKcC4SjHo8LX35+6XK5qWsVkpGDPauyFGbr/qm9nlnXOWfIXV3Y7K2/+FjM8N
         yJsP0I4Dc4WUwdruuPgLV9Ir8aj4UeiZGl9Sv1qQvMuMij+phhBvtCoR34a5Hz7hiz/M
         EGBQaI3QR3CDnRppYUFZOCmnAmOp2Ry00nkrPP5OGfHZBofvbWHi368Le+MEyuFjhhBj
         ol0FfEa+v/q7jgRkDLuf4Sxa5diksfWnP46K6c7V+wdJsxkUhwaWCRcul+hFhifTZn0p
         wLjw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Ph+ZQfJo;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o18-20020a0ce412000000b0064cc5651621si6916973qvl.160.2023.09.04.09.34.44
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 04 Sep 2023 09:34:44 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Ph+ZQfJo;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1qdCWy-0002Vi-HO; Mon, 04 Sep 2023 12:34:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qdCWv-0002V6-G0
 for qemu-devel@nongnu.org; Mon, 04 Sep 2023 12:34:25 -0400
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qdCWt-0003dz-BJ
 for qemu-devel@nongnu.org; Mon, 04 Sep 2023 12:34:25 -0400
Received: by mail-ed1-x52c.google.com with SMTP id
 4fb4d7f45d1cf-52a0856b4fdso2215715a12.1
 for <qemu-devel@nongnu.org>; Mon, 04 Sep 2023 09:34:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1693845262; x=1694450062; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=PVf0ec9JUJet4Pqt/mpA4aToBYy39TdMPg+NqqnicEk=;
 b=Ph+ZQfJoK6dCCD1rg5cUuQYCCY2zjzPgsY0Qd3b6tHF0xJ51rkNdUKWO5J7nlQyYcb
 gr24WwOvXzW0rahHQBW2xxsi80TYktuisfa7pQRmdaaaLMtncP4Kw2r9/Uqc+dFQDJZ+
 QAnyD40x9w+Msehp23IHrMC9TTZkfvLF/o2EVT2av1shCIwOGaAlhdDX5rF190WgpLIo
 kGjmqdqgOzxmjcIdRqp7OzPXIaQgedZzKv0fnGzXakCWAjdKYu9sHlI9aAboiywHBeRV
 +OVdtYjApA+TNqXW47AwtDs/CnlO8Akxp+WB3A6KsM7Mcl2j0K3gEa0yhx8VkIokg40R
 RbKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693845262; x=1694450062;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=PVf0ec9JUJet4Pqt/mpA4aToBYy39TdMPg+NqqnicEk=;
 b=EYu966ggSfYFc54WaN8FambMLt0FfaGxEz0niqwlW4ZDKHRxwHkvCVta4SugDnESvr
 2obVTrAZYD3AjYBWQneXkD0Hj1P2MCq4PQEB6K8Ud8BSiAIHWZX23YtuGlLuZ/XVyFwu
 Th6anM0rl8GOTaRjPO37DsKavly51S8kB38QHW9vP8GItQzhN7umXEmyF0UDujfkfXjM
 z5eztKkdbRGlayhe7p0qZqfX+c7bYbz2uy2skbllNSPhYdZOCHtrnM4OFmvC6bs/2G64
 YmE6Js6fLNBqS7NdY6o6VWVIjaRzQGswlxNi1eNWnTiK9nLLh47YGHhFlYKQxC1+al5R
 Dk/w==
X-Gm-Message-State: AOJu0YxrGyGjOtk7U8G+j7vwAOfobsYSHQYvgMoOWwIksGiVCGGVf7Pw
 H9rvqmlKnBT3mmSN8Arlf9N00Fhh+uQ6U1Xf2KR1ew==
X-Received: by 2002:aa7:cd11:0:b0:52a:1c3c:2ecf with SMTP id
 b17-20020aa7cd11000000b0052a1c3c2ecfmr8006828edw.28.1693845261963; Mon, 04
 Sep 2023 09:34:21 -0700 (PDT)
MIME-Version: 1.0
References: <20230904162824.85385-1-philmd@linaro.org>
 <20230904162824.85385-4-philmd@linaro.org>
In-Reply-To: <20230904162824.85385-4-philmd@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 4 Sep 2023 17:34:11 +0100
Message-ID: <CAFEAcA-LphZk_WHYS7ynE+SzZkYszu3fjKExLtPjJ=VW-hFCHw@mail.gmail.com>
Subject: Re: [PATCH 3/3] tests/qtest/pflash: Clean up local variable shadowing
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, Markus Armbruster <armbru@redhat.com>,
 qemu-block@nongnu.org, 
 qemu-arm@nongnu.org, Thomas Huth <thuth@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::52c;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: bThz8GHDvnLT

On Mon, 4 Sept 2023 at 17:30, Philippe Mathieu-Daud=C3=A9 <philmd@linaro.or=
g> wrote:
>
> Fix:
>
>   tests/qtest/pflash-cfi02-test.c: In function =E2=80=98test_geometry=E2=
=80=99:
>   tests/qtest/pflash-cfi02-test.c:409:22: warning: declaration of =E2=80=
=98byte_addr=E2=80=99 shadows a previous local [-Wshadow=3Dcompatible-local=
]
>     409 |             uint64_t byte_addr =3D (uint64_t)i * c->sector_len[=
region];
>         |                      ^~~~~~~~~
>   tests/qtest/pflash-cfi02-test.c:342:14: note: shadowed declaration is h=
ere
>     342 |     uint64_t byte_addr =3D 0;
>         |              ^~~~~~~~~
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
> ---

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
