Received: by 10.223.172.38 with SMTP id v35csp1124844wrc;
        Thu, 14 Sep 2017 10:17:38 -0700 (PDT)
X-Received: by 10.237.35.35 with SMTP id h32mr30384409qtc.47.1505409458813;
        Thu, 14 Sep 2017 10:17:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1505409458; cv=none;
        d=google.com; s=arc-20160816;
        b=K4TEUfpL9fvW1VsUFUWdkhBMEmEtp8ujZjxHpEFBUh0S383EIwoY73UOVr+loTSvqU
         0MMU6VOzGEapZG/Bj71Hq/uAxPnkhW4uYV1PW2TAGMLMae0ZUSUZ2tPD0YAdZaXHVkpl
         KzSeQx0aFHR1WdC64stCRWfFpvF6VUbmn20vG/Y1lJlUsfyyWV6nu8sC+wh69p8s8MiD
         B5zeI5eqJOayIDmh3+biZKTHRr8EzjXbDYmzuGCYQ2/+Y0fV0GIT25T6tg8+FwVGH6pk
         kN8ELUMX7HbrSj68U1zoYRinBiz52dTA2dELX4JOI2+DiRtlRNa0/1kOaqmOTPRuyyU8
         IMYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=mULNCl149x/pmNat6fbR7Q7mQ4SSCK0ziY7ort2gg9w=;
        b=i/17YQo3KCIVApOB3sNcBkOVXyv3mIl7srJvguyq5c+4+VJe7Pb2W/n23+3qhveiST
         SBj+WLPdUeLNc2rWU7HjCmmPI/DWzEQxmLVNYz/aCgyRbBGams5EPQfGJAIQ4cfvd0kO
         F+h+Hk0211dtgBcGgHq1N96ChRLyAcZKKZw+zDoi/i013j1TEWrgjzZHHTTwzKniQ4BB
         VWPjPclF3dJTBo8PJzlz0RP6VS9SH6EjDOFs3ch5+25ez9EjHndUQcmJgf92w2J/w38q
         4YP6VtS721fmS9+woFtRa49UJEN78RRcBG9kU18mmSfGK8Tt5NejXUMMFvUqFeeql2Eo
         CvBQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=HjhUACXJ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id c29si18285790qtd.163.2017.09.14.10.17.38
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 14 Sep 2017 10:17:38 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=HjhUACXJ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:49073 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dsXlg-0000Kb-IG
	for alex.bennee@linaro.org; Thu, 14 Sep 2017 13:17:36 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53773)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1dsXlV-0000KB-IE
	for qemu-arm@nongnu.org; Thu, 14 Sep 2017 13:17:26 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1dsXlU-0002Mf-Ji
	for qemu-arm@nongnu.org; Thu, 14 Sep 2017 13:17:25 -0400
Received: from mail-wr0-x230.google.com ([2a00:1450:400c:c0c::230]:56650)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1dsXlU-0002LT-Dp
	for qemu-arm@nongnu.org; Thu, 14 Sep 2017 13:17:24 -0400
Received: by mail-wr0-x230.google.com with SMTP id r74so881434wrb.13
	for <qemu-arm@nongnu.org>; Thu, 14 Sep 2017 10:17:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=mULNCl149x/pmNat6fbR7Q7mQ4SSCK0ziY7ort2gg9w=;
	b=HjhUACXJcgpp2usVe7UZ1AKthBVM9YH7Mxc838rfBPeCQdaj4wZ1JLc508J/hiG3xu
	zqvSb86tYDiC35g5coS2cYuREMFJqFCMkPLvF+8pieGkfARxUYHG2ME6Aw+bgS9Z/6AY
	9Piqqa7NSbXiVY24qhxWL4hfDjDEmfX1BP3Iw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=mULNCl149x/pmNat6fbR7Q7mQ4SSCK0ziY7ort2gg9w=;
	b=GjbkVU3UlZIIyBInMnr6avNCd/cPkrDMITctnrkejELKSyhbwdzk9U/CTkPM77gIKG
	U8cld7zrzo+ovkndEywpQKjk+hXBu4dZK09MXWkzfIApjLBokWb12iK5GzD/mNaa5olh
	JN2AEbOTC08UJQzHoW8JeJq1Ebx1p9pcAzaiwkRTutzlBr1phc+7R5AWr8vBKsCakb6d
	7Dzy67pCnGXACKrWqTgtSFY6apzbBb8jYOoyY64Jwh1nXILc67TBlr+X5x0WsjSKwKeQ
	UKfa3dK/CdoEwEMzsj5xM5/o9ogp8rcV1MEGqJ+ToGPaCvXtHWOabjO3mlHyYBNw7Wx/
	UElw==
X-Gm-Message-State: AHPjjUi30lNzkY1LtsveUPT6cRHv6Jlhu1k8feTk8sAYsJxpFHmu2J5s
	fdSS0Pkep2bUikUPFsUxPc2rrvuUyk9v+k2teUSoFg==
X-Google-Smtp-Source: ADKCNb7gXrzkmnVXPoP6WA2unxkmDgb0aNrnPGrRIhLmzY7QttDO5k+MD8o4NlsOgWYowXgb4OEOTXuGoJmN+iPWXiM=
X-Received: by 10.223.198.202 with SMTP id c10mr18847556wrh.230.1505409443473; 
	Thu, 14 Sep 2017 10:17:23 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.139.215 with HTTP; Thu, 14 Sep 2017 10:17:02 -0700 (PDT)
In-Reply-To: <CAKmqyKONrzpGxwvirPcb+-XZk=9WhwWKcSD_=BicmTQ2ZLQFEA@mail.gmail.com>
References: <1504812251-23438-1-git-send-email-sundeep.lkml@gmail.com>
	<2b183ac5-36d8-1da6-cbac-4c6366f23261@amsat.org>
	<CALHRZuoJjSkSYaM9xz8xo2R-=oQEx5a1bkhSirc=NmEpxeG2AQ@mail.gmail.com>
	<28d6a84f-3a32-78ea-7a87-055fb14e1641@amsat.org>
	<CAKmqyKONrzpGxwvirPcb+-XZk=9WhwWKcSD_=BicmTQ2ZLQFEA@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 14 Sep 2017 18:17:02 +0100
Message-ID: <CAFEAcA-Dz_xw3pXTHg9kV2qT+fw=jfgrdw63QeWHCnSxKb0e+w@mail.gmail.com>
To: Alistair Francis <alistair23@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c0c::230
Subject: Re: [Qemu-arm] [Qemu devel v8 PATCH 0/5] Add support for
 Smartfusion2 SoC
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
Cc: QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
	=?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
	sundeep subbaraya <sundeep.lkml@gmail.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Xm8D+dh4YWDF

On 14 September 2017 at 18:06, Alistair Francis <alistair23@gmail.com> wrote:
> Once you have all the devices there you can enable bus access errors
> as well. That's a future patch set though.

Ah, I hadn't noticed this code was opting out of bus access
errors; I don't want to permit new boards which do that,
so we do need to fix that in this round. (I just sent an
email to that effect in reply to patch 1.)

thanks
-- PMM
