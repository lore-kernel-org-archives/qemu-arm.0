Received: by 2002:a5d:4301:0:0:0:0:0 with SMTP id h1-v6csp5191592wrq;
        Tue, 26 Jun 2018 09:04:36 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpfZQ1HjaRsKR+WAlnWyMwDUDxWa8+wLSS3PpuH/BFm8osP1dRoo9jnFe68l696haVSiqhFU
X-Received: by 2002:a0c:9259:: with SMTP id 25-v6mr1976404qvz.239.1530029076316;
        Tue, 26 Jun 2018 09:04:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1530029076; cv=none;
        d=google.com; s=arc-20160816;
        b=F/OTuH86N1ifgLOGIMU+yeHwfGe0ss5jqAvcTNcPkbigEKYg0En7pdmuXYAhh9VXf3
         Rnk7sK2VBzHyl/7X+cc8bLvkpodkqMIElft36ObDD4ep9qfE7hKKTiNAavkeFHzdOMMo
         ToubiAWIyQMVhPbIdlHNsehi29etea+QH6fR0PsfrtclCYbdq7YNf793EtgVMZhnxrH8
         QhaCkSryIYq4ycBk04oH7Nw+AJ115FHtCo8dMh+q6fhUpXffXIb6GjSYbkTXloh5UO5p
         85boSz6DzdgDwxOHUo9HZh1MEXSFEED7sJoGMn15AIu66AkPbq57nRym4F12s+6tWe2c
         IsZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=F3FOjcJaDG9dtTCeeR2WZa9XN3xdjIigjNndYYYgLM8=;
        b=FNgc4P6DyPWMUwIVLXXZgfdrwxUlw9lU4q0WBHelmCqrNpxSeyWoPQEiylqhAqG8Wh
         pG2hfTdRECS2oE2KNF/wQTZQQipBmqrO9cBbN4bUX0o/ZcHLbeKN9e98hp8Hv4OgrAs2
         u1yps++rCkM1RU0fwHlR51V1IeSpw6r92sWE/B3iUz8dDfGvBlvnZGAvniv8YzpFpEpN
         RvrEgX29pI0sZyZNRap/47K7x3gBq6h7+qZ+/HPL3F9S/CxjcESihROT4Mw+qY5i9Lpl
         IPLW/2o/Lu3iGHKe/+yzbfdFwkTrqKUrs+6J7tCU+RJ2M1Umt1FINA+nEfBh71tek59N
         VuWQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=CQVdH72W;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id y7-v6si1754974qth.349.2018.06.26.09.04.36
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 26 Jun 2018 09:04:36 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=CQVdH72W;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:53675 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fXqSJ-0002SG-MY
	for alex.bennee@linaro.org; Tue, 26 Jun 2018 12:04:35 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39145)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fXqRs-0002Ff-4z
	for qemu-arm@nongnu.org; Tue, 26 Jun 2018 12:04:12 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fXqRr-0006wm-7H
	for qemu-arm@nongnu.org; Tue, 26 Jun 2018 12:04:08 -0400
Received: from mail-ot0-x241.google.com ([2607:f8b0:4003:c0f::241]:38302)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1fXqRr-0006wP-3k
	for qemu-arm@nongnu.org; Tue, 26 Jun 2018 12:04:07 -0400
Received: by mail-ot0-x241.google.com with SMTP id w22-v6so434601otk.5
	for <qemu-arm@nongnu.org>; Tue, 26 Jun 2018 09:04:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=F3FOjcJaDG9dtTCeeR2WZa9XN3xdjIigjNndYYYgLM8=;
	b=CQVdH72WuN+sOZvb4R0RDVHvcaxv5xSWtODMBDVXSN0qqzTnQwSzK+VeL22wtqUYDp
	hCW+cQpkAnJXMn3jFBpuoXZopEbwbPLIce8ri6tgHFboKTm95lETeoP8d6oEae3AkEH/
	W3eYZVsTRK2/SjCHQtitPed/pP0pnv5hjfN2M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=F3FOjcJaDG9dtTCeeR2WZa9XN3xdjIigjNndYYYgLM8=;
	b=ZOpZEG6cWjaP+eSeeBST4Wd6C/eRIldcNIlWbmJxDIQtKuV+1mHywdt1g7LZQQ5r6r
	/rtiqVnR7zvtj02Ily9UyWZjdzJUfUL8CpTST0FrTiLFN5j8CMykk1rD/daDvVeM3x0U
	9yFpyA+EWTdt6bj4I3s3ib8uR7x5M7eYlubF/ZK2gHaWGyutMjiGxx5N2+jOMRt3MKD5
	3gVrtfKqGxuPEv0mjOz/Yji95JkHLTniFQ5ahdqHN69tiRr1u1HHpBhCjgMZtsKAg0tB
	yHhIJCjx1VQmpztg8pQSWvlsjOEc2VeYCMPevyS89vU7Y7ZQJT0hYq5YBOLcKJ7vHXEH
	4SIw==
X-Gm-Message-State: APt69E1xcnM0Mp0mAXt6cp866L2MYdG9HIxZ3sY3p7DHOWzi7APNvoml
	cWUGsBaDbDl2hbZEa5si4ap12mglQqrtg10syY3H5Q==
X-Received: by 2002:a9d:3d76:: with SMTP id
	a109-v6mr1304228otc.294.1530029046256; 
	Tue, 26 Jun 2018 09:04:06 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:902:0:0:0:0:0 with HTTP;
	Tue, 26 Jun 2018 09:03:45 -0700 (PDT)
In-Reply-To: <1529653501-15358-1-git-send-email-eric.auger@redhat.com>
References: <1529653501-15358-1-git-send-email-eric.auger@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 26 Jun 2018 17:03:45 +0100
Message-ID: <CAFEAcA9CNTF9xsfcKyCpEDX-meb6JyqbicWpZdqGPc8YAU4b8A@mail.gmail.com>
To: Eric Auger <eric.auger@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c0f::241
Subject: Re: [Qemu-arm] [PATCH v4 0/4] ARM SMMUv3: IOTLB Emulation and VHOST
 Support
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
Cc: jia.he@hxt-semitech.com, Jia He <hejianet@gmail.com>,
	qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
	Eric Auger <eric.auger.pro@gmail.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: PwDsP5uTu30D

On 22 June 2018 at 08:44, Eric Auger <eric.auger@redhat.com> wrote:
> This series brings translation configuration caching and IOTLB
> emulation.  The last patch implements VHOST integration and
> allows to run VSMMUv3 along with VHOST emulated end points.
>
> The first patch fixes the passthrough mode bug reported by Jia.
> It reworks the translate function and this series needed to be
> rebased on it.
>
> Best Regards
>
> Eric
>
> This series can be found at:
> https://github.com/eauger/qemu/tree/v2.12.0-vsmmu-optim-v4
> Previous version at:
> https://github.com/eauger/qemu/tree/v2.12.0-vsmmu-optim-v3
>
> History:
>
> v3 -> v4:
> - (new == IOMMU_NOTIFIER_MAP) replaced by (new & IOMMU_NOTIFIER_MAP)
>   in smmuv3_notify_flag_changed
>
> v2 -> v3:
> - collected Peter's R-b
> - do not use float in trace points anymore
>
> v1 -> v2:
> - addition of the 1st patch (including addr_mask fix)
> - addition of the per device mutex as on intel iommu
>
> v1: [1] v12 last 3 patches resent in this series
> [1] [PATCH v12 00/17] ARM SMMUv3 Emulation Support
> https://lists.gnu.org/archive/html/qemu-devel/2018-04/msg04344.html



Applied to target-arm.next, thanks.

-- PMM
