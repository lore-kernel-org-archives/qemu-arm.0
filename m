Received: by 10.182.158.201 with SMTP id ww9csp2369117obb;
        Tue, 15 Dec 2015 03:39:10 -0800 (PST)
X-Received: by 10.140.39.21 with SMTP id u21mr49696097qgu.103.1450179550198;
        Tue, 15 Dec 2015 03:39:10 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id m8si809180qge.32.2015.12.15.03.39.10
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 15 Dec 2015 03:39:10 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@linaro.org
Received: from localhost ([::1]:36386 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1a8nwj-0007Kb-Vp
	for alex.bennee@linaro.org; Tue, 15 Dec 2015 06:39:09 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46982)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1a8nwi-0007Jv-HE
	for qemu-arm@nongnu.org; Tue, 15 Dec 2015 06:39:09 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1a8nwh-0005ZR-Km
	for qemu-arm@nongnu.org; Tue, 15 Dec 2015 06:39:08 -0500
Received: from mail-vk0-x236.google.com ([2607:f8b0:400c:c05::236]:34317)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1a8nwh-0005ZG-EA
	for qemu-arm@nongnu.org; Tue, 15 Dec 2015 06:39:07 -0500
Received: by mail-vk0-x236.google.com with SMTP id j66so3447080vkg.1
	for <qemu-arm@nongnu.org>; Tue, 15 Dec 2015 03:39:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=Le5xS0ITn7DKH32XiFGlEgkDLvV8KdiYZWuLR56UlFg=;
	b=HLDg/FHxiQZuQbuNOSQkhwloY75rSHUfnrakeCOJNQ/pV9dJbRMLwmMaied4e1i9Ru
	ylAXZdZUyw4gZoty+zrJ9Nzw3ihXDHz/5GJk+2QvsG9a1QLRhxL1eI8mxTgVU/+XTnqU
	egvVeRcJpWLQgRRVZjtJWbJyG4eXdDVzd846c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=Le5xS0ITn7DKH32XiFGlEgkDLvV8KdiYZWuLR56UlFg=;
	b=CpYvCtom/Li8PdVuGloY+dzUBTk1UdEg7+hWWpHB5OUJVpCEJIvNx/NzSLZX8NVwt4
	SE8iGu3VpumAsDUm5wsEr7/GqFyURUirQNCOac440/5p9+lQUX/x3Gxm9tZIERV1lN+b
	9V8jefk5fJ+wTaftR2QivddergeI7fL5Kh/EH0xsc/bH+vS16f4sFx7kJy6/CRrmjh/R
	96WRPxO4o0/piAo3rr0ISmWqE/5Ny5BZXvOGZZnw+YPNDrUlaUhPhXoqJYQV3n0GMs9K
	6T4fKhqNg8tdR+fdOXEKTSLBgeh1mq/WepcaSn3QLFVEK0fb7BZN28+1DAOvLS1j69rp
	OO5g==
X-Gm-Message-State: ALoCoQlVqP8SUbXO+q1aDWborxgJsrlKfzPGL1Y2eQe5gs5gKqnEwa+VKn2SXauNtMy+zxVNYoQSK3HS4ozKrLjwm/+FdTYJNdrgDRs8FRwNmBQoJt+LsVA=
X-Received: by 10.31.13.205 with SMTP id 196mr29128697vkn.37.1450179546736;
	Tue, 15 Dec 2015 03:39:06 -0800 (PST)
MIME-Version: 1.0
Received: by 10.31.153.15 with HTTP; Tue, 15 Dec 2015 03:38:47 -0800 (PST)
In-Reply-To: <1449743372-17169-7-git-send-email-armbru@redhat.com>
References: <1449743372-17169-1-git-send-email-armbru@redhat.com>
	<1449743372-17169-7-git-send-email-armbru@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 15 Dec 2015 11:38:47 +0000
Message-ID: <CAFEAcA9-7+2MOh8=c3+RsE8x2kkOwJzLapTAR+CpRtq=RP8SiQ@mail.gmail.com>
To: Markus Armbruster <armbru@redhat.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c05::236
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Subject: Re: [Qemu-arm] [PATCH 06/12] hw/arm/virt: Fix property
	"gic-version" error handling
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
X-TUID: hI/hrZAE4f3C

On 10 December 2015 at 10:29, Markus Armbruster <armbru@redhat.com> wrote:
> virt_set_gic_version() calls exit(1) when passed an invalid property
> value.  Property setters are not supposed to do that.  Screwed up in
> commit b92ad39.  Harmless, because the property belongs to a machine.
> Set an error object instead.
>
> Cc: Peter Maydell <peter.maydell@linaro.org>
> Cc: qemu-arm@nongnu.org
> Signed-off-by: Markus Armbruster <armbru@redhat.com>
> ---
>  hw/arm/virt.c | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
>
> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> index 9c6792c..2a120dd 100644
> --- a/hw/arm/virt.c
> +++ b/hw/arm/virt.c
> @@ -1126,9 +1126,8 @@ static void virt_set_gic_version(Object *obj, const char *value, Error **errp)
>      } else if (!strcmp(value, "host")) {
>          vms->gic_version = 0; /* Will probe later */
>      } else {
> -        error_report("Invalid gic-version option value");
> -        error_printf("Allowed gic-version values are: 3, 2, host\n");
> -        exit(1);
> +        error_setg(errp, "Invalid gic-version value");
> +        error_append_hint(errp, "Valid values are: 3, 2, host\n");
>      }

Should hint strings have trailing newlines?

Otherwise
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
