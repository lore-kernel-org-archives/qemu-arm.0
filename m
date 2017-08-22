Received: by 10.223.188.70 with SMTP id a6csp5225680wrh;
        Tue, 22 Aug 2017 10:31:30 -0700 (PDT)
X-Received: by 10.55.164.129 with SMTP id n123mr2173750qke.49.1503423090327;
        Tue, 22 Aug 2017 10:31:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1503423090; cv=none;
        d=google.com; s=arc-20160816;
        b=S6IOhZi5SBiTcu7Nb4F+I6AmVLmwElaHqWqhNtUG83FjmPU0SuNhLcgrl5Hck6EUR+
         ncyXIc4wERylAA79UaPq8tQxFc0KaDNn52D5jwbj0EKW6dgZOoGaGmVdugU0IJOgtPx3
         yxFa6zCuWfnYVCWdaE1nFmOWvfobVy6Lkj8JUWjgFPnCava8ZyTHGIRkGcKZzwR53w0Q
         yFTkWoiX8HS1OJwJrHQAU0ka3NMRAwUqfWrP46zdBFVS3tbVZ9LB3NTPcrfglGPEiP+X
         tHENFRBfD+KfZeLi9qE9HmLwlE+BZyvyBGyOv2vSjqnV3NH44gT+9/Rxq8zy85HmwiCn
         KjRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=YvWLWENi61GKyC/f9oCziRf4UglrxZshvcQaYUSLPuM=;
        b=0YnsiawME2TLTn4GCKiG9Q8KI9vfI+c2FfICKyOJvmKU1tWRmsNz5QQLAqCR3S9O6j
         HIya/OWEHRgpxPQ3KN2XURvN7/NxEbymQZbCHfoHXrNnutoaiMm7zKsHsos1DBTYlV14
         cXtV1GtjzE/lSeS+NWQd6/CVb7T4JSZRe+NH5ygZ1GCO8o876PSNvAjQSKyb0NSWBmEz
         eqmpJhOBD+G/A9Bj4vopiwx615oR8Y+VV78ITwfy47TOKmDiFHgaXOdEReVYBXrmnPEk
         8pZemDEd7lIsBX5/QoPW/HEJohqK/cUwJCtrM7BdB4ozgybApTQNZaxwlnqunghEgBXL
         9ijQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=aYnOVUjF;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id g4si5405149qke.30.2017.08.22.10.31.29
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 22 Aug 2017 10:31:30 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=aYnOVUjF;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:39366 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dkD1U-00061Q-0i
	for alex.bennee@linaro.org; Tue, 22 Aug 2017 13:31:28 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44148)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1dkD1J-00060A-Fa
	for qemu-arm@nongnu.org; Tue, 22 Aug 2017 13:31:18 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1dkD1I-0004vx-IP
	for qemu-arm@nongnu.org; Tue, 22 Aug 2017 13:31:17 -0400
Received: from mail-wr0-x231.google.com ([2a00:1450:400c:c0c::231]:37039)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1dkD1I-0004vi-Au
	for qemu-arm@nongnu.org; Tue, 22 Aug 2017 13:31:16 -0400
Received: by mail-wr0-x231.google.com with SMTP id z91so127660478wrc.4
	for <qemu-arm@nongnu.org>; Tue, 22 Aug 2017 10:31:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=YvWLWENi61GKyC/f9oCziRf4UglrxZshvcQaYUSLPuM=;
	b=aYnOVUjFR2Wd4kzHG67N6e2LM77Qsis2Wg0tJLCAHetGU1GFBsSZh1Mgs6fsj0pILn
	ZRJA1cvthUtktcmdi/iR5sxT1gTqCN3uyuTcmz1fekYv509NYDynyD8MpgpGfFQL1Hgs
	hi3egSjjlzQl8Iy33ac5DS8xLczmwqP2XMdlk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=YvWLWENi61GKyC/f9oCziRf4UglrxZshvcQaYUSLPuM=;
	b=lTdsy14eV+kwjPVMmNE2jqOGwzxMt0iPQGnmtjQ+35YcnEyODFvs3KojuSvzYHi3PY
	IVcjPzsP7qNqe0DRJiQRKursaOigvm6IWUcyqqsoxlc2Ot+XGvqTegl1pkTbmBra0AsL
	gdQx7EDsyYFuG3IaCK52AKwvTwd+M5LiUNhGocK+aKm2+LRI+cv1frbSFdw48W1mKSON
	kj5+NarlBYnZYmfWepumOTl+fWiIXORCpO7Ghn6ZDW8pDcCNWTX4atsWYzqEi7vthtK1
	trLcbu9RCzuVvzulTt2nkzpj4H1ZGtkQEptvgAskrmD5dbQM5C/j0yUnlbjyJmsmvPmH
	wRBw==
X-Gm-Message-State: AHYfb5j5HoayI5ONv1LCswZeiu0uXMGGM2K2ee5XBScYN0XTAihzGktw
	YVf6gdoiPiwzIkbcMOLgLIXkt+O9RGVa
X-Received: by 10.223.169.201 with SMTP id b67mr765969wrd.314.1503423074840;
	Tue, 22 Aug 2017 10:31:14 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.134.54 with HTTP; Tue, 22 Aug 2017 10:30:54 -0700 (PDT)
In-Reply-To: <1503412231-13961-1-git-send-email-thuth@redhat.com>
References: <1503412231-13961-1-git-send-email-thuth@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 22 Aug 2017 18:30:54 +0100
Message-ID: <CAFEAcA-jE3yn+p+krW9oM9h5bY5yJ6yZUfqPZW=jS_JZgueWug@mail.gmail.com>
To: Thomas Huth <thuth@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c0c::231
Subject: Re: [Qemu-arm] [PATCH v2] hw/arm/digic: Mark device with
 user_creatable = false
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
	Antony Pavlov <antonynpavlov@gmail.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ZzFrERCobtSd

On 22 August 2017 at 15:30, Thomas Huth <thuth@redhat.com> wrote:
> QEMU currently shows some unexpected behavior when the user trys to
> do a "device_add digic" on an unrelated ARM machine like integratorcp
> in "-nographic" mode (the device_add command does not immediately
> return to the monitor prompt), and trying to "device_del" the device
> later results in a "qemu/qdev-monitor.c:872:qdev_unplug: assertion
> failed: (hotplug_ctrl)" error condition.
> Looking at the realize function of the device, it uses serial_hds
> directly and this means that the device can not be added a second
> time, so let's simply mark it with "user_creatable = false" now.
>
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>  v2: Updated the comment and the patch description
>
>  hw/arm/digic.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/hw/arm/digic.c b/hw/arm/digic.c
> index 94f3263..6184020 100644
> --- a/hw/arm/digic.c
> +++ b/hw/arm/digic.c
> @@ -101,6 +101,8 @@ static void digic_class_init(ObjectClass *oc, void *data)
>      DeviceClass *dc = DEVICE_CLASS(oc);
>
>      dc->realize = digic_realize;
> +    /* Reason: Uses serial_hds in the realize function --> not usable twice */
> +    dc->user_creatable = false;
>  }
>
>  static const TypeInfo digic_type_info = {

Applied to target-arm.next for 2.11, thanks.

-- PMM
