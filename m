Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07A8BCD98C6
	for <qemu-arm@archiver.kernel.org>; Thu, 11 Jun 2026 06:35:23 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wXZ0Q-0002Ct-63; Thu, 11 Jun 2026 02:35:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1wXZ0J-0002CK-Tp
 for qemu-arm@nongnu.org; Thu, 11 Jun 2026 02:35:05 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1wXZ0G-00024N-6w
 for qemu-arm@nongnu.org; Thu, 11 Jun 2026 02:35:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1781159699;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=IH7X/BsaoA0B6KFizfMoKkCEWocB8PozDwbY65oi35w=;
 b=gpgasKPQyISo+BrFI18cjlURe9UvnAr0HP5hMRPOamstHo5a+EG7Vzqo/GsHBYuCHlKCxH
 Fv7jc9rWxynWat/NtCPN3vpRvDz4cIQR0FZFMsmKYspQbY5LlmZPap4/iBoJteV+i6b6Wi
 tnOJkjYNJF/IBdK8eKRqpZqYXcBMJKU=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-502--tKw17cgOVqZ8LaJTSMTZQ-1; Thu, 11 Jun 2026 02:34:57 -0400
X-MC-Unique: -tKw17cgOVqZ8LaJTSMTZQ-1
X-Mimecast-MFC-AGG-ID: -tKw17cgOVqZ8LaJTSMTZQ_1781159697
Received: by mail-wm1-f70.google.com with SMTP id
 5b1f17b1804b1-490b93debc8so61129595e9.1
 for <qemu-arm@nongnu.org>; Wed, 10 Jun 2026 23:34:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781159696; x=1781764496;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=IH7X/BsaoA0B6KFizfMoKkCEWocB8PozDwbY65oi35w=;
 b=qv8MBjuZQAHD/WOvsoBgJLrknVHXljhDnacg5uV03uOrIIsQsDBV9ShRyKbqB5hfNX
 aHQXVqq2kd50QE7H68Q0Jwtc0biQVqHok0qXKPgInCj1abP0d6sLLhePq4pvtJqBstyr
 AV8s56Sbq0aBD4oFeALugQWzFx25a0MQu062AJq9vD6Ey2XMW7FMc1/A1H5NlAHaeAkM
 HkVN96GGBXOJAw0SgEg99/y/Y+hGoe1d/CYpeOWTIRhAO/F+dfKVJnTF1W/lQLqw+5rF
 NPGM0GuK8vn1pjJpBp9rFO+goPhfHkqfh+HZuzO+R+9wQ91WQeor7Zvw3xmaqRGNJxNc
 aytg==
X-Forwarded-Encrypted: i=1;
 AFNElJ9Ler6XI2b5FpnI+NdZMLEw8ZDX67ElFGQESNJtg3zKVFUAUTjl6P/bqayrARkvJjXDAEdBEBcCiA==@nongnu.org
X-Gm-Message-State: AOJu0YwQJTyuDqlghpI5ayKiktOO4o9btwlbyJ1DMOhWwWdB0KkP8EnI
 I6LyR0Dnl+HGY2mwgBxA+m6C9tHUn0zl9GE63VQFPHhDodY58fyDVuE+jtiiIFeLD/0heCUiN9A
 nF9gqB+PllEiYuI5tGI4fYqhZHnKKK0ErI7Rcu4E1Cz8Pu+BnbFBIWQ==
X-Gm-Gg: Acq92OE/xEN0TA3z2AJDqFlWxgSGnN307IKFN7ht1cxYe8mJXnlQH9b3sBMUD5f1GNq
 BaXVh9n65GuoyaYjUSDc69cP51/A5IdhlG4WuJsHmNUS00acf+hXCxXoWSLouvAsajgGoQtdg9o
 N4xv0PGldpWFezuQ6/uFMNS3cUguANCt5TjZPjVwFBVCHKWEEDy/vlPHa0X8Fs3m4KRlLf8Mbav
 nPieFUoO+LVNsUxp9ZlAva3JLxhJjK+9QkO4cRw9T7gOznqdOWsc4/gnHvBx9iY7JExYYwMNjLy
 KuuIsBsMm2v06HEJ35/amaOb3hJ6LsVS7t4SoAGtXy2zbV8nztezdNpiUAeA5dBkY8wLDm/BM+r
 7e6S0nUMAROnUr6xB0hlcBWL0Vm+m1pSJbABc6H4+vQXP5qDUGFU3qQ==
X-Received: by 2002:a05:600c:41cc:b0:490:b0e0:3de2 with SMTP id
 5b1f17b1804b1-490e561c40emr7362125e9.33.1781159696482; 
 Wed, 10 Jun 2026 23:34:56 -0700 (PDT)
X-Received: by 2002:a05:600c:41cc:b0:490:b0e0:3de2 with SMTP id
 5b1f17b1804b1-490e561c40emr7361785e9.33.1781159695991; 
 Wed, 10 Jun 2026 23:34:55 -0700 (PDT)
Received: from redhat.com (IGLD-80-230-85-71.inter.net.il. [80.230.85.71])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-490e531e6acsm24971195e9.12.2026.06.10.23.34.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Jun 2026 23:34:55 -0700 (PDT)
Date: Thu, 11 Jun 2026 02:34:52 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Gavin Shan <gshan@redhat.com>
Cc: Peter Xu <peterx@redhat.com>, Pavel Hrdina <phrdina@redhat.com>,
 Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>,
 qemu-devel@nongnu.org, qemu-arm@nongnu.org, jugraham@redhat.com,
 shan.gavin@gmail.com, Alex Williamson <alex@shazbot.org>,
 David Hildenbrand <david@kernel.org>
Subject: Re: [PATCH RFCv1] virtio: Inherit max bounce buffer size from bus
 parent if possible
Message-ID: <20260611023428-mutt-send-email-mst@kernel.org>
References: <eb0f0da1-11dd-4437-94fd-a65af55851e1@redhat.com>
 <20260610082637-mutt-send-email-mst@kernel.org>
 <5d8cbd4b-3725-437e-88a3-e0af32164815@redhat.com>
 <e7cc9f2d-ccb4-442f-a1ed-7c5474395099@redhat.com>
 <20260610095712-mutt-send-email-mst@kernel.org>
 <aimEl9QQ_LTRPLtd@x1.local>
 <20260610121026-mutt-send-email-mst@kernel.org>
 <1e9515c9-7e32-4d95-9b73-aab8bf10bddc@redhat.com>
 <20260611012217-mutt-send-email-mst@kernel.org>
 <3726a607-6cac-41f1-b402-0eed7c4e3fe3@redhat.com>
MIME-Version: 1.0
In-Reply-To: <3726a607-6cac-41f1-b402-0eed7c4e3fe3@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: ri6sW_fISf_Yx0UNmGHOSMku7M4fzV2SPVT27VgIUjc_1781159697
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.445,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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

On Thu, Jun 11, 2026 at 04:28:20PM +1000, Gavin Shan wrote:
> Hi Michael,
> 
> On 6/11/26 3:31 PM, Michael S. Tsirkin wrote:
> > On Thu, Jun 11, 2026 at 02:33:05PM +1000, Gavin Shan wrote:
> > > On 6/11/26 2:18 AM, Michael S. Tsirkin wrote:
> > > > On Wed, Jun 10, 2026 at 11:36:55AM -0400, Peter Xu wrote:
> > > > > On Wed, Jun 10, 2026 at 10:06:24AM -0400, Michael S. Tsirkin wrote:
> > > > > > On Wed, Jun 10, 2026 at 11:54:47PM +1000, Gavin Shan wrote:
> 
> [...]
> 
> > > > > > 
> > > > > > I do not think it has anything to do with host endian-ness.
> > > > > > 
> > > > > > 
> > > > > > This is the change that broke it I think?
> > > > > > 
> > > > > > 
> > > > > > commit 4a2e242bbb306ef5c16ce9e7bb2da3bd8a4eb098
> > > > > > Author: Alex Williamson <alex@shazbot.org>
> > > > > > Date:   Mon Oct 31 09:53:03 2016 -0600
> > > > > > 
> > > > > >       memory: Don't use memcpy for ram_device regions
> > > > > > 
> > > > > > Maybe Alex has an opinion on what to do.
> > > > > 
> > > > > I can offer one idea here..
> > > > > 
> > > > > IIUC the major issue was vector ops but the mr ops might be too heavy, then
> > > > > another way to fix it is in memory API instead of using memcpy()/memmove(),
> > > > > we always use a helper (say, memmove_no_vector()) to do the split and
> > > > > properly aligned IOs as what ram_device_mem_ops does right now, this should
> > > > > only applies to ram_device.
> > > > > 
> > > > > With that, IIUC we can remove the current ram_device_mem_ops, then in
> > > > > Gavin's case mmap() will go through and guest will not need to vmexit at
> > > > > all.  Best perf, issue solve.
> > > > > 
> > > > > We just need to be careful to trap all possible memcpy()/memmove() used in
> > > > > memory core.. if I didn't miss any, IMO below four should needs to be
> > > > > replaced by memmove_no_vector():
> > > > > 
> > > > >     flatview_write_continue_step()
> > > > >     flatview_read_continue_step()
> > > > >     address_space_read()
> > > > >     address_space_write_rom()
> > > > > 
> > > > > Thanks,
> > > > > 
> > > > > -- 
> > > > > Peter Xu
> > > > 
> > > > First, this is a nice idea.
> > > > Second, the ideal thing is still just allowing direct access.
> > > > And I think VFIO actually knows it's regular RAM.
> > > > So something like the following small patch in linux, maybe?
> > > > 
> > > 
> > > If I understood everything, Peter's proposal seems to move the logics covered
> > > by ram_device_mem_ops to the upper layer.
> > 
> > 
> > I think the basics of Peter's idea are really simple: if guest is doing
> > DMA into a region then that access is treating that region as RAM and so
> > any vectored etc instructions into it are fine.
> > 
> > So we can fix specifically DMA into RAM DEVICE to bypass bounce buffering.
> > 
> > It's at the low memory level, not the upper layer.
> > 
> > He also apparently feels bounce buffering isn't needed
> > generally and can be replaced with memmove_no_vector? And
> > somehow virtio DMA can be done without kicking host? I'm not
> > sure I understand these parts.
> > 
> 
> For Peter's idea, I believe there is something I missed. Lets take our specific
> case as an example where the DMA request is handled as the following calltrace
> indicates.
> 
>     virtio_blk_handle_output
>       virtio_blk_handle_vq
>         virtio_blk_get_request
>           virtqueue_pop
>             virtqueue_split_pop
>               virtqueue_map_desc
>                 address_space_map
>         virtio_blk_handle_request
>           iov_to_buf
>             memcpy
> 
> In address_space_map(), all RAM DEVICE regions treated as directly accessible
> and the buffer (RAMBlock::host + offset) is returned. The buffer is passed on
> to virtio_blk_handle_request() and iov_to_buf(), the data is then copied over
> using memcpy(), which we're trying to avoid.
> 
> Thanks,
> Gavin
> 


This is header copy why and how would we try to avoid that?

-- 
MST


