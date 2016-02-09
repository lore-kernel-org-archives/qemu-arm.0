Received: by 10.25.159.19 with SMTP id i19csp2021661lfe;
        Tue, 9 Feb 2016 09:07:52 -0800 (PST)
X-Received: by 10.140.92.111 with SMTP id a102mr42725178qge.92.1455037672692;
        Tue, 09 Feb 2016 09:07:52 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id n6si36563518qge.102.2016.02.09.09.07.52
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 09 Feb 2016 09:07:52 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@linaro.org
Received: from localhost ([::1]:58414 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aTBlY-00039n-67
	for alex.bennee@linaro.org; Tue, 09 Feb 2016 12:07:52 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44277)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1aTBlV-00039D-UP
	for qemu-arm@nongnu.org; Tue, 09 Feb 2016 12:07:50 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1aTBlV-0005Yd-00
	for qemu-arm@nongnu.org; Tue, 09 Feb 2016 12:07:49 -0500
Received: from mail-vk0-x229.google.com ([2607:f8b0:400c:c05::229]:36656)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1aTBlU-0005Y0-SN
	for qemu-arm@nongnu.org; Tue, 09 Feb 2016 12:07:48 -0500
Received: by mail-vk0-x229.google.com with SMTP id c3so74917260vkb.3
	for <qemu-arm@nongnu.org>; Tue, 09 Feb 2016 09:07:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:content-transfer-encoding;
	bh=5lRD6Dj2LlkGLjx3qVg3uKL6dYPRiB30oudW8Sl7vhs=;
	b=D59HwCQIdCENXAsKcuzirPCV2YV9WVcUXo3akFYXmuZveQEWJQblFWCv6csPgnZg+l
	eG5OkJZuqC2HkM1UYWIJ0cuM2UfDqTS2acK5Vv3WjceBuVkHlMHqXhoWJ6rBc+ht+5EO
	nbP4iIT0nqXBcg+EhWSPROZ/3sIuMCrZkSB38=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type:content-transfer-encoding;
	bh=5lRD6Dj2LlkGLjx3qVg3uKL6dYPRiB30oudW8Sl7vhs=;
	b=HBmScxxTqoa++LNCQsBmR/Rm3rIZF0ygj2o1aS0yfa5IhlIadc00H94xcxcDnVyok4
	B04t0Ehc4iZe4E6VmKsDosr2oES/gAohG89LGde3fopsAN0TzBKnElWeiqoG86XXuVjt
	s4YzowG3GX6nx5K9e7EKgBpKUdqars6UnM4c1UQ3vE7NYx13EvPDDZk7IbdKMkbCmGN5
	qHIzEzHmYPs9MaCvxWiqK/SF0oTbUagQUOOsmubOM31l3aFklanxrOuMDhjzITs31Ok1
	Wn+kE+SHgJom/dkAYmQpN0Dkcl3r2/js0HYRU5srGKhYu3/2nfHWURnwP3nLUIY9Y6TP
	CJQA==
X-Gm-Message-State: AG10YOSFAp5Q52lubI2+CW+tZuT8ZZGuN8sB10+0aAWIJKxVoqGleVKmVQJsOykssr/YDnBcKY5s70pGzfVOHoJF
X-Received: by 10.31.141.2 with SMTP id p2mr26625751vkd.37.1455037667316; Tue,
	09 Feb 2016 09:07:47 -0800 (PST)
MIME-Version: 1.0
Received: by 10.31.56.216 with HTTP; Tue, 9 Feb 2016 09:07:27 -0800 (PST)
In-Reply-To: <CAM2+HU6fgdyvcDnbvVV0RO_rkp_4rC8vfoiASO9r3c59-Op5Sw@mail.gmail.com>
References: <1454511578-24863-1-git-send-email-drjones@redhat.com>
	<CAM2+HU6fgdyvcDnbvVV0RO_rkp_4rC8vfoiASO9r3c59-Op5Sw@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 9 Feb 2016 17:07:27 +0000
Message-ID: <CAFEAcA94gN_O1shZ08rPv=w9tskrtetP02gkw_JYUh00PzUy9g@mail.gmail.com>
To: Shannon Zhao <shannon.zhao@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c05::229
Cc: Andrew Jones <drjones@redhat.com>,
	"qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Subject: Re: [Qemu-arm] [PATCH] hw/arm/virt: fix max-cpus check
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
X-TUID: gYFhJbovDEuk

On 5 February 2016 at 12:45, Shannon Zhao <shannon.zhao@linaro.org> wrote:
>
>
> 2016=E5=B9=B42=E6=9C=883=E6=97=A5=E6=98=9F=E6=9C=9F=E4=B8=89=EF=BC=8CAndr=
ew Jones <drjones@redhat.com> =E5=86=99=E9=81=93=EF=BC=9A
>>
>> mach-virt doesn't yet support hotplug, but command lines specifying
>> -smp <num>,maxcpus=3D<bigger-num> don't fail. Of course specifying
>> bigger-num as something bigger than the machine supports, e.g. > 8
>> on a gicv2 machine, should fail though. This fix also makes mach-
>> virt's max-cpus check truly consistent with the one in vl.c:main,
>> as the one there was already correctly checking max-cpus instead
>> of smp-cpus.
>>
>> Reported-by: Shannon Zhao <shannon.zhao@linaro.org>
>> Signed-off-by: Andrew Jones <drjones@redhat.com>
>
> Reviewed-by: Shannon Zhao <shannon.zhao@linaro.org>
>>



Applied to target-arm.next, thanks.

-- PMM
