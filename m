Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB007CCF9E3
	for <qemu-arm@archiver.kernel.org>; Mon, 10 Nov 2025 14:50:15 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vITDc-00020u-Dd; Mon, 10 Nov 2025 09:50:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1vITDa-0001xa-OH
 for qemu-arm@nongnu.org; Mon, 10 Nov 2025 09:50:06 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1vITDY-0008KA-Av
 for qemu-arm@nongnu.org; Mon, 10 Nov 2025 09:50:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1762786203;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ppLoESKO0e7C16zvgGhDv3duI4oVDW6l32sCD07y5xg=;
 b=WQoH8cmZmk1698pknYpLh7Eln41AtNbjoG8YIBRJaArBYs7vMnKJkd46sz1K1sf+BjPTmO
 Rk4HkXx7dxKoDZq3wL7Ue6dYBW4ku5i+DoUnoDKtWUjsJ867VATBq4DGKP8MO5TUCQ2wTX
 +iRWMm8GFi4NarsE7r7qhxtl4JdYn4Q=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-68-I-rZ56zDNcGgVW2tUlWkMA-1; Mon, 10 Nov 2025 09:50:00 -0500
X-MC-Unique: I-rZ56zDNcGgVW2tUlWkMA-1
X-Mimecast-MFC-AGG-ID: I-rZ56zDNcGgVW2tUlWkMA_1762786199
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-477171bbf51so20864725e9.3
 for <qemu-arm@nongnu.org>; Mon, 10 Nov 2025 06:50:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762786199; x=1763390999;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=ppLoESKO0e7C16zvgGhDv3duI4oVDW6l32sCD07y5xg=;
 b=OCAPiGr7khLuyRw678wDefa85WfIj41+4g7PBwb9ITJ4CZQc/NTMfpG6sWDVWEl2p6
 lTDxOynD36IAn0rW0XYzC5B7UZ+lJ1efMYZ84vNp+who/lANDwH5P3HRrVFm759ShGVn
 sio24Kq2PeXC42UFwnEdPoMsAvkxRk4FTKr28XgYPfCnDO0gBDLqTL6Jep1ZTN/ba2Wb
 dlA8Zcg60gAF4x4R5yNxlz51HtorSZkk5uhGPNgBVLrQRRUbiQea+3w+nygpQFzWBLf/
 z1UqTLVskeB2whfzqw8txAQ3w66mxofBvkhWu89iHGul2+QSoEhqPAvBd6kFjQi+si17
 aPNw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWA+iq5HZVzENMqNHib+MMgmRxlod11JA/SjCNkPj6FoaAxtejgAG65fzYrdJM7Y0lYlScHI2pOyQ==@nongnu.org
X-Gm-Message-State: AOJu0YzmNSWRUOl95k5iS0Nw8EZ7l9ZbSEZGxIBdebd4QozpLPhg/mDI
 jpXE9rutcTbls0xgiZW1joGZ8XS88vxWXZybPhQ9YHbrSSMjwz1/QA+DuzjbuLH2DwiKJqCvit7
 YyVhxT/K2J/S1FeEmskB5+EQg476AsifK/GtyiQT/Zm69mvEueT0cfA==
X-Gm-Gg: ASbGncuGk7pH+861mePvnhngWI3zB4X6QIA7AYJ3TtIkYTcVRknQ1ddk4pDMPbLSBG6
 tZTxe361HKoc1GmCi0bhJQTmgrc0B5opUDOnaE74/ulmfeWMBJoLUGOpEIOmIsG2X8vY5TbZKqa
 8+/PychT4F0byqN+MJQ8MI4WFMsN/0RPu1F3F6RMhtxu3NLPV5Oqrwx8J/XPZqu3qPN/gCa+hsU
 kytGlf8Z3RQ9jR6Cul56Ep+rSbWTg95HYh2pGKY+kDRPjGrmR9mH2wq3FNBtM2RghEL5AvMN2/0
 UAzESL+7hNmqqdE0xNvJNAU6QNLB/Gi96oamI7sAHV0U+OYfzc8BQC4nkhmR7MdbSw==
X-Received: by 2002:a05:600c:46d5:b0:477:4345:7c5c with SMTP id
 5b1f17b1804b1-47773297851mr76176345e9.38.1762786199114; 
 Mon, 10 Nov 2025 06:49:59 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGLB9VxLqPtw8N0iK7sDC6Oy4PzP87JIwzyu9lVpm6qMtwU7GSsILWnZ4P2uY158ZDJWajpJg==
X-Received: by 2002:a05:600c:46d5:b0:477:4345:7c5c with SMTP id
 5b1f17b1804b1-47773297851mr76175985e9.38.1762786198674; 
 Mon, 10 Nov 2025 06:49:58 -0800 (PST)
Received: from fedora ([85.93.96.130]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4775ce211d8sm338343245e9.11.2025.11.10.06.49.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Nov 2025 06:49:58 -0800 (PST)
Date: Mon, 10 Nov 2025 15:49:57 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: Gavin Shan <gshan@redhat.com>
Cc: Jonathan Cameron <jonathan.cameron@huawei.com>, shan.gavin@gmail.com,
 qemu-arm@nongnu.org, qemu-devel@nongnu.org, mchehab+huawei@kernel.org,
 gengdongjiu1@gmail.com, mst@redhat.com, anisinha@redhat.com,
 peter.maydell@linaro.org, pbonzini@redhat.com
Subject: Re: [PATCH v3 4/8] acpi/ghes: Extend acpi_ghes_memory_errors() to
 support multiple CPERs
Message-ID: <20251110154957.5c481df7@fedora>
In-Reply-To: <cc07dfc9-f58a-4654-8854-c16a2e85fecd@redhat.com>
References: <20251105114453.2164073-1-gshan@redhat.com>
 <20251105114453.2164073-5-gshan@redhat.com>
 <20251105141455.000052f0@huawei.com>
 <cc07dfc9-f58a-4654-8854-c16a2e85fecd@redhat.com>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: mnEx_hRs2-PYnUEoVqZh6FGRp5wCe7Q4NTrgzYoTO9o_1762786199
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

On Thu, 6 Nov 2025 13:15:52 +1000
Gavin Shan <gshan@redhat.com> wrote:

> Hi Jonathan and Igor,
> 
> On 11/6/25 12:14 AM, Jonathan Cameron wrote:
> > On Wed,  5 Nov 2025 21:44:49 +1000
> > Gavin Shan <gshan@redhat.com> wrote:
> >   
> >> In the situation where host and guest has 64KiB and 4KiB page sizes,
> >> one problematic host page affects 16 guest pages. we need to send 16
> >> consective errors in this specific case.
> >>
> >> Extend acpi_ghes_memory_errors() to support multiple CPERs after the
> >> hunk of code to generate the GHES error status is pulled out from
> >> ghes_gen_err_data_uncorrectable_recoverable(). The status field of
> >> generic error status block is also updated accordingly if multiple
> >> error data entries are contained in the generic error status block.
> >>
> >> Signed-off-by: Gavin Shan <gshan@redhat.com>  
> > Hi Gavin,
> > 
> > Mostly fine, but a few comments on the defines added and a
> > question on what the multiple things are meant to mean?
> >   
> 
> Thanks for your review and comments, replies as below.
> 
> >> diff --git a/hw/acpi/ghes.c b/hw/acpi/ghes.c
> >> index a9c08e73c0..527b85c8d8 100644
> >> --- a/hw/acpi/ghes.c
> >> +++ b/hw/acpi/ghes.c
> >> @@ -57,8 +57,12 @@
> >>   /* The memory section CPER size, UEFI 2.6: N.2.5 Memory Error Section */
> >>   #define ACPI_GHES_MEM_CPER_LENGTH           80
> >>   
> >> -/* Masks for block_status flags */
> >> -#define ACPI_GEBS_UNCORRECTABLE         1
> >> +/* Bits for block_status flags */
> >> +#define ACPI_GEBS_UNCORRECTABLE           0
> >> +#define ACPI_GEBS_CORRECTABLE             1
> >> +#define ACPI_GEBS_MULTIPLE_UNCORRECTABLE  2
> >> +#define ACPI_GEBS_MULTIPLE_CORRECTABLE    3  
> > 
> > So this maps to the bits in block status.
> > 
> > I'm not actually sure what these multiple variants are meant to tell us.
> > The multiple error blocks example referred to by the spec is a way to represent
> > the same error applying to multiple places.  So that's one error, many blocks.
> > I have no idea if we set these bits in that case.
> > 
> > Based on a quick look I don't think linux even takes any notice.  THere
> > are defines in actbl1.h but I'm not seeing any use made of them.
> >   
> 
> I hope Igor can confirm since it was suggested by him.
> 
> It's hard to understand how exactly these multiple variants are used from the
> spec. In ACPI 6.5 Table 18.11, it's explained as below.
> 
> Bit [2] - Multiple Uncorrectable Errors: If set to one, indicates that more
> than one uncorrectable errors have been detected.
> 
> I don't see those multiple variants have been used by Linux. So I think it's
> safe to drop them.

even though example describes 'same' error at different components,
the bit fields descriptions doesn't set any limits on what 'more than one' means. 

Also from guest POV it's multiple different pages that we are reporting here
as multiple CPERs.
It seems to me that setting *_MULTIPLE_* here is correct thing to do.


> >> +#define ACPI_GEBS_ERROR_DATA_ENTRIES      4  
> > 
> > This is bits 4-13 and the define isn't used. I'd drop it.
> >   
> 
> The definition is used in acpi_ghes_memory_errors() of this patch. However,
> I don't see it has been used by Linux. This field isn't used by Linux to determine
> the total number of error entries. So I think I can drop it either if Igor is ok.
> 
> Thanks,
> Gavin
> 
> 
> 


