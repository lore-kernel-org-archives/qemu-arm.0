Received: by 10.28.71.27 with SMTP id u27csp5391764wma;
        Tue, 27 Feb 2018 15:41:33 -0800 (PST)
X-Google-Smtp-Source: AH8x227A9OrEv4oNHfNJRZslb6WBMG3tOLiKPZ8ChILIXV8n56mW7ZWx//iPQjc0dkoucBD7ThVO
X-Received: by 10.129.119.2 with SMTP id s2mr10541159ywc.441.1519774893069;
        Tue, 27 Feb 2018 15:41:33 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1519774893; cv=none;
        d=google.com; s=arc-20160816;
        b=tuW6j43BD2g0a/WjlmEnOKAODjnxx2JJnomSO360LRyFNx4+qS4zXjgj47mtgvtF+D
         ScGSm5t11s6YNeJ7z3+Lu7HvSqubg5NtKqBr0mx3lGAhqlZ9HtuyrDCoP5H+uhbvDFVI
         pxcAW/NMSAvEn/CI4NuFX6O4mH0m7P1RGbMK9c1TJT73k9Qjqj4vj1pqd1edWki+LQp3
         d0tGIvvxWK9oMIr5u5Xph+JIZXORyznz9mie70vGkbtCe0e7/btjPYkF+QkGqHofAMRT
         mCkwX7zVLh+JC3jAypA4ayBvo05/xPnQMsUcdbFaQdeAf4EVS1S+gCzrjttLPIGsfvLe
         3OaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to
         :dkim-signature:arc-authentication-results;
        bh=TGDQiLL5Ufj1GFSRFFakER9gq/PbaCkEeZ9lOsvKRWI=;
        b=zbRiKUO6Cohy52bqMs2CWumszXv6032oseL+R3hqyw/IZXmOgDYuNgTazLXpqfPYby
         lGMMyERvUEc2dP+09GKmuctG6it546UkDrkYbHy2Z3M9Yw5clM7EJJC0LFyzXULln4w/
         Jpc2aTUe+vo1Is5bjAPtuJlKZGxku52XKcrwMW0WNh5rnjg0EXm4u0908n7V4G+BD4Bk
         KCBdSftUxetwIOTsenF7tAWGIt6OKq5vvftY5duLItO0jN7lmO+8ob940iHuwSYJ0qjO
         eDigbHQZ77bKRWU43epUVrQSQETOqHRHWZXomCprflrZ7s4sEfK1n3wAk4jP6yct/7YC
         J+xw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=enP68gGU;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id z63si55926ywb.158.2018.02.27.15.41.32
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 27 Feb 2018 15:41:33 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=enP68gGU;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:40705 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eqosG-0001iZ-I8
	for alex.bennee@linaro.org; Tue, 27 Feb 2018 18:41:32 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36320)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1eqos9-0001iR-W8
	for qemu-arm@nongnu.org; Tue, 27 Feb 2018 18:41:26 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1eqos9-0003w8-90
	for qemu-arm@nongnu.org; Tue, 27 Feb 2018 18:41:26 -0500
Received: from mail-wr0-x243.google.com ([2a00:1450:400c:c0c::243]:41872)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1eqos9-0003vI-2Y; Tue, 27 Feb 2018 18:41:25 -0500
Received: by mail-wr0-x243.google.com with SMTP id f14so517861wre.8;
	Tue, 27 Feb 2018 15:41:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:cc:references:from:openpgp:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=TGDQiLL5Ufj1GFSRFFakER9gq/PbaCkEeZ9lOsvKRWI=;
	b=enP68gGUmAvUeVTT0xC7UNM2JamOl526zEV/x9+t5sEzEpO3JDVRiWq7zxR8N1O8ZS
	RfUrm6JvAtTD1l1XkAPzwhZOIo5D3TxyjiHrm60tgC8x4SH3qNXBJz9ogukhcsal+vR6
	f9f2HbiAM8uaL1DXnamDeyZXFBiiKMGBt6u51TT8w4iomOByCHkEO/6iJH5Lnh6S3BCi
	+zwe+qR4Z3YDwvPgZx4xuMafPq35fDosxGMibKo/X+VBS3Mi5IcjshpGJd42DnFeODYi
	xeHSFspJjXfxhDl7jfzrCSvbC3ZIJ//GCoV0kiMHIG4UKAd6pOLFrHOzv7wAkdmcWbTv
	nt5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:cc:references:from:openpgp
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-language:content-transfer-encoding;
	bh=TGDQiLL5Ufj1GFSRFFakER9gq/PbaCkEeZ9lOsvKRWI=;
	b=C5VfcINTMUjQoqQTsV8OcENK/lXHQzj1DGfaZkt9eusGryfAtQOZEi3fjlb1A1pS7p
	o1OFue1Lam7UEHcisoWNryFir8XW/zo7RzdXD+TyW2eO9Mr9M3W1bepMiNqwTkknxut4
	AHNfkmQHNFwbIfTzSebrZQtzN3pWXcwCoDerXk2vxhlu5KvbO2jaNOE6kkJ31LNu+4vh
	r7q79GL4LvTblzC2Fk5yrVjzISG1XJzsfyqAhf2pr7yxQXgNuCAuduJfiyepH4D5GJtS
	yqYIpYhmWlFP2IbquFQmDE0/WjOv6SbQaAeXjFnuxaHMXJU4p5LjeYv7au/en3lKLWYv
	AEGw==
X-Gm-Message-State: APf1xPDB2nmoxoA/ru2QQWn6HZawCkxNIbBcZntBkW19n6P5fbaulr5M
	nt/sjYpGToPRFSIwjyuPAe0=
X-Received: by 10.223.128.67 with SMTP id 61mr15135765wrk.61.1519774884026;
	Tue, 27 Feb 2018 15:41:24 -0800 (PST)
Received: from ?IPv6:2a01:cb1d:8526:ac00:37c8:9a2b:1b7e:2ba7?
	([2a01:cb1d:8526:ac00:37c8:9a2b:1b7e:2ba7])
	by smtp.gmail.com with ESMTPSA id o2sm412620wro.31.2018.02.27.15.41.23
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 27 Feb 2018 15:41:23 -0800 (PST)
To: Igor Mammedov <imammedo@redhat.com>, qemu-devel@nongnu.org
References: <1519303376-92875-1-git-send-email-imammedo@redhat.com>
	<1519303376-92875-3-git-send-email-imammedo@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Openpgp: id=FAABE75E12917221DCFD6BB2E3E32C2CDEADC0DE;
	url=http://pgp.mit.edu/pks/lookup?op=get&search=0xE3E32C2CDEADC0DE
Message-ID: <04f6c23f-7ff0-6f72-279a-85e507c9e82b@amsat.org>
Date: Tue, 27 Feb 2018 20:41:22 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <1519303376-92875-3-git-send-email-imammedo@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c0c::243
Subject: Re: [Qemu-arm] [PATCH 2/9] pc: replace pm object initialization
 with one-liner in acpi_get_pm_info()
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Andrew Jones <drjones@redhat.com>,
	qemu-arm@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>,
	Shannon Zhao <zhaoshenglong@huawei.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: +MruwVPMLn5l

On 02/22/2018 09:42 AM, Igor Mammedov wrote:
> next patch will need it before it gets to piix4/lpc branches
> that initializes 'obj' now.
> 
> Signed-off-by: Igor Mammedov <imammedo@redhat.com>

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

> ---
>  hw/i386/acpi-build.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
> 
> diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
> index deb440f..b85fefe 100644
> --- a/hw/i386/acpi-build.c
> +++ b/hw/i386/acpi-build.c
> @@ -128,7 +128,7 @@ static void acpi_get_pm_info(AcpiPmInfo *pm)
>  {
>      Object *piix = piix4_pm_find();
>      Object *lpc = ich9_lpc_find();
> -    Object *obj = NULL;
> +    Object *obj = piix ? piix : lpc;
>      QObject *o;
>  
>      pm->force_rev1_fadt = false;
> @@ -138,7 +138,6 @@ static void acpi_get_pm_info(AcpiPmInfo *pm)
>      if (piix) {
>          /* w2k requires FADT(rev1) or it won't boot, keep PC compatible */
>          pm->force_rev1_fadt = true;
> -        obj = piix;
>          pm->cpu_hp_io_base = PIIX4_CPU_HOTPLUG_IO_BASE;
>          pm->pcihp_io_base =
>              object_property_get_uint(obj, ACPI_PCIHP_IO_BASE_PROP, NULL);
> @@ -146,7 +145,6 @@ static void acpi_get_pm_info(AcpiPmInfo *pm)
>              object_property_get_uint(obj, ACPI_PCIHP_IO_LEN_PROP, NULL);
>      }
>      if (lpc) {
> -        obj = lpc;
>          pm->cpu_hp_io_base = ICH9_CPU_HOTPLUG_IO_BASE;
>      }
>      assert(obj);
> 
