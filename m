Received: by 2002:adf:fd4f:0:0:0:0:0 with SMTP id h15csp698650wrs;
        Tue, 12 Mar 2019 09:50:15 -0700 (PDT)
X-Google-Smtp-Source: APXvYqyGXUl9r7O6F9vHhs4smexEb4RUlIWRDHPkr3klTb1J5Q/XFhprOyVUEvrU4Jd5pJoqNt7b
X-Received: by 2002:a0d:dfc2:: with SMTP id i185mr7212440ywe.11.1552409415492;
        Tue, 12 Mar 2019 09:50:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1552409415; cv=none;
        d=google.com; s=arc-20160816;
        b=WYfvSzgzP9ZhebSm4foKdDtoal1UKkNM8WkIH+oGWweJLpwyw1k6fu1hwPnwClFco6
         5Mk1+UVU7uOdWITSybP76otlirBvYMEB9wrJ/Pm/h0yQhVunl/hZ2rzIVdvCkD6ub5s+
         rfi9wymFl7mACNu/JeXV8YPr3psw8nWRJYNxTApnrn7wJn/PJo8s+3ZDU3sS+sb+Ovqa
         cxHNQ7X6bILKvM53ohlKM7frV4dn36JUlV2nbf3suOZL2/K3bSVoZebb3XuNW1YfMyIE
         Ti/XBYzcWoiZOeJt8bK/ROX94uwrQr2OKD1x/OXLVstveeAKOtHP+BbSFGmbg5kqv8iC
         vUgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:to:from:date;
        bh=k6lX1JndiZqBvCdynOAc6nUSL7yPwblqqe3yZDgs7RQ=;
        b=LUY4DQ/iSH7u8TuxtLlm2WAY+JLyseFZ/uKZZ53DKtU4VV3C8N40VU0x7HCBvKCO+z
         +BxQXSbDlF5ZPTJzXIz9GDWlQAMQy+ZUfdNE/Snlpz4ptC5hUk4jpeT133X7WYeo+uaI
         LBLIR1XgzlXK8gqjb5xZzW82QeaGU2QV6ULjbMYt65K7T7JweQ4S9piXsNVLyhzWzioB
         EtN9Pm+JAwzsfOubIpsmJwarSf3IyMKHgQGVz1xrMLKqQn7FuZTLmT2odzwL9gbryzE/
         1oYCsA8X490W3wIt175ifQmEL66Cz8wBKu1R08IzeRuRh1j2U7GjsJEaFuRq6sPaEs18
         1cpw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 15si5457076ybj.15.2019.03.12.09.50.15
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 12 Mar 2019 09:50:15 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:55742 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1h3kbW-0007c8-RV
	for alex.bennee@linaro.org; Tue, 12 Mar 2019 12:50:14 -0400
Received: from eggs.gnu.org ([209.51.188.92]:34111)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1h3jyf-0006Jo-36
	for qemu-arm@nongnu.org; Tue, 12 Mar 2019 12:10:06 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1h3jye-0006C0-0O
	for qemu-arm@nongnu.org; Tue, 12 Mar 2019 12:10:05 -0400
Received: from mx1.redhat.com ([209.132.183.28]:33100)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <imammedo@redhat.com>)
	id 1h3jyd-0006BN-NN; Tue, 12 Mar 2019 12:10:03 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 6149FCE60C;
	Tue, 12 Mar 2019 16:10:02 +0000 (UTC)
Received: from localhost (ovpn-204-44.brq.redhat.com [10.40.204.44])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 9F35E17AA7;
	Tue, 12 Mar 2019 16:10:00 +0000 (UTC)
Date: Tue, 12 Mar 2019 17:09:59 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: Heyi Guo <guoheyi@huawei.com>
Message-ID: <20190312170859.73f0de9d@redhat.com>
In-Reply-To: <1552098649-28341-1-git-send-email-guoheyi@huawei.com>
References: <1552098649-28341-1-git-send-email-guoheyi@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.25]);
	Tue, 12 Mar 2019 16:10:02 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v5 0/2] arm/acpi: simplify aml
 code and enable SHPC
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
	"Michael S. Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org,
	Shannon Zhao <shannon.zhaosl@gmail.com>, qemu-arm@nongnu.org,
	wanghaibin.wang@huawei.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ITEbsc/hkGeX

On Sat, 9 Mar 2019 10:30:47 +0800
Heyi Guo <guoheyi@huawei.com> wrote:

> After the introduction of generic PCIe root port and PCIe-PCI bridge, we will
> also have SHPC controller on ARM, and we don't support ACPI hot plug, so just
> enable SHPC native hot plug.

Peter,
 could you queue it via your tree?

> 
> Igor also spotted the store operation outside of bit and/or is not necessary, so
> simply the code at first.
> 
> v5:
> - Refine commit message of patch 1/2
> 
> v4:
> - Improve the code indention.
> 
> Cc: Shannon Zhao <shannon.zhaosl@gmail.com>
> Cc: Peter Maydell <peter.maydell@linaro.org>
> Cc: "Michael S. Tsirkin" <mst@redhat.com>
> Cc: Igor Mammedov <imammedo@redhat.com>
> 
> 
> 
> Heyi Guo (2):
>   hw/arm/acpi: simplify AML bit and/or statement
>   hw/arm/acpi: enable SHPC native hot plug
> 
>  hw/arm/virt-acpi-build.c | 21 +++++++++++++--------
>  1 file changed, 13 insertions(+), 8 deletions(-)
> 

