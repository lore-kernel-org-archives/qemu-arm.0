Received: by 2002:a17:906:da85:b0:8b1:202f:4753 with SMTP id xh5csp4372437ejb;
        Wed, 22 Feb 2023 07:06:55 -0800 (PST)
X-Received: by 2002:a05:600c:44c5:b0:3dc:eaef:c1bb with SMTP id f5-20020a05600c44c500b003dceaefc1bbmr6926732wmo.35.1677078415201;
        Wed, 22 Feb 2023 07:06:55 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1677078415; cv=none;
        d=google.com; s=arc-20160816;
        b=EQNXDr8DsagifL1B7gi1qA9BnXjA0Pa2yxMvD8Nvaz9ttlRQLPimykZBOBSvKQlGB3
         C71ZmavsPmdAvHgteDTAta8caa2ebHfSVsK0xhLTwSUDJT78mJAs88FmC8ugfwSX33nh
         xLkJVJraUl9j5SHJgiGLmY5oNa145jjhW8fy9nA5O6nhMFscrSyiK7ppfBxs+c5MtuRQ
         DJFzwr+PvS0uDpG+DWnHiFsVum1eA5ZyK1pPvV2BUawMe1HGaKfs6uKuv12IYcjPObdm
         uq0+XQ0QveXGvrYMW+BaV3czDwLyi/j7XzcFLLrzsJeohxZcBwoW47MmAqoSwYNnrv2s
         GP4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=1SGhmkUEUjYQw51ldC0My7sFCYDDuRL5UoMY9A1Arh0=;
        b=fyLyiW+iCGcUy5+0H0t20yNujnonUClcDIp4TESHlylaghPF7Ccg8MaZQZEeGP3X6U
         NprEdGfjts3jya+7wmnUa+QDCJHF2UzH+wkhpVnLPc6ZlCDVcNyUjlmo6J7wyz+OPXlq
         Rsa4UAX86A3spmrJpzcwKdivrJKLvlwFQnyuWbHCXR62pgeVkI77AxuHTiRp1QWnPMm5
         dRi/Fl6nD/uG9gx5EOI1k4Ri4FzVQvefrDJohu86UwErMLpc+bOkTVRx043J4V0YkPQd
         r84Ggy6O15MCoBFN44fXntoQSrHSaw45W69KKifEdUxuCNgyK6b9OY+zL4ram0ua86NM
         aWNA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=oHDxTgiN;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id e18-20020a05600c219200b003e200de8b67sor2461667wme.30.2023.02.22.07.06.55
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 22 Feb 2023 07:06:55 -0800 (PST)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=oHDxTgiN;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1SGhmkUEUjYQw51ldC0My7sFCYDDuRL5UoMY9A1Arh0=;
        b=oHDxTgiNyIs2d2L0GtE02kphaUmr4V4ahx/5fQW4a2ioVf+ApCn/vmF29EF65RQDNK
         sCmaYgakW3HVaTgzUD4GCBiy7bQOVqZMwEPq8bFwd2+B3To51au3g0key2DpxLDe2uQe
         VQlIu27XfNULw+3sXNLfW/5/QMZ22WTm9kRdxlEZmA9KQmaCv8Et40oWFjUjqsuv5eFZ
         IDKjU2a5MB7l5uTzxVoQzu2H8lyCH0GfWbhxGboYI4NaP/JfSNuYDnpCnoRwdLepmzWL
         2jjd2If55BbMefbz0bgH24i5YU5dDfuF0v7NfcShEnqFZr0A0E/hX4Kzu78uoU2xMVJ3
         EE5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1SGhmkUEUjYQw51ldC0My7sFCYDDuRL5UoMY9A1Arh0=;
        b=3HEAhbaIHUFf9/dDJ0sadbSjTHmOhtmZC1xzaWo0i6Nd7LeW6P01g2PopP5k8RXfGs
         6r3uYaYCyXOjtdz/6woZSoJArt+V7i7iO6GMkDKxsCrjH1a/ck6WvOWL1rQ/soQjqcCV
         wuCrxzzE6CsVpWGJxoyXDCA3Kp0eSNMnkPw6iJbbDJ1RZD8aD1YzTMdFebGnFAFlJw8n
         geB8s1+ed475MpWXvQxQ+Ash1Je1Ul8VvidhpAbma5fRn6zDOzIirJ9/wBPkcmVcQEAT
         26KQR0So8glNOvgpTOqgASwtM8uDJ9/TMVgXvzholt0iXWkhW46g1keIopr/zLZ8oz8g
         +3mw==
X-Gm-Message-State: AO0yUKW1S3ICJA4qv437tD5CPA8efsPq9F7BfCXTCczeFvJfcb0Hhyb4
	XAygnyCF7jbFf3aglzWyhYMeLFoLcLuB+J+8q/E=
X-Google-Smtp-Source: AK7set9Tx9JDtZYDe7zJCNDX8NYzOQv3KiRZ0B3vIDoTWD30tct8eIHGcNBcdh7x9sntaCmAtM511w==
X-Received: by 2002:a05:600c:44c5:b0:3dc:eaef:c1bb with SMTP id f5-20020a05600c44c500b003dceaefc1bbmr6926698wmo.35.1677078414486;
        Wed, 22 Feb 2023 07:06:54 -0800 (PST)
Return-Path: <philmd@linaro.org>
Received: from [192.168.1.115] ([185.126.107.38])
        by smtp.gmail.com with ESMTPSA id v25-20020a5d5919000000b002c551f7d452sm7194087wrd.98.2023.02.22.07.06.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Feb 2023 07:06:54 -0800 (PST)
Message-ID: <de8d7fbe-a578-12e1-5aee-8bdec93f2d1c@linaro.org>
Date: Wed, 22 Feb 2023 16:06:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: [PATCH 09/12] tests: add tuxrun baseline test to avocado
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: Michael Roth <michael.roth@amd.com>, Alexander Bulekov <alxndr@bu.edu>,
 Qiuhao Li <Qiuhao.Li@outlook.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-arm@nongnu.org, John Snow <jsnow@redhat.com>,
 Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>,
 Darren Kenny <darren.kenny@oracle.com>, Stefan Hajnoczi
 <stefanha@redhat.com>, Bandan Das <bsd@redhat.com>,
 Cleber Rosa <crosa@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Yonggang Luo <luoyonggang@gmail.com>, Li-Wen Hsu <lwhsu@freebsd.org>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Beraldo Leal <bleal@redhat.com>,
 Ed Maste <emaste@freebsd.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Anders Roxell <anders.roxell@linaro.org>
References: <20230215192530.299263-1-alex.bennee@linaro.org>
 <20230215192530.299263-10-alex.bennee@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230215192530.299263-10-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: wfg8+TVkLWLU

On 15/2/23 20:25, Alex Bennée wrote:
> The TuxRun project (www.tuxrun.org) uses QEMU to run tests on a wide
> variety of kernel configurations on wide range of our emulated
> platforms. They publish a known good set of images at:
> 
>    https://storage.tuxboot.com/
> 
> to help with bisecting regressions in either the kernel, firmware or
> QEMU itself. The tests are pretty lightweight as they contain just a
> kernel with a minimal rootfs which boots a lot faster than most of the
> distros. In time they might be persuaded to version there known good
> baselines and we can then enable proper checksums.
> 
> For a couple of tests we currently skip:
> 
>    - mips64, a regression against previous stable release
>    - sh4, very unstable with intermittent oops
> 
> Total run time: 340s (default) -> 890s (debug)
> 
> Overall coverage rate (tested targets + disabled tests):
>    lines......: 16.1% (126894 of 789848 lines)
>    functions..: 20.6% (15954 of 77489 functions)
>    branches...: 9.3% (40727 of 439365 branches)
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> Cc: Anders Roxell <anders.roxell@linaro.org>
> 
> ---
> v2
>    - renamed to tuxrun_baselines, update commit message
>    - add remaining targets
>    - add more metadata tags for the differences
>    - refactor tag code
>    - skip mips64 and sh4 tests in CI
>    - slightly increase delay for login
>    - include in MAINTAINERS
> ---
>   MAINTAINERS                       |   1 +
>   tests/avocado/tuxrun_baselines.py | 423 ++++++++++++++++++++++++++++++
>   2 files changed, 424 insertions(+)
>   create mode 100644 tests/avocado/tuxrun_baselines.py
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index fd54c1f140..be100272b3 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -3760,6 +3760,7 @@ F: scripts/ci/
>   F: tests/docker/
>   F: tests/vm/
>   F: tests/lcitool/
> +F: tests/avocado/tuxrun_baselines.py
>   F: scripts/archive-source.sh
>   F: docs/devel/testing.rst
>   W: https://gitlab.com/qemu-project/qemu/pipelines
> diff --git a/tests/avocado/tuxrun_baselines.py b/tests/avocado/tuxrun_baselines.py
> new file mode 100644
> index 0000000000..30aaefc1d3
> --- /dev/null
> +++ b/tests/avocado/tuxrun_baselines.py
> @@ -0,0 +1,423 @@
> +# Functional test that boots known good tuxboot images the same way
> +# that tuxrun (www.tuxrun.org) does. This tool is used by things like
> +# the LKFT project to run regression tests on kernels.
> +#
> +# Copyright (c) 2023 Linaro Ltd.
> +#
> +# Author:
> +#  Alex Bennée <alex.bennee@linaro.org>
> +#
> +# SPDX-License-Identifier: GPL-2.0-or-later
> +
> +import os
> +import time
> +
> +from avocado import skip, skipIf
> +from avocado_qemu import QemuSystemTest
> +from avocado_qemu import exec_command, exec_command_and_wait_for_pattern
> +from avocado_qemu import wait_for_console_pattern
> +from avocado.utils import process
> +from avocado.utils.path import find_command
> +
> +class TuxRunBaselineTest(QemuSystemTest):

Better inherit from LinuxKernelTest, adding a zstd method there.

> +    """
> +    :avocado: tags=accel:tcg
> +    """
> +
> +    KERNEL_COMMON_COMMAND_LINE = 'printk.time=0'
> +    # Tests are ~10-40s, allow for --debug/--enable-gcov overhead
> +    timeout = 100
> +
> +    def get_tag(self, tagname, default=None):
> +        """
> +        Get the metadata tag or return the default.
> +        """
> +        utag = self._get_unique_tag_val(tagname)
> +        print(f"{tagname}/{default} -> {utag}")
> +        if utag:
> +            return utag
> +
> +        return default
> +
> +    def setUp(self):
> +        super().setUp()
> +
> +        # We need zstd for all the tuxrun tests
> +        # See https://github.com/avocado-framework/avocado/issues/5609
> +        zstd = find_command('zstd', False)
> +        if zstd is False:
> +            self.cancel('Could not find "zstd", which is required to '
> +                        'decompress rootfs')
> +        self.zstd = zstd
> +
> +        # Process the TuxRun specific tags, most machines work with
> +        # reasonable defaults but we sometimes need to tweak the
> +        # config. To avoid open coding everything we store all these
> +        # details in the metadata for each test.
> +
> +        # The tuxboot tag matches the root directory
> +        self.tuxboot = self.get_tag('tuxboot')
> +
> +        # Most Linux's use ttyS0 for their serial port
> +        self.console = self.get_tag('console', "ttyS0")
> +
> +        # Does the machine shutdown QEMU nicely on "halt"
> +        self.shutdown = self.get_tag('shutdown')
> +
> +        # The name of the kernel Image file
> +        self.image = self.get_tag('image', "Image")
> +
> +        # The block device drive type
> +        self.drive = self.get_tag('drive', "virtio-blk-device")
> +
> +        self.root = self.get_tag('root', "vda")
> +
> +        # Occasionally we need extra devices to hook things up
> +        self.extradev = self.get_tag('extradev')
> +
> +    def wait_for_console_pattern(self, success_message, vm=None):
> +        wait_for_console_pattern(self, success_message,
> +                                 failure_message='Kernel panic - not syncing',
> +                                 vm=vm)

(we'd then inherit this method from LinuxKernelTest)

Whichever outcome you rather:
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
