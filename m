Received: by 10.182.158.201 with SMTP id ww9csp87962obb;
        Tue, 8 Dec 2015 08:55:27 -0800 (PST)
X-Received: by 10.55.78.82 with SMTP id c79mr810344qkb.44.1449593727174;
        Tue, 08 Dec 2015 08:55:27 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id o7si4172284qgd.117.2015.12.08.08.55.27
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 08 Dec 2015 08:55:27 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@linaro-org.20150623.gappssmtp.com
Received: from localhost ([::1]:60728 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1a6LXy-0006Vy-R5
	for alex.bennee@linaro.org; Tue, 08 Dec 2015 11:55:26 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53317)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1a6LXx-0006Vl-2p
	for qemu-arm@nongnu.org; Tue, 08 Dec 2015 11:55:26 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1a6LXw-00034U-1t
	for qemu-arm@nongnu.org; Tue, 08 Dec 2015 11:55:25 -0500
Received: from mail-vk0-x235.google.com ([2607:f8b0:400c:c05::235]:36225)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1a6LXv-000346-SM
	for qemu-arm@nongnu.org; Tue, 08 Dec 2015 11:55:23 -0500
Received: by vkay187 with SMTP id y187so19865490vka.3
	for <qemu-arm@nongnu.org>; Tue, 08 Dec 2015 08:55:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linaro-org.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=9iO0+pVMWeitp9kxw+N5IW6FbFytMy+Z3fAYm5wK/P8=;
	b=2HxgU+g5bLa6VqKimbbeRmB679MaHaI4DgtKgn8MupydAGRc07QG5Fzh5JOBiYb/AV
	dRfmPq9QNTpQLZkEv/1P0Eoi9N7BKCQW47RSR/arOj6PdnGUS2YPx/hhI3x92wOEFBw7
	aXrukNX9JF/3dwBBmzh+j2621gxXFU4hLVWtrPbyPUET7u1Skp1FgRl7W2dXMymxh+wV
	RtNvrxZtx1c/q5YE878HZ7hBsi6LUFPytO9pMXRTlDyxDb8vs+DMmm09gJ3qu7XjtR2u
	LhbvhAlPpW6dI5UjGQhNPCHpypm9airvR1U1cUHrdeOFeNYXwmnUb5S1Wqw8yFwTEDIC
	pERQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=9iO0+pVMWeitp9kxw+N5IW6FbFytMy+Z3fAYm5wK/P8=;
	b=BH44NMt+rXhvQqB2572Te+BhEK8AFhODGaPBDlWVGvM+TVjD5Ca9PYjeIm0aif/uOL
	a7YDUV34Hrfu/uFQfR76DUrhs0XG1sGbkLMc0DAsIVBmNEVKgAhg42j34IVJV04Sb/eI
	bObNBfOO6jG6/R8GSpVDW3+wn7Ec+nKI+qIi8MW51DUuEM1M0y8CpLuWPfErtmpSP5cA
	qUCE8dVad2eiDzOnGIC8EFwCoKzUQiE6W280eR5dKp+y3T7lEhVmWm5BwheGNbCeqCDk
	wT6g6hGBmgEP75JNdcwBFXSyru5qJuKxkjkhEQdxspcUFQo7Q6ESmcvcXJiTa7B1gnP1
	PvXw==
X-Gm-Message-State: ALoCoQlqzhiJXrFN7XhGAfW8UL/Lplo15ItT3fRjB7JLpPRXht0hSteaLMDlAFWf8rGL4iWiDEr9AVDWSCFrELdV7StGKpKOc8iqn9oh59H55av/y9wicuM=
X-Received: by 10.31.180.145 with SMTP id d139mr430336vkf.83.1449593723021;
	Tue, 08 Dec 2015 08:55:23 -0800 (PST)
MIME-Version: 1.0
Received: by 10.31.153.15 with HTTP; Tue, 8 Dec 2015 08:55:03 -0800 (PST)
In-Reply-To: <1447682723-3977-19-git-send-email-peter.maydell@linaro.org>
References: <1447682723-3977-1-git-send-email-peter.maydell@linaro.org>
	<1447682723-3977-19-git-send-email-peter.maydell@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 8 Dec 2015 16:55:03 +0000
Message-ID: <CAFEAcA8u+W27UGD0Qz2=340-vj2Yt6UPQyT+8UrCMTYLJ=46FQ@mail.gmail.com>
To: QEMU Developers <qemu-devel@nongnu.org>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c05::235
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-arm <qemu-arm@nongnu.org>,
	=?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>,
	Patch Tracking <patches@linaro.org>
Subject: Re: [Qemu-arm] [PATCH v2 18/19] [RFC] hw/arm/virt: add secure
 memory region and UART
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
X-TUID: QTpSb9W30DKv

On 16 November 2015 at 14:05, Peter Maydell <peter.maydell@linaro.org> wrote:
> Add a secure memory region to the virt board, which is the
> same as the nonsecure memory region except that it also has
> a secure-only UART in it. This is only created if the
> board is started with the '-machine secure=on' property.
>
> This is an RFC patch, beacuse the device tree bindings for
> indicating secure vs nonsecure devices are still under
> discussion upstream:
>       https://lkml.org/lkml/2015/10/29/287

The bindings have been accepted upstream, so we can take the
'RFC' tag off this patch now.

thanks
-- PMM
