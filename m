Received: by 2002:adf:c793:0:0:0:0:0 with SMTP id l19csp2035893wrg;
        Fri, 17 May 2019 09:24:44 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzqWjuDAtrIVahWcXEVp+WIBnRin1UXXRoXGXfGK4pmTVxopl5X/7VP4W/HbdTlFr6cYUjG
X-Received: by 2002:a17:906:6a02:: with SMTP id o2mr19381350ejr.164.1558110284830;
        Fri, 17 May 2019 09:24:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1558110284; cv=none;
        d=google.com; s=arc-20160816;
        b=BAJHdKHUiWStQhMfep4RkKBkqRm8rs1An8Ksq+y1CLEYNg+CESAqthqTGBvwJf/AdL
         4MQH0DMCTegRN/x/NL8Oln9idIZvxmw8YdcIvmFYBmI/gslm8KOS3vvOpofxMleBw5VL
         rJFQXw4gp2h/IkwJdTymKcSdwtEswc1QgFlBF3Wb9080+Vpznl7iK7qaa7H/1kJt+FBh
         1R5KoFjft8nWNz9NZVEcibnVczXZlwIBgi+522Ehai3KGbK01accgn3tg4VoZ5ZLKs33
         EqkgZcQUat3d5kHI1U90HhuRqI93S36ziuvYZjwn+200ZgiVHyaYnJHfdEd4vlZp42P9
         HnbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:to:message-id:date:from:in-reply-to
         :references:mime-version:dkim-signature;
        bh=jXkkwto/pM5j3Mg/TbuErCm0nmSG5Q/rF/IRfFGEpUw=;
        b=UMlUtLIkuJHw/2GitlnkHfgWF5+uNWJ4xtVwQV0JJk6ER6AKnmvkIclY8aNrjm3ovT
         wmL53wvX9uoz5oX7afTn94gt1cyyfIGlJybu4eWvJnMdBVBG0pTHuID0QBmX8TZpCYFY
         b8z3vpUcLIdNEL/3BGFuHse9m7Rw/w722pwHoJGEHce/A9qpbkUO5WSS+LFbDU4HBj9b
         rhgI2PhId9DnRYmF93i/CyoFd6sNrylunAJHt978dvUv8ae60Hkwi0ALiwo3ea6oquas
         unTbdRWp1t8n863klXmtR3LOnWzxTOytfDfQIj6zHhY8X66bzVD06XQ41z24XamSZNdr
         fUXQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=kDMZU1BA;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e2si5978634ejt.101.2019.05.17.09.24.44
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 17 May 2019 09:24:44 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=kDMZU1BA;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([127.0.0.1]:50985 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hRff1-00033Q-Ut
	for alex.bennee@linaro.org; Fri, 17 May 2019 12:24:43 -0400
Received: from eggs.gnu.org ([209.51.188.92]:35525)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1hRfer-00033H-Ej
	for qemu-arm@nongnu.org; Fri, 17 May 2019 12:24:34 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1hRfep-0004da-S9
	for qemu-arm@nongnu.org; Fri, 17 May 2019 12:24:33 -0400
Received: from mail-oi1-x241.google.com ([2607:f8b0:4864:20::241]:46443)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1hRfen-0004Yg-Jh
	for qemu-arm@nongnu.org; Fri, 17 May 2019 12:24:30 -0400
Received: by mail-oi1-x241.google.com with SMTP id 203so5555340oid.13
	for <qemu-arm@nongnu.org>; Fri, 17 May 2019 09:24:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=jXkkwto/pM5j3Mg/TbuErCm0nmSG5Q/rF/IRfFGEpUw=;
	b=kDMZU1BATLcZ0Tr8CwYBDoyUk1MDdcHTqu5iftxrSsbTryL+0dBWoBzHzMVvrsMPEz
	4jvHlgft8WSQK4oNzbb/S9V4+CXZKYPk8KzKVvaMIvnr6TyiCEZbnRfplZ7bpl+NazB0
	wFrtFRihlfzZkkfYZNJVGtpyZpEYX2QJvZtgmESb5c3rUIf/Y9Nr/zyfIm157eYmUtNm
	av8KOGmzyqyM4Gr3bS/Eiq6tOLo5w/8taubjwGjiDaIBTPcH+4j8ROoZyKjR37KF7o14
	/oihTYJMpsur3m7KfypT1xk52wICSFDQvwXYccWsduLnmNcaPD7K8MfMaLRQtvGo8+8x
	61Vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=jXkkwto/pM5j3Mg/TbuErCm0nmSG5Q/rF/IRfFGEpUw=;
	b=bRfCK12hEsvumta9Z4dUK2e8CSMPTf8XJIWfa5yC1PCW7HzFQnZVMfCVUZPBNz6+JI
	C976gahA+hgkp9idqLyoxlFL+s/ZzA7pz9+5oECeYomkFDriEOgcOX9df4FNq3veG5fl
	60f2lSBW1L1I56eU69ZLkmDAlZLXQ/QN8mFteiU+/SyKL9+P0aeHDKZ8s+VWTWtmM8pb
	mCAE2IweITy8eq+NZC8CMmAx0bUvTB/QjBRehEUXbnIi9X7Mr9Fgaav2Nrz4ATfEBhI0
	neSECXFz25b+rIkoE1E1WZuUWUYmr94onXPGoHld9idTPDtpqhD6b92Ng7r64osWUkcW
	WXVQ==
X-Gm-Message-State: APjAAAWrxO17YS/TXs6L8FIEkR0qqprFNeoBJ7qA5VvDmEA6v55+v6z8
	s2xYv75hrOv+a7onvKeMwOWojjeyx6F9QGuRsR0zpQOfRvM=
X-Received: by 2002:aca:5785:: with SMTP id l127mr13503545oib.48.1558110262233;
	Fri, 17 May 2019 09:24:22 -0700 (PDT)
MIME-Version: 1.0
References: <VI1PR10MB204723BF7D62501F0339242A810B0@VI1PR10MB2047.EURPRD10.PROD.OUTLOOK.COM>
In-Reply-To: <VI1PR10MB204723BF7D62501F0339242A810B0@VI1PR10MB2047.EURPRD10.PROD.OUTLOOK.COM>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 17 May 2019 17:24:11 +0100
Message-ID: <CAFEAcA9_oe2NTnyb9ce_hH5jaaTt=V4-iOzC3a5Un8k1TUWHzw@mail.gmail.com>
To: Torbjorn SVENSSON <torbjorn.svensson@st.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::241
Subject: Re: [Qemu-arm] [PATCH] target/arm: Fix broken VQADD and VQSUB
 causing abort
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
Cc: Samuel HULTGREN <samuel.hultgren@st.com>,
	"qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: OPN08znJ9JxJ

On Fri, 17 May 2019 at 17:04, Torbjorn SVENSSON
<torbjorn.svensson@st.com> wrote:
>
> In commit 89e68b575e138d0af1435f11a8ffcd8779c237bd, the handling of
> VQADD and VQSUB was changed for Cortex-A and the new handling does
> not return properly after calling tcg_gen_gvec_4(), thus the code
> after is executed and that does not know about the VQADD or VQSUB
> instructions and calls abort.
>
> Detected running GCC testsuite for Cortex-A7 and executing the tests
> in QEMU using Cortex-A15 since Cortex-A7 and Cortex-A15 have similar
> instruction set.
>
> Signed-off-by: Torbj=C3=B6rn SVENSSON <torbjorn.svensson@st.com>

Hi Torbjorn; thanks for this patch. As it happens there's already
a fix for this on list:
 https://patchwork.ozlabs.org/patch/1100645/
so it should get into git master some time next week.

thanks
-- PMM
