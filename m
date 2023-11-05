Received: by 2002:a17:906:33ce:b0:9d0:bf65:29fa with SMTP id w14csp2142212eja;
        Sun, 5 Nov 2023 04:17:26 -0800 (PST)
X-Received: by 2002:a17:902:f301:b0:1cc:31a8:d733 with SMTP id c1-20020a170902f30100b001cc31a8d733mr17772527ple.44.1699186646419;
        Sun, 05 Nov 2023 04:17:26 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1699186646; cv=none;
        d=google.com; s=arc-20160816;
        b=f1V8jclcra3h1n3vTlMd5UfHpgd/hv/49lxkCTJr3lenWLVBBOcV0q/8rph+eCQfRo
         7XanVhS9dH40qXOYa0kximlwR2qZAVstQIrXj6bnLV0Eo+n1QB36ZExYHRFZfnzr+d58
         ++9d85rawPPMK/9wI2XiCisHdwQGGmAlndNMsIq+dy0G6U3O/2GrJj8hiMw9Yxgh+7Yh
         BFvJbWxY7wOGeEYSl0rrCh8CkTSkCd/rMIV4wBSCx6rkey9sjJrH01O8g3VpwRYxYsTd
         9/yoS5v8qWKouSodkAVF2ykOMvOumLS44SNoaNG2l2KjWBGZW8W3kiHyTIhpy/EgaEG8
         FhgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=SeSAy6CaTtpqhdSyHQCwmDvDBGSEd3nXyY7i9vBAN/w=;
        fh=LCJpmRa5AvPcT5RBA4T8gQ3MYoK9deIz7D2jjtWywaU=;
        b=OsJlcsgo9L9qgYdwaWkXy4zYhFd5xXkUT16RWdPLN5/4MNie5+cE29MpNPOhQjdc8z
         79jasgl+/qWrh8JCONIUy19ikAKdK0oX9SL1uWAqFdOoCPE4ZOjcHc4G3XKDnPe5I5cB
         Z/3A5BFITJhSrhsQNrwjm/zUdtHwxZHjAO1dg5aDEXR3K7AW8VDyweLQVSdLV9E7W1/I
         V0poWPP42qBCzNfWOuD2Xg8q8SpQrU9sBKB4eJ6UdcGNuEWVed9MsSmqerfT8R8gqo8h
         4CZ/eYp5TjbWBfHC6mxSQHINVTYvAJufNMvU1HViOGUVlPpHq1JpoBfryRWP2KQ0EdCc
         3dlA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@daynix-com.20230601.gappssmtp.com header.s=20230601 header.b=TV3woJwa;
       spf=neutral (google.com: 209.85.220.41 is neither permitted nor denied by best guess record for domain of akihiko.odaki@daynix.com) smtp.mailfrom=akihiko.odaki@daynix.com
Return-Path: <akihiko.odaki@daynix.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id jk3-20020a170903330300b001cc1e1c32d0sor2650691plb.5.2023.11.05.04.17.26
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Sun, 05 Nov 2023 04:17:26 -0800 (PST)
Received-SPF: neutral (google.com: 209.85.220.41 is neither permitted nor denied by best guess record for domain of akihiko.odaki@daynix.com) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@daynix-com.20230601.gappssmtp.com header.s=20230601 header.b=TV3woJwa;
       spf=neutral (google.com: 209.85.220.41 is neither permitted nor denied by best guess record for domain of akihiko.odaki@daynix.com) smtp.mailfrom=akihiko.odaki@daynix.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=daynix-com.20230601.gappssmtp.com; s=20230601; t=1699186646; x=1699791446; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=SeSAy6CaTtpqhdSyHQCwmDvDBGSEd3nXyY7i9vBAN/w=;
        b=TV3woJwar9TjkmbJ4LD/B531PajUwZlRMORjUpRXihdt0ph/mYGRBxdABszLiZZELC
         XJ4K/6PVjJQkKEpCLwEysSbjdUmurOP8Wu/szb8owjMx2IqMnbH12qUAQv3ColjCTdgK
         zc/myzsmmFfD8hwTsFwqQc2kB3Lc8CZxQmdMZK61n/eSSQZYCQnptwTFXdU5E+d6Oxh/
         CqABxMexA1RI7oYGr6MjNJVSJ3H2DWSTaY01gBlJCavP5ES7u0jC9IV90EdbjDiVbV+T
         PSXAPH8i24xPKKXLnhZoYDS5oKOEykkynP4O0gtluaWKoUXdd/kPMTYviNixj4dtOnZY
         SiCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699186646; x=1699791446;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SeSAy6CaTtpqhdSyHQCwmDvDBGSEd3nXyY7i9vBAN/w=;
        b=IQ2L89Rdt2KnqsZjC6By9ussBPcaHpluDHppKhZAoW+h5le74qmLwSLhtCFAw98VTx
         sEu2LwW7FT6uMZ4a8RWpZ9/VG/FmL6b2oAmoTRqM4fcmBwCSqJhC3BI9FTwmE2EdCdqQ
         f1njE0jhByrVCFg6N+7SI9kfAJ9WveVDHgKUwYBLxSf37JHMbtpzMGGLdsqWkf3VRWzI
         1uuhvnxLKUd1DazWyE/8yriejKBMEXvr7WtVf38o4uJ15CaM8lrVQoNNoG7nxw7dHLtl
         Sj3BGakr6F7j7E8HJVZ52G0/DphxAR+uNC4CKQN+DB3YZryCyCZbrsc3NZ5wObVgudCz
         n4uA==
X-Gm-Message-State: AOJu0YzVGvCaK2k6/G79kQNOMdZtsutCMpRMw5E+z59v8uriCAnVJJK0
	CbPVakjnhC7NCvIkVbc2DyqhktRpRdG/wEAQ0BA=
X-Google-Smtp-Source: AGHT+IEddoUQay+8ZE9xXcKrOyoFFrBQzIfOn8VssoA27aSnXsMEhr+vQNdg8V2RXaSSmp0GYw3KfA==
X-Received: by 2002:a17:903:288b:b0:1c5:6157:f073 with SMTP id ku11-20020a170903288b00b001c56157f073mr26337827plb.11.1699186645690;
        Sun, 05 Nov 2023 04:17:25 -0800 (PST)
Return-Path: <akihiko.odaki@daynix.com>
Received: from ?IPV6:2400:4050:a840:1e00:78d2:b862:10a7:d486? ([2400:4050:a840:1e00:78d2:b862:10a7:d486])
        by smtp.gmail.com with ESMTPSA id i10-20020a170902c94a00b001b8a00d4f7asm4140306pla.9.2023.11.05.04.17.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 05 Nov 2023 04:17:25 -0800 (PST)
Message-ID: <a28e343f-d864-4817-9ef4-75d6f0f1c291@daynix.com>
Date: Sun, 5 Nov 2023 21:17:16 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 06/29] tests/tcg: add an explicit gdbstub register tester
To: =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Song Gao <gaosong@loongson.cn>, qemu-arm@nongnu.org,
 =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Weiwei Li <liweiwei@iscas.ac.cn>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Ilya Leoshkevich <iii@linux.ibm.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Yanan Wang <wangyanan55@huawei.com>, =?UTF-8?Q?C=C3=A9dric_Le_Goater?=
 <clg@kaod.org>, Paolo Bonzini <pbonzini@redhat.com>,
 David Hildenbrand <david@redhat.com>, Brian Cain <bcain@quicinc.com>,
 qemu-ppc@nongnu.org, Palmer Dabbelt <palmer@dabbelt.com>,
 qemu-riscv@nongnu.org, Eduardo Habkost <eduardo@habkost.net>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Alistair Francis <alistair.francis@wdc.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, Cleber Rosa <crosa@redhat.com>,
 qemu-s390x@nongnu.org, Laurent Vivier <laurent@vivier.eu>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Nicholas Piggin <npiggin@gmail.com>, Thomas Huth <thuth@redhat.com>,
 John Snow <jsnow@redhat.com>, Alexandre Iooss <erdnaxe@crans.org>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 Mahmoud Mandour <ma.mandourr@gmail.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Bin Meng <bin.meng@windriver.com>, Beraldo Leal <bleal@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Michael Rolnik <mrolnik@gmail.com>, Luis Machado <luis.machado@linaro.org>
References: <20231103195956.1998255-1-alex.bennee@linaro.org>
 <20231103195956.1998255-7-alex.bennee@linaro.org>
Content-Language: en-US
From: Akihiko Odaki <akihiko.odaki@daynix.com>
In-Reply-To: <20231103195956.1998255-7-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: rkbE2XqjXens

On 2023/11/04 4:59, Alex Bennée wrote:
> We already do a couple of "info registers" for specific tests but this
> is a more comprehensive multiarch test. It also has some output
> helpful for debugging the gdbstub by showing which XML features are
> advertised and what the underlying register numbers are.
> 
> My initial motivation was to see if there are any duplicate register
> names exposed via the gdbstub while I was reviewing the proposed
> register interface for TCG plugins.
> 
> Mismatches between the xml and remote-desc are reported for debugging
> but do not fail the test.
> 
> Cc: Akihiko Odaki <akihiko.odaki@daynix.com>
> Cc: Luis Machado <luis.machado@linaro.org>
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> Message-Id: <20231012170426.1335442-1-alex.bennee@linaro.org>
> 
> ---
> v2
>    - remove python2 compat bits
>    - add SPDX header, clean up comment lines
>    - fix duplicate check
>    - use field 6 (Rmt Nr) instead of field 1 (Nr) for cross-check
>    - more useful output on finding a duplicates and missing regs
>    - handle non-XML targets cleanly
> ---
>   tests/tcg/multiarch/Makefile.target           |  11 +-
>   tests/tcg/multiarch/gdbstub/registers.py      | 188 ++++++++++++++++++
>   .../multiarch/system/Makefile.softmmu-target  |  13 +-
>   3 files changed, 210 insertions(+), 2 deletions(-)
>   create mode 100644 tests/tcg/multiarch/gdbstub/registers.py
> 
> diff --git a/tests/tcg/multiarch/Makefile.target b/tests/tcg/multiarch/Makefile.target
> index f3bfaf1a22..d31ba8d6ae 100644
> --- a/tests/tcg/multiarch/Makefile.target
> +++ b/tests/tcg/multiarch/Makefile.target
> @@ -93,12 +93,21 @@ run-gdbstub-thread-breakpoint: testthread
>   		--qemu $(QEMU) --qargs "$(QEMU_OPTS)" \
>   		--bin $< --test $(MULTIARCH_SRC)/gdbstub/test-thread-breakpoint.py, \
>   	hitting a breakpoint on non-main thread)
> +
> +run-gdbstub-registers: sha512
> +	$(call run-test, $@, $(GDB_SCRIPT) \
> +		--gdb $(GDB) \
> +		--qemu $(QEMU) --qargs "$(QEMU_OPTS)" \
> +		--bin $< --test $(MULTIARCH_SRC)/gdbstub/registers.py, \
> +	checking register enumeration)
> +
>   else
>   run-gdbstub-%:
>   	$(call skip-test, "gdbstub test $*", "need working gdb with $(patsubst -%,,$(TARGET_NAME)) support")
>   endif
>   EXTRA_RUNS += run-gdbstub-sha1 run-gdbstub-qxfer-auxv-read \
> -	      run-gdbstub-proc-mappings run-gdbstub-thread-breakpoint
> +	      run-gdbstub-proc-mappings run-gdbstub-thread-breakpoint \
> +	      run-gdbstub-registers
>   
>   # ARM Compatible Semi Hosting Tests
>   #
> diff --git a/tests/tcg/multiarch/gdbstub/registers.py b/tests/tcg/multiarch/gdbstub/registers.py
> new file mode 100644
> index 0000000000..2aa0c30165
> --- /dev/null
> +++ b/tests/tcg/multiarch/gdbstub/registers.py
> @@ -0,0 +1,188 @@
> +# Exercise the register functionality by exhaustively iterating
> +# through all supported registers on the system.
> +#
> +# This is launched via tests/guest-debug/run-test.py but you can also
> +# call it directly if using it for debugging/introspection:
> +#
> +# SPDX-License-Identifier: GPL-2.0-or-later
> +
> +import gdb
> +import sys
> +import xml.etree.ElementTree as ET
> +
> +initial_vlen = 0

This seems unused.

> +failcount = 0
> +
> +def report(cond, msg):
> +    "Report success/fail of test."
> +    if cond:
> +        print("PASS: %s" % (msg))
> +    else:
> +        print("FAIL: %s" % (msg))
> +        global failcount
> +        failcount += 1

I suggest using unittest to remove this boilerplate.

> +
> +
> +def fetch_xml_regmap():
> +    """
> +    Iterate through the XML descriptions and validate.
> +
> +    We check for any duplicate registers and report them. Return a
> +    reg_map hash containing the names, regnums and initial values of
> +    all registers.
> +    """
> +
> +    # First check the XML descriptions we have sent. Most arches
> +    # support XML but a few of the ancient ones don't in which case we
> +    # need to gracefully fail.
> +
> +    try:
> +        xml = gdb.execute("maint print xml-tdesc", False, True)
> +    except (gdb.error):
> +        print("SKIP: target does not support XML")
> +        return None
> +
> +    total_regs = 0
> +    reg_map = {}
> +    frame = gdb.selected_frame()
> +
> +    tree = ET.fromstring(xml)
> +    for f in tree.findall("feature"):
> +        name = f.attrib["name"]
> +        regs = f.findall("reg")
> +
> +        total = len(regs)
> +        total_regs += total
> +        base = int(regs[0].attrib["regnum"])
> +        top = int(regs[-1].attrib["regnum"])
> +
> +        print(f"feature: {name} has {total} registers from {base} to {top}")
> +
> +        for r in regs:
> +            name = r.attrib["name"]
> +            regnum = int(r.attrib["regnum"])
> +            value = frame.read_register(name).__str__()

Does it really need conversion to string?

> +            entry = { "name": name, "initial": value, "regnum": regnum }
> +
> +            if name in reg_map:
> +                report(False, f"duplicate register {entry} vs {reg_map[name]}")
> +                continue
> +
> +            reg_map[name] = entry
> +
> +    # Validate we match
> +    report(total_regs == len(reg_map.keys()),
> +           f"counted all {total_regs} registers in XML")
> +
> +    return reg_map
> +
> +def crosscheck_remote_xml(reg_map):
> +    """
> +    Cross-check the list of remote-registers with the XML info.
> +    """
> +
> +    remote = gdb.execute("maint print remote-registers", False, True)
> +    r_regs = remote.split("\n")
> +
> +    total_regs = len(reg_map.keys())
> +    total_r_regs = 0
> +
> +    for r in r_regs:
> +        fields = r.split()
> +        # Some of the registers reported here are "pseudo" registers that
> +        # gdb invents based on actual registers so we need to filter them
> +        # out.
> +        if len(fields) == 8:
> +            r_name = fields[0]
> +            r_regnum = int(fields[6])
> +
> +            # check in the XML
> +            try:
> +                x_reg = reg_map[r_name]
> +                x_reg["seen"] = True

Place x_reg["seen"] out of this try block.
