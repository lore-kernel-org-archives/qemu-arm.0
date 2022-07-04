Received: by 2002:a19:2d51:0:0:0:0:0 with SMTP id t17csp3257539lft;
        Mon, 4 Jul 2022 07:11:52 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1sOu5PqRAVbcD948uLAdrc/u5Hoy3ieWU09MX5sFwy92X9c2vqzkTEdhSBQIuIEdasXV3g/
X-Received: by 2002:a81:1756:0:b0:31c:a0a9:25c8 with SMTP id 83-20020a811756000000b0031ca0a925c8mr4035050ywx.287.1656943912752;
        Mon, 04 Jul 2022 07:11:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1656943912; cv=none;
        d=google.com; s=arc-20160816;
        b=uE3qm3QkeTVctYocfq/Ch83ZjQY+czDcZAy/UilpH9qgLDfoGguWZ2yPLnYTRY9HvV
         Zxr4RPXpZMbReV/FgGQvMcTLk2ozkYHpQA8Hy66PvI9fSfRGPFXwmyFJaZVuvtX1pd2J
         pVtCob6Sducv+oAlt1blSufzUm132lL8JjYYIqq0CJtKdl/uTgzoBPDgtdc0OrzaiFGa
         F98U/Kcys1Le98VHSXPts0AJRHhTK50czfsP4WythYxaaYoVR8sG9Tepc9CKStFaEn6z
         xD5CCuDocJc5FvLGZu1ZrdK8o/PMHGyxASpJDHqX+AngmZU+uIscN28hORb5MxOVwjYw
         AlKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=X4lHGWh3OHxHcF8ox67D/rNo02GcKVnustW8Jg6Fa8E=;
        b=U/Thxbl/mxmz515nJiT6arjcLgo9orc38Uc7M4jAmZTs9/X/HgrnKMfVRqU5gWTtI4
         WPWspkSwrxu56DOPcTaTJ+nYRV9vYbr8Ku9fRZ59k9sLIx6g4IrOr4d9eMk7AvFf4qe1
         XhsFz1sNleCTaJ93hTSrjoUBBRlNYkwOHrwclqNYtN2MxX19qcM32S4wRw+LmaIIry83
         62V78FMElvwZxyS3IK1dTbTStclDIOM8AqTWvPAy6BgIrMlmAGfqAfYdk6KLpXdl51yx
         ecTEoenhfCiMnSfcvNb5ZKExOL9F+sdg4Av6AWtVcEDKqI/5aHbKfNQtGJLXO6i5t0Ew
         QMVg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=hySmIyod;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d187-20020a251dc4000000b0066e33d34a08si7019957ybd.568.2022.07.04.07.11.52
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 04 Jul 2022 07:11:52 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=hySmIyod;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:46058 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1o8Mno-0004YP-4b
	for alex.bennee@linaro.org; Mon, 04 Jul 2022 10:11:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36732)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o8M3I-0000Ft-NE
 for qemu-arm@nongnu.org; Mon, 04 Jul 2022 09:23:48 -0400
Received: from mail-yb1-xb30.google.com ([2607:f8b0:4864:20::b30]:38885)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o8M3G-0003Ce-BD
 for qemu-arm@nongnu.org; Mon, 04 Jul 2022 09:23:47 -0400
Received: by mail-yb1-xb30.google.com with SMTP id l144so4377735ybl.5
 for <qemu-arm@nongnu.org>; Mon, 04 Jul 2022 06:23:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=X4lHGWh3OHxHcF8ox67D/rNo02GcKVnustW8Jg6Fa8E=;
 b=hySmIyodHN7QsqmdtyIs5JTrlVRJoEBhlM2ivuxaS7OGMU9bXDvywod4B0+VHF2Je6
 BzyiaePD60ovY+CsjXCU80FyJdBhy4TOlzns2eBDXGWD5XgENIBQnBKuU2y3ygpQ/zG/
 2ygChMf6CjyFOAJmslBbGNS7oSDAJ5uTnD4CnOlwg+TjYoZS570FLK6aNx6iMvJovgyS
 OtM14a7nLwRst1znsVJD7CwggEM99jTTMLb85QxFXmVHWlxxDh/NYvYNhJoY1fBOUg04
 BJbwdtcrN6JFBogQl+vUYl2M8qM1jcNHGAdo+pic6OIv4yho6CQKgEHKh/Fq3DTkfhM1
 DWqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=X4lHGWh3OHxHcF8ox67D/rNo02GcKVnustW8Jg6Fa8E=;
 b=lywPeqIg/3skcc1zp4/FatqCEaanJVRv6iP/q2l/jbDKSaPTVvyyMog0hLlta9xQwI
 XndXQUULFA/vjTVAx7pqZSR1YAh5j4Zm8YcrcGRVe7Bwuww6fgC0kTRN0Is2XXzgn1mH
 wFGcOEAVQhqhqY4ACmefOqR0A8etjwVTHcWr+A3X1SomGjTSFC++/WcAI7Y4CfyKStzs
 ZnBxPCWiCsbL0UGuikb1DP37du0Gbo6U6LExdUmSC71JPpoMQi6etZSQ7PPN8YJJP9uo
 srV0/bqRvcyvgKKXH0zgtQN/FoLGKfSO5FHboKrApzJPvIY5DDsi3472oZdPZkpz51Qk
 3ndg==
X-Gm-Message-State: AJIora9OGQmZ6b30y0gAwYKoqEFhpOAaZMAZDt6w43h6357C1PXsREm1
 DT+L66UImKtZOuhRvCEZyx+IJxnA7V2W8x0fIR5OPA==
X-Received: by 2002:a25:6b48:0:b0:66e:3703:7df2 with SMTP id
 o8-20020a256b48000000b0066e37037df2mr9093342ybm.193.1656941024999; Mon, 04
 Jul 2022 06:23:44 -0700 (PDT)
MIME-Version: 1.0
References: <20220629124026.1077021-1-mark.cave-ayland@ilande.co.uk>
 <20220629124026.1077021-19-mark.cave-ayland@ilande.co.uk>
In-Reply-To: <20220629124026.1077021-19-mark.cave-ayland@ilande.co.uk>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 4 Jul 2022 14:23:34 +0100
Message-ID: <CAFEAcA8q5K3==Eoo=ZyNL-3-DmyLbWe5TmFJ=bCmgkusiePV4Q@mail.gmail.com>
Subject: Re: [PATCH 18/40] lasips2: introduce new LASIPS2_MOUSE_PORT QOM type
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Cc: richard.henderson@linaro.org, deller@gmx.de, svens@stackframe.org, 
 mst@redhat.com, pbonzini@redhat.com, hpoussin@reactos.org, 
 aleksandar.rikalo@syrmia.com, f4bug@amsat.org, qemu-devel@nongnu.org, 
 qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b30;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb30.google.com
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
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: my5yKC32I3ui

On Wed, 29 Jun 2022 at 13:41, Mark Cave-Ayland
<mark.cave-ayland@ilande.co.uk> wrote:
>
> This will be soon be used to hold the underlying PS2_MOUSE_DEVICE object.
>
> Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>


Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
