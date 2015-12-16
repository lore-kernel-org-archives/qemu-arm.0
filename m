Received: by 10.182.158.201 with SMTP id ww9csp3085205obb;
        Wed, 16 Dec 2015 03:17:24 -0800 (PST)
X-Received: by 10.140.106.37 with SMTP id d34mr61294282qgf.77.1450264644654;
        Wed, 16 Dec 2015 03:17:24 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id a197si6161630qkb.6.2015.12.16.03.17.24
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 16 Dec 2015 03:17:24 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@linaro.org
Received: from localhost ([::1]:46624 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1a9A5E-0001tL-AN
	for alex.bennee@linaro.org; Wed, 16 Dec 2015 06:17:24 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46620)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1a9A5C-0001t3-IP
	for qemu-arm@nongnu.org; Wed, 16 Dec 2015 06:17:23 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1a9A5B-0008Tk-Si
	for qemu-arm@nongnu.org; Wed, 16 Dec 2015 06:17:22 -0500
Received: from mail-vk0-x22d.google.com ([2607:f8b0:400c:c05::22d]:32809)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1a9A5B-0008TX-Ov
	for qemu-arm@nongnu.org; Wed, 16 Dec 2015 06:17:21 -0500
Received: by mail-vk0-x22d.google.com with SMTP id a188so24259551vkc.0
	for <qemu-arm@nongnu.org>; Wed, 16 Dec 2015 03:17:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=y27+NPj9iyaaMgT5AshyaIdNeR2JfpVzIaTcbhFw+NQ=;
	b=gPDtqfv23LOipG/YymGvJTvyCxG8vLgvZ8icCp/Wl9cK5wKlRisjvV0JiMFJnWxarP
	sKSyDE7qZaFDiiEP+8jWfFlSwM5KCU/kd1cJdqyavkozeA9T9wuG/2RGOuRcoFRdaVLB
	Cw5KmblSJ0WsfcWQNLcC2kwpJVK5WLf+snZi4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=y27+NPj9iyaaMgT5AshyaIdNeR2JfpVzIaTcbhFw+NQ=;
	b=Y9Rmc43gywIXUlReEgoEg8uv00UYZn0jbpkFexIeleTGUOABWHM1HikFEOguyVL7Mq
	j5h2d1Z5p0ji3zc6Az0sJD/LT4eFqyXyoYrOhGsULORDDe8HoDomlUU3xyqLXyGNR/qd
	F0E8muhBy4l1Gb+5GZO9oM+XqiDltIpZgQ5s92neEdmXJqIzEZMGgHkIT7fOQkk2EZSJ
	2bDhhr1eMLqQt4y6wMWF6XJeUInbmT1TkzZxYlyxz91KG+H6za0eL1aXlpxVqcDvYkJj
	3zvDLsdsTLFMb1Z2jmgo0jQ8mexxhM4G0jkfuNlbltT1cMSVSP+oglizo90Xow7f8Yir
	5UQQ==
X-Gm-Message-State: ALoCoQld/AZ30XNtoy9+bIBpWHgIVnCeAfLl+FkjNk5iRPfAjJDA9AZWm5vjIxIRqX19RnrwZAzZLPeUfkFkkMhydjrnyrcpe8G6+1qUb+n3qhc9yXrrjFk=
X-Received: by 10.31.194.21 with SMTP id s21mr31243360vkf.92.1450264641286;
	Wed, 16 Dec 2015 03:17:21 -0800 (PST)
MIME-Version: 1.0
Received: by 10.31.153.15 with HTTP; Wed, 16 Dec 2015 03:17:01 -0800 (PST)
In-Reply-To: <87bn9q4z57.fsf@blackfin.pond.sub.org>
References: <1449764955-10741-1-git-send-email-armbru@redhat.com>
	<1449764955-10741-2-git-send-email-armbru@redhat.com>
	<20151214165537.GB3774@thinpad.lan.raisama.net>
	<87h9jkltn3.fsf@blackfin.pond.sub.org>
	<CAFEAcA-2JmYmb4mvXb=LPwN=-RzT4nBV91gDAMyJ1wK1q1YcMQ@mail.gmail.com>
	<87bn9q4z57.fsf@blackfin.pond.sub.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 16 Dec 2015 11:17:01 +0000
Message-ID: <CAFEAcA_YnHnFKoKphK-DgsYd2TKkAC9ySQihCdzx5azbcTM+hw@mail.gmail.com>
To: Markus Armbruster <armbru@redhat.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c05::22d
Cc: QEMU Developers <qemu-devel@nongnu.org>,
	Paolo Bonzini <pbonzini@redhat.com>, qemu-arm <qemu-arm@nongnu.org>,
	Eduardo Habkost <ehabkost@redhat.com>,
	"Michael S. Tsirkin" <mst@redhat.com>
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v2 1/2] Use error_fatal to
 simplify obvious fatal errors
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
X-TUID: RyrWyxieOqId

On 16 December 2015 at 07:43, Markus Armbruster <armbru@redhat.com> wrote:
> Peter Maydell <peter.maydell@linaro.org> writes:
>> Do you mean by this that you're planning to send a v3, or would you
>> like me to apply v2 to target-arm.next?
>
> I only changed PATCH 1's commit message since v2 (current version
> appended).  I plan to include the series in a pull request in my role as
> error reporting maintainer, but I don't mind "losing" patches to other
> maintainers on the way.

OK, I'm happy to let you take it via your tree.

thanks
-- PMM
