Received: by 2002:a17:907:76b5:b0:9a1:fa4e:495e with SMTP id jw21csp553346ejc;
        Fri, 1 Sep 2023 04:30:35 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH3RC4teEWGCi4tIF/AlIL/c+nAkbwjTy59bEg3JGRSNtlYTKL7d3rjRDh9IC79ZEViw/pY
X-Received: by 2002:a05:622a:c4:b0:403:eb5b:9569 with SMTP id p4-20020a05622a00c400b00403eb5b9569mr2277066qtw.21.1693567835660;
        Fri, 01 Sep 2023 04:30:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1693567835; cv=none;
        d=google.com; s=arc-20160816;
        b=h5qX8/QxMmHv5Wuoti2hf9NQHu/v9IS1STtnuKYgdzKpToVr5NCXSqnmFoRKdnPne2
         IViPJIsYfnGV6EjnXMEYXarzjdh5nc1I2PoqnN0ScSOz6roqVdNzH1mF5UcPUzBTC+2f
         KGlTH6oIeENl8vQEjGfjHpobTTjjtlqYW+bOcey16yhKhr2KJw9H3LxtPGmlRJQ8gWnF
         tLmghOEvs4qeum6goSIPK3I2Z21KXv+U8kKBuJS5YCChNheKMvH1VTrjSM6HndrpIRWy
         1BEZi4tXQLQgFpAti9gl5BLWtlgj+TmcAHKZn0kj6mqvfPwg06AQW9nHlnfSQiEJDF+Z
         oD2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:cc:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=yNT8hjywM3hateRXY/fPBXDS/ULk/xkyL06caX8Wwxw=;
        fh=shYycGEF3Q8RslnVoaBdMYR+6MIt5vfSJLaKuG8ei9U=;
        b=g34xm3w9X9B5sge5NSk8lTozwrLMeoIfyeXifK0PleSgcP0fKADRE+9b66//8pgX0R
         fxii3z4b1o5Jq3K8xaW6T2eAyJGN5vRI/0/SAht96nmkvpcxB75eXiK8wguoOdVhik1h
         hx2EnKhbGtRIec9Y6R9i+5l1Rp5iSPWu8HIBVQfO+Hknn1MqtE+RXcooBox/ILWfM7p7
         k+4LZaG5AzJN5cslNbzJ3gLNca9YmLc1PiUdrA4AWOnx2dTUykTkyPL/a1DkV+JLjlZb
         vmTKBt/hDrxel4at18uToLHJ6fO5PI+961bV2PDPtgfxr1D3lWjbc5vkCymFTY/I/TXH
         Bw0Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=oKC33rPg;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id tr13-20020a05620a2d8d00b0076da2f7befcsi2173423qkn.324.2023.09.01.04.30.35
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 01 Sep 2023 04:30:35 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=oKC33rPg;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qc2Lu-0004F7-Ll; Fri, 01 Sep 2023 07:30:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qc2Ls-0004E3-Tu
 for qemu-arm@nongnu.org; Fri, 01 Sep 2023 07:30:12 -0400
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qc2Lq-0003o1-J6
 for qemu-arm@nongnu.org; Fri, 01 Sep 2023 07:30:12 -0400
Received: by mail-ed1-x532.google.com with SMTP id
 4fb4d7f45d1cf-52683da3f5cso2425980a12.3
 for <qemu-arm@nongnu.org>; Fri, 01 Sep 2023 04:30:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1693567809; x=1694172609; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=yNT8hjywM3hateRXY/fPBXDS/ULk/xkyL06caX8Wwxw=;
 b=oKC33rPgcVFXhIFRVdfSuCbSdBYjzzq9FDXjEdNqfhS6Dz9G0uEVruQImnoHLRwuk3
 GBwDSAfcWoRrOnOtuZNa/NRIAH99+RfY5u5288jfeaS77G51eA9zcwIDDO6wGdMWxA7s
 rmAEUGfJ++hCA28dJ9xnkSdHf0J4P9VNhsdbfUWQfpkeBquxTG26dXELD5c3NpWdQS9c
 QPURM94jpBWpLrQD4ofwTLxbaloT799eww2SwEdA5DJVylvfJfnw90Y9ztJvmX0STuiV
 ngGa9B2OGX2Xn9vb8sWQhKRkU7alIrJJuBVX/GpyEIeqRkhuA55Q2FWemtC9TejrBeVE
 +rfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693567809; x=1694172609;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=yNT8hjywM3hateRXY/fPBXDS/ULk/xkyL06caX8Wwxw=;
 b=EQ0nYnSjiTDwqukUxJk5PitaHJTSHPexM//4qCIAo9oB+iRQbxQ18JYvjhti/8l4Ap
 82z5emenahpJGSDKmizO1SHCEcF/lFdldmpDcf6h+GWu8WFDfim579I71ca52S5orxMJ
 Um6xICfjok2iElu+my40LYBIGesKH/n96pzd6r7/GqtRHrCliqj7znPKdRFvWx+JCnSK
 2gTk4mU/eVXcodO/ebkuToL/wO22ZiJL57k2UrR7BncKoaYitRCr/1PTNjS4H0SRiIiI
 MsJQ9KQTIMJ30kbbBcOby3En/CwutU5PJv9ja0VB6Wb/18W6ZUlf36vX7P2zvqelrrM2
 LTSw==
X-Gm-Message-State: AOJu0YzyzmW5ZxW/JzLf4SSvzoeQIqJcbSWtYieJe40qbvoNpDAy/a3K
 Omc87gdvSTWMahFZBQkCJZKNmbFbmD8RuZX3zqaBjA==
X-Received: by 2002:aa7:da09:0:b0:523:1053:9b50 with SMTP id
 r9-20020aa7da09000000b0052310539b50mr1636435eds.20.1693567808819; Fri, 01 Sep
 2023 04:30:08 -0700 (PDT)
MIME-Version: 1.0
References: <20230831225607.30829-1-philmd@linaro.org>
 <20230831225607.30829-7-philmd@linaro.org>
In-Reply-To: <20230831225607.30829-7-philmd@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 1 Sep 2023 12:29:58 +0100
Message-ID: <CAFEAcA-kLGnxNesUKGSUpC4DT5Bhpcz30zu3ce18=2vH2EnxGw@mail.gmail.com>
Subject: Re: [PATCH 06/11] hw/arm/allwinner: Clean up local variable shadowing
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, Markus Armbruster <armbru@redhat.com>,
 qemu-arm@nongnu.org, 
 qemu-block@nongnu.org, David Gibson <david@gibson.dropbear.id.au>, 
 Beniamino Galvani <b.galvani@gmail.com>,
 Strahinja Jankovic <strahinja.p.jankovic@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::532;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x532.google.com
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
X-TUID: 1pRTmR6jC55d

On Thu, 31 Aug 2023 at 23:56, Philippe Mathieu-Daud=C3=A9 <philmd@linaro.or=
g> wrote:
>
> Fix:
>
>   hw/arm/allwinner-r40.c:412:14: error: declaration shadows a local varia=
ble [-Werror,-Wshadow]
>     for (int i =3D 0; i < AW_R40_NUM_MMCS; i++) {
>              ^
>   hw/arm/allwinner-r40.c:299:14: note: previous declaration is here
>     unsigned i;
>              ^
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
> ---

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
