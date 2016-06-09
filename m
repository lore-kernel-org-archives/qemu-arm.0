Received: by 10.25.27.66 with SMTP id b63csp460897lfb;
        Thu, 9 Jun 2016 11:31:37 -0700 (PDT)
X-Received: by 10.55.18.80 with SMTP id c77mr11293916qkh.199.1465497097778;
        Thu, 09 Jun 2016 11:31:37 -0700 (PDT)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 131si4102731qhb.37.2016.06.09.11.31.37
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 09 Jun 2016 11:31:37 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:36378 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bB4jx-0001zg-5M
	for alex.bennee@linaro.org; Thu, 09 Jun 2016 14:31:37 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49421)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bB4gV-0008GH-GE
	for qemu-devel@nongnu.org; Thu, 09 Jun 2016 14:28:04 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bB4gU-0002Jh-CK
	for qemu-devel@nongnu.org; Thu, 09 Jun 2016 14:28:03 -0400
Received: from mail-vk0-x236.google.com ([2607:f8b0:400c:c05::236]:34826)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bB4gU-0002JY-87
	for qemu-devel@nongnu.org; Thu, 09 Jun 2016 14:28:02 -0400
Received: by mail-vk0-x236.google.com with SMTP id d127so66862941vkh.2
	for <qemu-devel@nongnu.org>; Thu, 09 Jun 2016 11:28:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=J2Wih7See6ZwEC1A4wmPajBkmbCpB7sDwz7yrR0a5xI=;
	b=BurVMEW7wDPLDLWlrRMy32HGf4vxaVfTaKmdTzxYH4AG1xOPQcn/RLVTkOtYhUog/9
	V/b786nQMeCCNLX4jk5eNCN+N0nvRw8zgcC7PwDvkCC/kzibByeSKJjocF7nl4h/5lQd
	gT/nccXdff5ZJej45rVj3EVg1J33cHvDszn1g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=J2Wih7See6ZwEC1A4wmPajBkmbCpB7sDwz7yrR0a5xI=;
	b=lyBrQ4NAI2jo6O7mGaceNOSrb7gmGk5NEDOur7qn0E7AZshtCUlABMXARlbCpm341h
	stZI4LyTrEEj92BMX5NYOz6mH9yd+pbL6/wZY6tUeFzjMge7kDrCcaqDnh09vDxk9J3M
	c1+aCqem1oVdRfWq8Wr7uDeDBKi42vtsaIX/+DzGrs+UM5W39rFZ4Zr+X1XFK058yZbG
	q9AjxNCEPpzu1MkxO25AXf456aYr6Su7dNX0MLQRunNO4l6b5Zo0OmWGXbMYC3NFDIey
	hFojt+ov8ukgC61j3LK2aFGaMyPYorhALSw0ml9ocOMbgprT3LCLaGMHRrdElA16/L6J
	w/lQ==
X-Gm-Message-State: ALyK8tI51kJt7ikN+jtXOfE9SCiQRhxJS2bYVkgK/depjLvtiysiZWTVj1XH1hNDFpfTS6KGKgYRKYjojOOJO1mB
X-Received: by 10.31.81.199 with SMTP id f190mr4387140vkb.139.1465496881863;
	Thu, 09 Jun 2016 11:28:01 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.97.68 with HTTP; Thu, 9 Jun 2016 11:27:42 -0700 (PDT)
In-Reply-To: <1465410291-2971-3-git-send-email-drjones@redhat.com>
References: <1465410291-2971-1-git-send-email-drjones@redhat.com>
	<1465410291-2971-3-git-send-email-drjones@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 9 Jun 2016 19:27:42 +0100
Message-ID: <CAFEAcA_9dz42tMDVSMqo461p02hWEtkQiYqY-2CPd6f4y877Yw@mail.gmail.com>
To: Andrew Jones <drjones@redhat.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c05::236
Subject: Re: [Qemu-devel] [PATCH 2/5] hw/arm/virt: set is_default
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
Cc: Wei Huang <wei@redhat.com>, qemu-arm <qemu-arm@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Dor9OgGiTiEG

On 8 June 2016 at 19:24, Andrew Jones <drjones@redhat.com> wrote:
> Make the latest machine type (currently only one) the
> default.
>
> Signed-off-by: Andrew Jones <drjones@redhat.com>
> ---
>  hw/arm/virt.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> index a0d35d0826590..09afbafde025d 100644
> --- a/hw/arm/virt.c
> +++ b/hw/arm/virt.c
> @@ -1432,6 +1432,7 @@ static void virt_2_6_class_init(ObjectClass *oc, void *data)
>
>      mc->desc = "QEMU 2.6 ARM Virtual Machine";
>      mc->alias = "virt";
> +    mc->is_default = 1;
>  }
>
>  static const TypeInfo machvirt_2_6_info = {

We don't want a default machine for 32-bit ARM, and I'm still
unconvinced we want a default machine for 64-bit ARM. At least,
this should be a separate patch/discussion from adding the
virt-2.7 machine type.

thanks
-- PMM
