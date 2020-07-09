Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp1696686lfm;
        Thu, 9 Jul 2020 11:49:39 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzn/QYzGdPtYt+SOJI/dDTVraTp0qKZsqPIenVBZrNePtLzpOegPfQy+tBnpDL2SkGE53WB
X-Received: by 2002:a25:2a8f:: with SMTP id q137mr61711094ybq.462.1594320578978;
        Thu, 09 Jul 2020 11:49:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1594320578; cv=none;
        d=google.com; s=arc-20160816;
        b=zFto2GY6oqIwGLvWhBEtOoPfStibBmyf4gXNK+M3+EyKX/vWsrYPmMf79tU4tTfZ9y
         g/xWwmKB2Bp0pkGMX22rI/9HCvgNnL/NrR7cgQzJ1kkLMXZTyKPFxRz6oD94SwadQSSZ
         Qx51YGDjwM9MYEcpDFtPZ/5yfg6RkwdugVm3JgTfy8Q18/BBTvesQntSBH8wsSRm/JxC
         7wp8XRUc8vr+i5u4WM8MnQkL/uAXJVleGEyfYBOyVlExMI7A47m7zYF+YgZP2Vtgm7EI
         qVJxbCjnZN0viLj7C69AmsrOcY8idD0nNw+okWMXM2SXCdOdSEAUWDvijBVOFb+oTaBv
         CF+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=FSCKa6nGURV29hH9IPRhTpUvlWl3FbAKLnoLYXR7qOE=;
        b=RbwMwKZnjll1vsZEH4LQi3F4LNRWV8EOflmDKxgx4NAtgzbIb59tbSqFzpFtEnOTgw
         AyZchd9MovvIlWaB8FcX5QlM13qU54sRTcLOSsDig4n/9lKc1YkR9OsZz5LmXidOhiJy
         +rVxDsFpJOtbx8kvihU30J/X4X6Awps/cafWP5ewEYmdvETppnm/oYHcfLUbhoL7I7pR
         Q6UDh7c1bDeoPRkbQcLCRg0PyvhKkNYPzdCKZv7LX3ampSxn7IuNMBT8BawfUh7Esoh3
         MfED/Ps3KMl7DdQGSraME6/bdItfzEB+gfzBzfHr+BJ+qJECOP6y2QDxYJ8snTjPYpXg
         KeYA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="qZoB6z/0";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y9si3442181ybm.274.2020.07.09.11.49.38
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 09 Jul 2020 11:49:38 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="qZoB6z/0";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:45462 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jtbc2-0007Md-AM
	for alex.bennee@linaro.org; Thu, 09 Jul 2020 14:49:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45590)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jtbbu-0007Lu-5B
 for qemu-arm@nongnu.org; Thu, 09 Jul 2020 14:49:30 -0400
Received: from mail-oi1-x241.google.com ([2607:f8b0:4864:20::241]:44525)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jtbbs-0001zh-ED
 for qemu-arm@nongnu.org; Thu, 09 Jul 2020 14:49:29 -0400
Received: by mail-oi1-x241.google.com with SMTP id k6so2685284oij.11
 for <qemu-arm@nongnu.org>; Thu, 09 Jul 2020 11:49:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=FSCKa6nGURV29hH9IPRhTpUvlWl3FbAKLnoLYXR7qOE=;
 b=qZoB6z/00OFv0KcVfwP/FQvV2ZERilSZBJdoXNICOsdjLPFLGUGFlrvOObp1Nvsa+9
 VXRMxvo9+opWTz3vGndIGQ/zWyocfGAlb07HXfVQbz5NeA/6Bqz+pTkkKnWAimTahbyk
 /XVOOGaQ4Q4e3ZSErE3xnewIwXncCBBA7sUvdE0CxahUL7aOHXQ3T3nDLo60r4ya1s0k
 dRrbXvbAPMNgHQg3/+BTuYOGTEmwXjZ3Fx+9NUhP3QupiEAQ7M2ikbr3nIlNk9zoB/S8
 nU8SHaWkoK/PelP691tsTMiS9SaxV8OvYQeptHW8p+bhKnT3ZpEyyvChLYktSKpdZdnC
 rKGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=FSCKa6nGURV29hH9IPRhTpUvlWl3FbAKLnoLYXR7qOE=;
 b=mgclrvClOkx8tG0r4a/St+TeFHvpQVbQOscj5nDI6mYGPxrRnJCeTUQozfE5pJaE1Y
 6EY20jUipLfzkgN5ilfqxywKn4IWaYFiTL1209JvMuZ/ZNEyXUGwbs1BnGnUj8Mn1gjt
 Hd6rZbSawxtkXKcTJD406KWWRYfuDO+1Pb8guAN8LdOO6r+vG2wAfJnYi/jbb9qWUxci
 dD+fvS3nQpSxQqyB5j/ZAJNzy4meHliingS3Osfho1VZv4F9embGd1ESjJFIXUyKKK9H
 5LV5wRlguD0YIudZpOTtO36y+ygxuMIkhZw4Szik3530fgCCo/lYym1bk9OLDUW+YPIo
 csvw==
X-Gm-Message-State: AOAM530M9jFyPKC2+E3rrRU2Yg0wsxn38SPVgiKHmwRYucWKp9xn8VYe
 yUkhleJ5sVmwhqwAIK3ZHV2MPyRSCRM8NO9L1GDMMQ==
X-Received: by 2002:aca:54c9:: with SMTP id i192mr1287480oib.163.1594320567428; 
 Thu, 09 Jul 2020 11:49:27 -0700 (PDT)
MIME-Version: 1.0
References: <20200705224154.16917-1-f4bug@amsat.org>
 <20200705224154.16917-6-f4bug@amsat.org>
In-Reply-To: <20200705224154.16917-6-f4bug@amsat.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 9 Jul 2020 19:49:16 +0100
Message-ID: <CAFEAcA9vUqvHYzeSu_-OTxEMBq6fmBhZmigKoVeUbNTo8BS2iw@mail.gmail.com>
Subject: Re: [PATCH v2 5/5] hw/i2c: Document the I2C qdev helpers
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::241;
 envelope-from=peter.maydell@linaro.org; helo=mail-oi1-x241.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Corey Minyard <cminyard@mvista.com>, Andrew Jeffery <andrew@aj.id.au>,
 Markus Armbruster <armbru@redhat.com>, QEMU Developers <qemu-devel@nongnu.org>,
 qemu-arm <qemu-arm@nongnu.org>, qemu-ppc <qemu-ppc@nongnu.org>,
 Joel Stanley <joel@jms.id.au>, David Gibson <david@gibson.dropbear.id.au>,
 Jan Kiszka <jan.kiszka@web.de>, BALATON Zoltan <balaton@eik.bme.hu>,
 Andrzej Zaborowski <balrogg@gmail.com>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: rGzYDgjOtYS1

On Sun, 5 Jul 2020 at 23:42, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org> =
wrote:
>
> In commit d88c42ff2c we added new prototype but neglected to
> add their documentation. Fix that.
>
> Reported-by: Peter Maydell <peter.maydell@linaro.org>
> Reviewed-by: Corey Minyard <cminyard@mvista.com>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> ---

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
