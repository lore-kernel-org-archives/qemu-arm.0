Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41A3EC531FA
	for <qemu-arm@archiver.kernel.org>; Fri, 24 Jul 2026 16:32:10 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wnIoT-0002uV-Uf; Fri, 24 Jul 2026 12:31:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1wnIoR-0002tO-TT
 for qemu-arm@nongnu.org; Fri, 24 Jul 2026 12:31:52 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1wnIoP-0003Vv-B6
 for qemu-arm@nongnu.org; Fri, 24 Jul 2026 12:31:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1784910707;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=g6E0eyNWPzJ9FOf1EYvZSDur1RHs8elOgHrWdWsmYYQ=;
 b=J8W45Noa++05JC0TIrszdaG+LBckC9q8XO/0z49DT57ACbXW1R2uTm8UufogzptnYxsD44
 Ye3ztYIe+8nejq2bltR2hG0C2zBHfIhoHqMF5JSsECkFWyRfqq1UArtqJNVwZmZ+ozoM8D
 iEKbHOXx3hTJ2YjoJhB5G0t2upvKP/0=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-383-t5J6P9BdPmW9yBkUjUh5yg-1; Fri, 24 Jul 2026 12:31:45 -0400
X-MC-Unique: t5J6P9BdPmW9yBkUjUh5yg-1
X-Mimecast-MFC-AGG-ID: t5J6P9BdPmW9yBkUjUh5yg_1784910704
Received: by mail-wm1-f70.google.com with SMTP id
 5b1f17b1804b1-495569acf8dso4573215e9.1
 for <qemu-arm@nongnu.org>; Fri, 24 Jul 2026 09:31:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1784910704; x=1785515504;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :content-type:mime-version:references:message-id:subject:cc:to:from
 :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to:content-type;
 bh=g6E0eyNWPzJ9FOf1EYvZSDur1RHs8elOgHrWdWsmYYQ=;
 b=RGIHrT2DmkVLyP2cWT5aYHLxSkqtRreFsBA/szc6kiQVhkrXpXH1uAxYGf7T4QcCfW
 feC0QoMb6HOwX6s2ULujuWxos+5YafcOaRyyMNV3s/X/mjIPfsv1xmH/i/asawUl+5cS
 eTQoJOUPq7tWXt9PrdAtHkNsQrtxLR9QwTMrAPPwmEM2w4mc37rQ0SAGGuT43dRPH+od
 wADoZFnz3Sxak3eI6B+/czklv1haLRM7a43CJvIamwROBG7T05TAT76JCX+j4+jIcoSE
 Il5N0ce2e+Ak2zPRNhzCbwUmRZ4rEjXZ3i8361vJSY8ZPY6WCLX8kViIqG1Kx0N0vGKo
 ZZZQ==
X-Forwarded-Encrypted: i=1;
 AHgh+RoUKvO7+zaYXiNEBkM4EDZQq6PSgPpvltLQ/ROxLRhgsf6SwZzwDbsq7TZIbOXzjDV78v1duhMABg==@nongnu.org
X-Gm-Message-State: AOJu0YyjC5xhTvc1ANMEfoZn65LwDY6JJmf1AsiOEC09IdEDsb3+f9Rc
 22jA2qw/VbqSySXYbKnqPzI5XH2Hc27+ti7HlQYN9r43R2weGNM/C/1Fh7SMBBK2upup74/hL7C
 aNCJ2L8qikPnalt1A8gDgVPc4+0yMcO2w88eDZp2tqoi/Kr5+cJsIHQ==
X-Gm-Gg: AR+sD13T2StukuRCRkoeBkF4sZoucEr7U220rNLHbmAG+t+Sm/vi0W1aXBSL7cS9CSB
 UGDtY1nrv8l6VPsx1G6CljQYIGh0VrvwiXObZzRcDVbvGYweXSKEUPGZievGQHL74fwUIaj+a2s
 HdO3G0Bx+wfc5V2QfIHABAtt2HzNQX/buSnHogPfEZMChcT8Xd8b14nQUlv8OQHx0vOpuD3QCbr
 U7XTsuSEPPjfX/yvGDwxtNuNigC9Sz0yZT4mWQsO2HnYnXC6SO9LuqHb0kmlyCA9qr+fQUs5qlf
 3nNfAepPqlGXYkariZTqS4mLibhHptCBTwY6rHoTHkh1e5PicOP9WQAnrzXG+AvjTT/grDrOSMq
 38oLrIMdlVHMN5CZSfxOWcVbtJmZR5dA=
X-Received: by 2002:a05:600c:c05a:b0:495:7379:17b1 with SMTP id
 5b1f17b1804b1-49573d03050mr104009675e9.30.1784910704233; 
 Fri, 24 Jul 2026 09:31:44 -0700 (PDT)
X-Received: by 2002:a05:600c:c05a:b0:495:7379:17b1 with SMTP id
 5b1f17b1804b1-49573d03050mr104009035e9.30.1784910703610; 
 Fri, 24 Jul 2026 09:31:43 -0700 (PDT)
Received: from redhat.com (bzq-79-177-145-168.red.bezeqint.net.
 [79.177.145.168]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-496b480fafasm4155825e9.0.2026.07.24.09.31.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Jul 2026 09:31:43 -0700 (PDT)
Date: Fri, 24 Jul 2026 12:31:39 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Peter Xu <peterx@redhat.com>
Cc: Gavin Shan <gshan@redhat.com>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@oss.qualcomm.com>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org, alex@shazbot.org,
 richard.henderson@linaro.org, berrange@redhat.com, philmd@mailo.com,
 david@kernel.org, clg@redhat.com, pbonzini@redhat.com,
 phrdina@redhat.com, jugraham@redhat.com,
 liugang24219@sangfor.com.cn, dinghui@sangfor.com.cn,
 shan.gavin@gmail.com, qemu-s390x <qemu-s390x@nongnu.org>
Subject: Re: [PATCH v3 1/2] system/memory: Use qemu_ram_{copy, move}() in ram
 device region accessors
Message-ID: <20260724122956-mutt-send-email-mst@kernel.org>
References: <al-eCtxGjG4HHEbl@x1.local>
 <6210e178-a93f-4411-810a-41edb1fb656e@redhat.com>
 <20260722015422-mutt-send-email-mst@kernel.org>
 <amDyvgR09OJssENX@x1.local>
 <20260723015708-mutt-send-email-mst@kernel.org>
 <71d88d00-5b41-49d2-b649-8a6ea47abc4d@oss.qualcomm.com>
 <20260723045428-mutt-send-email-mst@kernel.org>
 <amIbUYN3teCLXTh-@x1.local>
 <b05b40b1-fffd-4be5-9289-b5bc92c16cd2@redhat.com>
 <amNvIMizFp7Au2c3@x1.local>
MIME-Version: 1.0
In-Reply-To: <amNvIMizFp7Au2c3@x1.local>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: fUX17v8RBLJmygEbX-Tsg36SqjCvK6xG2GWIIhBtPwQ_1784910704
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.419,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On Fri, Jul 24, 2026 at 09:56:48AM -0400, Peter Xu wrote:
> On Fri, Jul 24, 2026 at 11:42:09AM +1000, Gavin Shan wrote:
> > On 7/23/26 11:46 PM, Peter Xu wrote:
> > > On Thu, Jul 23, 2026 at 05:05:08AM -0400, Michael S. Tsirkin wrote:
> > > > On Thu, Jul 23, 2026 at 10:52:11AM +0200, Philippe Mathieu-Daudé wrote:
> > > > > On 23/7/26 08:04, Michael S. Tsirkin wrote:
> > > > > > On Wed, Jul 22, 2026 at 12:41:34PM -0400, Peter Xu wrote:
> > > > > > > On Wed, Jul 22, 2026 at 01:58:18AM -0400, Michael S. Tsirkin wrote:
> > > > > > > > On Wed, Jul 22, 2026 at 10:53:27AM +1000, Gavin Shan wrote:
> > > > > > > > > On 7/22/26 2:27 AM, Peter Xu wrote:
> > > > > > > > > > On Tue, Jul 21, 2026 at 03:37:53PM +1000, Gavin Shan wrote:
> > > > > > > > > > > If Peter is fine with two variants for x86 and non-x86 architectures.
> > > > > > > > > > > I can post (v4) for further review. That will be something like below
> > > > > > > > > > > and let me know if there are any other improvements are needed.
> > > > > > > > > > 
> > > > > > > > > > I have a generic question on the "unaligned access for x86": I think the
> > > > > > > > > > question is about the one Michael raised here on unaligned access may break
> > > > > > > > > > x86 here:
> > > > > > > > > > 
> > > > > > > > > >      https://lore.kernel.org/qemu-devel/20260617022330-mutt-send-email-mst@kernel.org/
> > > > > > > > > > 
> > > > > > > > > >      3. (theoretical concern) also on x86, unaligned accesses are
> > > > > > > > > >      possible on guest and host, so converting an unaligned access to a
> > > > > > > > > >      series of aligned ones can in theory break devices.
> > > > > > > > > > 
> > > > > > > > > > Is that a real problem we need to consider, or can we start with unified
> > > > > > > > > > approach and leave it for later?
> > > > > > > > > > 
> > > > > > > > > 
> > > > > > > > > I'm leaving this question to Michael.
> > > > > > > > 
> > > > > > > > Knowing what I know about hardware designers, it's something someone
> > > > > > > > somewhere does)
> > > > > > > > It can be made a separate patch, just to show - it should be all of
> > > > > > > > ~10LOC.
> > > > > > > 
> > > > > > > It's only about removal of anything that might be controversial for now,
> > > > > > > thanks.  I also wonder if anything would break, then it's more solid proof
> > > > > > > that per-arch change is required.
> > > > > > 
> > > > > > Repeating:
> > > > > > 	I think there is exactly 1 kinda reasonable case. A 2 byte read/write at
> > > > > > 	offset 0x1 within a dword. This maps nicely to even classical PCI byte
> > > > > > 	enable mechanism and so yes it works if your CPU can initiate these
> > > > > > 	things, and it's atomic.
> > > > > 
> > > > > Isn't this out of the CPU arch, dealt with at the bus level?
> > > > > 
> > > > > It looks we try to be clever with modern PCI code by optimizing this
> > > > > access -- not saying we can change that, I know it is too late after
> > > > > 20+ years -- relying on hw behavior that was done that way to support
> > > > > legacy hw, in particular broken I/O accesses.
> > > > 
> > > > Not sure what the question is.  We were dicussing how to emulate unaligned
> > > > accesses from x86 guests if they happen.
> > > > On an x86 host we can do that easily, and it's just a couple of LOC.
> > > > Though Peter Maydell dislikes host arch specific code. But I hope
> > > > if it's a separate patch on top and it is visible how small it is,
> > > > he will reconsider)
> > > 
> > > Yes, if we still want x86 specific change, it would be better to be put
> > > separately.
> > > 
> > > Said so, I don't think the e1000e LEDCTL test illustrated what might
> > > break..  Isn't that only an exmaple showing unaligned access is
> > > "supported", however nothing breaks even if we use 1B*2?
> > > 
> > > My question was more about a real breakage, hence whenever it happened
> > > "it's more solid proof that per-arch change is required".
> > > 
> > > > On other hosts we can't emulate them 100%, we either need to split
> > > > to byte accesses or over-access and mask. Byte accesses feel safer.
> > > > What qemu currently does with memmove is clearly not safe in the
> > > > general case.
> > > 
> > > We should have another option that is not arch-dependent but keep the
> > > unaligned behavior.
> > > 
> > > For current master, AFAIU we do unaligned access for both ram_device and
> > > rest. Say, even with ram_device_mem_ops, it has both .unaligned=true for
> > > both .valid & .impl.  I think it means indeed we have unaligned behavior
> > > even for ram_device.  It also means what matters in regards to the Realtek
> > > bug was only about aligned access (with subpage presence).
> > > 
> > > I think it means we can always keep unaligned to stick with
> > > memcpy()/memmove(), but only use atomic ops for the aligned cases of
> > > 1/2/4/8.  With that, I think we can also remove ram_device_mem_ops and fix
> > > the bounce buffer issue.
> > > 
> > > I think it means we'll stick with memcpy()/memmove() for all archs for
> > > unaligned, which is again not safe... but that can be an existing but
> > > separate problem to solve too.
> > > 
> > 
> > Lets see if Peter Maydell and Michael are happy with this option. At least,
> > we will have unified qemu_ram_move() for all architectures with this option.
> > Note that qemu_ram_copy() won't be needed.
> > 
> > I'm putting note on what's to be done in (v4) if this option is to be picked
> > up. Let me know if there are missed points. It's basically combing what's done
> > by ram_device_mem_ops to upper layer (e.g. in qemu_ram_move()).
> > 
> >   address_space_write
> >     address_space_to_flatview
> >     flatview_write
> >       flatview_translate
> >       flatview_write_continue
> >         flatview_write_continue_step
> >           memmove                     // (A) to replace it with qemu_ram_move()
> > 
> > /**
> >  * qemu_ram_move: move data to ramblock
> >  *
> >  * @dst: destination where the data is moved to
> >  * @src: source where the data is moved from
> >  * @n: length of data to be moved
> >  *
> >  * Move @n bytes from @src to @dst with the assumption that @src and @dst
> >  * can overlap. The access is atomic if the source and destination buffer
> >  * aren't overlapped for a well aligned and small-sized access. Otherwise,
> >  * fall back to the standard memmove().
> >  */
> > static void qemu_ram_move(void *dst, const void *src, size_t n)
> > {
> >     uintptr_t test, len;
> > 
> >     if (src == dst || n == 0) {
> >         return;
> >     }
> > 
> >     /* Overlapped buffers */


overlapping

> >     if (src < (dst + n) && dst < (src + n)) {
> 
> s/&&/||/?
> 
> It's a bit weird to request memmove() for overlapped, e.g. I don't know if
> P2P can overlap too when some fuzzer fills in some MMIO address shifted for
> src/dst.. but I think I get what you want to simplify and it looks fine.
> 
> Otherwise it looks good.

Why do we bother special casing overlapping buffers though?
I do not get it, looks like rest of logic works exactly
the same for overlapping and non.

> >         memmove(dst, src, n);
> >         return;
> >     }
> > 
> >     test = (uintptr_t)src | (uintptr_t)dst | n;
> >     len = test & -test;
> > 
> >     /* Unaligned or oversized access */
> >     if (n > 8 || len != n) {
> >         memmove(dst, src, n);
> >         return;
> >     }
> > 
> >     switch (len) {
> >     case 1:
> >         qatomic_set((uint8_t *)dst, qatomic_read((uint8_t *)src));
> >         break;
> >     case 2:
> >         qatomic_set((uint16_t *)dst, qatomic_read((uint16_t *)src));
> >         break;
> >     case 4:
> >         qatomic_set((uint32_t *)dst, qatomic_read((uint32_t *)src));
> >         break;
> >     case 8:
> >         qatomic_set((uint64_t *)dst, qatomic_read((uint64_t *)src));
> >         break;
> >     default:
> >         g_assert_not_reached();
> >     }
> > }
> 
> [...]
> 
> > Yes, I think one preparatory patch can added in (v4) to replace memcpy() with
> > memmove() in the following paths, extending commit 4a73aee8814 ("softmmu: Use
> > memmove in flatview_write_continue"). With this replacement, qemu_ram_copy()
> > won't be needed in (v4).
> > 
> >     hw/remote/vfio-user-obj.c::vfu_object_mr_rw
> >     include/system/memory.h::address_space_read
> >     system/physmem.c::flatview_read_continue_step
> >     system/physmem.c::address_space_write_rom
> 
> Now after a second look, I think it's safe to drop
> address_space_write_rom() in the change list because it always directly
> manipulates the real RAM (that plays the ROM role).  I recall it was used
> to be used in debugging path, but at least now when I look at master branch
> it's not.  So we can drop.
> 
> I see you already ruled out address_space_read(), I'm not sure if it's
> about having that __builtin_constant_p() early check: I think it's still
> better to switch that to the new API too, then we get rid of implicit
> assumptions of memcpy() over builtin constants.
> 
> Thanks,
> 
> -- 
> Peter Xu


