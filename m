Received: by 10.25.205.13 with SMTP id d13csp5931535lfg;
        Tue, 27 Dec 2016 07:13:58 -0800 (PST)
X-Received: by 10.237.44.97 with SMTP id f88mr28776909qtd.11.1482851638355;
        Tue, 27 Dec 2016 07:13:58 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id e3si28000035qte.286.2016.12.27.07.13.57
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 27 Dec 2016 07:13:58 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:54478 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1cLtRr-0008Az-ME
	for alex.bennee@linaro.org; Tue, 27 Dec 2016 10:13:55 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33989)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1cLtRn-0008AM-03
	for qemu-arm@nongnu.org; Tue, 27 Dec 2016 10:13:51 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1cLtRm-0007AW-9s
	for qemu-arm@nongnu.org; Tue, 27 Dec 2016 10:13:50 -0500
Received: from mail-vk0-x22b.google.com ([2607:f8b0:400c:c05::22b]:34918)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1cLtRm-0007AM-2P
	for qemu-arm@nongnu.org; Tue, 27 Dec 2016 10:13:50 -0500
Received: by mail-vk0-x22b.google.com with SMTP id y197so62220732vky.2
	for <qemu-arm@nongnu.org>; Tue, 27 Dec 2016 07:13:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=xWMMVIhHxKSM6C1P4PH9Bt9zt8Ixa5ZIJsFu/qlZfKg=;
	b=IowcZw9nl3/6pkgyf6Wl+DliVTxnEndshUCC50dScY+lej7FIB83zIXE5Q+2a+SY6Q
	Dd5n0OxccDpVASH7B2DlHmiA0FTAbmWJ+WoEFbUxZLDzAB4aH6l2SO7k0CxLqgf4YCXv
	MzcztyTvgFDRTKCmlr9XjqVcMwKJT4NjF6Izc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=xWMMVIhHxKSM6C1P4PH9Bt9zt8Ixa5ZIJsFu/qlZfKg=;
	b=EGCMVnssEgjytbIgTntH+18xfPnc2Le+jTqZ+Thr/x9n/3sSkWUvdYEooq9FC+CDPe
	0Xlf/PNTm87cMvxXpAt8Ja4PZ33xN1cxPnTw6IVjgDwt3PVtJvnlibeXRtye3YlCRu6f
	aFGZRKDJwplGRYQN/e3GN3c3InlX8zjPK99CLwSQHrkK4beiB5R7YasOnlkhLXicoj3U
	Q7gNj48ki0oYg3Lg8jLuGvLnNUWLSAqcii0SXaaX+HTOYg+/rE7zcMOeD4h2jwK+Nst4
	UWK2jIx0+5JycvF/sTx42/x3hFOqwNyaexvu3fqjCg+j6Io5xGi8VFhIgD1HYvYmVv80
	Zg6A==
X-Gm-Message-State: AIkVDXL4OzQNRbQLRGkohhi+4enmdO5d5aMw1buwyz/b4LvqbOKSfieqiQAe2FO3r35qLPZpRh+u4Pe4njNRp1lD
X-Received: by 10.31.7.204 with SMTP id 195mr11861481vkh.175.1482851629496;
	Tue, 27 Dec 2016 07:13:49 -0800 (PST)
MIME-Version: 1.0
Received: by 10.31.176.14 with HTTP; Tue, 27 Dec 2016 07:13:28 -0800 (PST)
In-Reply-To: <20161220153103.mkhz74wlkr3dfrxt@kamzik.brq.redhat.com>
References: <1481625384-15077-1-git-send-email-peter.maydell@linaro.org>
	<1481625384-15077-2-git-send-email-peter.maydell@linaro.org>
	<20161220153103.mkhz74wlkr3dfrxt@kamzik.brq.redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 27 Dec 2016 15:13:28 +0000
Message-ID: <CAFEAcA_jCajsMbkjZe6WO2-x+TpOJxpPBDYt3kaZR3+MTZKDug@mail.gmail.com>
To: Andrew Jones <drjones@redhat.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c05::22b
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH 01/23] target-arm: Log AArch64
 exception returns
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
	Christoffer Dall <christoffer.dall@linaro.org>,
	"patches@linaro.org" <patches@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 9qeTvgyPIdTw

On 20 December 2016 at 15:31, Andrew Jones <drjones@redhat.com> wrote:
> Should we output both the destination PC (ELR) and the source PC (where
> the eret was)? Otherwise if there are many erets to the same entry point,
> then the logs won't fully enlighten us.

We don't really conveniently have the source PC, because it isn't
written out to env->pc at the point when this helper function
is called (the calling code in translate-a64.c doesn't call
gen_a64_set_pc(), because it knows the helper doesn't need to
care about the PC value).

thanks
-- PMM
