Received: by 10.25.208.211 with SMTP id h202csp7287lfg;
        Thu, 31 Mar 2016 01:05:50 -0700 (PDT)
X-Received: by 10.55.76.11 with SMTP id z11mr14556476qka.83.1459411550570;
        Thu, 31 Mar 2016 01:05:50 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id f125si6823864qkb.95.2016.03.31.01.05.50
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 31 Mar 2016 01:05:50 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:58651 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1alXby-0003gy-3T
	for alex.bennee@linaro.org; Thu, 31 Mar 2016 04:05:50 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57184)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1alXbv-0003gq-Gu
	for qemu-arm@nongnu.org; Thu, 31 Mar 2016 04:05:48 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1alXbr-0001W2-Qz
	for qemu-arm@nongnu.org; Thu, 31 Mar 2016 04:05:47 -0400
Received: from mail-vk0-x232.google.com ([2607:f8b0:400c:c05::232]:34271)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1alXbr-0001Vr-MI
	for qemu-arm@nongnu.org; Thu, 31 Mar 2016 04:05:43 -0400
Received: by mail-vk0-x232.google.com with SMTP id e185so93827569vkb.1
	for <qemu-arm@nongnu.org>; Thu, 31 Mar 2016 01:05:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=MzBS2vF7qgNZfK9vq3kWTVycmT3PlGZjlnOaV6b9MGY=;
	b=VJIkK0FKJzVam2z7Ihm78ZRdpuFUpSxmOfkDcm7c6S85mL9gxVty8N4aryCpWk+5uH
	SA0sLEj21lkZ9wGT64vGU9gj34O/QevGjqPaSoBEritHjLQsjlyLyFb1THEWWaRfEAls
	UEyTjwVDliTDrVTDWT9VC+YnOWMfu1rJ/jFLI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=MzBS2vF7qgNZfK9vq3kWTVycmT3PlGZjlnOaV6b9MGY=;
	b=BzOaW1+jSz2/CZVw4yJwwTjnJNwR3tE1hkxGsWVrh+iqAgCUyHNAqT2CnYSerB9be0
	byxMPkptSyvo0nWIn/hBgV1EWWj0PugQyYcHIcZfJaRlVLi+/WeihwJYF5pL/G3uC3rr
	GPQ7gji0HD8/lR2Gxt7GLVWiuiXj/DFc4UsiS8hN6TSNzse+c9tZP5Ew77RnYKvzjgtX
	g2JZ2iqG4cMr5JHV5oSzoiXdFP93NFeAjlStYJ69SZ5d67Sq+DoWA0/tZKnBeVEdMC+i
	t5HGSPwF5bl9Rk+eP8nkTXL/CtLVks7FgWVKAuV+ldHutnGoDXKgOKxx6SvuxPtgR4Vg
	c5/A==
X-Gm-Message-State: AD7BkJJW39YAB6vOYdIk7i3gd7BlCP6qxpvavyYRe1cgjm/PPmvGpuEXluwM/nYyHn1r7R46H7z8/D6OqvTWt9On
X-Received: by 10.31.47.207 with SMTP id v198mr8393929vkv.6.1459411543150;
	Thu, 31 Mar 2016 01:05:43 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.216.1 with HTTP; Thu, 31 Mar 2016 01:05:23 -0700 (PDT)
In-Reply-To: <56FC81E0.1000203@163.com>
References: <1457334350-5675-1-git-send-email-zxq_yx_007@163.com>
	<CAFEAcA98BiQipq4PL=_9fBeOa01ESzyp7U4ghN0gZuxAyAqwoA@mail.gmail.com>
	<CAFEAcA-P25AkJLBLst04J=BxTVvbfuQQAiE8nVS=w7oMXdtX8A@mail.gmail.com>
	<56FC81E0.1000203@163.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 31 Mar 2016 09:05:23 +0100
Message-ID: <CAFEAcA_xGVpHW8ki0qqGMN8OtpbiZYtAsCJoxQG9z8FPXZBVqQ@mail.gmail.com>
To: xiaoqiang zhao <zxq_yx_007@163.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c05::232
Cc: Rob Herring <robh@kernel.org>, qemu-arm <qemu-arm@nongnu.org>,
	Andrew Zaborowski <balrogg@gmail.com>,
	QEMU Developers <qemu-devel@nongnu.org>
Subject: Re: [Qemu-arm] [PATCH 0/9] some QOM'ify work under hw/arm
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: XVHZ9Z3tl1pw

On 31 March 2016 at 02:48, xiaoqiang zhao <zxq_yx_007@163.com> wrote:
>
> =E5=9C=A8 2016=E5=B9=B403=E6=9C=8816=E6=97=A5 20:00, Peter Maydell =E5=86=
=99=E9=81=93:
>>
>> On 16 March 2016 at 11:31, Peter Maydell <peter.maydell@linaro.org> wrot=
e:
>>>
>>> A general note -- since these aren't bug fixes and we're in soft
>>> freeze now, I don't think we should put them in until 2.6 is out.
>>> I'll review the patches in a second, though.
>>
>> Well, the patches all look good -- ping me after 2.6 is out to
>> apply them to target-arm.next then.
>>
>> Where I've noted possible further cleanups, that's intended as
>> an "if you like writing cleanup patches" thing -- you don't need
>> to try to do them as part of this patch series.

> ping !

I suggested you ping me after 2.6 is out, which won't be til the
end of April or thereabouts.

thanks
-- PMM
