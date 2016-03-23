Received: by 10.25.208.211 with SMTP id h202csp2449050lfg;
        Wed, 23 Mar 2016 05:24:56 -0700 (PDT)
X-Received: by 10.140.222.136 with SMTP id s130mr3194908qhb.62.1458735896871;
        Wed, 23 Mar 2016 05:24:56 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id b7si1953988qhd.42.2016.03.23.05.24.56
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 23 Mar 2016 05:24:56 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:43793 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aihqK-0005dk-BX
	for alex.bennee@linaro.org; Wed, 23 Mar 2016 08:24:56 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51171)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <serge.fdrv@gmail.com>) id 1aihpn-0004rd-Vb
	for qemu-arm@nongnu.org; Wed, 23 Mar 2016 08:24:27 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <serge.fdrv@gmail.com>) id 1aihpj-000154-0e
	for qemu-arm@nongnu.org; Wed, 23 Mar 2016 08:24:23 -0400
Received: from mail-lf0-x236.google.com ([2a00:1450:4010:c07::236]:36820)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <serge.fdrv@gmail.com>)
	id 1aihpi-000150-Nx; Wed, 23 Mar 2016 08:24:18 -0400
Received: by mail-lf0-x236.google.com with SMTP id d82so9760591lfe.3;
	Wed, 23 Mar 2016 05:24:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:to:references:cc:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-transfer-encoding;
	bh=8WnHHUhxk3Enxx7ruSLQGfGxf9nOxAJeS9FQRlcuwTs=;
	b=sIcCNxia9c8iUt4sRVvgTnkbCua3p/7KS91qClg0Rp6MyInmjvw8u/MDAvmWztdjIV
	maoNtEz/JTMauKlEzxpL5g8YOVZX7OJmgSp60wRBVub4tsx522I7HGbPUldkalzy9WL+
	awLj1BWA4gznBEOv2/FGE5HuG9p5THuwqYpHy/MFV/XMX2zuxtt2c4s5AI0dkdjPD0FT
	vkx1qvGHuPODP2jMIkiyv5wIKTNq0Z3KeviLLOueE7fhXOWKdUTAJj/WHPB8N6hzmxzj
	EALlZEeoXP6H1PbdCnrUXgRGZhPb+QB6+pPwfCg1JT8xNrlZdPS+oVaTFzMfIkhddGgM
	+suA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:to:references:cc:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding;
	bh=8WnHHUhxk3Enxx7ruSLQGfGxf9nOxAJeS9FQRlcuwTs=;
	b=PSNss9SurQgDpudb3uvx+AbvFAB6Ak7JHdIjkf1DIp9R1gCZLmSnqDC6dnkKwBQ1w+
	/NbTn2AH9Xc5T1c8+/vwObqX2m7JvWbDY2GP8WNBkB3FLGN60PAqRz/YZ9Rrz7xoVlE4
	BQuWNDoBX1MNDw0WyqRa4d2ulabNQ83za9l5Vlaod+T6Xp7UTTjHfIp4FTGg3qQxTTtC
	Tu8XgF3GiGGiWRdrwbvHpSFa0lbIR8hl3YGnttGroQya2+sPqILWDns2U6mTW6D6LZ6S
	sQ2NZzlAlBNn2mIZhnEovGnhnIRsQAkC7cuL1lhDaigS6r9AiKGYM/LF0eBqeVzrJC9i
	XUFw==
X-Gm-Message-State: AD7BkJInTesw3H0wElR/6wkCfFA0raqe+HDSfyll+lJVm1Oj36SWjVHepSgL34dyauZp+A==
X-Received: by 10.25.23.207 with SMTP id 76mr1081960lfx.9.1458735857891;
	Wed, 23 Mar 2016 05:24:17 -0700 (PDT)
Received: from [192.168.0.65] (broadband-46-188-121-115.2com.net.
	[46.188.121.115])
	by smtp.gmail.com with ESMTPSA id jb5sm377061lbc.8.2016.03.23.05.24.16
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 23 Mar 2016 05:24:16 -0700 (PDT)
To: Peter Xu <peterx@redhat.com>, qemu-devel@nongnu.org
References: <1458711153-15988-1-git-send-email-peterx@redhat.com>
	<1458711153-15988-3-git-send-email-peterx@redhat.com>
From: Sergey Fedorov <serge.fdrv@gmail.com>
Message-ID: <56F28AF0.8010506@gmail.com>
Date: Wed, 23 Mar 2016 15:24:16 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.6.0
MIME-Version: 1.0
In-Reply-To: <1458711153-15988-3-git-send-email-peterx@redhat.com>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2a00:1450:4010:c07::236
Cc: peter.maydell@linaro.org, drjones@redhat.com, libvir-list@redhat.com,
	armbru@redhat.com, mdroth@linux.vnet.ibm.com,
	abologna@redhat.com, qemu-arm@nongnu.org, eblake@redhat.com
Subject: Re: [Qemu-arm] [PATCH v6 2/4] arm: enhance
 kvm_arm_create_scratch_host_vcpu
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
X-TUID: bAvcWlSxm3CB

On 23/03/16 08:32, Peter Xu wrote:
> diff --git a/target-arm/kvm.c b/target-arm/kvm.c
> index 969ab0b..0a7f9a6 100644
> --- a/target-arm/kvm.c
> +++ b/target-arm/kvm.c
> @@ -62,13 +62,17 @@ bool kvm_arm_create_scratch_host_vcpu(const uint32_t *cpus_to_try,
>          goto err;
>      }
>  
> +    if (!init) {
> +        goto finish;
> +    }
> +
>      ret = ioctl(vmfd, KVM_ARM_PREFERRED_TARGET, init);
>      if (ret >= 0) {
>          ret = ioctl(cpufd, KVM_ARM_VCPU_INIT, init);
>          if (ret < 0) {
>              goto err;
>          }
> -    } else {
> +    } else if (cpus_to_try) {
>          /* Old kernel which doesn't know about the
>           * PREFERRED_TARGET ioctl: we know it will only support
>           * creating one kind of guest CPU which is its preferred
> @@ -85,8 +89,12 @@ bool kvm_arm_create_scratch_host_vcpu(const uint32_t *cpus_to_try,
>          if (ret < 0) {
>              goto err;
>          }
> +    } else {
> +        /* Not providing cpus_to_try, do nothing. */
> +        ;

I think it's probably not the best idea to skip CPU initialization here.
I'd rather raise an error in such case. If we supplied non-NULL init
argument then we need VCPU been initialized, don't we? If we pass NULL
as init then we actually skip this code.

Kind regards,
Sergey

>      }
>  
> +finish:
>      fdarray[0] = kvmfd;
>      fdarray[1] = vmfd;
>      fdarray[2] = cpufd;

