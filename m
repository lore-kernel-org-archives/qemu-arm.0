Received: by 2002:a05:6512:15a3:0:0:0:0 with SMTP id bp35csp1214477lfb;
        Mon, 20 Dec 2021 09:33:34 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzDKamuhZkFNvWLlLNxOxYwCMB9Gqgp+VGfZMmtG6FmN0GoCXMK9QlP9e/FnuLH+KW1EBBA
X-Received: by 2002:a25:2c4d:: with SMTP id s74mr22549570ybs.171.1640021614362;
        Mon, 20 Dec 2021 09:33:34 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1640021614; cv=none;
        d=google.com; s=arc-20160816;
        b=IHnJ4k5azryiiysXPwatsaHTMjyaclqveXn7LO9AHvEaEZP+dleBehQ1tl4NxjEmZi
         a4lWda08PQXCQGYA9Y2lbExa0aYYhvfPU2AiVVE+xE5sGWEkFrbhffNpwVAULU1ZAHs3
         N/psajo17OG53sY+4DCf2znUf4nn8HIUhlJYBNurIxMTtXfzCJia6KOvsXLjFtwHJ4Am
         MimPSo1KL+5SwS5woBLP1eom2ekjjzYWYwiQi+b6s1S0dIWgNpKhnSB8UeZYhn4uhnuM
         WD+fqHV7EU7Qld790htM69QQ9run4oywMlZENJGe+wD3694FzMXIV0t+rskA0KUGg9uP
         RmHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=DXKGRpVwPCdFvD+2fb4T2VT2jcllk0ecvqDHG2q7Gv0=;
        b=REWSmNzaQjPMvwzNTI6N4psX7ZBwVidIkdbr6x7SL3fiXawT6EB0M5+uY5WcP74BlJ
         Pxu9zoZ1D/xF+3Ts84CHPDtP0T53U4QPCRXkB6Ob24MeGoRxXoD+t8JWrMjYQtTK7NaZ
         mMZGvIj2BlRewl++CjFkJj5Q24IQzF0nNr5EEbNErwKY+dD+gXWazeopwb2vLB9EwVD+
         qz91IaWappgt07I4WofuNBe2B2/ooke1aocQIyTgT7tutC00aoPTY+W7T7hRRQB9RV7/
         1Fgg1Ie3pbkRelApR8S+YEwK6cvVID17FjNmFgi8NBKO9ko6AL9O5JHmfgKT2GkTV1aa
         pqoA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@anisinha-ca.20210112.gappssmtp.com header.s=20210112 header.b=BaFp4CiM;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id r7si21436256ybk.13.2021.12.20.09.33.34
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 20 Dec 2021 09:33:34 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@anisinha-ca.20210112.gappssmtp.com header.s=20210112 header.b=BaFp4CiM;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:47568 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mzMXV-0001S7-OW
	for alex.bennee@linaro.org; Mon, 20 Dec 2021 12:33:33 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59868)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1mzKgh-0001vo-F8
 for qemu-devel@nongnu.org; Mon, 20 Dec 2021 10:34:55 -0500
Received: from [2607:f8b0:4864:20::b32] (port=44893
 helo=mail-yb1-xb32.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1mzKgc-0005ZT-UG
 for qemu-devel@nongnu.org; Mon, 20 Dec 2021 10:34:55 -0500
Received: by mail-yb1-xb32.google.com with SMTP id q74so29805937ybq.11
 for <qemu-devel@nongnu.org>; Mon, 20 Dec 2021 07:34:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anisinha-ca.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=DXKGRpVwPCdFvD+2fb4T2VT2jcllk0ecvqDHG2q7Gv0=;
 b=BaFp4CiMnPPqeHnsbXs11LsYxFJjvJviW5sAxqyJY0YxCnCwFgWjurnb1CFEZleL/O
 8xEI10T3XVHyJgwV5S1Og2PDKnpGiCfxG3ufG2rzHA0XWTkX/OtAI+oLr3Uv3muZLhHE
 30oVEJq0U8cOLXVIa03fuh4AZ79X8VcIKdaRxDD3daFMr+kPqb/xqOgCisKLJNcWcrGF
 8tu/FxOUlsCv7lFYHzVIL++F8s216RjnR6bAibXxG1JGfi8gO/TGDLUXBDAm5way2Udv
 S4A3JfWvTKL5fXHVBnqPUK3r0x6dFD0DeUxyHMuYIc5P2bsq9wsDzygaiUxT7o+nwNFA
 XB3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=DXKGRpVwPCdFvD+2fb4T2VT2jcllk0ecvqDHG2q7Gv0=;
 b=2oveYDxidLpiMLTdMv+YZ9VhIzcGxasNXMuD2tccGsbEOHbNzbt6B/2Ip4TIFSwaoY
 QNI+hYS1luq0UrIF1ZwH2ubkNE7vxXQ3UpMnK6E0ikqDnNJVwH2oFKiAw27o4CrM+IRT
 j5P+jUqBB6/IlLSLdljBexfCFWE+Qyy8w+CL7bS8mQKEoRd1zmWUpcFGNITtg9LHbRqV
 8+7q076lMoYaMQ8kbIGLw3qq7M+ERTU1zLSv2Ijw7ngbT0VKHhpQxUl87k+P6bSGhYBJ
 fsQrYzEltFdBpGQJc75+x+9YUlHWAAHnW2omdOg8adL8ZdUATCfH8pfaN0agzfMypdyr
 if1Q==
X-Gm-Message-State: AOAM531Y+va2VRUlvXXIHGN431T9CnWdehEjPnUzZe09gzbQTkkmgc4x
 tDuRxXgOAS/vY8kSWSWdYELczR42ZLUdkKlXrCh7Z6jze1O5qA==
X-Received: by 2002:ab0:3009:: with SMTP id f9mr1737384ual.4.1640000317321;
 Mon, 20 Dec 2021 03:38:37 -0800 (PST)
MIME-Version: 1.0
References: <alpine.DEB.2.22.394.2112182006430.46303@anisinha-lenovo>
 <4dfc91ff-1835-e796-772c-0774e089b57b@redhat.com>
In-Reply-To: <4dfc91ff-1835-e796-772c-0774e089b57b@redhat.com>
From: Ani Sinha <ani@anisinha.ca>
Date: Mon, 20 Dec 2021 17:08:25 +0530
Message-ID: <CAARzgwymn8ZgwzLNudm5RRsBZO=LdDntC-S4+m8ZOLW_YBYMwQ@mail.gmail.com>
Subject: Re: build qemu on Monterey?
To: Thomas Huth <thuth@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::b32
 (failed)
Received-SPF: none client-ip=2607:f8b0:4864:20::b32;
 envelope-from=ani@anisinha.ca; helo=mail-yb1-xb32.google.com
X-Spam_score_int: 5
X-Spam_score: 0.5
X-Spam_bar: /
X-Spam_report: (0.5 / 5.0 requ) BAYES_00=-1.9, DATE_IN_PAST_03_06=1.592,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=no autolearn_force=no
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
Cc: qemu-arm <qemu-arm@nongnu.org>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ia5XOqQ2c2yk

On Mon, Dec 20, 2021 at 12:56 PM Thomas Huth <thuth@redhat.com> wrote:
>
> On 18/12/2021 15.38, Ani Sinha wrote:
> > Hi :
> > Has anyone tried this? Yes, I know about
> > https://wiki.qemu.org/Hosts/Mac
> >
> > but I am getting
> >
> > $ ./configure --target-list=x86_64-softmmu
> > Using './build' as the directory for build output
> > Disabling PIE due to missing toolchain support
> >
> > ERROR: glib-2.56 gthread-2.0 is required to compile QEMU
> >
> > when glib is already installed using brew.
> >
> > Any ideas?
>
> 1) Check "config.log" to see the exact reason for the failure

This is what I see :

funcs: do_compiler do_cc compile_prog main
lines: 145 183 1768 0
cc -m64 -mcx16 -std=gnu11 -Wall -DOS_OBJECT_USE_OBJC=0 -D_GNU_SOURCE
-D_FILE_OFFSET_BITS=64 -D_LARGEFILE_SOURCE -Wstrict-prototypes
-Wredundant-decls -Wundef -Wwrite-strings -Wmissing-prototypes
-fno-strict-aliasing -fno-common -fwrapv -Wold-style-definition
-Wtype-limits -Wformat-security -Wformat-y2k -Winit-self
-Wignored-qualifiers -Wempty-body -Wnested-externs -Wendif-labels
-Wexpansion-to-defined -Wno-initializer-overrides
-Wno-missing-include-dirs -Wno-shift-negative-value
-Wno-string-plus-int -Wno-typedef-redefinition
-Wno-tautological-type-limit-compare -Wno-psabi
-fstack-protector-strong -o config-temp/qemu-conf.exe
config-temp/qemu-conf.c -fstack-protector-strong -Wl,-z,relro
-Wl,-z,now
ld: unknown option: -z
clang: error: linker command failed with exit code 1 (use -v to see invocation)

funcs: do_compiler do_cc compile_prog main
lines: 145 183 1860 0
cc -m64 -mcx16 -std=gnu11 -Wall -DOS_OBJECT_USE_OBJC=0 -D_GNU_SOURCE
-D_FILE_OFFSET_BITS=64 -D_LARGEFILE_SOURCE -Wstrict-prototypes
-Wredundant-decls -Wundef -Wwrite-strings -Wmissing-prototypes
-fno-strict-aliasing -fno-common -fwrapv -Wold-style-definition
-Wtype-limits -Wformat-security -Wformat-y2k -Winit-self
-Wignored-qualifiers -Wempty-body -Wnested-externs -Wendif-labels
-Wexpansion-to-defined -Wno-initializer-overrides
-Wno-missing-include-dirs -Wno-shift-negative-value
-Wno-string-plus-int -Wno-typedef-redefinition
-Wno-tautological-type-limit-compare -Wno-psabi
-fstack-protector-strong -o config-temp/qemu-conf.exe
config-temp/qemu-conf.c -fstack-protector-strong

funcs: do_compiler do_cc compile_prog main
lines: 145 183 1979 0
cc -m64 -mcx16 -std=gnu11 -Wall -DOS_OBJECT_USE_OBJC=0 -D_GNU_SOURCE
-D_FILE_OFFSET_BITS=64 -D_LARGEFILE_SOURCE -Wstrict-prototypes
-Wredundant-decls -Wundef -Wwrite-strings -Wmissing-prototypes
-fno-strict-aliasing -fno-common -fwrapv -Wold-style-definition
-Wtype-limits -Wformat-security -Wformat-y2k -Winit-self
-Wignored-qualifiers -Wempty-body -Wnested-externs -Wendif-labels
-Wexpansion-to-defined -Wno-initializer-overrides
-Wno-missing-include-dirs -Wno-shift-negative-value
-Wno-string-plus-int -Wno-typedef-redefinition
-Wno-tautological-type-limit-compare -Wno-psabi
-fstack-protector-strong -o config-temp/qemu-conf.exe
config-temp/qemu-conf.c -fstack-protector-strong -lxenstore -lxenctrl
config-temp/qemu-conf.c:1:10: fatal error: 'xenctrl.h' file not found
#include <xenctrl.h>
         ^~~~~~~~~~~
1 error generated.

funcs: do_compiler do_cc compile_prog main
lines: 145 183 2257 0
cc -m64 -mcx16 -std=gnu11 -Wall -DOS_OBJECT_USE_OBJC=0 -D_GNU_SOURCE
-D_FILE_OFFSET_BITS=64 -D_LARGEFILE_SOURCE -Wstrict-prototypes
-Wredundant-decls -Wundef -Wwrite-strings -Wmissing-prototypes
-fno-strict-aliasing -fno-common -fwrapv -Wold-style-definition
-Wtype-limits -Wformat-security -Wformat-y2k -Winit-self
-Wignored-qualifiers -Wempty-body -Wnested-externs -Wendif-labels
-Wexpansion-to-defined -Wno-initializer-overrides
-Wno-missing-include-dirs -Wno-shift-negative-value
-Wno-string-plus-int -Wno-typedef-redefinition
-Wno-tautological-type-limit-compare -Wno-psabi
-fstack-protector-strong -o config-temp/qemu-conf.exe
config-temp/qemu-conf.c -fstack-protector-strong -lrdmacm -libverbs
-libumad
config-temp/qemu-conf.c:1:10: fatal error: 'rdma/rdma_cma.h' file not found
#include <rdma/rdma_cma.h>
         ^~~~~~~~~~~~~~~~~
1 error generated.

funcs: do_compiler do_cc compile_prog main
lines: 145 183 2355 0
cc -m64 -mcx16 -std=gnu11 -Wall -DOS_OBJECT_USE_OBJC=0 -D_GNU_SOURCE
-D_FILE_OFFSET_BITS=64 -D_LARGEFILE_SOURCE -Wstrict-prototypes
-Wredundant-decls -Wundef -Wwrite-strings -Wmissing-prototypes
-fno-strict-aliasing -fno-common -fwrapv -Wold-style-definition
-Wtype-limits -Wformat-security -Wformat-y2k -Winit-self
-Wignored-qualifiers -Wempty-body -Wnested-externs -Wendif-labels
-Wexpansion-to-defined -Wno-initializer-overrides
-Wno-missing-include-dirs -Wno-shift-negative-value
-Wno-string-plus-int -Wno-typedef-redefinition
-Wno-tautological-type-limit-compare -Wno-psabi
-fstack-protector-strong -o config-temp/qemu-conf.exe
config-temp/qemu-conf.c -fstack-protector-strong
config-temp/qemu-conf.c:2:10: fatal error: 'xfs/xfs.h' file not found
#include <xfs/xfs.h>
         ^~~~~~~~~~~
1 error generated.

funcs: do_compiler do_cc compile_prog main
lines: 145 183 2396 0
cc -m64 -mcx16 -std=gnu11 -Wall -DOS_OBJECT_USE_OBJC=0 -D_GNU_SOURCE
-D_FILE_OFFSET_BITS=64 -D_LARGEFILE_SOURCE -Wstrict-prototypes
-Wredundant-decls -Wundef -Wwrite-strings -Wmissing-prototypes
-fno-strict-aliasing -fno-common -fwrapv -Wold-style-definition
-Wtype-limits -Wformat-security -Wformat-y2k -Winit-self
-Wignored-qualifiers -Wempty-body -Wnested-externs -Wendif-labels
-Wexpansion-to-defined -Wno-initializer-overrides
-Wno-missing-include-dirs -Wno-shift-negative-value
-Wno-string-plus-int -Wno-typedef-redefinition
-Wno-tautological-type-limit-compare -Wno-psabi
-fstack-protector-strong -o config-temp/qemu-conf.exe
config-temp/qemu-conf.c -fstack-protector-strong
-Wl,--dynamic-list=config-temp/qemu-conf.txt
ld: unknown option: --dynamic-list=config-temp/qemu-conf.txt
clang: error: linker command failed with exit code 1 (use -v to see invocation)

funcs: do_compiler do_cc compile_prog main
lines: 145 183 2408 0
cc -m64 -mcx16 -std=gnu11 -Wall -DOS_OBJECT_USE_OBJC=0 -D_GNU_SOURCE
-D_FILE_OFFSET_BITS=64 -D_LARGEFILE_SOURCE -Wstrict-prototypes
-Wredundant-decls -Wundef -Wwrite-strings -Wmissing-prototypes
-fno-strict-aliasing -fno-common -fwrapv -Wold-style-definition
-Wtype-limits -Wformat-security -Wformat-y2k -Winit-self
-Wignored-qualifiers -Wempty-body -Wnested-externs -Wendif-labels
-Wexpansion-to-defined -Wno-initializer-overrides
-Wno-missing-include-dirs -Wno-shift-negative-value
-Wno-string-plus-int -Wno-typedef-redefinition
-Wno-tautological-type-limit-compare -Wno-psabi
-fstack-protector-strong -o config-temp/qemu-conf.exe
config-temp/qemu-conf.c -fstack-protector-strong
-Wl,-exported_symbols_list,config-temp/qemu-conf.txt

>
> 2) Check .gitlab-ci.d/cirrus/macos-11.vars to install the same packages on
> your system, maybe that helps...?

This did not help :(

>
>   HTH,
>    Thomas
>
