Received: by 2002:a19:e8d:0:0:0:0:0 with SMTP id 135csp257731lfo;
        Tue, 2 Feb 2021 08:25:31 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzE4cNiiVRGeUWr7XAx6PRsMQ04how+9Akl5E8tz/0E3k/mALxWlKNQ6GCTDOADrQaRN/5S
X-Received: by 2002:a25:2f55:: with SMTP id v82mr31362428ybv.481.1612283130932;
        Tue, 02 Feb 2021 08:25:30 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1612283130; cv=none;
        d=google.com; s=arc-20160816;
        b=zpF7CbsL4GD/2N15YzBbwOyyBiU2Zdx3A+gYzCXUtvY3ftgzCeGpaDRdkfCvj6D+oA
         TGQasDjNcDtPy/9TPl9SjVpJRIuWCSTEGLulSnQvbLLyAdcFHjc7ANu6lNe9ajjNUnL+
         woF1D/rehJCR+MQV/yndfL1jPUik/6h0hAuv7xt3Gb3zNfJMlzSpJj8lUrVVifeCzz7y
         LfzfaJyZwTDJtJz9Bb3vZGdAICmAu1w8WwyPQJ7ElMtyY06LSWDs0pien1gFIIktu94w
         6zRACdXyLwNeJOZGoI3z/oNFDbCETOV7qCNnoEjedJmE/pFZO9V2EQ5LtPd5F/ZI2r0G
         uY8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=yH8dRR3VCm4mhJ+0POYrTJGSGnzi4HESWi++Hlvr0Zo=;
        b=eFbb3bLUuqDoS1oDoJwUUVqwPxGiNHD8z118cAEGaORZmMZtlkDHr8v4MisOE7ntAo
         3RGLB82jjQr4bFJ60nxLS9OapHvE+CShP3kY+lV7QXHvgRwksVMLys8pSDhoWHzfgEV9
         UCjE+XiJxbIa3lX6BVJJNZZooXtdsiok8XAyMkXys/uhmfciPvilKucQJnGkhIissg2I
         1Fa60MNtQzeYKT3HQWB/4pnMFNWv6OMHBU+IeHWNQU3wVc1zAOs9uXDxN6d/q/EqLZi9
         CU9ieKB8glOL34SNLFo9pDpizHodzkV6iV4Y8XfTmIlsHc2gM4a03mTacvQaOhFta0gx
         gaFg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=c5fLv4wW;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n7si8784118ybf.437.2021.02.02.08.25.30
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 02 Feb 2021 08:25:30 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=c5fLv4wW;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:54686 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1l6yUb-0008TT-Nw
	for alex.bennee@linaro.org; Tue, 02 Feb 2021 11:25:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49020)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l6yMp-0003Zf-Dm
 for qemu-arm@nongnu.org; Tue, 02 Feb 2021 11:17:27 -0500
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635]:40341)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l6yMi-0003rb-Fx
 for qemu-arm@nongnu.org; Tue, 02 Feb 2021 11:17:27 -0500
Received: by mail-ej1-x635.google.com with SMTP id i8so14376494ejc.7
 for <qemu-arm@nongnu.org>; Tue, 02 Feb 2021 08:17:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=yH8dRR3VCm4mhJ+0POYrTJGSGnzi4HESWi++Hlvr0Zo=;
 b=c5fLv4wWUnTjH7tsgiNQPXlvyp/zxJPEydDvPi/ZXeu0l7zhsWxQIdTe2Ezi1gkU+r
 nABin2W0QyXKggS04GlhwDuk9HlkmE3Xjx4TtsOODLmMuP2FF40J+QOYu7mbw4+WHLae
 7yQj0EsQNPCki3i1vVRqE+pyqcituEX+77zhN9jEEGfxJjfjbhd9NUpsEA2+4xQjB4fF
 hD+ece70c28OrRH2zeXoXs3R4yT9zJVrdxnOpbYZ7quRMF3vYqkj7B1DN/N7VAtUxo55
 Qkx9/fYKzqJyAanBTEraJgWOilm/7C9BPqtkjA/pJEJNIccYAtTxsLNQ8GyWyN27O1ox
 jETA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=yH8dRR3VCm4mhJ+0POYrTJGSGnzi4HESWi++Hlvr0Zo=;
 b=DUqCIJbx/ivhODV9uYzP1N/Ki5o64FetKa8598SyEK0vmz1sNZi0+yMMUnWBYM6Ei7
 GjPHUK1irCqQ8TEk9mArYT5HTd3Ug+W0q9ioE/IfXAucwi94EXGaX/dfxTcJN6WV31EJ
 6zJpty0KoMZpIt4kr6+7c4rkKllqHwNVP+kmIX3fE7s6ymwkDHbc4EnVClNLZuD69wT9
 G4qyKj+S+oUJDGZJe1XFsy7EpvzotmFP7NQabIO8fzRzO8PnF1WtFIzzVj4XhKq5fQ8r
 uImaT2Z6seBI7WHXrkGpukK2U2qw0IQ8j0ErXsbOo67KQREjUs+O+ak8npnGGmkMEz4t
 0U8g==
X-Gm-Message-State: AOAM532I1I/BndDbf9BKvtxYC2h6/41N3Lu93vX8DpPt6k/x0azI8fL/
 Kc11QbpEtli5cdXpAoBTTlHvctbuj+885IRu1BMmwQ==
X-Received: by 2002:a17:906:1d51:: with SMTP id
 o17mr2536670ejh.85.1612282637068; 
 Tue, 02 Feb 2021 08:17:17 -0800 (PST)
MIME-Version: 1.0
References: <20210131164406.349825-1-f4bug@amsat.org>
 <20210131164406.349825-6-f4bug@amsat.org>
In-Reply-To: <20210131164406.349825-6-f4bug@amsat.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 2 Feb 2021 16:17:05 +0000
Message-ID: <CAFEAcA9x4mS2mtbf-+j34VKELYd_xhExR_0sndjQy64cmNLVkA@mail.gmail.com>
Subject: Re: [PATCH 5/5] target/arm: Restrict v7A TCG cpus to TCG accel
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::635;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x635.google.com
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
Cc: Thomas Huth <thuth@redhat.com>, qemu-arm <qemu-arm@nongnu.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: znOxyhKN/8Cd

On Sun, 31 Jan 2021 at 16:44, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>=
 wrote:
>
> KVM requires the target cpu to be at least ARMv8 architecture
> (support on ARMv7 has been dropped in commit 82bf7ae84ce:
> "target/arm: Remove KVM support for 32-bit Arm hosts").
>
> A KVM-only build won't be able to run TCG cpus, move the
> v7A CPU definitions to cpu_tcg.c.
>
> Reported-by: Peter Maydell <peter.maydell@linaro.org>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> ---

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
