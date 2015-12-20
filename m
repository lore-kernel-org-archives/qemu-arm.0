Received: by 10.182.158.201 with SMTP id ww9csp2295556obb;
        Sun, 20 Dec 2015 09:11:06 -0800 (PST)
X-Received: by 10.140.131.74 with SMTP id 71mr20898324qhd.51.1450631466888;
        Sun, 20 Dec 2015 09:11:06 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 27si26024799qks.47.2015.12.20.09.11.06
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sun, 20 Dec 2015 09:11:06 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@linaro.org
Received: from localhost ([::1]:41410 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aAhVi-0005t6-Cq
	for alex.bennee@linaro.org; Sun, 20 Dec 2015 12:11:06 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43149)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1aAhVf-0005pp-Ln
	for qemu-arm@nongnu.org; Sun, 20 Dec 2015 12:11:04 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1aAhVe-0005f8-QT
	for qemu-arm@nongnu.org; Sun, 20 Dec 2015 12:11:03 -0500
Received: from mail-vk0-x22c.google.com ([2607:f8b0:400c:c05::22c]:36462)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1aAhVe-0005ev-ML
	for qemu-arm@nongnu.org; Sun, 20 Dec 2015 12:11:02 -0500
Received: by mail-vk0-x22c.google.com with SMTP id f2so51200438vkb.3
	for <qemu-arm@nongnu.org>; Sun, 20 Dec 2015 09:11:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=BInd3HhEVbXnqH4hpB+op/m3ZmQVvegV6lyHDnMjOFc=;
	b=HDiz9SkmbqdTSsnJN+TqPE1uBmJ1cKdrlhp3Fbj3U09ti5p+0iA1uwYZ8pEh31UsPg
	kRq5JCLp9ZLdZnxb1LsMXdWxoRpB18AMrAgnzKDhYTeC0icW23/HpvQdrUU8X82DsIjy
	DzZZ8VjfwC0wkP+PNfA0o1SGFgEBdIhqfNWYE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=BInd3HhEVbXnqH4hpB+op/m3ZmQVvegV6lyHDnMjOFc=;
	b=ZtpRbVrK1cRrIp0G92Fd56Rslqpay5p9a2hPVR3Xp+jj5JaDPWdFQb50dZtF5bfHoZ
	ZqHNJQ5MTxanGQx4TECmmfyTI96Ai+O9NAPdLkq4j/VgeNq5mqI7E4Xb/YKF5j0XAjTk
	i4LqVrEZMlPLhhx097FqnnSl8bi7V62BOcB3rFTF3Dx4nvdrapfLTzkhNAnHgwqzoJ9L
	QsnyvbcmBaIWPD48byW+3LLPMS97vt0bOgOM4xE1pXOCUOMVs6S8kVXa9Giq2SVsctPw
	34EPsFfcrzLoDn7SuOuk3U+lJ/1sHqZAVSKFk9NaBA9LnEfajZamLR3QeL9cCFX67l9N
	ZZIw==
X-Gm-Message-State: ALoCoQncsYG3rtxo9Z4vlcDmOshfr8+7k8uiif7NUE2q4YNfUobB2PxaUxkUdIO7nEOchGg4AFz99Sz8hDerv/IIp1Lg7XVhFbX2HXVJFkGxbGwKZnICAhg=
X-Received: by 10.31.194.21 with SMTP id s21mr9413928vkf.92.1450631462412;
	Sun, 20 Dec 2015 09:11:02 -0800 (PST)
MIME-Version: 1.0
Received: by 10.31.153.15 with HTTP; Sun, 20 Dec 2015 09:10:43 -0800 (PST)
In-Reply-To: <20151219213947.GF4164@pcrost-box>
References: <1449851831-4966-1-git-send-email-peter.maydell@linaro.org>
	<1449851831-4966-6-git-send-email-peter.maydell@linaro.org>
	<20151219213947.GF4164@pcrost-box>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sun, 20 Dec 2015 17:10:43 +0000
Message-ID: <CAFEAcA9Sph=mwtyESDD1ofq9pNcSwBGCf62xO1YW0bPdCUhU3g@mail.gmail.com>
To: Peter Crosthwaite <crosthwaitepeter@gmail.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c05::22c
Cc: Kevin O'Connor <kevin@koconnor.net>, Markus Armbruster <armbru@redhat.com>,
	Patch Tracking <patches@linaro.org>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Alistair Francis <alistair.francis@xilinx.com>,
	qemu-arm <qemu-arm@nongnu.org>, Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [Qemu-arm] [PATCH 05/10] hw/sd/sdhci.c: Update to use SDBus APIs
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
X-TUID: 5OAFNNHSCYPI

On 19 December 2015 at 21:39, Peter Crosthwaite
<crosthwaitepeter@gmail.com> wrote:
> On Fri, Dec 11, 2015 at 04:37:06PM +0000, Peter Maydell wrote:
>> +    carddev = qdev_create(qdev_get_child_bus(dev, "sd-bus"), TYPE_SD);
>> +    qdev_prop_set_drive(carddev, "drive", blk, errp);
>> +    if (*errp) {
>
> It is generally valid for an errp to be NULL. I think we should use a
> local even if we know the caller will not pass NULL.

Agreed.

thanks
-- PMM
