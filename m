Received: by 2002:a17:504:928f:b0:1be9:327d:8ee3 with SMTP id d15csp104375nji;
        Wed, 11 Sep 2024 03:31:06 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXmYe5ePXCG5pqJtZQ1mdXc6PAfJ12IaMPMxA84SchpftjfNogsdFr/Kk0jHP2LyEg9XB/RWg9gas6+jA==@linaro.org
X-Google-Smtp-Source: AGHT+IGCLoc985Oq1WH43KZjUFSHCVx2hNldiK16tyr8rQ9pIFhTrYZixz7yUfkWyffQ58ssXTi9
X-Received: by 2002:a05:622a:1306:b0:458:2dcf:c769 with SMTP id d75a77b69052e-4582dcfc932mr144421701cf.30.1726050666676;
        Wed, 11 Sep 2024 03:31:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1726050666; cv=none;
        d=google.com; s=arc-20240605;
        b=Lsak2KzN0TZeB+YwN0f3frJCTO4fxCy+ndemMV9JSCn0GMNCXDCFRViCyhD4pGjWLh
         R9MKAjRC8VAC/BXC5cf+o1Sv0lfVDsWin3/XaCOOjm2YuvBmNU5G8/0sdtSaraKvA5pe
         S/5nRW0fGAj93wVSKYvhwpk3k/sBjC3tV86vWXJ3t4fmQNbVEhkWJx0icXcNisPyeJBm
         ZNZs7faO5vo/d7B1KXliOYQsJh32TZmFvPJWcuDe2r5HlbaRrmh3NWfzuUgQuvxtKUfc
         Dyn43zCSHOaya/Py7L0OL4MDhl7jg64eoE8yQ7cIC0205RXKP5YKC1CMZS5HhB9FvzB/
         Py+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:cc:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=O6YScidXs4ZruwMChjgg9F5p8Y1MF+KvzXWEwgzH/vs=;
        fh=5BpfkyWU7pQLf5cHKmL1tvIdcoWEyHP0IJbMAa+QrgM=;
        b=B5in0fRk9dlqsRbieeqIdbVQTg+VlIa938nqleX0RlFWaByLbwN9LLLsjl4Zv5crJr
         /Wy6eJK7X7yNEB0tLZGzsEQekLxYC9YQwMvPimmuoqRsACrG+ro9p0+N3urLbqwWWqJG
         p640XUkziyCt0bSosIc520Wa+IST3v/c9mKKa4mFjomnnlLaMWxHHVT7b/Js25hVgrb1
         HDPGtQbvrdvR7Mz+1oJeJrmyYROO5839+jlo3AM0g2zJmZUzdfyIjGA63U0PQi2VXI+5
         kH4p1nbihC77n+wYKH/b0e5gSdlu+bt4puSceRK21EzQdKbkBqCPnd8WYgwGw+0r9UgO
         rlDg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=VBtfjQXt;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-45822e6151fsi97215871cf.77.2024.09.11.03.31.06
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 11 Sep 2024 03:31:06 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=VBtfjQXt;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1soKcd-0008RH-Mr; Wed, 11 Sep 2024 06:30:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1soKcc-0008Ow-4w
 for qemu-devel@nongnu.org; Wed, 11 Sep 2024 06:30:50 -0400
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1soKcZ-000332-LN
 for qemu-devel@nongnu.org; Wed, 11 Sep 2024 06:30:49 -0400
Received: by mail-ed1-x52a.google.com with SMTP id
 4fb4d7f45d1cf-5c26b5f1ea6so8349398a12.0
 for <qemu-devel@nongnu.org>; Wed, 11 Sep 2024 03:30:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1726050646; x=1726655446; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=O6YScidXs4ZruwMChjgg9F5p8Y1MF+KvzXWEwgzH/vs=;
 b=VBtfjQXtep9Qaf56Q6t7Uk9HUUv7J0SnL7L1JXoukpLfVV0wO9js89hZKwvTi9qOQM
 y90H0mROG6cE9JVsCxChoQv0bST5VdYXdmYH2pWddARKOdQzq2SS5ALVmkLjlE0WMWak
 UKixfYpKQjZLkxCULaZtnOZ3bBz6Ta9IXM2tJzM4fKhyOPlOlCkf0VmMET9wi4g2lo1I
 lhr6/fhAvQLjfmsIdxQbslTB2lKoCGIkfEN+HmB80gSbK9y7D0KlW5mRZKdngsw72fTl
 CUSIHK0vfBsOLBhShm1P+9dOrr82qs92vUCJD7TtMeL3oLitlKpkuQ92ImBxbQKbg9XQ
 vZOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726050646; x=1726655446;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=O6YScidXs4ZruwMChjgg9F5p8Y1MF+KvzXWEwgzH/vs=;
 b=RZFV4cDlWI7CzMAnVYjWaRtJn5L60KkJj8NYEdwORs/OIS7WDfSUHwtr5ZC8c8tKey
 1vk52d/sEnespiP19sGqKpiWo7LRdvzTnGcVqQO4j3mSqZLPs4gByHBaPaAfLOsXgNPT
 feOe5w7DN1a0NwA+83VeE4Ii3sWXHsxb4QcrNxVm8xsAwnXMP5oGz594vxmT2cxm8XEA
 4IW1335A8VM5PbGl/210E1QKua24cnSd6nK7+rfJYXZx2NuJG9YRekeo31UvRqZko+4v
 Vn4np6L7sHb9/jIF+6/MWhVjQoJxrHISZ32K9XCGr2Wy1UfTGTod7IkQzrBbWu0GlfBk
 O2hw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVDdfd3LQWdUqXedgM3ANdUk8rA+WEyrv27p4hTLIJBaG2Eu7asHASav88mKwhkL8HErCughDMQftZy@nongnu.org
X-Gm-Message-State: AOJu0YxmyD0qt01bGpDy6vrgK0NhpLpW72sNSwlcVDWoZ/u3chh3sEpE
 OOH7+1+qThhW4soMsnUN6iaUQtkwhMXRpFluWOku1bWjsRHzETLGfYJWVrH2YUn+uhDZqiudeQf
 vftfFFk7txwhaHTndFXM1hbUQMxFvkzIovL6iiQ==
X-Received: by 2002:a05:6402:51ca:b0:5c4:1244:6a08 with SMTP id
 4fb4d7f45d1cf-5c412446a85mr267470a12.8.1726050645825; Wed, 11 Sep 2024
 03:30:45 -0700 (PDT)
MIME-Version: 1.0
References: <20240709060448.251881-1-gankulkarni@os.amperecomputing.com>
 <CAFEAcA_7BOXSLXJ=VV0pWDvrN=2dWrM3bRTG+31ivPjeVbWGKQ@mail.gmail.com>
 <0b5764d4-fd63-4779-a22a-8e10ebafbcc7@os.amperecomputing.com>
 <CAFEAcA9oP5HNYK=HFazBU8M9eaGN8sFhAvLFQvcy36Xf+Tm+7A@mail.gmail.com>
 <db36a703-1330-44dc-a80f-57903fbb305f@os.amperecomputing.com>
In-Reply-To: <db36a703-1330-44dc-a80f-57903fbb305f@os.amperecomputing.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 11 Sep 2024 11:30:34 +0100
Message-ID: <CAFEAcA-6z82LPVY-pWSCyvJdPKg5BZK3ZTEywyJzznjTNomPSA@mail.gmail.com>
Subject: Re: [PATCH] arm/kvm: add support for MTE
To: Ganapatrao Kulkarni <gankulkarni@os.amperecomputing.com>
Cc: richard.henderson@linaro.org, qemu-arm@nongnu.org, qemu-devel@nongnu.org, 
 darren@os.amperecomputing.com, 
 Gustavo Bueno Romero <gustavo.romero@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::52a;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: 4VTwoQ+145BN

On Wed, 11 Sept 2024 at 07:50, Ganapatrao Kulkarni
<gankulkarni@os.amperecomputing.com> wrote:
>
>
>
> On 10-09-2024 05:53 pm, Peter Maydell wrote:
> > On Tue, 10 Sept 2024 at 12:57, Ganapatrao Kulkarni
> > <gankulkarni@os.amperecomputing.com> wrote:
> >> On 16-07-2024 09:15 pm, Peter Maydell wrote:
> >>> Since Cornelia first wrote the patch this is based on, we've
> >>> landed gdbstub support for MTE (so gdb can find out which
> >>> addresses in the memory map have tags and read and write
> >>> those tags). So I think the KVM MTE support now also needs to
> >>> handle that. (See aarch64_cpu_register_gdb_commands() in
> >>> target/arm/gdbstub64.c.)
> >>
> >> I looked at this code and it looks like, complete code is under
> >> ifdef CONFIG_USER_ONLY and for kvm(target aarch64-softmmu) this is not
> >> getting enabled. Are you asking to remove these ifdef and make
> >> mte-gdbstub commands available for the KVM mode as well?
> >
> > The system mode support for mte gdbstub is just about
> > to land. The current patchset is this one:
> > https://patchew.org/QEMU/20240906143316.657436-1-gustavo.romero@linaro.=
org/
> >
>
> Thanks.
> I applied these patches to qemu and compiled gdb as said in the
> cover-letter. Below is the log of the run, help me to interpret the logs.

I've cc'd Gustavo since he's the author of the patches.

> [root@sut01sys-r214 mte-qemu]# make -C build -j 32
> run-tcg-tests-aarch64-softmmu
> make: Entering directory '/home/ganapat/upstream/mte-qemu/build'
>    BUILD   aarch64-softmmu guest-tests
>    RUN     aarch64-softmmu guest-tests
>    TEST    mte on aarch64
>    TEST    hello on aarch64
>    TEST    interrupt on aarch64
>    TEST    memory on aarch64
>    TEST    memory-sve on aarch64
>    TEST    hello-with-libbb.so on aarch64
>    TEST    interrupt-with-libbb.so on aarch64
>    TEST    memory-with-libbb.so on aarch64
>    TEST    hello-with-libempty.so on aarch64
>    TEST    interrupt-with-libempty.so on aarch64
>    TEST    memory-with-libempty.so on aarch64
>    TEST    interrupt-with-libinline.so on aarch64
>    TEST    hello-with-libinline.so on aarch64
>    TEST    memory-with-libinline.so on aarch64
>    TEST    hello-with-libinsn.so on aarch64
>    TEST    memory-with-libinsn.so on aarch64
>    TEST    interrupt-with-libinsn.so on aarch64
>    TEST    hello-with-libmem.so on aarch64
>    TEST    interrupt-with-libmem.so on aarch64
>    TEST    hello-with-libsyscall.so on aarch64
>    TEST    memory-with-libmem.so on aarch64
>    TEST    interrupt-with-libsyscall.so on aarch64
>    TEST    softmmu gdbstub support on aarch64
>    TEST    memory-with-libsyscall.so on aarch64
>    TEST    softmmu gdbstub support on aarch64
>    TEST    softmmu gdbstub untimely packets on aarch64
>    TEST    softmmu gdbstub support on aarch64
>    TEST    gdbstub MTE support on aarch64
>    TEST    memory-record on aarch64
> qemu-system-aarch64: -gdb
> unix:path=3D/tmp/tmp80lbp057qemu-gdbstub/gdbstub.socket,server=3Don: info=
:
> QEMU waiting for connection on:
> disconnected:unix:/tmp/tmp80lbp057qemu-gdbstub/gdbstub.socket,server=3Don
> qemu-system-aarch64: -gdb
> unix:path=3D/tmp/tmp8h7kx8kyqemu-gdbstub/gdbstub.socket,server=3Don: info=
:
> QEMU waiting for connection on:
> disconnected:unix:/tmp/tmp8h7kx8kyqemu-gdbstub/gdbstub.socket,server=3Don
> qemu-system-aarch64: -gdb
> unix:path=3D/tmp/tmpo0448vk6qemu-gdbstub/gdbstub.socket,server=3Don: info=
:
> QEMU waiting for connection on:
> disconnected:unix:/tmp/tmpo0448vk6qemu-gdbstub/gdbstub.socket,server=3Don
> qemu-system-aarch64: -gdb
> unix:path=3D/tmp/tmplvwd79e3qemu-gdbstub/gdbstub.socket,server=3Don: info=
:
> QEMU waiting for connection on:
> disconnected:unix:/tmp/tmplvwd79e3qemu-gdbstub/gdbstub.socket,server=3Don
> qemu-system-aarch64: -gdb
> unix:path=3D/tmp/tmpv1t2ffjfqemu-gdbstub/gdbstub.socket,server=3Don: info=
:
> QEMU waiting for connection on:
> disconnected:unix:/tmp/tmpv1t2ffjfqemu-gdbstub/gdbstub.socket,server=3Don
>    TEST    memory-replay on aarch64
> qemu-system-aarch64: QEMU: Terminated via GDBstub
> qemu-system-aarch64: QEMU: Terminated via GDBstub
>    GREP    file untimely-packet.gdb.err
> qemu-system-aarch64: QEMU: Terminated via GDBstub
> qemu-system-aarch64: QEMU: Terminated via GDBstub
> make: Leaving directory '/home/ganapat/upstream/mte-qemu/build'
> [root@sut01sys-r214 mte-qemu]#
>
> Last few lines of untimely-packet.gdb.err below:
>
>   [remote] Packet received:
> 0000000000000000000000000000000000000000000000000000000000000000000000000=
000000000000000000000000000000000000000000000000000000000000000000000000000=
000000000000000000000000000000000000000000000000000000000000000000000000000=
000000000000000000000000000000000000000000000000000000000000000000000000000=
000000000000000000000000000000000000000000000000000000000000000000000000000=
000000000000000000000000000000000000000000000000000000000000000000000000000=
0000000000000000000000000000000000000000000000000000000000000000
> [24 bytes omitted]
>    [remote] Sending packet: $qfThreadInfo#bb
>    [remote] Received Ack
>    [remote] Packet received: mp01.01
>    [remote] Sending packet: $qsThreadInfo#c8
>    [remote] Received Ack
>    [remote] Packet received: l
>    [remote] Sending packet: $p56#db
>    [remote] Received Ack
>    [remote] Packet received: 000000000000ffff
>    [remote] packet_ok: Packet p (fetch-register) is supported
>    [remote] Sending packet: $p57#dc
>    [remote] Received Ack
>    [remote] Packet received: 000000000000ffff
>    [remote] Sending packet: $m400027b0,4#8c
>    [remote] Received Ack
>    [remote] Packet received: 80c2ff10
>    [remote] Sending packet: $m400027ac,4#be
>    [remote] Received Ack
>    [remote] Packet received: 1f2003d5
>    [remote] Sending packet: $m400027b0,4#8c
>    [remote] Received Ack
>    [remote] Packet received: 80c2ff10
>    [remote] Sending packet: $qSymbol::#5b
>    [remote] Received Ack
>    [remote] Packet received:
>    [remote] packet_ok: Packet qSymbol (symbol-lookup) is NOT supported
> [remote] start_remote_1: exit
> [remote] Sending packet: $D;1#b0
> [remote] Received Ack
> [remote] Packet received: OK
>
>
> --
> Thanks,
> Ganapat/GK

-- PMM
