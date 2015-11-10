Received: by 10.182.105.169 with SMTP id gn9csp1723507obb;
        Tue, 10 Nov 2015 03:56:17 -0800 (PST)
X-Received: by 10.140.174.68 with SMTP id u65mr3849631qhu.62.1447156577873;
        Tue, 10 Nov 2015 03:56:17 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id z206si2518802qka.86.2015.11.10.03.56.17
        for <alex.bennee@linaro.org>
        (version=TLSv1 cipher=RC4-SHA bits=128/128);
        Tue, 10 Nov 2015 03:56:17 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@linaro_org.20150623.gappssmtp.com
Received: from localhost ([::1]:59112 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1Zw7X7-0002yS-Kh
	for alex.bennee@linaro.org; Tue, 10 Nov 2015 06:56:17 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44131)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1Zw7X6-0002xs-33
	for qemu-arm@nongnu.org; Tue, 10 Nov 2015 06:56:16 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1Zw7X5-0008Hv-95
	for qemu-arm@nongnu.org; Tue, 10 Nov 2015 06:56:15 -0500
Received: from mail-vk0-x231.google.com ([2607:f8b0:400c:c05::231]:36534)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1Zw7X5-0008Hi-3b
	for qemu-arm@nongnu.org; Tue, 10 Nov 2015 06:56:15 -0500
Received: by vkas68 with SMTP id s68so10713827vka.3
	for <qemu-arm@nongnu.org>; Tue, 10 Nov 2015 03:56:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linaro_org.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=5Rusq20Omat1Kq8AFkw8VcVJk1D132/45KJHVuqAWQo=;
	b=ZW9b062yA8Ach3Pe+Io2TihJGc+HGJcIGnOo4XBbd/CeEyB7upgKaeMFIXJ1Cc1BwC
	3bWduu3rrV5qbckwfzW44OoqWhN/QXjj/dtnWO5vCMLxlE5/ukSuzidbtnZTchD1Yn1C
	bYMAy9NyKfhV9SA/FUM2/djCL4BQkEwFNJi7J3GtxEgh6zQrQpL/85w6qlEhAkyEyhA/
	HqNXWfs7OdSefYQEbwsjspcVMqrP2ThmCZXW989Msk2rT4zb6EwtsHzRgCjPcBzaTIuj
	i+/3vo7VQTmvmplhl6Wf9SOn5HXzDDlcW6bE5QXISnJO3Uwk9R7ajs0K3kMdkEgEMLlm
	VAEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=5Rusq20Omat1Kq8AFkw8VcVJk1D132/45KJHVuqAWQo=;
	b=TFtKMVK8Ien7ocUQng8epofmkiI/xnVlO9gLydUCoyoCnIaQVEOCWj92nfg0jxoVH7
	NakZGJ2yVQ8uD3Qx9rB9RaxjlIw08HpkEVrvBQWnZN44Q0+q9lTSv7TutJ/U9AGlg/UE
	qCgwamOmTcvWCmG/W1OUIfQOUEQtyg7HIbnFzLmPcz3RoE7zagK6sA4Wg4wxr0PpIHEM
	D9gXtl2J3lnOHygVsQ1Kevmtq4THFQ+qpBjIjCQTbfYCfpgVEvB9vfARIwaXGJLNPJOG
	MKWN3hR1JH561029n5n6aelX1JHn5oUTO2/57wVQRcv74+QsYdY49V3evCf0vKox+YGX
	o62A==
X-Gm-Message-State: ALoCoQnlKnfCieAJCrzaY0eEjuTfxcXNcjepDdPASiaMgImaSJxJkjVsZihRxl9TY0W0HWrvZ2iJ
X-Received: by 10.31.11.3 with SMTP id 3mr1870628vkl.83.1447156574623; Tue, 10
	Nov 2015 03:56:14 -0800 (PST)
MIME-Version: 1.0
Received: by 10.31.153.15 with HTTP; Tue, 10 Nov 2015 03:55:55 -0800 (PST)
In-Reply-To: <87y4e6xkf3.fsf@blackfin.pond.sub.org>
References: <1446909925-12201-1-git-send-email-drjones@redhat.com>
	<CAFEAcA_Pk7_MourHFc-SLCQ-StTfc8ssZ_Kz6HahE5=9bxMHyA@mail.gmail.com>
	<87twovpqg1.fsf@blackfin.pond.sub.org>
	<CAFEAcA8rsWg=9ZV75ZmJYPrPznUH-bQObvzHUem1Tciv3_5CaA@mail.gmail.com>
	<87oaf3jww7.fsf@blackfin.pond.sub.org>
	<CAFEAcA8Rh9ts2r-nMGbNm7Y=SpdxL4gv0ch3CBWOHiHTRMeztg@mail.gmail.com>
	<878u67atv0.fsf@blackfin.pond.sub.org>
	<CAFEAcA-z6NzyGkXqG27seP9G5c8qAL-MwY0QCPT1qZhfq6DZ+g@mail.gmail.com>
	<87y4e6xkf3.fsf@blackfin.pond.sub.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 10 Nov 2015 11:55:55 +0000
Message-ID: <CAFEAcA-nibxGqD1fu3nBcj_mpEkN28kq7x6PxpQbHaGOKWGCtQ@mail.gmail.com>
To: Markus Armbruster <armbru@redhat.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2607:f8b0:400c:c05::231
Cc: Andrew Jones <drjones@redhat.com>, qemu-arm@nongnu.org,
	QEMU Developers <qemu-devel@nongnu.org>
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH] hw/arm/virt: error_report
	cleanups
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
X-TUID: KY86hpillMfV

On 10 November 2015 at 09:39, Markus Armbruster <armbru@redhat.com> wrote:
> Peter Maydell <peter.maydell@linaro.org> writes:
>> ...so in conclusion Andrew's patch is correct as it stands
>> and I should just apply it? :-)
>
> Yes.  It got my R-by :)

OK, applied to target-arm.next. Thanks for walking me through this.

-- PMM
