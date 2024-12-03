Received: by 2002:a17:504:6601:b0:1be9:327d:8ee3 with SMTP id h1csp3694022njk;
        Tue, 3 Dec 2024 05:48:02 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCURIl1GMH7SPC/ObLi2DvQGUT1bgp6Ap2nhvekuBaXGyIRkimexNOoDRZIc4TMpMOMYdtlIGNDLHlJ03w==@linaro.org
X-Google-Smtp-Source: AGHT+IEopAoW9SSfcHm2oFI2kM8sYgbrMRE7rhhpsQIXm089fR/BBH2n4LO5SPHYhEkOdbUo+qjR
X-Received: by 2002:a05:6214:5299:b0:6d8:7ed4:336c with SMTP id 6a1803df08f44-6d8b72d41ddmr42403616d6.9.1733233682052;
        Tue, 03 Dec 2024 05:48:02 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1733233682; cv=none;
        d=google.com; s=arc-20240605;
        b=Ugm573jNnPmv23mmCcYC6K4+HPinZUcwHA5dPK2qyALCAhm0GrRG3C64Bewcxs2VCW
         GPl1KNqxHJUvfb0YYA8QVQ4UwbB/JTHnxlRKDJMqOL809HkXXSRRSFw4Hc1E7sK14FdO
         xdM2tYOnzNAbLm5etkIJfjxx9wI3P+gJ4AjToLn1tXLwhdPp6V0QbKnMl974eH46AuSb
         Dgbrgfshcn9viUgcTOZx9SAjFx1f9/iBIxZIAn+V0yfQtvwGeelpTiIJcEUvQICNyMAk
         R+Yjpt/nNpt9wDTMbjCJjBUBJT8tltj1yawqzlBPJ3H0V5hwB4bRxXTMiUueFqdYQTUC
         yk0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:subject:cc:to:from
         :date:dkim-signature;
        bh=OW3tSdAfPEYm1LuLXNAPY6dKGrzDA9DmzYxkArZPDy0=;
        fh=AJ8hn4ioKJA5lsG3NCMNx8yhntdFUmRi9f6dN5eYbeg=;
        b=EQIlJEVA3Abmx2mIfB2r2GlCczBiYEchflWzcQSJxHInn4oMqw0uQ0WQq5mAGHCheQ
         0AW2BfPd1fSCqMtOCwm3RiIJxHFeN5txMyFZhyKmNvJ/y4QMDPu/2q0MNoL4c+sK8ZDp
         XWodSLqg6X4obdg9FqhMvbb5+TIs3iHnISjhXI+cLAvRNa4BwcYTF7iaEuFk6moR9z8D
         7Pkm2KDquWONRkiMTpHhjIOAsX1yB0KQ+D1Xejn3V71fsdnGRKqIyRNnirEoRwqw2E9Z
         elADx6caytIZxyS+ptp5tF4LfIxxcrA8OC1BdY1De5UXSdW/P5D8vSgKCCkTiUoc6102
         nMmg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=ZVO5qO8a;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=kernel.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6d88e43d82dsi94794386d6.9.2024.12.03.05.48.01
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 03 Dec 2024 05:48:02 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=ZVO5qO8a;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=kernel.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tITFk-0001ur-N8; Tue, 03 Dec 2024 08:47:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mchehab+huawei@kernel.org>)
 id 1tITFb-0001s3-Sw; Tue, 03 Dec 2024 08:47:40 -0500
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mchehab+huawei@kernel.org>)
 id 1tITFa-0002hU-0L; Tue, 03 Dec 2024 08:47:39 -0500
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 48334A41591;
 Tue,  3 Dec 2024 13:45:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4A521C4CECF;
 Tue,  3 Dec 2024 13:47:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1733233655;
 bh=rW9anMd/h4WvBtrCWB5sEHm8Mq2O096NZSmZC+9OaTw=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=ZVO5qO8a73vCXephEEvwTAVksGbv1y8BwyPkMUqV45slSJ88DMW61/sMXAwlmu2Fw
 NuHGrfwppCzdP3+xXP/ojNtuAclWqCbRCymd8HjhejSufzr5W5s2o+/vJxwUxnKuu5
 gHKgY0U1tMRXSdlSGO753HeCqF8DW6TxWNru8pOOxM4O1ecPmh5IkDk6SXvANn7VOk
 Uav9EfiVhyUvpIFlJHLeuwpL5uaNnusKK981C6Z8Wh68Mj0aPMbFW1KBEtpIfsoMHg
 kDGQRgtvOJ1QOfdAgM5CrVaTwEkJMYRI23YLZosvADF6XTBpLzJO9cBlA4IxRTGkei
 FadMNoc0RYyMg==
Date: Tue, 3 Dec 2024 14:47:30 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Igor Mammedov <imammedo@redhat.com>
Cc: Jonathan Cameron <Jonathan.Cameron@huawei.com>, Shiju Jose
 <shiju.jose@huawei.com>, "Michael S. Tsirkin" <mst@redhat.com>, Ani Sinha
 <anisinha@redhat.com>, Dongjiu Geng <gengdongjiu1@gmail.com>,
 linux-kernel@vger.kernel.org, qemu-arm@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [PATCH v4 13/15] acpi/ghes: move offset calculus to a separate
 function
Message-ID: <20241203144730.47b8ca86@foz.lan>
In-Reply-To: <20241203125143.7171892a@imammedo.users.ipa.redhat.com>
References: <cover.1732266152.git.mchehab+huawei@kernel.org>
 <e5661a6383449675b28e15c8479ebca42c939368.1732266152.git.mchehab+huawei@kernel.org>
 <20241203125143.7171892a@imammedo.users.ipa.redhat.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2604:1380:45d1:ec00::3;
 envelope-from=mchehab+huawei@kernel.org; helo=nyc.source.kernel.org
X-Spam_score_int: -73
X-Spam_score: -7.4
X-Spam_bar: -------
X-Spam_report: (-7.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-2.996,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
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
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: MfBZ0wcAspF/

Em Tue, 3 Dec 2024 12:51:43 +0100
Igor Mammedov <imammedo@redhat.com> escreveu:

> On Fri, 22 Nov 2024 10:11:30 +0100
> Mauro Carvalho Chehab <mchehab+huawei@kernel.org> wrote:
> 
> > Currently, CPER address location is calculated as an offset of
> > the hardware_errors table. It is also badly named, as the
> > offset actually used is the address where the CPER data starts,
> > and not the beginning of the error source.
> > 
> > Move the logic which calculates such offset to a separate
> > function, in preparation for a patch that will be changing the
> > logic to calculate it from the HEST table.
> > 
> > While here, properly name the variable which stores the cper
> > address.
> > 
> > Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
> > Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
> > ---
> >  hw/acpi/ghes.c | 41 ++++++++++++++++++++++++++++++++---------
> >  1 file changed, 32 insertions(+), 9 deletions(-)
> > 
> > diff --git a/hw/acpi/ghes.c b/hw/acpi/ghes.c
> > index 87fd3feedd2a..d99697b20164 100644
> > --- a/hw/acpi/ghes.c
> > +++ b/hw/acpi/ghes.c
> > @@ -364,10 +364,37 @@ void acpi_ghes_add_fw_cfg(AcpiGhesState *ags, FWCfgState *s,
> >      ags->present = true;
> >  }
> >  
> > +static void get_hw_error_offsets(uint64_t ghes_addr,
> > +                                 uint64_t *cper_addr,
> > +                                 uint64_t *read_ack_register_addr)
> > +{  
> 
> 
> > +    if (!ghes_addr) {
> > +        return;
> > +    }  
> 
> why do we need this check?

It is a safeguard measure to avoid crashes and OOM access. If fw_cfg 
callback doesn't fill it properly, this will be zero.

> > +
> > +    /*
> > +     * non-HEST version supports only one source, so no need to change
> > +     * the start offset based on the source ID. Also, we can't validate
> > +     * the source ID, as it is stored inside the HEST table.
> > +     */
> > +
> > +    cpu_physical_memory_read(ghes_addr, cper_addr,
> > +                             sizeof(*cper_addr));
> > +
> > +    *cper_addr = le64_to_cpu(*cper_addr);  
>         1st bits flip, and then see later
> 
> > +
> > +    /*
> > +     * As the current version supports only one source, the ack offset is
> > +     * just sizeof(uint64_t).
> > +     */
> > +    *read_ack_register_addr = ghes_addr +
> > +			      ACPI_GHES_ERROR_SOURCE_COUNT * sizeof(uint64_t);
> > +}
> > +
> >  void ghes_record_cper_errors(const void *cper, size_t len,
> >                               uint16_t source_id, Error **errp)
> >  {
> > -    uint64_t error_block_addr, read_ack_register_addr, read_ack_register = 0;
> > +    uint64_t cper_addr = 0, read_ack_register_addr = 0, read_ack_register;  
> 
> if get_hw_error_offsets() isn't supposed to fail, then we do not need to initialize
> above. So this hunk doesn't belong to this patch.

It may fail due to:

    if (!ghes_addr) {
        return;
    }

> 
> >      uint64_t start_addr;
> >      AcpiGedState *acpi_ged_state;
> >      AcpiGhesState *ags;
> > @@ -389,18 +416,14 @@ void ghes_record_cper_errors(const void *cper, size_t len,
> >  
> >      start_addr += source_id * sizeof(uint64_t);
> >  
> > -    cpu_physical_memory_read(start_addr, &error_block_addr,
> > -                             sizeof(error_block_addr));
> > +    get_hw_error_offsets(start_addr, &cper_addr, &read_ack_register_addr);
> >  
> > -    error_block_addr = le64_to_cpu(error_block_addr);
> > -    if (!error_block_addr) {
> > +    cper_addr = le64_to_cpu(cper_addr);  
>                    ^^^^ 2nd bits flip turning it back to guest byte order again
> 
> suggest to keep only one of them in get_hw_error_offsets()

Ok, I'll drop this one.

> > +    if (!cper_addr) {
> >          error_setg(errp, "can not find Generic Error Status Block");
> >          return;
> >      }
> >  
> > -    read_ack_register_addr = start_addr +
> > -                             ACPI_GHES_ERROR_SOURCE_COUNT * sizeof(uint64_t);
> > -
> >      cpu_physical_memory_read(read_ack_register_addr,
> >                               &read_ack_register, sizeof(read_ack_register));
> >  
> > @@ -421,7 +444,7 @@ void ghes_record_cper_errors(const void *cper, size_t len,
> >          &read_ack_register, sizeof(uint64_t));
> >  
> >      /* Write the generic error data entry into guest memory */
> > -    cpu_physical_memory_write(error_block_addr, cper, len);
> > +    cpu_physical_memory_write(cper_addr, cper, len);
> >  
> >      return;
> >  }  
> 

Thanks,
Mauro
