Received: by 10.25.208.211 with SMTP id h202csp1942026lfg;
        Tue, 8 Mar 2016 05:50:20 -0800 (PST)
X-Received: by 10.140.16.165 with SMTP id 34mr35508693qgb.79.1457445020124;
        Tue, 08 Mar 2016 05:50:20 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id i109si3065529qgf.26.2016.03.08.05.50.19
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 08 Mar 2016 05:50:20 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@linaro.org
Received: from localhost ([::1]:34708 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1adI1i-0006LC-NO
	for alex.bennee@linaro.org; Tue, 08 Mar 2016 08:50:18 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53902)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1adI1g-0006L6-FA
	for qemu-arm@nongnu.org; Tue, 08 Mar 2016 08:50:17 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1adI1f-0003G0-K3
	for qemu-arm@nongnu.org; Tue, 08 Mar 2016 08:50:16 -0500
Received: from mail-vk0-x235.google.com ([2607:f8b0:400c:c05::235]:34814)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1adI1f-0003Fh-FZ
	for qemu-arm@nongnu.org; Tue, 08 Mar 2016 08:50:15 -0500
Received: by mail-vk0-x235.google.com with SMTP id e185so16798274vkb.1
	for <qemu-arm@nongnu.org>; Tue, 08 Mar 2016 05:50:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=7a8c0SrRSCjXvikIHiKpZscXuQKCaDyEyelkXccbcmA=;
	b=DbjInRwh9cPa9WJs1Rf4W7/+6pICp69863ZW4PmHavsyK0xrCJzzExinWraIfzfYOi
	4SIOVQDG/z1Jdwq9E4KE+PchQddEyb7wjeewpdqrD7rAyabDap2S7pBFYWBdn6eerN2u
	x0zgJWUu3RJzh2jWB7fjpkpVWP8cTcVNSlg0s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=7a8c0SrRSCjXvikIHiKpZscXuQKCaDyEyelkXccbcmA=;
	b=By9fK+NpaOd+Z7/Lw9tJbnltgFWi6qh3NV9oqTsQDgKBuvRqaPghr3W2zHeD3eMTnm
	XHv1i5bPlruKBKGntd4GtEnZq7h+buaPMrkNNQU9867p9B0gtEN4msg19gl6ZFflTf/h
	jCtDmNpYOBq0yGhfrVZENPDT1KAoGLXRH4mEqjDx96wD2/Cu0i9wN7G1AorjkY5HfgqT
	YpxVenomCDpVLWHTh/6Lkg13InTWK0t0x2qQhvF3G4csL3TeaSTt9szuCcodvi11yq+U
	vVnrdWhqZA69HbyFVuXskNBOUIydsMtDvQL0s4keaNayvpZ+7xvMf4JnXPM7kKnnghOY
	+V7g==
X-Gm-Message-State: AD7BkJIG2XVqIYlEjlPhh5R/I5/GAeGAYeFrp869Cql1aUUHHGslFV+liuM6mN46FZU+GMadN//XuqpSKgryCKcf
X-Received: by 10.31.8.17 with SMTP id 17mr16558215vki.139.1457445014974; Tue,
	08 Mar 2016 05:50:14 -0800 (PST)
MIME-Version: 1.0
Received: by 10.31.216.1 with HTTP; Tue, 8 Mar 2016 05:49:55 -0800 (PST)
In-Reply-To: <CAKv+Gu-joM8MqtM=G_F7NLZEwpxLBMPeqimDwZv7yivTjYBFVQ@mail.gmail.com>
References: <1455288361-30117-1-git-send-email-peter.maydell@linaro.org>
	<56DD9C58.7050306@redhat.com>
	<CAFEAcA8C2VzkD=87W5Jn7X523cFZLZL6onxjKDoOcZsCPMQxZw@mail.gmail.com>
	<56DEBF6A.6070809@redhat.com>
	<CAKv+Gu9LzTTzdw5CSCDfpCyjSgB2h6+KawTTJQXSqJ7mhV_YdQ@mail.gmail.com>
	<CAKv+Gu8OgSK5+X71GLrvWLkcGcQ9=MuwOuFAsQroQTa3bWbHNA@mail.gmail.com>
	<56DEC234.70907@redhat.com>
	<CAKv+Gu-joM8MqtM=G_F7NLZEwpxLBMPeqimDwZv7yivTjYBFVQ@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 8 Mar 2016 20:49:55 +0700
Message-ID: <CAFEAcA8Pk_fBR_v8gg0-oX7nvJ88WRnr-d-uEMTdLfsWMNeESQ@mail.gmail.com>
To: Ard Biesheuvel <ard.biesheuvel@linaro.org>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c05::235
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-arm <qemu-arm@nongnu.org>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Markus Armbruster <armbru@redhat.com>
Subject: Re: [Qemu-arm] [PATCH 0/4] virt: provide secure-only RAM and first
	flash
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
X-TUID: R/Glt9eB13dr

On 8 March 2016 at 19:16, Ard Biesheuvel <ard.biesheuvel@linaro.org> wrote:
> The UEFI code is loaded into DRAM by the secure firmware, and
> relocated and executed from there.

Incidentally, since we're using the semihosting API to do this at
the moment, this makes the whole thing completely dependent on the
nonsecure guest not being badly behaved, because NS EL1 can happily
make its own semihosting calls which do interesting things like
read and write arbitrary host files.

Presumably one could in theory configure ATF to use something
more sensible (like having the various blobs it loads be
stuffed into the flash with it, or loaded off an emulated disk
or something). But the current use case is as a development
tool for the firmware and secure apps and so on, not something
intended to contain malicious code. Making the flash, ram, etc
secure-only is worthwhile because it exposes plausible bugs
in the guest code being developed.

thanks
-- PMM
