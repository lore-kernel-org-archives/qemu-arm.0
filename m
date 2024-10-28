Received: by 2002:a17:504:c05:b0:1be9:327d:8ee3 with SMTP id k5csp1578478njf;
        Mon, 28 Oct 2024 09:07:04 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUyg4H5okvV+WPZwJwhKqaBgUf1JuJd0+eS91Jr5N7hBlcxhd+STbddVWLpxD4GBrNBHocIfZObquNSpQ==@linaro.org
X-Google-Smtp-Source: AGHT+IFUBrNDcKTU9GMoxQUudG2+1FDBwV0qz3pX4SmvSe27hFypMVqP6QFpsGapHbeNemgTcleM
X-Received: by 2002:a05:6122:3c4c:b0:50d:3ec1:1546 with SMTP id 71dfb90a1353d-5101502fe03mr5434221e0c.4.1730131623856;
        Mon, 28 Oct 2024 09:07:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1730131623; cv=none;
        d=google.com; s=arc-20240605;
        b=HffdCuXsJ6/8YFFDF8nPXo20ap0y6lPOo18NvZCNcn86v+yFORz5IP8Ja8iB+ou4nc
         BNggiuHRS4g1cLBHJfBm/Li7gWrUf4zuD/pxuB8c+MjerCA14/POkUwbZCvoQ6oxD1sg
         KVD5UL061FsfV/YyqMbUNCydYrfbLp7I4IzTujKvOH6TslMIbyUBaUJxAg9pl89mxhci
         LEls7DHZnv+MP03FZORUoXNedBhwt8sRDQVlGjRevY+vNUnHhyz9UZRK3pvhctIpxpAY
         78vSIQ/EzaeDDWxaIBCVMpuyR4hkv+vsbe62Gh23SFgwC3pRt6ylaRZVWqDjsINaPnQ5
         Tmfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:content-language:references:cc:to:subject:from
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=rsS8mQxKeZhOGBSkMTChVuCtbwvG+Jwr+mFK42BwE2g=;
        fh=uzzHD7q4fk764sGFgMPtZdRdE4zSHT9C3s2S1cK5/lg=;
        b=UMPB/j7EB30XdBdmU4mpXIGQCTmdpiIYDQBnIZUqrwHBUEMS9KbByTR4s41EZH6Z8q
         f+Rh8wdUPnpr4aTGGh6e8OmDL8bLqVu5phkYI9AFrTA5F374YFwV9qXIPxiL8U7F2efo
         hpyDGkOnzsGIh3McZ1k6gMZDuMN9fNzsdSOZ1Ssehc+rL6ZBb+xYik5eYzDbwfDm+/4a
         F4eQjC33vEkYvwNhPLe0xtauKG5oPBMzp6QzIx8BbtPv4Jrw0dt/o0pEVtk0IgBP+SHd
         9W0UyI7eH4mz/zKlvbFiRT8oIDcxy5zAAK8+huxdiy6oZZwO7SLTAMREe4lrl6GWLY0c
         XmZQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@daynix-com.20230601.gappssmtp.com header.s=20230601 header.b=Ou4b0G4A;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ada2fe7eead31-4a8c530ea25si1628608137.386.2024.10.28.09.07.03
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 28 Oct 2024 09:07:03 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@daynix-com.20230601.gappssmtp.com header.s=20230601 header.b=Ou4b0G4A;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1t5SGT-0003dl-Po; Mon, 28 Oct 2024 12:06:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1t5SGJ-0003ak-5X
 for qemu-arm@nongnu.org; Mon, 28 Oct 2024 12:06:35 -0400
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1t5SGF-0005q1-VX
 for qemu-arm@nongnu.org; Mon, 28 Oct 2024 12:06:34 -0400
Received: by mail-pf1-x429.google.com with SMTP id
 d2e1a72fcca58-7205646f9ebso2403618b3a.0
 for <qemu-arm@nongnu.org>; Mon, 28 Oct 2024 09:06:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20230601.gappssmtp.com; s=20230601; t=1730131587; x=1730736387;
 darn=nongnu.org; 
 h=content-transfer-encoding:in-reply-to:content-language:references
 :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
 :cc:subject:date:message-id:reply-to;
 bh=rsS8mQxKeZhOGBSkMTChVuCtbwvG+Jwr+mFK42BwE2g=;
 b=Ou4b0G4A1myPBNa1G9y70pL6SdVTShcJV7aa90pJUG9HaB90RbYbHSRGeRXOyY1r9A
 a7oht9XDQgbVp2VqoPiam5rbjkluUJpTfFj/QGl4jj/dzYnt0UXVSzRAzPFnPXIOHggR
 hYxcFAx/BPuz28ukHTEG9RmaZHRJmL/QYwsDtz5ZJOOfQZ4/a9/Ih7dBVKqgPDpkjL6D
 xA37FH6MWUvm9XFBlcKPHuihtFMt1T7m3cXZGpMYNYzhGwEDkXmlVY0zecsV6KaiAl2J
 fMLJV99IhKSohrYQcLwOtuOQR0742eIxYnSKR6B418tt2M1vlchY7NgTDP873xWGKwG9
 tNKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730131587; x=1730736387;
 h=content-transfer-encoding:in-reply-to:content-language:references
 :cc:to:subject:from:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=rsS8mQxKeZhOGBSkMTChVuCtbwvG+Jwr+mFK42BwE2g=;
 b=hpYfc2aHkHMgBwt6fkz/5qcxjDhqxWDQVjpAcNaiJMTEp82C4yUaV8PI16mc7cL+vW
 /BhSpYip+BN/tDLXDPFCzxKauKMZE3XLqR6NkYhwLuCNh+8FNPW3NrW6T8Q9l1L7LQWK
 nPDPiYGJMTQ8BZ1EijL9Y4v55IEPl6VMZa+KTdKrawwz7WxwihGyO9HhDjtst7o1Katf
 4lwApoNCPDCbnkqpLzRznKT2jFphO9UnZsnT8cV5MUxDGIwF8T4IkqtCBOrHNxK0VSuO
 Z0bv12j1r0DhEk3gniwaREEutu7D6oPfpzoU1oDQ7K0oq2UbpGx5JcQV4Vnq8/b0d00e
 e7mQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXR2KGfc0dfJH6nTiSqtwRJEXbR/ukglFOZWmzeVpKCNHp3X+RFjkugA726NOjvnKCEdnGOsPFr2A==@nongnu.org
X-Gm-Message-State: AOJu0Ywe9LStMcgnk2tzuXQFmygJ3dvXakCGcTHozDfk2LHae4lNXmTK
 lygC/yeO+kqwevV2LKPP1I/ttYIC9GPjHCTWg0dUz1JGxlR32Bo88WjGaKvUzZA=
X-Received: by 2002:a62:f24d:0:b0:71e:8049:474e with SMTP id
 d2e1a72fcca58-72063098067mr9804467b3a.26.1730131586858; 
 Mon, 28 Oct 2024 09:06:26 -0700 (PDT)
Received: from ?IPV6:2400:4050:a840:1e00:32ed:25ae:21b1:72d6?
 ([2400:4050:a840:1e00:32ed:25ae:21b1:72d6])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-72057939950sm5959797b3a.85.2024.10.28.09.06.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 28 Oct 2024 09:06:26 -0700 (PDT)
Message-ID: <dbb394d4-f8fe-484d-974c-c84275f7a1c7@daynix.com>
Date: Tue, 29 Oct 2024 01:06:18 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Akihiko Odaki <akihiko.odaki@daynix.com>
Subject: Re: [PATCH v4 02/15] hw/display/apple-gfx: Introduce
 ParavirtualizedGraphics.Framework support
To: Phil Dennis-Jordan <phil@philjordan.eu>
Cc: qemu-devel@nongnu.org, agraf@csgraf.de, peter.maydell@linaro.org,
 pbonzini@redhat.com, rad@semihalf.com, quic_llindhol@quicinc.com,
 marcin.juszkiewicz@linaro.org, stefanha@redhat.com, mst@redhat.com,
 slp@redhat.com, richard.henderson@linaro.org, eduardo@habkost.net,
 marcel.apfelbaum@gmail.com, gaosong@loongson.cn, jiaxun.yang@flygoat.com,
 chenhuacai@kernel.org, kwolf@redhat.com, hreitz@redhat.com,
 philmd@linaro.org, shorne@gmail.com, palmer@dabbelt.com,
 alistair.francis@wdc.com, bmeng.cn@gmail.com, liwei1518@gmail.com,
 dbarboza@ventanamicro.com, zhiwei_liu@linux.alibaba.com, jcmvbkbc@gmail.com,
 marcandre.lureau@redhat.com, berrange@redhat.com, qemu-arm@nongnu.org,
 qemu-block@nongnu.org, qemu-riscv@nongnu.org,
 Alexander Graf <graf@amazon.com>
References: <20241024102813.9855-1-phil@philjordan.eu>
 <20241024102813.9855-3-phil@philjordan.eu>
 <9e310d5e-ab73-47b9-b9ed-5a16d4db3fb9@daynix.com>
 <CAAibmn0NA+K63OvrsBpN1HivndyZo-fgeLwzY8AVE4hPrQR26w@mail.gmail.com>
 <dd2aae75-348d-44ad-bbd9-5d45aad15bc6@daynix.com>
 <CAAibmn1z+7yizwH8DogfcCWOWzA8Ox6e=p+Hc1pu-CS4SjAirg@mail.gmail.com>
 <6a989d04-6416-4bd9-98ac-e1230a1095a9@daynix.com>
 <CAAibmn3YEOT0O55-bwJkpi_oEGkA1WwvhC0w3jGbgXOZLTVa0w@mail.gmail.com>
 <CAAibmn3HZeDeK8FrYhHa1GGwc+N8rBuB2VvMRm7LCt0mUGmsYQ@mail.gmail.com>
 <27ced2db-472d-47ae-9047-9efc0b589a1e@daynix.com>
 <CAAibmn17=iTaEW0Q_E_n6gsS7vd-d8-w36yee9f2eZ+SR-d-ng@mail.gmail.com>
Content-Language: en-US
In-Reply-To: <CAAibmn17=iTaEW0Q_E_n6gsS7vd-d8-w36yee9f2eZ+SR-d-ng@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::429;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-pf1-x429.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
X-TUID: RDAY3NuBX2WS

On 2024/10/28 23:13, Phil Dennis-Jordan wrote:
> 
> 
> On Mon, 28 Oct 2024 at 15:02, Akihiko Odaki <akihiko.odaki@daynix.com 
> <mailto:akihiko.odaki@daynix.com>> wrote:
> 
>     On 2024/10/28 22:31, Phil Dennis-Jordan wrote:
>      >
>      >
>      > On Mon, 28 Oct 2024 at 10:00, Phil Dennis-Jordan
>     <phil@philjordan.eu <mailto:phil@philjordan.eu>
>      > <mailto:phil@philjordan.eu <mailto:phil@philjordan.eu>>> wrote:
>      >
>      >
>      >          >      >
>      >          >      > Hmm. I think if we were to use that, we would
>     need to
>      >         create a new
>      >          >      > QemuEvent for every job and destroy it afterward,
>      >         which seems
>      >          >     expensive.
>      >          >      > We can't rule out multiple concurrent jobs being
>      >         submitted, and the
>      >          >      > QemuEvent system only supports a single producer as
>      >         far as I can
>      >          >     tell.
>      >          >      >
>      >          >      > You can probably sort of hack around it with
>     just one
>      >         QemuEvent by
>      >          >      > putting the qemu_event_wait into a loop and turning
>      >         the job.done
>      >          >     flag
>      >          >      > into an atomic (because it would now need to be
>      >         checked outside the
>      >          >      > lock) but this all seems unnecessarily complicated
>      >         considering the
>      >          >      > QemuEvent uses the same mechanism QemuCond/
>     QemuMutex
>      >         internally
>      >          >     on macOS
>      >          >      > (the only platform relevant here), except we
>     can use it as
>      >          >     intended with
>      >          >      > QemuCond/QemuMutex rather than having to work
>     against the
>      >          >     abstraction.
>      >          >
>      >          >     I don't think it's going to be used concurrently. It
>      >         would be difficult
>      >          >     to reason even for the framework if it performs memory
>      >          >     unmapping/mapping/reading operations concurrently.
>      >          >
>      >          >
>      >          > I've just performed a very quick test by wrapping the job
>      >         submission/
>      >          > wait in the 2 mapMemory callbacks and the 1 readMemory
>      >         callback with
>      >          > atomic counters and logging whenever a counter went
>     above 1.
>      >          >
>      >          >   * Overall, concurrent callbacks across all types were
>      >         common (many per
>      >          > second when the VM is busy). It's not exactly a
>     "thundering
>      >         herd" (I
>      >          > never saw >2) but it's probably not a bad idea to use
>     a separate
>      >          > condition variable for each job type. (task map,
>     surface map,
>      >         memory read)
>      >          >   * While I did not observe any concurrent memory mapping
>      >         operations
>      >          > *within* a type of memory map (2 task mappings or 2
>     surface
>      >         mappings) I
>      >          > did see very occasional concurrent memory *read*
>     callbacks.
>      >         These would,
>      >          > as far as I can tell, not be safe with QemuEvents,
>     unless we
>      >         placed the
>      >          > event inside the job struct and init/destroyed it on every
>      >         callback
>      >          > (which seems like excessive overhead).
>      >
>      >         I think we can tolerate that overhead. init/destroy
>     essentially
>      >         sets the
>      >         fields in the data structure and I estimate its total size is
>      >         about 100
>      >         bytes. It is probably better than waking an irrelevant thread
>      >         up. I also
>      >         hope that keeps the code simple; it's not worthwhile
>     adding code to
>      >         optimize this.
>      >
>      >
>      >     At least pthread_cond_{init,destroy} and
>      >     pthread_mutex_{init,destroy} don't make any syscalls, so yeah
>     it's
>      >     probably an acceptable overhead.
>      >
>      >
>      > I've just experimented with QemuEvents created on-demand and ran
>     into
>      > some weird deadlocks, which then made me sit down and think about it
>      > some more. I've come to the conclusion that creating (and crucially,
>      > destroying) QemuEvents on demand in this way is not safe.
>      >
>      > Specifically, you must not call qemu_event_destroy() - which
>      > transitively destroys the mutex and condition variable - unless
>     you can
>      > guarantee that the qemu_event_set() call on that event object has
>     completed.
>      >
>      > In qemu_event_set, the event object's value is atomically set to
>     EV_SET.
>      > If the previous value was EV_BUSY, qemu_futex_wake() is called.
>     All of
>      > this is outside any mutex, however, so apart from memory coherence
>      > (there are barriers) this can race with the waiting thread.
>      > qemu_event_wait() reads the event's value. If EV_FREE, it's
>     atomically
>      > set to EV_BUSY. Then the mutex is locked, the value is checked
>     again,
>      > and if it's still EV_BUSY, it waits for the condition variable,
>      > otherwise the mutex is immediately unlocked again. If the trigger
>      > thread's qemu_event_set() flip to EV_SET occurs between the waiting
>      > thread's two atomic reads of the value, the waiting thread will
>     never
>      > wait for the condition variable, but the trigger thread WILL try to
>      > acquire the mutex and signal the condition variable in
>      > qemu_futex_wake(), by which  time the waiting thread may have
>     advanced
>      > outside of qemu_event_wait().
> 
>     Sorry if I'm making a mistake again, but the waiting thread won't
>     set to
>     EV_BUSY unless the value is EV_FREE on the second read so the trigger
>     thread will not call qemu_futex_wake() if it manages to set to EV_SET
>     before the second read, will it?
> 
> 
> This sequence of events will cause the problem:
> 
> WAITER (in qemu_event_wait):
> value = qatomic_load_acquire(&ev->value);
> -> EV_FREE
> 
> TRIGGER (in qemu_event_set):
> qatomic_read(&ev->value) != EV_SET
> -> EV_FREE (condition is false)
> 
> WAITER:
> qatomic_cmpxchg(&ev->value, EV_FREE, EV_BUSY) == EV_SET
> -> cmpxchg returns EV_FREE, condition false.
> ev->value =  EV_BUSY.
> > TRIGGER:
>          int old = qatomic_xchg(&ev->value, EV_SET);
>          smp_mb__after_rmw();
>          if (old == EV_BUSY) {
> -> old = EV_BUSY, condition true.
> ev->value = EV_SET
> 
> WAITER (in qemu_futex_wait(ev, EV_BUSY)):
>      pthread_mutex_lock(&ev->lock);
>      if (ev->value == val) {
> -> false, because value is EV_SET
> 
> WAITER:
>      pthread_mutex_unlock(&ev->lock);
>      …
>      qemu_event_destroy(&job->done_event);
> 
> TRIGGER (in qemu_futex_wake(ev, INT_MAX)):
>      pthread_mutex_lock(&ev->lock);
> -> hangs, because mutex has been destroyed

Thanks for clarification. This is very insightful.


> 
>      >
>      > This is all fine usually, BUT if you destroy the QemuEvent
>     immediately
>      > after the qemu_event_wait() call, qemu_futex_wake() may try to
>     lock a
>      > mutex that has been destroyed, or signal a condition variable
>     which has
>      > been destroyed. I don't see a reasonable way of making this safe
>     other
>      > than using long-lived mutexes and condition variables. And
>     anyway, we
>      > have much, MUCH bigger contention/performance issues coming from
>     almost
>      > everything being covered by the BQL. (If waking these callbacks
>     can even
>      > be considered an issue: I haven't seen it show up in profiling,
>     whereas
>      > BQL contention very much does.)
>      >
>      > I'll submit v5 of this patch set with separate condition
>     variables for
>      > each job type. This should make the occurrence of waking the wrong
>      > thread quite rare, while reasoning about correctness is pretty
>      > straightforward. I think that's good enough.

What about using QemuSemaphore then? It does not seem to have the 
problem same with QemuEvent.
