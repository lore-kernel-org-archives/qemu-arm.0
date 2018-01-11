Received: by 10.28.173.206 with SMTP id w197csp870952wme;
        Thu, 11 Jan 2018 10:45:43 -0800 (PST)
X-Google-Smtp-Source: ACJfBosZ5BQnMP1vF2fYZOOSkPrIBj+3/qh1BKo2gtXmHHxw1ibRPwYGFtlkN4yGBeNejGzRJlts
X-Received: by 10.37.186.136 with SMTP id s8mr21274473ybg.436.1515696343108;
        Thu, 11 Jan 2018 10:45:43 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1515696343; cv=none;
        d=google.com; s=arc-20160816;
        b=DCb0m3cY+CtFpcvDXtxol3JuxiiVHzTK2SIezpnPBBX1xf/ZMDdkS5N9bD23OHVMnY
         N/gsV5AzX7KAUWW9kiqwzd5c40t6QqOKWAP/Ixin4Jc/MilqCLKv/fkQXanWAFUyRpj5
         zmDOCOookot0HGmqpX1xlraNwLrN6Ee/AYwznW9uRtHsLGxjgmLExRKeOE/1lFXg1zJV
         et4FI2BM1coemF32BYWaPnw4g577gHCtV1/U7I+ir8dy+VyZAfV3Z9dg5JFVrTe2cJhy
         fwUrrmMEjZEa+Z6zMMFYMme+4Vz/G8540ciOsYbCZ1736Nbm4sTr7ZgyQQUxB98QrUfA
         vJXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=cvauE/wONohTj8DGYx+7K8EuwsumDYhnEka2apItG94=;
        b=d675wLbn8vZmfGTcCbC2eY01giJiupw2987FcToXHgroqi0sJG17zePHbheEdLtfi2
         UJGgFjQY9F81UHG0QRYH+rymKl4PIYQX8/jYRR7OII5edr3f9L5cdkd/obnH3nXqtMaN
         Hi0YXKTLg93zPZ5orjOo2jtHoD+n8DOCukN0T3woUrdfu9sMZ9Y9sk4mhxYW6al7VfM3
         LDQSAKIuSWoEClwKNnVf+6Qp9mIW5BC0z1L2/A7zYYzgICTPM6cWMi709HQRkDZknMO5
         VUebRfLTSWMVA+JMsAib3NSxsl1chqxQT/oPIQH9KogbX4H0n1I4naGY68jjCyZdzpkc
         egjA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=d5DdyVSo;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 1si1323291yww.529.2018.01.11.10.45.42
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 11 Jan 2018 10:45:43 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=d5DdyVSo;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:33783 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eZhrC-00053w-KH
	for alex.bennee@linaro.org; Thu, 11 Jan 2018 13:45:42 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56008)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1eZhqm-00050G-DD
	for qemu-devel@nongnu.org; Thu, 11 Jan 2018 13:45:17 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1eZhql-0006uv-F5
	for qemu-devel@nongnu.org; Thu, 11 Jan 2018 13:45:16 -0500
Received: from mail-ot0-x229.google.com ([2607:f8b0:4003:c0f::229]:43728)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1eZhql-0006uc-BG
	for qemu-devel@nongnu.org; Thu, 11 Jan 2018 13:45:15 -0500
Received: by mail-ot0-x229.google.com with SMTP id t28so2943258oti.10
	for <qemu-devel@nongnu.org>; Thu, 11 Jan 2018 10:45:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=cvauE/wONohTj8DGYx+7K8EuwsumDYhnEka2apItG94=;
	b=d5DdyVSoYJsJtLbzDZbeveQ33eIbYEbCvdPGFZeHTibm0YjYI3S864mzy70zkJmF61
	fUk3B5AXeGO1QgnOCZEOOXHPYUlCIB7RSLyfpTyhh6TLHZNo3t13WLxsuuLDXEUDTgOi
	XqmaHRu9dKNRt8xyRmfcMRWXzMzUwAhyHidp0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=cvauE/wONohTj8DGYx+7K8EuwsumDYhnEka2apItG94=;
	b=efOevSyoADm5QYl8vhl7pinRi0dtvwaFLhi8qF/IuFQaAyskrsY25YuV1vVrLZJIv6
	ic09EMqkS3ane8iko2XFYFrobRe6LeKocCGJzTV9sTlqFp+A0nT7qDVJQ+RxxJyO+U1m
	ANOu5YsJHSiR3Q92iLoBuX7jHb38u2CFRUXyhUrtvk0xjpxUOl0DOn/beUSGF5K5yVeA
	IVF6E6BwtnjPX3oBhN9OI2Vs/taI44UDbwdJezpDAkqrBdDlwg4zMK5f9dkEwtoLEEMr
	CqjP9ALfbsF0wYBD96r1XzfflTg3Vs5VfioQppKEK4V6UIB3XSe97iPMnWUGdu4lKM7c
	5bYw==
X-Gm-Message-State: AKwxytdwOdtULBZEGJk+SCBvrjIEsfXSj56x958gAx7YWdcOmNQhXLTH
	sqx9WhwUzVg52DAyjvitIgsXyaVt56IwzglLvmn1/g==
X-Received: by 10.157.29.233 with SMTP id w38mr12120901otw.24.1515696314578;
	Thu, 11 Jan 2018 10:45:14 -0800 (PST)
MIME-Version: 1.0
Received: by 10.157.15.71 with HTTP; Thu, 11 Jan 2018 10:44:54 -0800 (PST)
In-Reply-To: <20171218173022.18418-8-richard.henderson@linaro.org>
References: <20171218173022.18418-1-richard.henderson@linaro.org>
	<20171218173022.18418-8-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 11 Jan 2018 18:44:54 +0000
Message-ID: <CAFEAcA9EZ0jY6tR2E7ZzfWnAfSJ3hjGNT7za+RZC-SGuBY6Hfg@mail.gmail.com>
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c0f::229
Subject: Re: [Qemu-devel] [PATCH 7/9] target/arm: Expand vector registers
 for SVE
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
	"Dr. David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: T3RJI0f5QaCq

On 18 December 2017 at 17:30, Richard Henderson
<richard.henderson@linaro.org> wrote:
> Change vfp.regs as a uint64_t to vfp.zregs as an ARMVectorReg.
> The previous patches have made the change in representation
> relatively painless.
>
> Add vfp.pregs as an ARMPredicateReg.  Let FFR be P16 to make
> it easier to treat it as for any other predicate.

> diff --git a/target/arm/machine.c b/target/arm/machine.c
> index a85c2430d3..39f3123b10 100644
> --- a/target/arm/machine.c
> +++ b/target/arm/machine.c
> @@ -50,7 +50,42 @@ static const VMStateDescription vmstate_vfp = {
>      .minimum_version_id = 3,
>      .needed = vfp_needed,
>      .fields = (VMStateField[]) {
> -        VMSTATE_UINT64_ARRAY(env.vfp.regs, ARMCPU, 64),
> +        /* For compatibility, store Qn out of Zn here.  */
> +        /* TODO: store the other quadwords in another subsection,
> +           along with predicate registers and ZCR_EL[1-3].  */

I think we should get the migration state stuff right at the point
where we change the data structure in cpu.h.


> +        VMSTATE_UINT64_SUB_ARRAY(env.vfp.zregs[0].d, ARMCPU, 0, 2),
> +        VMSTATE_UINT64_SUB_ARRAY(env.vfp.zregs[1].d, ARMCPU, 0, 2),
> +        VMSTATE_UINT64_SUB_ARRAY(env.vfp.zregs[2].d, ARMCPU, 0, 2),

David: does the migration code guarantee that we can split an
old VMSTATE_UINT64_ARRAY into being a sequence of SUB_ARRAYs
like this and retain the same on-the-wire format (ie and
keep migration compat) ?

I suspect we've used this clever trick before elsewhere, but thought
it better to check...

thanks
-- PMM
