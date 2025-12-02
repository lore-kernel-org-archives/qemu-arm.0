Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C64D5D116F6
	for <qemu-arm@archiver.kernel.org>; Tue,  2 Dec 2025 12:11:29 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vQPDe-00042l-T4; Tue, 02 Dec 2025 07:11:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1vQPDa-00041U-Do
 for qemu-arm@nongnu.org; Tue, 02 Dec 2025 07:10:54 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1vQPDY-0004HW-05
 for qemu-arm@nongnu.org; Tue, 02 Dec 2025 07:10:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1764677448;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Fr+EeQHaTBBEkfXrUEbvpgr1nkBQ0/G4WMdu4ffGE5U=;
 b=RiZAZCYAuvuRd0AzXu8fcAgSOAJpcBtB9DTwk7M0hb2TLT6j8F1yOx+17nZO3xIHHKG3E6
 FV9Rxr9zrveJNO/D5SqtsjhO5WG14wbU9PUII9+2AarA7jzKUMbOh1+S/++7YTVmTD3rq6
 hM+UmKqf0zgxeV5te73+Nybhoul6PCs=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-166-sZ1TmEAoPpW02ksrTZocRw-1; Tue, 02 Dec 2025 07:10:46 -0500
X-MC-Unique: sZ1TmEAoPpW02ksrTZocRw-1
X-Mimecast-MFC-AGG-ID: sZ1TmEAoPpW02ksrTZocRw_1764677446
Received: by mail-ej1-f72.google.com with SMTP id
 a640c23a62f3a-b70b21e6cdbso379917766b.1
 for <qemu-arm@nongnu.org>; Tue, 02 Dec 2025 04:10:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1764677446; x=1765282246;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=Fr+EeQHaTBBEkfXrUEbvpgr1nkBQ0/G4WMdu4ffGE5U=;
 b=KbdY3g++N5pVNEhvYGrdBD3A2eO6EDCukF2pCi2QMrVIAdiLjjqxB6BAguEHgoNdp1
 gDphdJI940VHHYIPtqkVIn0wp1unZA5VRvHWTqsOmsb37F68zR7+3qkvPr4251VEEJ0u
 8ABN0MIjY2S3iCp2aN4ruYDJUJ1EhZtQDnSawr5tKwg3K1kyDolutDhtEKzcyTPigKAH
 nUt+C2j9z5rb9LYi+ZC/rR2p0XWbU+v8e9Rp6k8N0Jd3fynq3MBPktxxiIiOP7mRfSX1
 D4U9VqfCQ+FqUalIe6ioyCbfwhCh0oh7TW4dMY5zz+VBurX1Ts5LiGsX+F5MYj2od9PW
 OFwg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWWp/3uPVqc1kY8CrUsKBmERnNv7K8mRUacV49d49viPQDaz+xjZQeKgiDgfFfn9Rd1WGUnZuPpRg==@nongnu.org
X-Gm-Message-State: AOJu0YzZepo8eWp71wyPXCOJL+qjysl/75k5AvbMZ0QrddXOKH88P5sw
 ZcV09nA9LhEPs2cJV2jXSY4bd1mIplCgTPuqH1Btdt/ac1ZvQkc8fV7MIdcNEZj4l9NccO9K3JN
 zEdonAVUriCFH2jtnoSe33Gk9TKdQ3mGk8Z/b7oJTwjsPONWE7a9wrg==
X-Gm-Gg: ASbGncvgEJDQLtw9H8Nl3Exff+JG7vhPoN+CkYld+vsHZuq5S2tREU0czlP92jh7jQv
 qON4ujByWj1M9SuMRlcwlw1gefiehQkQzhXRrHhj0u3RJMp0eRaQbuCo4/mkaqrIkDXYyHw7s2E
 hGdg6nRJ22D/9Bwv+Yj/5p8nYUDLf0x77vFsnXokQ3Hzldn2i7DKfW7VPGJvYFXeyuBnlHvWrC7
 zD15Lq0x8e+f/rPvlXCFnLJULs0MegaXK7S8o3HTEnLWpf+uRevu+vIGt8NSnA3dHCtAJz6rApF
 U5gg1fT9iCBhfyL9sHn1iEeTnp4wPU3lYKd1TelO3Pf7OsJzzuaEe1gCjVqHBuIdkMtHDA==
X-Received: by 2002:a17:907:1c12:b0:b76:b791:b58f with SMTP id
 a640c23a62f3a-b79c1fb6ca5mr266877266b.0.1764677445601; 
 Tue, 02 Dec 2025 04:10:45 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEhZJuuYtbtxrJpwyf+ICnXzdNRSt0Nvo1p1tTRrSamPKNeI+X2Go+4aEfRQv2XlSLvb68dJg==
X-Received: by 2002:a17:907:1c12:b0:b76:b791:b58f with SMTP id
 a640c23a62f3a-b79c1fb6ca5mr266874166b.0.1764677445134; 
 Tue, 02 Dec 2025 04:10:45 -0800 (PST)
Received: from imammedo ([213.175.37.14]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b76f519e331sm1522968366b.24.2025.12.02.04.10.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Dec 2025 04:10:44 -0800 (PST)
Date: Tue, 2 Dec 2025 13:10:42 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: Gavin Shan <gshan@redhat.com>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org, jonathan.cameron@huawei.com, armbru@redhat.com,
 mst@redhat.com, anisinha@redhat.com, gengdongjiu1@gmail.com,
 peter.maydell@linaro.org, pbonzini@redhat.com, shan.gavin@gmail.com
Subject: Re: [PATCH 0/5] acpi/ghes: Error object handling improvement
Message-ID: <20251202131042.698612a6@imammedo>
In-Reply-To: <dd43197e-ff56-4adf-a413-03f63d5f5078@redhat.com>
References: <20251127004435.2098335-1-gshan@redhat.com>
 <20251201131729.615abe68@foz.lan>
 <12b7baee-1d6d-440a-a119-971b47d7f3ad@redhat.com>
 <20251201153121.190c22ec@foz.lan>
 <dd43197e-ff56-4adf-a413-03f63d5f5078@redhat.com>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: Ztty_EwcfAWTT30R83y1jjZ9JVVyjFkKryFIHfa0p10_1764677446
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

On Tue, 2 Dec 2025 00:37:53 +1000
Gavin Shan <gshan@redhat.com> wrote:

> Hi Mauro,
> 
> On 12/2/25 12:31 AM, Mauro Carvalho Chehab wrote:
> > On Tue, 2 Dec 2025 00:13:06 +1000
> > Gavin Shan <gshan@redhat.com> wrote:  
> >> On 12/1/25 10:17 PM, Mauro Carvalho Chehab wrote:  
> >>> On Thu, 27 Nov 2025 10:44:30 +1000
> >>> Gavin Shan <gshan@redhat.com> wrote:  
> 
> [...]
> 
> >>>
> >>> Btw, what setup are you using to test memory errors? It would be
> >>> nice to have it documented somewhere, maybe at
> >>> docs/specs/acpi_hest_ghes.rst.
> >>>      
> >>
> >> I don't think docs/specs/acpi_hest_ghes.rst is the right place for that
> >> as it's for specifications.  
> > 
> > Perhaps not, but it would be nice to have it documented somewhere,
> > either there or at QEMU wiki.
> >   
> 
> QEMU wiki may be the best place for it. I never updated to QEMU wiki and
> any guiding steps on how to do that?

do you have an account already?

> 
> >> I'm sharing how this is tested here to make the thread complete.  
> > 
> > Thanks!
> >   
> >>
> >> - Both host and guest has 4KB page size
> >>
> >> - Start the guest by the following command lines
> >>
> >>     /home/gavin/sandbox/qemu.main/build/qemu-system-aarch64                  \
> >>     -accel kvm -machine virt,gic-version=host,nvdimm=on,ras=on               \
> >>     -cpu host -smp maxcpus=8,cpus=8,sockets=2,clusters=2,cores=2,threads=1   \
> >>     -m 4096M,slots=16,maxmem=128G                                            \
> >>     -object memory-backend-ram,id=mem0,size=4096M                            \
> >>     -numa node,nodeid=0,cpus=0-7,memdev=mem0                                 \
> >>     -L /home/gavin/sandbox/qemu.main/build/pc-bios                           \
> >>     -monitor none -serial mon:stdio -nographic                               \
> >>     -gdb tcp::6666 -qmp tcp:localhost:5555,server,wait=off                   \
> >>     -bios /home/gavin/sandbox/qemu.main/build/pc-bios/edk2-aarch64-code.fd   \
> >>     -boot c                                                                  \
> >>     -device pcie-root-port,bus=pcie.0,chassis=1,id=pcie.1                    \
> >>     -device pcie-root-port,bus=pcie.0,chassis=2,id=pcie.2                    \
> >>     -device pcie-root-port,bus=pcie.0,chassis=3,id=pcie.3                    \
> >>        :                                                                     \
> >>     -device pcie-root-port,bus=pcie.0,chassis=16,id=pcie.16                  \
> >>     -drive file=/home/gavin/sandbox/images/disk.qcow2,if=none,id=drive0      \
> >>     -device virtio-blk-pci,id=virtblk0,bus=pcie.1,drive=drive0,num-queues=4  \
> >>     -netdev tap,id=tap1,vhost=true,script=/etc/qemu-ifup,downscript=/etc/qemu-ifdown \
> >>     -device virtio-net-pci,bus=pcie.8,netdev=tap1,mac=52:54:00:f1:26:b0
> >>
> >> - Trigger 'victim -d' in the guest  
> > 
> > Hmm... from where I can get victim?
> >   
> 
> https://git.kernel.org/pub/scm/utils/cpu/mce/mce-test.git
> 
> > Regards,
> > Mauro
> >   
> 
> Thanks,
> Gavin
> 


