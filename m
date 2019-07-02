Received: by 2002:a5d:6790:0:0:0:0:0 with SMTP id v16csp3634562wru;
        Tue, 2 Jul 2019 03:17:24 -0700 (PDT)
X-Received: by 2002:a5d:55c2:: with SMTP id i2mr3047125wrw.113.1562062643949;
        Tue, 02 Jul 2019 03:17:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1562062643; cv=none;
        d=google.com; s=arc-20160816;
        b=jRYvG0ixpdd+kzzNEhTAtf2m0h4hPvGXWgN0a5DQBxriOOB7FuvWDIQA/VFBqGZIVC
         7fSCSb8EutbxfojfNoRoyEFkulG+EeiQJTLb0M0J4ON1LPPokOVUC1ClEpo9wcbWmBMD
         JPS26rqYa2YLG7IvJPEDtHdN3IqI1uaU2PH00ARxqbbBc/+KOsGnXvN5tJ5fiL6+T7/N
         6RCjH0tDyAapahYKcnJrXFPDHqNdgKdQdM2XV/JaOq35QbwBDl6UDUCDup7siHVXWvnT
         TmFrnJCmlZoQ9BYv2gav0xtSkY92PGwRWtWHlpWZ57CP21AgJbr09SeejE02ER7p3M11
         /v5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:cc:to:subject;
        bh=ek1JR3XuB4PXRUwXKaD0r6r3sxIKQNv+u9hBNFyvU6Q=;
        b=PB58O08KR6xJOr+deq7GgO728ziLewQ4ZUTw7E8oEwmOefg+I+mVBOYXqloot5dF7F
         SuyRdCpBpVv6r5Z1pEYx3WCSOUckU0fHxBaa9GiJeLafZtzFBVoVJiiMlJm4yOaG5lAk
         R0zYm1AYR2NBeccYm9O9W43EjJfZoQIJYTa3MNKUuKYJNs8eBfzCBLoMcPscjHFyligY
         AmNyyNEQa1fdKynisq/bIvyYvjrzVOFNtAi+Uca6+Eb6em6nsRStX82lGFXY4zHHQ9Gv
         NfWKxCiw7qoQEUlStmKNpnxD4tL4vzvFxQyT03hQp95lW2gCkX0fsT9jcr70nhraRe4k
         kQcg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of philmd@redhat.com designates 209.85.220.65 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <philmd@redhat.com>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id r8sor10030980wrj.15.2019.07.02.03.17.23
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 02 Jul 2019 03:17:23 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@redhat.com designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of philmd@redhat.com designates 209.85.220.65 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=ek1JR3XuB4PXRUwXKaD0r6r3sxIKQNv+u9hBNFyvU6Q=;
        b=N5Cw23LmQ6lGTBIhFAIa5h8Uwup9mfZvYbrIcCrje0DTnfAOk1xfxawAUjqapxDcWT
         h4gOhzc1ExCchbC4gNzZ/J23CoSbVlWmmHcgRg2C5/WvL7FjeXnofIwLKOpApdvT2he/
         LIdA4dSlgszjfOC1NPmTmz5Ez0Qclj549hdbcPWHfL9oUhhlW8f5KBMAj+2p1JtCfi5k
         QB4gsvnOq7pYbKmev19VCUodsK3NQeL/Wwxe2yBbWFy2nrZeE9Yna10mOo5BtI3BpfPd
         pkX+CdhGLnqWeQLBNZLyBuQlqjwuL9Nx7c/9DtfvO0iJmAPTYioEylYefmbBmHMIDAAh
         iVDA==
X-Gm-Message-State: APjAAAWWvCBGWuDxr44a1lIP4BrKj4W6xcBQHlR7WU0Fk5ymrG7Uru5/
	V5nPY8Wp49E33vIivbAlRPQ9rA==
X-Google-Smtp-Source: APXvYqwx42AMxd8voKjgq6hsnDHkNK/jQneqcO7ZyFDUJPTmO6WceTEmLST6SJPEC3AqK0BCebWd0w==
X-Received: by 2002:adf:f186:: with SMTP id h6mr5634455wro.274.1562062643635;
        Tue, 02 Jul 2019 03:17:23 -0700 (PDT)
Return-Path: <philmd@redhat.com>
Received: from [192.168.1.38] (56.red-88-18-140.staticip.rima-tde.net. [88.18.140.56])
        by smtp.gmail.com with ESMTPSA id o6sm30930735wra.27.2019.07.02.03.17.21
        (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
        Tue, 02 Jul 2019 03:17:22 -0700 (PDT)
Subject: Re: [Qemu-devel] [PATCH v2 0/9] hw/block/pflash_cfi01: Add
 DeviceReset() handler
To: qemu-devel@nongnu.org, peter.maydell@linaro.org, pbonzini@redhat.com,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>
Cc: mst@redhat.com, jcmvbkbc@gmail.com, kraxel@redhat.com,
 edgar.iglesias@gmail.com, qemu-block@nongnu.org, arikalo@wavecomp.com,
 alex.bennee@linaro.org, armbru@redhat.com, lersek@redhat.com,
 david@gibson.dropbear.id.au, ehabkost@redhat.com, qemu-arm@nongnu.org,
 alistair23@gmail.com, jsnow@redhat.com, rth@twiddle.net, kwolf@redhat.com,
 mreitz@redhat.com, michael@walle.cc, qemu-ppc@nongnu.org,
 richardw.yang@linux.intel.com, amarkovic@wavecomp.com, aurelien@aurel32.net
References: <156204814619.13267.5511467304528619824@c4a48874b076>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Openpgp: id=89C1E78F601EE86C867495CBA2A3FD6EDEADC0DE;
 url=http://pgp.mit.edu/pks/lookup?op=get&search=0xA2A3FD6EDEADC0DE
Message-ID: <00364cd4-9689-9873-1317-d95640af21d3@redhat.com>
Date: Tue, 2 Jul 2019 12:17:21 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <156204814619.13267.5511467304528619824@c4a48874b076>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: cGcQrc/QcsVG

Cc'ing Marc-André,

On 7/2/19 8:15 AM, no-reply@patchew.org wrote:
> Patchew URL: https://patchew.org/QEMU/20190702001301.4768-1-philmd@redhat.com/
> 
> === TEST SCRIPT BEGIN ===
> #!/bin/bash
> make docker-image-fedora V=1 NETWORK=1
> time make docker-test-debug@fedora TARGET_LIST=x86_64-softmmu J=14 NETWORK=1
> === TEST SCRIPT END ===

I am not sure how the error reported is related to this series:

MALLOC_PERTURB_=${MALLOC_PERTURB_:-$(( ${RANDOM:-0} % 255 + 1))}
tests/test-bdrv-drain -m=quick -k --tap < /dev/null |
./scripts/tap-driver.pl --test-name="test-bdrv-drain"
==8090==WARNING: ASan doesn't fully support makecontext/swapcontext
functions and may produce false positives in some cases!
PASS 1 test-bdrv-drain /bdrv-drain/nested
PASS 2 test-bdrv-drain /bdrv-drain/multiparent
PASS 3 test-bdrv-drain /bdrv-drain/set_aio_context
PASS 4 test-bdrv-drain /bdrv-drain/driver-cb/drain_all
PASS 5 test-bdrv-drain /bdrv-drain/driver-cb/drain
PASS 6 test-bdrv-drain /bdrv-drain/driver-cb/drain_subtree
PASS 7 test-bdrv-drain /bdrv-drain/driver-cb/co/drain_all
PASS 8 test-bdrv-drain /bdrv-drain/driver-cb/co/drain
PASS 9 test-bdrv-drain /bdrv-drain/driver-cb/co/drain_subtree
PASS 10 test-bdrv-drain /bdrv-drain/quiesce/drain_all
PASS 11 test-bdrv-drain /bdrv-drain/quiesce/drain
PASS 12 test-bdrv-drain /bdrv-drain/quiesce/drain_subtree
PASS 13 test-bdrv-drain /bdrv-drain/quiesce/co/drain_all
PASS 14 test-bdrv-drain /bdrv-drain/quiesce/co/drain
PASS 15 test-bdrv-drain /bdrv-drain/quiesce/co/drain_subtree
PASS 16 test-bdrv-drain /bdrv-drain/graph-change/drain_subtree
PASS 17 test-bdrv-drain /bdrv-drain/graph-change/drain_all
=================================================================
==8090==ERROR: AddressSanitizer: heap-use-after-free on address
0x61200002c1f0 at pc 0x559638e7e006 bp 0x7f974eab8680 sp 0x7f974eab8678
WRITE of size 1 at 0x61200002c1f0 thread T5
PASS 3 ahci-test /x86_64/ahci/pci_enable
    #0 0x559638e7e005 in aio_notify /tmp/qemu-test/src/util/async.c:351:9
    #1 0x559638e7fc3b in qemu_bh_schedule
/tmp/qemu-test/src/util/async.c:167:9
    #2 0x559638e82e40 in aio_co_schedule
/tmp/qemu-test/src/util/async.c:464:5
    #3 0x559638e83109 in aio_co_enter /tmp/qemu-test/src/util/async.c:483:9
    #4 0x559638e8308d in aio_co_wake /tmp/qemu-test/src/util/async.c:477:5
    #5 0x55963876b3d4 in co_reenter_bh
/tmp/qemu-test/src/tests/test-bdrv-drain.c:63:5
    #6 0x559638e7e8aa in aio_bh_call /tmp/qemu-test/src/util/async.c:89:5
    #7 0x559638e7efc2 in aio_bh_poll /tmp/qemu-test/src/util/async.c:117:13
    #8 0x559638ea4a73 in aio_poll /tmp/qemu-test/src/util/aio-posix.c:728:17
    #9 0x559638d48628 in iothread_run
/tmp/qemu-test/src/tests/iothread.c:51:9
    #10 0x559638eb8612 in qemu_thread_start
/tmp/qemu-test/src/util/qemu-thread-posix.c:502:9
    #11 0x7f976074a5a1 in start_thread (/lib64/libpthread.so.0+0x85a1)
    #12 0x7f9760657022 in __GI___clone (/lib64/libc.so.6+0xfb022)

0x61200002c1f0 is located 176 bytes inside of 312-byte region
[0x61200002c140,0x61200002c278)
freed by thread T0 here:
    #0 0x55963872475f in free
(/tmp/qemu-test/build/tests/test-bdrv-drain+0x53375f)
    #1 0x7f9760bc5d8c in g_free (/lib64/libglib-2.0.so.0+0x55d8c)

previously allocated by thread T4 here:
    #0 0x559638724d9e in calloc
(/tmp/qemu-test/build/tests/test-bdrv-drain+0x533d9e)
    #1 0x7f9760bc5cf0 in g_malloc0 (/lib64/libglib-2.0.so.0+0x55cf0)

Thread T5 created by T0 here:
    #0 0x559638659f16 in __interceptor_pthread_create
(/tmp/qemu-test/build/tests/test-bdrv-drain+0x468f16)
    #1 0x559638eb7f19 in qemu_thread_create
/tmp/qemu-test/src/util/qemu-thread-posix.c:539:11
    #2 0x559638d47cce in iothread_new
/tmp/qemu-test/src/tests/iothread.c:75:5
    #3 0x55963876c412 in test_iothread_common
/tmp/qemu-test/src/tests/test-bdrv-drain.c:664:19
    #4 0x55963876724e in test_iothread_drain_all
/tmp/qemu-test/src/tests/test-bdrv-drain.c:758:5
    #5 0x7f9760be7f9d  (/lib64/libglib-2.0.so.0+0x77f9d)

Thread T4 created by T0 here:
    #0 0x559638659f16 in __interceptor_pthread_create
(/tmp/qemu-test/build/tests/test-bdrv-drain+0x468f16)
    #1 0x559638eb7f19 in qemu_thread_create
/tmp/qemu-test/src/util/qemu-thread-posix.c:539:11
    #2 0x559638d47cce in iothread_new
/tmp/qemu-test/src/tests/iothread.c:75:5
    #3 0x55963876c406 in test_iothread_common
/tmp/qemu-test/src/tests/test-bdrv-drain.c:663:19
    #4 0x55963876724e in test_iothread_drain_all
/tmp/qemu-test/src/tests/test-bdrv-drain.c:758:5
    #5 0x7f9760be7f9d  (/lib64/libglib-2.0.so.0+0x77f9d)

SUMMARY: AddressSanitizer: heap-use-after-free
/tmp/qemu-test/src/util/async.c:351:9 in aio_notify
Shadow bytes around the buggy address:
  0x0c247fffd7e0: fa fa fa fa fa fa fa fa fa fa fa fa fa fa fa fa
  0x0c247fffd7f0: fa fa fa fa fa fa fa fa fd fd fd fd fd fd fd fd
  0x0c247fffd800: fd fd fd fd fd fd fd fd fd fd fd fd fd fd fd fd
  0x0c247fffd810: fd fd fd fd fd fd fd fd fd fd fd fd fd fd fd fa
  0x0c247fffd820: fa fa fa fa fa fa fa fa fd fd fd fd fd fd fd fd
=>0x0c247fffd830: fd fd fd fd fd fd fd fd fd fd fd fd fd fd[fd]fd
  0x0c247fffd840: fd fd fd fd fd fd fd fd fd fd fd fd fd fd fd fa
  0x0c247fffd850: fa fa fa fa fa fa fa fa 00 00 00 00 00 00 00 00
  0x0c247fffd860: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
  0x0c247fffd870: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 fa fa
  0x0c247fffd880: fa fa fa fa fa fa fa fa fa fa fa fa fa fa fa fa
Shadow byte legend (one shadow byte represents 8 application bytes):
  Addressable:           00
  Partially addressable: 01 02 03 04 05 06 07
  Heap left redzone:       fa
  Freed heap region:       fd
  Stack left redzone:      f1
  Stack mid redzone:       f2
  Stack right redzone:     f3
  Stack after return:      f5
  Stack use after scope:   f8
  Global redzone:          f9
  Global init order:       f6
  Poisoned by user:        f7
  Container overflow:      fc
  Array cookie:            ac
  Intra object redzone:    bb
  ASan internal:           fe
  Left alloca redzone:     ca
  Right alloca redzone:    cb
  Shadow gap:              cc
==8090==ABORTING
ERROR - too few tests run (expected 39, got 17)
make: *** [/tmp/qemu-test/src/tests/Makefile.include:899: check-unit]
Error 1
make: *** Waiting for unfinished jobs....
