Received: by 2002:a17:90a:3d4c:0:0:0:0 with SMTP id o12-v6csp3850638pjf;
        Fri, 30 Nov 2018 07:47:41 -0800 (PST)
X-Google-Smtp-Source: AFSGD/WbGCviwu6XV/V86uExy3GnlXDFXEeC2IH/MUr42Wb3S+b9GMtnX8ROhg5dux5CIvx4AN8q
X-Received: by 2002:a81:1d43:: with SMTP id d64mr6187394ywd.450.1543592861713;
        Fri, 30 Nov 2018 07:47:41 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1543592861; cv=none;
        d=google.com; s=arc-20160816;
        b=c7yXaDMZ2AzQoetwHd+FTG1WvBBBGXETJROtqgYalx5Yk7iMFsP/fVQR/j5IZb1XG6
         b05KS4W+xCpZqY2r5cu9MIHtxAHUEBsirXDIZF8T5LAMSp/ymIORa62EPafVnXqOtg+U
         oefPojLaru2tTUA9aM+HHxN5lOGEABWq57ImBPqPEsRt5vbQjzqhPWlN6JyJBezl4hq9
         RHO4xHngBFnilX21oSXINobS0t38/OJ5D7lTSD1/LhTZ+4g4q3jNdCx/hO6Lg1kgQ4+D
         O6OsT5o023FZySbMNcnIkfpZjh+0Fw0LpZkCZKM8jt02mOa0c5XrMDMtC8SPYTBimYNp
         /swQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Rc+78Rym3lmVufyxuW3+EwPDCEPMkhgBjdaI/0kZWjo=;
        b=bZVJ6pMOa1EogxSsSDv8FZTQC++zGc4/Z9lnZPsjR8ZUrBSC94L9YWSweWerpEPfpf
         CqoVdax9+EUvQlfpC5E/cyXNhblfFv8NgZHh+Zw+Eff30C4u1MVUyk8jpKsZJomtEBIu
         jqI4EdZ7eiG8NIH0wUqD3pgQ80lvYJQga0Mz0gUSOZVhlL7FNI9n51UgrA9EvT0/nsdM
         fF+BHao+/nqZ4FDyo7J6UyVnk+52UKQeV0dtL1phtfObsUl9rUIrLOrzQLyTRtVA6Xnm
         3FX07Yd3xbHtCUziX8wi8zlvRJguE1L9FyKurFnk9svHhjsa1zUsdbXRgOh/SyKcnUCJ
         XSgQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=KvZ8FBGZ;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id v65-v6si3352701ybb.251.2018.11.30.07.47.41
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 30 Nov 2018 07:47:41 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=KvZ8FBGZ;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:33449 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gSl12-0001xC-TW
	for alex.bennee@linaro.org; Fri, 30 Nov 2018 10:47:40 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33647)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1gSkvb-0006Ks-5K
	for qemu-devel@nongnu.org; Fri, 30 Nov 2018 10:42:03 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1gSkva-0007H7-Ia
	for qemu-devel@nongnu.org; Fri, 30 Nov 2018 10:42:03 -0500
Received: from mail-ot1-x341.google.com ([2607:f8b0:4864:20::341]:44866)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1gSkva-0007Ge-Be
	for qemu-devel@nongnu.org; Fri, 30 Nov 2018 10:42:02 -0500
Received: by mail-ot1-x341.google.com with SMTP id f18so5435808otl.11
	for <qemu-devel@nongnu.org>; Fri, 30 Nov 2018 07:42:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=Rc+78Rym3lmVufyxuW3+EwPDCEPMkhgBjdaI/0kZWjo=;
	b=KvZ8FBGZ92OzOaA0ZoKeq8d9j3di4nXN0BRfQ9CmFQ1iuYPWxyYdZzSV9OpcjOtlmv
	eQaFJk6U7NedIkLyaCCVJfPa50pKGrFfsFKSJZAMIMdzWHKPlNXCwB+odKxM4uPRs2Yi
	z/HIEOhq08DYpN1M0qoN58D45Z+ubYy+7CAYM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=Rc+78Rym3lmVufyxuW3+EwPDCEPMkhgBjdaI/0kZWjo=;
	b=M8fGoTmDv3OE2dewmG5OOxNM6k+oy9Frr7Vs8bXOBNqMcnHDTqI52kcs5cxFalxYsY
	EkNjT30aLxFyIjzNxKQ0aQZu3RlwDEgwrxNwX75u5V6n0dMZvNEqA+eByQOUmbggd2QX
	w22U0O4EI94E1R0D7/rAFwAzPlm90WFF5DyQE6YVncDZHupuIW756ffLvrKWcqBFKtga
	sqUW1m6B1ELEOhgY8TxVolq7X7pYVy3Eb6ALnvkJX+cd0CArYzg8QTmLMQbfKpRCe/xX
	MU6LsA66hcDR8eKw8uADIOzGQNAtt9BGxMtRM5P7pfQdRozeYDli7Co+WJt3DOUduf9g
	ffrA==
X-Gm-Message-State: AA+aEWYsSHdZhGHyaI5rKc6KS4r08bX2KM8KnQqC8cyonQCAsTPKouHE
	kDSL407nlPwtzWfH7bkD5vxSDKOKTxVSnNSiCr73Tg==
X-Received: by 2002:a9d:5617:: with SMTP id e23mr3522878oti.151.1543592521670; 
	Fri, 30 Nov 2018 07:42:01 -0800 (PST)
MIME-Version: 1.0
References: <1543407172-16175-1-git-send-email-peng.hao2@zte.com.cn>
	<1543407172-16175-4-git-send-email-peng.hao2@zte.com.cn>
In-Reply-To: <1543407172-16175-4-git-send-email-peng.hao2@zte.com.cn>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 30 Nov 2018 15:41:50 +0000
Message-ID: <CAFEAcA_c12Fvo7mffuiGRR7Rd2k+Li0a8TSu_6j1OiyBTY_Bxw@mail.gmail.com>
To: Peng Hao <peng.hao2@zte.com.cn>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::341
Subject: Re: [Qemu-devel] [PATCH V10 3/9] hw/misc/pvpanic: Add the MMIO
 interface
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
Cc: Andrew Jones <drjones@redhat.com>, qemu-arm <qemu-arm@nongnu.org>,
	=?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
	QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ilzQdma+Ildx

On Wed, 28 Nov 2018 at 03:50, Peng Hao <peng.hao2@zte.com.cn> wrote:
>
> Add pvpanic new type "TYPE_PVPANIC_MMIO"
>
> Signed-off-by: Peng Hao <peng.hao2@zte.com.cn>
> ---
>  hw/misc/pvpanic.c         | 50 +++++++++++++++++++++++++++++++++++++++++++----
>  include/hw/misc/pvpanic.h |  1 +
>  2 files changed, 47 insertions(+), 4 deletions(-)
>


> +static void pvpanic_mmio_initfn(Object *obj)
> +{
> +    PVPanicMMIOState *s = PVPANIC_MMIO_DEVICE(obj);
> +    SysBusDevice *sbd = SYS_BUS_DEVICE(obj);
> +
> +    memory_region_init_io(&s->mr, OBJECT(s), &pvpanic_ops, s,
> +                          TYPE_PVPANIC_MMIO, 2);

Why did you choose to make the memory region 2 bytes wide?
The ISA i/o port interface seems to be a 1 byte wide one.

Otherwise
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
