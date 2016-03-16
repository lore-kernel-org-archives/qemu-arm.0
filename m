Received: by 10.25.208.211 with SMTP id h202csp1268410lfg;
        Wed, 16 Mar 2016 08:52:25 -0700 (PDT)
X-Received: by 10.129.119.10 with SMTP id s10mr2124284ywc.288.1458143545690;
        Wed, 16 Mar 2016 08:52:25 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id m64si1236624ybb.225.2016.03.16.08.52.25
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 16 Mar 2016 08:52:25 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@linaro.org
Received: from localhost ([::1]:57163 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1agDkH-00072U-7L
	for alex.bennee@linaro.org; Wed, 16 Mar 2016 11:52:25 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39761)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1agDk9-0006tM-FW
	for qemu-arm@nongnu.org; Wed, 16 Mar 2016 11:52:23 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1agDk8-0007u4-Ma
	for qemu-arm@nongnu.org; Wed, 16 Mar 2016 11:52:17 -0400
Received: from mail-vk0-x22a.google.com ([2607:f8b0:400c:c05::22a]:35353)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1agDk7-0007tn-F6
	for qemu-arm@nongnu.org; Wed, 16 Mar 2016 11:52:16 -0400
Received: by mail-vk0-x22a.google.com with SMTP id e6so67093174vkh.2
	for <qemu-arm@nongnu.org>; Wed, 16 Mar 2016 08:52:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=7wDxV+1PCmU5aunSRl4ug5nGlvd6FmQUge1NPc+Q2QM=;
	b=gB59pCNCbrgXvBUm1F+YiiFqzhaPai7lG8oewAKWkd8GQHxQOaYfmCObfXGv1hC6P4
	eIO0mWCnZjINOPwPlgmzYuetoTd4glNq36YdZAmjIStIMVLF+VuYuBiXMCIkt8CBaq++
	Qopl+91bFmcZoyvBn3xRxm/aJDJhHVDTYI2dE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=7wDxV+1PCmU5aunSRl4ug5nGlvd6FmQUge1NPc+Q2QM=;
	b=S/3Mb8q+URFJqNX4VVgg+C6do6bCySbiaZf0yYUX4oaLRNsakb9FFAQN9LzYuUiuiw
	GvxSxkejeGfEYlYCT7qS0b2AkELS2Dq52bjNtxtxQDbivjyTK7IKGsOHpkTcZsYZTLhw
	DrwYpoTKuyhkvW1qqoYBdQ7YfAbpLSGLbJUzSqX0iJKvXpwrlE9kF3GT0xkvy+ivC0HF
	Z9m97cKW41i91q8Y3DBtKQlJPDChjI737WswyCqZ+cNO/UlbIq7P0GCE3jv/JifxQy0a
	efs5H6wEYXOHGZelVtVQSh8mX5orT2+J9H+gjsxeF6o7Z9dLGp3H56cg5A9gAuSdeZKR
	lnXw==
X-Gm-Message-State: AD7BkJJkCVSHi6OJzaoSmmzukEig7wdp7s005qTKRL2NjguHlUXfggbeYN8p86nHq10b0Mcj/3t4O2xCthzCGrLr
X-Received: by 10.31.3.193 with SMTP id f62mr4817548vki.27.1458143534793; Wed,
	16 Mar 2016 08:52:14 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.216.1 with HTTP; Wed, 16 Mar 2016 08:51:55 -0700 (PDT)
In-Reply-To: <1458143333-25769-1-git-send-email-mst@redhat.com>
References: <1458143333-25769-1-git-send-email-mst@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 16 Mar 2016 15:51:55 +0000
Message-ID: <CAFEAcA-HhapRhF7vSudeLyy2nbo31VPpyJdLfyMseC5sNiy3PA@mail.gmail.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c05::22a
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
	Greg Bellows <greg.bellows@linaro.org>
Subject: Re: [Qemu-arm] [PATCH] arm: fix machine description
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
X-TUID: eJKwSeI/OvPn

On 16 March 2016 at 15:48, Michael S. Tsirkin <mst@redhat.com> wrote:
> Fix what is clearly a copy-and-paste bug.
>
> Fixes: c29196904b ("target-arm: Add virt class and machine types").
> Cc: Greg Bellows <greg.bellows@linaro.org>
> Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
> ---
>  hw/arm/virt.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> index 8c6c996..9cf94e9 100644
> --- a/hw/arm/virt.c
> +++ b/hw/arm/virt.c
> @@ -1382,7 +1382,7 @@ static void virt_class_init(ObjectClass *oc, void *data)
>  {
>      MachineClass *mc = MACHINE_CLASS(oc);
>
> -    mc->desc = "ARM Virtual Machine",
> +    mc->desc = "ARM Virtual Machine";
>      mc->init = machvirt_init;
>      /* Start max_cpus at the maximum QEMU supports. We'll further restrict
>       * it later in machvirt_init, where we have more information about the

Hi; this bug (not actually one with any visible ill effects) is fixed
in passing by Wei's "arm: virt: Add an abstract ARM virt machine type"
patch which I have queued in target-arm.next.

thanks
-- PMM
