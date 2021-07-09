Received: by 2002:ac2:5fca:0:0:0:0:0 with SMTP id q10csp335881lfg;
        Thu, 8 Jul 2021 22:57:39 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzusXro+8N/Hpzi3brycJZ2zwdDM2UBBsXetVYwawAsgyJ64G8hMg1WV5/phAG2Y4mK18I/
X-Received: by 2002:ab0:6c49:: with SMTP id q9mr535516uas.43.1625810259436;
        Thu, 08 Jul 2021 22:57:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1625810259; cv=none;
        d=google.com; s=arc-20160816;
        b=mVuKjljIa2h1B/j2REmwyi282W9+58SQrGOcOvv6ifr7CKEfaSWX4vkIBdI/BNx7dt
         Zvce79dSbKR6hSrxyyiIq8b+nugN2JvqRdBWT4BLO/tS2nXJPqBzd/0/kOMAzj3TRJzJ
         wK4dH6eD9jOnkKIO/d8dn6H85AQ26OiKbaMFqz0gE4MdcMbDp33AQUyPil4KfMAyAdP5
         gdxEqe4R9wXToRZMOEO7FcyUeCbPBi4mkSUH+A3vmWlDPCnqHHb5ref3EXcDe2AyRmee
         CadK21PTwa4FPEFlazH0fAyw1dfMDv3hawCJBkmDwQTqrYUMclD2GBTeRnbPLYOpC2W1
         kivQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:subject:references
         :in-reply-to:message-id:to:from:date:dkim-signature;
        bh=xatCqgmPEZajGMPDKXjCB+yOIoRVc7JbcnKhyWDrJ0o=;
        b=ps5BTArf0eDqnJ6fsWU86zRjjfMe+jQPX26uxNz5Pj+rk+tSLxPtcVIPRF7L241QVj
         hlNSGduPKU+2L1nhzgEZoCwbD9JUYCLVMCmfTHQb3VzzoZmZrT/IdjpSwjnVvSQjZiVo
         qaIRkVjLYOKN9IBoLGXd0Lj1/iAKoJRCJxcGxn+4OEenKLKXEyZ/bjJBbnKmi5nLFNll
         jV1X//zlDsoA0PvLyRJeRPqnCAaoVj026T9I/BY4XwTx0lyo+m1oyV8mcmvVmELRWpss
         8QjUwYp/V26oFdUPSM2OmZi4Hlg1qpG+HCw6pos5JCVhjx1WgTr+Zk7Wo9ejcido8PK9
         /1mQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@yahoo.com header.s=s2048 header.b=KMckL2Yp;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=fedoraproject.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f2si4407380vsm.278.2021.07.08.22.57.39
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 08 Jul 2021 22:57:39 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@yahoo.com header.s=s2048 header.b=KMckL2Yp;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=fedoraproject.org
Received: from localhost ([::1]:36066 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1m1jW6-0003T0-Mj
	for alex.bennee@linaro.org; Fri, 09 Jul 2021 01:57:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38456)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pjp@fedoraproject.org>)
 id 1m1jMN-0005lD-Ko
 for qemu-arm@nongnu.org; Fri, 09 Jul 2021 01:47:35 -0400
Received: from sonic305-19.consmr.mail.sg3.yahoo.com ([106.10.241.82]:41312)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pjp@fedoraproject.org>)
 id 1m1jML-0007Mw-GU
 for qemu-arm@nongnu.org; Fri, 09 Jul 2021 01:47:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
 t=1625809647; bh=xatCqgmPEZajGMPDKXjCB+yOIoRVc7JbcnKhyWDrJ0o=;
 h=Date:From:Reply-To:To:In-Reply-To:References:Subject:From:Subject:Reply-To;
 b=KMckL2Yp9VhRs+ilQBVkLskIt5uq5HaSTAAQgAPwli9IHMlVTrhYdBdoVLUg/Pi/qYiaUqe7L2+PJS8G8vj9EO+GMzJBK27eWm90nYYXBZWAmgZ8MGq1hsLI6Qt5T2GSrBDBUhYAXIurYhmjV+53dVwQeWDrsTrr1WkOla5kWIO9Zdqr4iuaufnfDURcR+8vzJkznNd+4sceIQ+gxofKzRJa8ZGPcsNNx2qYoP0LL4seVQJNYrAisZFTk0aBcJX0vacgg3so4GLMTy7xDqOJvTCIOYNyhPmX/qh8NHxmeIWFtEENXWBMXrX6ISI0qDXSNYG6EVGaZiF1E0lqxyeW1A==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
 t=1625809647; bh=/9HBcBYp9ZS1PnDxYker0lyHZYhw6OvWbZpOOyBEG8v=;
 h=X-Sonic-MF:Date:From:To:Subject:From:Subject;
 b=Lwqtiv4G39qQxfjUvhwpRwwuwrRXk48uLfVNLM8xifqRlgmGvY/YiAl3gcfJ6WhjNnySmWYg3O09zd9vImNNK9dl3geijOoZ0ylSx0aXlqv1uNbS5xR/CB8/SVD20chnoZz0gw21Mo60TSGC7+XO/l0YirpkT31BuRwCQ+OZt0cUfD9wpx9ecsELFs6ZiPar418nd0hToFRPI8R7Dj6G6w9xn0URuCVKOXmYz2Ltejmj8h8J3KLNwRWyKrW+NwmNuSkbyz4xfBEs8zjA8yjyLIcTid/b8leRIgLBQmJDZ+3lp+dTnBzboxyhFTKCmtDSqqq9mn7SZbnX5pf3pC06VA==
X-YMail-OSG: By7s2ucVM1l9X0Rx2ATSuv2VjUFugGMwDuV16ng80UQx6cWwcnhkFGo_LSn9i.X
 oE03No5Ja43Pa7mkLKnULZbnjvRqkehgAa1jDX9cACUiIxmZHqhiEt.BnlEkgu7Hv3Jmlsaocstj
 mleCDpjPg7qDZZha35tZceBHZpbJ_igXXyDjJQXaW2bVW6pADk_H4OOgA3f4qhfOfs9W8GXnrDwE
 FNrNOrZgkWsuvjauuy8NTnILQ32OiGYZS8dnnLR_9Ybj0GxoQpr4L47mLJ_KI0xSYKcBAiKGi_yU
 099vjhQx5ew2z0C2DH2m6Jtf0vdGKKjEHREOt4WMhqNvnMlGf4C5NZ4roByL7UEvjh.9gL3jHWxf
 BYNaWYlXv.t_SO8YWNqSQND1x96lzSALoO1M33Bxg5AlH8xCaJy8XeO3zR2o7gstyul_HUzNMZkp
 NW4PUXLNhll7UVjV93abyFfvyBhlD04eCsPJV4wzMZ_w5jQ89vxQioE2a19ZubrnEFUBu0AzjS0G
 CvHihe82..C.Kdix.4MjF5G128JtHgQMB2kZqz4akhWrEZ3XmZTxykqdYTnJ2wZ2FF69iWk0MCjs
 FjNgDFJOg4Sjt52yF4UUmLPLjUIMosWJr4WwEbdnZKN8iMwrTbGbQ1q0vPAHn6oqctHjYGJqDKvD
 QGVa9gY993AZ8Equo_BfmUCza3mfRfCjx_YnMZ8ZDG1_AGiny29mvyIp5cPYddhDKKPBpcjYxofO
 t8NwI7ptTL8RrKqv4LFn_1N_qiz6a3NDK1vjncxO4XhQHcxKGKQMBP4e2JrlfSwjB49AfZGlzc3l
 aCXE34pMdX2DbviMDJ0aRDzUu3iZ05uod2_JEFhlaIDgjSNR1afcPlRl618rXPPi5LyHMhVH9v3_
 aZLRhYe1juOWzEU_h9tBupdOZuKsHIHRsgXhapfu_3LHJvFQ6dC_M27C3Qay.W74lrMsTpjN7wHV
 rrjS2wDOaavM852fo1unuXMmDnkb.Csoh.4lmzwZ.5gLWauc4uSKeZQ0yLGOn6tNlxP_MTbPdzhC
 zsX6HB8uXPkd3fbI9I6OcFW8NmopXVcmDNlrBFOd1a7xCei0Zuw3lPysbEqLD8KLI6fs7MQ5fji5
 vrA72GeqCOsH.81X.b235YU2ecqwwKsKTubTyAoudw1v4Za3PIEWmOK6gW.pAmHYLrM.SvSI0cyb
 3pB.pvCYUOXiF1QoWBByFkWhLsO9xzbMpq_owUgVfdH4ejQeraB0HWUwvk1qprxlwauRFfwmwaoB
 kkqPgnnzuRcKRt3Oajfkb7fLmGEcCL9ukhAt8VpbutUV.37Ntjb7HOGvI6w4PVKDIvDayF_kXaUE
 3TmqCRJ6B.uwxuIDwS7wcLi.rb7EhOqauAsl2OCZUz27IzLPQO2H.Vc4QMZfyw_Q7MgGZ9Gq0J.L
 w38Pon1pcLm741wjfW.ChC5SoBaUqSViaTMIc6mfbeKDst35vJIRdDeNhFqWJiIjYORHrlkasViD
 M9bWH.w9oR4RY_TonAqqkAfMpDi0KG2WSxZwdRnu0V_eCaAd3SpGXQRuFLYs2WZP.e9uVDE9AstX
 aHNsQ4gOj_1q_jFV4UF8glDMYBQREtmbsk3VqVB6hDOXqHhlB9zf0Tcf99DusHNzDEb5iemtm0G9
 4uaaFHO7ycRZc70XpidCS1w9UuidE2G6foTKcuDZrdk4wE5xCcKWVo269WrbLbFou2J6xpkkPWY9
 Tx6YSzsQK8CnhGcthtRSjghPaszsKRcSC_eUjVAjrCp_lCKi73xo_1e9T_pZtJmdMAMTkkOTZMnI
 z_rxWmv5OX1y0tQcwaPzPDJcDSBkzKpZFJBUB3tSxcu0FEaNZRLdWrZuugvpjjkR2g5TSB9l72Vp
 nsV26im.37HVkCNuU2Pj4Rr2pcTM.ilwZdAaP2L12DNJ7DECSnT9_bgdZ0hd6303BU9ltX6k_w9j
 .gcGqLTkEc7q34UbKrIkmd4KsSsFC.7XjCNKhoMgacYJNc3ITkfqN_f7.isihEKpBaBKjLv0.ECI
 NHFZDrJYgwUpsc2RaGKTogvvEKEQl0r7.wR0ol7LGL_AlaTLeFynWFGr7sXF_U62nBUPmC6s1X.t
 LQ3UemtM2i.Y2eY0NGMFNIYBstt3p23LqZp8H8U1qL0r04KRK9JrJA1GuLeplu68cBAsOuWP6lcr
 iIAMwkWbbrwAWZdx8Gxj1ig8wK6.80pNJ0a.303goNjGUU_9ipoMPOvUZ3Jjj5IN223OVSG0KYqx
 RXCVMyE6rnMpe2z2wlF9WmkXclh_MgrhDV3bJ4NwbGospNUs2VxYnrLKruDD_BIdaMfYyBFRQrxc
 OM6QPiW4Q8R7ND0Go0nNWyJ3Xa5N.u6Pogc3SSXrwEKCbY90kDZmWY7pOeHDIw0_czJCQUDP3QPj
 FldYERVYznQgIzkKvm2cjhPJc6A_FGJgX.U5Tdd7FS18HrpyBmTYiMKa_svpQdAUedINvtjF3bEY
 zUUFepom0ZgbVYSJfcR6LLYjInnoA8TxVEQRzG1AurnN0tI9ppXNgPdc1bzYwA3bZKh_XECt4jnc
 Cr579KBIto4BK9j_6DdMz01bKiCvAq.39hQneu2vTpEUY.GZw8b61BolBbHPMyGmDvjgUtxgPbMz
 Yhg.lCoN3vACEbNpuKBWBn_Byae.RSJ_8WjU_eqnNaaLKx9rwMOP.GyDSJZ.jhkc6c_VegS5hl13
 ptRLtcPKjnLkbKMRs1XzMIFRvVCVVfHBzVG_wkgWUodCelRXghwb4TpI_k6JLD38rU0LTgm.g0un
 ZzUZ0pGAUc5LYGa4ku7DkAhW.sFChBmM3Ci8uNM1wfD7XoU2Miyd2KeH1GMjvvtaOKrB_yKcNme.
 zm7lqWp828hl3lcY4SVgjhNaS3RvuGTKZJDWZG73s2mdNvCTE58cx.EHZGwJDyA--
X-Sonic-MF: <pjp@fedoraproject.org>
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic305.consmr.mail.sg3.yahoo.com with HTTP; Fri, 9 Jul 2021 05:47:27 +0000
Date: Fri, 9 Jul 2021 05:47:21 +0000 (UTC)
From: P J P <pjp@fedoraproject.org>
To: "qemu-security@nongnu.org" <qemu-security@nongnu.org>, 
 Alistair Francis <alistair@alistair23.me>, 
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, 
 Peter Maydell <peter.maydell@linaro.org>, 
 "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>, 
 "yajin@vm-kernel.org" <yajin@vm-kernel.org>, 
 Mathias Payer <mathias.payer@epfl.ch>, Qiang Liu <cyruscyliu@gmail.com>
Message-ID: <1437061986.489095.1625809641822@mail.yahoo.com>
In-Reply-To: <CAAKa2jmatcBonTYeZCHnE4TR543FKQR4Lrv2iMKaZUprXH=3ng@mail.gmail.com>
References: <CAAKa2jmatcBonTYeZCHnE4TR543FKQR4Lrv2iMKaZUprXH=3ng@mail.gmail.com>
Subject: Re: [QEMU-SECURITY]  Out-of-bounds read in xlnx_dp_read
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Mailer: WebService/1.1.18469 YMailNorrin
Received-SPF: neutral client-ip=106.10.241.82;
 envelope-from=pjp@fedoraproject.org;
 helo=sonic305-19.consmr.mail.sg3.yahoo.com
X-Spam_score_int: 10
X-Spam_score: 1.0
X-Spam_bar: +
X-Spam_report: (1.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 FREEMAIL_FORGED_REPLYTO=2.095, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NEUTRAL=0.779 autolearn=no autolearn_force=no
X-Spam_action: no action
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
Reply-To: P J P <pj.pandit@yahoo.co.in>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: UwLakiHLpauX

Hello Qiang,

On Wednesday, 7 July, 2021, 11:38:09 am IST, Qiang Liu <cyruscyliu@gmail.co=
m> wrote:
>I found an out-of-bounds read in xlxn_dp_read and here are the details.
>
>## Root Cause Analysis
>
>1. xlnx_dp_read allows one-element-off read at its default branch
>because of an improper index.
>
>```
>#define DP_CORE_REG_ARRAY_SIZE (0x3AF >> 2)
>struct XlnxDPState {
>=C2=A0 =C2=A0 uint32_t core_registers[DP_CORE_REG_ARRAY_SIZE];
>=C2=A0 =C2=A0 MemoryRegion core_iomem;
>}
>static uint64_t xlnx_dp_read(void *opaque, hwaddr ...
>=C2=A0 =C2=A0 switch (offset) {
>=C2=A0 =C2=A0 =C2=A0 =C2=A0 default:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 // (0x3AF >> 2)=
 is equal
>to (0x3AC >> 2)
>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 assert(offset <=3D (0x3AC >> 2))=
;=C2=A0 // the op should be <
>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ret =3D s->core_registers[offset=
]; // one-element-off access
>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break;
>
>According to
>https://www.xilinx.com/html_docs/registers/ug1087/ug1087-zynq-ultrascale-r=
egisters.html,
>offset 0x3AC is allowed.
>
>```
>#!/bin/bash -x
>export QEMU=3D/root/qemu/build-ubsan/qemu-system-aarch64
>export BUILDROOT=3D./ cat << EOF | $QEMU \
>-machine xlnx-zcu102,accel=3Dqtest -qtest stdio -monitor none -serial none=
 \
>-display none -nodefaults -qtest stdio
>readl 0xfd4a03ac
>EOF
>```
>
>Let me know if I need to provide more information.

* Thank you so much for reporting this issue and providing the details. I a=
ppreciate it.

*=C2=A0It does not look like the issue maybe reproducible with KVM virtuali=
zation use case.
=C2=A0 The machine 'xlnx-zcu102' looks to be a SoC system used in industria=
l applications.

* Is it reproducible with the KVM virtualization support?


Thank you.
---
=C2=A0 -P J P
http://feedmug.com
