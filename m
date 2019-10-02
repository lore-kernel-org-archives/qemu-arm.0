Received: by 2002:a17:90a:1a54:0:0:0:0 with SMTP id 20csp815366pjl;
        Wed, 2 Oct 2019 06:20:30 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzYFCq0x5LMiCTXtplxq4yQa+wneh9MNc0fZ72n9g/C7u7iGLctAd/cKOuPmYj/U0yBfkCk
X-Received: by 2002:ac8:7604:: with SMTP id t4mr3982923qtq.34.1570022430540;
        Wed, 02 Oct 2019 06:20:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1570022430; cv=none;
        d=google.com; s=arc-20160816;
        b=g5BqyXuC7xOH+xFOwQpYsyOSKXKSJGKKBE3H++GwcOW9FR4rPHIoqRoRv0Tsc/zRI0
         gHQpbwielGtvXHY9kpzib+k4QCHAl15+512Ubi/Oy3dJkHGEpGqdIF+Lcpmq3DDHD1OF
         9s3+bwSHpBoEI3BWSPYQiuJ7HAv5eDr3nuKJJuhLe9As9z1KHO4+HQdIyipmj6x6AAYn
         pZQEhn/HDxZjFTnd53Cc75isDFbSMiPVSto2cGD427WSUnIck/n5gi3TY+C/wGq5aXKs
         ObxR5LVEtinc4Majywk6hpdbw3DYLBxo/wi51eZRE3vceLwNFTBjWQHSwThcxULSH0fP
         bUOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:openpgp:from:references:to:subject;
        bh=HiSosKbL2npaAFkVwirGRZPt70/UvUVKM/bGIq2Af24=;
        b=imq68bfldAvVYTv4TYw8vMsNMZAfYp8qfYT0brkwJ36wNfYitoSfCskNqsj1X8lQrU
         qX4p0K2wvwt+rasvBE4+/rOL7Wsl6ac8mDMGcqZMeEGwG18w8nZHTXKCMdMgZujVbHFy
         b5ChylI7g+5eqioSNeLqSs/PqciVTVvKX20MzTbqkqwslEq/B5HSxvwlPHmJfYS0jzNI
         1gkZdr6Ci70sEYgrNj182zr2v1U1/a9zN6w6qCLo6HW3mWa35fp3CEp7FR7idjVCrZK4
         VVeCYQ+3JDa+fgybUYFuz2W7iZJkujhr5Fl9+NP+uhw+X/wkJbyCdYDqqAL96kGGMfHC
         LMvg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u201si15307489qka.335.2019.10.02.06.20.30
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 02 Oct 2019 06:20:30 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:55278 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iFeYP-0000xi-QE
	for alex.bennee@linaro.org; Wed, 02 Oct 2019 09:20:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55029)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <pbonzini@redhat.com>) id 1iFeYD-0000qt-AF
 for qemu-arm@nongnu.org; Wed, 02 Oct 2019 09:20:18 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <pbonzini@redhat.com>) id 1iFeYB-0004N0-0j
 for qemu-arm@nongnu.org; Wed, 02 Oct 2019 09:20:16 -0400
Received: from mx1.redhat.com ([209.132.183.28]:42678)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <pbonzini@redhat.com>) id 1iFeYA-0004M9-Nw
 for qemu-arm@nongnu.org; Wed, 02 Oct 2019 09:20:14 -0400
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 1670D4FCDA
 for <qemu-arm@nongnu.org>; Wed,  2 Oct 2019 13:20:13 +0000 (UTC)
Received: by mail-wr1-f71.google.com with SMTP id b6so7525589wrx.0
 for <qemu-arm@nongnu.org>; Wed, 02 Oct 2019 06:20:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=HiSosKbL2npaAFkVwirGRZPt70/UvUVKM/bGIq2Af24=;
 b=t8MlGLmLqD4UeNXyvQh1mLrr3P0KY0Ko9XFynovRggdUiTTUCNTa9YdGvfzB995WeL
 VVlF1AUKcNDoelyMEaZ+iTcpne5Nozizi3s8aLPqM1rIpOft9xG3GJ+UbJpOYKeQhKxg
 96XZ2lMPuY0SY7isauPf3kmQHvngC8KC2FZXGqMImkfRHGtjevs8egFOnPOs7lAr/S22
 349k5YaP6FINJ4vgw7r2NSL3Fw54gohkrMp079xoVk2JkdtkUFq/X7lrjrK30kLxHjnx
 Gl1u9VnZg3yImHwS5gtS5ftuVM8rwE6xyt0G8NG3gk7GX2r0MFuJEfxl2Jjp0WTxSKVh
 QCEw==
X-Gm-Message-State: APjAAAWcfCN/Hb9bWo4NovI86HkRBWT8cUzQKJ/ymh3gkY6rPcEx78fy
 /I519Xxd8csuaGrvj35T67zSXVitZOnPZN/kBm3LMbQINhlCjOY+uW+qxSdboY88O1m/xFE3iFS
 kwGuwEnqfsWU0
X-Received: by 2002:a1c:5454:: with SMTP id p20mr3006517wmi.93.1570022411703; 
 Wed, 02 Oct 2019 06:20:11 -0700 (PDT)
X-Received: by 2002:a1c:5454:: with SMTP id p20mr3006486wmi.93.1570022411275; 
 Wed, 02 Oct 2019 06:20:11 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:b903:6d6f:a447:e464?
 ([2001:b07:6468:f312:b903:6d6f:a447:e464])
 by smtp.gmail.com with ESMTPSA id o19sm10496752wmh.27.2019.10.02.06.20.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 02 Oct 2019 06:20:10 -0700 (PDT)
Subject: memory barriers and ATOMIC_SEQ_CST on aarch64 (was Re: [Qemu-devel]
 qemu_futex_wait() lockups in ARM64: 2 possible issues)
To: Jan Glauber <jglauber@marvell.com>
References: <cbe46ad6-ef6c-d155-e79a-672182c725ad@ubuntu.com>
 <d94f18f1-986f-ec19-02c0-e83e5e7af3d0@redhat.com>
 <1864070a-2f84-1d98-341e-f01ddf74ec4b@ubuntu.com>
 <20190924202517.GA21422@xps13.dannf> <20191002092253.GA3857@hc>
 <ed5c4522-9250-e403-c55d-d3dbcda82540@redhat.com> <20191002110550.GA3482@hc>
From: Paolo Bonzini <pbonzini@redhat.com>
Openpgp: preference=signencrypt
Message-ID: <96c26e21-5996-0c63-ce8b-99a1b5473453@redhat.com>
Date: Wed, 2 Oct 2019 15:20:09 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20191002110550.GA3482@hc>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.132.183.28
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
Cc: Rafael David Tinoco <rafaeldtinoco@ubuntu.com>,
 lizhengui <lizhengui@huawei.com>, dann frazier <dann.frazier@canonical.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Bug 1805256 <1805256@bugs.launchpad.net>,
 QEMU Developers - ARM <qemu-arm@nongnu.org>,
 Torvald Riegel <triegel@redhat.com>, Will Deacon <will@kernel.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: HbjrnVhVLhAJ

On 02/10/19 13:05, Jan Glauber wrote:
> The arm64 code generated for the
> atomic_[add|sub] accesses of ctx->notify_me doesn't contain any
> memory barriers. It is just plain ldaxr/stlxr.
> 
> From my understanding this is not sufficient for SMP sync.
> 
>>> If I read this comment correct:
>>> 
>>>     void aio_notify(AioContext *ctx)
>>>     {
>>>         /* Write e.g. bh->scheduled before reading ctx->notify_me.  Pairs
>>>          * with atomic_or in aio_ctx_prepare or atomic_add in aio_poll.
>>>          */
>>>         smp_mb();
>>>         if (ctx->notify_me) {
>>>
>>> it points out that the smp_mb() should be paired. But as
>>> I said the used atomics don't generate any barriers at all.
>>
>> Awesome!  That would be a compiler bug though, as atomic_add and atomic_sub
>> are defined as sequentially consistent:
>>
>> #define atomic_add(ptr, n) ((void) __atomic_fetch_add(ptr, n, __ATOMIC_SEQ_CST))
>> #define atomic_sub(ptr, n) ((void) __atomic_fetch_sub(ptr, n, __ATOMIC_SEQ_CST))
>
> Compiler bug sounds kind of unlikely...
Indeed the assembly produced by the compiler matches for example the
mappings at https://www.cl.cam.ac.uk/~pes20/cpp/cpp0xmappings.html.  A
small testcase is as follows:

  int ctx_notify_me;
  int bh_scheduled;

  int x()
  {
      int one = 1;
      int ret;
      __atomic_store(&bh_scheduled, &one, __ATOMIC_RELEASE);     // x1
      __atomic_thread_fence(__ATOMIC_SEQ_CST);                   // x2
      __atomic_load(&ctx_notify_me, &ret, __ATOMIC_RELAXED);     // x3
      return ret;
  }

  int y()
  {
      int ret;
      __atomic_fetch_add(&ctx_notify_me, 2, __ATOMIC_SEQ_CST);  // y1
      __atomic_load(&bh_scheduled, &ret, __ATOMIC_RELAXED);     // y2
      return ret;
  }

Here y (which is aio_poll) wants to order the write to ctx->notify_me
before reads of bh->scheduled.  However, the processor can speculate the
load of bh->scheduled between the load-acquire and store-release of
ctx->notify_me.  So you can have something like:

 thread 0 (y)                          thread 1 (x)
 -----------------------------------   -----------------------------
 y1: load-acq ctx->notify_me
 y2: load-rlx bh->scheduled
                                       x1: store-rel bh->scheduled <-- 1
                                       x2: memory barrier
                                       x3: load-rlx ctx->notify_me
 y1: store-rel ctx->notify_me <-- 2

Being very puzzled, I tried to put this into cppmem:

  int main() {
    atomic_int ctx_notify_me = 0;
    atomic_int bh_scheduled = 0;
    {{{ {
          bh_scheduled.store(1, mo_release);
          atomic_thread_fence(mo_seq_cst);
          // must be zero since the bug report shows no notification
          ctx_notify_me.load(mo_relaxed).readsvalue(0);
        }
    ||| {
          ctx_notify_me.store(2, mo_seq_cst);
          r2=bh_scheduled.load(mo_relaxed);
        }
    }}};
    return 0;
  }

and much to my surprise, the tool said r2 *can* be 0.  Same if I put a
CAS like

        cas_strong_explicit(ctx_notify_me.readsvalue(0), 0, 2,
                            mo_seq_cst, mo_seq_cst);

which resembles the code in the test case a bit more.

I then found a discussion about using the C11 memory model in Linux
(https://gcc.gnu.org/ml/gcc/2014-02/msg00058.html) which contains the
following statement, which is a bit disheartening even though it is
about a different test:

   My first gut feeling was that the assertion should never fire, but
   that was wrong because (as I seem to usually forget) the seq-cst
   total order is just a constraint but doesn't itself contribute
   to synchronizes-with -- but this is different for seq-cst fences.

and later in the thread:

   Use of C11 atomics to implement Linux kernel atomic operations
   requires knowledge of the underlying architecture and the compiler's
   implementation, as was noted earlier in this thread.

Indeed if I add an atomic_thread_fence I get only one valid execution,
where r2 must be 1.  This is similar to GCC's bug
https://gcc.gnu.org/bugzilla/show_bug.cgi?id=65697, and we can fix it in
QEMU by using __sync_fetch_and_add; in fact cppmem also shows one valid
execution if the store is replaced with something like GCC's assembly
for __sync_fetch_and_add (or Linux's assembly for atomic_add_return):

        cas_strong_explicit(ctx_notify_me.readsvalue(0), 0, 2,
                            mo_release, mo_release);
        atomic_thread_fence(mo_seq_cst);

So we should:

1) understand why ATOMIC_SEQ_CST is not enough in this case.  QEMU code
seems to be making the same assumptions as Linux about the memory model,
and this is wrong because QEMU uses C11 atomics if available.
Fortunately, this kind of synchronization in QEMU is relatively rare and
only this particular bit seems affected.  If there is a fix which stays
within the C11 memory model, and does not pessimize code on x86, we can
use it[1] and document the pitfall.

2) if there's no way to fix the bug, qemu/atomic.h needs to switch to
__sync_fetch_and_add and friends.  And again, in this case the
difference between the C11 and Linux/QEMU memory models must be documented.

Torvald, Will, help me please... :((

Paolo

[1] as would be the case if fetch_add was implemented as
fetch_add(RELEASE)+thread_fence(SEQ_CST).
