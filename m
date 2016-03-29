Received: by 10.25.208.211 with SMTP id h202csp2261093lfg;
        Tue, 29 Mar 2016 13:10:48 -0700 (PDT)
X-Received: by 10.140.158.146 with SMTP id e140mr5637631qhe.84.1459282248586;
        Tue, 29 Mar 2016 13:10:48 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id f100si349952qkf.97.2016.03.29.13.10.48
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 29 Mar 2016 13:10:48 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:49743 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1akzyS-0001XE-1v
	for alex.bennee@linaro.org; Tue, 29 Mar 2016 16:10:48 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59074)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1akzyP-0001X8-Su
	for qemu-arm@nongnu.org; Tue, 29 Mar 2016 16:10:46 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1akzyP-00068h-0c
	for qemu-arm@nongnu.org; Tue, 29 Mar 2016 16:10:45 -0400
Received: from mail-vk0-x22b.google.com ([2607:f8b0:400c:c05::22b]:33306)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1akzyO-00068P-Rp
	for qemu-arm@nongnu.org; Tue, 29 Mar 2016 16:10:44 -0400
Received: by mail-vk0-x22b.google.com with SMTP id k1so34231462vkb.0
	for <qemu-arm@nongnu.org>; Tue, 29 Mar 2016 13:10:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=+r6Msj4HUddR9JVbdpx1rvOm9B9JQj2EFgoUho30JKs=;
	b=NVoEGLS+SG+1KKsQHpjXYoe/0AW7qPlP/d5dSO8YGEt/vbey+OMnN4lKYm9fou7UBV
	Jv9J4JBeSOzT+a56bnleqfQYg+sZNjLDzb39FpMKf86xtAG2s91bXwaUWAjnYU/1zwYu
	dezJYIk2muIM0T8aGWXe928CBD/G3+3itIiOQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=+r6Msj4HUddR9JVbdpx1rvOm9B9JQj2EFgoUho30JKs=;
	b=eKLjGH8alp92RUeikuwttpMFPPsD9H/5Oau3MU1J8yhBDrQ1/rYIpu5LVRfGTOJC8z
	3jCZErWPirOuxDrF+e8inNcrhSHjzR38nG3xgLY/nQnoZIGblQf7EKq7TJU+Q9wULBmT
	YsuUoXrY2VNSl2u/I+Ig+NqTTVNmBQ16q8ZUR+tiiZYUpqsjmf5unDSUr5W/tOzdpopi
	TuIzsTZqdJ/ISZ8P4f1q90pSwytxBK1twGMS1zt2kSLeqjIYEkzX2dPtxexqvGgaXQ6r
	HvDtFdZdiCTOe6t0CtqGQs9W6kQf6F+TFOtexz6ByDuJkxLe6J8tIAkwxMfiTiJNdo0B
	0Kjg==
X-Gm-Message-State: AD7BkJLsc3qBfH/zIeBmwdbW6HDcxj1Pi8wVIoVJS+oTvSrAj5HM6l1q9IOVzN6LBBFa8k/ZHspsnJS4z9T2Wdml
X-Received: by 10.31.8.210 with SMTP id 201mr2669316vki.90.1459282243443; Tue,
	29 Mar 2016 13:10:43 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.216.1 with HTTP; Tue, 29 Mar 2016 13:10:24 -0700 (PDT)
In-Reply-To: <1458788142-17509-1-git-send-email-peterx@redhat.com>
References: <1458788142-17509-1-git-send-email-peterx@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 29 Mar 2016 21:10:24 +0100
Message-ID: <CAFEAcA-Y=nXpaNmOUNPzsFBhSZES9SD2k+u3XhVhzABOr9qGrw@mail.gmail.com>
To: Peter Xu <peterx@redhat.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c05::22b
Cc: Andrew Jones <drjones@redhat.com>, Libvirt <libvir-list@redhat.com>,
	Markus Armbruster <armbru@redhat.com>,
	Michael Roth <mdroth@linux.vnet.ibm.com>,
	QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
	Andrea Bolognani <abologna@redhat.com>, Eric Blake <eblake@redhat.com>,
	Christoffer Dall <christoffer.dall@linaro.org>
Subject: Re: [Qemu-arm] [PATCH v7 0/4] ARM: add query-gic-capabilities QMP
	command
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
X-TUID: 921/nTuA2byo

On 24 March 2016 at 02:55, Peter Xu <peterx@redhat.com> wrote:
> This patch is to add ARM-specific command "query-gic-capability".
>
> The new command can report which kind of GIC device the host/QEMU
> support. The returned result is in the form of array.
>
> Sample command and output:
>
> {"execute": "query-gic-capability"}
> {"return": [{"emulated": false, "version": 3, "kernel": false},
>             {"emulated": true, "version": 2, "kernel": true}]}

I really strongly want this in 2.6 but we are very very nearly
out of time. Eric or Markus, could I trouble one of you to
provide an ack for this series for the QMP protocol aspects
sometime before end of Wednesday, please?

I also don't think I've seen an indication from the libvirt
folks that this is definitely the API they want; did I miss it?

thanks
-- PMM
