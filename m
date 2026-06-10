Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CC1DCD8CB9
	for <qemu-arm@archiver.kernel.org>; Wed, 10 Jun 2026 14:09:06 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wXJc7-0006Ec-Ir; Wed, 10 Jun 2026 10:09:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1wXJc3-0006EM-IN
 for qemu-arm@nongnu.org; Wed, 10 Jun 2026 10:08:59 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1wXJc1-0002K3-8x
 for qemu-arm@nongnu.org; Wed, 10 Jun 2026 10:08:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1781100536;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=yWTVaoYMJmdERmtojDznqQmznXAobReZC50iW7TpeBA=;
 b=T4quKSlTx6s20HzKTW2aZ8ZwFJH8GgX4bpTV62HT8ZoxAV5HqOKfYgvNACpcGb/+B1bNO8
 F7r/baFbrVTL/x0dKqlgPD6HGMXLZ9/w31hOMBgIZWHySswJIUMhqluAzypFN0RKaIFrQl
 Ib3n0VUj+kWUOxabPc8CgytKkX0eifg=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-80-3bgWztAnPmqXG-DOPL3mCA-1; Wed, 10 Jun 2026 10:08:55 -0400
X-MC-Unique: 3bgWztAnPmqXG-DOPL3mCA-1
X-Mimecast-MFC-AGG-ID: 3bgWztAnPmqXG-DOPL3mCA_1781100534
Received: by mail-wm1-f70.google.com with SMTP id
 5b1f17b1804b1-490b9cd54f3so55005205e9.2
 for <qemu-arm@nongnu.org>; Wed, 10 Jun 2026 07:08:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781100534; x=1781705334;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=yWTVaoYMJmdERmtojDznqQmznXAobReZC50iW7TpeBA=;
 b=sETtTY1PygZ4nqYCKTFckYObe6MoE5dvMRDZn131A8rzxLS1kos7qLCUXClB64BCSL
 CXRg5Bsz/Q91Kkg07FVhNNv7DsubauIj9a71/R9sbjlTND1zfKYMpuFbAhRhBzQEMdiR
 4ACOj20Ovh27MYhwtVECATDlfOpx0ielbfNldsAh9c7ZXzjEsKbSqsCTt3tsAUkBgtAC
 fplQiOcnrjVzkxMRHNZarKdq6QjPwjARwTjCJzru2wcfEAI+kKatWm/EfRAJhYHu0HxG
 LzRCury9HqJaVd6evwFDzPNoksBmwvSXzC+RFi2eVJWVdWCMOo1GR7CyldNSupbr/ecW
 PdNA==
X-Forwarded-Encrypted: i=1;
 AFNElJ+kOFiyg7cRyXFzSTF//+mvfegeqJwwbc7U5q06n3s2YYtZICRRlrgmocf4ylIfnUYqPIsWeAB6XQ==@nongnu.org
X-Gm-Message-State: AOJu0YyEDJYDJb5W0c6bQPyH9b2Rxcu45GpQrFnjf4mwPE1LJCZm/tAw
 mSDPEBgxHXKO07Vlay8XCauMERZjhmhSwjWmzwQUh1JBjy4GCAdfZ6YzXbPf7/WWX0IYcvWJlHD
 JQI4PCkDNFKNsqRcI5R6qpMOsbnwyOsTmEy7DuyUUzPLN91W6Vs96UQ==
X-Gm-Gg: Acq92OECVKe5fGCqkgWzbFy3nkSxauYRu4VlAZ7BigMGOnvpGAxwOnLUKannJk5RdNB
 nZko/SHpcET1muCKNZO96NMluRo+HqyU7tjhqP5nY0JgDya6ypjbh+MK4kyb+/s0YbKEIGenUF2
 JKB/uSMKbO0Dsn7BHu4ijYljI9EGQ9PJkDfu5Tz2nDA6+wNJsZmwZDrBUQNWyjTg+txCtUrKaPw
 NTvnqrjCW0SO+6CcXjEBSxizUBy/UfFv215tRIT6AoyWHd7Xfyi4gMYQkRpYP0ErsZ/TH9GESIq
 +1fTWJex6Xtk66jporAmj+AECzhFs2zwO8gfo6b2DVJgkQYHRFDIOAYhrv5EUlUn6lIEc3ZeNui
 UXlsOsJmKeJ+ql5V4LpXAM7+ZgO6rgGr1UYGG5uy84nH7iQtItwN5Rg==
X-Received: by 2002:a05:600c:354a:b0:490:ba0a:1178 with SMTP id
 5b1f17b1804b1-490c2616e16mr413213865e9.28.1781100533646; 
 Wed, 10 Jun 2026 07:08:53 -0700 (PDT)
X-Received: by 2002:a05:600c:354a:b0:490:ba0a:1178 with SMTP id
 5b1f17b1804b1-490c2616e16mr413213125e9.28.1781100532987; 
 Wed, 10 Jun 2026 07:08:52 -0700 (PDT)
Received: from redhat.com (IGLD-80-230-85-71.inter.net.il. [80.230.85.71])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4601f2e4b18sm56718439f8f.10.2026.06.10.07.08.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Jun 2026 07:08:52 -0700 (PDT)
Date: Wed, 10 Jun 2026 10:08:49 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Gavin Shan <gshan@redhat.com>
Cc: Pavel Hrdina <phrdina@redhat.com>,
 Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>,
 Peter Xu <peterx@redhat.com>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, jugraham@redhat.com, shan.gavin@gmail.com
Subject: Re: [PATCH RFCv1] virtio: Inherit max bounce buffer size from bus
 parent if possible
Message-ID: <20260610100721-mutt-send-email-mst@kernel.org>
References: <20260608001821.850921-1-gshan@redhat.com>
 <aiaDgG26a6TUrKuM@redhat.com>
 <07ca74b4-52a8-4187-a57c-7c3277e574d3@redhat.com>
 <aiky9d9IwACIyKEC@phrdina-thinkpadt14gen4.rmtcz.csb>
 <674d5e21-88fa-4a10-a83c-eb6f7ce7032f@redhat.com>
 <ailU5beAUVJ1Fdpt@phrdina-thinkpadt14gen4.rmtcz.csb>
 <7cdbbf7b-e245-4d62-9461-a18a680e1719@redhat.com>
MIME-Version: 1.0
In-Reply-To: <7cdbbf7b-e245-4d62-9461-a18a680e1719@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: H3DxD3cGw3uhpzWqP0C5CzieKSYH4K3APrizuTY-k5k_1781100534
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
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

On Thu, Jun 11, 2026 at 12:04:52AM +1000, Gavin Shan wrote:
> On 6/10/26 10:23 PM, Pavel Hrdina wrote:
> > On Wed, Jun 10, 2026 at 08:55:10PM +1000, Gavin Shan wrote:
> > > Hi Pavel,
> > > 
> > > On 6/10/26 7:54 PM, Pavel Hrdina wrote:
> > > > On Mon, Jun 08, 2026 at 09:11:50PM +1000, Gavin Shan wrote:
> > > > > Hi Daniel,
> > > > > 
> > > > > On 6/8/26 6:55 PM, Daniel P. Berrangé wrote:
> > > > > > On Mon, Jun 08, 2026 at 10:18:21AM +1000, Gavin Shan wrote:
> > > > > > > On the guest where a NVidia's GH100 card is passed from the host, the
> > > > > > > guest system hang can be observed on attempt to compile 'cuda-samples',
> > > > > > > as reported by Julia.
> > > > > > 
> > > > > > snip
> > > > > > 
> > > > > 
> > > > > Thanks for looking into this.
> > > > > 
> > > > > > > By default, the max bounce buffer size is only 4096 bytes, even less
> > > > > > > than one page when the guest page is 64KB. This tries to fix the issue
> > > > > > > by inheriting the customized max bounce buffer size of the virtio bus's
> > > > > > > parent through property 'x-max-bounce-buffer-size' when the customized
> > > > > > > size is a larger one. With this applied, no guest system hang is seen
> > > > > > > with '-device virtio-blk-pci,...,x-max-bounce-buffer-size=268435456'.
> > > > > > 
> > > > > > "x-max-bounce-buffer-size"  is an experimental / unsupported property.
> > > > > > 
> > > > > > We really shouldn't be expecting users to have to set this in a production
> > > > > > deployment in order to stop a guest from hanging.  Even if we dropped the
> > > > > > experimental marker from this property, users would still need to know to
> > > > > > provide this magic setting, so it would still be broken out of the box.
> > > > > > 
> > > > > > How can we  get a solution that "just works" out of the box, which is
> > > > > > fully supported, not relying on experimental properties ?
> > > > > > 
> > > > > 
> > > > > How do we know that "x-max-bounce-buffer-size" is an experimental or unsupported
> > > > > property? I guess the properties whose names start with "x-" are all treated as
> > > > > experimental and unsupported?
> > > > > 
> > > > > For this case, the bounce buffer is inevitable as the memory region can't be
> > > > > directly accessed. The memory region is initialized by memory_region_init_ram_device_ptr()
> > > > > in hw/vfio/region.c::vfio_region_mmap(). So the question is how the allowed
> > > > > bounce buffer size can be specified by users, and it's why the existing property
> > > > > "x-max-bounce-buffer-size" is reused.
> > > > > 
> > > > > I even thought of a new property for MachineState (e.g. "limited-bounce-buffer"),
> > > > > which is set to on by default, following the existing behavior. When it's set to
> > > > > off by users, the max (allowed) buffer size won't be checked at all. However, I'm
> > > > > not sure if this makes sense at all.
> > > > 
> > > > Hi Gavin,
> > > > 
> > > > You did not answer the question that Daniel was asking, how will user
> > > > know that max-bounce-buffer-size should be used if it's necessary to fix
> > > > guest system hangs and how will user know what magic value should be set?
> > > > 
> > > 
> > > Sorry that I missed to answer Daniel's questions. For this specific case,
> > > user need to enlarge the bounce buffer size when seeing the following error
> > > message. We can add an explicit one in address_space_map() if the existing
> > > error message isn't obvious.
> > > 
> > >    qemu-system-aarch64: virtio: bogus descriptor or out of resources
> > > 
> > >    void *address_space_map(AddressSpace *as,
> > >                          hwaddr addr,
> > >                          hwaddr *plen,
> > >                          bool is_write,
> > >                          MemTxAttrs attrs)
> > >    {
> > >        if (!memory_access_is_direct(mr, is_write, attrs)) {
> > >            if (l == 0) {
> > >                error_report("Running out of bounce buffer size , enlarge it with max-bounce-buffer-size");
> > >                *plen = 0;
> > >                return NULL;
> > >            }
> > >        }
> > 
> > This may work when using qemu directly but users will not see this error
> > when using libvirt or management tools like kubevirt.
> > 
> 
> Ok, then an error message raised by error_report() won't help.
> 
> > > As to the value user should take for max-bounce-buffer-size, it is really case by case
> > > and decided by user. User needs to try 4096, 8192, ..., 0xFFFFFFFF to figure out the
> > > smallest value works for them. The worst case is to set 0xFFFFFFFF.
> > 
> > Doesn't sound like pleasant user experience playing guessing game to
> > figure out how to make a VM work and again will most likely not work for
> > kubevirt where users are usually not exposed to these low level properties.
> > 
> > I'm not familiar with the internals but isn't there a better way how to
> > solve it without requiring users to figure out by guessing what value works?
> > 
> 
> Not really. The worst case is to have 'max-bounce-buffer-size=0xFFFFFFFF',
> which is to disable the check against the max bounce buffer size :-)
> 
> Peter and Michael already lead the direction to bypass the bounce buffer
> for this specific case. It worked for me and no guest hang isn't seen when
> the bounce buffer is bypassed in address_space_map().
> 
> Thanks,
> Gavin

Mind, I am not against additionally switching virtio to support popping
bufs into QEMUSGList and not iovecs.

But the performance is gonnu be bad for this one.


-- 
MST


