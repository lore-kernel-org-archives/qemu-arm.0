Received: by 2002:a17:906:cc9:b0:a28:7ef3:d049 with SMTP id l9csp69654ejh;
        Tue, 2 Jan 2024 10:33:06 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGWUgdx9nYaaZcyJ7kQB0iaEIf7eozP+49Dv73vPcx/kRZTHrYOyuouezWiJD2f0FsdP8ix
X-Received: by 2002:a37:c20a:0:b0:781:5505:a730 with SMTP id i10-20020a37c20a000000b007815505a730mr15073820qkm.24.1704220386211;
        Tue, 02 Jan 2024 10:33:06 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1704220386; cv=none;
        d=google.com; s=arc-20160816;
        b=D137PE1fE2sLtks7WWO0gUKw83J+qqjuF4IkSeR+TwBGp40ZKMF5+Axi0rEmjk43Zd
         82STDQGvFPLn2f1UBphJRYe8MXDyhXiDsDOWqdX+9eIxm5q4PeJmkf/LFBMR9mzv3uBm
         M2/GJsglXjNWLZ/oxcztiXygpZtAAsKdDPWlFuzLzGRDUHPj+3+4Bytzk7qAyA9LKLJf
         fCp/530GU3e5BwZvaVPK8PBFS2jbqwiijjiERux84N8dmIYoEfk1La35YGAvatxjDcTC
         Nzh3bcX1mNMji+CGIGPbjdVtmU+NWaFo+OZXi/kU1FMzi2XIq0DXn5SSFY1Fnf2NeMqv
         05gw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:ui-outboundreport
         :content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=5ZSWH3wpkzPV65TxBNVdL/gu+vM8JlCQNGRe3viQK20=;
        fh=fCmEQnPziUe60JUYtiqxt7QNA6C6QEcUJOTTqY3da3I=;
        b=h87uYpEHY1JVh2D5y0MeMr/xiLNPtsOs9YCQJ11ZsAJWK5wfYTT2xMteo/PYAQzcZh
         h6DdhMDAOg26lbx7I3RHdZygk8eWAWWaBSJmU+9gW9VJs8251vxWxn6WF3vl5LynhaZl
         XKhxJcaNR/MgITZZO2sZWRgTeQQUelLkD91zSC6tVIha4TACe5gWwyYX6p5qz9FL12an
         0sNFCpRiywg2jcdui5txgBfhHVX3sgUAjn4cUo2akqCYr/QSXVJNinp37G5I5wMs1fSS
         w5WHMN4+s1b7OLSnNxOvwr0CXO+1mdNl0sLccdHYI4Ef9QXfjbhlXvi59gLvqk9QdIVX
         0CbA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmx.de header.s=s31663417 header.b=sJMIadbf;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=gmx.de
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u22-20020a05620a455600b00781d1750407si3310668qkp.637.2024.01.02.10.33.06
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 02 Jan 2024 10:33:06 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmx.de header.s=s31663417 header.b=sJMIadbf;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=gmx.de
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rKjZ3-0006PJ-0z; Tue, 02 Jan 2024 13:32:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xypron.glpk@gmx.de>)
 id 1rKjZ0-0006Of-OL; Tue, 02 Jan 2024 13:32:31 -0500
Received: from mout.gmx.net ([212.227.15.19])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xypron.glpk@gmx.de>)
 id 1rKjYx-0004I4-22; Tue, 02 Jan 2024 13:32:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.de; s=s31663417;
 t=1704220332; x=1704825132; i=xypron.glpk@gmx.de;
 bh=5ZSWH3wpkzPV65TxBNVdL/gu+vM8JlCQNGRe3viQK20=;
 h=X-UI-Sender-Class:Date:Subject:To:Cc:References:From:
 In-Reply-To;
 b=sJMIadbfeLj8rrRXaeB05U1BgwCu1j2ebsMGsJKQjZdQqP3U/Ex2O5aPkOxlP9oR
 KYa79LAcpstaVBGzEAEnUWEIeHh7xvzBGJx0eD4UJDG9wO3IWcWHTnLyyXPFoxtjo
 pV76poIh5cIzZVtEdGDZhhQ+eu7h+Yiww2I25QWZPj6ikLhEyi4Jq3nLd2wZVCMac
 RJsobKa824KCWxk/AfDQCuIcwButa/ZTnYlDaj6Zxopf5b7tUcRRuS4TP1Ya+NhSG
 6WYOLszrbffVPiWyriy5GKQohydgmyiHBd3TiAQ91abFwEOJqqtnGbSqzAaW3YB+C
 6ArLppAre/h4AN959A==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.123.94] ([178.202.40.247]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MkHMZ-1qwzVy3Mgz-00kg6f; Tue, 02
 Jan 2024 19:32:11 +0100
Message-ID: <f662a5cd-fa5b-4583-8864-6f1c1a1f6ec2@gmx.de>
Date: Tue, 2 Jan 2024 19:32:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for 8.2.1] hw/net: cadence_gem: Fix MDIO_OP_xxx values
To: Bin Meng <bmeng@tinylab.org>, =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?=
 <philmd@linaro.org>
Cc: Alistair Francis <alistair@alistair23.me>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Jason Wang <jasowang@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 qemu-arm@nongnu.org, Sai Pavan Boddu <sai.pavan.boddu@amd.com>,
 qemu-devel@nongnu.org, Luc Michel <luc.michel@amd.com>,
 qemu-trivial@nongnu.org
References: <20240102141803.117631-1-bmeng@tinylab.org>
 <985e87d6-0f8c-4127-b425-f1efc6034879@linaro.org>
Content-Language: en-US, de-DE
From: Heinrich Schuchardt <xypron.glpk@gmx.de>
In-Reply-To: <985e87d6-0f8c-4127-b425-f1efc6034879@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:MkXgy5p95PN2giSDoOHisy5UNN9m+eM6ka72kbx7mp2ZDNicWgk
 PDczV5DsE0bvgriqmewg7SknrnrgK6p6XljHqABa28dRSURKa+nAZVaFqyBgJKcdN8Q8dM8
 0DuCLvayaMiialqIkdZQ5KCbSOTwGbEbT1Ue2e6XupESrV6PpGY46tdTTp0B8/WDMbHxF34
 sk5HJ8d1k4K3SlwoNeeOg==
UI-OutboundReport: notjunk:1;M01:P0:NsFWFYQ5lrs=;GEh9sdZDFasqhDd+B/2TVhcz+3P
 aGkkDP6cTnegGGme8Op+dSzeACNo6oj5/YAIxtuxExuC9ajGJJKi4Gqyk9fKcRZQ48HPm4ExX
 hsEAUxp2KUAehBNklnleNdGwNxhnKNDTy17cIcQ/t+R70RZ4g1eWl6KRLA0V63QwypwXFqGMg
 sqJgvwJXkejYYqjiNyCT5PX2yw13j6UtHKG4EVCRQNRwzaPIHXxjxg6nBq2S50R6qp+oTljwG
 vy9HNWti5AoySVcVPrkZWqMVrc5+x1Gq+GOyJvHdGdsoBaFrUkRTtxPTUr0v3OY2zpCp5xa6o
 4BHPUYIJS1npkDwFZhEEXMMyAvdI0/y58cZaVVonrdlg2nn9Bnqh3zSWDWcjTDu3YLTiwEeWS
 7KTjtSvEu2E7VlOiIe7GSuo7wrK2ZlY0XmE7Dq/hhjk/aACQtlcf+o52vtSfMOQsP4I9OVnpT
 vbaC+w7fSYLLc7kdmQ4Qne/bbtT8fp+EXkFgIqJu4+3eRse4w2V4y9XiQvTQgBSBL3fedY5cM
 3WAjiKE/G6B5psJSEEjm23/BF21V/Xz/035TnH9Pg8MndTGwBwyWlh8+uNIHE+8cjrkoGyMsp
 FO63mxc5MIdA96vxtb4hUVMYzKlN6IQIFDoRUY2xbC+HxBRMGKjoXLiPwYkQMFNSYakfZaKYA
 Jf9S++1FhYZNiyBkJq79XhiDMhlyLRirT9n929POgfePRNQf8s/Dz1uF1XgzWGdM1ULj0f1Uz
 Nztd2rZFoxQxyX4fIs+4KNmasNnQIWxJD0TYMGPJFc8/G0anrbDyrNZ3gySwZ8JFAUFG7jq/q
 W+soH/fuYiMzw+bwIxJtY2O68BNf7fy4kuOXZmHyM9X+aAd60wuSBE1bJiAk/88PKpIOxRar1
 Oexv7CEplDVskK6AI/yDh3ZbTc0OPvJHLFJwMjNdDe2RPWiBfE7QFs1OEKM0u67oUomaHsvg1
 um9iGQlxz6i9X+/KE6sjSz8G7eo=
Received-SPF: pass client-ip=212.227.15.19; envelope-from=xypron.glpk@gmx.de;
 helo=mout.gmx.net
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: Z3V3iu/9b8P/

On 1/2/24 16:08, Philippe Mathieu-Daud=C3=A9 wrote:
> On 2/1/24 15:18, Bin Meng wrote:
>> Testing upstream U-Boot with 'sifive_u' machine we see:
>>
>> =C2=A0=C2=A0 =3D> dhcp
>> =C2=A0=C2=A0 ethernet@10090000: PHY present at 0
>> =C2=A0=C2=A0 Could not get PHY for ethernet@10090000: addr 0
>> =C2=A0=C2=A0 phy_connect failed
>>
>> This has been working till QEMU 8.1 but broken since QEMU 8.2.
>
> s/till/until/?

These are synonyms. Till is more informal. No need to change.

>
>> Fixes: 1b09eeb122aa ("hw/net/cadence_gem: use FIELD to describe
>> PHYMNTNC register fields")
>> Reported-by: Heinrich Schuchardt <xypron.glpk@gmx.de>
>> Signed-off-by: Bin Meng <bmeng@tinylab.org>
>>
>> ---
>>
>> =C2=A0 hw/net/cadence_gem.c | 4 ++--
>> =C2=A0 1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/hw/net/cadence_gem.c b/hw/net/cadence_gem.c
>> index 296bba238e..472ce9c8cf 100644
>> --- a/hw/net/cadence_gem.c
>> +++ b/hw/net/cadence_gem.c
>> @@ -199,8 +199,8 @@ REG32(PHYMNTNC, 0x34) /* Phy Maintenance reg */
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 FIELD(PHYMNTNC, PHY_ADDR, 23, 5)
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 FIELD(PHYMNTNC, OP, 28, 2)
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 FIELD(PHYMNTNC, ST, 30, 2)
>> -#define MDIO_OP_READ=C2=A0=C2=A0=C2=A0 0x3
>> -#define MDIO_OP_WRITE=C2=A0=C2=A0 0x2
>> +#define MDIO_OP_READ=C2=A0=C2=A0=C2=A0 0x2
>> +#define MDIO_OP_WRITE=C2=A0=C2=A0 0x1
>> =C2=A0 REG32(RXPAUSE, 0x38) /* RX Pause Time reg */
>> =C2=A0 REG32(TXPAUSE, 0x3c) /* TX Pause Time reg */
>
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
>

Thank you Bin for the fix.

With the fix I was able to download a file via TFTP to U-Boot
sifive_unleashed_defconfig on the emulated board. Cf.
docs/system/riscv/sifive_u.rst.

Tested-by: Heinrich Schuchardt <xypron.glpk@gmx.de>
