Received: by 2002:a19:cb43:0:0:0:0:0 with SMTP id b64csp3011435lfg;
        Mon, 2 Mar 2020 15:51:26 -0800 (PST)
X-Google-Smtp-Source: ADFU+vunpb3Kpg72rnPE3E0QBAA46BVmiw3vrWqz7IeeSTZ+yEntish8Jlz6Ot4+s8AcUhSPL1Tg
X-Received: by 2002:ac8:741a:: with SMTP id p26mr2031288qtq.76.1583193086725;
        Mon, 02 Mar 2020 15:51:26 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1583193086; cv=none;
        d=google.com; s=arc-20160816;
        b=TNZanp4NWaYcl6Osukbs41TaYUy9NLfWa0wA95ijeLtBN9Pdsc5XMSzWgY6T5Egczk
         dBgNRPImAK0cTSZmV+nrKBH1nfSJ6K0mcCPISOQM0oaWnF3unocgztwJxuQGGlNYs/nV
         L+Se0ZX0b6ldFf1+BEzTUZYXVJwuryRAd5BAj7iFZ3Z9rqkB0Ia7FHbDXJfkSo4z9Fyr
         /Yjhh+TiHip41aiJoLc6qZAYub33O+etdNWc0eMsT6ZmS+xrvIgf36dZcnAS+coZWJun
         WHchxMOFGLI0YIxnunBe+kDALljLho1JgEcb4MamFTboro5YqyiHKLuwNnxO9MwyQCSB
         XVAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=iuPz6n+BeBVA7+PsSxRCyYsGG4BT486cTX3EaSuJfTU=;
        b=ps9wkzvZb7KZRnX2bvFf6M0BMTAeuTY2OQXXEWVNxgjfswqTjBNGBMEEVQKruDz0Vr
         JmWhiHxxe78RyD169IMv4lUo3DhFBCmyIHvZ0W3CXx5H8P+Eg2CFn356cnECe5SkuL+o
         i6I9m5tnapZJalXM3kt4kssLsZTmiJCTrbRCV1kQeoXdW4VZXx2+18PWHwxbGU60tfA2
         GdgHUM8ahwTZ7P3o282BJTBel8q0EiNnClVIvpDeg60GArJPESrQA0tCTtwiFgmAngle
         LsbzxC8n3kbKoLyrkEiuCsCngHYNHCV/AEGU9pmXwUd3qJtrvrfcH3HO/ksGc0cZ4mlv
         NaIA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=H5THGtS4;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k26si3484218qtf.281.2020.03.02.15.51.26
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 02 Mar 2020 15:51:26 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=H5THGtS4;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:39840 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1j8uqM-0005FE-6x
	for alex.bennee@linaro.org; Mon, 02 Mar 2020 18:51:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37733)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1j8uq8-0005CQ-Vf
 for qemu-arm@nongnu.org; Mon, 02 Mar 2020 18:51:13 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1j8uq8-00017s-1N
 for qemu-arm@nongnu.org; Mon, 02 Mar 2020 18:51:12 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:43319
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1j8uq7-00017V-UN
 for qemu-arm@nongnu.org; Mon, 02 Mar 2020 18:51:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1583193071;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=iuPz6n+BeBVA7+PsSxRCyYsGG4BT486cTX3EaSuJfTU=;
 b=H5THGtS4lTZaKYkwrCe7VUqaXV7SksbCOwpO2zfi+BRGtFDuRJJj1IUdiREoQjd85xD6CW
 yWxXOtNyTnMlDAgoBu3lCvWofMAu1i/Jh/i3I92p0GLM0vSPZ3xGvmspwqQ3/1CcgS0CzM
 ELYANEPc9SpDPIAVEyS24SUDpL+48o4=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-369-zwTZeq99Pfm1QXxmPwrf0Q-1; Mon, 02 Mar 2020 18:51:10 -0500
X-MC-Unique: zwTZeq99Pfm1QXxmPwrf0Q-1
Received: by mail-wr1-f72.google.com with SMTP id d7so424237wrr.0
 for <qemu-arm@nongnu.org>; Mon, 02 Mar 2020 15:51:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=n36ZH3tfqOtKU4lEeXMPPAyLS3rveIOnCwDlc1J1iLM=;
 b=EHNET51FHIC6Cnbp/M/qkd0tgfiJwR3WeoYxPtN0jbEdXE9oMcekz6ANYEnX39CG7B
 ybIGnBIR9h8HphNsy1yqWw5Z4US+FlcCRs8raDStN9Zi3Li+ZjMFm568EK3FdYWjMxoU
 ncjZaK9DT0T8MRk2JB6rwzlRqYIhtxG6+Xiy7RlmthIZiiI7TrKCqZ5o1omZ3D1wrT35
 jwYmK6ripXK58ad7Yt51O7IDNk3tzrx+DgvKX0RYLn0Cog19lZHUp8RIzWUQPsFJcYIH
 RH0AQiiaOGCwKcNk4hxuZ83LkzAJNFfFCUQtjBm43PYR0Ep1eiVJ8LKWbvMBgR59eupP
 sE3g==
X-Gm-Message-State: ANhLgQ2LIbdpR1GHiu/wBPQijt047pdWtSTJ00PSngOQKaQV7b2WBY38
 8rSGOJOldL3u+F5j6/p6Zzz3ZFuXV3UQXh3TgG2z8mCVW7+Nkev8+klbbUaBw9Fppn+2o3AWJZ2
 OQrdeB2XeUPQp
X-Received: by 2002:a1c:5457:: with SMTP id p23mr771040wmi.45.1583193067495;
 Mon, 02 Mar 2020 15:51:07 -0800 (PST)
X-Received: by 2002:a1c:5457:: with SMTP id p23mr770991wmi.45.1583193066708;
 Mon, 02 Mar 2020 15:51:06 -0800 (PST)
Received: from ?IPv6:2a01:e35:2fb0:49e0:3f7b:4b69:b9c:cdc0?
 ([2a01:e35:2fb0:49e0:3f7b:4b69:b9c:cdc0])
 by smtp.gmail.com with ESMTPSA id j5sm30794631wrx.56.2020.03.02.15.51.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 02 Mar 2020 15:51:06 -0800 (PST)
Subject: Re: [PATCH v2 1/9] target/arm: Replicate TBI/TBID bits for single
 range regimes
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20200302175829.2183-1-richard.henderson@linaro.org>
 <20200302175829.2183-2-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <e7cb1c45-6143-3301-1404-3145d6dcecdc@redhat.com>
Date: Tue, 3 Mar 2020 00:51:05 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200302175829.2183-2-richard.henderson@linaro.org>
Content-Language: en-US
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.120
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
X-TUID: FC7CYhHYhsfh

On 3/2/20 6:58 PM, Richard Henderson wrote:
> Replicate the single TBI bit from TCR_EL2 and TCR_EL3 so that
> we can unconditionally use pointer bit 55 to index into our
> composite TBI1:TBI0 field.
>=20
> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/arm/helper.c | 6 ++++--
>   1 file changed, 4 insertions(+), 2 deletions(-)
>=20
> diff --git a/target/arm/helper.c b/target/arm/helper.c
> index 6be9ffa09e..37ffe06c05 100644
> --- a/target/arm/helper.c
> +++ b/target/arm/helper.c
> @@ -10316,7 +10316,8 @@ static int aa64_va_parameter_tbi(uint64_t tcr, AR=
MMMUIdx mmu_idx)
>       } else if (mmu_idx =3D=3D ARMMMUIdx_Stage2) {
>           return 0; /* VTCR_EL2 */
>       } else {
> -        return extract32(tcr, 20, 1);
> +        /* Replicate the single TBI bit so we always have 2 bits.  */
> +        return extract32(tcr, 20, 1) * 3;
>       }
>   }
>  =20
> @@ -10327,7 +10328,8 @@ static int aa64_va_parameter_tbid(uint64_t tcr, A=
RMMMUIdx mmu_idx)
>       } else if (mmu_idx =3D=3D ARMMMUIdx_Stage2) {
>           return 0; /* VTCR_EL2 */
>       } else {
> -        return extract32(tcr, 29, 1);
> +        /* Replicate the single TBID bit so we always have 2 bits.  */
> +        return extract32(tcr, 29, 1) * 3;
>       }
>   }
>  =20
>=20

Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>

