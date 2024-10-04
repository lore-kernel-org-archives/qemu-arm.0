Received: by 2002:a17:505:c89:b0:1be9:327d:8ee3 with SMTP id hp9csp618656njb;
        Fri, 4 Oct 2024 11:11:45 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWVIqgWMh98IRVP7gs/keZO7J5fgjEg4w0K0aNicDnQjmyofMRAiuvE48WWk4sfBDCIW9ni8AtUDhrSSQ==@linaro.org
X-Google-Smtp-Source: AGHT+IF3C8RINXdb6to+ineQMMZHZiT2ITbNw6dsTOoqGYvVec/9m4gw+l+Q5sER2V+H8FgVf79M
X-Received: by 2002:a05:620a:294d:b0:7a1:c40d:7573 with SMTP id af79cd13be357-7ae6f48e01bmr627550685a.49.1728065505428;
        Fri, 04 Oct 2024 11:11:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1728065505; cv=none;
        d=google.com; s=arc-20240605;
        b=Ut1cqhJ9R4HQwlOaKKOY30jgp1L+a7QXWWUFDoAxHaSW0EqGNYHw20qxOrsBQXzLuw
         wGRMprNJFbQvuMzySPTWq9QmOctV7mI+aS84CnlpkdpgNLI6zRaP1aKi3hJTcgtkPfJK
         UNSdPMYmSqCBAIzEZgfUbZOupjmRpmzqSnlVRXOgyxliLV/So7TcMVNlpwQtxjfUxu95
         9+W7Cq5hxvKnxxYN1qI7nxmnQFI1z4qOOxbGmdasGn+VcR0ozPIf86WrOnFI1qJ/nRkI
         jO5mxOjfsv2xSB8xnkU2xS2NxrhEVn4sRM9e84wpIapUq8mn6bXex2iMkxFe70QTe+xb
         d+pQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:cc:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=sjJUBNfRiyu/itUjSNiYGb5Kt7u8EGa9eU/c7Nllk8g=;
        fh=gc5KcyZvb5EukBWAcAqJYJFzy2j7OfIVnH14NzjLUiU=;
        b=WEQguy7/EjqSKVeKaea8h23QZ/e/H7sjNNIiDOcrnUGGKTwJNuNMMtHjqPNzpjI5t9
         yxRsZO7IK8wi8u4pyjE+TRM+uihUCtYDmUQ726aEnV4TuaGWxtPooDIE4xwplYOxBRKG
         E4+pV909Ncr7mojlMPjUbE8PwUPCMEQcxEh7ktkk2s0GerVrqH/gsQqCVQjP8N4rqW2w
         oRwozySw7u1J0PilX0Dfe/CUgiQ7FUOtJc3+gtJCJkOyb0kkqQ+uc9KKw/8xp2LICUYN
         G0xx1jCJKdFg9NKyXi61see/Utwr2uXur1ksK2T8ssX+WZRnTtl1K0JrxDjCH6kLhOrz
         rEew==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=izE5CEnL;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7ae75616902si17132685a.43.2024.10.04.11.11.45
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 04 Oct 2024 11:11:45 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=izE5CEnL;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1swmmB-0006xg-1n; Fri, 04 Oct 2024 14:11:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1swmm9-0006tf-Pv
 for qemu-arm@nongnu.org; Fri, 04 Oct 2024 14:11:37 -0400
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1swmm8-0001Id-97
 for qemu-arm@nongnu.org; Fri, 04 Oct 2024 14:11:37 -0400
Received: by mail-ed1-x533.google.com with SMTP id
 4fb4d7f45d1cf-5c5b9d2195eso3239724a12.1
 for <qemu-arm@nongnu.org>; Fri, 04 Oct 2024 11:11:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1728065494; x=1728670294; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=sjJUBNfRiyu/itUjSNiYGb5Kt7u8EGa9eU/c7Nllk8g=;
 b=izE5CEnLe9X6mYA3UeuFUqItsNuFv5YHw07umNShvbwh6wWXIxzijzrhe6jQEAuCFY
 WG5ITlExkqM2Pa5Y0OsxA7FJXsvVoTSPT18wBfn73KQCfDa65k2ats2bTp4iTBniK1XW
 TD8qFTRu+m3eMk5d+W56gnp/f/KkdJ0bcD+C/9Ll2wvvN0R7M8xJYSzOwjYP8ycaZoI2
 qvvjE2Q4ENReg18nhltLLy/B5j1UPga/JeSw+vnX/N/2acsPkIbq1zeYR4Ih6UOJHTE0
 jTCPVd8/co0tqWQ+FFrRCzNu1CA7EIC1TYSPNKbhdL2iSDvw6/ZDoLpCHFwXyeHajI8o
 m5BA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1728065494; x=1728670294;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=sjJUBNfRiyu/itUjSNiYGb5Kt7u8EGa9eU/c7Nllk8g=;
 b=Po+GMj8+kJdktD9PlfKMgghWxF7LmMVZ1hZc7Ew5Dv9l4YPn4W0JcJ1U6qkaf7LSgA
 qDMdHYaIDIyaKnK+l37M/0j8FwuhSZvP8QsW3g34P1s07SXUUe9ZYuOF7/wxJYAhY00/
 dNj95ukQwlJq3BGqNvy9tkbNILcrL6ECk2gPo2WMc5VoVjhRwEHr05svac5OX6ViSSF/
 qjXNlk3l/Yp4kuupiffcsd+xZ8+TfSVQEiJJKcnrjeAhKwY1Idy+psBDEeuPLxBdZVRW
 6B0ud3VMKbaTiNVPn1rjwpvImWpWyIIzjV8mKa6arrVD5K/Qet4ltFziuH8KhmsrFLzW
 /0uA==
X-Gm-Message-State: AOJu0Yx6oCiGrTTWNIKZu7261dgG6tm40rXHNC+FHN5KRiE/HYvc3a5r
 H18nNAt31jtxrHXjp3eHJbnpsVlrPgUR9vyzDFJjozeOFc9dYxEcI2+q3GRudX1Ij9EEhqQMSGg
 rRoUzYy+6bHqnASDqNkplRcfXkGcN1Ay9OzInFA==
X-Received: by 2002:a05:6402:5208:b0:5c8:a117:b31a with SMTP id
 4fb4d7f45d1cf-5c8d2e2ca65mr2805711a12.17.1728065494414; Fri, 04 Oct 2024
 11:11:34 -0700 (PDT)
MIME-Version: 1.0
References: <20240927150738.57786-1-rcardenas.rod@gmail.com>
In-Reply-To: <20240927150738.57786-1-rcardenas.rod@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 4 Oct 2024 19:11:22 +0100
Message-ID: <CAFEAcA-CcJLKmy_9_jMceWrLA7MDxSJK8L8kb+U3N1=40B=Sqg@mail.gmail.com>
Subject: Re: [PATCH 1/4] STM32F4: new RCC device
To: =?UTF-8?B?Um9tw6FuIEPDoXJkZW5hcyBSb2Ryw61ndWV6?= <rcardenas.rod@gmail.com>
Cc: qemu-arm@nongnu.org, alistair@alistair23.me, qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::533;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x533.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: kOvKK+ut5ypm

On Fri, 27 Sept 2024 at 16:08, Rom=C3=A1n C=C3=A1rdenas Rodr=C3=ADguez
<rcardenas.rod@gmail.com> wrote:
>
> Generic RCC class for STM32 devices. It can be used for most of STM32 chi=
ps.
> Note that it only implements enable and reset capabilities.
>
> Signed-off-by: Roman Cardenas Rodriguez <rcardenas.rod@gmail.com>

Patches 1 and 2 looked OK to me, so I've applied them
to target-arm.next. Thanks!

PS: for future submissions, if you send a multi-patch series
could you send it with a cover letter, please (of the kind
that "git format-patch --cover-letter" produces)? Our automatic
tooling expects multi-patch threads to have a cover letter,
so having one makes the process a bit smoother.

-- PMM
