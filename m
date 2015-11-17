Received: by 10.182.158.201 with SMTP id ww9csp883705obb;
        Tue, 17 Nov 2015 10:10:38 -0800 (PST)
X-Received: by 10.129.137.198 with SMTP id z189mr41588810ywf.307.1447783838438;
        Tue, 17 Nov 2015 10:10:38 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id q62si8600684ywb.385.2015.11.17.10.10.38
        for <alex.bennee@linaro.org>
        (version=TLSv1 cipher=RC4-SHA bits=128/128);
        Tue, 17 Nov 2015 10:10:38 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@linaro_org.20150623.gappssmtp.com
Received: from localhost ([::1]:60105 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ZykiD-0000hu-VS
	for alex.bennee@linaro.org; Tue, 17 Nov 2015 13:10:37 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59033)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1ZykiB-0000hW-74
	for qemu-arm@nongnu.org; Tue, 17 Nov 2015 13:10:36 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1ZykiA-0006GT-Ap
	for qemu-arm@nongnu.org; Tue, 17 Nov 2015 13:10:35 -0500
Received: from mail-yk0-x231.google.com ([2607:f8b0:4002:c07::231]:34769)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1ZykiA-0006GM-4j
	for qemu-arm@nongnu.org; Tue, 17 Nov 2015 13:10:34 -0500
Received: by ykfs79 with SMTP id s79so20341424ykf.1
	for <qemu-arm@nongnu.org>; Tue, 17 Nov 2015 10:10:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linaro_org.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=aLn9NpculS2jaoc0iEPkpVnSaM+aPr1JmGAp2WwC8qQ=;
	b=oR0eF/jgu4GTIIAb1eR0vgjBEUYL5iOieLmQYphkAuOHDprovb4hDfF+cL3u0g/m3r
	1+ni7MWtYFbhT9EGvAM677iKoUwfjP3lx+oivfoUwpKkZJ+q2TxckhD3o3n4m262sNgo
	ChHjjexEJB63zCymrOnSE61x3QsXnTYvBoNoGSdV1MWylMd4k3jzhpDSrbq8w97qmwhq
	QW6e1BYuRE1dpzkJ6IRJMIhLUTQIhQ55s4amYb5syxi9hMxXZhPb6CYmVzbpO4m7kDiq
	FBzhdZ4DPfv5CqXhKuf2a9v7G7Iei7mLVI33pfkbYSCKpCjgN9WFcgQXXFF/FnldkchK
	T5Hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=aLn9NpculS2jaoc0iEPkpVnSaM+aPr1JmGAp2WwC8qQ=;
	b=goyQTXjjOwGFC5vQa+VUxrFaIa85DQgNGdGqMF7padq1fVLLu3+H+rmZ7M9mdZ1wDT
	UXe/jG2jNyxDH1JVvQBYiXECma0x98b5FxGKWNHerq8HnuwR5E7qSlgkJKxbLU7xDy+R
	bz2X2iqLLyom0xFgClDFnY05bUMirfjyxjtiD/XnoZW2aXJJQ8//OEtIDGF+TxIJVuoq
	Eygwt5KIrFEwhWNC8UVBwENdgAzaWd0dMvHn1BXr6r7HkcC0iiEJKqI5zfEXB+ZutYQW
	K2Od+4qgwUcwOAdRFFxtbsHtX/8a06VWPwxDqoeEelo027UHzEHhvbTPK4gWbDefQGcl
	JA+w==
X-Gm-Message-State: ALoCoQnVAfa9t0UDMEJyUl2wf2ZILoZkZrSEWXTbgORb7ef2GVRE5+JVjXnmDYov8Vx8NXZoW1hN
X-Received: by 10.129.57.68 with SMTP id g65mr12661525ywa.105.1447783833592;
	Tue, 17 Nov 2015 10:10:33 -0800 (PST)
MIME-Version: 1.0
Received: by 10.31.153.15 with HTTP; Tue, 17 Nov 2015 10:10:14 -0800 (PST)
In-Reply-To: <1447031505-12477-6-git-send-email-mdavidsaver@gmail.com>
References: <1447031505-12477-1-git-send-email-mdavidsaver@gmail.com>
	<1447031505-12477-6-git-send-email-mdavidsaver@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 17 Nov 2015 18:10:14 +0000
Message-ID: <CAFEAcA-qQBfSVx+q3yOgCy8O0VGfrW1u_BV6YduB+DpCMYWXVw@mail.gmail.com>
To: Michael Davidsaver <mdavidsaver@gmail.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2607:f8b0:4002:c07::231
Cc: Peter Crosthwaite <crosthwaitepeter@gmail.com>, qemu-arm@nongnu.org,
	QEMU Developers <qemu-devel@nongnu.org>
Subject: Re: [Qemu-arm] [PATCH 05/18] armv7m: expand NVIC state
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
X-TUID: PFu1dk2Hnpuv

On 9 November 2015 at 01:11, Michael Davidsaver <mdavidsaver@gmail.com> wrote:
> Expand the NVIC to fully support -M priorities and masking.
> Doesn't use GIC code.
>
> Move some state to ARMCPU to allow calculation of exception masking.
>
> Add storage for PRIGROUP to configure group/sub-group split.
> Track group and sub-group in separate fields for quick comparison.
> Mix in vector # with sub-group as per tie breaking rules.
>
> NVIC now derives directly from SysBusDevice, and
> struct NVICClass is eliminated.
>
> Also add DPRINTF() macro.
>
> Signed-off-by: Michael Davidsaver <mdavidsaver@gmail.com>

This patch doesn't compile, because you've removed the definition of
NVICClass, NVIC_CLASS, etc, but not their uses. A patchset needs to
compile after every patch in it, not just at the end when all patches
are applied. You'll need to rearrange your changes between patches
a bit.

thanks
-- PMM
