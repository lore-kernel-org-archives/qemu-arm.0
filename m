Received: by 10.182.158.201 with SMTP id ww9csp2560401obb;
        Tue, 15 Dec 2015 08:59:38 -0800 (PST)
X-Received: by 10.140.92.35 with SMTP id a32mr19091323qge.92.1450198778322;
        Tue, 15 Dec 2015 08:59:38 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id d90si1909340qge.52.2015.12.15.08.59.38
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 15 Dec 2015 08:59:38 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@linaro.org
Received: from localhost ([::1]:38086 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1a8sws-0005bU-4y
	for alex.bennee@linaro.org; Tue, 15 Dec 2015 11:59:38 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54941)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <shannon.zhao@linaro.org>) id 1a8swq-0005bG-Fu
	for qemu-arm@nongnu.org; Tue, 15 Dec 2015 11:59:37 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <shannon.zhao@linaro.org>) id 1a8swm-00073c-D7
	for qemu-arm@nongnu.org; Tue, 15 Dec 2015 11:59:36 -0500
Received: from mail-pa0-x22b.google.com ([2607:f8b0:400e:c03::22b]:35614)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <shannon.zhao@linaro.org>) id 1a8swm-00073I-7x
	for qemu-arm@nongnu.org; Tue, 15 Dec 2015 11:59:32 -0500
Received: by mail-pa0-x22b.google.com with SMTP id hk6so7613372pad.2
	for <qemu-arm@nongnu.org>; Tue, 15 Dec 2015 08:59:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=message-id:date:from:user-agent:mime-version:to:cc:subject
	:references:in-reply-to:content-type:content-transfer-encoding;
	bh=GVejnLDNpUWVVlow7iDDl3GCr0p54eGQLQs6N4QXtDg=;
	b=gzdkkEbOETBNrx1aChwK3FTweNER/o2+3dHtezlE0dFfg8iz0a34BRoFdKutObPi7T
	C5T34Y9rawMtg7zfHk8UDcvh9L5nLuiRr9guYrJUWr2DTdwnGtRQWBU+XOijHbUo9O33
	PA8PdzEpkPWFj9sdYtEntpQUlQTqQlLhe30Kc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:message-id:date:from:user-agent:mime-version:to
	:cc:subject:references:in-reply-to:content-type
	:content-transfer-encoding;
	bh=GVejnLDNpUWVVlow7iDDl3GCr0p54eGQLQs6N4QXtDg=;
	b=FKEsJAIkZs5K0BXLzRHAhom3UTJKIvJO+hBGhJYkKZhm7qa3MvIRIBSk4kpH4CRZtr
	c1M6k/qlJ3HHmbhpGK9A6b3wtWGZVGiwreGQZztStQDRwNpic1DCaZygSCXDTwiHL/XO
	qkt2vPD1PddArGcn4zCzynHxKbi6s47Vb4/GuqnYOgfpL1irAMfpd44I9rkgAnA//1Nu
	5MAXUy5xEjfVAn8yyTHTBgyrGNk2+TBtbshW0Ya8TKnmjv6R/nrFlW0A1i/Jj55IvoyK
	R5cFg+adEva0p5Ryd3BmCnrOAFkFbal9gjhh+bZDNN1ZCP92vEZV65xyT4Yx+jV2mrTm
	gJag==
X-Gm-Message-State: ALoCoQkE4dZT7PDSwdIXDkP8ZgH0r15WxJ7hhusZjod9M1Kug+kDV9L51Eki5zMo/YJZeR1quk189xXVUuGFpU4Zvw0Xbzdx3w==
X-Received: by 10.66.119.202 with SMTP id kw10mr56059718pab.49.1450198771617; 
	Tue, 15 Dec 2015 08:59:31 -0800 (PST)
Received: from [10.10.192.106] ([104.237.91.132])
	by smtp.googlemail.com with ESMTPSA id
	132sm3386497pfc.63.2015.12.15.08.59.26
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 15 Dec 2015 08:59:30 -0800 (PST)
Message-ID: <567046ED.6070806@linaro.org>
Date: Wed, 16 Dec 2015 00:59:25 +0800
From: Shannon Zhao <shannon.zhao@linaro.org>
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64;
	rv:31.0) Gecko/20100101 Thunderbird/31.7.0
MIME-Version: 1.0
To: Peter Maydell <peter.maydell@linaro.org>, 
	Shannon Zhao <zhaoshenglong@huawei.com>
References: <1449804086-3464-1-git-send-email-zhaoshenglong@huawei.com>
	<1449804086-3464-3-git-send-email-zhaoshenglong@huawei.com>
	<CAFEAcA9whO9dgSf+yXFxzBDQrz7a7=SBQ4eWh-9_=9arD+VAFA@mail.gmail.com>
In-Reply-To: <CAFEAcA9whO9dgSf+yXFxzBDQrz7a7=SBQ4eWh-9_=9arD+VAFA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400e:c03::22b
Cc: G Gregory <graeme.gregory@linaro.org>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	QEMU Developers <qemu-devel@nongnu.org>,
	"Huangpeng \(Peter\)" <peter.huangpeng@huawei.com>,
	qemu-arm <qemu-arm@nongnu.org>, Igor Mammedov <imammedo@redhat.com>
Subject: Re: [Qemu-arm] [PATCH v5 02/10] acpi: extend aml_interrupt() to
 support multiple irqs
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
X-TUID: g4DXexeSCLag



On 2015/12/16 0:55, Peter Maydell wrote:
> On 11 December 2015 at 03:21, Shannon Zhao<zhaoshenglong@huawei.com>  wrote:
>> >From: Igor Mammedov<imammedo@redhat.com>
>> >
>> >ASL Interrupt() macro translates to Extended Interrupt Descriptor
>> >which supports variable number of IRQs. It will be used for
>> >conversion of ASL code for pc/q35 machines that use it for
>> >returning several IRQs in _PSR object.
>> >
>> >Signed-off-by: Igor Mammedov<imammedo@redhat.com>
>> >Reviewed-by: Shannon Zhao<shannon.zhao@linaro.org>
> Shannon, this one needs your Signed-off-by too.
Signed-off-by: Shannon Zhao <shannon.zhao@linaro.org>

Thanks,
-- 
Shannon
