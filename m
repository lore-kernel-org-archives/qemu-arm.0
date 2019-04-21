Received: by 2002:a05:6000:88:0:0:0:0 with SMTP id m8csp1409949wrx;
        Sun, 21 Apr 2019 07:17:21 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzMSgc2qscrawIeAfjWeN3f6V4uwztt7xo9SYYeSgLCrrZzBsVLAy32bv9XUAsb7Q+WX3/c
X-Received: by 2002:a5d:52ce:: with SMTP id r14mr10489151wrv.224.1555856241046;
        Sun, 21 Apr 2019 07:17:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1555856241; cv=none;
        d=google.com; s=arc-20160816;
        b=oxQ9fhUPmrWXlqel7byNsDWMFh/SB1i2+iQGrvzmgR3S7ocjKa5A5qm5G55GvNaMhH
         fzvDOGg3abDMl9vPaOZkEYp45VEt7/ve2QG4sSA9COT5oC3gFwR2gdCpMKDSCFfNv0Qi
         3vvM3zjkV6FSUiLy7Byw8EKbAgOjzfCPIssaZN5rZpYNmJZcxoyvkXDS4Fp7xgej322d
         kC6B9W4JYCjkk/Wivb1eBvcA1ydenf59kAwBVIzujtN2jOIduop7+ky6cV9KpN0O3iIJ
         Ubw367WnSxeYn4VB3/i3NPbnqBOQDYtJiQ6OlEjB4ZgAGvBYrKKPlu78+bSMQeRiSseS
         9yuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=GgvLl3SMdVmFgavsFLTZLOjwiFNnZxcIFitbAzi1Csg=;
        b=dNzqO+73xMq77rREkBloA4hOfKx7vvXpHTTISUQoP4BJvyBvHrQZgzemKlFY2P5rSH
         ozch4I1x7ee8Uv7V3nRRjT4FGsSzIvrVl7d7PEXmCx38szizfkbidtgPKjCtgR/j+Es4
         GxYLqCSvIm6fU18E7SLMfZVMiL9nmbxoSGE7Q0Uvjj7THZy7aQjfxuSbvJIQfyQqf/mV
         JAVf267SeWdJS/sFDammA2iCbSOg6tw45R2UGV9wFhuq6djiTIzVX695PfOhURNflU+m
         aKAZ2VzTaRjXWhyGqx/MtNIrkqkW7cKu7S0PEyQ3pEwq2LtA0pu36hKMvP81d0O5Dlis
         LsHg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=yBcLcrfB;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k4si8052564wrm.70.2019.04.21.07.17.20
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sun, 21 Apr 2019 07:17:21 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=yBcLcrfB;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([127.0.0.1]:53626 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hIDHU-0003z0-57
	for alex.bennee@linaro.org; Sun, 21 Apr 2019 10:17:20 -0400
Received: from eggs.gnu.org ([209.51.188.92]:34786)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1hIDHD-0003sQ-4m
	for qemu-arm@nongnu.org; Sun, 21 Apr 2019 10:17:03 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1hIDED-0002c4-Ij
	for qemu-arm@nongnu.org; Sun, 21 Apr 2019 10:13:58 -0400
Received: from mail-oi1-x242.google.com ([2607:f8b0:4864:20::242]:47075)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1hIDED-0002bH-D8
	for qemu-arm@nongnu.org; Sun, 21 Apr 2019 10:13:57 -0400
Received: by mail-oi1-x242.google.com with SMTP id x188so6871723oia.13
	for <qemu-arm@nongnu.org>; Sun, 21 Apr 2019 07:13:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=GgvLl3SMdVmFgavsFLTZLOjwiFNnZxcIFitbAzi1Csg=;
	b=yBcLcrfBUypNcNzFZ0w7/Bz+R9fnyjSYpOHlzmtUay0jvKZqo6rRodLROlA/uD+Nre
	lTcOzdBR3CAIq2yLFaFelFxXCtf7Eha38Dr463fDI+iboeIE1eoSoSwL3uj9TJzG0eQW
	O+04nVSQS+uId7aJCg0oThjtUUkezu+QbvcsZsZOyVaF3B9MaiZyjztuJETg0E4ECBIh
	oT+/uSpH/SeNnh//JC2FCLMDiwEPglhr0Zr3i8uKE3r2STIN338J7pAWoxhv0q1UMcp6
	zgYzFWPyM1amCp8up/PJVd+9bgOc4TM2/OiP687xMIvPyM6lDKPCs8Vq7h9/Q+LGHexg
	gF+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=GgvLl3SMdVmFgavsFLTZLOjwiFNnZxcIFitbAzi1Csg=;
	b=XLavhFjEGH+gCtpO3lkxfO4MJ1Axit9dLuvfbfo6rxafR6nCmmPsyIdjUy/bRJ0JVG
	dm/JolVGYZ5wQuq+SvXMsH9ttRtbDyDKPs4nNnMKsLuvpmxdFLDwk33uagKRDDhsv/J6
	JnHpFgPXgW2mMQtRg/G5vRV7NLjF5jLGSkGHYgdNrxOKgLqmW6IPzRCNbT8mRh9i4WGA
	S1LKHTpJWzp6APwGjTJhTMYJWUi8ui1iYniFxmEUBBbQo/SFyc1YACzhAoIeEYNWDLsB
	Yqkpnaz1clBsxR/DElZ34fc305OqDsEY64N4N//uPy7NSBEPgyjgrrGksk29yjAInUFW
	KZsw==
X-Gm-Message-State: APjAAAVum3rvv0bX0rwqWjB24XDsHmyLQCgqiMF1Trcj0vC/V5vv25Bm
	GjwaLroQyDgyaRfPxctlnQAvtPtbrYpjPe4lLCqerQ==
X-Received: by 2002:aca:e054:: with SMTP id x81mr4172420oig.146.1555856035931; 
	Sun, 21 Apr 2019 07:13:55 -0700 (PDT)
MIME-Version: 1.0
References: <150c2e0d.9e6.16a3df81f26.Coremail.sohu0106@126.com>
In-Reply-To: <150c2e0d.9e6.16a3df81f26.Coremail.sohu0106@126.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sun, 21 Apr 2019 15:13:44 +0100
Message-ID: <CAFEAcA9sGXmuTwgZrnGj4OF_Bq1cMwzfO8-NF03N_U=9KicEjg@mail.gmail.com>
To: sohu0106 <sohu0106@126.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::242
Subject: Re: [Qemu-arm] arbitrarily address wirte in pxa2xx_pm_write
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
Cc: qemu-arm <qemu-arm@nongnu.org>, secalert <secalert@redhat.com>,
	"Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: E+eieAXBjfdB

On Sun, 21 Apr 2019 at 04:37, sohu0106 <sohu0106@126.com> wrote:
>
>
> in function pxa2xx_pm_write()[hw/arm/pxa2xx.c] with qemu version under 4.0-rc4 do not check the addr rang in the default case, it will lead
> to arbitrarily address write in guest.
>
>
>  137     default:    /* Read-write registers */
>  138         if (!(addr & 3)) {
>  139             s->pm_regs[addr >> 2] = value;
>  140             break;
>  141         }

Have you found a test case where this can happen?
The pm_regs array is size 0x40, and the memory
region ops are registered with

    memory_region_init_io(&s->pm_iomem, NULL, &pxa2xx_pm_ops, s,
"pxa2xx-pm", 0x100);

(using a size of 0x100), so don't I think that it's
possible for the size parameter in this function to
be 0x100 or larger, and so addr >> 2 should always
be within the array bounds. Have I missed something ?

thanks
-- PMM
