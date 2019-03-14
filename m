Received: by 2002:adf:f011:0:0:0:0:0 with SMTP id j17csp843954wro;
        Thu, 14 Mar 2019 06:22:26 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwQUbJl3FjX5y9F73c2CkXV9c8pUfjDWon5YjTHb+UItdY9EF2EpklYJnB1jBMgx/dW4biY
X-Received: by 2002:a25:6383:: with SMTP id x125mr40333693ybb.95.1552569746274;
        Thu, 14 Mar 2019 06:22:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1552569746; cv=none;
        d=google.com; s=arc-20160816;
        b=NqIhqgvHD9MUkE92mEyhdQUpuuh+ctZORHr33LA+0nOZ1AaOOPJ1amTeCAADbm6Vzw
         KxEOKRbyf5e14NZCJgFKDUaj1F3Gsf/aFI+Wevx10TQhf+5eHSFDNLknNMADoR6eD7oq
         aKb2zfBjVhU5Ru937xbtqCQ5r+LOFkOwAynxpmd7lL+DWACLk09H2EsJR8T+LcQmr4sP
         HOIXnRtLahniAtoXafoRV/DnXeFHtJWZd11L93XIrMN7hnZa2FEek0C2aZW+5GRZ3SLa
         AE/za3tdXpbLVzH/3IWy6iVCONOGtNlDEBdaAB3hNktsx46nY+2OaGLCZ1VaQPRuwGSq
         IBug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=OuuhJFpj4jaq2HyGFE4udFamI6duL9zMSgv4OE2a9po=;
        b=hW+DBuGR0w+YB/N8+51piO9j7uDiaIU4KP2WSAj51MDQRbaiA38QaXMS3fEiJOC7e1
         0vh/n1oJ+h48NJG9hF8pXtK1NI2NO7VDLRxVXm92HQ4Cnf5ediInSx9iqv4o7v7sRaZ4
         g4x4K91Dfq7G/6lA7HIuiSbDHw324MEMiNTrLx/eeLQj9TyKHmZ6tNdQKhzRmfzkF27n
         0v+BQ1Pb9YRhWYCGmvMbJYrZZc2XX9KKf/RqLVt5ZM51eSIa+WQgxRk0oGbWcop+05tJ
         Ku7UAvhx5VSPo1PsU4kV3ekdbcWifsz4pge//5KBvzQKoT2HW19o/egJfaQF6koiABkO
         p9pA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=riRvKDtK;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k4si8256084ybp.183.2019.03.14.06.22.26
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 14 Mar 2019 06:22:26 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=riRvKDtK;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([127.0.0.1]:36768 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1h4QJV-0006Fh-LU
	for alex.bennee@linaro.org; Thu, 14 Mar 2019 09:22:25 -0400
Received: from eggs.gnu.org ([209.51.188.92]:45706)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1h4QGq-00044M-1b
	for qemu-arm@nongnu.org; Thu, 14 Mar 2019 09:19:41 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1h4QGk-0006xn-SW
	for qemu-arm@nongnu.org; Thu, 14 Mar 2019 09:19:38 -0400
Received: from mail-it1-x144.google.com ([2607:f8b0:4864:20::144]:38721)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1h4QGj-0006mE-6l
	for qemu-arm@nongnu.org; Thu, 14 Mar 2019 09:19:34 -0400
Received: by mail-it1-x144.google.com with SMTP id k193so4791738ita.3
	for <qemu-arm@nongnu.org>; Thu, 14 Mar 2019 06:19:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=OuuhJFpj4jaq2HyGFE4udFamI6duL9zMSgv4OE2a9po=;
	b=riRvKDtKBalX5poHiU1elW7QrthlrJmCdGp7pUyUQN76SxWklBNu3JL9yNypfwhXLm
	4P3zzZnDGGjRjw0/cgigQWjepDKjBmIfy/41fnPIk7PphMmRG9I0U3n9k+Xtw6u4BzJD
	aWhjYmlzG5C6XMb8r16nsl7DmySv1AKuxrjZT0q/AS8IwogJLnoLifnYzgQf+A99AqOC
	wew3rmsxijgyIB+Nj/f+0ggISDmCq/7m+dU/rqSLOJI2mrlsKg5gds4PiEibENh99V/s
	otLm2ZNPip0LDMZRGidzYTlSzIYKKX9qv4fRwONnfWQ35/Wr7pqduwNGOIZRB/73cBYd
	o6SQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=OuuhJFpj4jaq2HyGFE4udFamI6duL9zMSgv4OE2a9po=;
	b=A7Td+Se4sp+iYq5s1FT0srnbXK0SQqn1Xk/JeRML2hsG4UX0pWzIgtUsKOBJ84fxgD
	dzgqKIGga+4I+BJzeVJ5Sxj0vwTQBs4lIRWVJoAZNho75H03EonpvYLauQAn8mIBPogg
	MHhQ9YEu1OSWCS+iUSDMgJP5lmUl+QaLpm8XfbvyosZfWciVDh7dNMdgaYNEUP6zI3pg
	Fan6YzvWxRVC+QQgA0s8ABPxEQfSqx7ERBbo0JNxX3PEflws9Ew84AWCxrtnFXRAdCMo
	ozCATw3wOdFOarSAz1WJCKRELFmtDLSjLDiA/GjXt0ZhOEFNda1of0CQiavgBqZaeSd9
	qb2A==
X-Gm-Message-State: APjAAAWhiFJx9OxpmNQDkA9UoF7lfcJlzYJDtRwSKIg0H7HV1qRhkeEG
	zJfkxyXdwZjG06K8/zgk0aq2mojhD4YeDEgx3QoiJg==
X-Received: by 2002:a24:1984:: with SMTP id b126mr1834189itb.116.1552569547395;
	Thu, 14 Mar 2019 06:19:07 -0700 (PDT)
MIME-Version: 1.0
References: <20190312091031.5185-1-eric.auger@redhat.com>
In-Reply-To: <20190312091031.5185-1-eric.auger@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 14 Mar 2019 13:18:55 +0000
Message-ID: <CAFEAcA9Pb_cO3exAROoonGs-iXeWPay5NgdickretNiBAy-hTw@mail.gmail.com>
To: Eric Auger <eric.auger@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::144
Subject: Re: [Qemu-arm] [PATCH] hw/arm/virt-acpi-build: Fix SMMUv3 GSIV
 values
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
Cc: Shannon Zhao <shannon.zhaosl@gmail.com>, qemu-arm <qemu-arm@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Eric Auger <eric.auger.pro@gmail.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: PbgJzOI66QT8

On Tue, 12 Mar 2019 at 09:10, Eric Auger <eric.auger@redhat.com> wrote:
>
> The GSIV numbers of the SPI based interrupts is not correct as
> ARM_SPI_BASE was not added to the irqmap[VIRT_SMMU] value. So
> this may collide with VIRTIO_MMIO irq window.
>
> Signed-off-by: Eric Auger <eric.auger@redhat.com>
> ---
>  hw/arm/virt-acpi-build.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
> index d7e2e4885b..aa02d8d74e 100644
> --- a/hw/arm/virt-acpi-build.c
> +++ b/hw/arm/virt-acpi-build.c
> @@ -405,7 +405,7 @@ build_iort(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
>      its->identifiers[0] = 0; /* MADT translation_id */
>
>      if (vms->iommu == VIRT_IOMMU_SMMUV3) {
> -        int irq =  vms->irqmap[VIRT_SMMU];
> +        int irq =  vms->irqmap[VIRT_SMMU] + ARM_SPI_BASE;
>
>          /* SMMUv3 node */
>          smmu_offset = iort_node_offset + node_size;
> --



Applied to target-arm.next, thanks.

-- PMM
