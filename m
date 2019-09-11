Received: by 2002:adf:ef42:0:0:0:0:0 with SMTP id c2csp304574wrp;
        Tue, 10 Sep 2019 19:15:22 -0700 (PDT)
X-Google-Smtp-Source: APXvYqylxlXtQmglPkDFKyJJ0h1w7zZQ0nAOd81CIEj+sMvNBVwM9oDKANwhfw45Ps8IS6SnN7R2
X-Received: by 2002:a37:30f:: with SMTP id 15mr30236337qkd.240.1568168121977;
        Tue, 10 Sep 2019 19:15:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1568168121; cv=none;
        d=google.com; s=arc-20160816;
        b=Vw3vXC6a3oYsNZapSnCwqtcucrtQ8A3eRIhEoYvU3WCFBxK/E70gcz1vDSH7c1nkCl
         mXYACnxyt61JHDEDoNe0UHdOGwm5gu1LIwfvBDB5uzHeyegtwv5GQ0sKdfIwpuenVSil
         GaXKwoEDcV8Lpd+zealYnw8sS0b1exjBoBpteUvYGiamMJjLP/mel6fMV+DXVXU0rFLo
         iJfhkeT6648TLZ1+hAEt6CvHv2DVeBAGBZCC09OZmKH/E3FztnZOFFRxelt6T381ICGQ
         YHvOKTmkhvBgDyMAKx2wlQoKOgNFV0189ukW80rzZd7qzWS1Ku/TqDqFjov8o8OEbbNI
         TqBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:mime-version:user-agent
         :date:message-id:autocrypt:openpgp:from:to;
        bh=HQTlmn9wtQD8EIDeGMvgIjmJ2z5Xx122P6Q/hnl3H1Y=;
        b=xVdt7Ybw21w608+5puYRhJO3h/sl9mX4l6eqFXYbpg78o23wjNpFZMzAtDFgRmXLa9
         L28rq+EInO6e/UWRnpURU4s5LRqa8pd11aycMVyhKkC0MeHFOhPPBuqvil9jAs6o1Tk8
         gn0I4+Cn7z54QaBcksEukfUGu0+BMGdUmTFCsIlzew0S+CEQrqxWJxdCYJ8+OI+cuRCT
         76PQEtIdx3Fr6xZcxXRD104JfRbXSwAWDJwSTNMTKd+KfBL44jqi8QYjnPaSGSaUj43i
         tZUscxP43WXQmEEubuweqIZypOMJm+FZ+rYu4XZuV3ibs1W4W+aWyez5fBlQmeWnkjoA
         46rQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b22si15415865qvd.199.2019.09.10.19.15.21
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 10 Sep 2019 19:15:21 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:46032 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1i7sAD-0002lD-6r
	for alex.bennee@linaro.org; Tue, 10 Sep 2019 22:15:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58852)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <rafaeldtinoco@kernelpath.com>) id 1i7s9y-0002hq-Kn
 for qemu-arm@nongnu.org; Tue, 10 Sep 2019 22:15:07 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <rafaeldtinoco@kernelpath.com>) id 1i7s9x-0004T8-EN
 for qemu-arm@nongnu.org; Tue, 10 Sep 2019 22:15:06 -0400
Received: from mail-qk1-f193.google.com ([209.85.222.193]:45044)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <rafaeldtinoco@kernelpath.com>)
 id 1i7s9x-0004Sc-A5
 for qemu-arm@nongnu.org; Tue, 10 Sep 2019 22:15:05 -0400
Received: by mail-qk1-f193.google.com with SMTP id i78so19210633qke.11
 for <qemu-arm@nongnu.org>; Tue, 10 Sep 2019 19:15:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:to:cc:from:subject:openpgp:autocrypt:message-id
 :date:user-agent:mime-version:content-language
 :content-transfer-encoding;
 bh=HQTlmn9wtQD8EIDeGMvgIjmJ2z5Xx122P6Q/hnl3H1Y=;
 b=DWGBEFSItLAX4WDYL+WCyPhr5Gb0L++qntMYg/bBSB404BS3k2oSA6NUXSCL9ir/VK
 rCt64Q2T/O6It7z7KKSoTlQCLXGA/i5cRWx90SUE9s7TxkDhbXTCxKbAgmqMStfo02CG
 8ILYNzeOl/3sdGNMEE0t3ijQSSQbt1C9ZXNX/W3aTvTlW9t6HaIIezB8SWcrhKn378BP
 onXk9lygPZd1pxvP/tSKsGFbxEjYQUIT1+/kf1DPHLMP2NBdD6trDveY7CeHoMH3s/bm
 2Mtn/liWO6uuaDC6wtihTkAaVm4Jg8zSMUJBsI5nVjTGhd0FIb9gcj8Ww9A9d+3BVR2m
 Cu6A==
X-Gm-Message-State: APjAAAUaBqacmAfcirKGRSbmU1/JzSpW7N192CzKda7XP4Yunp3YRsWx
 LKFz5/zSncvu+yrw1C63ugQC5A==
X-Received: by 2002:a37:6713:: with SMTP id b19mr31544675qkc.301.1568168103707; 
 Tue, 10 Sep 2019 19:15:03 -0700 (PDT)
Received: from [192.168.100.24] ([191.177.180.119])
 by smtp.gmail.com with ESMTPSA id z72sm11195121qka.115.2019.09.10.19.15.02
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 10 Sep 2019 19:15:03 -0700 (PDT)
To: Paolo Bonzini <pbonzini@redhat.com>
From: Rafael David Tinoco <rafaeldtinoco@ubuntu.com>
Openpgp: preference=signencrypt
Autocrypt: addr=rafaeldtinoco@ubuntu.com; keydata=
 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
 m+Bc0IpWoGZLnE2VPg==
Message-ID: <cbe46ad6-ef6c-d155-e79a-672182c725ad@ubuntu.com>
Date: Tue, 10 Sep 2019 23:15:00 -0300
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.85.222.193
Subject: [Qemu-arm] qemu_futex_wait() lockups in ARM64: 2 possible issues
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
Cc: Bug 1805256 <1805256@bugs.launchpad.net>,
 QEMU Developers - ARM <qemu-arm@nongnu.org>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 8vL+zTrLCAYf

Paolo,

While debugging hungs in ARM64 while doing a simple:

qemu-img convert -f qcow2 -O qcow2 file.qcow2 output.qcow2

I might have found 2 issues which I'd like you to review, if possible.

ISSUE #1
========

I've caught the following stack trace after an HUNG in qemu-img convert:

(gdb) bt
#0 syscall ()
#1 0x0000aaaaaabd41cc in qemu_futex_wait
#2 qemu_event_wait (ev=ev@entry=0xaaaaaac86ce8 <rcu_call_ready_event>)
#3 0x0000aaaaaabed05c in call_rcu_thread
#4 0x0000aaaaaabd34c8 in qemu_thread_start
#5 0x0000ffffbf25c880 in start_thread
#6 0x0000ffffbf1b6b9c in thread_start ()

(gdb) print rcu_call_ready_event
$4 = {value = 4294967295, initialized = true}

value INT_MAX (4294967295) seems WRONG for qemu_futex_wait():

- EV_BUSY, being -1, and passed as an argument qemu_futex_wait(void *,
unsigned), is a two's complement, making argument into a INT_MAX when
that's not what is expected (unless I missed something).

*** If that is the case, unsure if you, Paolo, prefer declaring
*(QemuEvent)->value as an integer or changing EV_BUSY to "2" would okay
here ***

BUG: description:
https://bugs.launchpad.net/qemu/+bug/1805256/comments/15

========
ISSUE #2
========

I found this when debugging lockups while in futex() in a specific ARM64
server - https://bugs.launchpad.net/qemu/+bug/1805256 - which I'm still
investigating.

After fixing the issue above, I'm still getting stuck into:

qemu_event_wait() -> qemu_futex_wait()

***
As if qemu_event_set() has ran before qemu_futex_wait() ever started running
***

The Other threads are waiting for poll() on a PIPE coming from this
stuck thread (thread #1), and in sigwait():

(gdb) thread 1
...
(gdb) bt
#0  0x0000ffffbf1ad81c in __GI_ppoll
#1  0x0000aaaaaabcf73c in ppoll
#2  qemu_poll_ns
#3  0x0000aaaaaabd0764 in os_host_main_loop_wait
#4  main_loop_wait
...

(gdb) thread 2
...
(gdb) bt
#0 syscall ()
#1 0x0000aaaaaabd41cc in qemu_futex_wait
#2 qemu_event_wait (ev=ev@entry=0xaaaaaac86ce8 <rcu_call_ready_event>)
#3 0x0000aaaaaabed05c in call_rcu_thread
#4 0x0000aaaaaabd34c8 in qemu_thread_start
#5 0x0000ffffbf25c880 in start_thread
#6 0x0000ffffbf1b6b9c in thread_start ()

(gdb) thread 3
...
(gdb) bt
#0  0x0000ffffbf11aa20 in __GI___sigtimedwait
#1  0x0000ffffbf2671b4 in __sigwait
#2  0x0000aaaaaabd1ddc in sigwait_compat
#3  0x0000aaaaaabd34c8 in qemu_thread_start
#4  0x0000ffffbf25c880 in start_thread
#5  0x0000ffffbf1b6b9c in thread_start

QUESTION:

- Should qemu_event_set() check return code from
qemu_futex_wake()->qemu_futex()->syscall() in order to know if ANY
waiter was ever woken up ? Maybe even loop until at least 1 is awaken ?

Tks in advance,

Rafael D. Tinoco
