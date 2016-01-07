Received: by 10.182.158.201 with SMTP id ww9csp521154obb;
        Thu, 7 Jan 2016 03:36:53 -0800 (PST)
X-Received: by 10.55.75.212 with SMTP id y203mr140989804qka.3.1452166612993;
        Thu, 07 Jan 2016 03:36:52 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id t17si35870604qhb.14.2016.01.07.03.36.52
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 07 Jan 2016 03:36:52 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@linaro.org
Received: from localhost ([::1]:57976 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aH8s8-000363-O9
	for alex.bennee@linaro.org; Thu, 07 Jan 2016 06:36:52 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35041)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1aH8s6-00035l-Vj
	for qemu-arm@nongnu.org; Thu, 07 Jan 2016 06:36:51 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1aH8s6-0000Md-3y
	for qemu-arm@nongnu.org; Thu, 07 Jan 2016 06:36:50 -0500
Received: from mail-vk0-x235.google.com ([2607:f8b0:400c:c05::235]:34617)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1aH8s5-0000MT-Mr
	for qemu-arm@nongnu.org; Thu, 07 Jan 2016 06:36:50 -0500
Received: by mail-vk0-x235.google.com with SMTP id a123so141176289vkh.1
	for <qemu-arm@nongnu.org>; Thu, 07 Jan 2016 03:36:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=ToqMzLAECF3PElvXnnG4/zCMgfA/8bJdoz0CRTXXsL8=;
	b=WJnrfsKzrBLMqpZPY3TJxOnulihYe93ayLQoK18Tgy6ITr68yQRwc2tuo53bzWkG2b
	J21/j2YE83ojYoXSRmPbKa2btKp/jhVn130f1CZpAUB4j3O2ttzgvVIYwKOdR2+zcX1j
	g9CXO0fWgGTjAWu+RAqqH8eqa5bxYpjR/i9k4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=ToqMzLAECF3PElvXnnG4/zCMgfA/8bJdoz0CRTXXsL8=;
	b=E/wqkzrZS0WAW06YHA/ORCCSMGtcChz09aHkOnBP3m4yGkas9AIlDD5DvhnzduO41p
	2siq7J4fAKoP4r/R5aCcxyJdGhJO3ZYYgW5dK7KJjrH1oH6raqnRTUADf/d44c5kudih
	VFVbLQXfaSOkzuJet+AbLuS3zgLajYQBXnVwIFz1U23TBjWj4YCElRh031qL/1G18VxP
	1XXFWhflxQ5RyO3D31NnrXcWm/ejnIO5gY7QeMFpiGjDFJ5AJlpAN2OtHG0JKXUgjAHu
	j8s0IV4G8SxhaZrmxqgqTnR3MAkD1k/CvljRMzLV3Oz1iGpASr/+/4mnLLd67yyZKhMQ
	ecUw==
X-Gm-Message-State: ALoCoQnpHAMmdaHzb5eBFBPKQoc3mfTo43kan4Azk0/b7XFCKGJX5zEkwlaLyW9dltg+DCZhgaTZIlwdTN8ccMdcQicdGkoZ0F5p5iw4vZMWlASPCmVjaks=
X-Received: by 10.31.107.138 with SMTP id k10mr68395046vki.27.1452166609308;
	Thu, 07 Jan 2016 03:36:49 -0800 (PST)
MIME-Version: 1.0
Received: by 10.31.153.15 with HTTP; Thu, 7 Jan 2016 03:36:29 -0800 (PST)
In-Reply-To: <20151219212751.GA4135@pcrost-box>
References: <cover.1449528242.git.jcd@tribudubois.net>
	<a38b80a60545b98302dccb09d8be01a9ae2aa828.1449528242.git.jcd@tribudubois.net>
	<20151219212751.GA4135@pcrost-box>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 7 Jan 2016 11:36:29 +0000
Message-ID: <CAFEAcA8w+LB1YNuzMBZSVgZNsvLvkvVr5mUhToy_74yfZNGUDQ@mail.gmail.com>
To: pcrost <crosthwaitepeter@gmail.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c05::235
Cc: QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
	Jean-Christophe Dubois <jcd@tribudubois.net>
Subject: Re: [Qemu-arm] [PATCH v6 5/5] i.MX: move i.MX31 CCM object to
	register array.
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
X-TUID: j78N8VmFZuNH

On 19 December 2015 at 21:27, pcrost <crosthwaitepeter@gmail.com> wrote:
> On Mon, Dec 07, 2015 at 11:53:42PM +0100, Jean-Christophe Dubois wrote:
>> With this i.MX25 and i.MX31 to have close implementation.
>>
>
> "will have closer implementations".
>
> Otherwise,
>
> Reviewed-by: Peter Crosthwaite <crosthwaite.peter@gmail.com>
>
> Peter, do you want to just amend the grammar in the queue?

Yes, I've just applied to target-arm.next with that tweak to
the commit message.

thanks
-- PMM
