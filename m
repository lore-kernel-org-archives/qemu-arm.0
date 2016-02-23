Received: by 10.25.208.211 with SMTP id h202csp1872572lfg;
        Tue, 23 Feb 2016 10:42:40 -0800 (PST)
X-Received: by 10.140.42.39 with SMTP id b36mr42951854qga.4.1456252960738;
        Tue, 23 Feb 2016 10:42:40 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id m22si8161814qki.19.2016.02.23.10.42.40
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 23 Feb 2016 10:42:40 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@linaro.org
Received: from localhost ([::1]:59316 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aYHuy-0003Nv-5G
	for alex.bennee@linaro.org; Tue, 23 Feb 2016 13:42:40 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39864)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1aYHuv-0003Ng-Pl
	for qemu-arm@nongnu.org; Tue, 23 Feb 2016 13:42:38 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1aYHuu-0003uF-T8
	for qemu-arm@nongnu.org; Tue, 23 Feb 2016 13:42:37 -0500
Received: from mail-vk0-x230.google.com ([2607:f8b0:400c:c05::230]:35950)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1aYHuu-0003uB-Ai
	for qemu-arm@nongnu.org; Tue, 23 Feb 2016 13:42:36 -0500
Received: by mail-vk0-x230.google.com with SMTP id c3so170040716vkb.3
	for <qemu-arm@nongnu.org>; Tue, 23 Feb 2016 10:42:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=YjO0fcmKmWnHpFnCMkHtbnncyUZSkWuvuyeoFFyhLRQ=;
	b=QT9W+okiuL/NVqnOYczZ8ztiygtpHU+g/Ggns68QZgSg5aZInEorkZht9C8lcVvTXJ
	J8sc6yHi0idYV/oeNV0YmUPCAJpeAMfBoYUPYlupBGXmK6X1HbuyxB+9qfpSwtJ12Bfm
	l6Ue5QHukCTx1FQpTHGpJ/D9Ys+HPwU3E8HRQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=YjO0fcmKmWnHpFnCMkHtbnncyUZSkWuvuyeoFFyhLRQ=;
	b=Uk+kHYvJrkx8m38i9naXHjowN+sQQPeHe5CzSfStmqylgY9R8jg+nb7n4WGGXPT/ww
	JbOKb0y0LNSZhJ9X1iM/6RgSJom9eQJKsvleUfjfMKGu3k+ytQ+Ar4V+yCpol2LzhIat
	uT5OFqxj0XSkHBxMsvzMxHwXPUT/cGSK9YYxz1LY9kUQ3iesergYdipSEMtUktxxdbPh
	ERsztGTkAiyA7icvU1xbSBRmYrZdKDxWVmZiU7Rf1Vm1WwJqlHdLw/SVr3tRTrJViWp+
	MyZMLmGwn0zZ94hgNnhUEuhGI09B7LjzJPfLVLYIpVDKEt906Mdp4TiQrTeowf88vLOd
	QV3A==
X-Gm-Message-State: AG10YORfHubukYMyRGOttmSCNVIe1CN25LL0wkM/AQ4/CwQsrnUdS9sgdRQd8JGIVIrkozMyd8G3md4idQPMaYhf
X-Received: by 10.31.52.147 with SMTP id b141mr29402685vka.82.1456252955443;
	Tue, 23 Feb 2016 10:42:35 -0800 (PST)
MIME-Version: 1.0
Received: by 10.31.56.216 with HTTP; Tue, 23 Feb 2016 10:42:16 -0800 (PST)
In-Reply-To: <56CCA649.8090906@redhat.com>
References: <1456175198-25210-1-git-send-email-wei@redhat.com>
	<CAFEAcA8vyVL6jyMTGCap9Bu=eyqR2OUN5LzH5Sjo965Fn4PmHA@mail.gmail.com>
	<56CCA649.8090906@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 23 Feb 2016 18:42:16 +0000
Message-ID: <CAFEAcA-gXuVJjJS8T87ru9YE+5VrJ25eXoqkwxsd21OK6__Upw@mail.gmail.com>
To: Wei Huang <wei@redhat.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c05::230
Cc: Andrew Jones <drjones@redhat.com>, qemu-arm <qemu-arm@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Andrea Bolognani <abologna@redhat.com>
Subject: Re: [Qemu-arm] [PATCH RFC 0/2] Versioning ARM virt machine types
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
X-TUID: MsvhpcKmNRSa

On 23 February 2016 at 18:34, Wei Huang <wei@redhat.com> wrote:
> On 02/22/2016 04:14 PM, Peter Maydell wrote:
>> My view here is the same as it has been in the past regarding
>> adding versioned machine types for 'virt': are you (in this case
>> Redhat) willing to stand behind it, in the sense of taking on
>> the maintenance burden of adding new machine versions, reviewing
>> new code contributions for issues that require changes to make sure
>> that the old versions stay looking like the old machine, testing
>> that old versions look right, testing cross version migration,
>> and so on?
>
> I understand your concerns. Currently our in-house tree already carries
> versioned ARM machine types, which mirror both QEMU 2.4 and QEMU 2.5.
> Thus someone (including myself) from Red Hat shouldn't have any problem
> of maintaining/testing it because we are already doing it downstream.
> x86 and ppc have a similar situation.

Thanks for the clarification -- if you as a distro are already
supporting versioned machine types downstream that's a strong
argument for adding it upstream.

-- PMM
