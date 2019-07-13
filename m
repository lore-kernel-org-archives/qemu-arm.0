Received: by 2002:a5d:51d0:0:0:0:0:0 with SMTP id n16csp2142330wrv;
        Sat, 13 Jul 2019 08:48:50 -0700 (PDT)
X-Received: by 2002:adf:dbc4:: with SMTP id e4mr11309904wrj.308.1563032930559;
        Sat, 13 Jul 2019 08:48:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1563032930; cv=none;
        d=google.com; s=arc-20160816;
        b=pMigWIhPJJ+ut0wzqg15duVa5IvTlV1ryApKyb9GcsAdkm9iS/nKIf7hOiDaXL5rLd
         ihywkPdR1YL8cHEGYAfC8gWJw6P5Xp3Cz3fn+yyEJ6ekIhyMi6EIHtAc1vQvGUztuh92
         6+nUl1cG5dhw+9TWSh6O/2tucPV9tp62m6Ob5WpJmhz1WhRbsjCWCrOa3GnVNlVMJX22
         FXOMznvOYWKzdLEM0xURVE9kIFJncvv12EiXpvEukE1IwLzQb9GbIsbpmOWaj4CW7QoO
         rtQ8t0BHVZ5GeBYSUHT2KpD27ceFdq7eRVugk5T6pISVNRkwuRk7z8MoMUARgNWVOEPm
         uFcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:cc:to:subject;
        bh=lIQy/xM/lkJzHsC+uIrWgHZXPYT6lr3GMot/wp5sWa8=;
        b=rbMtyzyOgthpJ7ZMEt5cSUF8Wf7xA38/yhkR+G8vTtY2XQOOHMb/edFPRx3YQDAbq4
         hyunxoWdQ6eXBvj1JXoyXsqG6dHQa1iQ197pThkeTHm1RZXSmGsmlsuyhBPbpcVuKYUb
         HqC+IN2geaG7/5WXOysYj9GtlGTDLyrJbzOUeQ7yZ8ggVm1R4OqyMbOH+WaAtRJFuSBt
         CK8WulF1zsphsBZr3+6iJuXTiJQGrr36K4R0A0ektvzC2gCuWu/q364P/GRX6mvr+aae
         FC9O0x1ga0jp9I+pvyOIwI0Aq26r/bpGQh0qJmwXKRREDpbyrULYUPn0lkr4wrl+Alya
         dreA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of philmd@redhat.com designates 209.85.220.65 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <philmd@redhat.com>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id a65sor6879674wmh.10.2019.07.13.08.48.50
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Sat, 13 Jul 2019 08:48:50 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@redhat.com designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of philmd@redhat.com designates 209.85.220.65 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=lIQy/xM/lkJzHsC+uIrWgHZXPYT6lr3GMot/wp5sWa8=;
        b=Y82hHNxzYPRS/gc8j323xu3Tm9kYfVOjNwS3iNfR83xbxnigsgAB3zH/oaAC0rRpP8
         KaP6BgsCM/3pRsiRoX7yU6OPcqt+EJfHjo6pKCYyEooPeLpK4Tczy7CL/Fl2D6oj6PPE
         LrLJ6rNe8/RizNBqdeYRr7rIreTSlGvBTYgpp8PVridj7T4ttT0AuuQOSJocexwiEqkD
         IuKm3184v9sxuDlmMRf1N8cRdNHWLenc1ZtSfAJ9iXR8yPY0X3mUOVWDlDEyt1XR3NsB
         mxOTnBkyRUcoq0p+sf6y6Go+G//hDvznb8aawsk62prlUtXpoaiP/uYy+tcXbSEvE/3n
         tHKw==
X-Gm-Message-State: APjAAAUc9amkWlOT11rGlAQGnph5ionRyhb0gjfWRnGUPLN7eolzdp/k
	TCmstp7iCb35WqU3rnv10E7t5g==
X-Google-Smtp-Source: APXvYqwHvxtIsPnmw/yE7JqVF5MRuvi16G2ZUMzLkFUnfxBVpy9SDmn2dgl60WSFYZO8ahw42oJ6jQ==
X-Received: by 2002:a1c:cb0a:: with SMTP id b10mr15080885wmg.41.1563032930290;
        Sat, 13 Jul 2019 08:48:50 -0700 (PDT)
Return-Path: <philmd@redhat.com>
Received: from [192.168.1.37] (62.red-83-42-61.dynamicip.rima-tde.net. [83.42.61.62])
        by smtp.gmail.com with ESMTPSA id o20sm28700297wrh.8.2019.07.13.08.48.49
        (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
        Sat, 13 Jul 2019 08:48:49 -0700 (PDT)
Subject: Re: [PATCH v1 1/7] tests/docker: add test-misc for building tools &
 docs
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Fam Zheng <fam@euphon.net>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>
References: <20190712111849.9006-1-alex.bennee@linaro.org>
 <20190712111849.9006-2-alex.bennee@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Openpgp: id=89C1E78F601EE86C867495CBA2A3FD6EDEADC0DE;
 url=http://pgp.mit.edu/pks/lookup?op=get&search=0xA2A3FD6EDEADC0DE
Message-ID: <189b17fc-fdba-5ccc-d018-6fbd27c6babd@redhat.com>
Date: Sat, 13 Jul 2019 17:48:48 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190712111849.9006-2-alex.bennee@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: vHamfGmPCFvx

On 7/12/19 1:18 PM, Alex Bennée wrote:
> Add yet another test type so we cna quickly exercise the miscellaneous

"cna" -> "can"

> build products of the build system under various docer configurations.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>  tests/docker/test-misc | 22 ++++++++++++++++++++++
>  1 file changed, 22 insertions(+)
>  create mode 100755 tests/docker/test-misc
> 
> diff --git a/tests/docker/test-misc b/tests/docker/test-misc
> new file mode 100755
> index 00000000000..d480afedca7
> --- /dev/null
> +++ b/tests/docker/test-misc
> @@ -0,0 +1,22 @@
> +#!/bin/bash -e
> +#
> +# Build the miscellaneous components
> +#
> +# Copyright (c) 2019 Linaro Ltd.
> +#
> +# Authors:
> +#  Alex Bennée <alex.bennee@linaro.org>
> +#
> +# This work is licensed under the terms of the GNU GPL, version 2 or later.
> +# See the COPYING file in the top-level directory.
> +#
> +# SPDX-License-Identifier: GPL-2.0-or-later
> +
> +. common.rc
> +
> +cd "$BUILD_DIR"
> +
> +# build everything else but QEMU
> +configure_qemu --disable-user --disable-system --enable-docs --enable-tools
> +build_qemu
> +install_qemu
> 

I got:

$ make docker-test-misc@debian-win32-cross
  BUILD   debian9
  GEN
/home/phil/source/qemu/docker-src.2019-07-13-17.03.48.3829/qemu.tar
  BUILD   debian9-mxe
usage: git archive [<options>] <tree-ish> [<path>...]
   or: git archive --list
   or: git archive --remote <repo> [--exec <cmd>] [<options>] <tree-ish>
[<path>...]
   or: git archive --remote <repo> [--exec <cmd>] --list

    --format <fmt>        archive format
    --prefix <prefix>     prepend prefix to each pathname in the archive
    -o, --output <file>   write the archive to this file
    --worktree-attributes
                          read .gitattributes in working directory
    -v, --verbose         report archived files on stderr
    -0                    store only
    -1                    compress faster
    -9                    compress better

    -l, --list            list supported archive formats

    --remote <repo>       retrieve the archive from remote repository <repo>
    --exec <command>      path to the remote git-upload-archive command

failed to archive qemu
make[1]: *** [tests/docker/Makefile.include:31:
qemu/docker-src.2019-07-13-17.03.48.3829] Error 1

And remembered some script/archive patch on the list:
https://lists.gnu.org/archive/html/qemu-devel/2019-07/msg02073.html

With it amended this works correctly, so:
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Tested-by: Philippe Mathieu-Daudé <philmd@redhat.com>
