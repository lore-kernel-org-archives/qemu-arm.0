Received: by 10.28.71.155 with SMTP id m27csp192666wmi;
        Thu, 22 Mar 2018 03:55:40 -0700 (PDT)
X-Google-Smtp-Source: AG47ELvLufSOnZVSIec2dujzyA63jNVhAIKLFr/Ds/IZNpN11PURg15vA3SDhklfU6dK7wWENZ0N
X-Received: by 10.55.159.204 with SMTP id i195mr10409682qke.188.1521716140727;
        Thu, 22 Mar 2018 03:55:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1521716140; cv=none;
        d=google.com; s=arc-20160816;
        b=MmQdgW5t6/AL6LCCMzYgmmz9sr9O2BFQe2/IE6f1znZtNdMcDFWUN/fPCdXfzXha7T
         s+IyEUbSEUN80E8tVAV7rXB7YaHJ8yju56rdhX71zM1JC0bAM9bzErlAVf77YXGu6FnA
         WKII9dOq8Mej5KjSVqzNn3NBxT1SgX5Q/kNX86VB7+7j8sh8GW2+ARahCstsTtWo7MQ/
         Qnh7wUaO2YVhorJuDJ3lIclVK3vh3gJasDSeS1g0Di7pjayLmsX7o/SWAe1e+wsMRZyL
         kCbIMWjnB1LCHGmCYHHsHvJk3Icc3qLRE/o10MteDr5DAXHY0k8DBkf7fYQ5YIL+ntpD
         tvlg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=GNyzqeX7KxigyVTm5tiXisDeT6doANWBCcTy4hyr+LY=;
        b=ywoGpSaXHLqxrwksBkqPUjDFc77GLknHEV6q6vM67MlCPyLsdS9Bi2j9wRLzA5H6AH
         QcEvM32CNdcOTbQnz5hACBoGnUndV0SlFO/us+4mCcY5q+cpTCvETKbL/IXBcM4T+oKZ
         xhoTm+6JA6MmriA6pfyTt9Dm6lBP7bWsXOfVexyTBSvoZhlYw/EXY1Yaw1YXOEMoqnNv
         121aQiQvvyq5gBEUvrtbQMSGGzfRCupIgdKZsepI4mDprhGbhzXyRxb7ZClb1fmWdvaG
         OBDx6RybGt6SG/gBorfai8AijfTtb8LZBmipVL8Yo6oNTGJNViCtYSPcL7l2nHQdwgA6
         KV/g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=LpHVeCBm;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id l25si1708124qkk.475.2018.03.22.03.55.40
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 22 Mar 2018 03:55:40 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=LpHVeCBm;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:59946 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eyxsi-0007tS-8X
	for alex.bennee@linaro.org; Thu, 22 Mar 2018 06:55:40 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58542)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1eyxrD-0006nO-Qd
	for qemu-arm@nongnu.org; Thu, 22 Mar 2018 06:54:08 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1eyxr8-0000fq-CE
	for qemu-arm@nongnu.org; Thu, 22 Mar 2018 06:54:07 -0400
Received: from mail-oi0-x234.google.com ([2607:f8b0:4003:c06::234]:45700)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1eyxr8-0000fY-7Z
	for qemu-arm@nongnu.org; Thu, 22 Mar 2018 06:54:02 -0400
Received: by mail-oi0-x234.google.com with SMTP id 71-v6so6925460oie.12
	for <qemu-arm@nongnu.org>; Thu, 22 Mar 2018 03:54:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=GNyzqeX7KxigyVTm5tiXisDeT6doANWBCcTy4hyr+LY=;
	b=LpHVeCBmfyfGS3cpzp0wIxD89OPVQAlNdr38Pn9FK7t7oAq8BsLqKzHljYVGA4L4c3
	+gXSDA7ZU0LS1ghzlkO9ZSw+ctlk7bRi85CZycdlgxzTF1P4RkoSsg6CKkVUvq7GSbHE
	uUJKKRCsstjMMxGeo6EAtOdukvcCtkAWMW3Mg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=GNyzqeX7KxigyVTm5tiXisDeT6doANWBCcTy4hyr+LY=;
	b=pDtBk0JwOVu6pF7wPNyeiIlvD0AncNZGbCrjRFuwZ1rP7NWzCUakqChagRa2HHFm8y
	vO98ylC26Ir86a+zDAdTnUKf1+DEwqNYEMpRv7bY8NDoK3NQtIDzLyzJ1JTond/ADCj3
	AYPRWFYI3P3uFBf3q88txweLi1LsJFxLsXZxlD0FwlaAHLUJKBSGPxHcOJowsIdygmc/
	futhsJwOFHN8UKEhoIDWRg0EymeRSmHjU06PtoVkI/Vt4lfzVe/cMdv6RkJzzjds1MQa
	yZuPAknIA9dA5ByDFdIwC7BhJpjTsZaTv5JpAjxUOQPVQfkIGbYvr95rb5sRFvQsrLja
	GjWw==
X-Gm-Message-State: AElRT7HOa/mt40DdugRgmnek4Gt9Fj5OV6OZub5HHlcwLSUZmpa6hken
	SFGRLT2i8Zgdfru6WlL4F0PQWfj7I/IO/9C2N2k2rg==
X-Received: by 10.202.95.68 with SMTP id t65mr14464768oib.102.1521716039980;
	Thu, 22 Mar 2018 03:53:59 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:2286:0:0:0:0:0 with HTTP; Thu, 22 Mar 2018 03:53:39
	-0700 (PDT)
In-Reply-To: <20180322080156.x2q7w6wtdrvc3wk3@hawk.localdomain>
References: <20180322031216.14569-1-wei@redhat.com>
	<20180322080156.x2q7w6wtdrvc3wk3@hawk.localdomain>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 22 Mar 2018 10:53:39 +0000
Message-ID: <CAFEAcA_Sb6iz-8cg00JXhNF5pMS3z2=QxhoEhwSgG6PG04nKqg@mail.gmail.com>
To: Andrew Jones <drjones@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c06::234
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH 1/1] mach-virt: Set VM's SMBIOS
 system version to mc->desc
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: osQhzAh7YjE1

On 22 March 2018 at 08:01, Andrew Jones <drjones@redhat.com> wrote:
> I agree we should change the useless 1.0, but shouldn't we use
> mc->name instead of mc->desc? mc->name would make it consistent
> with pc-piix and q35 and also be a less verbose "version". We'd
> get e.g.
>
>  System Information
>         Manufacturer: QEMU
>         Product Name: KVM Virtual Machine
>         Version: virt-2.12
>         Serial Number: Not Specified

I would vote for consistency with x86, I think.

thanks
-- PMM
