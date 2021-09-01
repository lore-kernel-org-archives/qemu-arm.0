Received: by 2002:a19:5205:0:0:0:0:0 with SMTP id m5csp328667lfb;
        Wed, 1 Sep 2021 03:05:27 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyrr66RAtMrub3xF4bGMXEdWBEuJPAEJKEaVN67gm9uGn78SuDO+jiPs02xBAECNPetN5Xy
X-Received: by 2002:a67:3182:: with SMTP id x124mr17696174vsx.51.1630490727535;
        Wed, 01 Sep 2021 03:05:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1630490727; cv=none;
        d=google.com; s=arc-20160816;
        b=a1OasYuxDSAMKqLSn/ih7w0VoO0xG2uOW/F/M2hkC8cg5Eu1dM048ayyFjyHEyhrlv
         mGyzxAuRJF0qcGHYqcUdzfHmaRQmYOoWGHNJEqxEzFmqldP1KBOXbjMjqG/sqvYtSBr9
         DWSIABCP3U8UHcKPgXPSHZpvLhULEBpwekj2zTW3L9Tn4mIcqrUimnN1cb7DFgSyoLV8
         Ko4WZwIG3aUj4DCFWvi865dnTpgClD85bkKgbrZMYJXdIdXIMG0dZFsNe2r9XdiWgHvp
         4CRgNmeiUfOejj/oswwPwMx1UdrkOyvNz5SXlpshI2mrkxFRnyPhcUhOkrobPAAFj7OL
         FXhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:subject:to:from:date
         :dkim-signature;
        bh=Pw997ExCGCQ0m/oMw9ga/N5GyuVoT50ffK4HRp90eIY=;
        b=Z4l8OUK9+1EHbvJQcztsU12ixsa6onCrbKH3LIq4Bv898jWwjnsxY332pY4ZCnAwtN
         AFUOjVVE71E6KqKUr8wEiEZz4ekga1o1mupCherz9ttHMDdNpgh4d+h8ui5Luv2z1jwA
         4+AmEohDBFb1MQMdiOvuxy13Y5vyJ3uCgUN+ZvYLVND/bfDyhKcs7nwf/0ZeJle0+lp4
         txoQ5KOaSHW3jEInt0k2yriTOP0cRf/PyOHxbzUbvfof/OBlWr5gsVev1eD3tcZJ8reB
         jnDJPDHde5FDmGxAeTAGDS4u/vXEJT1lHxByfMtjAsi7+66V+mcVUrT5ciwgFRIa8Wt+
         tg0w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=Awy517HT;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x21si9432772vsk.197.2021.09.01.03.05.27
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 01 Sep 2021 03:05:27 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=Awy517HT;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:50724 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mLN7W-00086J-OO
	for alex.bennee@linaro.org; Wed, 01 Sep 2021 06:05:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37200)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1mLN6W-00085m-5J
 for qemu-arm@nongnu.org; Wed, 01 Sep 2021 06:04:24 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:35699)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1mLN6S-0002fN-Ky
 for qemu-arm@nongnu.org; Wed, 01 Sep 2021 06:04:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630490659;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Pw997ExCGCQ0m/oMw9ga/N5GyuVoT50ffK4HRp90eIY=;
 b=Awy517HTkODXzEBcQ71c67fzSH2Epz4uo7pA10Jz7BShakvKTpG1G3iddym815Sto+4BgE
 h7xfMPhcuwso7ywp1Crvdjj1OyuRXStxRGRHtDYlzHuR6B6B+MwNuK1orMnMyN/wqh7NTT
 XHhuSpiQePNsR/5nXR6jixU/gEzpOss=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-573-9tviHqjfOM-qeduxb_Iy-w-1; Wed, 01 Sep 2021 06:04:15 -0400
X-MC-Unique: 9tviHqjfOM-qeduxb_Iy-w-1
Received: by mail-wm1-f72.google.com with SMTP id
 r4-20020a1c4404000000b002e728beb9fbso2582375wma.9
 for <qemu-arm@nongnu.org>; Wed, 01 Sep 2021 03:04:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Pw997ExCGCQ0m/oMw9ga/N5GyuVoT50ffK4HRp90eIY=;
 b=gXjqj0ZMSMQvYK0n8nRw7JXFY9VvaBtp4Y7Kx/1O5mm5ZJnZuJzLci0rDByssS0JQx
 5hOrbAoKPa1farMEMeMM3Lf6Zu1FcmjRNXDWfb767/xLwaqsbMnaC1IrXCLP5wGe3f78
 QDelmXUvyYU0B4odzOLr+PPK+W3RthrwbkbO1ZTDTeZMKU4VeAEfF3QEn1zLpZLX+snO
 RaGMOBawtK/f2BjXqmv/TmRHhU5Q/x2zPawMxwIaKNZUgNoAhfhmPVPUX5bYwgfo9VrT
 zXAMOQK1XFEeziRRdSJWeILkKLctAp/tmU0+P3ntuswr81hBCwT8vikJMdhDTqm3C1kP
 DkYw==
X-Gm-Message-State: AOAM532zTQOuHw96Tq6F3tMUaIaorQl3h8vdhai38WyF+AEOwc+95hxt
 l8ic5VNzutShFghWU9Ram6bf2u6w88qRIJbwi3SOqpO4NIEFZzS2EQNAw0Vipr/nXyDNYLWvj+A
 cmWVH9Bm88Gtz
X-Received: by 2002:a05:600c:2193:: with SMTP id
 e19mr8861949wme.40.1630490654708; 
 Wed, 01 Sep 2021 03:04:14 -0700 (PDT)
X-Received: by 2002:a05:600c:2193:: with SMTP id
 e19mr8861891wme.40.1630490654290; 
 Wed, 01 Sep 2021 03:04:14 -0700 (PDT)
Received: from localhost (nat-pool-brq-t.redhat.com. [213.175.37.10])
 by smtp.gmail.com with ESMTPSA id h11sm24918057wrx.9.2021.09.01.03.04.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Sep 2021 03:04:13 -0700 (PDT)
Date: Wed, 1 Sep 2021 12:04:12 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH v7 10/10] tests/data/acpi/virt: Update IORT files for ITS
Message-ID: <20210901120412.7bbd27ad@redhat.com>
In-Reply-To: <CAFEAcA_vT5ox=7r245qhNOCBpYz1SGEGPzkWX5gqL=_GAGzD+w@mail.gmail.com>
References: <20210805223002.144855-1-shashi.mallela@linaro.org>
 <20210805223002.144855-11-shashi.mallela@linaro.org>
 <20210901100324.3ce458f6@redhat.com>
 <CAFEAcA_XGk6vh_gZ9wn1Jgu6rf7Ka8TrHnd0WsbDAWgW=67JbQ@mail.gmail.com>
 <20210901110207.13b3e34d@redhat.com>
 <CAFEAcA_vT5ox=7r245qhNOCBpYz1SGEGPzkWX5gqL=_GAGzD+w@mail.gmail.com>
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=imammedo@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.391,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: "Michael S.
 Tsirkin" <mst@redhat.com>, Shashi Mallela <shashi.mallela@linaro.org>,
 Radoslaw Biernacki <rad@semihalf.com>, QEMU Developers <qemu-devel@nongnu.org>,
 Eric Auger <eric.auger@redhat.com>, qemu-arm <qemu-arm@nongnu.org>,
 Leif Lindholm <leif@nuviainc.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ee9Pehtu0Wzl

On Wed, 1 Sep 2021 10:45:43 +0100
Peter Maydell <peter.maydell@linaro.org> wrote:

> On Wed, 1 Sept 2021 at 10:02, Igor Mammedov <imammedo@redhat.com> wrote:
> >
> > On Wed, 1 Sep 2021 09:06:41 +0100
> > Peter Maydell <peter.maydell@linaro.org> wrote:
> >  
> > > On Wed, 1 Sept 2021 at 09:03, Igor Mammedov <imammedo@redhat.com> wrote:  
> > > >
> > > > not directly related to the patch but while I was testing IORT testcase
> > > > (https://github.com/imammedo/qemu acpi-tests)
> > > > after rebase to 6.1, I get test failure due to change in MADT table vs
> > > > expected blobs made in 6.0 time and it does look like ABI change
> > > > (what is bad, it also happens to virt-6.0 machine type).
> > > > Can ARM folks check if we didn't break something?  
> > >  
> > > >  [02Ch 0044   1]                Subtable Type : 0C [Generic Interrupt Distributor]
> > > >  [02Dh 0045   1]                       Length : 18
> > > >  [02Eh 0046   2]                     Reserved : 0000
> > > >  [030h 0048   4]        Local GIC Hardware ID : 00000000
> > > >  [034h 0052   8]                 Base Address : 0000000008000000
> > > >  [03Ch 0060   4]               Interrupt Base : 00000000
> > > > -[040h 0064   1]                      Version : 02
> > > > +[040h 0064   1]                      Version : 03  
> > >
> > > This says the GIC changed from GICv2 to v3. What QEMU command line are  
> > For the test case, I'm more interested in if the rest of numbers are correct for defaut virt machine type.
> >
> > But in case of virt-6.0 we might have problem.
> >  
> > > you using here ?  
> >
> > -machine virt -accel kvm -accel tcg -nodefaults -nographic -drive if=pflash,format=raw,file=pc-bios/edk2-aarch64-code.fd,readonly=on -drive if=pflash,format=raw,file=pc-bios/edk2-arm-vars.fd,snapshot=on -cdrom tests/data/uefi-boot-images/bios-tables-test.aarch64.iso.qcow2 -cpu host -machine virt-6.0
> >                                                                                   ^^^^^^^^  
> 
> With KVM enabled you get "whatever interrupt controller the host has",
> so the configuration is not stable across different host machines. So this
> is not a usable setup to generate or cross-check the ACPI test blobs.
> (It should get you the same configuration across QEMU versions but on
> the same host machine, though.)

Ok, I'll drop IORT test case for now and revisit it once this series is
merged.

> 
> (All the diffs you quote are interrupt-controller related in one way
> or another.)
>
> -- PMM
> 

