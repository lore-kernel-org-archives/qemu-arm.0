Received: by 2002:a17:906:ae84:b0:982:368b:d395 with SMTP id md4csp971965ejb;
        Tue, 13 Jun 2023 21:50:54 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ6OOXbJ2Rgx42Zc7BHPTqLpuUnQEh75PbrRyxSGYITbhQ43iFpK4FDEuqGU81kcr9G6PF13
X-Received: by 2002:a05:620a:318c:b0:75b:23a1:8e72 with SMTP id bi12-20020a05620a318c00b0075b23a18e72mr16354468qkb.67.1686718254676;
        Tue, 13 Jun 2023 21:50:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1686718254; cv=none;
        d=google.com; s=arc-20160816;
        b=gLIZr3suaIs+i8qop4hMXCbwaYiE1yNPWO44nFnqD24gdIEXzTxUHbOMZ9DA1W/006
         hjEvikd8CB/+kBwA3xv/s7LBY4zG2jnsr+C3+asB2fiiy3n0GMqbkSdD5V84FadHEtyV
         pz3ph6b7Udn607Q9fce9eVrbqSViQ1z4D/lpEVw5tg98QSl8am1qiF8WQ4iSyzdNSKz1
         i8qVeBYfWX1Yz3+KFPix9YdehLZO1J/c6JtMBW0YHLhHz/HY8j97YwH+mT0fO0qVE+Nu
         SOgUozaYskDqW+7Em/EeK+TJORuxQsQM/udeICq8dyDIjvNYL0/w7yjXhx31VqheOOi7
         dkWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :mime-version:dkim-signature;
        bh=FEzbSDoUSQgIHPwBqGAe9k8F4pTkHXMWwH/iuD2XCBw=;
        b=QiQ4/fe0uwZFxPpL48yWfS+91OP/5Z87PPAvprvI09mE/RrvjOgSx6IS3SodiCcjbd
         abtQBOeFnmoC85APnU+K/nbRrEyIoNYmvJTdOuvrMZHv2iYsBjXxatm0VYO1cQFjbZ6x
         eAOOwAhRL3j3lGiLSDyXp344f+psT72M6tbDgb06xFRF/Z9ps92PlbBPqUFHNi/NDu6V
         elRpDn+caf/UpVn/iifdbUmCuzBFQk8vCbGniwQmHM408+Pc/fFUustySxUpoNekVJYX
         g3hhKP2qEFOLsXJd35TYJtlX32FLGWtNxLWfUG48ZYiYrH3aqE5tQddRI5fq0MwIWzyt
         QH5Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20221208 header.b=rc5zD0BI;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ow32-20020a05620a822000b0075919ea3075si8184736qkn.339.2023.06.13.21.50.54
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 13 Jun 2023 21:50:54 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20221208 header.b=rc5zD0BI;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1q9ISy-0003D2-R2; Wed, 14 Jun 2023 00:50:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shivamvijay543@gmail.com>)
 id 1q9ISw-000358-9j
 for qemu-arm@nongnu.org; Wed, 14 Jun 2023 00:50:42 -0400
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shivamvijay543@gmail.com>)
 id 1q9ISu-0004WK-M3
 for qemu-arm@nongnu.org; Wed, 14 Jun 2023 00:50:42 -0400
Received: by mail-ed1-x52d.google.com with SMTP id
 4fb4d7f45d1cf-518ff822360so28990a12.1
 for <qemu-arm@nongnu.org>; Tue, 13 Jun 2023 21:50:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1686718239; x=1689310239;
 h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=FEzbSDoUSQgIHPwBqGAe9k8F4pTkHXMWwH/iuD2XCBw=;
 b=rc5zD0BIEaCwnsH2zpETg9GtD5vk7Pt/GQWCAFMwiDcdvFa9uQb5sv5iAVBFSyreV/
 nDOoWiXE2YbgUB/nYfo9XWczdSyEkbHGlxCXru4ZOlJBiSN3Sb1ETfn4EKxwN2Tl6hPx
 C90DygyDoPm3W5Jsr89i1dcL68Y5MCx8/PslCruWTRChkVsSQMk5bJR6TOyqUz0FcGRZ
 ZpT57iwzEm7o2tAwU88nu9+eoJZe3fItpX2p0aYO8feXuXO95a1aqbN/v1XlFVCq+YPy
 zhcjBEX0DYS/KKSPMVUDPkBYGzGjXmHqK2fIZgacHDFD3lY0o71wjq4aVlJHOgWaXzqu
 LbMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686718239; x=1689310239;
 h=to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=FEzbSDoUSQgIHPwBqGAe9k8F4pTkHXMWwH/iuD2XCBw=;
 b=S56kwsAnVKuWvKzuCG+s4sSgN426ydX+CZgVD80dt7dsaLPd5zIg1lIExMjsgKptSz
 z0gwrm4oaH2jE72ZSkRyWBjUpPYsh1zrCd5NzKKfsGhXB3AxyzD+z9uxa41v950Fvrg0
 O9GnvphQRYrGWz9r2IGzbbrOvKx5UuH2A8jJg+AVLelCuznxSdDGrgLoSVO9+Po9mWrh
 RO/jmbSRuxhJo8c7liKF/1DjS9I5xmbSn6TSjXMPqml1IUySLQ4tISM2QT/ZIuyCU8YK
 a6aHOGOzJjNAcE79ocm3nIv8ubZTykuvdeGL+hJNKkFZKrSNjs5DcUcJUHKN+3dglbLG
 M/lw==
X-Gm-Message-State: AC+VfDzoxnxBp7kJUQlSnmHJ6qNaGpiDUPrrPwivj694r1StwD9/ArvY
 TkbDRf8GupTkD5dlpc6h5sR9rrmVwx1NTpgweMnvxcuTXup9uA==
X-Received: by 2002:a17:906:9b8d:b0:974:e755:9fde with SMTP id
 dd13-20020a1709069b8d00b00974e7559fdemr15547198ejc.19.1686718238755; Tue, 13
 Jun 2023 21:50:38 -0700 (PDT)
MIME-Version: 1.0
From: Shivam <shivamvijay543@gmail.com>
Date: Wed, 14 Jun 2023 10:20:27 +0530
Message-ID: <CAC583hEYC3V2XGg6af=Ai=JLpTxkV74kT98XMNNdT47m8ruS4g@mail.gmail.com>
Subject: Support for ACK and PWR Leds in Raspberry Pi
To: qemu-arm@nongnu.org
Content-Type: multipart/alternative; boundary="000000000000750df205fe0fb132"
Received-SPF: pass client-ip=2a00:1450:4864:20::52d;
 envelope-from=shivamvijay543@gmail.com; helo=mail-ed1-x52d.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, HTML_MESSAGE=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
X-TUID: NOlrTjBV2Clq

--000000000000750df205fe0fb132
Content-Type: text/plain; charset="UTF-8"

Hi, I want to add ACK and PWR leds support in the qemu raspi machine so
from the terminal of emulated raspi I should able to control these leds, I
coudn't able to understand the hardware level controlling of this leds , so
if any can help me to start on that then it would be great .

Thanks & Regards
Shivam Vijay

--000000000000750df205fe0fb132
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi, I want to add ACK and PWR leds support in the qem=
u raspi machine so from the terminal of emulated raspi I should able to con=
trol these leds, I coudn&#39;t able to understand the hardware level contro=
lling=C2=A0of this leds , so if any can help me to start on that then it wo=
uld be great .</div><div><br></div><div>Thanks &amp; Regards</div><div>Shiv=
am Vijay</div><div><div dir=3D"ltr" class=3D"gmail_signature" data-smartmai=
l=3D"gmail_signature"><div dir=3D"ltr"><span><table cellpadding=3D"0" cells=
pacing=3D"0" style=3D"color:rgb(255,255,255);font-size:medium;vertical-alig=
n:-webkit-baseline-middle;font-family:Arial"><tbody><tr><td><table cellpadd=
ing=3D"0" cellspacing=3D"0" style=3D"vertical-align:-webkit-baseline-middle=
;font-family:Arial"><tbody><tr><td style=3D"vertical-align:top"><br></td><t=
d width=3D"46"></td><td style=3D"padding:0px;vertical-align:middle"><br></t=
d></tr></tbody></table></td></tr></tbody></table></span></div></div></div><=
/div>

--000000000000750df205fe0fb132--
