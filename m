Received: by 10.28.71.155 with SMTP id m27csp2520341wmi;
        Mon, 9 Apr 2018 05:57:38 -0700 (PDT)
X-Received: by 10.46.153.73 with SMTP id r9mr4461184ljj.7.1523278658710;
        Mon, 09 Apr 2018 05:57:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1523278658; cv=none;
        d=google.com; s=arc-20160816;
        b=mjB4hFvu0OGMKDWLZ3D09dUDCt7N18vH9isBSoCwSmz7SFTPrZvWNLR24mjjkqFoH/
         8NR9py8sMqZP8HnhJQjtNnSZXf1BYGRsaPokX+Ipurkze6h3gmHh/w60Qt9WkwPRXSi+
         iBbbqELsMCLxDXdxl6kPtaXeIBGgJJeZJgqgl7/oAwZI4ybjWStCFaO4JVc2hHxVJFlr
         cU+pLWxctlVKiTJ8opT5e+aHaPIz7CUGwUWVtZsOdQDIkBJgZ4ohzQZ4C+1vGLa6DAlC
         YQEY8cEDGE2h1NUOi9qA/rqquCBPC+t3oYrjBXT2XQsR8DCY6CfyaXVLjr0UDjvWFLFX
         e2Tw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:subject:message-id:date:from:references:in-reply-to
         :mime-version:dkim-signature:arc-authentication-results;
        bh=LcQJWjdZF7gvAGCfMZEgfcvkMVKwsW85jZ2qfd811vU=;
        b=0bsL5OMeX9irYoBQgnk0x6198tRfdGBXH3UhJW90GjGT5OFvJrIofGSYPhqd4IbjYN
         d5ioAw4gu2eWof1mJK9n/r1G7cqCFMEGuwDEQ/CrylXYArC92+NmmbArk7QkbZeAMeMd
         /tQ9H8dk7FJ4/R9JzMBGVclScXccLr52cK+Eejx1DyTIj2bf9v0WdFlgtFc8akEWB32N
         OI3g1zFhkIz15Kni4j9KmDMy8VRKUm07bUmJWOXBSxtJeaLiVgkPzwaXJq+ngek9PY52
         TynBbG07YhbhO28VPvX/8/MK8hhPOk7/gv2/MDfmfO8fp8wRslKdD2ayyOHsQpkaGQCK
         Z3Xw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=sYF6fFWy;
       spf=pass (google.com: domain of ajaygargnsit@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=ajaygargnsit@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <ajaygargnsit@gmail.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id z11sor77513ljz.50.2018.04.09.05.57.38
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 09 Apr 2018 05:57:38 -0700 (PDT)
Received-SPF: pass (google.com: domain of ajaygargnsit@gmail.com designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=sYF6fFWy;
       spf=pass (google.com: domain of ajaygargnsit@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=ajaygargnsit@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc;
        bh=LcQJWjdZF7gvAGCfMZEgfcvkMVKwsW85jZ2qfd811vU=;
        b=sYF6fFWy/4oJ1A7SlfM3YBqIBQ6eRZvAFQY7wWpws54vciLxPl5Z+/PkokYKBQgmZp
         kYeNM8X+t8B/ksbllCM2dDpHgTYLTeCcrgYE9yuH6Jh/EhLlLJjpoaOgqMnnBVI/YKk3
         Z1vKqfxzp14zpM9piop7BcPIwhtH+JdlLK5yheytSwOCCL7gP9q40P/rpW0GfuOrOAq8
         9JozHGmn14ejN3fC/wSXmsyP8D5+6afSoZgHt/90qlp7PRjAZNIVxXNfgP8bucewzoeN
         7MaPJezqOR/LBVE0MxGyCWCISbL7nMBeYxWMI5Rp42i3fF66Zqlb8HzgRRkHEyDAv0TL
         LdNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from:date
         :message-id:subject:to:cc;
        bh=LcQJWjdZF7gvAGCfMZEgfcvkMVKwsW85jZ2qfd811vU=;
        b=CjhRNaLy+YukXNK7Nx5O28Dsco0DJHSLiyz3dIoxWf+Gq276X2C70UWT+jdE3ZuSZ7
         kB482bScGmyvXLcRw5mwhqV47icbkvNi213ZFgPrHNwSSwZ21GzGTXoztoRuesGhgRSx
         ufIZw+3ZOVpvjxinl8yOiksLWtW4l2KEQGEL1pGPAOo3eAlTye7tUXrT7xBrNmf6gY6C
         I3URNmdll4QbKB97rrHCq0nsw6VCquNE1w/Gp7/J29VAbXE5/9jB/6yu/GWtisFMksP0
         DvSdS4YazV/7OWDt3a3qArBvf40XalyLU6jRqIzkdBs1M+DNVIChML2hj98YSxsKHEkB
         OsOw==
X-Gm-Message-State: ALQs6tBjR29qeTLw+eY+bFY9StqjRubx9zDK/ibGcO185D8RvNt6mEwo
	spPxlHvj7Z20oS/bMct9sGg61YHdzimZG2t8i3kHhw==
X-Google-Smtp-Source: AIpwx4+uyZ1EtYQbxRlSoJh5jnMDgBmlogqWirdT5eyXA15ZpsdcuI7a4SK9U9k/trqgMwBFRRCexjsG3/bu46PKrAQ=
X-Received: by 10.46.144.153 with SMTP id l25mr23221251ljg.55.1523278658124;
 Mon, 09 Apr 2018 05:57:38 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a19:1708:0:0:0:0:0 with HTTP; Mon, 9 Apr 2018 05:57:37 -0700 (PDT)
In-Reply-To: <87efjov999.fsf@linaro.org>
References: <CAHP4M8VnuS5KijfVw9eDz41KPwaT4rJ+4VEU==EbBgdwgFKJhA@mail.gmail.com>
 <87efjov999.fsf@linaro.org>
From: Ajay Garg <ajaygargnsit@gmail.com>
Date: Mon, 9 Apr 2018 18:27:37 +0530
Message-ID: <CAHP4M8W-WuBmJUdb6LGR1t3tPayrnaS+b1ZZ1zew71aM==-imA@mail.gmail.com>
Subject: Re: [Qemu-devel] Crash when running hello-world unikernel for ARM
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, rumpkernel-users@freelists.org
Content-Type: text/plain; charset="UTF-8"
X-TUID: C7EQdxQzwAIM

>
> qemu-system-x86_64 is expecting an x86 binary blob. I assume you need
> qemu-system-arm. More importantly you need to specify a -M machine type
> that matches whatever rumprun is expecting.
>

Oops, sorry my bad.
Here is the updated status :

ajay@latitude-3480:~/rumprun-arm-hw/rumprun$ qemu-system-arm -machine
virt -nographic -nographic -kernel helloer.bin
Bad ram pointer 0x1e8
Aborted (core dumped)


ajay@latitude-3480:~/rumprun-arm-hw/rumprun$ gdb --args
qemu-system-arm -machine virt -nographic -nographic -kernel
helloer.bin
GNU gdb (Ubuntu 7.11.1-0ubuntu1~16.5) 7.11.1
Copyright (C) 2016 Free Software Foundation, Inc.
License GPLv3+: GNU GPL version 3 or later <http://gnu.org/licenses/gpl.html>
This is free software: you are free to change and redistribute it.
There is NO WARRANTY, to the extent permitted by law.  Type "show copying"
and "show warranty" for details.
This GDB was configured as "x86_64-linux-gnu".
Type "show configuration" for configuration details.
For bug reporting instructions, please see:
<http://www.gnu.org/software/gdb/bugs/>.
Find the GDB manual and other documentation resources online at:
<http://www.gnu.org/software/gdb/documentation/>.
For help, type "help".
Type "apropos word" to search for commands related to "word"...
Reading symbols from qemu-system-arm...(no debugging symbols found)...done.
(gdb) r
Starting program: /usr/bin/qemu-system-arm -machine virt -nographic
-nographic -kernel helloer.bin
[Thread debugging using libthread_db enabled]
Using host libthread_db library "/lib/x86_64-linux-gnu/libthread_db.so.1".
[New Thread 0x7fffecc88700 (LWP 14033)]
[New Thread 0x7fffd21fc700 (LWP 14034)]
Bad ram pointer 0x1e8

Thread 3 "qemu-system-arm" received signal SIGABRT, Aborted.
[Switching to Thread 0x7fffd21fc700 (LWP 14034)]
0x00007ffff2a1b428 in __GI_raise (sig=sig@entry=6) at
../sysdeps/unix/sysv/linux/raise.c:54
54    ../sysdeps/unix/sysv/linux/raise.c: No such file or directory.
(gdb) bt
#0  0x00007ffff2a1b428 in __GI_raise (sig=sig@entry=6) at
../sysdeps/unix/sysv/linux/raise.c:54
#1  0x00007ffff2a1d02a in __GI_abort () at abort.c:89
#2  0x00005555557687f1 in get_page_addr_code ()
#3  0x000055555572d50c in ?? ()
#4  0x000055555572e11b in cpu_arm_exec ()
#5  0x0000555555750252 in ?? ()
#6  0x00007ffff2db76ba in start_thread (arg=0x7fffd21fc700) at
pthread_create.c:333
#7  0x00007ffff2aed41d in clone () at
../sysdeps/unix/sysv/linux/x86_64/clone.S:109
(gdb)


Thanks and Regards,
Ajay
