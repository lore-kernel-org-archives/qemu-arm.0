Received: by 10.25.77.65 with SMTP id a62csp54527lfb;
        Fri, 20 Jan 2017 07:53:25 -0800 (PST)
X-Received: by 10.237.47.33 with SMTP id l30mr12845825qtd.62.1484927605841;
        Fri, 20 Jan 2017 07:53:25 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id t58si5122239qta.240.2017.01.20.07.53.25
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 20 Jan 2017 07:53:25 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:55690 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1cUbVD-00030q-3C
	for alex.bennee@linaro.org; Fri, 20 Jan 2017 10:53:23 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33505)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1cUbV7-0002zK-TP
	for qemu-arm@nongnu.org; Fri, 20 Jan 2017 10:53:19 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1cUbV4-0007KA-1u
	for qemu-arm@nongnu.org; Fri, 20 Jan 2017 10:53:17 -0500
Received: from mail-ua0-x22e.google.com ([2607:f8b0:400c:c08::22e]:36283)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1cUbV3-0007Js-Tl
	for qemu-arm@nongnu.org; Fri, 20 Jan 2017 10:53:13 -0500
Received: by mail-ua0-x22e.google.com with SMTP id 96so64839492uaq.3
	for <qemu-arm@nongnu.org>; Fri, 20 Jan 2017 07:53:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=hCCPIwEqNiLID4mxJbnPAQ1347RH1+znHCdwsblPzJA=;
	b=V/IRaanbiCn3eC/BlEgCt0SqmLn0Nw0JceXS3AAX/KOkt39+3vTg627suJoKiStOLO
	zYYO0BlOZP9nquXWL9Z+QSuGm9YOfwPMhAjVu43qrxm5PcR0+53iwkWHaidzXbk0A3dj
	j6rH/X795nlgWyQOlpqx/VoU5TPsYwXgW4suQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=hCCPIwEqNiLID4mxJbnPAQ1347RH1+znHCdwsblPzJA=;
	b=HjVAdhCIAIXOcWTYuTfTFcvbVkI3MmufEuIKIdw+bEQtiG7LU70NxOLSRt9xiVUpS/
	IHMv/dgecxWkLRYJ8jk+qArhORVJ4zFOrgHlOxkauXeZmbQqHDtl2Ud5sDCVX7E9O9Af
	YMu3yBi2WlsjbORuagY9Xh7j3hbsGmtmPjMQaUK1mKrumYEDE/G91Ggrq1rmy5otxSRC
	yKQgF9dlic9Jvn2z0i0xDYwrvga3h5PqaksiSchNeRrnO7Q+5UhmJOop6A8OKYH1RtLX
	0percNtAjNah7yEccQmLy0v+pbvHVTabO4eOTcms6aG775Dsd4w6fYm1QVSJF66+DmNu
	2Ywg==
X-Gm-Message-State: AIkVDXKwJA/2a6N0rfxTNCxGOsw0ud0jAS57Q0sv+F4/CxkTLgPsPT6zYoG9HkYFmzT1IAUzkWdbBK/kA2j62Q4d
X-Received: by 10.176.67.193 with SMTP id l59mr8284107ual.0.1484927593126;
	Fri, 20 Jan 2017 07:53:13 -0800 (PST)
MIME-Version: 1.0
Received: by 10.31.176.14 with HTTP; Fri, 20 Jan 2017 07:52:52 -0800 (PST)
In-Reply-To: <1476117341-32690-3-git-send-email-drjones@redhat.com>
References: <1476117341-32690-1-git-send-email-drjones@redhat.com>
	<1476117341-32690-3-git-send-email-drjones@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 20 Jan 2017 15:52:52 +0000
Message-ID: <CAFEAcA92X+oCMji_bnWkjRWvqQ+CyqrR0ogy-SKOGW7TRYsZ3g@mail.gmail.com>
To: Andrew Jones <drjones@redhat.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c08::22e
Subject: Re: [Qemu-arm] [PATCH 2/2] hw/arm/virt: no ITS on older machine
 types
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
Cc: Eric Auger <eric.auger@redhat.com>, qemu-arm <qemu-arm@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ldXlFjownojj

On 10 October 2016 at 17:35, Andrew Jones <drjones@redhat.com> wrote:
> We should avoid exposing new hardware (through DT and ACPI) on older
> machine types. This patch keeps 2.7 and older from changing, despite
> the introduction of ITS support for 2.8.
>
> Signed-off-by: Andrew Jones <drjones@redhat.com>
> ---
>
> As Eduardo pointed out long ago for a different reason, we should
> probably replace VirtGuestInfo with direct use of VirtMachineClass,
> like x86 has done to replace PcGuestInfo with direct use of
> PCMachineClass. I'll work on that, but wanted to get this ITS
> fixup in sooner than later, so I'm posting this patch now, which
> requires 'no_its' to be duplicated.

So this patch added a no_its flag which gets set for virt-2.7
and earlier, but there's no user-facing way to say "I'd like
a virt-2.8 board with no ITS", right? That's a bit unfortunate
because the ITS can't be migrated, which means there's no way
to ask for a post-2.7 virt board which can be migrated...

thanks
-- PMM
