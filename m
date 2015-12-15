Received: by 10.182.158.201 with SMTP id ww9csp2559814obb;
        Tue, 15 Dec 2015 08:58:33 -0800 (PST)
X-Received: by 10.140.234.17 with SMTP id f17mr3941107qhc.19.1450198713413;
        Tue, 15 Dec 2015 08:58:33 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id a59si1908994qgf.42.2015.12.15.08.58.33
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 15 Dec 2015 08:58:33 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@linaro.org
Received: from localhost ([::1]:38080 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1a8svp-0004fd-4o
	for alex.bennee@linaro.org; Tue, 15 Dec 2015 11:58:33 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54499)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <shannon.zhao@linaro.org>) id 1a8svn-0004et-3J
	for qemu-arm@nongnu.org; Tue, 15 Dec 2015 11:58:32 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <shannon.zhao@linaro.org>) id 1a8svi-0006qH-KX
	for qemu-arm@nongnu.org; Tue, 15 Dec 2015 11:58:31 -0500
Received: from mail-pa0-x229.google.com ([2607:f8b0:400e:c03::229]:36639)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <shannon.zhao@linaro.org>) id 1a8svi-0006q1-FT
	for qemu-arm@nongnu.org; Tue, 15 Dec 2015 11:58:26 -0500
Received: by mail-pa0-x229.google.com with SMTP id dm15so7537575pac.3
	for <qemu-arm@nongnu.org>; Tue, 15 Dec 2015 08:58:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=message-id:date:from:user-agent:mime-version:to:cc:subject
	:references:in-reply-to:content-type:content-transfer-encoding;
	bh=llps/6NFeBaH+yqgfsjB55Uq10GzqKjy5ONUgFBP8RE=;
	b=FxexQ/gvKdBdAs/l/rLR6C4WQgc/yOY/uUExJFIiDfh2W8I34PgYjSWr/OSi8yVGPo
	FSk7aKnawJuhLB55P0d1t5JZYyFEh3MWFCWmhVrj0QLgSgw7IcwOuePMLLP2QX0Ssv8o
	enPgltNEnrXL22avolPBTmEe0AxhY0bLjST+o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:message-id:date:from:user-agent:mime-version:to
	:cc:subject:references:in-reply-to:content-type
	:content-transfer-encoding;
	bh=llps/6NFeBaH+yqgfsjB55Uq10GzqKjy5ONUgFBP8RE=;
	b=At7K+ouO8Hcfqh9p9HxYJACr1cn5M7t54zuM/BAlRo9T60M/LgWh/zqqUreYulY1P9
	SJQYAeOkEkpJoJHUPELUzBz0HGozrqRd71rmFOoLV/S25f7aHwzD2uP7FQjs23MNg9q1
	P3s9kZwPEpeK9u3GWT0nXcX1qUHWRIoSJklJ2Pkrcvdx9iR8rdMKIyNe85rQkIqlHnbJ
	eXpEO0eiz5As4aRsnG2tKxf+6tY/XqPhFHZndHo1aPggHDYc4nC6nauIuQDgE1QS9ayL
	VQ6LUXJBwiqwKQZL79qTLKqw7E/REbaBeLCaeQANF6oG/gBFnFBaqC+pf3jY3BIou3CZ
	cuKg==
X-Gm-Message-State: ALoCoQkIAvMRt5BXNE/mLIRRpDsvyDcpYsQr3jRdofmai9uSSju1hZl4SOM3USQtjx3XKPd+ujHA58TaDC/pDDgDabogsTfIgA==
X-Received: by 10.67.1.103 with SMTP id bf7mr55785857pad.147.1450198704973;
	Tue, 15 Dec 2015 08:58:24 -0800 (PST)
Received: from [10.10.192.106] ([104.237.91.132])
	by smtp.googlemail.com with ESMTPSA id
	u67sm3369664pfi.74.2015.12.15.08.58.20
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 15 Dec 2015 08:58:24 -0800 (PST)
Message-ID: <567046AB.1000106@linaro.org>
Date: Wed, 16 Dec 2015 00:58:19 +0800
From: Shannon Zhao <shannon.zhao@linaro.org>
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64;
	rv:31.0) Gecko/20100101 Thunderbird/31.7.0
MIME-Version: 1.0
To: Peter Maydell <peter.maydell@linaro.org>, 
	Shannon Zhao <zhaoshenglong@huawei.com>
References: <1449804086-3464-1-git-send-email-zhaoshenglong@huawei.com>
	<1449804086-3464-2-git-send-email-zhaoshenglong@huawei.com>
	<CAFEAcA9LE_eXQF-RfuQ1_qS7yO2kP9BBwR7rBkwVq8pRUZHS5w@mail.gmail.com>
In-Reply-To: <CAFEAcA9LE_eXQF-RfuQ1_qS7yO2kP9BBwR7rBkwVq8pRUZHS5w@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400e:c03::229
Cc: G Gregory <graeme.gregory@linaro.org>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	QEMU Developers <qemu-devel@nongnu.org>,
	"Huangpeng \(Peter\)" <peter.huangpeng@huawei.com>,
	qemu-arm <qemu-arm@nongnu.org>, Igor Mammedov <imammedo@redhat.com>
Subject: Re: [Qemu-arm] [PATCH v5 01/10] acpi: support serialized method
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
X-TUID: efOkmvCzW0mb



On 2015/12/16 0:54, Peter Maydell wrote:
> On 11 December 2015 at 03:21, Shannon Zhao<zhaoshenglong@huawei.com>  wrote:
>> >From: Xiao Guangrong<guangrong.xiao@linux.intel.com>
>> >
>> >Add serialized method support so that explicit Mutex can be
>> >avoided
>> >
>> >Signed-off-by: Xiao Guangrong<guangrong.xiao@linux.intel.com>
>> >Signed-off-by: Igor Mammedov<imammedo@redhat.com>
>> >Reviewed-by: Shannon Zhao<shannon.zhao@linaro.org>
> Shannon, this patch needs a Signed-off-by: line from you,
> since you're sending it to the list on behalf of somebody
> else. (You can just reply to this email to provide it,
> you don't need to resend the series.)
Sure. Thanks.
Signed-off-by: Shannon Zhao <shannon.zhao@linaro.org>

-- 
Shannon
