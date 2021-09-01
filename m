Received: by 2002:a0c:ec8e:0:0:0:0:0 with SMTP id u14csp679169qvo;
        Wed, 1 Sep 2021 02:04:04 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxv6jwR5S47DXn80DMzdmYo+xBkhlvviVejTTO+wUmsvMi/q0wrUuSWEMto7DJ7GxTvLdOH
X-Received: by 2002:a0c:a995:: with SMTP id a21mr27174073qvb.35.1630487044113;
        Wed, 01 Sep 2021 02:04:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1630487044; cv=none;
        d=google.com; s=arc-20160816;
        b=xBUdnkvDasLhIfdQJ0FOtUOeeCAWjcGtc5i27F2wpSpUgRV7VRzxSoaJlSez5HojOb
         KxkoHWDTMF0MhB/X1UzU56nmD0AL+fYdmvJrwMKNYYsmT2mtaweFkqqpoEGMbm1xem9G
         qdUmZA4rUwWzULX4kc1NkZz6mw1S3rfXD3coFIZbxxsBByO3Eq724TjizwCFHfMzAowR
         TL+HZqPFu4KdV244nTctij6j8L5RDpjr0ldCI2SBGtD4PuEfSkq5RaDnrY/oh8avck3f
         xMrwynDVz5+NhJmOQDJ8i0yAywQhlxSCUEbiB9gbMzossC8rCmg0MwAtE++fzT/l8s5K
         u+dA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:subject:to:from:date
         :dkim-signature;
        bh=vjSnyv6DJ3inStop6n6aiBfuhWy3n3aOIJ0s9+9N0WI=;
        b=R0ujBo/YlBrHxBTuOXt7QB6M/Ie/axFQJvVi6DSTK5tkmHPaq5dluktNL49RReeaVZ
         NY+bz/qosDQFloIpxafTTyzJcna76XInpvUBoeMcOFDzEd2KJDk3hVXdkkjVGJ00Awvc
         qwAZsUZ/fCj1PHt5ykOwOEcynhWrpK/78PicciR7SdSAgGFh/0bVRuqhXToD3YnLB1k7
         oQXs3755z7IeSL87VtnNbkTduURMLz7OWVyu76nkAz+gBFTFvP5ilrsNB/DpA50fjrj8
         oQvfgpJ4r9ua5kLeptsS9DmeMEm1yD2IUJkE4CQx+Ie5wtACC9gDOqnaXJvLw+8bi2fo
         XENA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=hGCZFn2q;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f23si9835138qtm.88.2021.09.01.02.04.04
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 01 Sep 2021 02:04:04 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=hGCZFn2q;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:44248 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mLMA7-0006C4-IK
	for alex.bennee@linaro.org; Wed, 01 Sep 2021 05:04:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52254)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1mLM8P-0004LV-Qx
 for qemu-arm@nongnu.org; Wed, 01 Sep 2021 05:02:18 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:39672)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1mLM8N-00006M-Rz
 for qemu-arm@nongnu.org; Wed, 01 Sep 2021 05:02:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630486934;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vjSnyv6DJ3inStop6n6aiBfuhWy3n3aOIJ0s9+9N0WI=;
 b=hGCZFn2qF4prVscdny5VcEIc0UAqLcAp6Cy8KklwJVGGnoz2SgY/WKDxCGEeRzL9B9/F3/
 qkEZqjQm7ssHTVwYJVt9+4M32F/TyXOqUA1NCl68c7gdZ54FF0xQlHBD+UxChSccXGOJvI
 mnq22X6rWutRsMKx130wPsbzs/Y9xag=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-374-miqCr3F7OZODBCNCUtbB1g-1; Wed, 01 Sep 2021 05:02:10 -0400
X-MC-Unique: miqCr3F7OZODBCNCUtbB1g-1
Received: by mail-wr1-f69.google.com with SMTP id
 h6-20020a5d4fc6000000b00157503046afso563960wrw.3
 for <qemu-arm@nongnu.org>; Wed, 01 Sep 2021 02:02:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=vjSnyv6DJ3inStop6n6aiBfuhWy3n3aOIJ0s9+9N0WI=;
 b=on1fcOctBBtUQnQVBrJI4GLZ93bKMJvjlGYIufbYKdx/iuh9EffN6x8icsVQZYCIJO
 1BX3Url5ofE/1mKvZYcTqjXVApxMjGpOlo0IkRic/tXKxxXO1pGL/UQr891TaFa1vEZP
 HR3dhpYkppegpoXZpZ7f4V+kvijsfQK0nklglLqEgbCkWGTJFeevm1p0PTjwoy1Ml3OM
 y/Bg+VFYttrauWbtV8+c2r101gColnJ235bS/Y5+6CpWZPYklt9e7qI5iYysAMjYm0oi
 V9+AXvPNoqGETUBiWvHKHxFT6IIDZpJV71ydocWLkJnnjMe2X4Ho3YOWZunHkbreX5uB
 z23g==
X-Gm-Message-State: AOAM530fV5AAPODhFQGtfhzjmkpnthVQ64hwjdmVp12cYjzXve2SgXZJ
 8N8+YPN4jb+0q3SJ6UjakdQYVeFC00ffhlGC9aKH6agmLr9q3AROZiDv8agzKX1fIvyS2MUKdTD
 gQSxN/5dy1JE6
X-Received: by 2002:a05:600c:2295:: with SMTP id
 21mr8664747wmf.84.1630486929180; 
 Wed, 01 Sep 2021 02:02:09 -0700 (PDT)
X-Received: by 2002:a05:600c:2295:: with SMTP id
 21mr8664720wmf.84.1630486928901; 
 Wed, 01 Sep 2021 02:02:08 -0700 (PDT)
Received: from localhost (nat-pool-brq-t.redhat.com. [213.175.37.10])
 by smtp.gmail.com with ESMTPSA id d124sm4731093wmd.2.2021.09.01.02.02.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Sep 2021 02:02:08 -0700 (PDT)
Date: Wed, 1 Sep 2021 11:02:07 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH v7 10/10] tests/data/acpi/virt: Update IORT files for ITS
Message-ID: <20210901110207.13b3e34d@redhat.com>
In-Reply-To: <CAFEAcA_XGk6vh_gZ9wn1Jgu6rf7Ka8TrHnd0WsbDAWgW=67JbQ@mail.gmail.com>
References: <20210805223002.144855-1-shashi.mallela@linaro.org>
 <20210805223002.144855-11-shashi.mallela@linaro.org>
 <20210901100324.3ce458f6@redhat.com>
 <CAFEAcA_XGk6vh_gZ9wn1Jgu6rf7Ka8TrHnd0WsbDAWgW=67JbQ@mail.gmail.com>
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=imammedo@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=imammedo@redhat.com;
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
X-TUID: Sd+mg6uow7Go

On Wed, 1 Sep 2021 09:06:41 +0100
Peter Maydell <peter.maydell@linaro.org> wrote:

> On Wed, 1 Sept 2021 at 09:03, Igor Mammedov <imammedo@redhat.com> wrote:
> >
> > not directly related to the patch but while I was testing IORT testcase
> > (https://github.com/imammedo/qemu acpi-tests)
> > after rebase to 6.1, I get test failure due to change in MADT table vs
> > expected blobs made in 6.0 time and it does look like ABI change
> > (what is bad, it also happens to virt-6.0 machine type).
> > Can ARM folks check if we didn't break something?  
> 
> >  [02Ch 0044   1]                Subtable Type : 0C [Generic Interrupt Distributor]
> >  [02Dh 0045   1]                       Length : 18
> >  [02Eh 0046   2]                     Reserved : 0000
> >  [030h 0048   4]        Local GIC Hardware ID : 00000000
> >  [034h 0052   8]                 Base Address : 0000000008000000
> >  [03Ch 0060   4]               Interrupt Base : 00000000
> > -[040h 0064   1]                      Version : 02
> > +[040h 0064   1]                      Version : 03  
> 
> This says the GIC changed from GICv2 to v3. What QEMU command line are
For the test case, I'm more interested in if the rest of numbers are correct for defaut virt machine type.

But in case of virt-6.0 we might have problem.

> you using here ?

-machine virt -accel kvm -accel tcg -nodefaults -nographic -drive if=pflash,format=raw,file=pc-bios/edk2-aarch64-code.fd,readonly=on -drive if=pflash,format=raw,file=pc-bios/edk2-arm-vars.fd,snapshot=on -cdrom tests/data/uefi-boot-images/bios-tables-test.aarch64.iso.qcow2 -cpu host -machine virt-6.0
                                                                                  ^^^^^^^^

it's running on aarch64 host with kvm enabled to test IORT table.

> 
> -- PMM
> 

