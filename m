Received: by 2002:a19:2d51:0:0:0:0:0 with SMTP id t17csp3246133lft;
        Mon, 4 Jul 2022 06:56:29 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1tLOibcCNOPoyGgROwomOSIPeAZageNVnnH0a6MiFCyA6iEztua9fgqAjQ4sG8caO+PWEg6
X-Received: by 2002:a5b:641:0:b0:66e:4ba3:ef19 with SMTP id o1-20020a5b0641000000b0066e4ba3ef19mr5313054ybq.339.1656942989730;
        Mon, 04 Jul 2022 06:56:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1656942989; cv=none;
        d=google.com; s=arc-20160816;
        b=FbgvZAC8s1dk+X9LCBWB2mmPhK7Tbzpv/Ec/JoWsmaub9kNbqLWIlrmdWNuek8y454
         GgDKlgRpG6+kjtIezpcVjYSgJ2uEu62zq3QuybXlH2pTjOV7tWLl6W8CfASejl33xs4u
         MW8Hin1TRZVUbwC8SS6qqJEXuGjcoN7wry+8xwPLGLJ07tOen1utAyH+z7HsQ+9gbBk6
         OMZtW3jrGCgqMXQ9XTcYelssOgJh1ZsAnM2oe6b0gNPHtNrADlWrWTOTLY62e0RsFrUB
         ti/mIHpu3R6JOo1bBT+il44RW6ZxyXIbsawjpEgu3GyU490Na2vM7Qo/EbJrLcMHQy/J
         3RUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=5Q2P+8E47m3GIlksE1bE4n1doVP2Zf1UDt/MMOS4VhY=;
        b=xfzfgQs5Up+IhLtHlKPxOYFgEI0OcX9ZoCjk4a+f5UUWhzKi3sBbntjaMbqURgkIky
         SBS0IbNExR0YeXy1W8M96v+eHu+QIjv0k9pimS/DuOPD38IGvdylxn9yhsPcNdjPxc99
         owMI9Op5QUiCkBTA7+2b+nPvmglNNOv69OTa9Z9/DE20zJCWEZ34n+gsyJqYYC5+qa4h
         si86gRG61HX4aJMQpTZaxlMAB9DSDLC5IeCHIy20OYIMoVUpftvkrkzaY3Zu9edhyP6/
         juU7BmKnnjBIFadyUDS069+k/6uxGO5KvTz+HXQuCbvJtXzgkTemdkNwo+H4xQCzyjsE
         EcHQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=r88VlDhj;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id r145-20020a819a97000000b0031b89797326si36577313ywg.435.2022.07.04.06.56.29
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 04 Jul 2022 06:56:29 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=r88VlDhj;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:38462 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1o8MYv-0004k5-5D
	for alex.bennee@linaro.org; Mon, 04 Jul 2022 09:56:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39616)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o8MGX-0006Ko-49
 for qemu-arm@nongnu.org; Mon, 04 Jul 2022 09:37:29 -0400
Received: from mail-yw1-x1135.google.com ([2607:f8b0:4864:20::1135]:35772)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o8MGU-0005tI-MV
 for qemu-arm@nongnu.org; Mon, 04 Jul 2022 09:37:28 -0400
Received: by mail-yw1-x1135.google.com with SMTP id
 00721157ae682-31cac89d8d6so12814787b3.2
 for <qemu-arm@nongnu.org>; Mon, 04 Jul 2022 06:37:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=5Q2P+8E47m3GIlksE1bE4n1doVP2Zf1UDt/MMOS4VhY=;
 b=r88VlDhj91YqS1b1MGPrYzUQuiTVAG1F0iDSE81cvC88j/Kzho8yc+U/pvUpPZ9c8x
 1wuFwMFsQHhb3xY+ht0lzdaPFdzJ4Tlq9FaFB7T3/DhU79XbvubgaaDvJRfMo8rALOkg
 sBG2FVIw5z3I0Gn25h8FzB2SIqGCJX2has0i2x/znN7jsM2va0ig0XlySzrHK5/4Mez9
 7cQoS2aoq2JGxH60s1gWjTRvfxKzEDYQFEC449seqoZAyxNADLxuux4WV1ugclvdp/Cb
 MMrVvbNcD5838bdKEfsnn1zBxxk71zzTsAsQIsQ7DX/OhjMtesWyipPbMhgxqB8PFy/D
 bhow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=5Q2P+8E47m3GIlksE1bE4n1doVP2Zf1UDt/MMOS4VhY=;
 b=uPo/oHajm6AIXsvFCz8xLhsHFht9jVDYWil+GQUNf/XBaB8aVNGyfB3+1u3dxjbCV6
 JBf+rDqKR5wqgThtrm90uXoytjsLWqh026BES1ySrr1dmENMETP5yS7gRDSsB9sFbCXW
 txTfPt8qmripz4Ufy5XV5R9MhY0s483LMHX0IRObWM4s8RCA8C/ivMdPSOJKShnEBBhy
 s9MawXr854GEmq34bHwI3tOXRzStXXb+d0UGhl8yB+DpJJWa4cau1iuYVOemmufRru4t
 IY9kVE8Q5lqVIw2KUialUvh4vNLQSrDS9I0SIA4/SHESh/NLgJdvpPTXUon1Acr5au+f
 76mA==
X-Gm-Message-State: AJIora8SiNLQrCcTpkpFCo35VASJLyORedqY83qmzf5wAm1DWUppDoi+
 Mb3vkZpp39MlTEqZ2ySj1CXno8Zb5nTgCeZ899ahrw==
X-Received: by 2002:a81:8d08:0:b0:317:a4cd:d65d with SMTP id
 d8-20020a818d08000000b00317a4cdd65dmr32490493ywg.329.1656941845844; Mon, 04
 Jul 2022 06:37:25 -0700 (PDT)
MIME-Version: 1.0
References: <20220629124026.1077021-1-mark.cave-ayland@ilande.co.uk>
 <20220629124026.1077021-38-mark.cave-ayland@ilande.co.uk>
In-Reply-To: <20220629124026.1077021-38-mark.cave-ayland@ilande.co.uk>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 4 Jul 2022 14:37:15 +0100
Message-ID: <CAFEAcA_9_BwTnMnVwx-NH55TyipcvX6uRbOTDe+Sh=QyesNSWg@mail.gmail.com>
Subject: Re: [PATCH 37/40] ps2: remove unused legacy ps2_kbd_init() function
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Cc: richard.henderson@linaro.org, deller@gmx.de, svens@stackframe.org, 
 mst@redhat.com, pbonzini@redhat.com, hpoussin@reactos.org, 
 aleksandar.rikalo@syrmia.com, f4bug@amsat.org, qemu-devel@nongnu.org, 
 qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1135;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1135.google.com
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
X-TUID: naUF/kOrwCvC

On Wed, 29 Jun 2022 at 13:41, Mark Cave-Ayland
<mark.cave-ayland@ilande.co.uk> wrote:
>
> Now that the legacy ps2_kbd_init() function is no longer used, it can be completely
> removed along with its associated trace-event.
>
> Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
