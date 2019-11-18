Received: by 2002:a19:fc0b:0:0:0:0:0 with SMTP id a11csp119027lfi;
        Mon, 18 Nov 2019 06:33:17 -0800 (PST)
X-Google-Smtp-Source: APXvYqzPnrvtONtDCXOECNTAv4182F+fXHOhqS7Hcg/uGUehGigG+Nz8N9umAbw16W2/TbwcXNZF
X-Received: by 2002:ad4:55ef:: with SMTP id bu15mr25646682qvb.244.1574087596750;
        Mon, 18 Nov 2019 06:33:16 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1574087596; cv=none;
        d=google.com; s=arc-20160816;
        b=nDy18pUdX4kgWYi1zPsh/snH3VRiSR+0IdlWPLAq8E2p6HvU9aPA0HMB6Qo2Od+gb3
         ymn7zVTzsKmmJ/P86okK6eeHnJmqza+IYNkfvtxbkOYh3FYAR8+jkNUcDBv9/dp9fZmM
         mYruM76Glcb93iunBBE5HCAES+heCcCe7GrmE5c6BGcPfrzmg54Jfv4cT77C2yqNthGi
         tqjW1bCmzxEfMDAhcC6LXlhe/eGoLdogipapTlrTX4+OHY2EwIJHKPvRTBXQxPxP5yQi
         V18TAzkFY2Iu31am2uSOvVhYumN2NgWsHmLgUgVmKE7aOLlrgcqYbdPw+spohWA+qDW+
         h/cQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=D8MMoACI2h95QiXucMFmC2Ks9gfXSKg5zeZKiGuN6VM=;
        b=UAC/S2iBWdiQqjHMs55PorKaVtYeYvuNLhvPC/zMkCOD4hsDQjE81vJeuZLneOT2Ee
         x8c01e2oxN2AjgpCD2bqh1Sbo0aegMulGxtgGk/vYy9+pVGgt5JpzH2q7jEip2v1qZl3
         d1wo55q2sOXEh81IYXqpVCtzRdxz5VNaNWDm6Q6yKFIH3KfG91z11GWLajQ54bzrzI3A
         BcfRtLSCQTylxCkYqJVLZyY2h6U5Ax42oMGvuxp0z1pOzQ31Z5BupM/M43XbZrdrp4pD
         MAfH4XX9myXPriHzJHbVOLcniq7uRpNuKV3EisrQAWAi5WjUTJJxOv9EJPL6paSA9bvp
         U8yg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=rKq1TFPH;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v34si11498421qtb.320.2019.11.18.06.33.16
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 18 Nov 2019 06:33:16 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=rKq1TFPH;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:34942 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iWi5b-000423-QH
	for alex.bennee@linaro.org; Mon, 18 Nov 2019 09:33:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57353)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1iWi5N-0003zO-TE
 for qemu-arm@nongnu.org; Mon, 18 Nov 2019 09:33:02 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1iWi5M-0000Dm-MU
 for qemu-arm@nongnu.org; Mon, 18 Nov 2019 09:33:01 -0500
Received: from mail-ot1-x344.google.com ([2607:f8b0:4864:20::344]:41038)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1iWi5M-0000DR-HW
 for qemu-arm@nongnu.org; Mon, 18 Nov 2019 09:33:00 -0500
Received: by mail-ot1-x344.google.com with SMTP id 94so14646809oty.8
 for <qemu-arm@nongnu.org>; Mon, 18 Nov 2019 06:33:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=D8MMoACI2h95QiXucMFmC2Ks9gfXSKg5zeZKiGuN6VM=;
 b=rKq1TFPHb2ruVmAaTrr1aFJRwQ4Nq4xM2ygl7zwXqgdVohFvYXpKlTVEDTVCMZJheQ
 IK8f3cH4eOyjyqs3un1e/Zkok7CNXBI8K0deBnSyBpYGA+ev0+2WfGAigA7HUMfmHpyG
 jkVi7Wmwgz1FtaFkvvuewSf0bmt+JtaJ4mOUp1xqALZqqVMylWJj/iDn7rKwxUUFg6B3
 msC3Q6Y5YBp2m81NzAburqWX488EZ2gWlMhKp1J/2b6l/+RA9OcvlwdWmH/7SOQZ0lbd
 Yg1BKPoNLSoOq9742DyyOIJTe+OEWjJeo+nWJ7gRxDESxoGsrULmZhD9SrqEoUWCB6/3
 rAtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=D8MMoACI2h95QiXucMFmC2Ks9gfXSKg5zeZKiGuN6VM=;
 b=aLuSpdm48e0YuZuzTYej0cRA7ACNtLaQxsnrIoKzdrSl4JNliGfyI+IMdedlv72OKA
 WlRJEOrCgRh/YR8raN4FR+0YsB1oZCEvvzkINS11WD4Y10R74VwB3MXeWthRHjM/JdKC
 KgZFQayB/DEiSP84O34DGgPrO0hf8uZEgWaO3xF21QwLJA/Pm3KaDWixPmHccSL4w29k
 bTd52DG6fAoAMW1ukpZxcdtzTDWy7JsfgcrXGexWfvolIvM5xKKy3zrMw+ioapmeIlZp
 w2CcgVxTyITIiKRp0hyesCWrCmjMmQKPvNdtOqbqgeZwIGGTNDUph32X3JY0BIlWmRk4
 jpCQ==
X-Gm-Message-State: APjAAAUcEwlNidWRlfj5C9RzASrcMDRUlscExjYgr9vj6hePDJvObrsg
 /JV4ITe8S0Pj9gG7whwfNJcq4E278KfubSMUBNUb3g==
X-Received: by 2002:a9d:68cc:: with SMTP id i12mr50084oto.97.1574087579727;
 Mon, 18 Nov 2019 06:32:59 -0800 (PST)
MIME-Version: 1.0
References: <20191023173154.30051-1-marcandre.lureau@redhat.com>
 <20191023173154.30051-13-marcandre.lureau@redhat.com>
In-Reply-To: <20191023173154.30051-13-marcandre.lureau@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 18 Nov 2019 14:32:47 +0000
Message-ID: <CAFEAcA9knQhHCjzU8JJ3YB7H7iR=uhn_a_6FxMMyDSNE_yA3cg@mail.gmail.com>
Subject: Re: [PATCH v3 12/33] serial: replace serial_exit_core() with unrealize
To: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::344
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
Cc: Corey Minyard <cminyard@mvista.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Jason Wang <jasowang@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 QEMU Developers <qemu-devel@nongnu.org>, BALATON Zoltan <balaton@eik.bme.hu>,
 KONRAD Frederic <frederic.konrad@adacore.com>,
 Paul Burton <pburton@wavecomp.com>, Magnus Damm <magnus.damm@gmail.com>,
 =?UTF-8?Q?Herv=C3=A9_Poussineau?= <hpoussin@reactos.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Artyom Tarasenko <atar4qemu@gmail.com>, Eduardo Habkost <ehabkost@redhat.com>,
 Fabien Chouteau <chouteau@adacore.com>, qemu-arm <qemu-arm@nongnu.org>,
 Richard Henderson <rth@twiddle.net>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 qemu-ppc <qemu-ppc@nongnu.org>, Aleksandar Markovic <amarkovic@wavecomp.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 77IzpH2Ui/SU

On Wed, 23 Oct 2019 at 18:33, Marc-Andr=C3=A9 Lureau
<marcandre.lureau@redhat.com> wrote:
>
> Instead of calling serial_exit_core() directly, use the QDev unrealize
> callback.
>
> Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> ---

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
