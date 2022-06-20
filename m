Received: by 2002:a19:2d51:0:0:0:0:0 with SMTP id t17csp333128lft;
        Mon, 20 Jun 2022 03:18:18 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1uSSC+wCak/+xgygaVuVS6/8qERiKKRjv53K8LEy6KqrsOQ2B2gojLTo6+SICaWiMC9emal
X-Received: by 2002:a05:6214:c85:b0:46b:afbe:1c3a with SMTP id r5-20020a0562140c8500b0046bafbe1c3amr18299931qvr.100.1655720298149;
        Mon, 20 Jun 2022 03:18:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1655720298; cv=none;
        d=google.com; s=arc-20160816;
        b=iu+9DBzZEZgZ3MkxMqK2+U0sWLNrkqjEQzQYogRwG6CzuAaAkbt7wc+eGjZQKamUrO
         eg0Ax5zVkcIi7PnrjoPRKRFZkDFtvj7v6TrOEKPRTIeXDacGJbZ0JzF4jzSU6MsM0nzc
         NYq851p70PRZbmE/a+o0OjtU0ge4z5ATdmAawwdcLSd9B0Wo6OPkkIDjK4WVcn7s1/8v
         tRbMBjm4uOzysYZFgVvmgvXn/5inlFFu8OM8XI4a4SDJ+0LJ59x/DNClCMFmDiVj/7ey
         C2p8fTgt+tuApFxmdJQBL40ACS+r2j7BRv7xWXXocuzHe/zGWtn9NeaCaC3jDYuJdjwL
         hRyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=eRmH9mDZym0wZHx18FHftuNWiUsP10FrjTqoQEdG4Ew=;
        b=xxEh5UzYTlswtWSNfCqgAIvG6Nxg6d+88w6BxfLMQawcYCSKfvDhVdu7wJWsHRQtS8
         QRlDELYnZ4F+NhJqncsf2DH+/HSFfzrfre+GGsmBnmmp+3KmvV0qc2DX47s9EftdQWXQ
         1h1f4H/GqbOhDoajfPMoJjAG2SlE+HpfFp16zLNVVPPHzZogjtgn02SE5xB9fxzvbUUH
         SeyvNYohaspYT8j2nvNEsPARIr6UnHj6bPA/VtCshT7HjeDWrqc05xx/pnQnuSZ/tVWM
         IygbGLp6YZVgiS5zgzsij/8JsV//ZzcecaObRN4PEM/gDP4lwcbQFWfGPpWxK0y1TKLx
         K1ag==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=kxNcm8W1;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c193-20020a379aca000000b0069f6d69fe47si7004588qke.304.2022.06.20.03.18.18
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 20 Jun 2022 03:18:18 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=kxNcm8W1;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:43298 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1o3EU5-0005aW-Lv
	for alex.bennee@linaro.org; Mon, 20 Jun 2022 06:18:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45870)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o3ETI-0005a9-Gr
 for qemu-arm@nongnu.org; Mon, 20 Jun 2022 06:17:28 -0400
Received: from mail-yw1-x1131.google.com ([2607:f8b0:4864:20::1131]:42895)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o3ETD-0007PE-Ja
 for qemu-arm@nongnu.org; Mon, 20 Jun 2022 06:17:27 -0400
Received: by mail-yw1-x1131.google.com with SMTP id
 00721157ae682-2ef5380669cso95178437b3.9
 for <qemu-arm@nongnu.org>; Mon, 20 Jun 2022 03:17:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=eRmH9mDZym0wZHx18FHftuNWiUsP10FrjTqoQEdG4Ew=;
 b=kxNcm8W10eAqh7KswqGySXdhRhMj8wIW43Ms064bVeRzcxpfgFL4tCSjOXt75jp/2C
 14LWTx0vPxjQCPy4uKQ4ZYYje18c3UAv3ymYmAkKAdBWnicokha5ZiRAdgrS9hVGTOym
 RbURb5oBD9cNdOnfstEQwbDFj4yzARLjWehSrjf3dGUGmCY5XO+Fp5+4I35vv9IN8u6T
 /W3daddJBxG7vdMNdtojDjAqWZCDQQUfESGYDms37/ZKqRLsRjsF0r2qdm8Bb+LTbOzH
 NpELk+ZtEQ9NZtYSmlT0+ugKeyzBwQ4PJEvaUxqF3LSksfhm5fQ31m5vdG5UdCncQAZ3
 EiXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=eRmH9mDZym0wZHx18FHftuNWiUsP10FrjTqoQEdG4Ew=;
 b=YOyGScfWova2JBfpJL5n1B18DmGU21uJqOfJs58ap82USlpJ0kYoHkIK/P26cAW65s
 vJP4GTN+ssiUynWEigTHDGVG8xVmb1xP7K418p8h92FTzMoSP9QyvoykPmQ08if8NVOr
 ClJbniZT9ufH9+ES2oeZZ2RvyvtCmsQrm31CzGnMEV4pOV4VDR41MnHLGFLkcUzBmEVs
 xNhF38tNsi/AacCvGgAx9x4Siymb1xOU5WpVOaSwy+KaTFAWrZ9UbiA60JWVGOb+LUrs
 pJqEDF9jkWjzz+cFNoYC1Aii+GrZM+jOOycBo6srd+eMhCCmfst5rk/ujEKMDrquacc5
 3JBQ==
X-Gm-Message-State: AJIora9BSFCm8bppeExihIiasI99cQWsKP6YtmgMwjKebDiOfqGyO6cG
 ibqvjK7vuSYqS7eC/BA1dsLUCXX7pyJJlE9xPwmUMQ==
X-Received: by 2002:a81:8d08:0:b0:317:a4cd:d65d with SMTP id
 d8-20020a818d08000000b00317a4cdd65dmr10603534ywg.329.1655720240763; Mon, 20
 Jun 2022 03:17:20 -0700 (PDT)
MIME-Version: 1.0
References: <20220522181836.864-1-mark.cave-ayland@ilande.co.uk>
 <20220522181836.864-46-mark.cave-ayland@ilande.co.uk>
 <CAFEAcA9CxLKNZzfvaoUFSRtykEymu23er+zj=7GA1V2nRtcU9A@mail.gmail.com>
 <939ffd58-3a89-ea5b-157d-d4a9bd4dffa4@ilande.co.uk>
 <a425db75-5636-8b29-26d2-9bef52c8eb25@ilande.co.uk>
In-Reply-To: <a425db75-5636-8b29-26d2-9bef52c8eb25@ilande.co.uk>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 20 Jun 2022 11:17:09 +0100
Message-ID: <CAFEAcA-F_v_S3TMbtQvboBCzg9OsXM3YZ-Bs6yVabTpE9_yJ5Q@mail.gmail.com>
Subject: Re: [PATCH 45/50] lasips2: use qdev gpio for output IRQ
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Cc: richard.henderson@linaro.org, deller@gmx.de, mst@redhat.com, 
 pbonzini@redhat.com, hpoussin@reactos.org, aleksandar.rikalo@syrmia.com, 
 f4bug@amsat.org, jiaxun.yang@flygoat.com, qemu-arm@nongnu.org, 
 qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1131;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1131.google.com
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
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: XHfWyo0D3flg

On Sat, 11 Jun 2022 at 16:44, Mark Cave-Ayland
<mark.cave-ayland@ilande.co.uk> wrote:
>
> On 10/06/2022 08:17, Mark Cave-Ayland wrote:
>
> > On 09/06/2022 12:18, Peter Maydell wrote:
> >> If you find yourself #defining names for IRQ lines then this is
> >> probably a sign you should be using named GPIO lines :-)
> >
> > Yeah that's something I've done a few times here, mainly to have just one "set IRQ"
> > function rather a separate one for both keyboard and mouse. It takes a bit more work,
> > but I can certainly separate them out.
>
> Looking at this again, the gpio being defined here actually is the (only) lasips2
> output IRQ, and so should be left unnamed.
>
> The reason for adding LASIPS2_IRQ was so that the gpio connection process looked like:
>
>      qdev_connect_gpio_out(dev, LASIPS2_IRQ, irq);
>
> instead of:
>
>      qdev_connect_gpio_out(dev, 0, irq);
>
> Would you still prefer for me to simply hardcode 0 here and drop the LASIPS2_IRQ
> define in this case since there is only one output IRQ?

Well, I think that "unnamed GPIO out" lines should be for
actual GPIO lines, ie on a GPIO controller or similar.
If you want an outbound IRQ line and don't want to name it,
that's what sysbus IRQ lines do. Otherwise, name the GPIO line.

thanks
-- PMM
