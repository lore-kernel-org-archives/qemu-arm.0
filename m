Received: by 10.25.27.66 with SMTP id b63csp2063294lfb;
        Tue, 7 Jun 2016 08:17:37 -0700 (PDT)
X-Received: by 10.140.103.241 with SMTP id y104mr20799777qge.54.1465312657321;
        Tue, 07 Jun 2016 08:17:37 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id y9si14284241qkg.176.2016.06.07.08.17.37
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 07 Jun 2016 08:17:37 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:50903 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bAIl6-0008SA-NR
	for alex.bennee@linaro.org; Tue, 07 Jun 2016 11:17:36 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39268)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bAIl2-0008P1-9g
	for qemu-arm@nongnu.org; Tue, 07 Jun 2016 11:17:33 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bAIl0-0004dT-9a
	for qemu-arm@nongnu.org; Tue, 07 Jun 2016 11:17:31 -0400
Received: from mail-vk0-x230.google.com ([2607:f8b0:400c:c05::230]:33900)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bAIkz-0004d4-2B
	for qemu-arm@nongnu.org; Tue, 07 Jun 2016 11:17:30 -0400
Received: by mail-vk0-x230.google.com with SMTP id e4so110728892vkb.1
	for <qemu-arm@nongnu.org>; Tue, 07 Jun 2016 08:17:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=+vTfeswMvTXVyOUoZPt4anhnpctUT1EK5jr15QzqE1o=;
	b=fepTZZ874siK0+tcZ1edO7Ikr+9jfbv1xPD3OFVb2Dv4gfXSozYCktMTZdvv4UUsAF
	h5IZ4nxnxQAAoNxzBh3hyetlxDhTat0aWzgoss94HyZ4wk9aiyN9e4b4n2QrI7CuWoH3
	L6YZHp16Nbw+8ULF84o3ZDXGVRfN5mVe0Dzr0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=+vTfeswMvTXVyOUoZPt4anhnpctUT1EK5jr15QzqE1o=;
	b=ehnV2HtV7IEjTfdyzlN047oqvbWkLrIp5lMUbmFPIhgU+bLSpSJsh9P7z91TTZUX6g
	zDeRMj/WfT7ljmFrvsmVI7/+FiyT+d2dVAB4CXPbuJwwxmBSCN1OBqaIOkmYVqk4ADev
	7maNkbazUomuE80We1hzA7eA8dlH3bQm47+CkN357ZfNkqIso6vW/WBemmP2lbSvUKPd
	4WZvOeqb99k/4f5AmhsyExhKcqSH23Ncle2c444R2ys8rVQoD/NIe3mJeyKWay+L7fID
	nEjRSdsQSlX1VMx8LzRvpdkUkwz8crbmvn09H+GXDy2vj7nWxQA8hIF2VNB8WU8sL9G7
	nRDw==
X-Gm-Message-State: ALyK8tJcn/wfSpE7W4AodKbZpSEQLnbO3ZUWq6AB8oISA5PkhnD1Zo0ayrYgcUsaWK4354nb7q/492UpHmKfVeCb
X-Received: by 10.31.0.6 with SMTP id 6mr5215875vka.82.1465312648593; Tue, 07
	Jun 2016 08:17:28 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.67.65 with HTTP; Tue, 7 Jun 2016 08:17:09 -0700 (PDT)
In-Reply-To: <1457717778-17727-1-git-send-email-wei@redhat.com>
References: <1457717778-17727-1-git-send-email-wei@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 7 Jun 2016 16:17:09 +0100
Message-ID: <CAFEAcA_FU3LdJLWrYLcv0WAugiYfnOxfDFgs6oRFVRaUEs1L-g@mail.gmail.com>
To: Wei Huang <wei@redhat.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c05::230
Subject: Re: [Qemu-arm] [PATCH V1 0/2] Versioning ARM virt machine types
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
Cc: Andrew Jones <drjones@redhat.com>, qemu-arm <qemu-arm@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Andrea Bolognani <abologna@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: R78HEWqm8O7z

On 11 March 2016 at 17:36, Wei Huang <wei@redhat.com> wrote:
> We start to see more features been added to ARM virtual machine models.
> For the purpose of backward compatibility (e.g. migration), it is time
> to consider versioning machine types for ARM VMs. As a beginning step, this
> patchset defines an abstract machine type for ARM VMs. The current
> "virt" machine is re-written based on this new abstract type accordingly.
> These patches have been verified by booting existing VMs.
>
> RFC->V1:
>  * Rename the machine type to "virt-2.6", matching the imminent QEMU version
>  * Remove mc->is_default (Peter's comment)

So is there a plan to provide a virt-2.7 for the next release?

thanks
-- PMM
