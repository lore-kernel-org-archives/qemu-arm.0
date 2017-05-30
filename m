Received: by 10.25.0.6 with SMTP id 6csp1874601lfa;
        Tue, 30 May 2017 08:37:41 -0700 (PDT)
X-Received: by 10.55.24.201 with SMTP id 70mr20169765qky.171.1496158661368;
        Tue, 30 May 2017 08:37:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1496158661; cv=none;
        d=google.com; s=arc-20160816;
        b=yuPVVoNp2eidkSuNr79GM9+lqQSFN5H5R8ILs0tzjWwRYqOtKpRa4H9wkLgvvBmfrW
         MugWF/eXwXR+ys+/+ZFaa4fYdkCuoVihejiHXsQjhIen09/FND153Ib8zWcCfIHXv/ER
         X5zDHrV1iSDE4fileKNC1fmx+P0qhEZM/3Siib5Isw/8qj4nU8p+ByIhXs7Y0VDjncLU
         edDW4zHfv6rraWOESe2tSV9vidh+EIZNnyP5d2AFW5Vk1KyNIoZ1T1y8SP+4iNqJ+O77
         UJ28tpbovXfax/jDKlPFjDSoN09DS0DaZj5TDruzIOoae0bGvoo5Mc+R4YaBIb4YoDEB
         G1Aw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=jclx/V+kaZHsvc3pIkRCbC7ZLCbsDiEinz2b2WHvOVQ=;
        b=Ox3/ePPiXNURznciKpnYR1Xowcjq8WPf5uBdOaTKdJCDlFH3PNTgxS2NJ8NGVdVQ04
         vl0+or2Km4NUhM7X91KlJbW6oxk2RqeZbb40g6x8KNPJgkideUaLgWEMQH/P4JL/xtzI
         my1H4dJyf+qFEypeCsSCze7NeEymtMwHZTWeHiuGocSiC+o+OuiT4LaKDeAo+InbWxcu
         9j2JwEEICjaie7C1Az1aMURmi94xGMC4QQMCRdOSaCYkuAI+kikQH0bO1DGyHT1pu3qy
         n/OQxEtQemRrDW9IutR2HvEQ4oXSy/ucDlB0gZbQ30B/LyijE+djRihKzp5SXjkWtm4L
         pLvg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id z51si13115975qta.165.2017.05.30.08.37.41
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 30 May 2017 08:37:41 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:54578 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dFjDI-0006LW-Qz
	for alex.bennee@linaro.org; Tue, 30 May 2017 11:37:40 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47706)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1dFjD8-0006Jv-O5
	for qemu-arm@nongnu.org; Tue, 30 May 2017 11:37:31 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1dFjD7-0007PZ-Vc
	for qemu-arm@nongnu.org; Tue, 30 May 2017 11:37:30 -0400
Received: from mail-wm0-x22a.google.com ([2a00:1450:400c:c09::22a]:35045)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1dFjD7-0007PJ-O5
	for qemu-arm@nongnu.org; Tue, 30 May 2017 11:37:29 -0400
Received: by mail-wm0-x22a.google.com with SMTP id b84so95569852wmh.0
	for <qemu-arm@nongnu.org>; Tue, 30 May 2017 08:37:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=jclx/V+kaZHsvc3pIkRCbC7ZLCbsDiEinz2b2WHvOVQ=;
	b=NHXyz9xraM7dgwVHgyLcFeDgGBKiwA+d4o70oBE94IrcALi7JRj3LIcU48T04BH2ID
	8C9urrhPy+ez49Nvt3YwygC2QcgSPZvAMbjRxix8gXTELlo6murjYN28FtfRHSnJBbh/
	kBX6X+4VZuYMRd4vXvD3r9d+GQuBYI82EOeiQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=jclx/V+kaZHsvc3pIkRCbC7ZLCbsDiEinz2b2WHvOVQ=;
	b=pwivwSFw7V9GeFT/JlBHzpVzaXZGpp47WsQhdu/eh7mPUDAUCWRsqTRfiyuUTe4XvR
	HmGcqK5sKvxN1z7fJnQGhJ96AWjmmd4mfqsxAwDIylyOkdVdLeJ6E9+XWvLvOpNC9L5R
	JidNF/yv5OOfhizqTo4upSWY4LfeW2UHyfyRbOnSgJFAox7FO7BHKwwmrZ5kr+C8MUet
	YvmXe5pb07/ierASdUV0I4bV68s+hIXOqFOVuUPd23uS6c/epWryyZlHyL42TJ8sdQdq
	yOUZLDBaS6vDDXJokMVXFekoRdSoS4c9iS8fGtNuZbpw5FUtmQwMPIZ+oqGzoaOSVXco
	ghFw==
X-Gm-Message-State: AODbwcAkg/LfdKEcD975gsRVq9+09tpLb7YCzUS7+FVeBZ1OEoUvIyGX
	g4RBNhCU0uGQrjcbPDtO9vSUHVYidm2Y
X-Received: by 10.28.72.68 with SMTP id v65mr2081908wma.41.1496158648559; Tue,
	30 May 2017 08:37:28 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.135.82 with HTTP; Tue, 30 May 2017 08:37:07 -0700 (PDT)
In-Reply-To: <1495123889-32301-1-git-send-email-wei@redhat.com>
References: <1495123889-32301-1-git-send-email-wei@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 30 May 2017 16:37:07 +0100
Message-ID: <CAFEAcA_FiqcFz_8o-Mavgq8sfkr6dRv3fnRzytaQsr5pJ4Dagg@mail.gmail.com>
To: Wei Huang <wei@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c09::22a
Subject: Re: [Qemu-arm] [PATCH 1/1] target/arm: clear PMUVER field of
 AA64DFR0 when vPMU=off
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
X-TUID: ZxDMFVkK+uTL

On 18 May 2017 at 17:11, Wei Huang <wei@redhat.com> wrote:
> The PMUv3 driver of linux kernel (in arch/arm64/kernel/perf_event.c)
> relies on the PMUVER field of id_aa64dfr0_el1 to decide if PMU support
> is present or not. This patch clears the PMUVER field under TCG mode
> when vPMU=off. Without it, PMUv3 will init insider guest VMs even
> with vPMU=off. This patch also removes a redundant line inside the
> if-statement.
>
> Signed-off-by: Wei Huang <wei@redhat.com>
> ---
>  target/arm/cpu.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/target/arm/cpu.c b/target/arm/cpu.c
> index c185eb1..4e8fe1c 100644
> --- a/target/arm/cpu.c
> +++ b/target/arm/cpu.c
> @@ -750,8 +750,8 @@ static void arm_cpu_realizefn(DeviceState *dev, Error **errp)
>      }
>
>      if (!cpu->has_pmu) {
> -        cpu->has_pmu = false;
>          unset_feature(env, ARM_FEATURE_PMU);
> +        cpu->id_aa64dfr0 &= ~0xf00;
>      }
>
>      if (!arm_feature(env, ARM_FEATURE_EL2)) {
> --
> 1.8.3.1



Applied to target-arm.next, thanks.

-- PMM
