Received: by 2002:adf:ef42:0:0:0:0:0 with SMTP id c2csp2724063wrp;
        Thu, 26 Sep 2019 15:36:20 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzUDf1joYSxR1xGEjbw5nXAiu9LGLZ/p0HUY6EEuImURgkFG6y5CvGzDB56P45qz598Dlm3
X-Received: by 2002:aed:2ae6:: with SMTP id t93mr6722832qtd.384.1569537380681;
        Thu, 26 Sep 2019 15:36:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1569537380; cv=none;
        d=google.com; s=arc-20160816;
        b=V2RxHQKIPy3QX55+KHbVWT19aR1Jk+L9MvTK6FuLP1ak6V7DhoCD1qn08BluTHYGFZ
         +nOxeZ1IpIQSrJ/iNeFWBhNoQiEvOanAoo4CFxfd8SyAoQOm+pdlnXu6e7GUz7JyfmNM
         yFyPk83VT1FkG5bXvJm+FQfsm9CLux/LxMiGEFpgy+Qvsv1knIrg4PJ6kXYgEUeGurVU
         zQA88+6PenvLRqsHGpgNkXWmwdUaPkp8UMwR8ssy/67ke9pbd410CibppcZZ5M+eiEXZ
         31Kzf01qfWKbbS+UnZU7r3fvNH1F5v/NoU1IpTdOtWg/mapumpBwv29N722TB5j23peh
         +Bmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:references:to:from:subject:dkim-filter;
        bh=y3qIgRgr1iDUK/lHLiRLBnh0ftBRBW2RA3yOUC0xqys=;
        b=MA3/3p9haxGwefs89ps3E5n9ViR/PdI7LkDk757+aeG3PFALDY5NAPRAmM2OC6hERk
         SnoBhz1GGEWIZtOyoMb68cvJsxRUBmMsLjV/8cvdLyEtFYfL7InIaLgU4P3DrHc2bWXT
         XYOHnP2wgRDC3EfxZMixGhx+P1slqtDspK6BbMjHuI85LNsoKqbdJoAUrcNd4A+dp3Vg
         SuRywWzPSIsm7vzMxwq1TdbJ2yUwx4BRnTFMgJKrMXC2FZU8kGL75klXRPYuQMHjUDx3
         eK3i5FhGg4faiAOXnuH3aeTCIIKtBc0wjutLB+OFYHjpU4Ren9gT47ORrzvn0Vl1TDzi
         c2FA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linux.microsoft.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e30si2944106qtm.294.2019.09.26.15.36.20
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 26 Sep 2019 15:36:20 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linux.microsoft.com
Received: from localhost ([::1]:44986 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iDcN2-0000nQ-4x
	for alex.bennee@linaro.org; Thu, 26 Sep 2019 18:36:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40074)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <nramas@linux.microsoft.com>) id 1iDcMh-0000nG-Qx
 for qemu-arm@nongnu.org; Thu, 26 Sep 2019 18:36:01 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <nramas@linux.microsoft.com>) id 1iDcMg-0003RB-CP
 for qemu-arm@nongnu.org; Thu, 26 Sep 2019 18:35:59 -0400
Received: from linux.microsoft.com ([13.77.154.182]:34104)
 by eggs.gnu.org with esmtp (Exim 4.71)
 (envelope-from <nramas@linux.microsoft.com>)
 id 1iDcMg-0003Ph-7E; Thu, 26 Sep 2019 18:35:58 -0400
Received: from [10.200.157.26] (unknown [131.107.147.154])
 by linux.microsoft.com (Postfix) with ESMTPSA id D226B2008710;
 Thu, 26 Sep 2019 15:35:56 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com D226B2008710
Subject: Re: Is kexec supported in QEMU for ARM64 (qemu-system-aarch64) with
 arm-trusted-firmware, optee, and u-boot.
From: Lakshmi Ramasubramanian <nramas@linux.microsoft.com>
To: qemu-arm <qemu-arm@nongnu.org>,
 James Bottomley <James.Bottomley@HansenPartnership.com>,
 qemu-devel@nongnu.org
References: <21633062-b021-a8e7-0cc8-062f4c29dde5@linux.microsoft.com>
Message-ID: <ca5c74db-cf5d-0c3f-eb6f-27d1092420ae@linux.microsoft.com>
Date: Thu, 26 Sep 2019 15:35:56 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <21633062-b021-a8e7-0cc8-062f4c29dde5@linux.microsoft.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 13.77.154.182
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 9ZOn+pRe3+v0

On 9/26/19 8:17 AM, Lakshmi Ramasubramanian wrote:

The following commit for ARM Trusted Firmware for QEMU virt ARMv8-A
is almost 3 years old

https://salsa.debian.org/debian/atf-allwinner/commit/b6b671c4ac4bd5595306=
863225bb3bece1e6135c

Current limitations:
* Only cold boot is supported
* No build instructions for QEMU_EFI.fd and rootfs-arm64.cpio.gz
* No instructions for how to load a BL32 (Secure Payload)

So looks like only cold boot is supported (no kexec support)
Is this correct?

> When I execute kexec ("kexec -l <kernel>", followed by "kexec -e") I hi=
t=20
> the following assert (in arm-trusted-firmware/plat/qemu/qemu_pm.c)
>=20
> /**********************************************************************=
*********=20
>=20
>  =C2=A0* Platform handler called when a power domain is about to be tur=
ned
>  =C2=A0* off. The target_state encodes the power state that each level =
should
>  =C2=A0* transition to.
> ***********************************************************************=
*******/=20
>=20
> void qemu_pwr_domain_off(const psci_power_state_t *target_state)
> {
>  =C2=A0=C2=A0=C2=A0=C2=A0assert(0);
> }
>=20
> Is kexec supported in ARM64 QEMU (qemu-system-aarch64) -
> using arm-trusted-firmware, optee, and u-boot?
>=20
> Thanks,
>  =C2=A0-lakshmi

