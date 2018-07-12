Received: by 2002:a5d:4308:0:0:0:0:0 with SMTP id h8-v6csp1522052wrq;
        Thu, 12 Jul 2018 08:49:08 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpeqp/3iR+84yYSX4jm99urWpcjl7oTyd7GqNj30VKlaWLSQjTqwnsRrzHLjZ0nwPOEV2xf6
X-Received: by 2002:ac8:524f:: with SMTP id y15-v6mr2324119qtn.227.1531410548196;
        Thu, 12 Jul 2018 08:49:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1531410548; cv=none;
        d=google.com; s=arc-20160816;
        b=G/CCTRSturCp6+8+/nudwvFe7TIHESn4EW2Zu/R6CFz8Tb6Pt8C30K4/WYGZ3Yx/cX
         6rd5nVimM8vXt9czGAs83ijbLII0q6auwopzexP0RMtU1J+EAE2F9EYtvSF/DRq1DFJs
         gowKdEqQKorKjpEcmeqR4Ze697nsO4wKIPeOWLYPC+MHUmS1CccEKotHR69HhuAwvoX1
         B005ZFnD4bieR+441LvaO4Pf14nzvP86pNGp319+prWkVYtuMdT0FUFyzd5DzHkISuzn
         pK0+RkpFnugk8SR6dxQcpB2oPgSEgq4yHciIrToFJqx3h4doOTVSJMS+i2a8+y4OdFzB
         HVZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=t0ryej3k5jyi4NM42fWUd9kUY05GjoOMzfAePIRbNwI=;
        b=wSD0Xl18o/wrhf+DmTQ1f1+1tScs/gVb6e5qWlrO6Ztg6e162dmnp68EdJVCHx90dh
         ovtinsMqWBdDaK+mCxlM4UR46K1Y/5CG7yMkQBCFs4A5bQiAZOPq+NRm2v3IbC8tpYiy
         cf71fWVeRz5tUeRS7QVjgLO7oFNFDyRVZ9PDQVlvLOo8z52vTIxbwDCyZu5aibkuY3uC
         NoXUhtsc9ydk2v7ZyNwaysEEOhMQL8Dz8jMc7XPVKDtM4cqPQ/TFgDfo9EuU4v6IIeYo
         grdRk/Z82X6NjrrG3vBDmpO3Imy81a3mzRyvdIWyXSAaaEFJJjzfegB/pgajwHvSUfPt
         ZejA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Q8qXogMY;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id w22-v6si4179587qtk.235.2018.07.12.08.49.08
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 12 Jul 2018 08:49:08 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Q8qXogMY;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:60884 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fddq7-0000U2-LB
	for alex.bennee@linaro.org; Thu, 12 Jul 2018 11:49:07 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43965)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fddpq-0000RT-8t
	for qemu-arm@nongnu.org; Thu, 12 Jul 2018 11:48:51 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fddpm-0005mv-Fb
	for qemu-arm@nongnu.org; Thu, 12 Jul 2018 11:48:50 -0400
Received: from mail-oi0-x242.google.com ([2607:f8b0:4003:c06::242]:43899)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1fddpm-0005mL-7p
	for qemu-arm@nongnu.org; Thu, 12 Jul 2018 11:48:46 -0400
Received: by mail-oi0-x242.google.com with SMTP id b15-v6so56606783oib.10
	for <qemu-arm@nongnu.org>; Thu, 12 Jul 2018 08:48:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=t0ryej3k5jyi4NM42fWUd9kUY05GjoOMzfAePIRbNwI=;
	b=Q8qXogMYSiFY9/g6md2bt5T4e6vX8RBIj2/C8raqaUjATIQ3ZqWfkMpx76tfT+Mpld
	tnR4bJh81HAMjwOsxo50lAlq+cRDLMPTdg+Dpm6Ilr1BjlmQWGrRczGWj+OTEs0TZeNL
	ufAV/77w3tJ3YWP96Ijyi+C1jIZ4l2ubzFpYM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=t0ryej3k5jyi4NM42fWUd9kUY05GjoOMzfAePIRbNwI=;
	b=rbnNHtEaFrGIwmpi+W8QSjbHOJSapeheYEwh1c8FVqPXAwTyAzlRcNUya16usj+GRD
	NlDIqwNv4r4jNY0x7d4Is0jmArjxOcGKztpA5ut7QZUcfAtweZBP8jmaUtaNIvzDgZTD
	t8whORhVQNf9qHAbFa++VJch33klOrlcB3RHhu4oAOXDTDEhVJLuJ96jIOxE1WKPoF+F
	ljLTNmdkSWQPTsz5NMtqY9mP59PLcmcHjSUa4HCe41hPINlc88yL4g+gTVIAoznTqZBk
	DVRucH3EldETHFAHnAuar5zHRBHs5J6uatzOKtYIsUB+7HfjpdUmdI7JzYnMK25I+byO
	Kf6w==
X-Gm-Message-State: AOUpUlFTQF+wRCrDlvavecrGfzZC5tVlA8+T/FH9rUVOeSEd0BDRPOuv
	W6+/eQ7LBKgwvdtc5iYLRpc3dxhD9bQ5pVd8hGSJFg==
X-Received: by 2002:aca:5f0a:: with SMTP id
	t10-v6mr2714081oib.337.1531410525353; 
	Thu, 12 Jul 2018 08:48:45 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:5c8a:0:0:0:0:0 with HTTP; Thu, 12 Jul 2018 08:48:24
	-0700 (PDT)
In-Reply-To: <1531409463-3843-1-git-send-email-thuth@redhat.com>
References: <1531409463-3843-1-git-send-email-thuth@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 12 Jul 2018 16:48:24 +0100
Message-ID: <CAFEAcA_PehgESP845QOiVOO2Ov1wd2r0MLLtN17wsRVwB-wgHQ@mail.gmail.com>
To: Thomas Huth <thuth@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c06::242
Subject: Re: [Qemu-arm] [PATCH v1 0/5] Fix crashes with introspection
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
Cc: Eduardo Habkost <ehabkost@redhat.com>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Markus Armbruster <armbru@redhat.com>, qemu-arm <qemu-arm@nongnu.org>,
	Igor Mammedov <imammedo@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: tINVAHrZc3O3

On 12 July 2018 at 16:30, Thomas Huth <thuth@redhat.com> wrote:
> As discovered recently, you can crash QEMU with a lot of devices
> that do not get the reference counting of child objects right.
> You just have to run 'device-list-properties' and call 'info qtree'
> afterwards.
> This patch series fixes a bunch of these problems in the ARM code.
> I did not fix all problems yet, since it is quite time consuming
> and I first want to get some feedback whether this is the right
> way to go or not.
>
> Thomas Huth (5):
>   qom/object: Add a new function object_initialize_as_child()
>   hw/core/sysbus: Add a function for creating and attaching an object
>   hw/arm/bcm2836: Fix crash with device_add bcm2837 on unsupported
>     machines
>   hw/arm/armv7: Fix crash when introspecting the "iotkit" device
>   hw/cpu/a15mpcore: Fix introspection problem with the a15mpcore_priv
>     device

Seems good to me. I'm cc'ing Igor since he had some opinions when
I sent a previous (and rather more ad-hoc) attempt at reducing
the boilerplate around creating and parenting sysbus objects:
http://lists.gnu.org/archive/html/qemu-devel/2018-02/msg04493.html

thanks
-- PMM
