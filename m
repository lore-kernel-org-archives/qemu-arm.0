Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16769CD8CB2
	for <qemu-arm@archiver.kernel.org>; Tue,  9 Jun 2026 16:25:33 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wWzGb-0006iT-4O; Tue, 09 Jun 2026 12:25:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1wWzGZ-0006hz-JF
 for qemu-arm@nongnu.org; Tue, 09 Jun 2026 12:25:27 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1wWzGX-0005YP-9v
 for qemu-arm@nongnu.org; Tue, 09 Jun 2026 12:25:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1781022324;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=c7nlmOv0jY+GRSGZHhUf5P0eWiMNFxPkLVE4FQlgOKU=;
 b=dO9TLT5fIXbaGgr0zIG684XGRnUDkQTlGmEsViuK3Pc5h4zW8APBdGgVv2QfKW5F93O6MG
 oAmVYi0ug/Pj3Vg88wycuT0KOEA5lfbMk1ulwesA7gAwvVulHPjnzrSFvHeWLQigl/2zec
 2RDMDeiqJRw07EGik6PpH7AuxQmgFBo=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-245-FFn_n9LxMjCRuxGxwEwonA-1; Tue, 09 Jun 2026 12:25:21 -0400
X-MC-Unique: FFn_n9LxMjCRuxGxwEwonA-1
X-Mimecast-MFC-AGG-ID: FFn_n9LxMjCRuxGxwEwonA_1781022321
Received: by mail-qt1-f199.google.com with SMTP id
 d75a77b69052e-517b75c1ee3so42421201cf.3
 for <qemu-arm@nongnu.org>; Tue, 09 Jun 2026 09:25:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781022321; x=1781627121;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=c7nlmOv0jY+GRSGZHhUf5P0eWiMNFxPkLVE4FQlgOKU=;
 b=h1UTTavfqLLTTjS9140A/j9aUl8HjGwdvpRatnjgi+NzO9X43XjwgF98saq7vVajBk
 DSksNwiT5NdsR7hJQqLfQ8uJ19X56J+K/AFv48bz7ai/d0SnFu47pKUokyFZ/6RPIA67
 359Z5GIuo4PmNs9k7nGpuTl5iZTHAxql4u5SPHri517RhNB1Q7KXRnEDnQ76sJRn0Yi9
 GM7jL33+JUPaF29rdtPlKc+zHBw6DcsPW84XLNY4LwRSMWmDeSKTz0VIy5Awj1gdBPgX
 Ti4hGCDznNym6w7aC6QKtK2aQzzT8NE22K04Y9LtWeeaCTm4v1I1bGh6AxrYSGh4eYjJ
 nASA==
X-Forwarded-Encrypted: i=1;
 AFNElJ8sqUrpNgHBXTrIhjXuE4BB4tTCnxPN1C2KmG55IzIqADo+6YiSgz0mxS2v51ZUvGzL0cGTMj1Vtw==@nongnu.org
X-Gm-Message-State: AOJu0YxtPZ0pL3QNM80Vh90J7MF50f2V831cU20Nzmv3dbsqkdlBSB6/
 bT4qKqs4mqDgysuyfYatuEOWBs61CfAA7AwBwt8Kp5JjCn0RevBIlV/qpfTmr4eITDD3AdqTa7t
 ePvC2aY5OtmxT22uK/ZC5fBQHeWTPIhEQBazweuiC2HiTacIs5R+xMg==
X-Gm-Gg: Acq92OF8k45wvNlXv4sTJ8YdA1Eq6igUqE61BCHR71YRfRaG2IeX6i59cifmy3uXg6u
 iNGmWboPlkYsB+NVNXzEmwficgbdsvPjrTNM/MQ7MILbU6h8Yvk+OKiD3GqatY9EaMsMj48ydz4
 mL9Brt0bZDBkhAGi2d3Ty1MDlsyMlC4yOBQbsDhaoeIJCWCLijCKc2jK+vgfc35Pwr8HE6kEUl5
 MIOn57tuq5P2qB3fLWijQVcixvMea3yiL4/J9u+cRwtTwnMqkDn2MGcas9EX9/dE8Gv5c4CMHRU
 qovTqWCvW+O+5nDJCgSW+FUOOZ4fH/Xs6tGqsMydrZLQRB5PtmRsShT8qJ2aIUF8+yR8wLmS6kP
 4niMC6IBOLPoVHF86IFlN7XCmFw==
X-Received: by 2002:a05:622a:4c0a:b0:516:e0bc:f485 with SMTP id
 d75a77b69052e-51795bccd78mr306221791cf.30.1781022321210; 
 Tue, 09 Jun 2026 09:25:21 -0700 (PDT)
X-Received: by 2002:a05:622a:4c0a:b0:516:e0bc:f485 with SMTP id
 d75a77b69052e-51795bccd78mr306221081cf.30.1781022320584; 
 Tue, 09 Jun 2026 09:25:20 -0700 (PDT)
Received: from x1.local ([142.189.10.167]) by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-51775da6f41sm185983791cf.22.2026.06.09.09.25.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Jun 2026 09:25:20 -0700 (PDT)
Date: Tue, 9 Jun 2026 12:25:19 -0400
From: Peter Xu <peterx@redhat.com>
To: Gavin Shan <gshan@redhat.com>
Cc: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>,
 qemu-devel@nongnu.org, qemu-arm@nongnu.org, mst@redhat.com,
 jugraham@redhat.com, shan.gavin@gmail.com
Subject: Re: [PATCH RFCv1] virtio: Inherit max bounce buffer size from bus
 parent if possible
Message-ID: <aig-b8zPDGGCfwTY@x1.local>
References: <20260608001821.850921-1-gshan@redhat.com>
 <aiaDgG26a6TUrKuM@redhat.com>
 <07ca74b4-52a8-4187-a57c-7c3277e574d3@redhat.com>
 <aiapywnJY64G7nUK@redhat.com>
 <21664978-9a01-4ff5-8213-5bd5d93750ae@redhat.com>
MIME-Version: 1.0
In-Reply-To: <21664978-9a01-4ff5-8213-5bd5d93750ae@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: SwM3qMBPWp8lRfBDROndh9soQR6ob9t7J74kDVCAFr0_1781022321
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.445,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On Tue, Jun 09, 2026 at 12:08:34PM +1000, Gavin Shan wrote:
> Yeah. Apart from the option of adding a new property to MachineState to disable
> the check on the max bounce buffer size, we also can make this existing option
> "x-max-bounce-buffer-size" official and officially supported by renaming it to
> "max-bounce-buffer-size". Lets see what comments Michael or Peter will have.

IIUC updating max-bounce-buffer-size will be the last resort, because I
don't know how to properly define what is the correct value.  When it's
prefixed with x- it's indeed more problematic..

Two pure questions..

Question 1:

I want to better understand the failure case.  I don't yet understand why
it has anything to do with page size with the parameter.  Say, shouldn't
virtio-blk's DMA requests in form of less-than-page-size, then normally it
should work even for 64k psize (as long as the total of buffers to map goes
beyond 4k)?

Maybe it's because there're a lot of concurrent IOs/DMAs hence it did use
more than that?

Question 2:

Quoting from commit message:

        When the GPU's driver (NVidia open driver) is loaded on guest
        bootup, the memory blocks residing in the PCI BAR can be presented
        to the guest through memory hot-add. The page cache can be
        allocated from the hot added memory blocks when cuda-samples is
        being built. Afterwards, he page cache is sent to QEMU's virtio-blk
        device as part of the DMA request, the bounce buffer is used to
        accomodate the request as the corresponding memory region
        (MemoryRegion) is a RAM DEVICE region in qemu. For this specific
        case, false is returned from memory_access_is_direct() in the path
        where the DMA request is handled.

I don't think I know well in this case, but if you say the PCI bars have
page cache in the back, does it mean that it should be directly accessible?
Maybe it's about this line:

    /*
     * RAM DEVICE regions can be accessed directly using memcpy, but it might
     * be MMIO and access using mempy can be wrong (e.g., using instructions not
     * intended for MMIO access). So we treat this as IO.
     */
    return !memory_region_is_ram_device(mr);

But then my question is if this is a legal case can we loose this check so
that we don't need to use bounce buffers at all.

Thanks,

-- 
Peter Xu


