Received: by 2002:a5d:6844:0:0:0:0:0 with SMTP id o4-v6csp683391wrw;
        Tue, 6 Nov 2018 02:02:44 -0800 (PST)
X-Google-Smtp-Source: AJdET5dEXg1ckfcIhFLLNRlW7S22xMYLs8KTsZz7Dnq+MzdLfqsn/cMFD3BR5wPjw6OrLTMSh/sN
X-Received: by 2002:ac8:3e91:: with SMTP id y17-v6mr24093986qtf.314.1541498564488;
        Tue, 06 Nov 2018 02:02:44 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1541498564; cv=none;
        d=google.com; s=arc-20160816;
        b=tR1VPt2z5yXhgB+UDV0iAOQQjR98zB8ep6jTLyfGFJOld2HXV0x0PJKTmO48wAALpu
         bV0G3vGoCDM5zEoTEU7h9sgwy6WXyLBNmkZu0S2kbkA39aXqIC2N3/ENE4d0AuCY3ixm
         +BLfgdOTPD7/6i8cA+eI0ryrxJntDpSAjsVm3u2pZph5fhg67Qs3Q+aJ6ok/TMuBF9Hz
         5j7TBZU8xAu1XJXfyh3/MoL7FRKRQoRpkXq2lgPHDOL7gYNpshSPf6xeNkzkViXxB1bJ
         h0LPMxUZxExSH2xUtIJE2W1xjhrF02nXXVssZ+qFdIfdws/CCLH+0Qm3Fci+lEkLxn2a
         WTyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date;
        bh=1exEABqghJDi/WhbQ129GsdQ8pafM2Bkjm+tUxQqLa8=;
        b=xZZccomOMVALRRtsHbhVSgwvlZw95a/4AxneXjj06MHMY7AGcvb+dMaxhWLR6CcffJ
         lVxMaHOEvbvXnYtxCH3l5Gda1NeiY7Hq7mXpiZkixtFdfj+DTE2T3+tCQA3aV0R103S7
         SJhszt/MvivxFE6JKj8zEtNZlG0mpBzYFH26IuJC9EISppA4NjuzWPBfCceT3jvwkjkv
         PaqFjC9MIbvFX8btyp1islBkYO09DMQ8siOESGLTuLJ/YpI9n4/8mUpX6ul4stSeW441
         ZEjXDb5/t7sasMdvPCbkNnqrZKdg41LwvJdwWi7ZqMWdlHEHykzYdytxCCT3QSb6EcgO
         U9Aw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id m70si6672178qkl.245.2018.11.06.02.02.44
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 06 Nov 2018 02:02:44 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:40001 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gJyC3-0008V8-WD
	for alex.bennee@linaro.org; Tue, 06 Nov 2018 05:02:44 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57752)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <famz@redhat.com>) id 1gJyAD-0007YQ-Ej
	for qemu-arm@nongnu.org; Tue, 06 Nov 2018 05:00:52 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <famz@redhat.com>) id 1gJyA2-0007lx-KQ
	for qemu-arm@nongnu.org; Tue, 06 Nov 2018 05:00:49 -0500
Received: from mx1.redhat.com ([209.132.183.28]:51176)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <famz@redhat.com>)
	id 1gJyA2-0007YG-9P; Tue, 06 Nov 2018 05:00:38 -0500
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 0548B89AC7;
	Tue,  6 Nov 2018 10:00:28 +0000 (UTC)
Received: from localhost (dhcp-14-131.nay.redhat.com [10.66.14.131])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 5D11965F48;
	Tue,  6 Nov 2018 10:00:27 +0000 (UTC)
Date: Tue, 6 Nov 2018 18:00:24 +0800
From: Fam Zheng <famz@redhat.com>
To: qemu-devel@nongnu.org
Message-ID: <20181106100024.GB10330@lemon.usersys.redhat.com>
References: <20181016093703.10637-1-peter.maydell@linaro.org>
	<154149783586.4748.1822263784766763922@015909e0f939>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <154149783586.4748.1822263784766763922@015909e0f939>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.26]);
	Tue, 06 Nov 2018 10:00:28 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH 0/2] target/arm: fix some ATS*
 bugs
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org, patches@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: PE3CLgxsqnVh

On Tue, 11/06 01:50, no-reply@patchew.org wrote:
> ERROR: unknown option --with-gtkabi=3.0

Patchew is testing old series branches of which are heavily lagging behind. This
configure option in the mingw docker testing is recently dropped, so it's a
false positive.

Fam


> Try '/tmp/qemu-test/src/configure --help' for more information
> # QEMU configure log Tue Nov  6 09:50:16 UTC 2018
> # Configured with: '/tmp/qemu-test/src/configure' '--enable-werror' '--target-list=x86_64-softmmu,aarch64-softmmu' '--prefix=/tmp/qemu-test/install' '--python=/usr/bin/python3' '--cross-prefix=x86_64-w64-mingw32-' '--enable-trace-backends=simple' '--enable-gnutls' '--enable-nettle' '--enable-curl' '--enable-vnc' '--enable-bzip2' '--enable-guest-agent' '--with-sdlabi=2.0' '--with-gtkabi=3.0'
> #
> 
> funcs: do_compiler do_cc compile_object check_define main
> lines: 92 119 608 625 0
> x86_64-w64-mingw32-gcc -D_GNU_SOURCE -D_FILE_OFFSET_BITS=64 -D_LARGEFILE_SOURCE -Wstrict-prototypes -Wredundant-decls -Wall -Wundef -Wwrite-strings -Wmissing-prototypes -fno-strict-aliasing -fno-common -fwrapv -c -o config-temp/qemu-conf.o config-temp/qemu-conf.c
> config-temp/qemu-conf.c:2:2: error: #error __linux__ not defined
>  #error __linux__ not defined
>   ^~~~~
> 
> funcs: do_compiler do_cc compile_object check_define main
> lines: 92 119 608 627 0
> x86_64-w64-mingw32-gcc -D_GNU_SOURCE -D_FILE_OFFSET_BITS=64 -D_LARGEFILE_SOURCE -Wstrict-prototypes -Wredundant-decls -Wall -Wundef -Wwrite-strings -Wmissing-prototypes -fno-strict-aliasing -fno-common -fwrapv -c -o config-temp/qemu-conf.o config-temp/qemu-conf.c
> 
> funcs: do_compiler do_cc compile_object check_define main
> lines: 92 119 608 677 0
> x86_64-w64-mingw32-gcc -D_GNU_SOURCE -D_FILE_OFFSET_BITS=64 -D_LARGEFILE_SOURCE -Wstrict-prototypes -Wredundant-decls -Wall -Wundef -Wwrite-strings -Wmissing-prototypes -fno-strict-aliasing -fno-common -fwrapv -c -o config-temp/qemu-conf.o config-temp/qemu-conf.c
> config-temp/qemu-conf.c:2:2: error: #error __i386__ not defined
>  #error __i386__ not defined
>   ^~~~~
> 
> funcs: do_compiler do_cc compile_object check_define main
> lines: 92 119 608 679 0
> x86_64-w64-mingw32-gcc -D_GNU_SOURCE -D_FILE_OFFSET_BITS=64 -D_LARGEFILE_SOURCE -Wstrict-prototypes -Wredundant-decls -Wall -Wundef -Wwrite-strings -Wmissing-prototypes -fno-strict-aliasing -fno-common -fwrapv -c -o config-temp/qemu-conf.o config-temp/qemu-conf.c
> 
> funcs: do_compiler do_cc compile_object check_define main
> lines: 92 119 608 680 0
> x86_64-w64-mingw32-gcc -D_GNU_SOURCE -D_FILE_OFFSET_BITS=64 -D_LARGEFILE_SOURCE -Wstrict-prototypes -Wredundant-decls -Wall -Wundef -Wwrite-strings -Wmissing-prototypes -fno-strict-aliasing -fno-common -fwrapv -c -o config-temp/qemu-conf.o config-temp/qemu-conf.c
> config-temp/qemu-conf.c:2:2: error: #error __ILP32__ not defined
>  #error __ILP32__ not defined
>   ^~~~~
> 
> funcs: do_compiler do_cc compile_object check_include main
> lines: 92 119 616 771 0
> x86_64-w64-mingw32-gcc -D_GNU_SOURCE -D_FILE_OFFSET_BITS=64 -D_LARGEFILE_SOURCE -Wstrict-prototypes -Wredundant-decls -Wall -Wundef -Wwrite-strings -Wmissing-prototypes -fno-strict-aliasing -fno-common -fwrapv -c -o config-temp/qemu-conf.o config-temp/qemu-conf.c
> 
> funcs: do_compiler do_cc compile_prog main
> lines: 92 125 907 0
> x86_64-w64-mingw32-gcc -mthreads -D__USE_MINGW_ANSI_STDIO=1 -DWIN32_LEAN_AND_MEAN -DWINVER=0x501 -D_GNU_SOURCE -D_FILE_OFFSET_BITS=64 -D_LARGEFILE_SOURCE -Wstrict-prototypes -Wredundant-decls -Wall -Wundef -Wwrite-strings -Wmissing-prototypes -fno-strict-aliasing -fno-common -fwrapv -o config-temp/qemu-conf.exe config-temp/qemu-conf.c -g -liberty
> /usr/lib/gcc/x86_64-w64-mingw32/7.3.0/../../../../x86_64-w64-mingw32/bin/ld: cannot find -liberty
> collect2: error: ld returned 1 exit status
> Failed to run 'configure'
> Traceback (most recent call last):
>   File "./tests/docker/docker.py", line 563, in <module>
>     sys.exit(main())
>   File "./tests/docker/docker.py", line 560, in main
>     return args.cmdobj.run(args, argv)
>   File "./tests/docker/docker.py", line 306, in run
>     return Docker().run(argv, args.keep, quiet=args.quiet)
>   File "./tests/docker/docker.py", line 274, in run
>     quiet=quiet)
>   File "./tests/docker/docker.py", line 181, in _do_check
>     return subprocess.check_call(self._command + cmd, **kwargs)
>   File "/usr/lib64/python2.7/subprocess.py", line 186, in check_call
>     raise CalledProcessError(retcode, cmd)
> subprocess.CalledProcessError: Command '['sudo', '-n', 'docker', 'run', '--label', 'com.qemu.instance.uuid=5bcf7f1ce1a911e88b3152540069c830', '-u', '1000', '--security-opt', 'seccomp=unconfined', '--rm', '--net=none', '-e', 'TARGET_LIST=', '-e', 'EXTRA_CONFIGURE_OPTS=', '-e', 'V=', '-e', 'J=8', '-e', 'DEBUG=', '-e', 'SHOW_ENV=1', '-e', 'CCACHE_DIR=/var/tmp/ccache', '-v', '/home/patchew/.cache/qemu-docker-ccache:/var/tmp/ccache:z', '-v', '/var/tmp/patchew-tester-tmp-j_cwgv70/src/docker-src.2018-11-06-04.49.59.28947:/var/tmp/qemu:z,ro', 'qemu:fedora', '/var/tmp/qemu/run', 'test-mingw']' returned non-zero exit status 1
> make[1]: *** [tests/docker/Makefile.include:217: docker-run] Error 1
> make[1]: Leaving directory '/var/tmp/patchew-tester-tmp-j_cwgv70/src'
> make: *** [tests/docker/Makefile.include:251: docker-run-test-mingw@fedora] Error 2
> 
> real	0m37.093s
> user	0m5.048s
> sys	0m3.799s
> === OUTPUT END ===
> 
> Test command exited with code: 2
> 
> 
> ---
> Email generated automatically by Patchew [http://patchew.org/].
> Please send your feedback to patchew-devel@redhat.com
