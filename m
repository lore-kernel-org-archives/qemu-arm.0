Received: by 2002:a5d:4301:0:0:0:0:0 with SMTP id h1-v6csp921587wrq;
        Mon, 4 Jun 2018 11:21:55 -0700 (PDT)
X-Google-Smtp-Source: ADUXVKKn1GNsX+C8Q46DUvROJ+x2i03pPCQSrcvHRXFChT9JuEGu/xvmZt0Ri1RGEh9wkJOK6Ate
X-Received: by 2002:a0c:f586:: with SMTP id k6-v6mr16621018qvm.51.1528136515091;
        Mon, 04 Jun 2018 11:21:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1528136515; cv=none;
        d=google.com; s=arc-20160816;
        b=oc5R/vSdVIOvc6hN5mNkHAK8DA/pz7SwAXvy9QAmE6/jJatUqg4pDQk6LBWVovbXSU
         Mk2h60VtSWIUVqkO2fhyX+jlslJnMGGEDoOmOiaR1EsNlSUNo2IIE7cgwcm/j3jctO0I
         sFTP/YFDhFbmbLP0PIouDd24Bp07Hab2M2r2Ye/CN7p+umHCQMjA45Ia/s3e7vrvhE4C
         9ftXAr9Le3uiG4YJE7YRU1Y7eHIgmB38TFepscJBICTluwR8EUx+VuqpidCyBOz8WbE4
         /ZMX+H4koluTVB4TprlKogri0re7aLISUlawjQCCrdQwxH4qB7fjYdIpDCmvVao85Exj
         mnSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:to:message-id:date:from:references
         :in-reply-to:mime-version:dkim-signature:arc-authentication-results;
        bh=t9YaUPGye4q1/5KeBgp03IRW2CtkV2HldENUV3Urhk0=;
        b=zKzB+cg35rhiS8jwPfLkXQjkLVGn0JFfisr5p5MzLHfjBQvLe/XspDmvAFolv8fZ36
         9Si50vvgcPK9LK1TooiKHt0uwXUgvJ1siag3qI23JIbgLJLHOge70vpMTzT8tM0klvRv
         YxUKkKHa49RMPuLVBUjQxsvPAbmdkNZCnGH6gMrEyAzC25k5eIPXPJkJmcpSbyun3QSO
         Zmg0QlUtMpol8+jONA/FK2HRaKD/lkazG4A6JKbyW24JuBJvxdU7IcaFEebQeGRyrzqQ
         +SjZLyxP2tBzBP0HMORUd31akwSfdU5u50KEdIh64BHPpyyad9uD5lvG92c3VlhmyoZv
         3QoA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=Gs5yl1d0;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id v189-v6si2996973qkc.379.2018.06.04.11.21.54
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 04 Jun 2018 11:21:55 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=Gs5yl1d0;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:41391 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fPu78-0005v2-IF
	for alex.bennee@linaro.org; Mon, 04 Jun 2018 14:21:54 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60864)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1fPu6v-0005tz-O4
	for qemu-arm@nongnu.org; Mon, 04 Jun 2018 14:21:42 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1fPu6u-0007ak-K4
	for qemu-arm@nongnu.org; Mon, 04 Jun 2018 14:21:41 -0400
Received: from mail-lf0-x242.google.com ([2a00:1450:4010:c07::242]:41889)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <alistair23@gmail.com>)
	id 1fPu6u-0007a2-CM; Mon, 04 Jun 2018 14:21:40 -0400
Received: by mail-lf0-x242.google.com with SMTP id d24-v6so26752585lfa.8;
	Mon, 04 Jun 2018 11:21:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=t9YaUPGye4q1/5KeBgp03IRW2CtkV2HldENUV3Urhk0=;
	b=Gs5yl1d0iuXtVXDb5xUNw0iQCH3N5FmT11DZbS0lRsNr5uSE3OuyS6zs4HR2VCF9+K
	RudjMwOUnqphKuNyVdDDyFNdT7z46BxLmZUxvbuxZ7qyrcX5Hma42eC81UZNRPVneVT0
	JU9uihI26IkRUG5G7PisY+mH9fxbdjLTGMs/Oesd7SrDtGwttkIykSPG/rGE7c5dbhhl
	Zcogw9w9A6lsjnlzQgxAh/zpN39myBpldrrhcg+7o7ZBRykUQYK32yJJppsgGLbajDjH
	mmEFEC9NLkRhVp7kjmVYHVIbIEvPqhPS3UXYmw3bSMb4evbs5jeIJEc60qPNQ4466s5x
	hA6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=t9YaUPGye4q1/5KeBgp03IRW2CtkV2HldENUV3Urhk0=;
	b=I2qk28vHUXWiKwltEfxhzFKxSLMLNPdZlSItBoZwO4Rqkvcmswv9dah/dGCLGQBz6Z
	7CZ99kf1mMFZeao5om5I2Z24R0bjMnTxs/iP74hUNppOpDPAarLNc2WADDlSybWrVnP4
	0YM1tNRlM03yafDf7omcnGfyEALQud92jO131RbR3BFOh3G591FA47EvSNnEZlaUrihV
	P7aXgM/VRMAvPpzqKN5YXzie9yTCHvDIAFbR5jREMdLmN+qnzTZktiFJttSipjlUc+OA
	+gRueSkDV04mipVhOsaEgFEGwboKHdMG0SP/4kIkYI0mtlPs9DeYAgL9XMs+M2SJkn0P
	Avww==
X-Gm-Message-State: ALKqPwfvk07Qn8lLh70mxHRa2GFevnq3+YjZrXgeOX3oKKLjTrz2t5+i
	Q9rad5hA3LEw6ags9nmSxiTC9z/Mwc8gIFnD0Kk=
X-Received: by 2002:a19:b2c2:: with SMTP id
	t63-v6mr14134104lfk.27.1528136499175; 
	Mon, 04 Jun 2018 11:21:39 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a2e:98c6:0:0:0:0:0 with HTTP;
	Mon, 4 Jun 2018 11:21:08 -0700 (PDT)
In-Reply-To: <20180603000827.30872-3-f4bug@amsat.org>
References: <20180603000827.30872-1-f4bug@amsat.org>
	<20180603000827.30872-3-f4bug@amsat.org>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 4 Jun 2018 11:21:08 -0700
Message-ID: <CAKmqyKMqwJ1mSj8wJXOtTYjvWAYv5ZQ_wzGb04T66jX7j0OGeg@mail.gmail.com>
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4010:c07::242
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH 2/8] sdcard: Allow commands
 valid in SPI mode
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Alistair Francis <alistair@alistair23.me>,
	"qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
	qemu-arm <qemu-arm@nongnu.org>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: xXgeL9Pl7Ax+

On Sat, Jun 2, 2018 at 5:08 PM, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.or=
g> wrote:
> From the "Physical Layer Simplified Specification Version 1.10"
>   Chapter 7.3 "SPI Mode Transaction Packets"
>     Table 57: "Commands and arguments"
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>

Acked-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  hw/sd/sd.c | 14 --------------
>  1 file changed, 14 deletions(-)
>
> diff --git a/hw/sd/sd.c b/hw/sd/sd.c
> index e1218d1fb6..80e70dd93e 100644
> --- a/hw/sd/sd.c
> +++ b/hw/sd/sd.c
> @@ -960,8 +960,6 @@ static sd_rsp_type_t sd_normal_command(SDState *sd, S=
DRequest req)
>          return sd_illegal;
>
>      case 6:    /* CMD6:   SWITCH_FUNCTION */
> -        if (sd->spi)
> -            goto bad_cmd;
>          switch (sd->mode) {
>          case sd_data_transfer_mode:
>              sd_function_switch(sd, req.arg);
> @@ -1190,9 +1188,6 @@ static sd_rsp_type_t sd_normal_command(SDState *sd,=
 SDRequest req)
>
>      /* Block write commands (Class 4) */
>      case 24:   /* CMD24:  WRITE_SINGLE_BLOCK */
> -        if (sd->spi) {
> -            goto unimplemented_spi_cmd;
> -        }
>          switch (sd->state) {
>          case sd_transfer_state:
>              /* Writing in SPI mode not implemented.  */
> @@ -1217,9 +1212,6 @@ static sd_rsp_type_t sd_normal_command(SDState *sd,=
 SDRequest req)
>          break;
>
>      case 25:   /* CMD25:  WRITE_MULTIPLE_BLOCK */
> -        if (sd->spi) {
> -            goto unimplemented_spi_cmd;
> -        }
>          switch (sd->state) {
>          case sd_transfer_state:
>              /* Writing in SPI mode not implemented.  */
> @@ -1259,9 +1251,6 @@ static sd_rsp_type_t sd_normal_command(SDState *sd,=
 SDRequest req)
>          break;
>
>      case 27:   /* CMD27:  PROGRAM_CSD */
> -        if (sd->spi) {
> -            goto unimplemented_spi_cmd;
> -        }
>          switch (sd->state) {
>          case sd_transfer_state:
>              sd->state =3D sd_receivingdata_state;
> @@ -1371,9 +1360,6 @@ static sd_rsp_type_t sd_normal_command(SDState *sd,=
 SDRequest req)
>
>      /* Lock card commands (Class 7) */
>      case 42:   /* CMD42:  LOCK_UNLOCK */
> -        if (sd->spi) {
> -            goto unimplemented_spi_cmd;
> -        }
>          switch (sd->state) {
>          case sd_transfer_state:
>              sd->state =3D sd_receivingdata_state;
> --
> 2.17.1
>
>
