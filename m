Received: by 2002:a5d:4850:0:0:0:0:0 with SMTP id n16csp2408958wrs;
        Thu, 29 Aug 2019 09:44:22 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwWrReIT3JbS7Kl98WcgVMfTPZG6X/BgmaRhz/wZThuzxulVDdUMxthoFOP+0/rNREatQiE
X-Received: by 2002:ad4:5242:: with SMTP id s2mr6963397qvq.129.1567097062041;
        Thu, 29 Aug 2019 09:44:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1567097062; cv=none;
        d=google.com; s=arc-20160816;
        b=Mct2oc7DEozL9YysLKn15oBHLzaioeSQPWBcBEs3X3xQyTWj9PZxNrHHEq938Wic34
         l0XErPXyoySsWtpRQqQYoeeb4pKuX+EJkiHHrWs4w2pXAblWuacZRYMSe8K/baV35zTM
         BQQ65ty+EbnW/S4huky2rthiDXeEubKFxsiUY+qgDKLpKrq3z5Eg0wuazMxqthwWHlGT
         XCJqg2i/SwehSBFEDWnJrHB3VO86A2QDUMJd/yWFD2E1X7I9EjrTbSmPHuOcP/d8FObr
         vgv+26cSmeIDeXjXHorwNAihr3Z+488uSH7JmDJJ2X2+9udZfrKfIDKxnj+amkdbG7jG
         /AVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to;
        bh=ChEs0rhe8K3Tn9F/YnJuZAP2PCbKYTRZXpF4oLcEmKk=;
        b=k7WKiLum0oXIznd09XwBls9V9BGd8iJ8vu30GdVhZAiVR+G8b+2DIJ+/Xmvo+SBQIm
         0w5k+IYBwNmfYyD0DkDNDzl3GvQnAun0WcifezTV42QKF94drieGoyhGob2ZgRtZOqLS
         OUN1bJjEWId8DwAv1OXFlUaRm3eoi+td4T3gZep+zu8MQM4Nto/zML6il2+dxBMuWfzr
         SzsDMc6LLmsZt7cB4qT/552/aYRMklDDs2i2Jc2QWHpE+4jylOySdhdPBSO4qlGqEXLP
         6NyTETvt3HqoCEgy7SNAUOV+JpsE+Up7AxX8dFnlnGwPCEja1QeMBcHTdRV5OUAykRxE
         BOdw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c11si2014616qtq.152.2019.08.29.09.44.21
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 29 Aug 2019 09:44:22 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:51974 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1i3NX3-0003e4-ET
	for alex.bennee@linaro.org; Thu, 29 Aug 2019 12:44:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44965)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1i3NWq-0003dQ-GY
 for qemu-arm@nongnu.org; Thu, 29 Aug 2019 12:44:09 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1i3NWp-00041H-0o
 for qemu-arm@nongnu.org; Thu, 29 Aug 2019 12:44:08 -0400
Received: from mx1.redhat.com ([209.132.183.28]:42678)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1i3NWo-00040w-PD
 for qemu-arm@nongnu.org; Thu, 29 Aug 2019 12:44:06 -0400
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id A5A118553A
 for <qemu-arm@nongnu.org>; Thu, 29 Aug 2019 16:44:05 +0000 (UTC)
Received: by mail-wr1-f71.google.com with SMTP id o5so2374853wrg.15
 for <qemu-arm@nongnu.org>; Thu, 29 Aug 2019 09:44:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=e37qThlOf/YoQQgqRUcwATXkKcLi/cFpq9a5Q+V6lxM=;
 b=Ry8RaPQs5Bo8GNGy0Me2YSqepPU/1P894mnUu8oSDn5+efJNY8YLOdZM3w7/eofk/X
 dac1DawAHqMgEBuXnOcD+e6OQ7JPE9a2opel+PcyzWJsTbmEL+n659J8beidEcqS/kNQ
 tpitlh7R4uvTj62TyIIAytpeqfBMQI2U9akVee9ZBrKNA7wUw/gGDSGUSpSnK4ksgwhJ
 +Cgw1HHtMrKpni0ycbNULmg0ul8MwlAxS4/ldtFF8LygcdhNLk5NWNtR9L134vUm7wvT
 tUKr7higU0fiIoMe84VBNL5a8yELQ74otlEcu9xfmdkfvNkjWvYexDgHC84c/PPEDxIS
 /pdA==
X-Gm-Message-State: APjAAAV4DiCXHP9OQGbP8RuVNW2qaLTE1qiKaqgnX+STcI2e+EBL08S7
 FzREn3YMHusjoykb7PpNIWh8avEKk0t9ZetiDvrt7cs8XdLwAKRBIH3wYM3mBsM16SJbc1M9Rq+
 742Yxx8ePPoZD
X-Received: by 2002:adf:de8a:: with SMTP id w10mr2073694wrl.276.1567097044212; 
 Thu, 29 Aug 2019 09:44:04 -0700 (PDT)
X-Received: by 2002:adf:de8a:: with SMTP id w10mr2073669wrl.276.1567097044037; 
 Thu, 29 Aug 2019 09:44:04 -0700 (PDT)
Received: from [192.168.1.41] (251.red-88-10-102.dynamicip.rima-tde.net.
 [88.10.102.251])
 by smtp.gmail.com with ESMTPSA id n8sm6874343wma.7.2019.08.29.09.44.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 29 Aug 2019 09:44:03 -0700 (PDT)
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20190828190456.30315-1-richard.henderson@linaro.org>
 <20190828190456.30315-65-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Openpgp: id=89C1E78F601EE86C867495CBA2A3FD6EDEADC0DE;
 url=http://pgp.mit.edu/pks/lookup?op=get&search=0xA2A3FD6EDEADC0DE
Message-ID: <de42445d-aec2-4ea8-bfe5-7f6bc062300c@redhat.com>
Date: Thu, 29 Aug 2019 18:44:02 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190828190456.30315-65-richard.henderson@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v3 64/69] target/arm: Convert
 T16, shift immediate
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: xZxIi6jPixvM

On 8/28/19 9:04 PM, Richard Henderson wrote:
> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>

> ---
>  target/arm/translate.c | 26 ++------------------------
>  target/arm/t16.decode  |  8 ++++++++
>  2 files changed, 10 insertions(+), 24 deletions(-)
>=20
> diff --git a/target/arm/translate.c b/target/arm/translate.c
> index 5fb0e2066b..dd292b3042 100644
> --- a/target/arm/translate.c
> +++ b/target/arm/translate.c
> @@ -10731,7 +10731,7 @@ static void disas_thumb2_insn(DisasContext *s, =
uint32_t insn)
> =20
>  static void disas_thumb_insn(DisasContext *s, uint32_t insn)
>  {
> -    uint32_t val, op, rm, rd, shift;
> +    uint32_t val, rd;
>      int32_t offset;
>      TCGv_i32 tmp;
>      TCGv_i32 tmp2;
> @@ -10743,29 +10743,7 @@ static void disas_thumb_insn(DisasContext *s, =
uint32_t insn)
>      /* fall back to legacy decoder */
> =20
>      switch (insn >> 12) {
> -    case 0: case 1:
> -
> -        rd =3D insn & 7;
> -        op =3D (insn >> 11) & 3;
> -        if (op =3D=3D 3) {
> -            /*
> -             * 0b0001_1xxx_xxxx_xxxx
> -             *  - Add, subtract (three low registers)
> -             *  - Add, subtract (two low registers and immediate)
> -             * In decodetree.
> -             */
> -            goto illegal_op;
> -        } else {
> -            /* shift immediate */
> -            rm =3D (insn >> 3) & 7;
> -            shift =3D (insn >> 6) & 0x1f;
> -            tmp =3D load_reg(s, rm);
> -            gen_arm_shift_im(tmp, op, shift, s->condexec_mask =3D=3D 0=
);
> -            if (!s->condexec_mask)
> -                gen_logic_CC(tmp);
> -            store_reg(s, rd, tmp);
> -        }
> -        break;
> +    case 0: case 1: /* add/sub (3reg, 2reg imm), shift imm; in decodet=
ree */
>      case 2: case 3: /* add, sub, cmp, mov (reg, imm), in decodetree */
>          goto illegal_op;
>      case 4:
> diff --git a/target/arm/t16.decode b/target/arm/t16.decode
> index f128110dee..79a1d66d6c 100644
> --- a/target/arm/t16.decode
> +++ b/target/arm/t16.decode
> @@ -126,6 +126,14 @@ ADD_rri         10101 rd:3 ........ \
>  STM             11000 ... ........              @ldstm
>  LDM_t16         11001 ... ........              @ldstm
> =20
> +# Shift (immediate)
> +
> +@shift_i        ..... shim:5 rm:3 rd:3          &s_rrr_shi %s rn=3D%re=
g_0
> +
> +MOV_rxri        000 00 ..... ... ...            @shift_i shty=3D0  # L=
SL
> +MOV_rxri        000 01 ..... ... ...            @shift_i shty=3D1  # L=
SR
> +MOV_rxri        000 10 ..... ... ...            @shift_i shty=3D2  # A=
SR
> +
>  # Add/subtract (three low registers)
> =20
>  @addsub_3       ....... rm:3 rn:3 rd:3 \
>=20
