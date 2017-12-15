Received: by 10.223.159.74 with SMTP id f10csp7046057wrg;
        Thu, 14 Dec 2017 18:19:09 -0800 (PST)
X-Google-Smtp-Source: ACJfBouEnNBjsiZ8In59whiITbFhNfkjysYzcP5HbWAMIEEt3gBZxUHHLicW3ceF9XmJ5FIP2+n5
X-Received: by 10.37.163.1 with SMTP id d1mr5738394ybi.113.1513304349863;
        Thu, 14 Dec 2017 18:19:09 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1513304349; cv=none;
        d=google.com; s=arc-20160816;
        b=rXLnL73KQHXb3mc/NslNEB7wqM0aIv05uzzL1kJ284Skdpp4GcSYF1jbPjRfuiP6gd
         J39TWoWwn6z2HnqLi0v3B5NOEXX8KThYUBGuAEsjGSj6b/FbMTQKlPp3cjuZBOBlkZ5i
         W/Nc1Q+/E7hQTya0YrIA9F+8RLY1XyDxFbjWK338LuqpguxPxgTg34ctKSblqZbzGwgx
         1pOtJk9Z84glCeCNMSMS/pDyjt2R4Q49AMviksscwvfykJyQA4sgw0cUyo2B3q1VHvSb
         +xWaJQnyy2+8RV8Bs2VsK97QgFlEdjERlPwhciPYBUqgogk2n9otTgHfyKHGtIK0I0f2
         OWlg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to
         :dkim-signature:arc-authentication-results;
        bh=gRFQdTuEAloxuyYnOcmYmqC4L/Ru1PskRdAg19ZPLn4=;
        b=VTni+5DHxPxL2l7adXuhQsEg8zRCjGwDXHDRhu4ZxrEfV1TS69OyrUmkL02klEkS+h
         ysYw8lgFR3pE8mgY1dhKrcWxPxXP2B747s16m8NmynA+WY2R4OlJOV0VfB5tjRb95UvY
         8cvWvyMIqS1zCxK7Yet7BMZsJus861Z19fXDzI31xS0rkWVgcsInGHKFCENDAHSAObSO
         YIQHYq0EYI21GamwU/Oz7SEb5gmBcc13aMgzaT8pC2Um9FeaSRCmIMGsHF0vPkFkxrrC
         +fBGRYKwMHuTylNvDrhmhad7qjBG9t9/OVcUr3wnT0b/TTownmbXU44FcAlguNQDPOjr
         HX9g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=eB0IN+d1;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id l62si1042797ywf.748.2017.12.14.18.19.09
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 14 Dec 2017 18:19:09 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=eB0IN+d1;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:43820 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ePfaf-0004Kp-BE
	for alex.bennee@linaro.org; Thu, 14 Dec 2017 21:19:09 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59831)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1ePfaS-0004JO-Aq
	for qemu-arm@nongnu.org; Thu, 14 Dec 2017 21:18:57 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1ePfaR-0001yI-Iz
	for qemu-arm@nongnu.org; Thu, 14 Dec 2017 21:18:56 -0500
Received: from mail-qt0-x244.google.com ([2607:f8b0:400d:c0d::244]:43703)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1ePfaM-0001v3-Bk; Thu, 14 Dec 2017 21:18:50 -0500
Received: by mail-qt0-x244.google.com with SMTP id w10so10416147qtb.10;
	Thu, 14 Dec 2017 18:18:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:cc:references:from:openpgp:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=gRFQdTuEAloxuyYnOcmYmqC4L/Ru1PskRdAg19ZPLn4=;
	b=eB0IN+d1wokrzqEMuO1qGv73Jw1bTKjuNribFPGelCgBxral5Tjf414xvmfN2fDb6S
	OOCTff1pkV7cAJnX92qmZrgWb+rCKsRCaArhlPGWGN0JEYa/NYxl10HbDITc29W+EZ7q
	21yoBd+EivDzO/v2xYrItJ3VdOqkvGFXReK/yh0IsfDjDfg4AQkNMBVTtPbuxzD9PrT2
	P322rTVAtEvtjLxF3mVSEmlgOqOMMF3uWzmMzEeWJ3h33Cj9N1KNROns3VOGbNNq3fv1
	ugoXdV4hhKYVCuLKu5EU7Wk+duG2bhQjxeq3St8pM3XtTurnxRAXUSpDbVdll7p1iNbO
	HTqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:cc:references:from:openpgp
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-language:content-transfer-encoding;
	bh=gRFQdTuEAloxuyYnOcmYmqC4L/Ru1PskRdAg19ZPLn4=;
	b=Dp5zRNCM2KxaRNrjITNtqBrWTTpCU9109PeSt3CM0acVNA47MeCpATgoihV5JliDu+
	epzwAKcPwX0XxQ2+G6Ej4r6J2qytGZTXg8ku1vIBnUgjajrilpdRtlZMuadOlPQRkJYJ
	yZIfEtY10MEAk8ubfaB6RhJddJVSZE9m3HnOsHHhvFIAkXMcGHgYwx+r0QUnzDvfYkbC
	z3fnG160WAs9+JQz2bCJNyxEt5yA/Lx5pxVNo7Bw8LQBqC5g0eyF2nvWua77IG0NqLTY
	AQ/cISlfLZaQsGl33SFzbBp5GwzPX9t2drdOHWPZwdPH6Sx09mKM0mERRgL/tfwrwUmY
	Lf7g==
X-Gm-Message-State: AKGB3mJcc38fnzK3P+Fg9IrKh5tFXXNiCxC7Zpw+B02XPAQwzAUX6oPf
	lHKJtzarLEEApoffowwSUwA=
X-Received: by 10.200.35.182 with SMTP id q51mr18807330qtq.302.1513304329845; 
	Thu, 14 Dec 2017 18:18:49 -0800 (PST)
Received: from [192.168.1.11] ([181.91.222.165])
	by smtp.gmail.com with ESMTPSA id
	r22sm3595958qkl.35.2017.12.14.18.18.47
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 14 Dec 2017 18:18:49 -0800 (PST)
To: Andrey Smirnov <andrew.smirnov@gmail.com>, qemu-arm@nongnu.org
References: <20171214145255.31545-1-andrew.smirnov@gmail.com>
	<20171214145255.31545-16-andrew.smirnov@gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Openpgp: id=FAABE75E12917221DCFD6BB2E3E32C2CDEADC0DE;
	url=http://pgp.mit.edu/pks/lookup?op=get&search=0xE3E32C2CDEADC0DE
Message-ID: <c8081a26-929f-4c9c-d1cd-09501bd83274@amsat.org>
Date: Thu, 14 Dec 2017 23:18:40 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.5.0
MIME-Version: 1.0
In-Reply-To: <20171214145255.31545-16-andrew.smirnov@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::244
Subject: Re: [Qemu-arm] [PATCH v2 15/15] sdhci: Implement write method of
 ACMD12ERRSTS register
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Jason Wang <jasowang@redhat.com>,
	qemu-devel@nongnu.org, yurovsky@gmail.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: NkZwuugIWWyZ

Hi Andrey,

On 12/14/2017 11:52 AM, Andrey Smirnov wrote:
> Cc: Peter Maydell <peter.maydell@linaro.org>
> Cc: Jason Wang <jasowang@redhat.com>
> Cc: Philippe Mathieu-Daudé <f4bug@amsat.org>
> Cc: qemu-devel@nongnu.org
> Cc: qemu-arm@nongnu.org
> Cc: yurovsky@gmail.com
> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
> Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>

I have a more complete patch coming implementing the
CTRL2_VOLTAGE_SWITCH (LSB part of the ACMD12ERRSTS register) but in the
meaning time your patch is fine.

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

> ---
>  hw/sd/sdhci.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/hw/sd/sdhci.c b/hw/sd/sdhci.c
> index 758af067f9..cb9e0db9fb 100644
> --- a/hw/sd/sdhci.c
> +++ b/hw/sd/sdhci.c
> @@ -1139,6 +1139,9 @@ sdhci_write(void *opaque, hwaddr offset, uint64_t val, unsigned size)
>          s->admasysaddr = (s->admasysaddr & (0x00000000FFFFFFFFULL |
>                  ((uint64_t)mask << 32))) | ((uint64_t)value << 32);
>          break;
> +    case SDHC_ACMD12ERRSTS:
> +        MASKED_WRITE(s->acmd12errsts, mask, value);
> +        break;
>      case SDHC_FEAER:
>          s->acmd12errsts |= value;
>          s->errintsts |= (value >> 16) & s->errintstsen;
> 
