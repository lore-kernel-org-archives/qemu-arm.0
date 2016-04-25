Received: by 10.25.208.194 with SMTP id h185csp928739lfg;
        Mon, 25 Apr 2016 06:50:15 -0700 (PDT)
X-Received: by 10.55.74.9 with SMTP id x9mr38368706qka.81.1461592214919;
        Mon, 25 Apr 2016 06:50:14 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id k66si10776834qhc.64.2016.04.25.06.50.14
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 25 Apr 2016 06:50:14 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:60161 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1augtx-00016O-6q
	for alex.bennee@linaro.org; Mon, 25 Apr 2016 09:50:13 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33345)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <shannon.zhao@linaro.org>) id 1augtI-00087L-Qy
	for qemu-arm@nongnu.org; Mon, 25 Apr 2016 09:49:33 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <shannon.zhao@linaro.org>) id 1augtE-0007HV-5D
	for qemu-arm@nongnu.org; Mon, 25 Apr 2016 09:49:32 -0400
Received: from mail-pf0-x22e.google.com ([2607:f8b0:400e:c00::22e]:34148)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <shannon.zhao@linaro.org>) id 1augtD-0007HG-CC
	for qemu-arm@nongnu.org; Mon, 25 Apr 2016 09:49:27 -0400
Received: by mail-pf0-x22e.google.com with SMTP id y69so47024213pfb.1
	for <qemu-arm@nongnu.org>; Mon, 25 Apr 2016 06:49:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=subject:to:references:cc:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-transfer-encoding;
	bh=CS/M/EANvubZZUDMTy6w2VD5hB9bjmrRqxJRDLe3PIg=;
	b=RgaVPr96s1LI+M+97HpzJ9v/hJpNicf/L3BQs5TXdnuRKak7AJbjsZojJ5d//QHeUa
	1hKIa2v1INwdv0oFJXEqv80Q5Znc1KdipGH7Az9J+afdijLo88R6X/32CsX6skQUXEEG
	STpC4x1Dsyc3DZoXdXdRkE4rZPSzMILTQnClE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:to:references:cc:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding;
	bh=CS/M/EANvubZZUDMTy6w2VD5hB9bjmrRqxJRDLe3PIg=;
	b=fEdrAdEMu9bShnY+sUlel5F0YAUB0VM+OWZlXR6Gi/4KujCO6hEd8z6ijxd1aGSnbQ
	YgSsO+ycct+uj9laNLEpVMa3iXNtBMNfnfYjC5Zq6q1PYOS41XFsdO3z20RPPHsLf+aq
	8TVPCB0VLxHjd7qvIEOqyJeWSfd46lbMVbptT+eQKtw5D7MAQwxF9veAyCDMS7lOSkzv
	3VuCJ+Ot7AETummxOu9sVdyZqtj/OfuBTROdvGdCqAjh5zwBxXuOYePuCkRUb7rvh7XW
	+h1TZZQpjBiutZi1ZLSZVA5EhLsEMkqmh5XEbxzMQU9sn+U+23HH+RlrvtO+ZGsayIJo
	T+QA==
X-Gm-Message-State: AOPr4FX6LRbuZeWv/leKQSogaro1F68lMY8s1po4cJwvHtTVVWbbIksSM/kwkAsX+S5ZwiJH
X-Received: by 10.98.84.65 with SMTP id i62mr7871907pfb.97.1461592164779;
	Mon, 25 Apr 2016 06:49:24 -0700 (PDT)
Received: from [10.16.153.166] ([104.237.91.77])
	by smtp.gmail.com with ESMTPSA id
	kl14sm30336676pab.23.2016.04.25.06.49.20
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 25 Apr 2016 06:49:23 -0700 (PDT)
To: Andrew Jones <drjones@redhat.com>, Shannon Zhao <zhaoshenglong@huawei.com>
References: <1461568306-14624-1-git-send-email-zhaoshenglong@huawei.com>
	<1461568306-14624-4-git-send-email-zhaoshenglong@huawei.com>
	<20160425124232.zdjgvmwrykkrouas@hawk.localdomain>
From: Shannon Zhao <shannon.zhao@linaro.org>
Message-ID: <571E205E.3040508@linaro.org>
Date: Mon, 25 Apr 2016 21:49:18 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.5.1
MIME-Version: 1.0
In-Reply-To: <20160425124232.zdjgvmwrykkrouas@hawk.localdomain>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400e:c00::22e
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v3 3/3] hw/arm/virt-acpi-build:
 Add PMU IRQ number in ACPI table
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org, qemu-devel@nongnu.org,
	peter.huangpeng@huawei.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: nCTGLJ/sdjru

On 2016年04月25日 20:42, Andrew Jones wrote:
> On Mon, Apr 25, 2016 at 03:11:46PM +0800, Shannon Zhao wrote:
>> > From: Shannon Zhao <shannon.zhao@linaro.org>
>> > 
>> > Add PMU IRQ number in ACPI table, then we can use PMU in guest through
>> > ACPI.
>> > 
>> > Signed-off-by: Shannon Zhao <shannon.zhao@linaro.org>
>> > Reviewed-by: Andrew Jones <drjones@redhat.com>
>> > ---
>> >  hw/arm/virt-acpi-build.c | 3 +++
>> >  1 file changed, 3 insertions(+)
> Question: for testing of this, did you use
> https://lkml.org/lkml/2016/4/12/755 ?
Actually I didn't test PMU with ACPI since I didn't notice the patch
series you point out and it's very obvious for QEMU changes(adding irq
flag and irq number in GICC). I will have a test later.

Thanks,
-- 
Shannon
