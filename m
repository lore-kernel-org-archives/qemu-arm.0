Received: by 2002:a5d:51d0:0:0:0:0:0 with SMTP id n16csp6695760wrv;
        Wed, 7 Aug 2019 08:34:18 -0700 (PDT)
X-Google-Smtp-Source: APXvYqyiK7L/O5W/tuePIWmqk+B6W0n+sZNE6wSvF/TKoNsWSfLlk6Kz1xFV0DuvO2H1+K0Mi0eG
X-Received: by 2002:a0c:ba0b:: with SMTP id w11mr8635115qvf.71.1565192057987;
        Wed, 07 Aug 2019 08:34:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1565192057; cv=none;
        d=google.com; s=arc-20160816;
        b=MxvHystBuTjjN4Ea5Ge+TxLvTOieSLw8vPVfpJmYH6E6dmDe4k+S0xA00y0HQqNPdx
         n30rAthIUfiyICYLe3o58nhq37cmkMjR5BiktfIjy93F5hVLuhl2v2MphAIBlu5H6yyC
         Wy4uBHPj4hC/GS5dzXyLugU1hVa3/2NCRz8e5rx5mJp+Nqz0OsXeMr5kZmXP3EA0Db/J
         1FMW8JoANujE4lFag54iz/9HCTzuGPnVfCCBGeo2oTcFhKr30MkDx8kUGduDmPtwdJzS
         Tr9hopAwjElcMAOnLndyhNT7HpMY+p7HeRgKEIRcXHkEsy5HDv+1F8p4x2M0Ty5WlWo8
         P2KA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:to:message-id:date:from:in-reply-to
         :references:mime-version:dkim-signature;
        bh=Km1xqJmdFW3OmzGAQbZzLGpRXzZpw3vkLbE5a8lCoQg=;
        b=XW2Yh7qbkJzQHto8GJLEtYq0LJBtJwaHfSy56qCOa7LQuu0eLLaijhTbJlSvD95tjQ
         yQPRISEVxuNgH0tcVJxaESNP1yJm17HYZ6UFnG0Xbwmj/2uuVioDIuwbfT/KX+LKTNQ5
         ke5TMfCRga5Hqr1Ty9ygfQl/wclDxhSugGA+TWMYmiT3QEAgF/xcF75cgT6YJFhqadkQ
         kU/DqRV5z/3UGqwBGuSYuH+UNmcARVD3GCkoDu8FlxapWslisZl0TEdfPCMXoGVikEtC
         ML+DXeH9tqnkTP7t35SOghe2ZgpcOYUdVQ2tnCoQpdx+MPap7CNod7SjfTQtTBl0tSjh
         EjMw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=C5Udf9Gu;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m8si2746973qkk.18.2019.08.07.08.34.17
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 07 Aug 2019 08:34:17 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=C5Udf9Gu;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:42676 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hvNxB-0008Jz-GJ
	for alex.bennee@linaro.org; Wed, 07 Aug 2019 11:34:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55598)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <peter.maydell@linaro.org>) id 1hvNwn-000850-Tk
 for qemu-arm@nongnu.org; Wed, 07 Aug 2019 11:33:55 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1hvNwm-0006TX-SV
 for qemu-arm@nongnu.org; Wed, 07 Aug 2019 11:33:53 -0400
Received: from mail-ot1-x344.google.com ([2607:f8b0:4864:20::344]:37753)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1hvNwm-0006S5-O4
 for qemu-arm@nongnu.org; Wed, 07 Aug 2019 11:33:52 -0400
Received: by mail-ot1-x344.google.com with SMTP id s20so40449547otp.4
 for <qemu-arm@nongnu.org>; Wed, 07 Aug 2019 08:33:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=Km1xqJmdFW3OmzGAQbZzLGpRXzZpw3vkLbE5a8lCoQg=;
 b=C5Udf9GuRBRV9n77JWc9KP4oOujE279iNEHBUnZ0uKtF724gmmGzGOrDd1eMYlQrLR
 B8VBstYLSDyTGQZvaxj69A2BLTE2eABTLi0BOsf+XI2P5nd12HNDCWmJAhxW5zsjAj08
 FuEU5ybtm/TP4/kLpFtZh1HE4YKvb3E/cTa4bn87Jq09whwcEwZhymqgnfhsw6+kheQY
 F/vuWKIdd05rE5UVn86IR+DXNba9qu54By514OnUcspUH9TTV4wKPbPCRsAPjTzq2r3y
 vPslfrJ8E1hclqT6TSh56/G382xPQGuOSyerxFJOZGUEuZnwpg5zCDiENGzrerf7fnqK
 u+7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=Km1xqJmdFW3OmzGAQbZzLGpRXzZpw3vkLbE5a8lCoQg=;
 b=mC9KjLVqFf+KjXLXg0mY7AstgmLNQ0/lWxgloIXcHFu61TdAidJlZgoGpCd9Z0k4b0
 FSActy/mprh5GQF3BqBwVpem1fxgb8YYOf0StfEnImjdZma00HIrONpoJnOEK1y23h77
 lpHVtfBlZo9/mwKBI0oOfoPtwyQbmcOpr6rgXv7ouUkuLkLQ0LQQaLMwRxA4CSObeG2K
 iN/IBzvphvihLut6zN3XSCXFjJshljVpwCrfYZzuOn9tu00/VCYplHftOv7a8knc6CRL
 4z7MEoQ0xp1LMvBcWSax+PDfmtrEawLXsWo3Nnv6TOvsStST569DtR58lJED3FhD1giG
 dv3Q==
X-Gm-Message-State: APjAAAV5TpuZENDqq2EQdJ1oqu90QI1t+Uums5908Eua2wpHacbaW78w
 utWjrbnV6vHiD9r2sWQbnMezTavDU74utCCBF0zBGg==
X-Received: by 2002:a5e:db0a:: with SMTP id q10mr769271iop.168.1565192031536; 
 Wed, 07 Aug 2019 08:33:51 -0700 (PDT)
MIME-Version: 1.0
References: <20190729145654.14644-1-damien.hedde@greensocs.com>
 <20190729145654.14644-30-damien.hedde@greensocs.com>
In-Reply-To: <20190729145654.14644-30-damien.hedde@greensocs.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 7 Aug 2019 16:33:40 +0100
Message-ID: <CAFEAcA-Fr=wGXN5Oeh14gOMgdVDGBa3Lzpj6QNxrRpcJytwELA@mail.gmail.com>
To: Damien Hedde <damien.hedde@greensocs.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::344
Subject: Re: [Qemu-arm] [PATCH v3 29/33] hw/misc/zynq_slcr: use standard
 register definition
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
Cc: Fam Zheng <fam@euphon.net>, Collin Walling <walling@linux.ibm.com>,
 Dmitry Fleytman <dmitry.fleytman@gmail.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Alistair Francis <alistair.francis@wdc.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Edgar Iglesias <edgar.iglesias@xilinx.com>, Hannes Reinecke <hare@suse.com>,
 Qemu-block <qemu-block@nongnu.org>, David Hildenbrand <david@redhat.com>,
 Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>,
 Richard Henderson <rth@twiddle.net>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 Alistair Francis <alistair@alistair23.me>, qemu-s390x <qemu-s390x@nongnu.org>,
 qemu-arm <qemu-arm@nongnu.org>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, John Snow <jsnow@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 "Daniel P. Berrange" <berrange@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 Mark Burton <mark.burton@greensocs.com>, qemu-ppc <qemu-ppc@nongnu.org>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: WZMHy7EsS4Qi

On Mon, 29 Jul 2019 at 15:59, Damien Hedde <damien.hedde@greensocs.com> wro=
te:
>
> Replace the zynq_slcr registers enum and macros using the
> hw/registerfields.h macros.
>
> Signed-off-by: Damien Hedde <damien.hedde@greensocs.com>
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
> ---
>  hw/misc/zynq_slcr.c | 472 ++++++++++++++++++++++----------------------
>  1 file changed, 236 insertions(+), 236 deletions(-)
>

Since this patch has been reviewed and it's unrelated to the
reset APIs, I'm going to pull it into target-arm.next, and
then you can stop carrying it around in your patchset
(well, once it's gone into master and you've rebased on that,
which will probably be in a week or two).

thanks
-- PMM
