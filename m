Received: by 2002:a5d:4301:0:0:0:0:0 with SMTP id h1-v6csp787014wrq;
        Fri, 15 Jun 2018 05:26:56 -0700 (PDT)
X-Google-Smtp-Source: ADUXVKIYuhmVrzunvF69mGV6MsxZADPWsztrHnkafOTn0ZbnMxLoRrf8johtYOYuweMYBDUtnqRo
X-Received: by 2002:a37:9042:: with SMTP id s63-v6mr1094062qkd.30.1529065616413;
        Fri, 15 Jun 2018 05:26:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1529065616; cv=none;
        d=google.com; s=arc-20160816;
        b=qnHk2vKvEsqGMZ7H5vj7GcJmwL6izCoeJntX9AvZESatvvFWJVZp82ABy9Cf2l4kDD
         ys9cSN+cOznjYDYhwXhm/QT7HH7PLSuXWc0/xqxUZgrIEqez5HMs7CKKj+6Ag+SSICB9
         AJfpoR+IxmFXksAMayIv+65VX0Ck/Fr+GizTpOpVAkhJkH+D5VAAwrkzfOHTqXS/fYKx
         1oe5VN6JQrb1X3kkb5wO+BBwIy1mECQ+koxME3wNVD3KRMUy6Hdd4IuVIkiXuNHCALxH
         hn2jcJqsnyzhrkBAATYUDYq2l2vcPCRLBBcedq6tey57DDtridV21fJmDfdfULbbndcC
         dJXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=DMj/XZ2/DZMmwwbqlLlSoR6x9n2mqPVD1BZVyzhQI00=;
        b=loJKvCxNfa9YpfxAsLxivu6USz+XFYfIiBdmNLYwWm6WJGis1PK0nhL/Jafad3W5gm
         JdSWSjqScDHef4H5/yNv3znNcf1hIDVsOOGg2fckRLmfZDQQxJNrsPdZpOOVUhZjnXsy
         sR+2g9qk8A6vmUvQKH8TMyz6afKq+3wDy22I7UeY2FRuwzzpDOlbIjb3yHHWys0s/7LS
         FdGQEcpEQPL+jpMJBfZmzf6KN6a3xHyvzk5EyrPCIQLNcI3uXkNY/2ws+V+owlo9w+vB
         4VdphVDavjIy/nuqx+R1a2lacOW7zoX/MTwX+Cr+mDtP3lr7BWt41HqHWsBQqjxvT5kk
         PqGw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=XdWFYJdj;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id t3-v6si688876qvl.124.2018.06.15.05.26.56
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 15 Jun 2018 05:26:56 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=XdWFYJdj;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:46492 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fTnod-0002zo-Us
	for alex.bennee@linaro.org; Fri, 15 Jun 2018 08:26:55 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60617)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fTnoT-0002xA-Fm
	for qemu-arm@nongnu.org; Fri, 15 Jun 2018 08:26:46 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fTnoS-0003wQ-Fd
	for qemu-arm@nongnu.org; Fri, 15 Jun 2018 08:26:45 -0400
Received: from mail-oi0-x244.google.com ([2607:f8b0:4003:c06::244]:39954)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1fTnoS-0003wE-9l
	for qemu-arm@nongnu.org; Fri, 15 Jun 2018 08:26:44 -0400
Received: by mail-oi0-x244.google.com with SMTP id f79-v6so8620276oib.7
	for <qemu-arm@nongnu.org>; Fri, 15 Jun 2018 05:26:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=DMj/XZ2/DZMmwwbqlLlSoR6x9n2mqPVD1BZVyzhQI00=;
	b=XdWFYJdjw/5P1/8tN8JnR3z0bRBMLWXDVRDxJUIRYabJSiIwB/gkyOGlMddL0F8xhV
	BHFmjBObaPR+b5c8SHlnAB7Li7MxqYWFMLRY7V+f4aBLeLAyIBQy/Jf8T3i4vrNmb4WE
	Kp6d3dQX9QwwQ7i4VFXh2d0i6R57Wg3xgjucw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=DMj/XZ2/DZMmwwbqlLlSoR6x9n2mqPVD1BZVyzhQI00=;
	b=A8xShcfCouKURb3qTzFaX62P1YS1GgEwwc/qg1p8/OQEe/FFlPKKIPgz7CRBO7wA8n
	vZHV4IjNA8NJzaA9GhHV0EucZqnPbWZflQAEMAORehYQ0BfEPfEqtm6MkD1b/XeLy57H
	qHUUrCdpe7BS98/1L5fx0o9R5AS2//J77rQaCglVaq2pEMP/rHFoco12X7ZGn+T2lMcX
	xUmCERN2kImnMXjn9eBYio8dkqb8N8/7D9E9z+Gr7PMTQMH2Mau7dt3AaXeNsMXqyTeR
	Ojo1nuBArf2WqdmfuXv1YGwjxJMfFqix8luZgko49a4/48hAjsvr9EBf11bvN6fDTsjT
	+u/w==
X-Gm-Message-State: APt69E2XCO0tXVfWuTyytdvyE4uQPHZOvqgaowvar6LQhy7lY7Y020Wa
	xzlIPdTyPL2TVXwGr5GHPxnxAzgOm2au71qwI+Upew==
X-Received: by 2002:aca:4ad2:: with SMTP id
	x201-v6mr693226oia.11.1529065603606; 
	Fri, 15 Jun 2018 05:26:43 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:40d3:0:0:0:0:0 with HTTP; Fri, 15 Jun 2018 05:26:23
	-0700 (PDT)
In-Reply-To: <1528554193-27270-3-git-send-email-eric.auger@redhat.com>
References: <1528554193-27270-1-git-send-email-eric.auger@redhat.com>
	<1528554193-27270-3-git-send-email-eric.auger@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 15 Jun 2018 13:26:23 +0100
Message-ID: <CAFEAcA_R_68FDq-=1coazcTpc1MGqh2ZanccP8C=C9ZJ9_T_6Q@mail.gmail.com>
To: Eric Auger <eric.auger@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c06::244
Subject: Re: [Qemu-arm] [PATCH 2/2] hw/arm/virt: Silence dtc /memory warning
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
	Eric Auger <eric.auger.pro@gmail.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 0Kd2d1ONyI4d

On 9 June 2018 at 15:23, Eric Auger <eric.auger@redhat.com> wrote:
> When running dtc on the guest /proc/device-tree we get the
> following warning: Warning (unit_address_vs_reg): Node /memory
> has a reg or ranges property, but no unit name".
>
> Let's fix that by adding the unit address to the node name. We also
> don't create the /memory node anymore in create_fdt(). We directly
> create it in load_dtb. /chosen still needs to be created in create_fdt
> as the uart needs it. In case the user provided his own dtb, either
> the bank is added to the existing /memory node or if this latter is
> not found we create a new separate memory node.
>
> Signed-off-by: Eric Auger <eric.auger@redhat.com>
> ---
>  hw/arm/boot.c | 20 ++++++++++++++------
>  hw/arm/virt.c |  6 ------
>  2 files changed, 14 insertions(+), 12 deletions(-)
>
> diff --git a/hw/arm/boot.c b/hw/arm/boot.c
> index 1e2be20..2054670 100644
> --- a/hw/arm/boot.c
> +++ b/hw/arm/boot.c
> @@ -593,24 +593,32 @@ static int load_dtb(hwaddr addr, const struct arm_boot_info *binfo,
>              g_free(nodename);
>          }
>      } else {

I think you need also to change the "if" half of this if..else,
which deals with NUMA, because it assumes a "/memory" node was
created by the virt.c code and now it will not be.

> +        char *nodename = g_strdup("/memory");
>          Error *err = NULL;
>
> -        rc = fdt_path_offset(fdt, "/memory");
> +        /* If there is an existing /memory node (user provided dtb), we add the
> +         * new bank into it, otherwise we create a /memory@addr node
> +         */
> +        rc = fdt_path_offset(fdt, nodename);

If we create /memory@addr nodes then we should also look for them in
an input dtb, I think. Otherwise we'll break the usecase where the
user asks QEMU to dump the generated dtb to a file, edits it and
then passes it back to a subsequent QEMU invocation, because we won't
find the memory node we created.

thanks
-- PMM
