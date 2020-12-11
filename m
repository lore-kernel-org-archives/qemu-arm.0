Received: by 2002:ac2:4c03:0:0:0:0:0 with SMTP id t3csp206885lfq;
        Fri, 11 Dec 2020 07:56:47 -0800 (PST)
X-Google-Smtp-Source: ABdhPJy3h6NpKw1ZVQk9Bn9lHv+9xIC8tkVyE091VSbDEHRW0hG6y7gnq8sO+fVqvmChteFzLVKR
X-Received: by 2002:a25:34cf:: with SMTP id b198mr19833660yba.283.1607702206974;
        Fri, 11 Dec 2020 07:56:46 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1607702206; cv=none;
        d=google.com; s=arc-20160816;
        b=iUAwWTKHeVWNEZVUFwa6go1peBk+YcyhReJ1s1KFBLfF6F8br4ysfq6g8r6ZqptOEv
         m8bu0CDIlh4shkyGNW+flGZg7djIR76gAHERY06VKboBT2h5aTyoDkkbJZMbQDP089NL
         3KvX79mIylporgj7FARudA0ICPg/mqeQTIAoY7Z2izQlbvL4/+DpPlPIeVj4ytT2IbVb
         0mKO2a/CsTsrcqHmJTt/VutA6q8oqOS1PbCvjDSLpRHrW3wfqfNY59eZj2HPJ5C3KAFU
         OUiGrHfsB3bJAHCXufvZlty14BmqUUCk/iLvBqL0rDXw/6CwLbxBcb5grAPfo6gnDUhy
         P09g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=o8HS7+IP4fCB/697KrqbToVlY2QnDh2aRoTVegTOLog=;
        b=kUqYqKR9LZu6AE6DUJdCZjUrAEY1V491asZGSGFNvvfU3NAagpND5h8qj0r3Gsz1z8
         B2blMzdkXionBgX7XQAp7pM3KQNqLjyOoGuZij3kdeNqMYKvNT10meH3+ms31NTypFv+
         O+/a49ufPSR3865RMey0OX+h031/nx19l4tGDTyNSts5q39Zb0EwJ8k8hG9B5mlaJ+2x
         xhnFbHQ1r09I01I089Fs0VdJ60ZGK4R48w9iSHV0PjwDNKiJXGuipLccZRSHgZNJar32
         byJgkq8s3zO5JcrGBxoDu8KOByXLsXvyS3V84lGIhXw00FzJ8ifv2xvNs/YXG83On4FU
         uHBw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=QUQsmgL+;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w185si8489075yba.217.2020.12.11.07.56.46
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 11 Dec 2020 07:56:46 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=QUQsmgL+;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:38630 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1knkmk-0005j9-DG
	for alex.bennee@linaro.org; Fri, 11 Dec 2020 10:56:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59722)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1knkfD-0004bt-JN
 for qemu-arm@nongnu.org; Fri, 11 Dec 2020 10:48:59 -0500
Received: from mail-ej1-x642.google.com ([2a00:1450:4864:20::642]:45124)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1knkfA-0005sZ-OI
 for qemu-arm@nongnu.org; Fri, 11 Dec 2020 10:48:59 -0500
Received: by mail-ej1-x642.google.com with SMTP id qw4so12924622ejb.12
 for <qemu-arm@nongnu.org>; Fri, 11 Dec 2020 07:48:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=o8HS7+IP4fCB/697KrqbToVlY2QnDh2aRoTVegTOLog=;
 b=QUQsmgL+aM1wJcvfqUNVi78K3d7Ize+HqhM66f7EyCvdpm7bzNyNYk/aEihuwyc2BB
 F0FboP7o9rZ7TbE4H6vjUSD45Wf1iNL3CMwo8h5gZRboMEIHZN+Fsf3WRW6bCMBZujdm
 e4xVyGjoHF3Ph8xIT6rVbVYXDb8yhJ6pwOxSZGaHcepIRtbcszHfMo7ZaIX1BUAAtvlC
 THHH7px41KXU/zo7KEuzaxZ2raW1xFZDfthi8NMbmgPlCgizwBUAO536laA7Cz/L5CWu
 00YUJpQsfF8qCfvoNoWNQrZEPbXy4gyV6HdYPR4NPbeGfKDYHQ6jbnwd9/GxmpgZS3uF
 OK0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=o8HS7+IP4fCB/697KrqbToVlY2QnDh2aRoTVegTOLog=;
 b=j5AH3ddp9G0nkbVFCw2L0BRWunyN1avPDUQElOpckxIt1F+Xf853VR5JBmnf/Hwarj
 UDNuMO8vP3b3r78UgDw3GNJegc2nBlx0rvKEFvwwNdn8wTf4SNTCoIXpShJYeVSc84tb
 WP3NOdjig93oQu+JsG+Xhr83Y5iiQ9uCO0LDduTWfJf1MbnANEe3NoMMiI4ewBiQ2J/3
 sEykxMf0ELP9wzr6DaRXw9vNAwXpWeZ4AgEq4zcr0iBMMll6bW5d7+uqRxFYTp/Fm7pV
 2+jbV7OdrUzWIxIFENuWOWrs8NqxYChvyWRj2wOKXQDfY0ITiNuH7VklRqqXyz9ic5+X
 nMdw==
X-Gm-Message-State: AOAM532/D3OB0nQk+Fmv2Any3l/vdjFfLhpKPtRnCumUC01gOEe8Bo74
 2m+ktB/8+qwHJ+DVIRxL5ey3xOz/f1xSzthCfbc3uQ==
X-Received: by 2002:a17:906:1151:: with SMTP id
 i17mr11784274eja.250.1607701732526; 
 Fri, 11 Dec 2020 07:48:52 -0800 (PST)
MIME-Version: 1.0
References: <20201211154605.511714-1-f4bug@amsat.org>
In-Reply-To: <20201211154605.511714-1-f4bug@amsat.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 11 Dec 2020 15:48:41 +0000
Message-ID: <CAFEAcA-uv+5yoPNRDY0n69Amhqi_LiamVoBAP-Ui7yD1gGXYWQ@mail.gmail.com>
Subject: Re: [PATCH] hw/rtc/twl92230: Add missing 'break'
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::642;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x642.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: QEMU Trivial <qemu-trivial@nongnu.org>, Thomas Huth <thuth@redhat.com>,
 qemu-arm <qemu-arm@nongnu.org>, Andrzej Zaborowski <balrogg@gmail.com>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: /np8ODKMkvwM

On Fri, 11 Dec 2020 at 15:46, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>=
 wrote:
>
> Add missing 'break' to fix:
>
>   hw/rtc/twl92230.c: In function =E2=80=98menelaus_write=E2=80=99:
>   hw/rtc/twl92230.c:713:5: error: label at end of compound statement
>     713 |     default:
>         |     ^~~~~~~
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> ---
> I noticed Thomas "Compile QEMU with -Wimplicit-fallthrough" series
> and remembered this old patch.
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> ---
>  hw/rtc/twl92230.c | 1 +
>  1 file changed, 1 insertion(+)

I guess the compiler doesn't care about missing 'break' in
the last case in a switch statement. But I think putting in
the 'break' is better style anyway.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
