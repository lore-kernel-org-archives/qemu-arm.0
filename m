Received: by 2002:a17:505:7d82:b0:1be9:327d:8ee3 with SMTP id wv2csp168665njc;
        Tue, 12 Nov 2024 22:58:13 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCX+wKlc9jbK119dJmEnmIsjY+BsW/9dzwXhCbHk0FW3a9KfI6HHAgtmm2P/KZm1SJpi6sTOtAywRVQ3qA==@linaro.org
X-Google-Smtp-Source: AGHT+IFp39WLkG02/khwMzfFaWJq0yaOXsjkqE+MybT9MHLDecCpAqS03nGbnl4vwrHPbs4SOZeA
X-Received: by 2002:a05:622a:1907:b0:462:fef1:e1f5 with SMTP id d75a77b69052e-4630935bfcamr283746541cf.26.1731481093840;
        Tue, 12 Nov 2024 22:58:13 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1731481093; cv=none;
        d=google.com; s=arc-20240605;
        b=IoyzWYAE0z8+eAmMXjjKrwbzJJGIXO0XyH+q4uxH4eDWwGmlfHD33Wm2KVEFMlI4cB
         FGUw02dGmkgaXga6SQ6oUaxUbFT+zQ697cwsQvnBW9cnpH7KCTyGuO6ghObS1MwcLLgA
         zZhvn+Ip6fGTWe8HGyI9Qrv5Do4TXq8F9q//yMapBnyjIQZSa8PuMme/OexDSzWbGueY
         vXoKHU5a8OkzudCnWmVsOMUbpvdm6IqnoL2ifXuOF9qcIJTGVcTWmrFrbcgJj0lk3ZS1
         BXolBbSmiGHfiMF4jpBfeXBF/hMPCBAB2a1TQE6Wq5u8DJq1Ecz5tkuv5ZqJzRyWK6X5
         tcmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:subject:cc:to:from
         :date:dkim-signature;
        bh=+DLCuQ4TBnIZvG04PDGO3+srUwn554XHvQXkMqP4Ie0=;
        fh=6D/6VQq5Q+Zja9Q7yYPz2cBlGUpAFsxG9UYP7RraElc=;
        b=NV17uF1MlBVSVAPMMtKCINCq0ayfP2VP5YzhsbSlsGxO6ytmpPkm5m5jRz0BDsX1g7
         4r4xOXiC10RiKjRPQV5QHENMj/ovBPLMOKOohSD4gyWrxpIfXuiJYgYt/ZP8AZjuhqfh
         GvQM/ol7cVkhhA2PdFq87u2bScppeKk+SnbQKUqRLD1pZOEO5Z9n7wTvmFSFYcEp8HaO
         3NRxcVzAyDiD2vzKiaJgpd3SrfXcVyGdoO2mGwzay47hh3OGmzqZZ2HX4P4SCGdY471E
         FRdU9qAChPoMxmdOCnRe5vGsFhAJ2oAKGw85cCCtpkO26jJTqzXuzntGRCcYKV8r0/5/
         J+Vg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b="CIFEoDX/";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=kernel.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-462ff61afa6si160756861cf.414.2024.11.12.22.58.13
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 12 Nov 2024 22:58:13 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b="CIFEoDX/";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=kernel.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tB7KL-0005qM-Al; Wed, 13 Nov 2024 01:58:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mchehab+huawei@kernel.org>)
 id 1tB7KH-0005pr-Hl; Wed, 13 Nov 2024 01:58:05 -0500
Received: from dfw.source.kernel.org ([139.178.84.217])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mchehab+huawei@kernel.org>)
 id 1tB7KF-0003ex-Qs; Wed, 13 Nov 2024 01:58:05 -0500
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id CE3F45C55D8;
 Wed, 13 Nov 2024 06:57:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 52827C4CED2;
 Wed, 13 Nov 2024 06:57:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1731481081;
 bh=iL8xR6/fZyknPIirBu4QmU0cQpDTBqHhpvaeoBMFPfM=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=CIFEoDX/sMGcGk+EAxEN9ElyA7m5RMLS4h1tFblCR7xKd2EutpmZoN387f+Kc1/WC
 Bf6weZD6MWlVAvsICyHXLrH288PV65jn4Z8ta5OKoSztK/xad1+nvmt59MS8HELzF/
 DIVZQW9v9P1iMKQHTmORWi/iAyrYEkuQhGdOd2j41gheMZMsZRomrXofVT9aqclkuB
 k+OUc2PDclOfQSsizEGmwsQZD44DYRg8nI59sAHnnuYFdjIjIDZOIZ6MoFSEZFULD1
 TwZet7nltCCtWdtF7qIao+rd2YtvNcL5JVY0TD09H54lAKNRgwm0Ba/Nlts02ip5rB
 6j8qIKDhCdObQ==
Date: Wed, 13 Nov 2024 07:57:56 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Igor Mammedov <imammedo@redhat.com>
Cc: Jonathan Cameron <Jonathan.Cameron@huawei.com>, Shiju Jose
 <shiju.jose@huawei.com>, Philippe =?UTF-8?B?TWF0aGlldS1EYXVkw6k=?=
 <philmd@linaro.org>, Ani Sinha <anisinha@redhat.com>, Dongjiu Geng
 <gengdongjiu1@gmail.com>, Peter Maydell <peter.maydell@linaro.org>, Shannon
 Zhao <shannon.zhaosl@gmail.com>, Yanan Wang <wangyanan55@huawei.com>, Zhao
 Liu <zhao1.liu@intel.com>, qemu-arm@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [PATCH RFC 0/5] Change ghes driver to use HEST-based offsets
Message-ID: <20241113075756.370c5056@foz.lan>
In-Reply-To: <20241113075418.5fa1ac61@foz.lan>
References: <cover.1727782588.git.mchehab+huawei@kernel.org>
 <20241002154534.3c58db06@imammedo.users.ipa.redhat.com>
 <20241113075418.5fa1ac61@foz.lan>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=139.178.84.217;
 envelope-from=mchehab+huawei@kernel.org; helo=dfw.source.kernel.org
X-Spam_score_int: -71
X-Spam_score: -7.2
X-Spam_bar: -------
X-Spam_report: (-7.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.122,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_HI=-5, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
 RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001, SPF_HELO_NONE=0.001,
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
X-TUID: Zbns+XwGQX3E

Em Wed, 13 Nov 2024 07:54:18 +0100
Mauro Carvalho Chehab <mchehab+huawei@kernel.org> escreveu:

> Em Wed, 2 Oct 2024 15:45:34 +0200
> Igor Mammedov <imammedo@redhat.com> escreveu:
> 
> > On Tue,  1 Oct 2024 13:42:45 +0200
> > Mauro Carvalho Chehab <mchehab+huawei@kernel.org> wrote:
> >   
> > > This RFC series was part of the previous PR to add generic error injection
> > > support on GHES.
> > > 
> > > It contains only the changes of the math used to calculate offsets at
> > > HEST table and hardware_error firmware file.
> > > 
> > > The first patch adds a new firmware file to store HEST address.
> > > The second patch makes use of it.
> > > The remaining ones add migration support.
> > > 
> > > PS.: I'm sending this as a RFC as using the proceudure defined at the
> > > pseudo-migration of:
> > > 
> > > 	https://www.linux-kvm.org/page/Migration
> > > 
> > > Didn't work. I tried to use two different QEMU versions to check a
> > > real life case and also to use just one QEMU and trying to load a
> > > virt-9.1 state on a virt-9.2 machine. 
> > > 
> > > For instance, trying to restore a virt-9.1 state on virt-9.2 gave me
> > > this error:
> > > 
> > > 	(qemu) qemu: Machine type received is 'virt-9.1' and local is 'virt-9.2'
> > > 	qemu: load of migration failed: Invalid argument    
> > 
> > that's expected (idea is to keep machine type (virt-X) ABI stable so
> > it would work the same way on old and new QEMU)
> > migration is meant to move VM of the same machine type to a new/another QEMU instance.  
> 
> I found a couple of issues and, after the fixes, it can successfully
> migrate both virt-9.1 and virt-9.2 machines. 
> 
> > 
> > i.e try migrate 
> > 
> > qemu-9.1 -M virt-9.1  => qemu-9.2 -M virt-9.1
> > and vice-versa
> > migration should succeed and memory error injection should still work
> > the old way in both instances (I don't recall anymore how to simulate SEA,
> > perhaps original author left a description how to do that somewhere on mail-list).  
> 
> Those work as well, but I had to pass -cpu cortex-a57 to both 9.1
> and 9.2, as using -cpu max caused qemu to refuse loading the guest.
> 
> I tested with both:
> 
> 	qemu-9.1 -M virt-9.1 -cpu cortex-a57 => qemu-9.2 -M virt-9.1 -cpu cortex-a57
> 	qemu-9.2 -M virt-9.1 -cpu cortex-a57 => qemu-9.1 -M virt-9.1 -cpu cortex-a57

Forgot to mention, but I modified qemu-9.1 to use GPIO instead of SEA, as
it is a lot easier to do the tests using the error injection logic.
Also, I don't know how to test SEA errors.

> I'll address your other comments to the series and post a new version
> today.
> 
> Thanks,
> Mauro



Thanks,
Mauro
