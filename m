Received: by 10.25.0.144 with SMTP id 138csp759220lfa;
        Thu, 20 Apr 2017 07:26:19 -0700 (PDT)
X-Received: by 10.237.54.166 with SMTP id f35mr8328918qtb.90.1492698379708;
        Thu, 20 Apr 2017 07:26:19 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id d27si6015081qte.219.2017.04.20.07.26.19
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 20 Apr 2017 07:26:19 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:54349 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1d1D2J-00068S-69
	for alex.bennee@linaro.org; Thu, 20 Apr 2017 10:26:19 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58783)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1d1D29-000669-8E
	for qemu-arm@nongnu.org; Thu, 20 Apr 2017 10:26:13 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1d1D28-0007ei-34
	for qemu-arm@nongnu.org; Thu, 20 Apr 2017 10:26:09 -0400
Received: from mail-wm0-x22a.google.com ([2a00:1450:400c:c09::22a]:38850)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1d1D27-0007ck-PD
	for qemu-arm@nongnu.org; Thu, 20 Apr 2017 10:26:07 -0400
Received: by mail-wm0-x22a.google.com with SMTP id r190so49911037wme.1
	for <qemu-arm@nongnu.org>; Thu, 20 Apr 2017 07:26:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=zeE4ZXaWCkc3rxMhtP6STyF6EkwfNh0OPfmqPjpz7N4=;
	b=GDmPY3tXxKNQdK0UnVe7GTZAgLCN1PM76VZ1l3Hes87T74eZJkurZEj3XC/X+IM1JG
	p5MCKczxWp8JBKBfOjQzk/DBtPv9NyBlqSz0BFTIv9+FoqFpl4HH02Mi0WQFq72zjEAd
	kRI2SNQ6dArp8U3Azf9SJ0tJ+kQsIVOfec9+o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=zeE4ZXaWCkc3rxMhtP6STyF6EkwfNh0OPfmqPjpz7N4=;
	b=uErNBvOnqeHPq4Df5HwDSIb4FXdLgO+PF0PYUuXvXqXZ5dFzfVLNQgw3CS4WNeIdyJ
	pm+xL3HieWYMFm75ifEefsaG9p5H5ZaWI5b5Joq3X+Z+kpX328XUdC5uyFKSRbjqxtMG
	CZ9hdcWw4W6Olu3dpsYgn7MoR6tT94v5QMK1aovxfwDqrNFm6mI+ko6hJKAJnZt/Gi4j
	hyQz3dMsb09g8c0GQXlGlZOG3X0lWEan6lc61OuXiN9kg+1/bvv4TLll+xks/Jz/5B68
	PkcEJN/Yt6abzHLN1G2SvVbhKHKUkoSetyC1zYfpuTyDh8D1HvA+VjDT3LmKhiOE/5Fn
	lRKg==
X-Gm-Message-State: AN3rC/4pNgiky/VEm3e3OhmZlnQrlzN6cm9d4pTcXfpkeMXSM56XjPG/
	o90vFt4fSBEqPsZ+5QeGqU2eakZfjQ8n
X-Received: by 10.28.214.211 with SMTP id n202mr3546006wmg.142.1492698366644; 
	Thu, 20 Apr 2017 07:26:06 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.145.68 with HTTP; Thu, 20 Apr 2017 07:25:46 -0700 (PDT)
In-Reply-To: <3dd852ae-3ff9-0b53-11f1-ea4e2a3ed59c@amsat.org>
References: <1491844419-12485-1-git-send-email-peter.maydell@linaro.org>
	<1491844419-12485-8-git-send-email-peter.maydell@linaro.org>
	<3dd852ae-3ff9-0b53-11f1-ea4e2a3ed59c@amsat.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 20 Apr 2017 15:25:46 +0100
Message-ID: <CAFEAcA8HeZXitVwpuTG5j2LCxxYt5Tp-kLAuTnTzMqK5fN=+Zg@mail.gmail.com>
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c09::22a
Subject: Re: [Qemu-arm] [PATCH v2 7/9] arm: Track M profile handler mode
 state in TB flags
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
Cc: Richard Henderson <rth@twiddle.net>, qemu-arm <qemu-arm@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>,
	"patches@linaro.org" <patches@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: QekiXfwJbwEQ

On 17 April 2017 at 05:20, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org> wr=
ote:
> On 04/10/2017 02:13 PM, Peter Maydell wrote:
>> --- a/target/arm/translate.h
>> +++ b/target/arm/translate.h
>> @@ -31,6 +31,7 @@ typedef struct DisasContext {
>>      bool vfp_enabled; /* FP enabled via FPSCR.EN */
>>      int vec_len;
>>      int vec_stride;
>> +    bool handler; /* v7M Handler mode */
>
>
> What about a more descriptive name like 'is_v7m_handler_mode' or
> 'v7m_mode_handler'? It makes your next patch easier to understand:

Seems reasonable; I've made that change (but won't repost the
series as that's the only tweak).

thanks
-- PMM
