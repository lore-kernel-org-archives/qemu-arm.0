Received: by 2002:a17:504:c05:b0:1be9:327d:8ee3 with SMTP id k5csp1489850njf;
        Mon, 28 Oct 2024 07:02:44 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUQIyrhzXk/bB8hzsjXp8YZ4dfJwmNI1vvURMv7js4K2fxTFVN029HnATmaBtSKvYIGfLqlw2GWE218VQ==@linaro.org
X-Google-Smtp-Source: AGHT+IEc8EvkfUr4BKfZkzATuqUi476lg4Z4GTxGnv/rBkyWJZxAuIV9trdjLuiSaPEegrEw/l5D
X-Received: by 2002:a05:6102:b09:b0:4a4:7e84:d654 with SMTP id ada2fe7eead31-4a870e4263cmr9725447137.14.1730124164502;
        Mon, 28 Oct 2024 07:02:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1730124164; cv=none;
        d=google.com; s=arc-20240605;
        b=He26ZULEe+n5fVDiJPGHEkSMvWC4k16prbDNJuhVtMG8T/Vc26t9ZsyAyYa3JuM8AN
         9/Au9mSRRLCu39mQbPGfKydrDmFVEdTWIXLtB+FR6+XtsiL6eYq/siKsZi6l+8uRmoqR
         pQI0js8dEAREQGdGNFD3qY+pJjrMm7NagnZFgDXdu0rGBeja5RTFTWzbUF1XK47UN5n/
         XcNDYD9XCaa15Q1Go2SL2ZoSeL026JbClQQilF3jVuX83r149/X5dIQkMIzaIRtvV2bC
         vFloa65mTs5J74prPLWfbZojDmme5q4VNu0lRZM9hatYKyZYhoKSYMkd01McXjPC9pMA
         4Kxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=wtG2C+LSWv2iJcbLJZP3g8IvrKiDABlL6MCN4sSJ+6o=;
        fh=wP9731T6Vfsy1Jks/DKD1Hc12RLV0bl/8Sypb/AT3f0=;
        b=B+KXYSkZ5DG47XiAyt6UXFshqgHZBtwEYWace7ubDs1AGes6623GUq1d6PQhL8NkcB
         nWQAOQgTjKnQY0vIYX6Cv1h6XQ8BKs2vHuc6yQ70Wffct92FlovUfBzyncT1uVf895AM
         WMefxTmPUedGMDuTOAZIzaD4gxZq+hjzT6ypP4w7Nq7YPkwriZQ4+OVp6KvWubaT2O+8
         Q5qqCnyGhgRfBFDOSzCohvGMd77DniJ/LA07JTFHOWGVm6rlDaWH6+rJWIm33OhUf7fa
         nwM5Bc000a29bbgbUnGKyspMST8NPrOedq6OjDsLxa4ltvJPCClZHtUYDnoJ1OT8Ykig
         V2XQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@daynix-com.20230601.gappssmtp.com header.s=20230601 header.b=JJIfCQ2A;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ada2fe7eead31-4a8c530dff7si1468286137.313.2024.10.28.07.02.44
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 28 Oct 2024 07:02:44 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@daynix-com.20230601.gappssmtp.com header.s=20230601 header.b=JJIfCQ2A;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1t5QK5-0001Ug-LE; Mon, 28 Oct 2024 10:02:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1t5QJy-0001Ts-A7
 for qemu-arm@nongnu.org; Mon, 28 Oct 2024 10:02:14 -0400
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1t5QJv-0007ev-R0
 for qemu-arm@nongnu.org; Mon, 28 Oct 2024 10:02:13 -0400
Received: by mail-pl1-x636.google.com with SMTP id
 d9443c01a7336-20c803787abso33829925ad.0
 for <qemu-arm@nongnu.org>; Mon, 28 Oct 2024 07:02:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20230601.gappssmtp.com; s=20230601; t=1730124130; x=1730728930;
 darn=nongnu.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=wtG2C+LSWv2iJcbLJZP3g8IvrKiDABlL6MCN4sSJ+6o=;
 b=JJIfCQ2AhbN91IhH62afIEwT3nD34d+CUpG1CWq4L5nvp3IGBYMG9hjNBv/mzwn4lM
 fmxbmMvrIsPh/RcZJWFzFQixaURRAXxFnw6j9kIxhQbsIT5VsLxyX5eKQGLqwna0HZeq
 m2FBhifpQIR0Yw43UpREkBlhBf6BPMxqwpKc8trgLc0yxoTD+1HVGSqOUzv9W3+Vl+W+
 Yr6wQv0THOygpDoYuLspA7yNRdT0TRwNCtwPnzgGUl/5D9+H1PkVJj9yr+BwAjci69d6
 /7K44R+Zj4PTzruYYkB240nr55NubQZn3HjvLIHQfSZz6u5UXveM1FxRbdJTvcTgsFHY
 Djaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730124130; x=1730728930;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=wtG2C+LSWv2iJcbLJZP3g8IvrKiDABlL6MCN4sSJ+6o=;
 b=oTkjFbLayjLrlVGANY8BsTbT6VG4h3UzGxmyxQJwsDJAhu6cZc9EDYCwYi198P4Fz5
 6VUowUkCmXsKD6TRtGz+TWXC3ZB7PT0u7z3JMTKTVBOQZB0DihZp7a67FVq3Uvp+nvSW
 ujssEtOUq88STF5VWHUs15cIJDxEaXJnE+czi9UurTTpKi5s504nb/5kHWXGFFi//6q9
 aPf5TD3iX/8mHnSDR3UhX00eoZJ9XC7AOZc4jgibTXqIY4rAkGRdakptLkQGxcTYTmod
 Epqc4FB9TtcXAuXDbD4lAgI4wa3qBUxWPr4ylgMC64Z6E/qtEC69U1EDtEamUGt3Bs12
 NoFA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVhQ2SNEMtGkfa5eESIIJDjtE5ap3v2VdmXYU4eu7ArMaGv0eq/KjfQBU7nPpSnONx7G5zHUMuw5w==@nongnu.org
X-Gm-Message-State: AOJu0Yz274CD8ZtBPOhMmqiZnQ28z6NaN8QcwXQLjzaTJgmDP9o4WFIS
 0aLBeq/L6K6EehW8FCSPWP8yYd6WEhuzB+OvWpKPUZmxT25olkm5zPRPjpJDQh8=
X-Received: by 2002:a17:902:e804:b0:205:5d71:561e with SMTP id
 d9443c01a7336-210c5a76778mr135905415ad.26.1730124130198; 
 Mon, 28 Oct 2024 07:02:10 -0700 (PDT)
Received: from ?IPV6:2400:4050:a840:1e00:32ed:25ae:21b1:72d6?
 ([2400:4050:a840:1e00:32ed:25ae:21b1:72d6])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-210bbf87e0fsm50570785ad.113.2024.10.28.07.02.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 28 Oct 2024 07:02:09 -0700 (PDT)
Message-ID: <27ced2db-472d-47ae-9047-9efc0b589a1e@daynix.com>
Date: Mon, 28 Oct 2024 23:02:02 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
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
Content-Language: en-US
From: Akihiko Odaki <akihiko.odaki@daynix.com>
In-Reply-To: <CAAibmn3HZeDeK8FrYhHa1GGwc+N8rBuB2VvMRm7LCt0mUGmsYQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::636;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-pl1-x636.google.com
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
X-TUID: MYc54LlDIGrp

On 2024/10/28 22:31, Phil Dennis-Jordan wrote:
> 
> 
> On Mon, 28 Oct 2024 at 10:00, Phil Dennis-Jordan <phil@philjordan.eu 
> <mailto:phil@philjordan.eu>> wrote:
> 
> 
>          >      >
>          >      > Hmm. I think if we were to use that, we would need to
>         create a new
>          >      > QemuEvent for every job and destroy it afterward,
>         which seems
>          >     expensive.
>          >      > We can't rule out multiple concurrent jobs being
>         submitted, and the
>          >      > QemuEvent system only supports a single producer as
>         far as I can
>          >     tell.
>          >      >
>          >      > You can probably sort of hack around it with just one
>         QemuEvent by
>          >      > putting the qemu_event_wait into a loop and turning
>         the job.done
>          >     flag
>          >      > into an atomic (because it would now need to be
>         checked outside the
>          >      > lock) but this all seems unnecessarily complicated
>         considering the
>          >      > QemuEvent uses the same mechanism QemuCond/QemuMutex
>         internally
>          >     on macOS
>          >      > (the only platform relevant here), except we can use it as
>          >     intended with
>          >      > QemuCond/QemuMutex rather than having to work against the
>          >     abstraction.
>          >
>          >     I don't think it's going to be used concurrently. It
>         would be difficult
>          >     to reason even for the framework if it performs memory
>          >     unmapping/mapping/reading operations concurrently.
>          >
>          >
>          > I've just performed a very quick test by wrapping the job
>         submission/
>          > wait in the 2 mapMemory callbacks and the 1 readMemory
>         callback with
>          > atomic counters and logging whenever a counter went above 1.
>          >
>          >   * Overall, concurrent callbacks across all types were
>         common (many per
>          > second when the VM is busy). It's not exactly a "thundering
>         herd" (I
>          > never saw >2) but it's probably not a bad idea to use a separate
>          > condition variable for each job type. (task map, surface map,
>         memory read)
>          >   * While I did not observe any concurrent memory mapping
>         operations
>          > *within* a type of memory map (2 task mappings or 2 surface
>         mappings) I
>          > did see very occasional concurrent memory *read* callbacks.
>         These would,
>          > as far as I can tell, not be safe with QemuEvents, unless we
>         placed the
>          > event inside the job struct and init/destroyed it on every
>         callback
>          > (which seems like excessive overhead).
> 
>         I think we can tolerate that overhead. init/destroy essentially
>         sets the
>         fields in the data structure and I estimate its total size is
>         about 100
>         bytes. It is probably better than waking an irrelevant thread
>         up. I also
>         hope that keeps the code simple; it's not worthwhile adding code to
>         optimize this.
> 
> 
>     At least pthread_cond_{init,destroy} and
>     pthread_mutex_{init,destroy} don't make any syscalls, so yeah it's
>     probably an acceptable overhead.
> 
> 
> I've just experimented with QemuEvents created on-demand and ran into 
> some weird deadlocks, which then made me sit down and think about it 
> some more. I've come to the conclusion that creating (and crucially, 
> destroying) QemuEvents on demand in this way is not safe.
> 
> Specifically, you must not call qemu_event_destroy() - which 
> transitively destroys the mutex and condition variable - unless you can 
> guarantee that the qemu_event_set() call on that event object has completed.
> 
> In qemu_event_set, the event object's value is atomically set to EV_SET. 
> If the previous value was EV_BUSY, qemu_futex_wake() is called. All of 
> this is outside any mutex, however, so apart from memory coherence 
> (there are barriers) this can race with the waiting thread. 
> qemu_event_wait() reads the event's value. If EV_FREE, it's atomically 
> set to EV_BUSY. Then the mutex is locked, the value is checked again, 
> and if it's still EV_BUSY, it waits for the condition variable, 
> otherwise the mutex is immediately unlocked again. If the trigger 
> thread's qemu_event_set() flip to EV_SET occurs between the waiting 
> thread's two atomic reads of the value, the waiting thread will never 
> wait for the condition variable, but the trigger thread WILL try to 
> acquire the mutex and signal the condition variable in 
> qemu_futex_wake(), by which  time the waiting thread may have advanced 
> outside of qemu_event_wait().

Sorry if I'm making a mistake again, but the waiting thread won't set to 
EV_BUSY unless the value is EV_FREE on the second read so the trigger 
thread will not call qemu_futex_wake() if it manages to set to EV_SET 
before the second read, will it?

> 
> This is all fine usually, BUT if you destroy the QemuEvent immediately 
> after the qemu_event_wait() call, qemu_futex_wake() may try to lock a 
> mutex that has been destroyed, or signal a condition variable which has 
> been destroyed. I don't see a reasonable way of making this safe other 
> than using long-lived mutexes and condition variables. And anyway, we 
> have much, MUCH bigger contention/performance issues coming from almost 
> everything being covered by the BQL. (If waking these callbacks can even 
> be considered an issue: I haven't seen it show up in profiling, whereas 
> BQL contention very much does.)
> 
> I'll submit v5 of this patch set with separate condition variables for 
> each job type. This should make the occurrence of waking the wrong 
> thread quite rare, while reasoning about correctness is pretty 
> straightforward. I think that's good enough.
> 
> 
> 

