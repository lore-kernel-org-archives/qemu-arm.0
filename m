Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA796C54FDF
	for <qemu-arm@archiver.kernel.org>; Thu, 30 Jul 2026 10:28:06 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wpNzK-0008CR-F3; Thu, 30 Jul 2026 06:27:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1wpNzJ-0008C4-4m
 for qemu-arm@nongnu.org; Thu, 30 Jul 2026 06:27:41 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1wpNzH-0005UE-C2
 for qemu-arm@nongnu.org; Thu, 30 Jul 2026 06:27:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1785407258;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=W8y2sfaXiCYkgQ3HrJ3wLaya96QRcRoNnbVpCPmktsQ=;
 b=MBD3xuPFhknn2hB/XiYjPBP8DCSS5+27ahD+xbwtttwhGiBdFUxg4xnJGtHsXHDVAkDHNW
 JQXcRnzYOMHbMUliqoxuv4GQfuMU2JnkjH7dBkNtNTIFgEBM36IenAh9GWiYII3aXt49Ex
 K8AHF7tiDGapUsmrP8JNWvkFb5IEECM=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-499-4uQjumRmMIG7R9Eb9bhf5A-1; Thu, 30 Jul 2026 06:27:36 -0400
X-MC-Unique: 4uQjumRmMIG7R9Eb9bhf5A-1
X-Mimecast-MFC-AGG-ID: 4uQjumRmMIG7R9Eb9bhf5A_1785407256
Received: by mail-wr1-f71.google.com with SMTP id
 ffacd0b85a97d-47f83999cceso1535273f8f.3
 for <qemu-arm@nongnu.org>; Thu, 30 Jul 2026 03:27:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1785407256; x=1786012056;
 h=in-reply-to:content-disposition:content-type:mime-version
 :references:message-id:subject:cc:to:from:date:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=W8y2sfaXiCYkgQ3HrJ3wLaya96QRcRoNnbVpCPmktsQ=;
 b=UIcQYSGpHZDjG2vjTdFUtUV0u3AZxkjRTHAmliNGmVLLFQqo8jyao2pFSqvTiiQrCw
 /fJBMAqC9RWDjK6jh+q9HfRisTVG8nHNQ1VCcEgffYhooxEQH8SUhBlkRonlD446EHeF
 TWOw+iF3cxwcnx7UUdjNgsXRaZlk+MhYHAyd6jVgGGDk1f9oOpA0xB3TPZkSfdKe5y3W
 NYQtfDHo17Cyx/gquWAuMjJU0014wAgAs5IH3O1MDMS3V5Gd2pB2xNEYMhStDDgo3lPj
 JyF7CnHsiJ175TPyOxn7HvBHHYboR04ga8BLkjzKcJKPeAuAHhZq5GaaMJks2DYHlI7G
 DhCw==
X-Forwarded-Encrypted: i=1;
 AHgh+RruYee7YiQj8CWpRvmCYXwavDpaFNobyCGnvujdJIoGLJXGFdmeXn0NF3zbENKo1Wv4xFUrCK1RMA==@nongnu.org
X-Gm-Message-State: AOJu0YzYCcUnsfWT+O7d6v5KxXSSgc9JtlJVs0Jbxq/jNTmR51Fm572B
 VfVBitWREmGdC8KuqJQT+Oiuet9/BrH9lVsOImvdPRReqYfNnLDd2G6bDMNeNTzYN2xAZfxm4Tb
 H7ceUcUGpfviBfXuMxVbrxmKekmHOaUpiljBnB/hiPELr6nL5As1Cvw==
X-Gm-Gg: AR+sD10cBwHHy5tfRHctc9qJ1hGhXgYUgKpnJxjqCMMDpsud2rNEVTLIlOGMf1r7tbY
 1qHdwpVfCcVuhj+XMT6L4PSxkxdTNe+TCIvzPlS3QHGIWkDYi7fn3BtKjB+f1L37qZWfsZiqmi2
 WbvmCLrHj/mGy+YssIFc9mgbelFd2tXNI0XVgbJj3GS8TlH46BQJU/CsVMbGhq7KiuUa1hvIK02
 sbj8jiVeWXoNzsZ9hAeuTz4Rz3Zly/tL75njQdnyYxqh4x032Eo4x0ImSopNiMfzSHRRWIKMEuN
 ocA1uw0xvurBlwU0BLVOUWz4qurbpqESFdMBff4PStS7oM20VvPu+ujn9WiAMeo46D+H++jnKGV
 fV1KSeRnnXiE+wvp4KrjYgS0=
X-Received: by 2002:a05:6000:706:b0:47f:8ce3:d8f2 with SMTP id
 ffacd0b85a97d-47fc842d33bmr2588431f8f.56.1785407255638; 
 Thu, 30 Jul 2026 03:27:35 -0700 (PDT)
X-Received: by 2002:a05:6000:706:b0:47f:8ce3:d8f2 with SMTP id
 ffacd0b85a97d-47fc842d33bmr2588369f8f.56.1785407255138; 
 Thu, 30 Jul 2026 03:27:35 -0700 (PDT)
Received: from redhat.com (ppp-94-66-118-61.home.otenet.gr. [94.66.118.61])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-47fc88d6e5bsm5166837f8f.3.2026.07.30.03.27.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Jul 2026 03:27:34 -0700 (PDT)
Date: Thu, 30 Jul 2026 06:27:31 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: Gavin Shan <gshan@redhat.com>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org, peterx@redhat.com, philmd@oss.qualcomm.com,
 richard.henderson@linaro.org, alex@shazbot.org, berrange@redhat.com,
 philmd@mailo.com, david@kernel.org, clg@redhat.com,
 pbonzini@redhat.com, phrdina@redhat.com, jugraham@redhat.com,
 liugang24219@sangfor.com.cn, dinghui@sangfor.com.cn, shan.gavin@gmail.com
Subject: Re: [PATCH v5 2/3] system/memory: Use qemu_ram_move() for directly
 accessible regions
Message-ID: <20260730062155-mutt-send-email-mst@kernel.org>
References: <20260728031731.286666-1-gshan@redhat.com>
 <20260728031731.286666-3-gshan@redhat.com>
 <20260729182316-mutt-send-email-mst@kernel.org>
 <CAFEAcA8nxsXNPuqOoc4DGnHbCKQ-pBJib4JhXnYkzMg79GMfAA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAFEAcA8nxsXNPuqOoc4DGnHbCKQ-pBJib4JhXnYkzMg79GMfAA@mail.gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: Rykw64nOJmlhDEDGc4NNO1piC2PNYezya1WZzZs6khA_1785407256
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -36
X-Spam_score: -3.7
X-Spam_bar: ---
X-Spam_report: (-3.7 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.58,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=0.001, SPF_HELO_PASS=-0.001,
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

On Thu, Jul 30, 2026 at 10:24:32AM +0100, Peter Maydell wrote:
> On Wed, 29 Jul 2026 at 23:35, Michael S. Tsirkin <mst@redhat.com> wrote:
> >
> > On Tue, Jul 28, 2026 at 01:17:30PM +1000, Gavin Shan wrote:
> > > +void qemu_ram_move(void *dst, const void *src, size_t n)
> > > +{
> > > +    uintptr_t test, len;
> > > +
> > > +    if (src == dst || n == 0) {
> > > +        return;
> > > +    }
> > > +
> > > +    /*
> > > +     * Maximal length of aligned access that are determined by @src,
> > > +     * @dst and @n
> > > +     */
> > > +    test = (uintptr_t)src | (uintptr_t)dst | n;
> > > +    len = test & -test;
> > > +
> > > +    /* Overlapping buffers, unaligned or oversized access */
> > > +    if (n > 8 || len != n) {
> > > +        memmove(dst, src, n);
> > > +        return;
> > > +    }
> >
> >
> > This part I don't get exactly. It's fine on most arches I think.
> > x86, power...
> >
> > But here is aarch64 for example:
> > https://codebrowser.dev/glibc/glibc/sysdeps/aarch64/memcpy.S.html
> >
> > it says
> >    It uses unaligned accesses and branchless sequences to keep the code small,
> >    simple and improve performance.
> >
> > so if the point is to get rid of unaligned accesses to BARs, are you sure
> > it achieves this?
> 
> The idea is rather just to ignore the unaligned-access-to-not-RAM
> case as "only a theoretical issue" and default it to memmove().
> If anybody reports an actual problem we can think about it then :-)
> 
> -- PMM

Well given the only reported case of virtio DMA into vfio memory we have is
GH100 and that one is mapped MT_NORMAL, I'm fine with that.

I feel extending vfio to report the mapping type to userspace might
not be a bad idea down the road, though. "Directly accessible"
is a very rough approximation to the rich variety of mappings
available across architectures.

-- 
MST


