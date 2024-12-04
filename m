Received: by 2002:a17:504:d692:b0:1be9:327d:8ee3 with SMTP id na18csp27952njb;
        Tue, 3 Dec 2024 23:54:56 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCVVZ/pPQotseUbkDI8n8pt5Wm5LDnrfSnEQnXSMGELYiVj+ZjeXbIfqGFaZyPsG3jeCDQes58+CTJCdQA==@linaro.org
X-Google-Smtp-Source: AGHT+IG93ZlM9cElRNvLoygFvjkmM49eKZtqVnQnp8CRCOvmzqXuYhfMU1OXRDfOmoFhNjxVvBug
X-Received: by 2002:a05:622a:48b:b0:466:8780:5b24 with SMTP id d75a77b69052e-4670c09f3c3mr86686241cf.18.1733298896080;
        Tue, 03 Dec 2024 23:54:56 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1733298896; cv=none;
        d=google.com; s=arc-20240605;
        b=DyR6kSeantOt2yjpEhNTysXPvc1FKw8A48cMPqNnU0EYPPaCibo6URQG8fjhY2ISYC
         5o/eH+iBjXFTqWGesToiAVJKkGjEtoVSp4kBsMiTWWFoWPf5yM7We+XRvkD/nNxifvIc
         e1Px7m24xlbhCDq+ExmsFGrWPHPHHibfly7ahgh5bZ1rT/9JUL23v8h/QSpj70rwU0VH
         BgoKW4kgg84eXXUcYR5nHlE7qwZ4wYCC6UZrWnTGbrmq467nmH2e7bmvZFupsGsOqGdr
         YJBDpP44wkXOXi6mDRmIRdKxS0MplO38nIey5SIQSZRCBA8CYnA4rOZS262TRHGIhxs2
         1otg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:subject:cc:to:from
         :date:dkim-signature;
        bh=bapXZ7d3j5PvmLQR20ulpt7ZnCE088LkGy4W5u5RvDM=;
        fh=9973DYcfn7i+rtavoxFco0Q95TUgZZWCUyx6Jl7CKWU=;
        b=SkIAUTQhTI3kA1AY3lIV8cwRVuqT0ZAgUkGzOr+wJFVE8EGcTOuioQNwm1Af1fCHWo
         tSeoxIs99FuMpFUHft6sLCC4Ss8QfpweiGn4JF8Ki5bQ2JaQYCNRk1lUGGnKsB2AsHNk
         lifPY/uEBTrtAOmqvSA369bNcKQaRs67dySwMa+lEADHMnvbZkG8Uz8pT7CIN0mdvkct
         9Bhp4DJi+Q4+uSFMQ7mkINUtNP+ST9dwl7EOuYZC/cvVqrp4ekD1phobFbE73zJo7xJ9
         UEcJYGitRUxknhFLjNfN3C85pmMikBkPKSh/UnerUTxAgSMbyYhrj/XlHci5zxz7Wz5+
         2KVg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=P5jQ3eBq;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-466d766d474si127046931cf.352.2024.12.03.23.54.55
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 03 Dec 2024 23:54:56 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=P5jQ3eBq;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tIkDm-00013j-9n; Wed, 04 Dec 2024 02:54:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1tIkDh-0000uS-Qr
 for qemu-arm@nongnu.org; Wed, 04 Dec 2024 02:54:49 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1tIkDe-0002Ue-CJ
 for qemu-arm@nongnu.org; Wed, 04 Dec 2024 02:54:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1733298885;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bapXZ7d3j5PvmLQR20ulpt7ZnCE088LkGy4W5u5RvDM=;
 b=P5jQ3eBq7W12tqLlelz4XIcipQwiJqxiUmCcLX43OIMSqMssae+sUalLuW5T3Xo+3iSSbp
 jQZL5yRTPpt8r7XDZnNJJArSD0YWYNn3fjtGWff4aVBHs8sxtbcMFGkH7KnrkPVb3uzJ+t
 zq0HT9WQtDvELJgtSrs/DK8PgUIQTjY=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-617-esTQVO-QPJ-ASD7-Dbb72Q-1; Wed, 04 Dec 2024 02:54:44 -0500
X-MC-Unique: esTQVO-QPJ-ASD7-Dbb72Q-1
X-Mimecast-MFC-AGG-ID: esTQVO-QPJ-ASD7-Dbb72Q
Received: by mail-wr1-f69.google.com with SMTP id
 ffacd0b85a97d-385df115300so2343532f8f.2
 for <qemu-arm@nongnu.org>; Tue, 03 Dec 2024 23:54:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733298883; x=1733903683;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=bapXZ7d3j5PvmLQR20ulpt7ZnCE088LkGy4W5u5RvDM=;
 b=kTm+U/8BR2kOG/IPNGDaBZCwoblYTcjXsjHtSH8RgNwNuC62YEX3XBL6xrpGvGjm3G
 0PWyTuBZd0NdAIlwrT5OFCpu9eTr50J9RbH7t+ab+utCyCtwfEJE7WKjLtc0IUwkZ6V3
 QVG1UYtk5Y8Be4JXJc5VtNBqRLL9Di1dwPVJykTqZrCfX8VIeFbNTInJ6a4zfK+Cdcv5
 el3OPmBLbTr6uN0h0U5d09aMERvDict9ut4gn0tjMqQrlrtgCssZCGuR6uMJCdPakrxO
 Jc0gwgbEbBVN6GLIFgs7geCn1CsGYUP02XdeWYb1fTWF6pFbL+6u+kMb45iE1COxQBAL
 0HwA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWgOZrRkmPgFJpwoBO4i1rDg4rQyI2Wq8xXuQcUzW2tYETLo3HFXP/juaT9Ub0smHfHQ/RmSl7mKg==@nongnu.org
X-Gm-Message-State: AOJu0YyWHDUihSURwHTjbmiT6fIs30M83skxhPShOkS8s5nQPs754N/w
 Upe+0fz5t4yQFCHJBqQBmOJGyI8TDoOYqkg5jXnw7q2145XQblGAuLSwFjF/nnEOJMmDVHaCPV/
 Ep69o50E/9vL18T1VdOx/kZsU0DVOXRG2FKOnAjSnnRf/6xe93w==
X-Gm-Gg: ASbGncsQcrPJRfnSp4lh/fVemc4lpUvx8NzJjsWfj90fZlfp7fv8bnOhd2tW7fMNQyo
 9kVgu2Ce0jwsG3XD9fIqWWtvNarIvB2E7kbGD9dX3+yqxGbdR3Vh0HsFtu392j99pxguOS9kBoV
 tuMQOpiUnajjSQv39lOJaNurrdKdXiTOTlj0hD3xsyvoR8jFNVQ769ZgRy1YQOvxndnszjsqIQB
 mEjVH3hOXLMZsg25sfdgql/ofHmapeBNnRSaEGEI1a70bEwQKCwZPACawHS9P6kdEeylxMpqWLS
 0JdNot4wCmK4zViV7aEUpg==
X-Received: by 2002:a05:6000:1aca:b0:382:319f:3abd with SMTP id
 ffacd0b85a97d-385fd53ef48mr3821754f8f.36.1733298882623; 
 Tue, 03 Dec 2024 23:54:42 -0800 (PST)
X-Received: by 2002:a05:6000:1aca:b0:382:319f:3abd with SMTP id
 ffacd0b85a97d-385fd53ef48mr3821741f8f.36.1733298882222; 
 Tue, 03 Dec 2024 23:54:42 -0800 (PST)
Received: from imammedo.users.ipa.redhat.com (nat-pool-brq-t.redhat.com.
 [213.175.37.10]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-385f0056637sm8769421f8f.15.2024.12.03.23.54.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Dec 2024 23:54:41 -0800 (PST)
Date: Wed, 4 Dec 2024 08:54:40 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc: Jonathan Cameron <Jonathan.Cameron@huawei.com>, Shiju Jose
 <shiju.jose@huawei.com>, "Michael S. Tsirkin" <mst@redhat.com>, Ani Sinha
 <anisinha@redhat.com>, Dongjiu Geng <gengdongjiu1@gmail.com>,
 linux-kernel@vger.kernel.org, qemu-arm@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [PATCH v4 13/15] acpi/ghes: move offset calculus to a separate
 function
Message-ID: <20241204085440.4640a476@imammedo.users.ipa.redhat.com>
In-Reply-To: <20241203144730.47b8ca86@foz.lan>
References: <cover.1732266152.git.mchehab+huawei@kernel.org>
 <e5661a6383449675b28e15c8479ebca42c939368.1732266152.git.mchehab+huawei@kernel.org>
 <20241203125143.7171892a@imammedo.users.ipa.redhat.com>
 <20241203144730.47b8ca86@foz.lan>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: nEZZd2alPdCGk6B0jngQEuJvuXO-RN_4OYlbjA6W3EA_1733298883
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -50
X-Spam_score: -5.1
X-Spam_bar: -----
X-Spam_report: (-5.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-2.996,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: wbfs0NB8jo3o

On Tue, 3 Dec 2024 14:47:30 +0100
Mauro Carvalho Chehab <mchehab+huawei@kernel.org> wrote:

> Em Tue, 3 Dec 2024 12:51:43 +0100
> Igor Mammedov <imammedo@redhat.com> escreveu:
> 
> > On Fri, 22 Nov 2024 10:11:30 +0100
> > Mauro Carvalho Chehab <mchehab+huawei@kernel.org> wrote:
> >   
> > > Currently, CPER address location is calculated as an offset of
> > > the hardware_errors table. It is also badly named, as the
> > > offset actually used is the address where the CPER data starts,
> > > and not the beginning of the error source.
> > > 
> > > Move the logic which calculates such offset to a separate
> > > function, in preparation for a patch that will be changing the
> > > logic to calculate it from the HEST table.
> > > 
> > > While here, properly name the variable which stores the cper
> > > address.
> > > 
> > > Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
> > > Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
> > > ---
> > >  hw/acpi/ghes.c | 41 ++++++++++++++++++++++++++++++++---------
> > >  1 file changed, 32 insertions(+), 9 deletions(-)
> > > 
> > > diff --git a/hw/acpi/ghes.c b/hw/acpi/ghes.c
> > > index 87fd3feedd2a..d99697b20164 100644
> > > --- a/hw/acpi/ghes.c
> > > +++ b/hw/acpi/ghes.c
> > > @@ -364,10 +364,37 @@ void acpi_ghes_add_fw_cfg(AcpiGhesState *ags, FWCfgState *s,
> > >      ags->present = true;
> > >  }
> > >  
> > > +static void get_hw_error_offsets(uint64_t ghes_addr,
> > > +                                 uint64_t *cper_addr,
> > > +                                 uint64_t *read_ack_register_addr)
> > > +{    
> > 
> >   
> > > +    if (!ghes_addr) {
> > > +        return;
> > > +    }    
> > 
> > why do we need this check?  
> 
> It is a safeguard measure to avoid crashes and OOM access. If fw_cfg 
> callback doesn't fill it properly, this will be zero.

shouldn't happen, but yeah it firmware job to write back addr
which might happen for whatever reason (a bug for example).

Perhaps push this up to the stack, so we don't have to deal
with scattered checks in ghes code.

kvm_arch_on_sigbus_vcpu() looks like a goo candidate for check
and warn_once if that ever happens.
It already calls acpi_ghes_present() which resolves GED device
and then later we duplicate this job in ghes_record_cper_errors()

so maybe rename acpi_ghes_present to something like AcpiGhesState* acpi_ghes_get_state()
and call it instead. And then move ghes_addr check/warn_once there.
This way the rest of ghes code won't have to deal handling practically
impossible error conditions that cause reader to wonder why it might happen.

> > > +
> > > +    /*
> > > +     * non-HEST version supports only one source, so no need to change
> > > +     * the start offset based on the source ID. Also, we can't validate
> > > +     * the source ID, as it is stored inside the HEST table.
> > > +     */
> > > +
> > > +    cpu_physical_memory_read(ghes_addr, cper_addr,
> > > +                             sizeof(*cper_addr));
> > > +
> > > +    *cper_addr = le64_to_cpu(*cper_addr);    
> >         1st bits flip, and then see later
> >   
> > > +
> > > +    /*
> > > +     * As the current version supports only one source, the ack offset is
> > > +     * just sizeof(uint64_t).
> > > +     */
> > > +    *read_ack_register_addr = ghes_addr +
> > > +			      ACPI_GHES_ERROR_SOURCE_COUNT * sizeof(uint64_t);
> > > +}
> > > +
> > >  void ghes_record_cper_errors(const void *cper, size_t len,
> > >                               uint16_t source_id, Error **errp)
> > >  {
> > > -    uint64_t error_block_addr, read_ack_register_addr, read_ack_register = 0;
> > > +    uint64_t cper_addr = 0, read_ack_register_addr = 0, read_ack_register;    
> > 
> > if get_hw_error_offsets() isn't supposed to fail, then we do not need to initialize
> > above. So this hunk doesn't belong to this patch.  
> 
> It may fail due to:
> 
>     if (!ghes_addr) {
>         return;
>     }
> 
> >   
> > >      uint64_t start_addr;
> > >      AcpiGedState *acpi_ged_state;
> > >      AcpiGhesState *ags;
> > > @@ -389,18 +416,14 @@ void ghes_record_cper_errors(const void *cper, size_t len,
> > >  
> > >      start_addr += source_id * sizeof(uint64_t);
> > >  
> > > -    cpu_physical_memory_read(start_addr, &error_block_addr,
> > > -                             sizeof(error_block_addr));
> > > +    get_hw_error_offsets(start_addr, &cper_addr, &read_ack_register_addr);
> > >  
> > > -    error_block_addr = le64_to_cpu(error_block_addr);
> > > -    if (!error_block_addr) {
> > > +    cper_addr = le64_to_cpu(cper_addr);    
> >                    ^^^^ 2nd bits flip turning it back to guest byte order again
> > 
> > suggest to keep only one of them in get_hw_error_offsets()  
> 
> Ok, I'll drop this one.
> 
> > > +    if (!cper_addr) {
> > >          error_setg(errp, "can not find Generic Error Status Block");
> > >          return;
> > >      }
> > >  
> > > -    read_ack_register_addr = start_addr +
> > > -                             ACPI_GHES_ERROR_SOURCE_COUNT * sizeof(uint64_t);
> > > -
> > >      cpu_physical_memory_read(read_ack_register_addr,
> > >                               &read_ack_register, sizeof(read_ack_register));
> > >  
> > > @@ -421,7 +444,7 @@ void ghes_record_cper_errors(const void *cper, size_t len,
> > >          &read_ack_register, sizeof(uint64_t));
> > >  
> > >      /* Write the generic error data entry into guest memory */
> > > -    cpu_physical_memory_write(error_block_addr, cper, len);
> > > +    cpu_physical_memory_write(cper_addr, cper, len);
> > >  
> > >      return;
> > >  }    
> >   
> 
> Thanks,
> Mauro
> 

