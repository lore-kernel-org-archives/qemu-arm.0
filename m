Received: by 10.28.4.212 with SMTP id 203csp2070259wme;
        Thu, 3 May 2018 09:02:16 -0700 (PDT)
X-Google-Smtp-Source: AB8JxZp4mcQmbbxFcTREozbIUdw/1G22G/i0FHICho6S45+3+xIBblgwrjWZ9BcOz5VVWmxz9t6/
X-Received: by 2002:a0c:8a85:: with SMTP id 5-v6mr14652716qvv.208.1525363336839;
        Thu, 03 May 2018 09:02:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1525363336; cv=none;
        d=google.com; s=arc-20160816;
        b=uaNRKTTY6ZccJdrwHr1mj13GGXKYbkqRYiBljT4hmjP3bpJS8xBqZtrCZdWVyRQySN
         +b6pLdoeBxp2VRa9jrMw4m9WudAUnQ69ZFGyoEd2XMJ5AXNF8YYbBhcC6HZONS1gSpIK
         6h/ZzPZh+Rd01fPX/Yt4zAsI0trEmRd8+WN8DiKXvmzBoNbHeMdmQF50e7LCWyaQ5FRR
         5IEvhpJx16UTWclfNFfoD00Q33i3t+p0lPEe/r5Q49eCuMgo7vAJ3jxwZ/pPDGWZ+tTK
         k3Zj2wmdWGDojqvpCL6XAFNJJ1WCbjNsN2z87eU4kWlb+4rZydxKLi8zBcWnffzdePFE
         lD+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature
         :arc-authentication-results;
        bh=ys6NyNRWmN/COBYf92Jx3YkuVJXAjjThLg31vP5XANE=;
        b=UWN0p/Q/A2Evr/BLRJVvEuqCdNXHzdYeDcUzjR8uQqFtvyxqCLaBv/ZyZG3EsJ6IdL
         XfsDzQC5zC0oRZXOdwdPJVbnt6B9DAmvLC0Q7z/ePyNnfx/f+6Di+geHEFr3bwjeiJ5M
         SHD8XqzIiSckVA3xFqHe2n6VEm0z2deeXsTMEbofTm9oVJNC0xF2szOwWHCp7dDHuuib
         qFX4jOdMX/x6WdhGRFdZ5dSpPioMLCAFDiH1Yh7lqTHzsRE8EomGPALFkLdOue6Sa4OH
         86cLGmvhdegMqqmSFZVWOBToyQYjBxCLY2tS/QH3ogwaQbEJAH8aS+cfIpmAxCguf2tq
         Q+RQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=asXr223p;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id y190si6880802qke.194.2018.05.03.09.02.16
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 03 May 2018 09:02:16 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=asXr223p;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:57449 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fEGgS-0001or-Cx
	for alex.bennee@linaro.org; Thu, 03 May 2018 12:02:16 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54425)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1fEGe3-0000Ky-A7
	for qemu-devel@nongnu.org; Thu, 03 May 2018 11:59:48 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1fEGe2-0000Pe-JV
	for qemu-devel@nongnu.org; Thu, 03 May 2018 11:59:47 -0400
Received: from mail-lf0-x241.google.com ([2a00:1450:4010:c07::241]:46566)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <alistair23@gmail.com>)
	id 1fEGe2-0000PG-BK; Thu, 03 May 2018 11:59:46 -0400
Received: by mail-lf0-x241.google.com with SMTP id v85-v6so26708606lfa.13;
	Thu, 03 May 2018 08:59:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=ys6NyNRWmN/COBYf92Jx3YkuVJXAjjThLg31vP5XANE=;
	b=asXr223p219KV8ACzy/IrCLMwLKlEeKFKPPWPPcVwqVZxjgXNRj5takvJEaYTT8Fgb
	RnqGE7Aw457vJIiKO2aDY08ioU4n3ccjC4/HDsBdzGHIsZEMiCPL2XzIAYWm9iN8xDEg
	O//y3LI6aEjzec/rxOjPi3dLWZSGiUlAeIQkVHT3mxCu1hvxxeA91YNu4rjBzaZgdSHa
	7Xrg5rtOZ3DsU+LvDqZhx74mDLX1WFBlb/IOA9cxfcFwCp5F7GozaqMpi4R4fQvHJcve
	xYTopUqwowHh/PV6ymFHhXPSvGSm0UTuF38yDOxmyIb0OnMO+zEby6oHp+pckIoydPRS
	gOQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=ys6NyNRWmN/COBYf92Jx3YkuVJXAjjThLg31vP5XANE=;
	b=OqxaNcN2F2xl4iJ1Wlc0t54VYtMuZK0LBifOK8/uFNNTiLf93F+EOyyJVUuqY+Wv8d
	onhAazgO3mKUeJRpgVXpUJguMvsCD92yQ6SzJg0DBH6e28MEWpcyPZALqC7YN0iLlhmR
	sEBHL1H1AqLIF8sih8H5B0nWXYLrWDLRmfiu6+Em6vv/xZ/IkziIqZhwmlvLWWxoYFjV
	zaF7Qpjhbv120ZdnAryog6dbDWEHPiwZ9r/bSlcefpVxIZux+4WGgJ1O558zwd6CgHBK
	u7ckWWSfCc8P0/GPLGwXjcw340znA1PLUPk++Enmmzky2jvVq5PgxEKb7jHLGXUNaCJj
	q7/A==
X-Gm-Message-State: ALQs6tAFHMrSnOu5bH8zIx4wgGocDkO487xekithMSTgOIN4AOCqBysg
	eGTO7yvE9aDDXwuEmIUj+WOpajj1oSqoWVVrWkM=
X-Received: by 2002:a19:d14a:: with SMTP id
	i71-v6mr14295751lfg.1.1525363185097; 
	Thu, 03 May 2018 08:59:45 -0700 (PDT)
MIME-Version: 1.0
References: <20180503115620.10596-1-edgar.iglesias@gmail.com>
	<20180503115620.10596-3-edgar.iglesias@gmail.com>
In-Reply-To: <20180503115620.10596-3-edgar.iglesias@gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Thu, 03 May 2018 15:59:18 +0000
Message-ID: <CAKmqyKPYuyHS46XXgNLBZh146=h4mScBQAAdiSxR7HxnK2YDTA@mail.gmail.com>
To: Edgar Iglesias <edgar.iglesias@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4010:c07::241
Subject: Re: [Qemu-devel] [PATCH v1 2/2] xlnx-zynqmp: Swap Cortex-R5 for
 Cortex-R5F
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Edgar Iglesias <edgar.iglesias@xilinx.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Sai Pavan Boddu <sai.pavan.boddu@xilinx.com>,
	Francisco Iglesias <frasse.iglesias@gmail.com>,
	Alistair Francis <alistair@alistair23.me>,
	"qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
	KONRAD Frederic <frederic.konrad@adacore.com>,
	qemu-arm <qemu-arm@nongnu.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Oy7f7Cum3P5Y

On Thu, May 3, 2018 at 4:56 AM Edgar E. Iglesias <edgar.iglesias@gmail.com>
wrote:

> From: "Edgar E. Iglesias" <edgar.iglesias@xilinx.com>

> The ZynqMP has Cortex-R5Fs with the optional FPU enabled.

> Signed-off-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>   hw/arm/xlnx-zynqmp.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)

> diff --git a/hw/arm/xlnx-zynqmp.c b/hw/arm/xlnx-zynqmp.c
> index 505253e0d2..efeb53c732 100644
> --- a/hw/arm/xlnx-zynqmp.c
> +++ b/hw/arm/xlnx-zynqmp.c
> @@ -116,7 +116,7 @@ static void xlnx_zynqmp_create_rpu(XlnxZynqMPState
*s, const char *boot_cpu,
>           char *name;

>           object_initialize(&s->rpu_cpu[i], sizeof(s->rpu_cpu[i]),
> -                          "cortex-r5-" TYPE_ARM_CPU);
> +                          "cortex-r5f-" TYPE_ARM_CPU);
>           object_property_add_child(OBJECT(s), "rpu-cpu[*]",
>                                     OBJECT(&s->rpu_cpu[i]), &error_abort);

> --
> 2.14.1
