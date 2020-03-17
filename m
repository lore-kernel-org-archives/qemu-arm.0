Received: by 2002:a19:5509:0:0:0:0:0 with SMTP id n9csp1358707lfe;
        Tue, 17 Mar 2020 03:30:48 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vsv3A9SkXNI50LOs+yMiPGqp5qSMT3ObXJuaTnpA6LtjniZ0uCHm/FmjGIwMrmdUirO4ppw
X-Received: by 2002:a5b:b45:: with SMTP id b5mr7332140ybr.43.1584441048249;
        Tue, 17 Mar 2020 03:30:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1584441048; cv=none;
        d=google.com; s=arc-20160816;
        b=cDcNV6PTeC71moyvxtgzkivpKJwQ51JkZEYAGZ/tdMT7LqlCO4XasHw94VF2jFE04m
         5OkahnnCifAUKYKo4cg9Iap5Af+0Sa6DbKDHq/j6drAi8EEFq96LM/c0vKCvGzcND5TX
         Yot69yrR0IF9o67Afuog46S30HnYLg9chjWC68j9t4PSeiWG7Y7V/B+4aMc/6IaWpMIi
         P38He3MyRnrXinSHXavhuZxNhri+o56z+AfSswyRpHMg71IYE8Caqx/ajGTZ84gkrWTO
         lL0010Fzb2FZK1yy40BLnCtq1UqB48w2atitpCfMgfgMM36On9cnjC+ieZXSY1a7yVPh
         KBDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :dkim-signature;
        bh=/sEWNqzFaoxEa+58cO40Jpez+R+M71OVxk6iZCOTC5I=;
        b=mc3yk+dlZ+QYQ31mUtddHxDywN0wi9/G9PIQgnpJRK5a1aUHEkGE0+rQQdbE0O5K4z
         2GyAwhKSRqBAcb1631XuhVMLhUz/5nOOEzQi21lA0IE3X7ntMyy9EK5SABVvQjauZSkh
         hhNtmpSdO8aHdcPHXPhm/6vxL2ggnxg2yu6o13OM5McKIOVmFEP2p3IGC8AgD3iSUwOq
         eaYSXmBTRlJUzfK4wBSVYuES6GXvr6gHhT3N8m9IhIW96t0Ww2lVr9GJwHbuLlD6jjfD
         3k/wmpmz6OeXcp+vlTh1uWURe/vjrzJOY+x6h/hPafZLHFeEJswVPBDyAyCJszfW06O9
         25tA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=K0lmFgFK;
       spf=pass (google.com: domain of philmd@redhat.com designates 63.128.21.74 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <philmd@redhat.com>
Received: from us-smtp-delivery-74.mimecast.com (us-smtp-delivery-74.mimecast.com. [63.128.21.74])
        by mx.google.com with ESMTPS id a124si2329331ybb.144.2020.03.17.03.30.48
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 17 Mar 2020 03:30:48 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@redhat.com designates 63.128.21.74 as permitted sender) client-ip=63.128.21.74;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=K0lmFgFK;
       spf=pass (google.com: domain of philmd@redhat.com designates 63.128.21.74 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1584441047;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/sEWNqzFaoxEa+58cO40Jpez+R+M71OVxk6iZCOTC5I=;
	b=K0lmFgFKvkGC/eZ4PAsYVCnvyjWeNWVrWBiwxhhIffb3JlfDm7/9hsnsFPOEJbbY1OzZOh
	Ncdj/feunnLe6qw3GeHsma5kJIA198E9m9VVFJ+f/7uQ8AwIWYyvycD9JhREEcJKoJerfp
	eWnvdxstgC0p2/GS5jxVlf/agaz6uYA=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-346-czwj_TcPNyaRQ8ViTxAM2Q-1; Tue, 17 Mar 2020 06:30:44 -0400
X-MC-Unique: czwj_TcPNyaRQ8ViTxAM2Q-1
Received: by mail-wm1-f70.google.com with SMTP id p18so2929305wmk.9
        for <alex.bennee@linaro.org>; Tue, 17 Mar 2020 03:30:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=55Oo5NkKbyxcBavyE68uAV9NFs7KDyk+gF1ISZOgndM=;
        b=BflnBhU59zaJUXE3T+yhHYczwCLdEby4oseATVLS/ZGsoewqCsF7XK/naYVpm0j2Zo
         0Aikd+bE24nPTapJUnRpj0Edqr3WTqSnbloEsUGS3cme6O7fF5xOeIyWTBz1BtSkGLgZ
         yIaodYg5LPTdKEfsfey6XLKiiLo46BAEDAi0VRtV2egQlTMOveINF3WJOLPqDMY2I439
         VqjN8P4vIbVqDFya2iZHrvtZE7AsajLSyjxMnjjl6BiFR/+MTcPuXrDh8it+xwKY91dI
         30XdGPgVpftnyfbtvDSR87f7BrGQjc49JjsmTP/qxieIstp8ZIq+uoZj3xi4NCyF22Ay
         N6qw==
X-Gm-Message-State: ANhLgQ1knYTEYV0IiuDixxOL0hFENOvysvhponUm+CVr7kVdnPhKAWfP
	XjgKU0US39iSVhvUJSqNn0krztNlCtWnZbVopL/TWdGQX5nw8iBVw9+VdOY1wMTArQAdVIFQjG7
	kmbnBaDINeOh3wHDl
X-Received: by 2002:a5d:6082:: with SMTP id w2mr5352141wrt.300.1584441042561;
        Tue, 17 Mar 2020 03:30:42 -0700 (PDT)
X-Received: by 2002:a5d:6082:: with SMTP id w2mr5352129wrt.300.1584441042386;
        Tue, 17 Mar 2020 03:30:42 -0700 (PDT)
Return-Path: <philmd@redhat.com>
Received: from [192.168.1.34] (96.red-83-59-163.dynamicip.rima-tde.net. [83.59.163.96])
        by smtp.gmail.com with ESMTPSA id t9sm552105wrx.31.2020.03.17.03.30.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Mar 2020 03:30:41 -0700 (PDT)
Subject: Re: [PATCH v1 22/28] tests/guest-debug: add a simple test runner
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>, qemu-arm@nongnu.org
References: <20200316172155.971-1-alex.bennee@linaro.org>
 <20200316172155.971-23-alex.bennee@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <834cdb7b-01aa-c783-843c-f58908d55304@redhat.com>
Date: Tue, 17 Mar 2020 11:30:41 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200316172155.971-23-alex.bennee@linaro.org>
Content-Language: en-US
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-TUID: njHFXg0lqoiR

On 3/16/20 6:21 PM, Alex Benn=C3=A9e wrote:
> The test runners job is to start QEMU with guest debug enabled and
> then spawn a gdb process running a test script that exercises the
> functionality it wants to test.
>=20
> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

Tested-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>

> ---
>   tests/guest-debug/run-test.py | 57 +++++++++++++++++++++++++++++++++++
>   1 file changed, 57 insertions(+)
>   create mode 100755 tests/guest-debug/run-test.py
>=20
> diff --git a/tests/guest-debug/run-test.py b/tests/guest-debug/run-test.p=
y
> new file mode 100755
> index 00000000000..8c49ee2f225
> --- /dev/null
> +++ b/tests/guest-debug/run-test.py
> @@ -0,0 +1,57 @@
> +#!/usr/bin/env python3
> +#
> +# Run a gdbstub test case
> +#
> +# Copyright (c) 2019 Linaro
> +#
> +# Author: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> +#
> +# This work is licensed under the terms of the GNU GPL, version 2 or lat=
er.
> +# See the COPYING file in the top-level directory.
> +#
> +# SPDX-License-Identifier: GPL-2.0-or-later
> +
> +import argparse
> +import subprocess
> +import shutil
> +import shlex
> +
> +def get_args():
> +    parser =3D argparse.ArgumentParser(description=3D"A gdbstub test run=
ner")
> +    parser.add_argument("--qemu", help=3D"Qemu binary for test",
> +                        required=3DTrue)
> +    parser.add_argument("--qargs", help=3D"Qemu arguments for test")
> +    parser.add_argument("--binary", help=3D"Binary to debug",
> +                        required=3DTrue)
> +    parser.add_argument("--test", help=3D"GDB test script",
> +                        required=3DTrue)
> +    parser.add_argument("--gdb", help=3D"The gdb binary to use", default=
=3DNone)
> +
> +    return parser.parse_args()
> +
> +if __name__ =3D=3D '__main__':
> +    args =3D get_args()
> +
> +    # Search for a gdb we can use
> +    if not args.gdb:
> +        args.gdb =3D shutil.which("gdb-multiarch")
> +    if not args.gdb:
> +        args.gdb =3D shutil.which("gdb")
> +    if not args.gdb:
> +        print("We need gdb to run the test")
> +        exit(-1)
> +
> +    # Launch QEMU with binary
> +    if "system" in args.qemu:
> +        cmd =3D "%s %s %s -s -S" % (args.qemu, args.qargs, args.binary)
> +    else:
> +        cmd =3D "%s %s -g 1234 %s" % (args.qemu, args.qargs, args.binary=
)
> +
> +    inferior =3D subprocess.Popen(shlex.split(cmd))
> +
> +    # Now launch gdb with our test and collect the result
> +    gdb_cmd =3D "%s %s -ex 'target remote localhost:1234' -x %s" % (args=
.gdb, args.binary, args.test)
> +
> +    result =3D subprocess.call(gdb_cmd, shell=3DTrue);
> +
> +    exit(result)
>=20
