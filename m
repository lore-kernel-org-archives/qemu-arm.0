Received: by 10.25.208.211 with SMTP id h202csp501254lfg;
        Thu, 24 Mar 2016 02:15:02 -0700 (PDT)
X-Received: by 10.140.144.132 with SMTP id 126mr9422406qhq.102.1458810901959;
        Thu, 24 Mar 2016 02:15:01 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id c8si5764548qkb.35.2016.03.24.02.15.01
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 24 Mar 2016 02:15:01 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:48756 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aj1M5-0006wM-F1
	for alex.bennee@linaro.org; Thu, 24 Mar 2016 05:15:01 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60637)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <serge.fdrv@gmail.com>) id 1aj1Lz-0006w7-Gx
	for qemu-arm@nongnu.org; Thu, 24 Mar 2016 05:14:59 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <serge.fdrv@gmail.com>) id 1aj1Lu-0003zT-GI
	for qemu-arm@nongnu.org; Thu, 24 Mar 2016 05:14:55 -0400
Received: from mail-lb0-x234.google.com ([2a00:1450:4010:c04::234]:34467)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <serge.fdrv@gmail.com>)
	id 1aj1Lu-0003zO-7U; Thu, 24 Mar 2016 05:14:50 -0400
Received: by mail-lb0-x234.google.com with SMTP id k12so26262826lbb.1;
	Thu, 24 Mar 2016 02:14:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:to:references:cc:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-transfer-encoding;
	bh=GwQNS3w8HapxYkGvHDHLO1Qi7rIQGovH39qyEl0qr4A=;
	b=f9RwatFCLhW6P5PdP4ROpoXVFRc6f9fojv5kZopav2rD7Vr4SCn9vUqK+g3kV7WQ3x
	fsqqesf/eZNrM8/i6YkpRtJTfXPrs64BHNjoSWUKe73GwSISmLKcCvZ4L0Wtmw/4Kc3y
	XC8N3aMd8vOcVLKoh5+/CS/F95ymls01BQPSimof0IgsGspHErIRakyROMc8b6bIZCa6
	iXCZe/HpdgF7F49p3t1/EYy2jdsxHt35fVuAZDFW/vPmnIUC/Y6tzdWjN2GyaU/+GJ/L
	KyxHZzQia93DmPtr2rVTQ/b7dO1cw44I/YK5avTeaUGxlorHoDeIncOQa/hIi7pebJzA
	KxQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:to:references:cc:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding;
	bh=GwQNS3w8HapxYkGvHDHLO1Qi7rIQGovH39qyEl0qr4A=;
	b=cXVlYVw4L+dAe8NudJUziYqnulrBhIWjkfjmlkUD4n8TBCenJtAFJpH90gddhcQvNm
	lizalvo/0D7XabjAqz7SzoqVN+Jy2NxArBdJsGfxGOLw3kkciLCqO6wRjpp9s3Zp+l7j
	JmsnJy6rFe1fj1VbSAZm1qETujGsl28MWw1S770kZg/4WSt0dUk3n4UrgW4PNLVmq9h8
	RoRJmBBRFa8YrypcyfyjL0Eh+plgMaX3JUxI7VWA6zk5qT30DVuqG1oXcmzxQrvKBlPq
	5IGz8vKgSK2EekEVFkduuUNJF8JKUe6CmFr/dCocvKgdItbyix+RLSuUUG67LSQpYfhk
	GkWg==
X-Gm-Message-State: AD7BkJK5Y+5EZxrV3JRBExlDNnsPi3ZjGeZRiYKcX8Elo/5/pXWbcDDNHId6DqZLbgX46w==
X-Received: by 10.112.16.133 with SMTP id g5mr2463909lbd.134.1458810889494;
	Thu, 24 Mar 2016 02:14:49 -0700 (PDT)
Received: from [192.168.0.56] ([195.91.132.170])
	by smtp.gmail.com with ESMTPSA id
	m65sm1030098lfm.13.2016.03.24.02.14.48
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 24 Mar 2016 02:14:48 -0700 (PDT)
To: Peter Xu <peterx@redhat.com>, qemu-devel@nongnu.org
References: <1458788142-17509-1-git-send-email-peterx@redhat.com>
	<1458788142-17509-4-git-send-email-peterx@redhat.com>
From: Sergey Fedorov <serge.fdrv@gmail.com>
Message-ID: <56F3B008.7050207@gmail.com>
Date: Thu, 24 Mar 2016 12:14:48 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.6.0
MIME-Version: 1.0
In-Reply-To: <1458788142-17509-4-git-send-email-peterx@redhat.com>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2a00:1450:4010:c04::234
Cc: peter.maydell@linaro.org, drjones@redhat.com, mdroth@linux.vnet.ibm.com,
	libvir-list@redhat.com, armbru@redhat.com, abologna@redhat.com,
	qemu-arm@nongnu.org, eblake@redhat.com, christoffer.dall@linaro.org
Subject: Re: [Qemu-arm] [PATCH v7 3/4] kvm: add kvm_device_supported()
	helper function
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
X-TUID: bVCjI3Z4ULr3

On 24/03/16 05:55, Peter Xu wrote:
> This can be used when probing whether KVM support specific device. Here,
> a raw vmfd is used.
>
> Signed-off-by: Peter Xu <peterx@redhat.com>

Acked-by: Sergey Fedorov <serge.fdrv@gmail.com>

Kind regards,
Sergey


> ---
>  include/sysemu/kvm.h |  9 +++++++++
>  kvm-all.c            | 15 +++++++++++++++
>  2 files changed, 24 insertions(+)
>
> diff --git a/include/sysemu/kvm.h b/include/sysemu/kvm.h
> index 6695fa7..0e18f15 100644
> --- a/include/sysemu/kvm.h
> +++ b/include/sysemu/kvm.h
> @@ -306,6 +306,15 @@ void kvm_device_access(int fd, int group, uint64_t attr,
>   */
>  int kvm_create_device(KVMState *s, uint64_t type, bool test);
>  
> +/**
> + * kvm_device_supported - probe whether KVM supports specific device
> + *
> + * @vmfd: The fd handler for VM
> + * @type: type of device
> + *
> + * @return: true if supported, otherwise false.
> + */
> +bool kvm_device_supported(int vmfd, uint64_t type);
>  
>  /* Arch specific hooks */
>  
> diff --git a/kvm-all.c b/kvm-all.c
> index 44c0464..e7b66df 100644
> --- a/kvm-all.c
> +++ b/kvm-all.c
> @@ -2339,6 +2339,21 @@ int kvm_create_device(KVMState *s, uint64_t type, bool test)
>      return test ? 0 : create_dev.fd;
>  }
>  
> +bool kvm_device_supported(int vmfd, uint64_t type)
> +{
> +    struct kvm_create_device create_dev = {
> +        .type = type,
> +        .fd = -1,
> +        .flags = KVM_CREATE_DEVICE_TEST,
> +    };
> +
> +    if (ioctl(vmfd, KVM_CHECK_EXTENSION, KVM_CAP_DEVICE_CTRL) <= 0) {
> +        return false;
> +    }
> +
> +    return (ioctl(vmfd, KVM_CREATE_DEVICE, &create_dev) >= 0);
> +}
> +
>  int kvm_set_one_reg(CPUState *cs, uint64_t id, void *source)
>  {
>      struct kvm_one_reg reg;

