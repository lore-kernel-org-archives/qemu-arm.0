Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62C93FD4F05
	for <qemu-arm@archiver.kernel.org>; Tue, 10 Mar 2026 16:21:29 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vzzpW-0001R1-Pf; Tue, 10 Mar 2026 12:21:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1vzzpT-0001QA-T7
 for qemu-arm@nongnu.org; Tue, 10 Mar 2026 12:21:07 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1vzzpP-00082w-Uo
 for qemu-arm@nongnu.org; Tue, 10 Mar 2026 12:21:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1773159663;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dTysAR/VXgL6SoCyTs1ndXMSg+O/BgqPoTSHbFhXURU=;
 b=Xk76NFh+DzipwXIQcYN/mT8eu4p7jqjAWQgqgyAPIKXdqmE/8+l+1YYbOKmG+zm1AFzZVI
 dV7QV12vh1PIDH9MxKR/BlSSHdhqo5bhuxUlkpbuoZUsGOZV6Zotd8e0k7bYE9m42YYc/0
 xdaM/vNRFqYChKFrpmAUEybFWyaj4F0=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-659-XhCSCi90Ol2iR1mUV7HTqA-1; Tue, 10 Mar 2026 12:21:00 -0400
X-MC-Unique: XhCSCi90Ol2iR1mUV7HTqA-1
X-Mimecast-MFC-AGG-ID: XhCSCi90Ol2iR1mUV7HTqA_1773159660
Received: by mail-qk1-f199.google.com with SMTP id
 af79cd13be357-8cd8b37d4b2so1420186185a.3
 for <qemu-arm@nongnu.org>; Tue, 10 Mar 2026 09:21:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1773159660; x=1773764460;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=dTysAR/VXgL6SoCyTs1ndXMSg+O/BgqPoTSHbFhXURU=;
 b=evPs3VFnYZ+DU24TcCtVYbr4isQqNs17YxARP0tYAa5d3zjBFsWiG8f7GuhbYHHpgF
 SUHlv80Fzig7OHCULCuXPOkhlKCddbmodBi57/Xp+ExE/ZkuGxrfudPk2KSgnBUZeqQr
 ozrirHiBIlWsHFvoyLWZsDQ04b9cT2e1wKCtBcSoIa+MH9/5EYdX5Id1tfBiGGLEGv0D
 U0/YrTG91E/kBga/wS/ZtrBBZD+/fKvf2qqe28OVu+ZcpfKagwKC6GtJ4L2U+CyatT8Y
 FTyeTO2pmVMetWW4UEj1rttw1NqotWlWQqKfScrpTOaBlQky3CoS7QYMir+1fbcUpwbL
 9PcA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXvrQomiBx4CAv16eFWTqvSrZbTROrcYbPWZFXQO9lZsTOl49I4FbqxS4YR5Mto6qUgexYZauuaOA==@nongnu.org
X-Gm-Message-State: AOJu0Yzm8J+J8IhGNetPx2h62hYUcIh4zsXG+qCqu+FR9a8aexwWiXlZ
 mX75fIxLEUiG8bbSGcTMUd0Y4uAX0Sf/0fBnXUopYbjT9u3UUMojAkBpOuFaGwZqtY5C/jL2pVe
 YPJvJ5RPvMl9YrJQLkj1MvhDOp8yuWXebWs83zymfJEY1YH3KPdE2Cg==
X-Gm-Gg: ATEYQzw2oDFyxBBsGfq0EwpzkJV2HNQkVFlVeU9sEEIeCxqNoNBpusXeGElGSsuHOLT
 DzjZNlgQlLSbADWlxivKr3UKOwJZJw/z20EWYhmcy+Pxm2tfXhNKa9MlmlLsRaQd5kEk+1zJBgm
 eepGau791WaWtggAEwbZV4JIytgZTSVjBBjN0RMEsEgPUUS9ydO/erImW7ABUJO2kFljEjL4n4b
 eFo39ran2g7+4TAjvuLSFAA+KdhpU5HXgikRGoxIHFycX670NPNpwFr66e5HmIdnwMgWw55sd29
 dhEjRNxKL3B8+YDiIuLfw/3k0ZUzzJOtN2bvkYGEL67NFYfjfbSYhYNTRNi8V5vJfIYBhfnA3Hp
 CFC4Mj2kZDcHC6A==
X-Received: by 2002:a05:620a:2848:b0:8c7:fdc:e84f with SMTP id
 af79cd13be357-8cd6d40d237mr1909509885a.11.1773159660088; 
 Tue, 10 Mar 2026 09:21:00 -0700 (PDT)
X-Received: by 2002:a05:620a:2848:b0:8c7:fdc:e84f with SMTP id
 af79cd13be357-8cd6d40d237mr1909503885a.11.1773159659520; 
 Tue, 10 Mar 2026 09:20:59 -0700 (PDT)
Received: from x1.local ([142.189.10.167]) by smtp.gmail.com with ESMTPSA id
 af79cd13be357-8cd6f56da77sm968196585a.44.2026.03.10.09.20.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Mar 2026 09:20:58 -0700 (PDT)
Date: Tue, 10 Mar 2026 12:20:56 -0400
From: Peter Xu <peterx@redhat.com>
To: Akihiko Odaki <odaki@rsg.ci.i.u-tokyo.ac.jp>
Cc: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Mohamed Mediouni <mohamed@unpredictable.fr>, qemu-devel@nongnu.org,
 Phil Dennis-Jordan <phil@philjordan.eu>,
 Mads Ynddal <mads@ynddal.dk>, qemu-arm@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>,
 Roman Bolshakov <rbolshakov@ddn.com>, Alexander Graf <agraf@csgraf.de>,
 Paolo Bonzini <pbonzini@redhat.com>, Alexander Bulekov <alxndr@bu.edu>
Subject: Re: [PATCH v5 1/2] vmapple: apple-gfx: make it work on the latest
 macOS release
Message-ID: <abBE6NuYJIJgM0rj@x1.local>
References: <20260306145246.10274-1-mohamed@unpredictable.fr>
 <20260306145246.10274-2-mohamed@unpredictable.fr>
 <8908689a-f5c1-490e-925d-7a664093963f@rsg.ci.i.u-tokyo.ac.jp>
 <a24c76d0-4106-4d49-b032-35f7f6310e69@linaro.org>
 <f94bebf5-a452-46cf-ad46-acb71c619917@rsg.ci.i.u-tokyo.ac.jp>
MIME-Version: 1.0
In-Reply-To: <f94bebf5-a452-46cf-ad46-acb71c619917@rsg.ci.i.u-tokyo.ac.jp>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: HjdM4dP3d-FuGPbdJHpai0UCBXkWz4KWV6ryOvLyt9M_1773159660
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -3
X-Spam_score: -0.4
X-Spam_bar: /
X-Spam_report: (-0.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.819, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.903,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

On Tue, Mar 10, 2026 at 03:55:41PM +0900, Akihiko Odaki wrote:
> On 2026/03/10 7:21, Philippe Mathieu-Daudé wrote:
> > +Peter/Paolo
> > 
> > On 7/3/26 04:08, Akihiko Odaki wrote:
> > > On 2026/03/06 23:52, Mohamed Mediouni wrote:
> > > > Follow changes in memory management introduced on macOS 15.4.
> > > > 
> > > > The legacy memory management API has been removed for the
> > > > IOSurface mapper on that macOS version.
> > > > 
> > > > Also enable process isolation for a sandboxed GPU process when
> > > > on a new OS.
> > > > 
> > > > Signed-off-by: Mohamed Mediouni <mohamed@unpredictable.fr>
> > > > ---
> > > >   hw/display/apple-gfx-mmio.m | 62 ++++++++++++++++++++++++++++---------
> > > >   hw/display/apple-gfx.h      | 18 +++++++++++
> > > >   hw/display/apple-gfx.m      | 43 ++++++++++++++++++++++++-
> > > >   3 files changed, 107 insertions(+), 16 deletions(-)
> > 
> > 
> > > > diff --git a/hw/display/apple-gfx.m b/hw/display/apple-gfx.m
> > > > index e0a765fcb1..92404d20bf 100644
> > > > --- a/hw/display/apple-gfx.m
> > > > +++ b/hw/display/apple-gfx.m
> > > > @@ -21,6 +21,7 @@
> > > >   #include "system/address-spaces.h"
> > > >   #include "system/dma.h"
> > > >   #include "migration/blocker.h"
> > > > +#include "system/memory.h"
> > > >   #include "ui/console.h"
> > > >   #include "apple-gfx.h"
> > > >   #include "trace.h"
> > > > @@ -596,6 +597,37 @@ void apple_gfx_common_init(Object *obj,
> > > > AppleGFXState *s, const char* obj_name)
> > > >       /* TODO: PVG framework supports serialising device state:
> > > > integrate it! */
> > > >   }
> > > > +@interface PGDeviceDescriptor (IOSurfaceMapper)
> > > > +@property (readwrite, nonatomic, copy, nullable)
> > > > PGMemoryMapDescriptor* memoryMapDescriptor;
> > > > +@end
> > > > +
> > > > +bool apple_gfx_register_memory_cb(Int128 start, Int128 len,
> > > > +                                  const MemoryRegion *mr_const,
> > > > +                                  hwaddr offset_in_region, void
> > > > *opaque) {
> > > > +    MemoryRegion *mr = (MemoryRegion *)mr_const;
> > > 
> > > flatview_for_each_range() should be changed to pass non-const
> > > pointers instead.
> > 
> > flatview_for_each_range() was added in commit fb5ef4eeecd ("memory: Add
> > FlatView foreach function") with memory fuzzing in mind, so const MR was
> > the correct choice then IMO.
> > 
> > FlatView is more of an internal memory API, I'm not sure it should be
> > used by hw/ layer.
> > 
> > $ git grep -w flatview_for_each_range
> > hw/core/loader.c:1656:    flatview_for_each_range(fv, find_rom_cb,
> > &cbdata);
> > semihosting/arm-compat-semi.c:158:    flatview_for_each_range(fv,
> > find_ram_cb, &info);
> > tests/qtest/fuzz/generic_fuzz.c:310: flatview_for_each_range(view,
> > get_io_address_cb , &cb_info);
> > 
> > Semihosting is special, as it the ROM loader helper, and fuzzing code.
> > 
> > 
> > We provide MemoryRegionSection, MemoryListener and RamDiscardListener
> > APIs. Maybe one of them is more appropriate here? See:
> > 
> >   * A #RamDiscardManager coordinates which parts of specific RAM
> >   * #MemoryRegion regions are currently populated to be used/accessed
> >   * by the VM, notifying after parts were discarded (freeing up memory)
> >   * and before parts will be populated (consuming memory), to be used/
> >   * accessed by the VM.
> > 
> > Could this be what this code needs to do?
> 
> The problem here is that the reverse-engineered interface is insufficient to
> keep the memory map synchronized so it can only populate the memory map
> during initialization. flatview_for_each_range() fits for this purpose.
> 
> Ideally the interface may be reverse-engineered more thoroughly to
> synchronize the memory map at runtime but that needs more work.

IIUC we could still use memory_listener_register(), and I agree with Phil
it might be good to avoid exporting flatview API further to hw/ if ever
possible.

memory_listener_register() will properly replay all the memory regions
similarly when adding the new listener, via region_add().

Thanks,

-- 
Peter Xu


