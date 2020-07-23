Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp1673585lfm;
        Thu, 23 Jul 2020 05:47:05 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzNwVG3jfNGKgBkP0Vjkl/5w7XMDlHKYDodeNoRXWsh5vk2z6ACTSAGO7gqUBamHXMa8SJ5
X-Received: by 2002:a25:b747:: with SMTP id e7mr5759921ybm.479.1595508424999;
        Thu, 23 Jul 2020 05:47:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1595508424; cv=none;
        d=google.com; s=arc-20160816;
        b=aOK8WVaYCd5J8JAPOD7GO68v2ZYehDQNyNT8bExWmVMev9uhqDK/Q+h8vgFV3afsdL
         azCqJ2Ne+pc+/UOK2Qz4inQijjh1qm572DAQL/5P9mTJcAXLlGbsrc+MRjLTAGfWnE8r
         xJdRxpX6dgY7q2ySN6LcWoCdZywCcynp8LJ14ysrMBGXskpoYa8QQAWQIpfoquZA9hc3
         JmyYyEd+XrxpxnQnoC5Y8ty9+Au85U13v3rygzhE3FVB5V0Qc/RBh7GuosG9J7qUT3Ub
         ayVG4xeDh/qgs/lz9Yrrn9ewftl6MwLCHv2t4etKxxJ3dap7FE5EzUiTIzrgObN+AJ54
         moDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-disposition
         :content-transfer-encoding:in-reply-to:mime-version:references
         :message-id:subject:to:from:date:dkim-signature;
        bh=mqDjNoa40RQ2D/QJ8iMwYzddlX+gaK+RJ2wPh7ag0A8=;
        b=zXVXz9+9WRGr3GYxnBu1FgnDKCITFQSWzJ9uHw1CBJA+76amZRzLWCJrr3t8tCnDIe
         4/49Zs/E/bxe3b1DgBIvihZVr9O+FAjFfU2cjfFKPdw6lP1+CAiMeUY/Pi63yxzlGPCG
         BPkesS2PbtgBT+PKKloLdJYR15X/Zy9cu7D/ZbjCh61cXFJ+zPMexblqSz73PV4/nLTK
         v3i0ot0efGNzZijL4slcI/j1u2tEe8MCS/eJptmTAjypE5/2M121GOs/VSDaOYyZhw8j
         QaH1qfcKsxIYYBJZ9xvgEx1tl5ogp8LLmPv8JctC5gRTKlEVyDKbO/P39rsmIvyd714p
         uz0A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=Dbpill+s;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y14si2772618ybk.315.2020.07.23.05.47.04
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 23 Jul 2020 05:47:04 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=Dbpill+s;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:40816 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jyacq-0007Hb-8i
	for alex.bennee@linaro.org; Thu, 23 Jul 2020 08:47:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40236)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1jyaci-0007Fk-6T
 for qemu-arm@nongnu.org; Thu, 23 Jul 2020 08:46:56 -0400
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:59583
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1jyacf-0006Rp-TF
 for qemu-arm@nongnu.org; Thu, 23 Jul 2020 08:46:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1595508412;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mqDjNoa40RQ2D/QJ8iMwYzddlX+gaK+RJ2wPh7ag0A8=;
 b=Dbpill+sef74IxbyndWK2DfF/DyswY7XBk4ByWPzmZOiv1ucpQ19fJz7bNTA5M8UHSJC+c
 OUnmWVThzB/vrEFolw67/erd4UQqURxVR8wJEvKE5Df3Lfp1if2nKNuNRa1HZT+931qCkE
 Ad42aYhU2V1iyw17jKHe5KQbgmMv++o=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-204-ykOCh_VJPOaPCr7n94r-kg-1; Thu, 23 Jul 2020 08:46:50 -0400
X-MC-Unique: ykOCh_VJPOaPCr7n94r-kg-1
Received: by mail-wm1-f69.google.com with SMTP id x8so1854166wmk.2
 for <qemu-arm@nongnu.org>; Thu, 23 Jul 2020 05:46:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=bfHlCQjilkZPoVtutIeW5pxlXzKAg6whEOZgejSpOPU=;
 b=AD4qZrKnIL9s2GtC/Uy3GyhczGXEkHne3KG+VHL7B+joZNLqXMT9JTWJ72Vp2HZTPn
 naTuzaUO8fLTyjEje41BIs8MH+/dhQ+khZH7XxQUyBcRRAk1ffqFubPn8e+JH9aBPL8t
 UYiD4P4DUFkd0hT/24SlUqDj8uFqsftYkLGhD8j1Ii4DG9ljdolU424Dp83QIJIUARBH
 LmYPN4SU4Uj5tUOa1mTD3ioHaPACgwojzyWAyKO/adpXG7GhTSwBC+clkuJ8GktsVIyY
 v/HwBs/AAW6pflD2j1wKlD3KfvYr+h9yEsmXApdeUfE8Sw+Cc+sPaosU+mis5+FumTrn
 VNIQ==
X-Gm-Message-State: AOAM533gASEBZtVfl5pBMUexxilDoIw+trmd6c7WyiX3g+IisSAALdsj
 zyW1vh1fnxq0he68mUUc0gfA3to9Kjp4uPFf1V/NMc4QDRoazppB+Rs2+qgVDvFphe8h0hM09Jg
 yjMMFBbYlHtUu
X-Received: by 2002:a05:600c:21ca:: with SMTP id
 x10mr3950842wmj.63.1595508409475; 
 Thu, 23 Jul 2020 05:46:49 -0700 (PDT)
X-Received: by 2002:a05:600c:21ca:: with SMTP id
 x10mr3950808wmj.63.1595508409137; 
 Thu, 23 Jul 2020 05:46:49 -0700 (PDT)
Received: from redhat.com (bzq-79-179-105-63.red.bezeqint.net. [79.179.105.63])
 by smtp.gmail.com with ESMTPSA id p14sm3848125wrx.90.2020.07.23.05.46.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Jul 2020 05:46:48 -0700 (PDT)
Date: Thu, 23 Jul 2020 08:46:45 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: =?iso-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>
Subject: Re: [PATCH] acpi: Fix access to PM1 control and status registers
Message-ID: <20200723084554-mutt-send-email-mst@kernel.org>
References: <20200701110549.148522-1-anthony.perard@citrix.com>
 <20200701075914-mutt-send-email-mst@kernel.org>
 <20200701124836.GD2030@perard.uk.xensource.com>
 <20200702063310-mutt-send-email-mst@kernel.org>
 <0a9c7f42-c6e3-4103-febc-3811319341d9@kaod.org>
MIME-Version: 1.0
In-Reply-To: <0a9c7f42-c6e3-4103-febc-3811319341d9@kaod.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Content-Disposition: inline
Received-SPF: pass client-ip=205.139.110.61; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/23 02:33:29
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-1, SPF_HELO_NONE=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Andrew Jeffery <andrew@aj.id.au>,
 Alistair Francis <alistair@alistair23.me>, qemu-devel@nongnu.org,
 "open list:ASPEED BMCs" <qemu-arm@nongnu.org>,
 =?iso-8859-1?Q?Herv=E9?= Poussineau <hpoussin@reactos.org>,
 Joel Stanley <joel@jms.id.au>, pbonzini@redhat.com,
 Anthony PERARD <anthony.perard@citrix.com>,
 Igor Mammedov <imammedo@redhat.com>, "open list:PReP" <qemu-ppc@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 7gr4GShuVOU+

On Thu, Jul 16, 2020 at 11:05:06AM +0200, Cédric Le Goater wrote:
> On 7/2/20 1:12 PM, Michael S. Tsirkin wrote:
> > On Wed, Jul 01, 2020 at 01:48:36PM +0100, Anthony PERARD wrote:
> >> On Wed, Jul 01, 2020 at 08:01:55AM -0400, Michael S. Tsirkin wrote:
> >>> On Wed, Jul 01, 2020 at 12:05:49PM +0100, Anthony PERARD wrote:
> >>>> The ACPI spec state that "Accesses to PM1 control registers are
> >>>> accessed through byte and word accesses." (In section 4.7.3.2.1 PM1
> >>>> Control Registers of my old spec copy rev 4.0a).
> >>>>
> >>>> With commit 5d971f9e6725 ("memory: Revert "memory: accept mismatching
> >>>> sizes in memory_region_access_valid""), it wasn't possible anymore to
> >>>> access the pm1_cnt register by reading a single byte, and that is use
> >>>> by at least a Xen firmware called "hvmloader".
> >>>>
> >>>> Also, take care of the PM1 Status Registers which also have "Accesses
> >>>> to the PM1 status registers are done through byte or word accesses"
> >>>> (In section 4.7.3.1.1 PM1 Status Registers).
> >>>>
> >>>> Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
> >>>
> >>>
> >>> Can't we set impl.min_access_size to convert byte accesses
> >>> to word accesses?
> >>
> >> I actually tried, but when reading `addr` or `addr+1` I had the same
> >> value. So I guess `addr` wasn't taken into account.
> >>
> >> I've checked again, with `.impl.min_access_size = 2`, the width that the
> >> function acpi_pm_cnt_read() get is 2, but addr isn't changed so the
> >> function is still supposed to shift the result (or the value to write)
> >> based on addr, I guess.
> > 
> > True address is misaligned.  I think memory core should just align it -
> > this is what devices seem to expect.
> > However result is shifted properly so just align addr and be done with
> > it.
> > 
> > 
> > In fact I have a couple more questions. Paolo - maybe you can answer some of these?
> > 
> > 
> > 
> >     if (!access_size_min) {
> >         access_size_min = 1;
> >     }
> >     if (!access_size_max) {
> >         access_size_max = 4;
> >     }
> > 
> >>>>>
> > 
> > So 8 byte accesses are split up unless one requests 8 bytes.
> > Undocumented right?  Why are we doing this?
> > 
> >>>>>
> > 
> > 
> >     /* FIXME: support unaligned access? */
> > 
> >>>>>
> > 
> > Shouldn't we document impl.unaligned is ignored right now?
> > Shouldn't we do something to make sure callbacks do not get
> > unaligned accesses they don't expect?
> > 
> > 
> > In fact, there are just 2 devices which set valid.unaligned but
> > not impl.unaligned:
> >     aspeed_smc_ops
> >     raven_io_ops
> > 
> > 
> > Is this intentional? 
> 
> I think it is a leftover from the initial implementation. The model works fine 
> without valid.unaligned being set and with your patch.
> 
> C. 

Oh good, we can drop this. What about raven? Hervé could you comment pls?


> 
> > Do these in fact expect memory core to
> > provide aligned addresses to the callbacks?
> > Given impl.unaligned is not implemented, can we drop it completely?
> > Cc a bunch of people who might know.
> > 
> > Can relevant maintainers please comment? Thanks a lot!
> > 
> >>>>>
> > 
> > 
> >     access_size = MAX(MIN(size, access_size_max), access_size_min);
> >     access_mask = MAKE_64BIT_MASK(0, access_size * 8);
> > 
> >>>>>
> > 
> > 
> > So with a 1 byte access at address 1, with impl.min_access_size = 2, we get:
> >     access_size = 2
> >     access_mask = 0xffff
> >     addr = 1
> > 
> > 
> > 
> > <<<<
> > 
> > 
> >     if (memory_region_big_endian(mr)) {
> >         for (i = 0; i < size; i += access_size) {
> >             r |= access_fn(mr, addr + i, value, access_size,
> >                         (size - access_size - i) * 8, access_mask, attrs);
> > 
> >>>>
> > 
> > now shift is -8.
> > 
> > <<<<
> > 
> > 
> >         }
> >     } else {
> >         for (i = 0; i < size; i += access_size) {
> >             r |= access_fn(mr, addr + i, value, access_size, i * 8,
> >                         access_mask, attrs);
> >         }
> >     }
> > 
> > 
> > <<<<
> > 
> > callback is invoked with addr 1 and size 2:
> > 
> >>>>>
> > 
> > 
> >     uint64_t tmp;
> > 
> >     tmp = mr->ops->read(mr->opaque, addr, size);
> >     if (mr->subpage) {
> >         trace_memory_region_subpage_read(get_cpu_index(), mr, addr, tmp, size);
> >     } else if (trace_event_get_state_backends(TRACE_MEMORY_REGION_OPS_READ)) {
> >         hwaddr abs_addr = memory_region_to_absolute_addr(mr, addr);
> >         trace_memory_region_ops_read(get_cpu_index(), mr, abs_addr, tmp, size);
> >     }
> >     memory_region_shift_read_access(value, shift, mask, tmp);
> >     return MEMTX_OK;
> > 
> > <<<<
> > 
> > let's assume callback returned 0xabcd
> > 
> > this is where we are shifting the return value:
> > 
> >>>>>
> > 
> > 
> > static inline void memory_region_shift_read_access(uint64_t *value,
> >                                                    signed shift,
> >                                                    uint64_t mask,
> >                                                    uint64_t tmp)
> > {
> >     if (shift >= 0) {
> >         *value |= (tmp & mask) << shift;
> >     } else {
> >         *value |= (tmp & mask) >> -shift;
> >     }
> > }
> > 
> > 
> > So we do 0xabcd & 0xffff >> 8, and we get 0xab.
> > 
> >>>>
> > 
> > How about aligning address for now? Paolo?
> > 
> > -->
> > 
> > memory: align to min access size
> > 
> > If impl.min_access_size > valid.min_access_size access callbacks
> > can get a misaligned access as size is increased.
> > They don't expect that, let's fix it in the memory core.
> > 
> > Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
> > 
> > ---
> > 
> > 
> > diff --git a/memory.c b/memory.c
> > index 9200b20130..ea489ce405 100644
> > --- a/memory.c
> > +++ b/memory.c
> > @@ -532,6 +532,7 @@ static MemTxResult access_with_adjusted_size(hwaddr addr,
> >      }
> >  
> >      /* FIXME: support unaligned access? */
> > +    addr &= ~(access_size_min - 1);
> >      access_size = MAX(MIN(size, access_size_max), access_size_min);
> >      access_mask = MAKE_64BIT_MASK(0, access_size * 8);
> >      if (memory_region_big_endian(mr)) {
> >> -- 
> >> Anthony PERARD
> > 

