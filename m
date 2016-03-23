Received: by 10.25.208.211 with SMTP id h202csp391lfg;
        Wed, 23 Mar 2016 05:29:23 -0700 (PDT)
X-Received: by 10.141.6.9 with SMTP id i9mr3143087qhd.21.1458736118873;
        Wed, 23 Mar 2016 05:28:38 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id v39si1946445qge.105.2016.03.23.05.28.38
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 23 Mar 2016 05:28:38 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:43825 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aihtu-0007Su-8O
	for alex.bennee@linaro.org; Wed, 23 Mar 2016 08:28:38 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53354)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <serge.fdrv@gmail.com>) id 1aihts-0007Si-BU
	for qemu-arm@nongnu.org; Wed, 23 Mar 2016 08:28:37 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <serge.fdrv@gmail.com>) id 1aihtn-0002eR-Ci
	for qemu-arm@nongnu.org; Wed, 23 Mar 2016 08:28:36 -0400
Received: from mail-lb0-x22a.google.com ([2a00:1450:4010:c04::22a]:34572)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <serge.fdrv@gmail.com>)
	id 1aihtn-0002e8-5P; Wed, 23 Mar 2016 08:28:31 -0400
Received: by mail-lb0-x22a.google.com with SMTP id k12so8818719lbb.1;
	Wed, 23 Mar 2016 05:28:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:to:references:cc:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-transfer-encoding;
	bh=qggScmDWjsaceB/nOJhio5nEdtkgV/eI+KfMl1qT8Uk=;
	b=LiplJmNdrAJzSxSAfz/w0LBFW/pUd3+Ot9+CfvLWMwR+7BdLM1ceEXYpss2VE2ExDc
	nMdMmDrmY16ZwS9GV3GHzX7+lJNMfCTAb6aPL95D06MBtZgPHC0t5R77NlfkAaH22Y/6
	0d41EqJSJXbFD3pZNUq2cwbBC6NvImfcI0oTTYwXDIdqs3d+qdxhEDg0Avc2RDNVHZ41
	eoBdaINd9txFYfV6nbceklYXZdg/bRn/KBLHH7J5cUiQ/2enLDzO3w8+m7nPE1EFZsNb
	oHgoPf7qK5wD/QRT1FdHdPjMyZm2EbAaSehDlpw01qQMBiPSOjNTZzEFcX3asG7NAOVl
	bc+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:to:references:cc:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding;
	bh=qggScmDWjsaceB/nOJhio5nEdtkgV/eI+KfMl1qT8Uk=;
	b=Buvv9lqgiLkeAQ53HgqMGH79riQq9Hwm/L8MIQup0Bi+dG6uf6mQ2zAtrSMAS5pBHn
	6spz/dneshSWR/Wgfibnr8EbtojUIfJhfly5+Uinkw3WdURbksPRpE63m15Y03CvQjbp
	lDbeQ+mJxbKRQYhGyPXO8Snhh6GA64dyCJTy1klBOUY1Veh/jGxSDOoDrwBFIdH0TRG8
	zQv4SUTCMO3fnV7izQSCo0Bt8sq2ECHafHRaN8VGZOPyuh2n/ntg/0Hzggz4bXxmR+KZ
	2OFhwvL1N2juXPxeNMqNVIv5o9vWoGz8sk9jAi6DVXxjHLscZoC87uxy6zsPEIxex234
	HD2w==
X-Gm-Message-State: AD7BkJJUbMg+eSpJ9pVcy/hl/o6WcO9ZtQgJuIsaUr3mhnRb0t3bGkqaQrFwJITUF25fKg==
X-Received: by 10.112.14.39 with SMTP id m7mr1115841lbc.20.1458736110235;
	Wed, 23 Mar 2016 05:28:30 -0700 (PDT)
Received: from [192.168.0.65] (broadband-46-188-121-115.2com.net.
	[46.188.121.115])
	by smtp.gmail.com with ESMTPSA id s5sm375301lbr.12.2016.03.23.05.28.29
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 23 Mar 2016 05:28:29 -0700 (PDT)
To: Peter Xu <peterx@redhat.com>, qemu-devel@nongnu.org
References: <1458711153-15988-1-git-send-email-peterx@redhat.com>
	<1458711153-15988-4-git-send-email-peterx@redhat.com>
From: Sergey Fedorov <serge.fdrv@gmail.com>
Message-ID: <56F28BEC.2070008@gmail.com>
Date: Wed, 23 Mar 2016 15:28:28 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.6.0
MIME-Version: 1.0
In-Reply-To: <1458711153-15988-4-git-send-email-peterx@redhat.com>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2a00:1450:4010:c04::22a
Cc: peter.maydell@linaro.org, drjones@redhat.com, libvir-list@redhat.com,
	mdroth@linux.vnet.ibm.com, armbru@redhat.com,
	qemu-arm@nongnu.org, abologna@redhat.com
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v6 3/4] kvm: add
 kvm_support_device() helper function
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
X-TUID: KFA8jVVC+ByR

On 23/03/16 08:32, Peter Xu wrote:
> diff --git a/include/sysemu/kvm.h b/include/sysemu/kvm.h
> index 6695fa7..8738fa1 100644
> --- a/include/sysemu/kvm.h
> +++ b/include/sysemu/kvm.h
> @@ -306,6 +306,15 @@ void kvm_device_access(int fd, int group, uint64_t attr,
>   */
>  int kvm_create_device(KVMState *s, uint64_t type, bool test);
>  
> +/**
> + * kvm_support_device - probe whether KVM support specific device
> + *
> + * @vmfd: The fd handler for VM
> + * @type: type of device
> + *
> + * @return: true if supported, otherwise false.
> + */
> +bool kvm_support_device(int vmfd, uint64_t type);

Why don't name the function like 'kvm_device_supported' to better express its predicative nature?

Kind regards,
Sergey

