Received: by 10.25.27.66 with SMTP id b63csp463550lfb;
        Thu, 9 Jun 2016 11:38:51 -0700 (PDT)
X-Received: by 10.140.41.51 with SMTP id y48mr10811250qgy.58.1465497531378;
        Thu, 09 Jun 2016 11:38:51 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id t188si4093588qkc.209.2016.06.09.11.38.51
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 09 Jun 2016 11:38:51 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:36425 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bB4qw-0007p8-L5
	for alex.bennee@linaro.org; Thu, 09 Jun 2016 14:38:50 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49917)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bB4jG-00020C-8W
	for qemu-arm@nongnu.org; Thu, 09 Jun 2016 14:30:55 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bB4jE-0002nw-1I
	for qemu-arm@nongnu.org; Thu, 09 Jun 2016 14:30:53 -0400
Received: from mail-vk0-x22d.google.com ([2607:f8b0:400c:c05::22d]:36511)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bB4jD-0002nj-Su
	for qemu-arm@nongnu.org; Thu, 09 Jun 2016 14:30:51 -0400
Received: by mail-vk0-x22d.google.com with SMTP id g67so66941224vkb.3
	for <qemu-arm@nongnu.org>; Thu, 09 Jun 2016 11:30:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=ocrhN7qNXcqYLgvJE4lGNqTsfTixwyEiCcRiYnGr7KA=;
	b=Ta7Qo9oz6S9ox643RL7vZl5OUenosRRFdcOH6gPueIh4l+YaLdbth8+pveF+0NicAu
	j3wVVPZkzSukFVEuJxBKPgTtWCLEKha5OLp0+Yok1KeH+w9HRCN0fXBsAkDnfGZoPwdl
	hUcnXrN0+0HMyNubERRfco9zr32hFenehp3iE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=ocrhN7qNXcqYLgvJE4lGNqTsfTixwyEiCcRiYnGr7KA=;
	b=KfTYmRUrWK4dRu4K2YvvriwI6zZbbV0WjtmxaDs1pGAsCX2KNEQsokN5eJ9sb0Y95q
	SxGY7BMBKZXwCOm3trJPHztnT8Mk+iX1m4DQe/vN2iAXzyGki040dnyUAe9S5fu8+xlz
	9v66A5pkX+m1d3xSntls/b/Pp0TG27QzFRh6Zy5/ZU6q01MA1213Lmh44f4p++6bCpRq
	KY2xQCuT6waAptQzuq9nuf1UUW52rHKneV0y3TnPsBhWr/JzWNTC+FkSRwz6GUVm+o7V
	+/Sfn0DDF/esxh91VaZw8UAjFFNpcxvljtWrDdCKif6wQzOIejEmyYUxwq/qSywQtXBV
	J35A==
X-Gm-Message-State: ALyK8tJSR8OcI08VBC0tJwVmrVeW/NFZCJ+MwjRXJSBPO6qkCg6ShKE+mHaAf0Oq1Ax+HpGUFoN5ShUf+0zXi1fK
X-Received: by 10.176.0.238 with SMTP id 101mr4546619uaj.107.1465497051508;
	Thu, 09 Jun 2016 11:30:51 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.97.68 with HTTP; Thu, 9 Jun 2016 11:30:32 -0700 (PDT)
In-Reply-To: <1465410291-2971-5-git-send-email-drjones@redhat.com>
References: <1465410291-2971-1-git-send-email-drjones@redhat.com>
	<1465410291-2971-5-git-send-email-drjones@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 9 Jun 2016 19:30:32 +0100
Message-ID: <CAFEAcA-3G4RGMXZXP=A+yizi37fa9MWHokccHHaaKRpgw0vJww@mail.gmail.com>
To: Andrew Jones <drjones@redhat.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c05::22d
Subject: Re: [Qemu-arm] [PATCH 4/5] hw/arm/virt: introduce
 DEFINE_VIRT_MACHINE_AS_LATEST
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: gLFWhJwAU/pn

On 8 June 2016 at 19:24, Andrew Jones <drjones@redhat.com> wrote:
> Create two variants of DEFINE_VIRT_MACHINE. One, just called
> DEFINE_VIRT_MACHINE, that does not set properties that only
> the latest machine type should have, and another that does.
> This will hopefully reduce potential for errors when adding
> new versions.
>
> Signed-off-by: Andrew Jones <drjones@redhat.com>
> ---
>  hw/arm/virt.c | 15 +++++++++++----
>  1 file changed, 11 insertions(+), 4 deletions(-)
>
> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> index 9a3289d2c422c..017c244a46f41 100644
> --- a/hw/arm/virt.c
> +++ b/hw/arm/virt.c
> @@ -99,12 +99,16 @@ typedef struct {
>      OBJECT_CLASS_CHECK(VirtMachineClass, klass, TYPE_VIRT_MACHINE)
>
>
> -#define DEFINE_VIRT_MACHINE(major, minor) \
> +#define DEFINE_VIRT_MACHINE_LATEST(major, minor, latest) \
>      static void virt_##major##_##minor##_class_init(ObjectClass *oc, void *data) \
>      { \
>          MachineClass *mc = MACHINE_CLASS(oc); \
>          virt_machine_##major##_##minor##_options(mc); \
>          mc->desc = "QEMU " # major "." # minor " ARM Virtual Machine"; \
> +        if (latest) { \
> +            mc->alias = "virt"; \
> +            mc->is_default = 1; \
> +        } \

See previous patch comments about not wanting a default machine.

thanks
-- PMM
