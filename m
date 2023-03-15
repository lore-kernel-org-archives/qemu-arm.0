Received: by 2002:a17:906:faca:b0:92b:dcda:f23e with SMTP id lu10csp1958813ejb;
        Tue, 14 Mar 2023 17:04:57 -0700 (PDT)
X-Google-Smtp-Source: AK7set8EifqIkg3Eb6fiI/hLIm9Wllzu02wP6izZdlrIy/ICGVC0CSM2Gk+BE2L2Bptn/2W+N0DC
X-Received: by 2002:a05:6214:27e8:b0:56a:cf18:599b with SMTP id jt8-20020a05621427e800b0056acf18599bmr25324443qvb.14.1678838696973;
        Tue, 14 Mar 2023 17:04:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1678838696; cv=none;
        d=google.com; s=arc-20160816;
        b=FWkopkAYUpsfRsqqvDPVUJAuueufSAlFxAWjn50YhcL5kRDmrmljPi592SN+3JBH02
         sEeOYIyA4SQnyW9hbFExvLeXvEJYZeT6vRxE1M2IjFf/eJG8ks+xdJUw1qL9fQiTMBAj
         WF0cOXofEgJ13Am+F8/cgfUD5fFfahXw26gwvtgvKgPSfMWQwZdlpSUgR8ox2W2bWeAv
         DBCvZp+Nbb2OPAcDEYQpDWGsditLbbU1TRM6wjjl7QIV6eK2g5qqKqfP0YnWxjJVLruv
         CriUlce7QK9ke1dXwKdaoKznrYupADXymPBVTMnGv9586UWa+sXNkF7pE1x0weiehAzb
         iMSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:cc:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=NnFTDsbDyWSoh9o8HgwIRBPGwj13AA7otJMiCy5q16Y=;
        b=wyAzkXScrvMx/1gTyolotHQAXzYEt8zoHCH8mFiet6utpGtCOppaCTNR+QLiU5k8IX
         jDOknwzPLzWFHIC/75ejCHqbB2lHPVwqdnKnsnFAeeAG4lRvqYBoF0yt7NC5RAR3tcZz
         62xG1di88N24k45bCxyzYLv7Gw9A8uji/4uEFEPY6MHSuSJa9Pua9Iubeyj89b55RLaB
         z/ru+nH06AWT5Lyj2+nm8/0Jrt2y122XSXjw2eI3vq5lSin0wPQjA+576ShO4oCmst6m
         Ym3LQ2yErbhYSBlKBqdp1p0EVmXFSdOoGztFE+bSiaOZNEx/E2Xn267pAfBv/VflqbBy
         /c1Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b=UNxmCq0B;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v22-20020a05620a441600b00745a42f8f14si3173169qkp.9.2023.03.14.17.04.56
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 14 Mar 2023 17:04:56 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b=UNxmCq0B;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pcEdE-0002fz-FV; Tue, 14 Mar 2023 20:04:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pcEdC-0002fH-Ay; Tue, 14 Mar 2023 20:04:38 -0400
Received: from mail-vs1-xe2e.google.com ([2607:f8b0:4864:20::e2e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pcEdA-0006yx-AX; Tue, 14 Mar 2023 20:04:37 -0400
Received: by mail-vs1-xe2e.google.com with SMTP id x14so15560761vso.9;
 Tue, 14 Mar 2023 17:04:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1678838675;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=NnFTDsbDyWSoh9o8HgwIRBPGwj13AA7otJMiCy5q16Y=;
 b=UNxmCq0BnYBDLToIM5ihMQnoBJjjVwaNTR/CRfnEmBremQrKBVDynKyeQd9YP9MlE4
 OEMnltE2jEkIz1ECzwUzTkWEbCRcuVUtJK7h/mRRdBXabqUF94whqLMgZBJOK3TSTdKs
 EZDHXm9+y8eFUyKBO2EUUGTpIZ+ukPeCY4fXJGW8ZC9wayyfANVsMG4x2XXegr+zwfX4
 SCJVcljchqCFwBPJapWbkRXh+em0H6o5MY2GAZCMU6O0lyJnWk5P92WwgWV3T2FF6wH9
 7yyFdgpk1qnpCc0DjOsjhMbBQtgv8v6pGUZj4LOkfBfjeLqyvaBLTcnw2tEP8cmv9MnU
 Ythg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678838675;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=NnFTDsbDyWSoh9o8HgwIRBPGwj13AA7otJMiCy5q16Y=;
 b=5TNQjWwnbBAce5eXTp10UiVkp9qff15iVdalnjLumRePQQxlgR76C9oLvL5qE8aN2Z
 e35y8aHFPyqLPK0W2zL2PH9t/2rUaoF+4QOiT7x6p/thTjljD4nXATiZ5gIHblLsQZf7
 OesPbybfZTfRh2uID5jAZ5/So8F7Sj0/hp+Wm2vM8JWkXHRAmgwnT157Js3/E15yjluG
 w87p+c2ie85HasgLa1X7BUIKV9a4pRlgkqnCw4u95tdqu83KJfM3bZzva0DvDCnsmI1k
 WmTB+M0vrVDLZQKFO92Z/dHZSVK5XXAi88Wt5iqWwAVXnwovLc3id2jb4bdPdAnu6MzM
 /Paw==
X-Gm-Message-State: AO0yUKWOne/DbSiFwpaDBJFRUWNOsLHxQ8Fib8znB5j9jbSSofL8lU3L
 EWSIH3RXhGenx1PELit6yR/jgbTt6KyQIaJqXTI=
X-Received: by 2002:a05:6102:3210:b0:425:87ab:c386 with SMTP id
 r16-20020a056102321000b0042587abc386mr5324122vsf.3.1678838674977; Tue, 14 Mar
 2023 17:04:34 -0700 (PDT)
MIME-Version: 1.0
References: <20230314170804.1196232-1-peter.maydell@linaro.org>
In-Reply-To: <20230314170804.1196232-1-peter.maydell@linaro.org>
From: Alistair Francis <alistair23@gmail.com>
Date: Wed, 15 Mar 2023 10:04:08 +1000
Message-ID: <CAKmqyKOP8wziEWnw2uPY3FZRO0g0gzCAkY6QgfMqvpaq_qirNQ@mail.gmail.com>
Subject: Re: [PATCH for-8.0] hw/char/cadence_uart: Fix guards on invalid
 BRGR/BDIV settings
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, 
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Alistair Francis <alistair@alistair23.me>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::e2e;
 envelope-from=alistair23@gmail.com; helo=mail-vs1-xe2e.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
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
X-TUID: I7BoI2XT4PRS

On Wed, Mar 15, 2023 at 3:09=E2=80=AFAM Peter Maydell <peter.maydell@linaro=
.org> wrote:
>
> The cadence UART attempts to avoid allowing the guset to set invalid
> baud rate register values in the uart_write() function.  However it
> does the "mask to the size of the register field" and "check for
> invalid values" in the wrong order, which means that a malicious
> guest can get a bogus value into the register by setting also some
> high bits in the value, and cause QEMU to crash by division-by-zero.
>
> Do the mask before the bounds check instead of afterwards.
>
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1493
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  hw/char/cadence_uart.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
>
> diff --git a/hw/char/cadence_uart.c b/hw/char/cadence_uart.c
> index c069a30842e..807e3985419 100644
> --- a/hw/char/cadence_uart.c
> +++ b/hw/char/cadence_uart.c
> @@ -450,13 +450,15 @@ static MemTxResult uart_write(void *opaque, hwaddr =
offset,
>          }
>          break;
>      case R_BRGR: /* Baud rate generator */
> +        value &=3D 0xffff;
>          if (value >=3D 0x01) {
> -            s->r[offset] =3D value & 0xFFFF;
> +            s->r[offset] =3D value;
>          }
>          break;
>      case R_BDIV:    /* Baud rate divider */
> +        value &=3D 0xff;
>          if (value >=3D 0x04) {
> -            s->r[offset] =3D value & 0xFF;
> +            s->r[offset] =3D value;
>          }
>          break;
>      default:
> --
> 2.34.1
>
>
