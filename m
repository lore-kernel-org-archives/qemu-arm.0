Received: by 10.25.27.66 with SMTP id b63csp406010lfb;
        Thu, 9 Jun 2016 09:21:41 -0700 (PDT)
X-Received: by 10.55.80.136 with SMTP id e130mr11091041qkb.55.1465489301761;
        Thu, 09 Jun 2016 09:21:41 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id h185si3813067qkc.16.2016.06.09.09.21.41
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 09 Jun 2016 09:21:41 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:35586 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bB2iD-0003Me-4k
	for alex.bennee@linaro.org; Thu, 09 Jun 2016 12:21:41 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41139)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bB2i7-0003K4-ER
	for qemu-arm@nongnu.org; Thu, 09 Jun 2016 12:21:36 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bB2i6-0002VU-FY
	for qemu-arm@nongnu.org; Thu, 09 Jun 2016 12:21:35 -0400
Received: from mail-vk0-x22b.google.com ([2607:f8b0:400c:c05::22b]:35132)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bB2i5-0002Ul-8E
	for qemu-arm@nongnu.org; Thu, 09 Jun 2016 12:21:34 -0400
Received: by mail-vk0-x22b.google.com with SMTP id d127so62063802vkh.2
	for <qemu-arm@nongnu.org>; Thu, 09 Jun 2016 09:21:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=OSh2BHvhKlwje20pPQzfEflZzKqHtp3JB9l3Elkrxdg=;
	b=QiP8KxwatQTHi71KWZEEmT0Z849iPxo0pITcCCWk78/942ibqtqnujxqTNRW18+axV
	ulqSlXxeTd4M0ELKZwW8yYJI6xjZHNumHvG4FCjmsznY1/7z2RBB4QaYwYLm02OCpdQe
	LnB7SHl+U+6m3rF8tj3smfnfUVqCTE/94tL+Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=OSh2BHvhKlwje20pPQzfEflZzKqHtp3JB9l3Elkrxdg=;
	b=CaWjvtjKoIgy++Q3zwiAa0HKeCufXoB9jgr+jkUq99GQ6RmZg4D+6rlPalTHrlTnLK
	HqcWzh5MRo6FssFEfzY5JWqrcW/01hT9f+adB+jpjHkOFWgPbaV8RwqYEMgnb026Vj8Z
	vkWIG2JRWxCIpdEm9/fZR88Yg2BpgPQnndzdMz9d/Rv6WYJbeTghEfZ9r5f1D+h02qNZ
	j7tiJlk83naQZXnSK9orxd1Ax81tU616LTj1vKn0VZhy2MlY/s8GB+Vnt+hSx/MUW+CQ
	3OIRNt3aaKEPh7Dec4VfMzkFvpN9cwKFjA8Nqyxl6HGWhqaqwpppkz2gSCUgyd2qKFnJ
	uRfQ==
X-Gm-Message-State: ALyK8tJoTG5CXGSZyLL/ukdnSdSlnw3UwpnK0zlBorjXHPkpTowkfZ/lXQfRHenp/1zVwVEzuEqL5rS1DWqC+CyL
X-Received: by 10.176.0.238 with SMTP id 101mr4320367uaj.107.1465489292806;
	Thu, 09 Jun 2016 09:21:32 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.97.68 with HTTP; Thu, 9 Jun 2016 09:21:13 -0700 (PDT)
In-Reply-To: <1465419025-21519-2-git-send-email-ehabkost@redhat.com>
References: <1465419025-21519-1-git-send-email-ehabkost@redhat.com>
	<1465419025-21519-2-git-send-email-ehabkost@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 9 Jun 2016 17:21:13 +0100
Message-ID: <CAFEAcA94PFw6QC--MTU0ydR-NXF4EYGANiMz6EHtLOeOhxGGbA@mail.gmail.com>
To: Eduardo Habkost <ehabkost@redhat.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c05::22b
Subject: Re: [Qemu-arm] [PATCH v2 1/2] pxa2xx: Unconditionally enable USB
 controller
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
Cc: Marcel Apfelbaum <marcel@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
	qemu-arm <qemu-arm@nongnu.org>, Andrzej Zaborowski <balrogg@gmail.com>,
	QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 1oTh8R8zGOG+

On 8 June 2016 at 21:50, Eduardo Habkost <ehabkost@redhat.com> wrote:
> Simplify initialization logic by removing the usb_enabled()
> check. The USB controller is part of the SoC, so it doesn't make
> sense to create a system where it is not present.
>
> Cc: Peter Maydell <peter.maydell@linaro.org>
> Cc: Andrzej Zaborowski <balrogg@gmail.com>
> Cc: qemu-arm@nongnu.org,
> Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
> ---

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
