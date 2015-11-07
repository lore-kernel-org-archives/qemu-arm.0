Received: by 10.182.105.169 with SMTP id gn9csp331177obb;
        Sat, 7 Nov 2015 08:57:31 -0800 (PST)
X-Received: by 10.31.3.150 with SMTP id f22mr15835291vki.91.1446915451435;
        Sat, 07 Nov 2015 08:57:31 -0800 (PST)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id h200si5050987vkf.66.2015.11.07.08.57.31
        for <alex.bennee@linaro.org>
        (version=TLSv1 cipher=RC4-SHA bits=128/128);
        Sat, 07 Nov 2015 08:57:31 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@linaro_org.20150623.gappssmtp.com
Received: from localhost ([::1]:44528 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1Zv6nz-0004u5-5B
	for alex.bennee@linaro.org; Sat, 07 Nov 2015 11:57:31 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35890)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1Zv6nc-0004cw-98
	for qemu-devel@nongnu.org; Sat, 07 Nov 2015 11:57:09 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1Zv6nb-00018H-GC
	for qemu-devel@nongnu.org; Sat, 07 Nov 2015 11:57:08 -0500
Received: from mail-vk0-x231.google.com ([2607:f8b0:400c:c05::231]:34413)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1Zv6nb-000189-9v
	for qemu-devel@nongnu.org; Sat, 07 Nov 2015 11:57:07 -0500
Received: by vkgs66 with SMTP id s66so33752193vkg.1
	for <qemu-devel@nongnu.org>; Sat, 07 Nov 2015 08:57:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linaro_org.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=6xVrSMcHCHzHUwIJ4ihSfGcq+Lf8cXI387aEB2ixl+Y=;
	b=IbykSsPmgmrrwuRbfWpIBwoX86aKRyhh9CrJtUg6dtmwCbpHiH0yysTbvz0YFnwAdQ
	l6IC1tsBR6+Zao5caiUExD4nWH0kUgAw7irWHc1Bvhsq5kxDxFgnHIcUmY8G0llR4JaI
	QJp2HOlYRaH7bMbsial33fh4E1abiFRS7idZVI2OCKtnLQRF2dySHtjV27rKafMl3ui+
	M9VSrE/dpuKTT9np/fR6oF/bCLa35Gin54KAaZgLaAsun/psUuXg6NaULwPPp52nkWPI
	05oZ+3nsFQJcO4kCJaaVjU3PUWhhziWX1ieUFCX9sUtX6nDFrirXQruEnL6rbr8oT5I9
	RTvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=6xVrSMcHCHzHUwIJ4ihSfGcq+Lf8cXI387aEB2ixl+Y=;
	b=BQyMO/6CAy3MXnSin6JYBh1kd6XNoXubZofIPPPPTduW0Wo2vSuSqByZlkOztaD0gR
	/ZiBknJHflfRVNNUw6f2iY7qLmBlRLtUYEedDLrTYYWhi7kzigVeV+sMVdk5FSx3BZFZ
	iA2/MHX98o7N81KwdUYYVTfcn8pf74FuSvpBJnSaNeMd5oVcp5U0oZ93hZisj6Tlptyo
	OUAHp7ovWPZ+u1u7MrNlj4AE1WK5gkHR0Qe3YOf9fiLnm0yS1bPReZQkyh0OiL3yBu7H
	IixbFZxqznBM24Hn6EAMhjzeNP8+HA0dFGYzQt3K//3CZE27qQzvXn11XGN6PddVCI2n
	ghEA==
X-Gm-Message-State: ALoCoQn0IlgfVfOOyaBnwFQVmVBmIsw6y3+47QINzh69+VhbqENcwUWOGEOSSO7Kj6Loe35RgmTq
X-Received: by 10.31.161.146 with SMTP id k140mr21059537vke.90.1446915426441; 
	Sat, 07 Nov 2015 08:57:06 -0800 (PST)
MIME-Version: 1.0
Received: by 10.31.153.15 with HTTP; Sat, 7 Nov 2015 08:56:47 -0800 (PST)
In-Reply-To: <1446909925-12201-1-git-send-email-drjones@redhat.com>
References: <1446909925-12201-1-git-send-email-drjones@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sat, 7 Nov 2015 16:56:47 +0000
Message-ID: <CAFEAcA_Pk7_MourHFc-SLCQ-StTfc8ssZ_Kz6HahE5=9bxMHyA@mail.gmail.com>
To: Andrew Jones <drjones@redhat.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2607:f8b0:400c:c05::231
Cc: qemu-arm@nongnu.org, QEMU Developers <qemu-devel@nongnu.org>
Subject: Re: [Qemu-devel] [PATCH] hw/arm/virt: error_report cleanups
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: 10lCAs4DAAe2

On 7 November 2015 at 15:25, Andrew Jones <drjones@redhat.com> wrote:
> Signed-off-by: Andrew Jones <drjones@redhat.com>
> ---
>  hw/arm/virt.c | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
>
> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> index 77d9267599b7e..9c6792cea16f6 100644
> --- a/hw/arm/virt.c
> +++ b/hw/arm/virt.c
> @@ -941,8 +941,8 @@ static void machvirt_init(MachineState *machine)
>      if (!gic_version) {
>          gic_version = kvm_arm_vgic_probe();
>          if (!gic_version) {
> -            error_report("Unable to determine GIC version supported by host\n"
> -                         "Probably KVM acceleration is not supported\n");
> +            error_report("Unable to determine GIC version supported by host");
> +            error_printf("KVM acceleration is probably not supported\n");
>              exit(1);
>          }
>      }
> @@ -990,7 +990,7 @@ static void machvirt_init(MachineState *machine)
>          char *cpuopts = g_strdup(cpustr[1]);
>
>          if (!oc) {
> -            fprintf(stderr, "Unable to find CPU definition\n");
> +            error_report("Unable to find CPU definition");
>              exit(1);
>          }
>          cpuobj = object_new(object_class_get_name(oc));
> @@ -1126,8 +1126,8 @@ static void virt_set_gic_version(Object *obj, const char *value, Error **errp)
>      } else if (!strcmp(value, "host")) {
>          vms->gic_version = 0; /* Will probe later */
>      } else {
> -        error_report("Invalid gic-version option value\n"
> -                     "Allowed values are: 3, 2, host\n");
> +        error_report("Invalid gic-version option value");
> +        error_printf("Allowed gic-version values are: 3, 2, host\n");
>          exit(1);
>      }

Would it be better just to have a single error_report
for these without the newlines, eg

          error_report("Unable to determine GIC version supported by host. "
                       "KVM acceleration is probably not supported.");

?

thanks
-- PMM
