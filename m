Received: by 2002:a17:505:5382:b0:1be9:327d:8ee3 with SMTP id ma2csp2069196njb;
        Mon, 10 Feb 2025 08:49:24 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWWIa3/SqV+/Twumu2xGta3g6V05Lu/nL09uqBA0beWQqgnE4qghtjflmOVhlednT+WfMkG7gPLmyMoTg==@linaro.org
X-Google-Smtp-Source: AGHT+IGToIUJRsIAsYUWAZgNFLNtNF8Rl+a5u5X8bvv4eJcyIrqQkz42V2vco1lxFCINvx8XOAuk
X-Received: by 2002:a05:620a:4309:b0:7b1:52a9:ae1d with SMTP id af79cd13be357-7c047bf22c8mr2482625185a.6.1739206163992;
        Mon, 10 Feb 2025 08:49:23 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1739206163; cv=none;
        d=google.com; s=arc-20240605;
        b=E0f66HOZm7EaibqlVLWOhl2GHE3cV98KSJ5PJdKN+D2Q6eMJZKEMYsse79OvoGMUJP
         QUo1ApUzsGsEp3Zky3Llxivn781lemKYwIV7rVKJKbkuX79FQcg8AVBh1DEHEoxcfn5D
         1zz0IF7WgJGfye0kMxnurZZ/TSC6xsfpx+OGZC/kJZQgtC69fG6MesGRlwN0pnNbcy0K
         Bm4zUDQ0gKy8AQ26azxkWBzsFgn9puwnfS1XSbDgH2+pEK+IoGB9QxJII4+HCov7evKo
         Bvi/Uxncccl2ltFHSO/+jBUQ9RIcAEhr8TyxPSD35XdoqTEiK0+2ZmtDe6dcvl5wNVYK
         kNqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-disposition:in-reply-to
         :mime-version:references:message-id:subject:cc:to:from:date
         :dkim-signature;
        bh=AbJ/q4McdqvgWbdZpzsX0c88NodzGfPGVk3OSUhSBag=;
        fh=Y+fLzNRdJOooPOH0UlXfieqc/2dHN3YGNBM/O6SyWGY=;
        b=G5LIfuMcEUbKQ1oMcI+nG+gRkzSeuhuOlL2KBnG39kBsTezQWX5T+Aju+LMMVmvt7/
         mqau3maTTxHGy2AqRjdYh3JCtVImh9jUxDFzvK4FCe5FeK0QKcOucV/J6NkgGJbnn48b
         cvFdNbJecqF22jZWWWmwRaj2nqfHTTjK30cwF5kSm33wNgTRJkOtA43dParm6txVeA+V
         bTDq9DJMBLyO812XCEMbyuZ/3QcK5Yrv6QEN77wTPMr8EIzwEMU61HGshqiRnwmUiW+x
         uCUpiBQYgZ61HKSXgzzKTzsmIGmwzI7IPTPx1bJIZd/v0pTAFc3sks0FyOxQ+kP2qijv
         lvhg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=GsZZoUzA;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7c0522c0c67si483985985a.115.2025.02.10.08.49.23
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 10 Feb 2025 08:49:23 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=GsZZoUzA;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1thWxx-0003aU-JC; Mon, 10 Feb 2025 11:49:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1thWxs-0003Zu-O6
 for qemu-arm@nongnu.org; Mon, 10 Feb 2025 11:48:56 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1thWxq-0006nn-8T
 for qemu-arm@nongnu.org; Mon, 10 Feb 2025 11:48:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1739206132;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=AbJ/q4McdqvgWbdZpzsX0c88NodzGfPGVk3OSUhSBag=;
 b=GsZZoUzAfZ4Cu6G1O3+h+guQ045padYYUZDmd4Bv/ruC//hfKZC1P6b0ycrNhIl++TicBV
 O0pl/QOuWiZgWxTt+/1sXY2k6tSlkcKMQe32hXMKqfFMjqcfkxIejr7u0QUqElYb6dXcnG
 X9kmzmSEynVCwYJRswxsTODC4UP0A6U=
Received: from mail-oo1-f70.google.com (mail-oo1-f70.google.com
 [209.85.161.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-484-yKSBFTvHMCSMhnbGssdnbA-1; Mon, 10 Feb 2025 11:48:51 -0500
X-MC-Unique: yKSBFTvHMCSMhnbGssdnbA-1
X-Mimecast-MFC-AGG-ID: yKSBFTvHMCSMhnbGssdnbA
Received: by mail-oo1-f70.google.com with SMTP id
 006d021491bc7-5fc0058d68eso1275428eaf.0
 for <qemu-arm@nongnu.org>; Mon, 10 Feb 2025 08:48:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739206131; x=1739810931;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=AbJ/q4McdqvgWbdZpzsX0c88NodzGfPGVk3OSUhSBag=;
 b=rwxRbWEXAWSivOjSkff2rolfZS7FE+CVxB/N89/fTRIwYAe+fWmY9iRcQaz1wPpK5h
 IctUkfgSX3yuDT6QDY0StWo9Qha5tC7UFLf7SAm7FmGs0S42kikUVQpy5bU8xfUwgb5v
 t9LMpJ3qK4keJOBQe98J/vRreBXh3B00lZjA4rWkCBc7JtN2A91EizXkUTGaGC0rBd6e
 zjcO0+6qSI067ViVIiGRiWrGhVPi+a0Jefxc9RP3iRQwfmOn0IDaHwsLxJyP+gLVqtDj
 pz+lB2GO/flNDiGNqfTD88TYvsd8cryReBQCRTzNj5+8zUgIOTp285i6+8s8SiPL3Q/f
 2voA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUJXr1XdCHK8dkEAEJR1H//F+mI3lEOvjgSVw2WgMeVbT4xfGmJ3RgvFk1AxTZC0uBGNznpUSaJDQ==@nongnu.org
X-Gm-Message-State: AOJu0YyVR30sRF5lh/8l+0kRRNQTybQr5LkVBwx2xSARS0lmCwC1DFu7
 cK1MYK8vz/eIESJnl5ofn9V/3muQuWOnsCcrHAhIYwCHNZUEcJPQfpazRMcuW0COMg0Sh6eBZbX
 oUaXGmn5d/QBGqZRL/uPZcm05Xh0n6foppcR55PU3OMDuj+7uNA==
X-Gm-Gg: ASbGnctBj50gamkU5MIqax9aNG6ZoF1yIv9mRAbbr1MduemlhIFWDbrMtl2uo1xKwal
 l4HOK48hBz7XZ2iSZlsYXwnU0N4jcHDnKU7XU8svltEsTNbiTJvaNp1hBN7c0NILFb48kozVHPv
 gIwCd1D2Q9MjSQ6JK4OHtP9H/BItSo1gmM7Z1DeSwC2vXKo3r5CPqtRBHseyGvSHbbcKWVdhku5
 UIlIN01lIHY8q9BDxxffjI2a5N7K1oNhAQdMCsQAQOKPkvpGzIW3jLHeEY=
X-Received: by 2002:a05:6808:219f:b0:3eb:3f7d:b777 with SMTP id
 5614622812f47-3f3923d19d7mr10657887b6e.31.1739206130617; 
 Mon, 10 Feb 2025 08:48:50 -0800 (PST)
X-Received: by 2002:a05:6808:219f:b0:3eb:3f7d:b777 with SMTP id
 5614622812f47-3f3923d19d7mr10657866b6e.31.1739206130266; 
 Mon, 10 Feb 2025 08:48:50 -0800 (PST)
Received: from x1.local ([2604:7a40:2041:2b00::1000])
 by smtp.gmail.com with ESMTPSA id
 46e09a7af769-726af9411c5sm2467490a34.28.2025.02.10.08.48.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Feb 2025 08:48:49 -0800 (PST)
Date: Mon, 10 Feb 2025 11:48:45 -0500
From: Peter Xu <peterx@redhat.com>
To: William Roche <william.roche@oracle.com>
Cc: david@redhat.com, kvm@vger.kernel.org, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, pbonzini@redhat.com,
 richard.henderson@linaro.org, philmd@linaro.org,
 peter.maydell@linaro.org, mtosatti@redhat.com, imammedo@redhat.com,
 eduardo@habkost.net, marcel.apfelbaum@gmail.com,
 wangyanan55@huawei.com, zhao1.liu@intel.com, joao.m.martins@oracle.com
Subject: Re: [PATCH v7 3/6] accel/kvm: Report the loss of a large memory page
Message-ID: <Z6ot7eVxaf39oWKr@x1.local>
References: <20250201095726.3768796-1-william.roche@oracle.com>
 <20250201095726.3768796-4-william.roche@oracle.com>
 <Z6JH_OyppIA7WFjk@x1.local>
 <3f3ebbe8-be97-4827-a8c5-6777dea08707@oracle.com>
 <Z6Oaukumli1eIEDB@x1.local>
 <2ad49f5d-f2c1-4ba2-9b6b-77ba96c83bab@oracle.com>
MIME-Version: 1.0
In-Reply-To: <2ad49f5d-f2c1-4ba2-9b6b-77ba96c83bab@oracle.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: rbcHUuhYYFj3tVejW2QD6iyIVKWik09Fz50XGKesOqQ_1739206131
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.388,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=0.001,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: cbw77Fw1x1kj

On Fri, Feb 07, 2025 at 07:02:22PM +0100, William Roche wrote:
> On 2/5/25 18:07, Peter Xu wrote:
> > On Wed, Feb 05, 2025 at 05:27:13PM +0100, William Roche wrote:
> > > [...]
> > > The HMP command "info ramblock" is implemented with the ram_block_format()
> > > function which returns a message buffer built with a string for each
> > > ramblock (protected by the RCU_READ_LOCK_GUARD). Our new function copies a
> > > struct with the necessary information.
> > > 
> > > Relaying on the buffer format to retrieve the information doesn't seem
> > > reasonable, and more importantly, this buffer doesn't provide all the needed
> > > data, like fd and fd_offset.
> > > 
> > > I would say that ram_block_format() and qemu_ram_block_info_from_addr()
> > > serve 2 different goals.
> > > 
> > > (a reimplementation of ram_block_format() with an adapted version of
> > > qemu_ram_block_info_from_addr() taking the extra information needed could be
> > > doable for example, but may not be worth doing for now)
> > 
> > IIUC admin should be aware of fd_offset because the admin should be fully
> > aware of the start offset of FDs to specify in qemu cmdlines, or in
> > Libvirt. But yes, we can always add fd_offset into ram_block_format() if
> > it's helpful.
> > 
> > Besides, the existing issues on this patch:
> > 
> >    - From outcome of this patch, it introduces one ramblock API (which is ok
> >      to me, so far), to do some error_report()s.  It looks pretty much for
> >      debugging rather than something serious (e.g. report via QMP queries,
> >      QMP events etc.).  From debug POV, I still don't see why this is
> >      needed.. per discussed above.
> 
> The reason why I want to inform the user of a large memory failure more
> specifically than a standard sized page loss is because of the significant
> behavior difference: Our current implementation can transparently handle
> many situations without necessarily leading the VM to a crash. But when it
> comes to large pages, there is no mechanism to inform the VM of a large
> memory loss, and usually this situation leads the VM to crash, and can also
> generate some weird situations like qemu itself crashing or a loop of
> errors, for example.
> 
> So having a message informing of such a memory loss can help to understand a
> more radical VM or qemu behavior -- it increases the diagnosability of our
> code.
> 
> To verify that a SIGBUS appeared because of a large page loss, we currently
> need to verify the targeted memory block backend page_size.
> We should usually get this information from the SIGBUS siginfo data (with a
> si_addr_lsb field giving an indication of the page size) but a KVM weakness
> with a hardcoded si_addr_lsb=PAGE_SHIFT value in the SIGBUS siginfo returned
> from the kernel prevents that: See kvm_send_hwpoison_signal() function.
> 
> So I first wrote a small API addition called qemu_ram_pagesize_from_addr()
> to retrieve only this page_size value from the impacted address; and later
> on, this function turned into the richer qemu_ram_block_info_from_addr()
> function to have the generated messages match the existing memory messages
> as rightly requested by David.
> 
> So the main reason is a KVM "weakness" with kvm_send_hwpoison_signal(), and
> the second reason is to have richer error messages.

This seems true, and I also remember something when I looked at this
previously but maybe nobody tried to fix it.  ARM seems to be correct on
that field, otoh.

Is it possible we fix KVM on x86?

kvm_handle_error_pfn() has the fault context, so IIUC it should be able to
figure that out too like what ARM does (with get_vma_page_shift()).

> 
> 
> 
> >    - From merge POV, this patch isn't a pure memory change, so I'll need to
> >      get ack from other maintainers, at least that should be how it works..
> 
> I agree :)
> 
> > 
> > I feel like when hwpoison becomes a serious topic, we need some more
> > serious reporting facility than error reports.  So that we could have this
> > as separate topic to be revisited.  It might speed up your prior patches
> > from not being blocked on this.
> 
> I explained why I think that error messages are important, but I don't want
> to get blocked on fixing the hugepage memory recovery because of that.

What is the major benefit of reporting in QEMU's stderr in this case?

For example, how should we consume the error reports that this patch
introduces?  Is it still for debugging purpose?

I agree it's always better to dump something in QEMU when such happened,
but IIUC what I mentioned above (by monitoring QEMU ramblock setups, and
monitor host dmesg on any vaddr reported hwpoison) should also allow anyone
to deduce the page size of affected vaddr, especially if it's for debugging
purpose.  However I could possibly have missed the goal here..

> 
> If you think that not displaying a specific message for large page loss can
> help to get the recovery fixed, than I can change my proposal to do so.
> 
> Early next week, I'll send a simplified version of my first 3 patches
> without this specific messages and without the preallocation handling in all
> remap cases, so you can evaluate this possibility.

Yes IMHO it'll always be helpful to separate it if possible.

Thanks,

-- 
Peter Xu

