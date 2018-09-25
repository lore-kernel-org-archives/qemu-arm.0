Received: by 2002:a5d:4c4c:0:0:0:0:0 with SMTP id n12-v6csp826440wrt;
        Tue, 25 Sep 2018 08:43:09 -0700 (PDT)
X-Google-Smtp-Source: ACcGV6089bWPXeMMaaER1ECqeOpn2hfYub339C9coLcFrAJfCdEya/VCTMesEJRNr7HWuXmkGo2n
X-Received: by 2002:a0c:d093:: with SMTP id z19-v6mr1214038qvg.35.1537890189171;
        Tue, 25 Sep 2018 08:43:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1537890189; cv=none;
        d=google.com; s=arc-20160816;
        b=h6TF+zMpYbic7rOp2J5S4IR4ZFAolUUDZxcmBgXHfhhM+rQjRuH2ntSDPgPd+ZyDXc
         6mJ0+PpwTQqbMUnMZaFNNl5VUw+yryeGuV5JlRNV+3/MFsyhaRlEI6L+7w1TM7VZFSSt
         W7TzMyqNcS3eW/yS+1fCgbTpbZXuI3+/pQJ1cj4+3upECsjkT8+pF+8/bh3TbSp9x+cL
         3jSWoeZqLZlG54EHGdCmZBFzSw4oqkU63rYRx9YtvCOQ1YhHcPWiqD8LKWF6hUqA3/Fu
         As9g7PAo3E5U+ag1DGDm4KIK/euYwYU6OJeNfPZu+Bo5eP/5q5hr/tLvwAE1+zxWe6A2
         EP8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature;
        bh=sgf/b+GW4D+QB9+1Bc9OJneJBy6ZxyZ3LaBwuga6/zc=;
        b=ApaAMLN6SZrWrbukILmL52Y1aQbDkVIbRhtYkbUpvfbG97etyXYKh6MbM+9LmIsTSa
         j78qeMab8DZkOUmVvprUOncbQDqtLvx95DQYmVf7d8eYjGlFPfq3QyBPClwlXEFxRBo7
         0suOCrSg3Y8f7BrCqcrS0jJ8fE4Sx18FnPCPA8dmO+WpVdedDgjbifr4Ch0ZZeJ/EPVP
         mVYRCWKk60dm/XRFHtMiTkgk2l0AInJlt0ZXYRqrOiVmx2vMW8qiZ0cJ/fr1z7W+1bI+
         KoUOr6IoJniAFYCh3nnQZk3fEMrgZmdK+riG+u4Urgi8bzf31Cvv3GK/evkQ3oQvKyo3
         nVsw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="N8wuQx8/";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id b37-v6si573682qkb.397.2018.09.25.08.43.08
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 25 Sep 2018 08:43:09 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="N8wuQx8/";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:53811 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1g4pUS-0007q0-FP
	for alex.bennee@linaro.org; Tue, 25 Sep 2018 11:43:08 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46447)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1g4p6y-00030v-EK
	for qemu-devel@nongnu.org; Tue, 25 Sep 2018 11:18:53 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1g4p6w-0007X5-DH
	for qemu-devel@nongnu.org; Tue, 25 Sep 2018 11:18:52 -0400
Received: from mail-ot1-x343.google.com ([2607:f8b0:4864:20::343]:33895)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1g4p6v-0007WL-NV
	for qemu-devel@nongnu.org; Tue, 25 Sep 2018 11:18:50 -0400
Received: by mail-ot1-x343.google.com with SMTP id i12-v6so24866529otl.1
	for <qemu-devel@nongnu.org>; Tue, 25 Sep 2018 08:18:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=sgf/b+GW4D+QB9+1Bc9OJneJBy6ZxyZ3LaBwuga6/zc=;
	b=N8wuQx8/jEGdAIbzDXs9mGE+nvcUJYsvjBFX9JWTDy+B/lPaRNCGcXqvVrcb4+aqim
	xT2AZhMCtoCEmoLbAssIwQIK2kbQmlnheBExRKoOyH9fU0LQOzeP+7jRi8DlYhl/5vnL
	8N6BFzGbXbaydj8xLjUKoTwB3MBoCTiVbp2So=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=sgf/b+GW4D+QB9+1Bc9OJneJBy6ZxyZ3LaBwuga6/zc=;
	b=H0cKh250uhU05YH9v3SINIL6JW0CGR58h6gYQIT6InqYCpMbjAXJzMuUupQ8ffSYLn
	1RxOFSnsfhBZDdpHrhGQbOuuiz4io2rkE3fpRGY7vFCv+hRI23FpAa/XS2nmcA2vErDt
	VmTviZo3cX3lryfJGlReFVhyrRyWZMYDfhBqkjONUnYu+kFg/aaQmr0i91bKv7UVPF00
	ov/y5d7IyAF9kL8RnG5o3LxKB1kmXwIYwFVMqTQsEtZ4XCLkjPaCS2nCNVdZ16TvLw6d
	68eMERCuER3TrrpHGldV1tPryHFIDlskkQI/iKC4vFbYvyByQydzSG3o7z2i6XNKBhFJ
	CHhg==
X-Gm-Message-State: ABuFfojTj5sxL66V9Ql8dLx3sjMk+o8aebfcy3QJy9JIBcr2ETvDN8w8
	RZbMAVe+1E7efZ2GSRDws3LPBRmeVTWUs9lkOquRQg==
X-Received: by 2002:a9d:59c5:: with SMTP id
	u5-v6mr1063462otg.332.1537888728919; 
	Tue, 25 Sep 2018 08:18:48 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:20e3:0:0:0:0:0 with HTTP; Tue, 25 Sep 2018 08:18:28
	-0700 (PDT)
In-Reply-To: <20180828200348.GB3671@okra.localdomain>
References: <1529699547-17044-1-git-send-email-alindsay@codeaurora.org>
	<1529699547-17044-2-git-send-email-alindsay@codeaurora.org>
	<CAFEAcA8601LbuOOARb0KoNLjJep3-ND=Kf44OqW6NXdVtnNocw@mail.gmail.com>
	<20180828200348.GB3671@okra.localdomain>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 25 Sep 2018 16:18:28 +0100
Message-ID: <CAFEAcA-mrcrwJF7=QCerrtfDOJhoW1rdcAuGFDatFQ-W4CLn7Q@mail.gmail.com>
To: Aaron Lindsay <aclindsa@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::343
Subject: Re: [Qemu-devel] [PATCH v5 01/13] target/arm: Reorganize PMCCNTR
 accesses
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Wei Huang <wei@redhat.com>, Michael Spradling <mspradli@codeaurora.org>,
	Digant Desai <digantd@codeaurora.org>,
	Peter Crosthwaite <crosthwaite.peter@gmail.com>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Alistair Francis <alistair.francis@xilinx.com>,
	qemu-arm <qemu-arm@nongnu.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: weiv/Ym+/SFl

On 28 August 2018 at 21:03, Aaron Lindsay <aclindsa@gmail.com> wrote:
> On Jun 28 17:40, Peter Maydell wrote:
>> I had a look through the patchset, and I still can't see
>> anything here which indicates how we're handling migration.
>
> I'll admit that I had not previously thought through everything
> exhaustively, but I think I've convinced myself that *almost* everything
> is already handled by calling .readfn/writefn on the registers for
> migration... more below.

Thanks for writing up this explanation; it's very helpful. Sorry
it's taken me a while to get to it -- you unfortunately sent it
just as I was going on holiday...

>> If this field is only ever used as a temporary while we're
>> between op_start and op_finish, then we can just return it from
>> start and take it as an argument to finish, and we're fine
>> (migration of the PMCCNTR_EL0 register will be done by calling
>> its readfn on the source and its writefn on the destination).
>>
>> If there's a reason for having this be a field in the state struct
>> (I think you said counter overflow)? then we need to be sure that
>> migration is going to do the right thing and that we don't for instance
>> lose overflow indications during a migration.
>
> I think we do need additional state for supporting counter overflow
> during normal operation (more than just between op_start and op_finish),
> but I don't think sending additional state over the wire is necessary
> for migration. Let me lay out my reasoning to see if you think it makes
> sense:
>
> I observe that we seem to deal mostly with the following values with
> respect to PMU counters, and I think it might be easier to discuss this
> in terms of values rather than variables:
>
>         AC = current architectural value of PMCCNTR
>         AL = architectural value of PMCCNTR when last observed/updated by
>              the OS
>         UC = current underlying counter value
>         UL = underlying counter value when PMCCNTR last observed/updated by
>              OS
>         D = difference between underlying counter value and architectural
>             value
>
> At any given point in time, the following should then be true during
> normal execution (i.e. between OS accesses to the counter):
>         UL - AL == D == UC - AC
>
> The approach taken previous to my patchset was to store D in
> cp15.c15_ccnt most of the time, updating that variable to hold AC when
> read (by doing `c15_ccnt = UC - c15_ccnt`... an implementation using `AC
> = UC - D`, which is a different way to write `D = UC - AC` from above).
> This operation was reversed after a write completes, so that c15_ccnt
> again holds a value corresponding to D.
>
> Only storing D works well and minimizes memory usage if you don't care
> about detecting overflows. However, without some frame of reference for
> what the last observed architectural value was relative to its current
> value, we have no way to know if the counter has overflowed in the
> intervening time. In other words, we need to know both AC and AL to know
> if the counter has overflowed. Assuming we store D and can obtain UC we
> can calculate AC, but we need to store at least one additional piece of
> information to obtain AL (either AL itself or UL).

In this scheme, how do you tell the difference between "AC > AL
because it hasn't overflowed" and "AC > AL because it has overflowed
and run all the way round past AL again" ? That is, I'm not sure that
storing AL helps you to reliably detect overflow.

> In my patchset so far, I'm storing AL in c15_ccnt and D in
> c15_ccnt_delta during normal operation and AL/AC in c15_ccnt, UL/UC in
> c15_ccnt_delta between op_start and op_finish (note that AL == AC, UL ==
> UC, and D == 0 during this time). Also note that UL/UC are only stored
> between op_start and op_finish calls to avoid losing time, and are not
> needed to maintain architectural state across migrations.

> Now for migration - The read/writefn's already marshal/unmarshal both
> the counter value and overflow state to their architectural values in
> PMCCNTR and PMOVSCLR. I think this would work on its own if we made
> two big (and wrong) assumptions:
>         1. PMOVSCLR is read after PMCCNTR on save (ensures all overflows
>            which have occurred are recorded in PMOVSCLR) and written before
>            it on load (ensures any overflow bits in PMOVSCLR cause the
>            interrupt line to be raised)

There is indeed no guaranteed ordering in which registers are saved/loaded.
Also, the load function mustn't raise interrupt lines: it has to transfer
the state just of this device, and trust that the device on the other
end restores its state into one that matches the current level of the
interrupt line.

>         2. Time (as measured by `qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL)`) does
>            not change during the process of saving or loading CP registers
>            (ensures PMCCNTR can't have overflowed between when it was saved
>            and when PMOVSCLR was later saved).

I think this assumption is true, isn't it? (VM migration happens while
the VM is stopped, and do_vm_stop() calls cpu_disable_ticks() which
means QEMU_CLOCK_VIRTUAL won't advance.)

thanks
-- PMM
