Received: by 10.25.27.66 with SMTP id b63csp320749lfb;
        Wed, 1 Jun 2016 11:21:40 -0700 (PDT)
X-Received: by 10.55.200.152 with SMTP id t24mr37052824qkl.197.1464805300646;
        Wed, 01 Jun 2016 11:21:40 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id a133si9162570qkc.140.2016.06.01.11.21.40
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 01 Jun 2016 11:21:40 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:43555 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1b8Alw-0004ve-0b
	for alex.bennee@linaro.org; Wed, 01 Jun 2016 14:21:40 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45813)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1b8Alq-0004tc-Ho
	for qemu-arm@nongnu.org; Wed, 01 Jun 2016 14:21:35 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1b8Alc-000479-S4
	for qemu-arm@nongnu.org; Wed, 01 Jun 2016 14:21:33 -0400
Received: from mail-vk0-x236.google.com ([2607:f8b0:400c:c05::236]:35836)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1b8Alc-00046x-NH
	for qemu-arm@nongnu.org; Wed, 01 Jun 2016 14:21:20 -0400
Received: by mail-vk0-x236.google.com with SMTP id d127so38841753vkh.2
	for <qemu-arm@nongnu.org>; Wed, 01 Jun 2016 11:21:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=bXbCm07jwFJruZA2kXphtrJtRGRPyhfzDRPoZK+ED8o=;
	b=HDnkm/GhsRmKaXNyWshtktewefkh0p8dbTFpdGoFxyfB9CRUOao3Ao8arHr9wN73Oz
	kR+BpOgwTA8OpxKYNzl3Z1grS0dXjYfA6I/VYYjTaykdPr7HI/AEO6hecjNvPhZB34Gi
	g+owUBriyZhkq2GPm5on2jKFp+PvyHJjxu90c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=bXbCm07jwFJruZA2kXphtrJtRGRPyhfzDRPoZK+ED8o=;
	b=g/UqqOqgqgRJpJ0YjsURbxXwtCxGUtsliWEcALjuKzJjI26+dvq3f8IduhjnoWUXmL
	KSLQIEsw6+jsaXTin+WLLJoliuQr2DQKEN2LRviy8uQ6PhnFwP0CRZbufoTmWDgl9BfK
	prWTGG6j9k7zHha0x9HL6I93g3VvVLaP4phe51EwKLTkAOK/0k8bGPssFDlUTXVNMDW4
	QY6+DwnFOvsHBRG0VbEf2oRPyI7IKnu/MI/WRjTg8aQjGqI+RJw8vAVElBQHa0xz+sCl
	DowBgE6J1EKAYrRnPX1FgtlMws5VH0nhPYeTsvad/tgGwp107xDx6n96RJ04/hHii7im
	THAA==
X-Gm-Message-State: ALyK8tJEFRK8CmJjlfFsjf/Ow1G9tl7QpufpMHMKEolaaFdR3/ecV3OgEgbcDf/KAvDmdFwxQCT0wy7FggfloWi+
X-Received: by 10.159.33.68 with SMTP id 62mr2688928uab.26.1464805280114; Wed,
	01 Jun 2016 11:21:20 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.69.66 with HTTP; Wed, 1 Jun 2016 11:21:00 -0700 (PDT)
In-Reply-To: <1464799050-11002-1-git-send-email-imammedo@redhat.com>
References: <1464799050-11002-1-git-send-email-imammedo@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 1 Jun 2016 19:21:00 +0100
Message-ID: <CAFEAcA-KUzT7137bcowBSpLM-OvTNSs9pM6RvqkoySDBZQySGw@mail.gmail.com>
To: Igor Mammedov <imammedo@redhat.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c05::236
Subject: Re: [Qemu-arm] [PATCH RFC 0/8] cpus: make "-cpu cpux,
 features" global properties
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
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	QEMU Developers <qemu-devel@nongnu.org>, Blue Swirl <blauwirbel@gmail.com>,
	qemu-arm <qemu-arm@nongnu.org>, Paolo Bonzini <pbonzini@redhat.com>,
	Richard Henderson <rth@twiddle.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: HiuE7aQSkRhR

On 1 June 2016 at 17:37, Igor Mammedov <imammedo@redhat.com> wrote:
> Current CLI option -cpu cpux,features serves as template
> for all created cpus of type: cpux. However QEMU parses
> "features" every time it creates a cpu instance and applies
> them to it while doing parsing.
>
> That doesn't work well with -device/device_add infrastructure
> as it has no idea about cpu specific hooks that's used for
> parsing "features".
> In order to make -device/device_add utilize "-cpu features"
> template convert it into a set of global properties, so that
> every new CPU created will have them applied automatically.

Is there a plan for supporting heterogenous CPU setups?
(We don't really do those very well at the moment, but
we might in future. The closest we come today is the
zynqmp SoC which has Cortex-R5s and A53s in it.)

thanks
-- PMM
