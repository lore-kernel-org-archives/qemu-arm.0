Received: by 10.25.21.156 with SMTP id 28csp1400872lfv;
        Fri, 29 Jul 2016 08:29:30 -0700 (PDT)
X-Received: by 10.37.60.7 with SMTP id j7mr33409458yba.22.1469806170191;
        Fri, 29 Jul 2016 08:29:30 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id m63si12488527qki.332.2016.07.29.08.29.30
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 29 Jul 2016 08:29:30 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:60149 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bT9j7-0002Q0-Hl
	for alex.bennee@linaro.org; Fri, 29 Jul 2016 11:29:29 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50980)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bT9j3-0002IR-LI
	for qemu-arm@nongnu.org; Fri, 29 Jul 2016 11:29:26 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bT9j1-0000cn-QD
	for qemu-arm@nongnu.org; Fri, 29 Jul 2016 11:29:24 -0400
Received: from mail-ua0-x231.google.com ([2607:f8b0:400c:c08::231]:33221)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bT9j1-0000cN-Ly
	for qemu-arm@nongnu.org; Fri, 29 Jul 2016 11:29:23 -0400
Received: by mail-ua0-x231.google.com with SMTP id k90so64298350uak.0
	for <qemu-arm@nongnu.org>; Fri, 29 Jul 2016 08:29:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=iSEFglFlygyK27UjcyLvTCSXUWUxhHeXoMoC47XaD5s=;
	b=KHGKrEgvnSZuY9gpAN/IAQ0oOtd6PutjDBaQZJKBLqIhv7bIASMbIKsdsNNJctTOhs
	hK2MrpZopXdFflFm6IQFHlQKEvgDOvZERAfNKf/Bsu+fYJ7JCw+9luOFUUYyJN4si7Tv
	ZNaKQGKcrMGsIJCV+HNUEnORWhnrOlW9jIdbs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=iSEFglFlygyK27UjcyLvTCSXUWUxhHeXoMoC47XaD5s=;
	b=Fqb5HpbKUGOoIhEn0VvCc+G5ZnZJZTG5/DfW7eG21zoNWWwV8rqhuvDkb+9drR/u5J
	SfQ6dUl14T1yQerRs1BiVg3bNQ9OegLUFDBjURhZwGXN/89TwCz6UtfFG0pVDVWxWroT
	D+TfGVuDMj96R/nsEuTqfBLHakoL8zipjquZC+jF3XrV94ZPaUm5rgbtX1M2YhBsb7hX
	TRVmJVSTp2qvYKrv1IWNo1CueIwlDu8PFRRjSAX75gP9LqbnGwSTWKb42hDAqlobkptS
	nljKw48N8W+IyJ/cGuP8UnDgpikc+35UdCSi2qluBLzEVRZ+3rxuepL5z1TZ2XPiXipF
	DiwA==
X-Gm-Message-State: AEkoouuFZoh11btwwes2UBWK7AslGTxPPTlMbNZeuk0+SvcYc0PRsuwaGaJ2dECkjjzs+lI6wzWeohDhKpaSZgUm
X-Received: by 10.159.41.69 with SMTP id t63mr19420855uat.66.1469806163274;
	Fri, 29 Jul 2016 08:29:23 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.137.136 with HTTP; Fri, 29 Jul 2016 08:29:03 -0700 (PDT)
In-Reply-To: <20160729065453.qq44y2hxohizk3yw@hawk.localdomain>
References: <1469723896-28049-1-git-send-email-wei@redhat.com>
	<20160729065453.qq44y2hxohizk3yw@hawk.localdomain>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 29 Jul 2016 16:29:03 +0100
Message-ID: <CAFEAcA_58ffJV+YXn1xA_RDpgBnPRLDf9PTGif0KuCkRet47OA@mail.gmail.com>
To: Andrew Jones <drjones@redhat.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c08::231
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH RFC 1/1] arm64: add an option to
 turn on/off vpmu support
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
	Andrea Bolognani <abologna@redhat.com>,
	Shannon Zhao <shannon.zhao@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: oektoF37OUTf

On 29 July 2016 at 07:54, Andrew Jones <drjones@redhat.com> wrote:
> OK, so this property will be exposed to all ARM cpu types, and if a user
> turns it on, then it will stay on for all types, except when using KVM
> with an aarch64 cpu type, and KVM doesn't support it. This could mislead
> users to believe they'll get a pmu, by simply adding pmu=on, even when
> they can't. I think we'd ideally keep has_pmu, and the current code that
> sets it, and then add code like
>
>  if (enable_pmu && !has_pmu) {
>    error_report("Warning: ...")
>  }
>
> somewhere.

I think we should probably follow the existing model used by
has_el3, where the property only exists if it's valid to set it.

thanks
-- PMM
