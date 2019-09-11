Received: by 2002:adf:ef42:0:0:0:0:0 with SMTP id c2csp852968wrp;
        Wed, 11 Sep 2019 06:18:41 -0700 (PDT)
X-Google-Smtp-Source: APXvYqy73YZNw7ppDacj0YMl+b+aOBwhG4oMEQuGK1LrSR956q4iNDVtGw3HkcuhEWddcePjn85O
X-Received: by 2002:a50:9e26:: with SMTP id z35mr36268496ede.265.1568207921818;
        Wed, 11 Sep 2019 06:18:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1568207921; cv=none;
        d=google.com; s=arc-20160816;
        b=dDCcxZcGoIZrkl2PuRneyBj6KCtUIltnf/qj4G045IYlgh3nJDdvekj7UAfJfaDs3i
         rhDMsO03Cf+LT9ujPq3BGyKu/ichTW83FgfgKbjjbiilie3mF91ljt8/DALGf2mPCJad
         5klvXPCpQZO59kNNOLgk6sh7TFhm6AL92BThNkoPa3u7zd+pfBmc1B9HuiENDFqoLKgr
         vt45xlL5HOlHc/nzo/hjPHSgOxAeXAAVSGnHuICUPjYjKypxpWFqilbmlTMpwIH/44Za
         LwwcaWcsnT/SEJmoW58KWHs6E5QpnbUVEJZMfESD/LNNqiMpUvkHUglgp7L3ZoA6+Dlj
         iXkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to;
        bh=Hg4QsQhcOx5h8CrbLPif/0tiAy7CaVNkBUpMohnMFYQ=;
        b=C3phWfZz8v+8gqx8bkoaC1OXucwOAiOnl98ArJNIqm2Im+mO5jyLzXrY8HDeiCPDnE
         N1Qo7R52tQJhLKtCLNciiHOGJF60gOIBpyhh1t/escHm5OHfHCach/8M0TZTfnWKNUp0
         JvMzMa2YlQRZ9pZkjRAaBUroWtu54YK8nH8T0UTNsQhEHqZc/SfIyiOoCIZITYMiA5+L
         rK+4SGQddmN7pj5E0QPWFZ8Tls+YybKPAEq6Db11+eLJDKmZ39WoQyw6TMwx2Jee253t
         zF0Wf4Gytqc7Ca2SemgrisRNBwTPTfPwIGsyTuZoIknh5bSzOh4ZusnJjmZQZpz+HSGy
         vGxQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g40si13350142edg.397.2019.09.11.06.18.41
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 11 Sep 2019 06:18:41 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:50918 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1i82W7-0004fy-OC
	for alex.bennee@linaro.org; Wed, 11 Sep 2019 09:18:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57845)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <pbonzini@redhat.com>) id 1i82V0-0003ul-AV
 for qemu-arm@nongnu.org; Wed, 11 Sep 2019 09:17:31 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <pbonzini@redhat.com>) id 1i82Uy-0004S0-Hw
 for qemu-arm@nongnu.org; Wed, 11 Sep 2019 09:17:30 -0400
Received: from mx1.redhat.com ([209.132.183.28]:57798)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <pbonzini@redhat.com>) id 1i82Uw-0004QO-Il
 for qemu-arm@nongnu.org; Wed, 11 Sep 2019 09:17:26 -0400
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id C033F65F7B
 for <qemu-arm@nongnu.org>; Wed, 11 Sep 2019 13:17:24 +0000 (UTC)
Received: by mail-wr1-f72.google.com with SMTP id b1so10468653wru.4
 for <qemu-arm@nongnu.org>; Wed, 11 Sep 2019 06:17:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Hg4QsQhcOx5h8CrbLPif/0tiAy7CaVNkBUpMohnMFYQ=;
 b=OW2WabrckedF9iLEW9W9rl2TlJUH53PNtCf3ePPXyC6UwcFaIhZLDBAmRS8bgean0w
 tfk4pA5b/8/gWbermvR37flYacNZHOdA0W0R2MU3bMxdapx7C4OhOm+UdLiKZdcGjCAa
 tfiL8zaL0dUZH83ER5J9dk0xcq38GeSn5SCxMaeIpC7/PI/RIIhFso61OYr4IFD2/mTq
 H3dFVjuUXFEVw7cxC4+QjBXdWbjkv+xYnnPBLMWjQLHWz4nT7bfpI94VMfoNIx7/qHqM
 a+eejmj1QqwAJukntGGVPX29UCgNnLnya7kDH3qQw8m3ZxV3NkXimg9aqKo1FrBof409
 9SRw==
X-Gm-Message-State: APjAAAUzH5XYEx6Jub/2YVUynwtW5X2B5lzxhIga3OS1sTAQ8cMu4SkI
 6Akyy3EjyoZtsb7/GJHsY/dKmVoeXAxzyGAAdNW+VZRFHr8j0PQt1xHuzEMGPp2U6An8cSIGvpk
 cYpxGBnVhz9nj
X-Received: by 2002:adf:e986:: with SMTP id h6mr31565847wrm.59.1568207843469; 
 Wed, 11 Sep 2019 06:17:23 -0700 (PDT)
X-Received: by 2002:adf:e986:: with SMTP id h6mr31565815wrm.59.1568207843046; 
 Wed, 11 Sep 2019 06:17:23 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:102b:3795:6714:7df6?
 ([2001:b07:6468:f312:102b:3795:6714:7df6])
 by smtp.gmail.com with ESMTPSA id q14sm45237767wrc.77.2019.09.11.06.17.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 11 Sep 2019 06:17:22 -0700 (PDT)
To: Rafael David Tinoco <rafaeldtinoco@ubuntu.com>
References: <cbe46ad6-ef6c-d155-e79a-672182c725ad@ubuntu.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Openpgp: preference=signencrypt
Message-ID: <d94f18f1-986f-ec19-02c0-e83e5e7af3d0@redhat.com>
Date: Wed, 11 Sep 2019 15:17:20 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <cbe46ad6-ef6c-d155-e79a-672182c725ad@ubuntu.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] qemu_futex_wait() lockups in ARM64: 2 possible issues
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
Cc: QEMU Developers - ARM <qemu-arm@nongnu.org>,
 lizhengui <lizhengui@huawei.com>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: NwUH/bHNoIJV

Note that the RCU thread is expected to sit most of the time doing 
nothing, so I don't think this matters.

Zhengui's theory that notify_me doesn't work properly on ARM is more
promising, but he couldn't provide a clear explanation of why he thought
notify_me is involved.  In particular, I would have expected notify_me to
be wrong if the qemu_poll_ns call came from aio_ctx_dispatch, for example:


    glib_pollfds_fill
      g_main_context_prepare
        aio_ctx_prepare
          atomic_or(&ctx->notify_me, 1)
    qemu_poll_ns
    glib_pollfds_poll
      g_main_context_check
        aio_ctx_check
          atomic_and(&ctx->notify_me, ~1)
      g_main_context_dispatch
        aio_ctx_dispatch
          /* do something for event */
            qemu_poll_ns 

but all backtraces show thread 1 in os_host_main_loop_wait:

Thread 1 (Thread 0x40000b573370 (LWP 27214)):
#0  0x000040000a489020 in ppoll () from /lib64/libc.so.6
#1  0x0000aaaaaadaefc0 in ppoll (__ss=0x0, __timeout=0x0, __nfds=<optimized out>, __fds=<optimized out>) at /usr/include/bits/poll2.h:77
#2  qemu_poll_ns (fds=<optimized out>, nfds=<optimized out>, timeout=<optimized out>) at qemu_timer.c:391
#3  0x0000aaaaaadae014 in os_host_main_loop_wait (timeout=<optimized out>) at main_loop.c:272
#4  0x0000aaaaaadae190 in main_loop_wait (nonblocking=<optimized out>) at main_loop.c:534
#5  0x0000aaaaaad97be0 in convert_do_copy (s=0xffffdc32eb48) at qemu-img.c:1923
#6  0x0000aaaaaada2d70 in img_convert (argc=<optimized out>, argv=<optimized out>) at qemu-img.c:2414
#7  0x0000aaaaaad99ac4 in main (argc=7, argv=<optimized out>) at qemu-img.c:5305

Can you place somewhere your util/async.o object file for me to look at it?

Anyway:

On 11/09/19 04:15, Rafael David Tinoco wrote:
> I've caught the following stack trace after an HUNG in qemu-img convert:
> 
> (gdb) bt
> #0 syscall ()
> #1 0x0000aaaaaabd41cc in qemu_futex_wait
> #2 qemu_event_wait (ev=ev@entry=0xaaaaaac86ce8 <rcu_call_ready_event>)
> #3 0x0000aaaaaabed05c in call_rcu_thread
> #4 0x0000aaaaaabd34c8 in qemu_thread_start
> #5 0x0000ffffbf25c880 in start_thread
> #6 0x0000ffffbf1b6b9c in thread_start ()
> 
> (gdb) print rcu_call_ready_event
> $4 = {value = 4294967295, initialized = true}
> 
> value INT_MAX (4294967295) seems WRONG for qemu_futex_wait():

This is UINT_MAX, not INT_MAX.  qemu_futex_wait() doesn't care of the 
signedness of the value, which is why it is declared as void *.  (That said,
changing "ev" to "&ev->value" would be nicer indeed).

> - EV_BUSY, being -1, and passed as an argument qemu_futex_wait(void *,
> unsigned), is a two's complement, making argument into a INT_MAX when
> that's not what is expected (unless I missed something).
> 
> *** If that is the case, unsure if you, Paolo, prefer declaring
> *(QemuEvent)->value as an integer or changing EV_BUSY to "2" would okay
> here ***

You could change it to 3, but it has to have all the bits in EV_FREE 
(see atomic_or(&ev->value, EV_FREE) in qemu_event_reset).

You could also change it to -1u, but I don't see a particular need to do so.

> BUG: description:
> https://bugs.launchpad.net/qemu/+bug/1805256/comments/15
> 
> ========
> ISSUE #2
> ========
> 
> I found this when debugging lockups while in futex() in a specific ARM64
> server - https://bugs.launchpad.net/qemu/+bug/1805256 - which I'm still
> investigating.
> 
> After fixing the issue above, I'm still getting stuck into:

If you changed it to 2, it's wrong.

> - Should qemu_event_set() check return code from
> qemu_futex_wake()->qemu_futex()->syscall() in order to know if ANY
> waiter was ever woken up ? Maybe even loop until at least 1 is awaken ?

Why would it need to do so?

Paolo
