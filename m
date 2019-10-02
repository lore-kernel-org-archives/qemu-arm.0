Received: by 2002:adf:ef42:0:0:0:0:0 with SMTP id c2csp1093366wrp;
        Wed, 2 Oct 2019 09:30:31 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxDeJt5B2RJgzj3bH0m2U2BjIZLyUwkaUH39YHEBzryfjdr0/kM9xdmHjIHA6olZzhnk5I4
X-Received: by 2002:a17:906:e112:: with SMTP id gj18mr3837541ejb.280.1570033831495;
        Wed, 02 Oct 2019 09:30:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1570033831; cv=none;
        d=google.com; s=arc-20160816;
        b=E8wlmjDPS7ZSoJ7hb/jF+H7OP2KS5lGCvpJidPt7qhkJ7JvEsX/CTC7r03lHjK9XTH
         +tCfc1pAQcFT971nCFCKjQYinWUzaJ1e/d8dCTBwdk8fhVM9QQMdVaVQzAyhUJQDG9Rj
         DA5KX2DWcim1bQ7xaWOTYnG6cDqGlov1OEWsOcFpwIByoGxeR3MDzfxrWzfyCekwiHbp
         GEboHbsEO6T5+50lLW7G1XBYUrhJ6AISlwwbV6myMhWG6IhRafPb4aJ+4CSFiKfVB3o9
         An7YuxiFrvTKrYX087mOyJ7aM8IPBfVbpcAlUuB4K56uYXrN31eNSISC+99E8puIvmFy
         SHFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:openpgp:from:references:to:subject;
        bh=T7c8flhUbZ1C0bOSjeNuKv8I8JH+Ct/uuLyyQ9szNh8=;
        b=ekwcMy8YuH+VNWmACiCgZBIKDSNiAyyx0KM3cfCO399VEJ0Qwd0c8hA5pLE8qe7t1s
         2WsegNSBZftv3R4cEuuZC/c5bMa34SyInbTL2VyroPElroInIb2wSaEcaN6sllDUzBkH
         8sTXJpubkFMalu3MQlDYjXnwh2UKmQGBEGoVd904ZFA49lwGdeq2MhNnk/lSAdXvtjNP
         u2QThjwuVhb6FgsLjD6xvYE2PhVneg+Mw8grFvG80CJ2ZoEUTtsefN4QhR/zkgFaaY0W
         ANH+VDJp/r0TXBeshYGwPmOjWgfIiwHy3OGZvoc9oVWd/e7ZuDHGdXtJ4oRS1b7CH4f3
         qT6w==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w2si12239982edc.386.2019.10.02.09.30.31
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 02 Oct 2019 09:30:31 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:57570 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iFhWH-000573-F5
	for alex.bennee@linaro.org; Wed, 02 Oct 2019 12:30:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60220)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <pbonzini@redhat.com>) id 1iFhVv-00053i-Px
 for qemu-arm@nongnu.org; Wed, 02 Oct 2019 12:30:08 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <pbonzini@redhat.com>) id 1iFhVt-0001YO-NU
 for qemu-arm@nongnu.org; Wed, 02 Oct 2019 12:30:06 -0400
Received: from mx1.redhat.com ([209.132.183.28]:35776)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <pbonzini@redhat.com>) id 1iFhVt-0001Y3-Es
 for qemu-arm@nongnu.org; Wed, 02 Oct 2019 12:30:05 -0400
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 41A1C8830E
 for <qemu-arm@nongnu.org>; Wed,  2 Oct 2019 16:30:04 +0000 (UTC)
Received: by mail-wr1-f71.google.com with SMTP id z1so7690806wrw.21
 for <qemu-arm@nongnu.org>; Wed, 02 Oct 2019 09:30:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=T7c8flhUbZ1C0bOSjeNuKv8I8JH+Ct/uuLyyQ9szNh8=;
 b=Dxn2Ya83jP6np8aeAoInQBQmlNqHHelP9E2oo/llOYhZhQv9coqG/iWTbuMdtRuGs0
 5bE5JcdHNbAl3XcoTXp+lPcm/PWeHvV0jucgeoLyPzSlJcTsax4pzji+r7b05ZsWcBtf
 +QyGK38pryhJcRATVdNRqkLYxxq9QEHiOqKJQKKlxFVvQQTBLNQTUSdNyAowm9p4kFP5
 R5lg/miep2C7G3syjqbdnsmAunZuxgz1fTpjK+uwwo1L3ZyTr+3Gjk6RhqqwhsQoSsSf
 ZsgZajLFnN4nBXoqnsItU2FzIpxEMIb+srA+BPtbBcGtodJ3LBqlKanpzTlg4n8lb8hi
 /g1g==
X-Gm-Message-State: APjAAAWcIZMWcQFLJim/S57/YTxYakccPCs45f7mEqyMj7VieJl6oWlv
 YxbK+yKMAeONTrgtgJLyq4s1qc0Tw6/IEHCdl7NHFViE8Fxlqi78X75zv4GE3SlLdA5Oh6Inlqz
 jhAVPsGgqGq7p
X-Received: by 2002:a1c:7fcc:: with SMTP id a195mr3666549wmd.27.1570033802764; 
 Wed, 02 Oct 2019 09:30:02 -0700 (PDT)
X-Received: by 2002:a1c:7fcc:: with SMTP id a195mr3666518wmd.27.1570033802430; 
 Wed, 02 Oct 2019 09:30:02 -0700 (PDT)
Received: from [192.168.10.150] ([93.56.166.5])
 by smtp.gmail.com with ESMTPSA id f8sm4435998wmb.37.2019.10.02.09.30.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 02 Oct 2019 09:30:01 -0700 (PDT)
Subject: Re: memory barriers and ATOMIC_SEQ_CST on aarch64 (was Re:
 [Qemu-devel] qemu_futex_wait() lockups in ARM64: 2 possible issues)
To: Torvald Riegel <triegel@redhat.com>, Jan Glauber <jglauber@marvell.com>
References: <cbe46ad6-ef6c-d155-e79a-672182c725ad@ubuntu.com>
 <d94f18f1-986f-ec19-02c0-e83e5e7af3d0@redhat.com>
 <1864070a-2f84-1d98-341e-f01ddf74ec4b@ubuntu.com>
 <20190924202517.GA21422@xps13.dannf> <20191002092253.GA3857@hc>
 <ed5c4522-9250-e403-c55d-d3dbcda82540@redhat.com> <20191002110550.GA3482@hc>
 <96c26e21-5996-0c63-ce8b-99a1b5473453@redhat.com>
 <12dc4ab638bf8b5af941b24ac989ea45aa8c09b6.camel@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Openpgp: preference=signencrypt
Message-ID: <746238b0-ba75-a752-1402-5f7754a74775@redhat.com>
Date: Wed, 2 Oct 2019 18:30:00 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <12dc4ab638bf8b5af941b24ac989ea45aa8c09b6.camel@redhat.com>
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
 QEMU Developers - ARM <qemu-arm@nongnu.org>, Will Deacon <will@kernel.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: YTkh2XbSkKxi

On 02/10/19 16:58, Torvald Riegel wrote:
> This example looks like Dekker synchronization (if I get the intent right).

It is the same pattern.  However, one of the two synchronized variables
is a counter rather than just a flag.

> Two possible implementations of this are either (1) with all memory
> accesses having seq-cst MO, or (2) with relaxed-MO accesses and seq-cst
> fences on between the store and load on both ends.  It's possible to mix
> both, but that get's trickier I think.  I'd prefer the one with just
> fences, just because it's easiest, conceptually.

Got it.

I'd also prefer the one with just fences, because we only really control
one side of the synchronization primitive (ctx_notify_me in my litmus
test) and I don't like the idea of forcing seq-cst MO on the other side
(bh_scheduled).  The performance issue that I mentioned is that x86
doesn't have relaxed fetch and add, so you'd have a redundant fence like
this:

	lock	xaddl $2, mem1
	mfence
	...
	movl	mem1, %r8

(Gory QEMU details however allow us to use relaxed load and store here,
because there's only one writer).

> It works if you use (1) or (2) consistently.  cppmem and the Batty et al.
> tech report should give you the gory details.
>
>> 1) understand why ATOMIC_SEQ_CST is not enough in this case.  QEMU code
>> seems to be making the same assumptions as Linux about the memory model,
>> and this is wrong because QEMU uses C11 atomics if available.
>> Fortunately, this kind of synchronization in QEMU is relatively rare and
>> only this particular bit seems affected.  If there is a fix which stays
>> within the C11 memory model, and does not pessimize code on x86, we can
>> use it[1] and document the pitfall.
>
> Using the fences between the store/load pairs in Dekker-like
> synchronization should do that, right?  It's also relatively easy to deal
> with.
> 
>> 2) if there's no way to fix the bug, qemu/atomic.h needs to switch to
>> __sync_fetch_and_add and friends.  And again, in this case the
>> difference between the C11 and Linux/QEMU memory models must be documented.
>
> I surely not aware of all the constraints here, but I'd be surprised if the
> C11 memory model isn't good enough for portable synchronization code (with
> the exception of the consume MO minefield, perhaps). 

This helps a lot already; I'll work on a documentation and code patch.
Thanks very much.

Paolo

>>   int main() {
>>     atomic_int ctx_notify_me = 0;
>>     atomic_int bh_scheduled = 0;
>>     {{{ {
>>           bh_scheduled.store(1, mo_release);
>>           atomic_thread_fence(mo_seq_cst);
>>           // must be zero since the bug report shows no notification
>>           ctx_notify_me.load(mo_relaxed).readsvalue(0);
>>         }
>>     ||| {
>>           ctx_notify_me.store(2, mo_seq_cst);
>>           r2=bh_scheduled.load(mo_relaxed);
>>         }
>>     }}};
>>     return 0;
>>   }

