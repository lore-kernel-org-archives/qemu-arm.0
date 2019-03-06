Received: by 2002:a05:6000:188:0:0:0:0 with SMTP id p8csp6278433wrx;
        Wed, 6 Mar 2019 11:41:02 -0800 (PST)
X-Received: by 2002:a17:902:6b49:: with SMTP id g9mr8757360plt.291.1551901261941;
        Wed, 06 Mar 2019 11:41:01 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1551901261; cv=none;
        d=google.com; s=arc-20160816;
        b=fzf59Qy7s5VKZj+Ljt/DhzklQF5GujyV/Dpa+ZVQft7m9ZBRkgTyWLV2Kvq7hmaWRV
         3cGLK/nwQX89npNp94WTOHWchJQC9gmGVrx0H6PvV2uBDT04j4NmblKeZ8eYSpZ71YSK
         kOBaautNROrD+yi1wlagrFtVuPAZ0SkZbKCTaJxsNzI8fVKRJBn4z+SxNukYjsHN2WfF
         lQ4wXsAa1bVgyKjkSz5SOlvi0sEjMa5f+4g9ceaoUgI4wp5KpAsNiqWixCpyk/13/OB+
         ScefZlxAAgZYm1kMA4nZn3DlOF56GEVtBu195kLKkI3SSeRLEOVrco5rITI4UA1azNkU
         FqBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:cc:to:subject
         :dkim-signature;
        bh=LSS7Tka0lj25VB+H4JkqqYrFTtVQ3VIIEWLUEFXl1DI=;
        b=Ygax1Fy6TgVNkuQN4SqpBZtHaWF9D7RpcbC+jePm5S7mvvSz2AMCNYQnd39UCP5h6D
         LtHVO3z/FOLWeewg/Cklv5sz9cfq7IRkSSoRaQZPyuUsSLKnmYJWvH+UQ8mpgjXRjwvS
         9MpXBwzY9eDP0KJ0RF5+rmzsaSV9/O9ELk6nVWqmy3/A9qSC4rHiSc4C+eQUhDGbOuFm
         /GjQh1h9QMULTXUImT2Vm9cS7wukI75J+astmyYvAeNgcEflJAuB7NSbv6IYPqVYY1MS
         IhVfSFrKcmHrbct+lKzMmufLKZKK/ckJmc6AF0P0NTqAMBbG8oxJUhYFwi/7FfsT2jQc
         fDXg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=XPugfMO+;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id r3sor3913982plb.63.2019.03.06.11.41.01
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 06 Mar 2019 11:41:01 -0800 (PST)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=XPugfMO+;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=LSS7Tka0lj25VB+H4JkqqYrFTtVQ3VIIEWLUEFXl1DI=;
        b=XPugfMO+iv3ICEimrP9I04zdz8vfZqSw7JI05DdlRVh1sNJov5o14rhgf7AO29CtV0
         5NREO0WuyLu5FrqfrOR6w94QWJIbFDxVykbiN/drzHYRt3wAxaPfw5NAlHA4BKPJ58Bu
         qzVf35irZHAqUYUODVJTWZ8LFHrWAuIlHMdCIIMqoCnhny7VHq/nhtPKmQN/Fxcytnmk
         nb/8rSngnWyJS7dsqtnjBWadvk8k02VuBvufUjpe2boXotDxakZFhTeMtarO35D3x3rV
         jzGfwZNkb2YnW6dqXnC5k9MMkCXkTsklBqWSszFtQqMrvxy2Za6mg9LYHYiTg07XHq/7
         JDFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=LSS7Tka0lj25VB+H4JkqqYrFTtVQ3VIIEWLUEFXl1DI=;
        b=sKC6VnYtACxn7Q8kO1gtssuzMXD0UrNbRdVq8UQp9k7ZSpp2ym+Z7A2bzUBfP0CRAE
         w/EYRWumq3ovLaat4UibibFvn4iRCQiPOHayd+sj23+8F3kWASoVyHFvo0wZ+w6k21/L
         hth8V7dGgOPrBhtR8VKpeOSLoJhlHFMqN5OZMwxFdHRB3vg1lUPB738yquhTi5gWf08Q
         pxu5K2XzR/oxHlccxdk02tGmXBpMN6h4kIk2zZvBAuxKXg67YLPorCR635lpyy+EV33m
         1TZoawmD3CUTp+d7VqRuMx6Go+8fnHZM9bCOQA49lRcCpFAZb9bqnME86YyCyJn94OR5
         D20A==
X-Gm-Message-State: APjAAAXJy7VuqZElANP2soeY4aUfWAYjf6pT2y0aAMCMe77r1ByvDUjp
	e/sopTsvuUzZ4Ff7vraNEjBkhY2r
X-Google-Smtp-Source: APXvYqyGffZAvLayQJkdd7l6lORuBddBCBqZLgAA7DzfT4pnDRrSk4XgxroNSc6moJNGwYHevaaNAQ==
X-Received: by 2002:a17:902:2d24:: with SMTP id o33mr3617375plb.157.1551901261411;
        Wed, 06 Mar 2019 11:41:01 -0800 (PST)
Return-Path: <richard.henderson@linaro.org>
Received: from cloudburst.twiddle.net (97-113-188-82.tukw.qwest.net. [97.113.188.82])
        by smtp.gmail.com with ESMTPSA id c127sm6771128pfg.133.2019.03.06.11.40.58
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 06 Mar 2019 11:41:00 -0800 (PST)
Subject: Re: [PATCH v7 00/73] per-CPU locks
To: "Emilio G. Cota" <cota@braap.org>, qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Aleksandar Markovic <amarkovic@wavecomp.com>,
 Alistair Francis <alistair23@gmail.com>,
 Andrzej Zaborowski <balrogg@gmail.com>, Anthony Green
 <green@moxielogic.com>, Artyom Tarasenko <atar4qemu@gmail.com>,
 Aurelien Jarno <aurelien@aurel32.net>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Chris Wulff <crwulff@gmail.com>, Cornelia Huck <cohuck@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 David Hildenbrand <david@redhat.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Fabien Chouteau
 <chouteau@adacore.com>, Guan Xuetao <gxt@mprc.pku.edu.cn>,
 James Hogan <jhogan@kernel.org>, Laurent Vivier <laurent@vivier.eu>,
 Marek Vasut <marex@denx.de>, Mark Cave-Ayland
 <mark.cave-ayland@ilande.co.uk>, Max Filippov <jcmvbkbc@gmail.com>,
 Michael Walle <michael@walle.cc>, Palmer Dabbelt <palmer@sifive.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Peter Maydell
 <peter.maydell@linaro.org>, qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
 qemu-s390x@nongnu.org, Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Stafford Horne <shorne@gmail.com>
References: <20190304181813.8075-1-cota@braap.org>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <2adf8423-458d-27c3-67bf-d4775104ad43@linaro.org>
Date: Wed, 6 Mar 2019 11:40:57 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <20190304181813.8075-1-cota@braap.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TUID: XiMNcQCDlYlv

On 3/4/19 10:17 AM, Emilio G. Cota wrote:
> v6: https://lists.gnu.org/archive/html/qemu-devel/2019-01/msg07650.html
> 
> All patches in the series have reviews now. Thanks everyone!
> 
> I've tested all patches with `make check-qtest -j' for all targets.
> The series is checkpatch-clean (just some warnings about __COVERITY__).
> 
> You can fetch the series from:
>   https://github.com/cota/qemu/tree/cpu-lock-v7

Having fixed the OSX build errors, Peter reported to me a hang on the x86_64
bios-tables-test with an arm32 host.  I have been able to replicate this.


(gdb) info thr
  Id   Target Id                                       Frame
  1    Thread 0xb35a72e0 (LWP 10966) "qemu-system-x86" 0xb606d138 in
pthread_cond_wait@@GLIBC_2.4 () from /usr/lib/libpthread.so.0
  2    Thread 0xb35a3d30 (LWP 10967) "qemu-system-x86" 0xb5fe70fc in syscall ()
   from /usr/lib/libc.so.6
  3    Thread 0xa07fed30 (LWP 10968) "qemu-system-x86" 0xb5fe0688 in poll ()
   from /usr/lib/libc.so.6
* 4    Thread 0x9fdfed30 (LWP 10969) "qemu-system-x86" 0xb606d138 in
pthread_cond_wait@@GLIBC_2.4 () from /usr/lib/libpthread.so.0

(gdb) thr 1
[Switching to thread 1 (Thread 0xb35a72e0 (LWP 10966))]
#0  0xb606d138 in pthread_cond_wait@@GLIBC_2.4 () from /usr/lib/libpthread.so.0
(gdb) where
#0  0xb606d138 in pthread_cond_wait@@GLIBC_2.4 () from /usr/lib/libpthread.so.0
#1  0x009a66a4 in qemu_cond_wait_impl (cond=cond@entry=0x16727b0,
    mutex=0xcad4c8 <qemu_global_mutex>,
    file=file@entry=0xa057f0 "/home/rth/qemu/qemu/cpus-common.c",
    line=line@entry=166) at /home/rth/qemu/qemu/util/qemu-thread-posix.c:161
#2  0x00692378 in run_on_cpu (cpu=cpu@entry=0x16725a8, func=<optimized out>,
    data=...) at /home/rth/qemu/qemu/cpus-common.c:166
#3  0x00604c18 in vapic_enable_tpr_reporting (enable=<optimized out>)
    at /home/rth/qemu/qemu/hw/i386/kvmvapic.c:507
#4  0x00710160 in qdev_reset_one (dev=<optimized out>, opaque=<optimized out>)
    at /home/rth/qemu/qemu/hw/core/qdev.c:250

(gdb) thr 4
[Switching to thread 4 (Thread 0x9fdfed30 (LWP 10969))]
#0  0xb606d138 in pthread_cond_wait@@GLIBC_2.4 () from /usr/lib/libpthread.so.0
(gdb) where
#0  0xb606d138 in pthread_cond_wait@@GLIBC_2.4 () from /usr/lib/libpthread.so.0
#1  0x009a66a4 in qemu_cond_wait_impl (cond=0x1692ed8,
    mutex=0xcad4c8 <qemu_global_mutex>,
    file=file@entry=0x9d0108 "/home/rth/qemu/qemu/cpus.c",
    line=line@entry=1647) at /home/rth/qemu/qemu/util/qemu-thread-posix.c:161
#2  0x00553070 in qemu_tcg_rr_cpu_thread_fn (arg=<optimized out>)
    at /home/rth/qemu/qemu/cpus.c:1647
#3  0x009a5f20 in qemu_thread_start (args=<optimized out>)
    at /home/rth/qemu/qemu/util/qemu-thread-posix.c:502


I had hoped that I would have been able to reproduce this on another host by
forcing rr mode.  But so far no luck.

Thoughts?


r~
