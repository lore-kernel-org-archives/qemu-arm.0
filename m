Received: by 10.25.208.211 with SMTP id h202csp1130411lfg;
        Wed, 16 Mar 2016 04:54:32 -0700 (PDT)
X-Received: by 10.140.91.35 with SMTP id y32mr4436940qgd.42.1458129272896;
        Wed, 16 Mar 2016 04:54:32 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id a12si2967689qha.52.2016.03.16.04.54.32
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 16 Mar 2016 04:54:32 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@linaro.org
Received: from localhost ([::1]:55514 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1agA24-0005lL-79
	for alex.bennee@linaro.org; Wed, 16 Mar 2016 07:54:32 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:34894)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1agA21-0005iC-GY
	for qemu-arm@nongnu.org; Wed, 16 Mar 2016 07:54:30 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1agA20-000082-Q1
	for qemu-arm@nongnu.org; Wed, 16 Mar 2016 07:54:29 -0400
Received: from mail-vk0-x234.google.com ([2607:f8b0:400c:c05::234]:32854)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1agA20-00007q-L3
	for qemu-arm@nongnu.org; Wed, 16 Mar 2016 07:54:28 -0400
Received: by mail-vk0-x234.google.com with SMTP id k1so58286930vkb.0
	for <qemu-arm@nongnu.org>; Wed, 16 Mar 2016 04:54:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=u7neAJewr9vCxMNbgmzCAmDGuXMPdXRdffPHzWdpxp8=;
	b=i3NkWDREbIM/w8JfcuZYadjhkJYOGmp5kY7i6Y6akw2Fa9s+3h3uvXweWV5XqG6Eu0
	SrR4MGoRMSkpHQzI9RTlqC2uVlCBbM3aKSWmQbJNPwmNsUBOubQWbnT932dwuuoWN+dv
	PtqthtA2CRxvM8I/Ja3rmkSVWtRWoXb7i/lhA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=u7neAJewr9vCxMNbgmzCAmDGuXMPdXRdffPHzWdpxp8=;
	b=YEWAWWdp9J7pfHE5+bpV8dXvK3MytWyCCiEkZ0BaNhsWm9puvMUiKDh7P1sBoD2iBV
	Ibu3HCW5CRnsFAZIRcoPiNSv7N3Ir5nwDetfs5NFZCgQttKpowkbdmsHujGg2wMGL11U
	wSNUnK+05JN8rDBgSWsETUriRptU11TuKdLyYkrFM4AW0+kEciibckwh3OXpyIYN4q/C
	Y/Sq4iuARWIcIWn6AjKSZcABD10kuRVJbxenwXOgDMfykMQfaMypjMR2Z7YkoxElohwE
	DStaDfNpUVfCjvgeCt+OFuQBY4irRTTbS8I2ESF9DAqNS00H/VMuN1O04i3H6zzXSQKK
	GOtQ==
X-Gm-Message-State: AD7BkJJvZpCnxrm+yV4p1qk0sux86MchKDFVFUlOlmOh9oLkBNX9VJNTrupcomC4ZgVKDey4AStGOanhLYzYgWNu
X-Received: by 10.31.3.193 with SMTP id f62mr3345826vki.27.1458129268088; Wed,
	16 Mar 2016 04:54:28 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.216.1 with HTTP; Wed, 16 Mar 2016 04:54:08 -0700 (PDT)
In-Reply-To: <1457334350-5675-8-git-send-email-zxq_yx_007@163.com>
References: <1457334350-5675-1-git-send-email-zxq_yx_007@163.com>
	<1457334350-5675-8-git-send-email-zxq_yx_007@163.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 16 Mar 2016 11:54:08 +0000
Message-ID: <CAFEAcA_oPrEALzZgxPzc-+tPoQ=xhudQrj3_zd-GXxQW=7_2zw@mail.gmail.com>
To: xiaoqiang zhao <zxq_yx_007@163.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c05::234
Cc: Rob Herring <robh@kernel.org>, qemu-arm <qemu-arm@nongnu.org>,
	Andrew Zaborowski <balrogg@gmail.com>,
	QEMU Developers <qemu-devel@nongnu.org>
Subject: Re: [Qemu-arm] [PATCH 7/9] hw/arm: QOM'ify stellaris.c
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
X-TUID: JsXTKfDG0bvm

On 7 March 2016 at 07:05, xiaoqiang zhao <zxq_yx_007@163.com> wrote:
> * Drop the use of old SysBus init function and use instance_init
> * Use DeviceClass::vmsd instead of 'vmstate_register' function
>
> Signed-off-by: xiaoqiang zhao <zxq_yx_007@163.com>
> ---
>  hw/arm/stellaris.c | 48 ++++++++++++++++++++++++------------------------
>  1 file changed, 24 insertions(+), 24 deletions(-)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

Followup cleanups:
 * implement proper reset methods
 * move code for each device into its own file in the right
   subdirectory of hw/

thanks
-- PMM
