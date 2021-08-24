Received: by 2002:a19:e212:0:0:0:0:0 with SMTP id z18csp2647032lfg;
        Tue, 24 Aug 2021 02:50:08 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJytxPo1yRsRxz0pncyncd1RPCIBnBOrDQJdDa7tdykpy2MWZ5NM+kp21iARCtHTjANewcF+
X-Received: by 2002:a05:6e02:2184:: with SMTP id j4mr27027332ila.30.1629798607977;
        Tue, 24 Aug 2021 02:50:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1629798607; cv=none;
        d=google.com; s=arc-20160816;
        b=hMVRbJve+J2JZ0lapkZuTuK1qXJhn33mayqMDc3QSUzq5YWnQN1wi5hWYZXqdXpGZ9
         SNCCqiq9CJa3MybynBaCUZjAMYahf2R+2b+TLdFj3ZBhAiOSgj3CmYqG/hjcq/Ao4f/f
         L9yigzUXPW+DqEPPpkYHWtkhgAFCiZAjxDKlt8h2RK2I3ICK8IFb6Cfv+e+bginO3BTB
         xWmvPJ/+wz3Zi/JCEu7UQJKzsC9iL7naLiniqg07LNLrOXgTeX5eAhyb/ieQhAvzojxj
         H6RTYMFtTg9cnLOi4cgml8WYSjZDZSBUJDBTAU/zyqqu/rrNr4CRZiMg0cUGBbhVEAxX
         ph8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=TlHlZaPiAY1s5UpIbxwIHBY1i4JFWtETnZYsle2k6v4=;
        b=OfAmmFQZ9HYK80hANbEllqC5yQvpOL/0j1Dr9ntF1EgMblwLlnn9tRsnjF0Occ6TUQ
         DFxUoYJbtYixuzES3y1e+4Sdy0ChtVriiEETF+mAeMww5vhNKp+zwObHsoeayRCnr2CN
         VzqAkkPfm1kI3Xt9fvx8gqhvBAKkwFj8DEPAa1Q1EoqMBQ3zUAoMyNOMt09F9/R5MDjW
         A/lk/cn6nxgBB3mNnDOv/HrE6MQnp1hBJm/OXFGHsEf1esTOBCfyLqBmekQ9kZSRDXG9
         MdsdAUmkrW5GGiJUQwOhjQarSDW7J2FFJAmvYKPaWbvPbIjU4WWLTjsgb2Guh5+X72rL
         daRA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=HvBbdIvG;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f15si4097076jav.0.2021.08.24.02.50.07
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 24 Aug 2021 02:50:07 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=HvBbdIvG;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:47244 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mIT4J-0005zG-A9
	for alex.bennee@linaro.org; Tue, 24 Aug 2021 05:50:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45748)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mIT4A-0005yq-Uf
 for qemu-arm@nongnu.org; Tue, 24 Aug 2021 05:49:58 -0400
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e]:36503)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mIT49-0003r8-2k
 for qemu-arm@nongnu.org; Tue, 24 Aug 2021 05:49:58 -0400
Received: by mail-ed1-x52e.google.com with SMTP id b7so30738497edu.3
 for <qemu-arm@nongnu.org>; Tue, 24 Aug 2021 02:49:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=TlHlZaPiAY1s5UpIbxwIHBY1i4JFWtETnZYsle2k6v4=;
 b=HvBbdIvGgBrJtqyLPfdZv/EuX1kLgxbMLgsUrHX9qKHgFo7nNNzbXeOdFXg0PvmqlB
 crH8wkdT/8vn8C3okP0FiqVQ2U1nNwzO8sjp79cEYDZk4G2O671b0OclBuduxMGMWa6c
 9qvQPYsE95GrGcAUINFYHGEFfXlDaTkIl/yuJGXTxDS0KUW57H3Yj6bsjyXUfA9Bwosm
 EEREAGjMp5OWdyIu8uh+zLH4iJQpRbA34ctzH6UCANknlobp5KCDHGnbYi0jCJC6sLa6
 /WpgdgJ0IjoU7NKX5U+WADkx9yXR4LRtwbUKDyqXJZCRp8AWBu6/el8Ak/FagHG4Ub8x
 uxJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=TlHlZaPiAY1s5UpIbxwIHBY1i4JFWtETnZYsle2k6v4=;
 b=TEYU5HTtN/snRuVrj8ZlzX/rtfK+Gy1s2Fc9qdcGLhdZ99SLHlxm/6A6YMt12nXjaq
 VLisfNjY/QMJXW7vcpFrgDeEqi5RY3AiLw3rOqIONSEdtuTU+NKAjoqJHWDBDwXYW/Oq
 uNkwFv0BpH5a1dSeUrBgHzyWMA/hpOKazceeD+n0obtCzUCRurQROyKBxieZcUhEiEp8
 HOG9krq/F/6YkQSyFy1Ov51G/I7keSYXe/sqP1Zuo+MkqDVNtRpTcqKPxROrEokWNNJh
 NDXnaGyQe4Rz3fBAVPglbYyOWK/NHTDK6JKN+WZYVLbWOBoGIe22+lBCY0UrqnCkDuEW
 YY5g==
X-Gm-Message-State: AOAM530tdhwljYH6OfHSntQwXM2jIkCsNvJhlAkqpsX7fraq0gXtup7B
 KQlRQi2C71YHpkzPXflsfm3iijSezsMu0mafmqq2WQ==
X-Received: by 2002:a05:6402:3099:: with SMTP id
 de25mr41789488edb.36.1629798594960; 
 Tue, 24 Aug 2021 02:49:54 -0700 (PDT)
MIME-Version: 1.0
References: <20210823164157.751807-1-philmd@redhat.com>
 <CAFEAcA9_=6n4w86gD3MHhiLeCiui9_+ePT7E2sSHdSRufUJdyA@mail.gmail.com>
 <YSQKHaGiJZE5OAk2@t490s>
In-Reply-To: <YSQKHaGiJZE5OAk2@t490s>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 24 Aug 2021 10:49:07 +0100
Message-ID: <CAFEAcA_23vc7hE3iaM-JVA6W38LK4hJoWae5KcknhPRD5fPBZA@mail.gmail.com>
Subject: Re: [RFC PATCH v2 0/5] physmem: Have flaview API check bus permission
 from MemTxAttrs argument
To: Peter Xu <peterx@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::52e;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: David Hildenbrand <david@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Li Qiang <liq3ea@gmail.com>, QEMU Developers <qemu-devel@nongnu.org>,
 Qiuhao Li <Qiuhao.Li@outlook.com>, Alexander Bulekov <alxndr@bu.edu>,
 qemu-arm <qemu-arm@nongnu.org>, Gerd Hoffmann <kraxel@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ErR2PDjyymx2

On Mon, 23 Aug 2021 at 21:50, Peter Xu <peterx@redhat.com> wrote:
>
> On Mon, Aug 23, 2021 at 08:10:50PM +0100, Peter Maydell wrote:
> > On Mon, 23 Aug 2021 at 17:42, Philippe Mathieu-Daud=C3=A9 <philmd@redha=
t.com> wrote:
> > >
> > > This series aim to kill a recent class of bug, the infamous
> > > "DMA reentrancy" issues found by Alexander while fuzzing.
> > >
> > > Introduce the 'bus_perm' field in MemTxAttrs, defining 3 bits:
> > >
> > > - MEMTXPERM_UNSPECIFIED (current default, unchanged behavior)
> > > - MEMTXPERM_UNRESTRICTED (allow list approach)
> > > - MEMTXPERM_RAM_DEVICE (example of deny list approach)
> > >
> > > If a transaction permission is not allowed (for example access
> > > to non-RAM device), we return the specific MEMTX_BUS_ERROR.
> > >
> > > Permissions are checked in after the flatview is resolved, and
> > > before the access is done, in a new function: flatview_access_allowed=
().
> >
> > So I'm not going to say 'no' to this, because we have a real
> > recursive-device-handling problem and I don't have a better
> > idea to hand, but the thing about this is that we end up with
> > behaviour which is not what the real hardware does. I'm not
> > aware of any DMA device which has this kind of "can only DMA
> > to/from RAM, and aborts on access to a device" behaviour...
>
> Sorry for not being familiar with the context - is there more info regard=
ing
> the problem to fix?

So, the general problem is that we have a whole class of bugs
that look like this:

 * Device A is DMA-capable. It also has a set of memory
   mapped registers which can be used to control it.
 * Malicious guest code (or the fuzzer) programs A's DMA
   engine to do a DMA read or write to the address where
   A's own registers are mapped.
 * Typically, the MemoryRegionOps write function for the
   register block will handle the "write to start-dma
   register" by doing the DMA, ie calling address_space_write(),
   pci_dma_write(), or equivalent. Because of the target address
   the guest code has set, that will result in the memory
   subsystem calling back into the same MemoryRegionOps
   write function, recursively.
 * Our code implementing the model of device A is not at
   all expecting this re-entrancy, and might crash, access
   freed memory, or otherwise misbehave.

You can elaborate on that basic scenario, for instance with
a loop of multiple devices where you program device A to
do a DMA write to device B's registers which starts device B doing
a DMA write to A's registers. Nor is it inherently limited to
DMA -- device A could be made to assert a qemu_irq that is
connected to device B in a way that causes device B to
do something that results in code calling back into device A;
or maybe device A DMAs to a register in device B that implements
a device-reset on device A. DMA is just the easiest for guest
code to set up and has the least restrictions on how it's
connected up.

In some specific cases we have "fixed" individual instances
of this bug by putting in checks or changes to whatever device
model the fuzzer happened to find a problem with, or put in
slightly wider-scale attempts to catch this (eg commit 22dc8663d9f
which prevents re-entering a NIC device's packet-rx callback
function if the guest has set it up so that a received packet
results in DMA that triggers another received packet). But
we don't have a coherent model of how we ought to structure
device models that can avoid this problem in a general way,
and I think that until we do we're liable to keep running into
specific bugs, some of which will be (or at least be labelled
as) "security issues".

Philippe's series here tries to fix this for at least any
variety of this bug where there is a DMA access in the
loop, by forbidding DMA accesses to MMIO regions not backed
by RAM. That works, in that it breaks the loop; as I
mentioned in my other email, it does it in a way that's
not the way real h/w behaves. Unfortunately "what does real
h/w do?" is not in this situation necessarily a helpful
guide for QEMU design: I think that real hardware:
(a) often doesn't see the same kind of problem because
   the design will usually decouple the DMA engine from
   the register-access logic in a way that means it
   naturally doesn't literally lock up
(b) often won't have been designed to deal with "software
   programs a DMA-to-self" either, but the threat model
   for real hw is different, in that software has many ways
   of making the overall system crash, hang or misbehave;
   it often doesn't have the "need to allow untrusted
   software to touch this device" situation.

One could have QEMU work somewhat like (a) by mandating
that all DMA of any kind was done in separate bottom-half
routines and not directly from the register-write code.
That would probably reduce performance and be a lot of
code to restructure. It would deal also with another class
of "guest code can make QEMU hang by programming it to do
an enormous DMA all at once or by setting up an infinitely
looping chain of DMA commands" bugs, though.

I was vaguely tossing an idea around in the back of my mind
about whether you could have a flag on devices that marked
them as "this device is currently involved in IO", such that
you could then just fail the last DMA (or qemu_irq_set, or
whatever) that would complete the loop back to a device that
was already doing IO. But that would need a lot of thinking
through to figure out if it's feasible, and it's probably
a lot of code change.

thanks
-- PMM
