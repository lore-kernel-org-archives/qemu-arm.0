Received: by 2002:a17:906:4810:b0:965:a47e:1721 with SMTP id w16csp6392369ejq;
        Mon, 15 May 2023 02:59:38 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ4hpq8S+jfRWPqCQbLAUqEezgdTjZKrLQQexZ0uz1ySSBOFbjoHfcwTN16et7Z9OwdJakyC
X-Received: by 2002:ac8:4e46:0:b0:3f3:8cf1:62b3 with SMTP id e6-20020ac84e46000000b003f38cf162b3mr42929623qtw.1.1684144778175;
        Mon, 15 May 2023 02:59:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1684144778; cv=none;
        d=google.com; s=arc-20160816;
        b=NXqCDaY5dChhxRiaDavh5es5MLPelZ8jp2OnPcj75p2z1Ce38VZcYg7BsI/qeFUou2
         6cCpvZtI6d/mSNtqXFGf5NtC/nQHnTYBl//5DtFYLB6AY0sq/u5AdNeuGv5ORI2ZPJEJ
         soOXT/3xk01isfEX9iO8SZFFgtjBTuLa2mx7zjVzCxLfHUtEExTnoS8NxHylm/EWBHFy
         Mvlvo0hS/O0e+M3Lcy08pCmj/SJVrqYRjqDNvN5L5sk3MDlshq4YMQMJfyGPy8M7GK/D
         WFLW8hvM+N9p1lGrFZIYqh+aW2D1MpNqreBYiVZMRzH5qUqRl3dF741Rpar+WX4Un+2n
         Echg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:cc:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=CX8zFUszW8AhvqvMu4OZUAGHR5+xcJ1pj76LiJAMgHI=;
        b=aLIudQ37N8KNwDxr/TgAERidDL9CGF9NcQMq65S0ZgHefFsC2+kKNCi3d5+VPG/Yk1
         zme4nJ0uyHTnJtBajxU6xxwA0XEV2tSOAzI4rZNYRgqyxTd3TwYKmHU+jMa/0tGE27Cl
         L0nDrdWQZIDeJRI6VUKp1MxoDbECDtR23sCBt+bz4n0Flutiz+1v/Gm1SmDIuuXU/fEg
         54cpiPmdm30+Br5DYbTuGzXiipLLHiAHC8hanoEGYb7pxl7HAWb2mqdnwcScTICpgCoq
         JVBArTUYTJjKtGO35Dqe9kAcKjEiF/7XkfpheEcLBkz49nEw4BBlpKTHbw4Q8llxwTaK
         Pm8A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=MaHL5t6V;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d10-20020a05620a136a00b00757718ce71fsi11191673qkl.205.2023.05.15.02.59.38
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 15 May 2023 02:59:38 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=MaHL5t6V;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pyUzQ-0007ma-3Q; Mon, 15 May 2023 05:59:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pyUzK-0007kt-Fb
 for qemu-arm@nongnu.org; Mon, 15 May 2023 05:59:30 -0400
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pyUzI-0007wZ-V0
 for qemu-arm@nongnu.org; Mon, 15 May 2023 05:59:30 -0400
Received: by mail-ed1-x531.google.com with SMTP id
 4fb4d7f45d1cf-50bc3088b7aso23297606a12.3
 for <qemu-arm@nongnu.org>; Mon, 15 May 2023 02:59:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1684144767; x=1686736767;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=CX8zFUszW8AhvqvMu4OZUAGHR5+xcJ1pj76LiJAMgHI=;
 b=MaHL5t6VdylrE1/2oGdZZN7GIw4M2KhDGMd3Hmf2i1MnVJ06FzP6mQI4XLVRSzJaBF
 I7f1pujiIN4Si8+Xl7NS7acClCDb9FFk2No7J+LsoP1XtQZC+kdZbhR7YSXeo5QigLzv
 /cI+3//J2aIbp9vD3Sxqk6nM+rAEsr4gp1IHsVe3h1OgAydArdhugi3jBN+xUviM8THy
 C8yAd85t0nK3gIAmqucoJts0TpCRmd2CxZnFG3q51+45HOLnEm+Uz/ij8BRY7Cb3VenD
 deqan0oWJl401usYR14h9k8yPS0tI/DTToiquNEwFbfMGwH4cZxU2dvMpeX6n2ZxFBsM
 4NGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684144767; x=1686736767;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=CX8zFUszW8AhvqvMu4OZUAGHR5+xcJ1pj76LiJAMgHI=;
 b=Jbgg3ZOI1/L9QYkg/gmviGq3OdvU/jd97Z1VQIBoqFuFeh6/XywVLKAjo+WaZr7qU7
 hd3vro+f+cwbOlmJNbv/L55RgqAm8Ta7lrx0G5pUFyoYI/utAmbMwoAR/0KnFAE+mUTZ
 auedCXJS3gBt7Mvz8QNyup1e1Veu3kG5RF4w9kg7fiZVfNI6eePYN5CfGWxs3V7tcGBe
 89pQ+rCcMJ94bKsNw501l1LY8VeVwFFqhBtOhAVKBJ4NekCfLZRM7IA9eyrI1OMB+rbz
 FbdwzaLbY6dWMhAESOfo20CLyqZNE9A4OcroLFflWCDsMgiX0yearve/iWHYqn34ogWu
 v2lQ==
X-Gm-Message-State: AC+VfDxJ04JUtBeMLwNNXXnxwWf0rj2vAIfHoeDiGSj9ls1E7LJuAxrF
 /EPStlsgkLInLouFrj9Vzxme0ve/1mzJRqK3b/3h7A==
X-Received: by 2002:aa7:cf95:0:b0:50b:c4f0:c200 with SMTP id
 z21-20020aa7cf95000000b0050bc4f0c200mr27128039edx.41.1684144767420; Mon, 15
 May 2023 02:59:27 -0700 (PDT)
MIME-Version: 1.0
References: <20230512093108.1180726-1-zenghao@kylinos.cn>
 <ZGHyvBb8BQdKhWEy@redhat.com>
 <e2d06c7a6528a16b6ae58360d49a1fc9c7e8ade5.camel@kylinos.cn>
In-Reply-To: <e2d06c7a6528a16b6ae58360d49a1fc9c7e8ade5.camel@kylinos.cn>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 15 May 2023 10:59:16 +0100
Message-ID: <CAFEAcA8fN-+FUJapo=+ObZgfrJW32ccFj22qvU92ndNzPLQ9Dw@mail.gmail.com>
Subject: Re: [PATCH V2] hw/arm: enable qxl for aarch64
To: Hao Zeng <zenghao@kylinos.cn>
Cc: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
 pbonzini@redhat.com, qemu-arm@nongnu.org, qemu-devel@nongnu.org, 
 Gerd Hoffmann <kraxel@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::531;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x531.google.com
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
X-TUID: A/vIi7jRJqiv

On Mon, 15 May 2023 at 10:57, Hao Zeng <zenghao@kylinos.cn> wrote:
>
>
> On Mon, 2023-05-15 at 09:52 +0100, Daniel P. Berrang=C3=A9 wrote:
> > Overall, IMHO, we should keep QXL restricted to as few build
> > scenarios
> > as possible. Given the status of SPICE, possibly we'll even want to
> > deprecate it on x86 eventually, not add it to more arches.
> >
> > What are you seeing as the compelling use case that requires QXL to
> > exist on aarch64 ?

>    Thank you for your answer, it made me learn a lot. No use case, just
> outside customer feedback on the ARM architecture qxl use has problems,
> I compiled the community qemu, found that the default does not support
> qxl display, so the submitted enablement.
>   I agree with you, please ignore this commit.

I would still like to know why QXL isn't automatically
enabled like every other PCI device...

-- PMM
