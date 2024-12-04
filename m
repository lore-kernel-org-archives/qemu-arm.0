Received: by 2002:a17:504:d692:b0:1be9:327d:8ee3 with SMTP id na18csp53157njb;
        Wed, 4 Dec 2024 00:57:17 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXwuId0zgDHHjfkNYZX0LzgovMwlFu+aYMutyk67IF6Htlm1nZ48qW080F9c2UTD9QO27EmV6kFPOfumw==@linaro.org
X-Google-Smtp-Source: AGHT+IGojDNPCGbx810Htdvyfx4Dj4Lw6bcuNpcdzcEV9/01s+a6QFQpuWmoLA2b9g9LoLN4OJqu
X-Received: by 2002:ad4:5ecb:0:b0:6d8:9c92:654a with SMTP id 6a1803df08f44-6d8b72e351cmr91178736d6.10.1733302636998;
        Wed, 04 Dec 2024 00:57:16 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1733302636; cv=none;
        d=google.com; s=arc-20240605;
        b=abk7UedgoiJx7KD7xPzT8CB23gq929ASOgmvdJSTr6ahla++kNTcNvLUPXmDTP4UsD
         Osn7FnpSyNY3JuV0R/O+AQZrf9/0F5NuAykSuBaKpJ8rz4i5oS+ECI9ucKUuK5Frehkx
         rocAtq+a0kxKfeAXk2ostmr/UZ9NbENeIYNXBJeNSKN3VgdCJkA/a0xq1ASDkf5qQVik
         zVNeAcY80xQ3zVLCeyI0AA8WhAEbyPgD998yqMlkssR4s4CVAyeKot/qRSIwAE2vYtQ4
         Jb7+wbeDEuH0z8nqMkOyoN8TZUk4qdF0BcfW1XDD0stAeFeXbiFjAgpd3mzcP27khXXV
         ZNiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:subject:cc:to:from
         :date:dkim-signature;
        bh=a2AX86uk35KIXf2uhnZ/NS1IITifF9Ggzs59Bjni/Pc=;
        fh=AJ8hn4ioKJA5lsG3NCMNx8yhntdFUmRi9f6dN5eYbeg=;
        b=hdwY9PQMM/rtDkIAerSVrlSy6/rEqhabU/OoELUHY1IexUyJpdbP7Try9lR7cHF3th
         L3KlZWancsCB4rlbjD/7UWl2DpZLUloeL9Jr8zrCdimC8AaHkrubBwHb+XoNNmZUm/8Z
         +5vhrK2pi4CYUO7FZ6KaNdRsjvOoVqstG8Xwyx2eQ/KeJvEGAJ1ejF3uc+9S8iLczYNb
         4+1R8cOlQwsfPV3axG/yLyL4xbOnbUk69sclmHtrwmU1doSnULu7TGCUyKMPMK58Al08
         YWvBDAL13LpdZf0cwvoNzqjo9Baah+BBzqzzQAMtqjrJd/m9sWzEhJRm38yFgGulg+mN
         G7gA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=sZUMJfIC;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=kernel.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7b6849490a7si1620506085a.203.2024.12.04.00.57.16
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 04 Dec 2024 00:57:16 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=sZUMJfIC;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=kernel.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tIlBi-0007Hr-AE; Wed, 04 Dec 2024 03:56:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mchehab+huawei@kernel.org>)
 id 1tIlBe-0007HW-Qq; Wed, 04 Dec 2024 03:56:47 -0500
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mchehab+huawei@kernel.org>)
 id 1tIlBc-0007XI-22; Wed, 04 Dec 2024 03:56:45 -0500
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id A96D6A41CAC;
 Wed,  4 Dec 2024 08:54:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 86E0DC4CED1;
 Wed,  4 Dec 2024 08:56:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1733302600;
 bh=Yxjz03f7YodAcFNWgPYlbjlPTqBBEgCdSqNH6Yu1n2I=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=sZUMJfICmSw5hLZaZVsxoyreIQxAXAfsqxhGH2q5GCKVHhhQzOW4rRXiubXGWxw9s
 /xkk6fq4A1MHnBkN9nl6LsX4K8uTKr/DBDBjHOlpWpo27ps6+CH+AyMgT2K8uCHUZF
 g1F+D2S/lsJOemrBKaGI9c9XCK2EUr01B6jjxee+N0mgEfogSz/r+vRSzwFFl4tgxw
 xqjrft2V/MMxEd7A6BPR2fcoONzZreez4Rxp98+r5hA3mydQOSpxwxLTJk2cSz5cqj
 TBSMjR3iiNp5Nu1dxEmEToGS8PmhqBeDHlBQ/JmkCb0hJiN/z+FhkkIKAhDsOPAnt8
 tBLZ8o3NaBLOQ==
Date: Wed, 4 Dec 2024 09:56:35 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Igor Mammedov <imammedo@redhat.com>
Cc: Jonathan Cameron <Jonathan.Cameron@huawei.com>, Shiju Jose
 <shiju.jose@huawei.com>, "Michael S. Tsirkin" <mst@redhat.com>, Ani Sinha
 <anisinha@redhat.com>, Dongjiu Geng <gengdongjiu1@gmail.com>,
 linux-kernel@vger.kernel.org, qemu-arm@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [PATCH v4 13/15] acpi/ghes: move offset calculus to a separate
 function
Message-ID: <20241204095635.512a44d5@foz.lan>
In-Reply-To: <20241204085440.4640a476@imammedo.users.ipa.redhat.com>
References: <cover.1732266152.git.mchehab+huawei@kernel.org>
 <e5661a6383449675b28e15c8479ebca42c939368.1732266152.git.mchehab+huawei@kernel.org>
 <20241203125143.7171892a@imammedo.users.ipa.redhat.com>
 <20241203144730.47b8ca86@foz.lan>
 <20241204085440.4640a476@imammedo.users.ipa.redhat.com>
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
X-TUID: MNUWInOXRww7

Em Wed, 4 Dec 2024 08:54:40 +0100
Igor Mammedov <imammedo@redhat.com> escreveu:

> On Tue, 3 Dec 2024 14:47:30 +0100
> Mauro Carvalho Chehab <mchehab+huawei@kernel.org> wrote:
> 
> > Em Tue, 3 Dec 2024 12:51:43 +0100
> > Igor Mammedov <imammedo@redhat.com> escreveu:
> >   
> > > On Fri, 22 Nov 2024 10:11:30 +0100
> > > Mauro Carvalho Chehab <mchehab+huawei@kernel.org> wrote:
> > >     
> > > > Currently, CPER address location is calculated as an offset of
> > > > the hardware_errors table. It is also badly named, as the
> > > > offset actually used is the address where the CPER data starts,
> > > > and not the beginning of the error source.
> > > > 
> > > > Move the logic which calculates such offset to a separate
> > > > function, in preparation for a patch that will be changing the
> > > > logic to calculate it from the HEST table.
> > > > 
> > > > While here, properly name the variable which stores the cper
> > > > address.
> > > > 
> > > > Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
> > > > Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
> > > > ---
> > > >  hw/acpi/ghes.c | 41 ++++++++++++++++++++++++++++++++---------
> > > >  1 file changed, 32 insertions(+), 9 deletions(-)
> > > > 
> > > > diff --git a/hw/acpi/ghes.c b/hw/acpi/ghes.c
> > > > index 87fd3feedd2a..d99697b20164 100644
> > > > --- a/hw/acpi/ghes.c
> > > > +++ b/hw/acpi/ghes.c
> > > > @@ -364,10 +364,37 @@ void acpi_ghes_add_fw_cfg(AcpiGhesState *ags, FWCfgState *s,
> > > >      ags->present = true;
> > > >  }
> > > >  
> > > > +static void get_hw_error_offsets(uint64_t ghes_addr,
> > > > +                                 uint64_t *cper_addr,
> > > > +                                 uint64_t *read_ack_register_addr)
> > > > +{      
> > > 
> > >     
> > > > +    if (!ghes_addr) {
> > > > +        return;
> > > > +    }      
> > > 
> > > why do we need this check?    
> > 
> > It is a safeguard measure to avoid crashes and OOM access. If fw_cfg 
> > callback doesn't fill it properly, this will be zero.  
> 
> shouldn't happen, but yeah it firmware job to write back addr
> which might happen for whatever reason (a bug for example).
>

The main reason I added it is that, after the second series, it could 
also happen if there's something wrong with the backward compat logic.

So, both here and after switching to HEST-based offsets, I opted
to explicitly test.

> Perhaps push this up to the stack, so we don't have to deal
> with scattered checks in ghes code.
> 
> kvm_arch_on_sigbus_vcpu() looks like a goo candidate for check
> and warn_once if that ever happens.
> It already calls acpi_ghes_present() which resolves GED device
> and then later we duplicate this job in ghes_record_cper_errors()
> 
> so maybe rename acpi_ghes_present to something like AcpiGhesState* acpi_ghes_get_state()
> and call it instead. And then move ghes_addr check/warn_once there.
> This way the rest of ghes code won't have to deal handling practically
> impossible error conditions that cause reader to wonder why it might happen.

I'll look on it. Yet, if ok for you, I would prefer dealing with this
once we have a bigger picture, e.g. once we merge those tree series:

	- cleanup series (this one);
	- HEST offset (I'll be sending a new version today);
	- error_inject.

Thanks,
Mauro
