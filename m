Received: by 2002:a17:504:d692:b0:1be9:327d:8ee3 with SMTP id na18csp27599njb;
        Tue, 3 Dec 2024 23:53:48 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUNA8ItcSmup5aPk02DGphT2tI/Cood9f81BSX6nKRGl7C+/4SUubm0/1FYMHlPnWlA823pUUCKzbAepA==@linaro.org
X-Google-Smtp-Source: AGHT+IERQfWigCuR3HTz5Dm3OkfIw0vt/7lDI8s/66Q094DwdtZxnJKC7J97pnkIIGvaRvEOXewM
X-Received: by 2002:a05:6102:548e:b0:4af:aabf:56a6 with SMTP id ada2fe7eead31-4afaabf61d4mr2662012137.11.1733298828164;
        Tue, 03 Dec 2024 23:53:48 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1733298828; cv=none;
        d=google.com; s=arc-20240605;
        b=JCBCgDwjV8r3ExoyjfCoWDratFAH/S5sxziTHcqQDLwcQKuAIbRO1bjI2wEIFZOPaU
         Bbkeu6L0LbB/mun+Kyb8ClDZF/s8jkryXCTdjBSBnpoklCCQQtyeO1g2u701t/8lg2dr
         aUFZP8B6VFvVgeXZoQxckDUy+gI4CYzyDD1CvPt4G2bsdWspr72E6rtv21sRPnOoiGdb
         mM97YafCv38NECcwSG8ESMO/TRiQACzcJgX2oMLHM2jPZFimYm+5WhQtwpbBlJtHacsZ
         8jTxcS4XVvtSU+lVE86yubKLo0QaXqAk5PVQpYMOubfSskOsASej/dmBwso6NzMXcQJ2
         WAAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:subject:cc:to:from
         :date:dkim-signature;
        bh=RYEE2cUJrbf/XFzLpBGpI6KUmkH8tKMCJ26xRABAY08=;
        fh=n65LQmJYxgizjZI6fWMaZcyyBB4igajCwQxeHjFFIJA=;
        b=Nlw+XM40Nn0TB5wCazGeKYVvUFJK298n0Rn30snuPK9hv2b1tMQbbE2awRIQBJe4/Y
         KvZ7+uLKy5VGXhIvwOtiliP8yV/pkVPO2MmIDBVzTdl5vblQL2mwv5Vi7R9wR4l6ZdtM
         vZBVp5vxODNyMalce7F5hMy3E095PIJBjk39KTC7GFog0j4S67/pSXHhuHbK6VnhMn09
         gLHljh4He3uOmaWgNv+VlT+nMtNf620H/gZ66FfHSYxXxFsNxEh2UhmFI0bCbskGBrOi
         3F0w5eiM87BP4EzEpxgDoyYyQfo4ZMZXx7LL5CfgBU+o8uYsBe0GhkGOqLsj7M3j2ZPx
         iWhw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=h4Bm708a;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=kernel.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-466c42585easi160137341cf.544.2024.12.03.23.53.48
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 03 Dec 2024 23:53:48 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=h4Bm708a;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=kernel.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1tIkC9-000890-6R; Wed, 04 Dec 2024 02:53:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mchehab+huawei@kernel.org>)
 id 1tIkBH-0007TD-W7; Wed, 04 Dec 2024 02:52:25 -0500
Received: from nyc.source.kernel.org ([147.75.193.91])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mchehab+huawei@kernel.org>)
 id 1tIkBF-00029K-4C; Wed, 04 Dec 2024 02:52:19 -0500
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 15A20A419EF;
 Wed,  4 Dec 2024 07:50:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F28C5C4CED1;
 Wed,  4 Dec 2024 07:52:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1733298732;
 bh=6rcAR5fx634iJHuLmG3RpP1qjECcf4AuZFK+vo0BkYs=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=h4Bm708aGOwWi+sLdeoBl9r2YU87vdRoZ6A1uP2smaNA3Ov57u+rvrYCzwOWjEoA0
 Pn3BCI79QhR+EMfVLApskVeRtEPCKYPLLJfBJRM5Jp+b+eZ9JOs5NkT23zZShE/YX5
 kX/pMa8uti42JCL9M1ZXQ4DUPFg9CWPt1Wc8r+0DbXzSHFqdjD6ot+99Myl115VWJC
 YyPCHgYmzH4F3kNXuyDwv7+BY+OULBQ9tuJpgxQ0DpmK+yJspBTHlq31UfFkXJHvBl
 1P9o2RchNryrXJoBYXlTm5heVJZ2jskqdxyXtvp39YYocn/kff7Y9WfaM2gbXkOdt7
 BE5ElJxo6oXKA==
Date: Wed, 4 Dec 2024 08:52:07 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Cc: Igor Mammedov <imammedo@redhat.com>, Shiju Jose <shiju.jose@huawei.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Ani Sinha <anisinha@redhat.com>,
 Dongjiu Geng <gengdongjiu1@gmail.com>, <linux-kernel@vger.kernel.org>,
 <qemu-arm@nongnu.org>, <qemu-devel@nongnu.org>
Subject: Re: [PATCH v4 08/15] acpi/ghes: make the GHES record generation
 more generic
Message-ID: <20241204085207.0ecae6ae@foz.lan>
In-Reply-To: <20241125115643.00002923@huawei.com>
References: <cover.1732266152.git.mchehab+huawei@kernel.org>
 <b3845a8c78ef36c633d5e20af868de4ed16650a4.1732266152.git.mchehab+huawei@kernel.org>
 <20241125115643.00002923@huawei.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=147.75.193.91;
 envelope-from=mchehab+huawei@kernel.org; helo=nyc.source.kernel.org
X-Spam_score_int: -73
X-Spam_score: -7.4
X-Spam_bar: -------
X-Spam_report: (-7.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-2.996,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: ZUe6brNZxoNx

Em Mon, 25 Nov 2024 11:56:43 +0000
Jonathan Cameron <Jonathan.Cameron@huawei.com> escreveu:

> On Fri, 22 Nov 2024 10:11:25 +0100
> Mauro Carvalho Chehab <mchehab+huawei@kernel.org> wrote:
> 
> > Split the code into separate functions to allow using the
> > common CPER filling code by different error sources.
> > 
> > The generic code was moved to ghes_record_cper_errors(),
> > and ghes_gen_err_data_uncorrectable_recoverable() now contains
> > only a logic to fill the Generic Error Data part of the record,
> > as described at:
> > 
> > 	ACPI 6.2: 18.3.2.7.1 Generic Error Data
> > 
> > The remaining code to generate a memory error now belongs to
> > acpi_ghes_record_errors() function.
> > 
> > A further patch will give it a better name.
> > 
> > Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>  
> 
> One trivial follow up that is enabled by the change you are discussing with Igor.
> Up to you that one.
> 
> Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
> > +
> > +int acpi_ghes_record_errors(uint16_t source_id, uint64_t physical_address)
> > +{
> > +    /* Memory Error Section Type */
> > +    const uint8_t guid[] =
> > +          UUID_LE(0xA5BC1114, 0x6F64, 0x4EDE, 0xB8, 0x63, 0x3E, 0x83, \
> > +                  0xED, 0x7C, 0x83, 0xB1);
> > +    Error *errp = NULL;
> > +    int data_length;
> > +    GArray *block;
> > +
> > +    if (!physical_address) {
> > +        error_report("can not find Generic Error Status Block for source id %d",
> > +                     source_id);
> > +        return -1;
> > +    }  
> 
> With this error check gone (as per discussion with Igor) you could use
> g_autofree to deal with freeing block.
> 
> That would bring the errp check right next to the call that would result
> in errp potentially being set and slightly improve readability.
> 
> Mind you there are no uses of this in hw/acpi currently so maybe this
> isn't a good time to start :)

Yeah, I prefer to not do such cleanup now. As you said, this isn't used
right now at ghes, and there are still two series on the top of it.

IMO, such kind of change should happen afterwards, and checking on
other places were memory is allocated in the driver.

Thanks,
Mauro
