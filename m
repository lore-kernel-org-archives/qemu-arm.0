Received: by 2002:a5d:4c92:0:0:0:0:0 with SMTP id z18csp359221wrs;
        Sun, 10 Mar 2019 14:05:45 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzKcMqGFdlh5OxYxYN5Vnc5nikTUy7LmP9rU6Fgkac68mwKZ4Mmf9DWdEeW7ZcvHCuJxKGu
X-Received: by 2002:a25:2d0:: with SMTP id 199mr15671654ybc.494.1552251945050;
        Sun, 10 Mar 2019 14:05:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1552251945; cv=none;
        d=google.com; s=arc-20160816;
        b=x57ol13UpZ+GBX+TdN270SjkdTDd/cj2KC/YRb374X2sHx3uQxzDpczbumS4sBMbzD
         DCGqJSF7CR0F+t/M7rlxRqqxY4R0gI70BynKBY0zrftcbpo/JDWjBK5NxGYxdU6nu7aY
         VBKOa3SNUMDLqdNv7zPq0ry83Elf3iN9OIXkN98Stqg5uUZiX/78ndEOY9trJ14Bh/iK
         cchrtqihqQ3MOm1SwN+7y2QY7riQflPbEvmwCzARh+YGqVuHQb1GE26Yr6JVfAMbcwQy
         56371p9whQTZOJJAG+5sYBbX/LE4f/7uUg3Q54b2RdWKpK/YWFTMgyrvpHyawF7hckso
         e1hg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date;
        bh=qeCqjBRdTwopfC/etF2UfmGgxl5kAe8mMHAh7q/VqU0=;
        b=0TkOjUT50/mvalqhahtuyrNHEtle5/jGZv3Ppz5pjhOiWTKejWs5y1Ytf2PVTJAT3o
         kUwGCE9uYrqMlSUlDcpsmEH+GJAxDFGKkh7erjeCztdwqBAl04g/0FjdfcEU7r7jRea8
         CUkIVJ2s6iJVbTKyOrTYbblpC627KjYPQhG7g9YCNh4RZWk0L0t8Ah7Ul10xPElzisL/
         xB+0nbrTJmKDP2RueIccmw0mP7COO0Xj9tjbJeiVNprBvAGJxsoTeaARu0ABkeiZWL76
         fE+UsvA9speHOK6BoADfq3oJC56LJHLjSyf5KDpqwYB7h8nHAoyy+3vCweH6d4wmZrL+
         l78Q==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f68si2078242ywe.211.2019.03.10.14.05.44
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sun, 10 Mar 2019 14:05:45 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:51021 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1h35dg-00018L-Gn
	for alex.bennee@linaro.org; Sun, 10 Mar 2019 17:05:44 -0400
Received: from eggs.gnu.org ([209.51.188.92]:43932)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mst@redhat.com>) id 1h35cX-0008KC-LT
	for qemu-arm@nongnu.org; Sun, 10 Mar 2019 17:04:34 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mst@redhat.com>) id 1h35ML-0004Jo-KO
	for qemu-arm@nongnu.org; Sun, 10 Mar 2019 16:47:50 -0400
Received: from mail-qt1-f196.google.com ([209.85.160.196]:46376)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <mst@redhat.com>) id 1h35ML-0004JL-Di
	for qemu-arm@nongnu.org; Sun, 10 Mar 2019 16:47:49 -0400
Received: by mail-qt1-f196.google.com with SMTP id z25so2904960qti.13
	for <qemu-arm@nongnu.org>; Sun, 10 Mar 2019 13:47:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to;
	bh=qeCqjBRdTwopfC/etF2UfmGgxl5kAe8mMHAh7q/VqU0=;
	b=hX2tfMbIwoESFL96zYzt+G58RR7GzM1DL/u1yxIlO8g0BqJKV+o6sudgn3d1r3DxAL
	l3f0tYymVuJEGRal+m2F1CV/bK1gz2fwTWYBpqxxgPPywaGfDVMOcLvyjYOR+Ajlz43m
	wq9D/LILcREuCEyiyolqjZsnr74Z/oiN4OMfqIbw3zj8JwWfo7hzJSlGodeO9kboMNKs
	mF6Cf8hX8Vp8oBnKm1Qm4PuL0LWhCSE+EHEL0TCv+6uVeWJg+Si6SKMVXbfbeyGHNewQ
	eFbob0RQsY6TqsKFOzhv9h0gObFmxr6Q5k+4n+RbZIlSTiCyTJaNKV46ueeOmyqAcBdd
	Ne/Q==
X-Gm-Message-State: APjAAAXtoKjkxUXF5Pz9wiAlsvSg9NoIMqbaXnGEPTGw2M/gvGTwStJs
	R6I/ClbKrq4R12wlWkly5RGKFQ==
X-Received: by 2002:aed:3aaa:: with SMTP id o39mr23504954qte.109.1552250868533;
	Sun, 10 Mar 2019 13:47:48 -0700 (PDT)
Received: from redhat.com (pool-173-76-246-42.bstnma.fios.verizon.net.
	[173.76.246.42]) by smtp.gmail.com with ESMTPSA id
	x28sm1515023qta.76.2019.03.10.13.47.46
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Sun, 10 Mar 2019 13:47:47 -0700 (PDT)
Date: Sun, 10 Mar 2019 16:47:45 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Heyi Guo <guoheyi@huawei.com>
Message-ID: <20190310164736-mutt-send-email-mst@kernel.org>
References: <1552098649-28341-1-git-send-email-guoheyi@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1552098649-28341-1-git-send-email-guoheyi@huawei.com>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.160.196
Subject: Re: [Qemu-arm] [PATCH v5 0/2] arm/acpi: simplify aml code and
 enable SHPC
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org,
	Shannon Zhao <shannon.zhaosl@gmail.com>, qemu-arm@nongnu.org,
	Igor Mammedov <imammedo@redhat.com>, wanghaibin.wang@huawei.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 7ZKnQH6F0PU4

On Sat, Mar 09, 2019 at 10:30:47AM +0800, Heyi Guo wrote:
> After the introduction of generic PCIe root port and PCIe-PCI bridge, we will
> also have SHPC controller on ARM, and we don't support ACPI hot plug, so just
> enable SHPC native hot plug.
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


Reviewed-by: Michael S. Tsirkin <mst@redhat.com>

> 
> 
> Heyi Guo (2):
>   hw/arm/acpi: simplify AML bit and/or statement
>   hw/arm/acpi: enable SHPC native hot plug
> 
>  hw/arm/virt-acpi-build.c | 21 +++++++++++++--------
>  1 file changed, 13 insertions(+), 8 deletions(-)
> 
> -- 
> 1.8.3.1
