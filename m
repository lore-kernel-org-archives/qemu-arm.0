Received: by 2002:a17:906:3657:b0:a0d:e0d9:b5bf with SMTP id r23csp341027ejb;
        Thu, 30 Nov 2023 08:06:42 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEBRcQR7ZxqQHFanOyn3bZHOSu4Bp2iWVbPxjjWSlvhgsF8KaXBgBY3L/Mwq+TCyza63iVp
X-Received: by 2002:a05:6a20:9146:b0:18b:6f9:dc22 with SMTP id x6-20020a056a20914600b0018b06f9dc22mr23876784pzc.41.1701360401908;
        Thu, 30 Nov 2023 08:06:41 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1701360401; cv=none;
        d=google.com; s=arc-20160816;
        b=Ss9AHPEoEd0uUH7DnDUnMpA+TmwPrGw6fWA1e26d/VIbrL9MH6xOoPZY8al5qjcHCV
         0hj3C6pv3LswjW1kfhXW7zAZ2rxUTnt3uavSOG0nxkJ1U3YKbP1Pdwdm5BtR4lMoQgXc
         oUklBbf5FyvjfhonuAJz/WKY9evHnEUwaJoC/FmldLQK7QgNnXisbRGA9vINUBkhC67k
         uGxM3iE3scZMsvY7Lw+sULSyfPd/a+I5lsmmgV8XMnG+GnQ8UvIz+msHZb1egZ89lVoa
         P8ZhCshhqQ0mTYGrDrq7yP5TwUWcAtLHoZ+qgtdyZ+RjWlSJtpjDP5YHuntPcCrq5PpM
         vmPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id;
        bh=oTxuKcwkIT0RmYeKpL38LmVaaU5xCd4NSGfPs8udPy8=;
        fh=MjWoUIOStEJIM46L9cQZzp/fgApSOM9Gwzkuuzn9usM=;
        b=WTSEGhVtk3qxh7e1bFWdbRudiUchukNQmeMFh9q3ztOSKvF5moXp3ohX6YlB1WvtMD
         ueS8vvYXz2f99pYBLRCa+DQLfp5yLjdO9m0xiVaK/CoJssqMd4PtbanzLniAVdnfnV5b
         VPenHy1vPF0XoigxNs3PC7wJlgNR1k/6skqSzK0hEqtyXeZGb0Qq4z7YOFeVoshzery0
         H6o0wzPtHuUuWfNZQvI46Du9KbjAcxkmqsDUhMeCS2hmS1vwYR49PgqSksmxjasczwV7
         6jRhlCFhPE4jFXCtan7DtlQnbYuHO2B358J0tJhJU2c0h4cVY1xKl1hqa5epumBER6/c
         YFuQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of srs0=tvl7=hl=kaod.org=clg@ozlabs.org designates 2404:9400:2221:ea00::3 as permitted sender) smtp.mailfrom="SRS0=Tvl7=HL=kaod.org=clg@ozlabs.org"
Return-Path: <SRS0=Tvl7=HL=kaod.org=clg@ozlabs.org>
Received: from gandalf.ozlabs.org (mail.ozlabs.org. [2404:9400:2221:ea00::3])
        by mx.google.com with ESMTPS id by8-20020a056a02058800b005bdfb77e559si443162pgb.468.2023.11.30.08.06.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Nov 2023 08:06:41 -0800 (PST)
Received-SPF: pass (google.com: domain of srs0=tvl7=hl=kaod.org=clg@ozlabs.org designates 2404:9400:2221:ea00::3 as permitted sender) client-ip=2404:9400:2221:ea00::3;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of srs0=tvl7=hl=kaod.org=clg@ozlabs.org designates 2404:9400:2221:ea00::3 as permitted sender) smtp.mailfrom="SRS0=Tvl7=HL=kaod.org=clg@ozlabs.org"
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	by gandalf.ozlabs.org (Postfix) with ESMTP id 4Sh1KC5b2bz4xjd;
	Fri,  1 Dec 2023 03:06:39 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Sh1Jt6SN0z4xhb;
	Fri,  1 Dec 2023 03:06:22 +1100 (AEDT)
Message-ID: <8d94e28d-70b6-47c6-8e4b-23f2c9d445b2@kaod.org>
Date: Thu, 30 Nov 2023 17:06:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] docs/devel: rationalise unstable gitlab tests under
 FLAKY_TESTS
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: Eric Farman <farman@linux.ibm.com>, Cleber Rosa <crosa@redhat.com>,
 Andrew Jeffery <andrew@codeconstruct.com.au>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Eric Auger <eric.auger@redhat.com>, qemu-arm@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>, Halil Pasic <pasic@linux.ibm.com>,
 Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>,
 Aurelien Jarno <aurelien@aurel32.net>, qemu-s390x@nongnu.org,
 Beraldo Leal <bleal@redhat.com>, Joel Stanley <joel@jms.id.au>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Thomas Huth <thuth@redhat.com>, Nicholas Piggin <npiggin@gmail.com>
References: <20231130153333.2424775-1-alex.bennee@linaro.org>
 <20231130153333.2424775-3-alex.bennee@linaro.org>
From: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20231130153333.2424775-3-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: S0of3ArMQb69

On 11/30/23 16:33, Alex Bennée wrote:
> It doesn't make sense to have two classes of flaky tests. While it may
> take the constrained environment of CI to trigger failures easily it
> doesn't mean they don't occasionally happen on developer machines. As
> CI is the gating factor to passing there is no point developers
> running the tests locally anyway unless they are trying to fix things.
> 
> While we are at it update the language in the docs to discourage the
> QEMU_TEST_FLAKY_TESTS becoming a permanent solution.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>   docs/devel/testing.rst                   | 31 +++++++++++++++---------
>   tests/avocado/boot_linux.py              |  8 +++---
>   tests/avocado/boot_linux_console.py      |  5 ++--
>   tests/avocado/intel_iommu.py             |  5 ++--
>   tests/avocado/linux_initrd.py            |  5 ++--
>   tests/avocado/machine_aspeed.py          |  8 +++---
>   tests/avocado/machine_mips_malta.py      |  8 +++---
>   tests/avocado/machine_rx_gdbsim.py       |  8 +++---
>   tests/avocado/machine_s390_ccw_virtio.py |  2 +-
>   tests/avocado/replay_kernel.py           |  5 ++--
>   tests/avocado/reverse_debugging.py       | 14 +++++++----
>   tests/avocado/smmu.py                    |  5 ++--
>   tests/avocado/tuxrun_baselines.py        |  4 +--
>   13 files changed, 67 insertions(+), 41 deletions(-)
> 
> diff --git a/docs/devel/testing.rst b/docs/devel/testing.rst
> index 22218dbedb..579d1837e0 100644
> --- a/docs/devel/testing.rst
> +++ b/docs/devel/testing.rst
> @@ -1371,23 +1371,32 @@ conditions. For example, tests that take longer to execute when QEMU is
>   compiled with debug flags. Therefore, the ``AVOCADO_TIMEOUT_EXPECTED`` variable
>   has been used to determine whether those tests should run or not.
>   
> -GITLAB_CI
> -^^^^^^^^^
> -A number of tests are flagged to not run on the GitLab CI. Usually because
> -they proved to the flaky or there are constraints on the CI environment which
> -would make them fail. If you encounter a similar situation then use that
> -variable as shown on the code snippet below to skip the test:
> +QEMU_TEST_FLAKY_TESTS
> +^^^^^^^^^^^^^^^^^^^^^
> +Some tests are not working reliably and thus are disabled by default.
> +This includes tests that don't run reliably on GitLab's CI which
> +usually expose real issues that are rarely seen on developer machines
> +due to the constraints of the CI environment. If you encounter a
> +similar situation then mark the test as shown on the code snippet
> +below:
>   
>   .. code::
>   
> -  @skipIf(os.getenv('GITLAB_CI'), 'Running on GitLab')
> +  @skipUnless(os.getenv('QEMU_TEST_FLAKY_TESTS'), 'Test is unstable on GitLab')
>     def test(self):
>         do_something()
>   
> -QEMU_TEST_FLAKY_TESTS
> -^^^^^^^^^^^^^^^^^^^^^
> -Some tests are not working reliably and thus are disabled by default.
> -Set this environment variable to enable them.
> +Tests should not live in this state forever and should either be fixed
> +or eventually removed. If you move a test into this category please
> +consider raising a bug to track progress towards a fix.
> +
> +To run such tests locally you will need to set the environment
> +variable. For example:
> +
> +.. code::
> +
> +   env QEMU_TEST_FLAKY_TESTS=1 ./pyvenv/bin/avocado run \
> +      tests/avocado/boot_linux.py:BootLinuxPPC64.test_pseries_tcg
>   
>   Uninstalling Avocado
>   ~~~~~~~~~~~~~~~~~~~~
> diff --git a/tests/avocado/boot_linux.py b/tests/avocado/boot_linux.py
> index be30dcbd58..9e9773e6e1 100644
> --- a/tests/avocado/boot_linux.py
> +++ b/tests/avocado/boot_linux.py
> @@ -12,7 +12,7 @@
>   
>   from avocado_qemu import LinuxTest, BUILD_DIR
>   
> -from avocado import skipIf
> +from avocado import skipUnless
>   
>   
>   class BootLinuxX8664(LinuxTest):
> @@ -93,7 +93,8 @@ class BootLinuxPPC64(LinuxTest):
>   
>       timeout = 360
>   
> -    @skipIf(os.getenv('GITLAB_CI'), 'Running on GitLab')
> +    @skipUnless(os.getenv('QEMU_TEST_FLAKY_TESTS'), 'Test is unstable on GitLab')
> +
>       def test_pseries_tcg(self):

is it because the test is too slow ? If this is the case then we should
probably remove. I have never see it fails though.

>           """
>           :avocado: tags=machine:pseries
> @@ -111,7 +112,8 @@ class BootLinuxS390X(LinuxTest):
>   
>       timeout = 240
>   
> -    @skipIf(os.getenv('GITLAB_CI'), 'Running on GitLab')
> +    @skipUnless(os.getenv('QEMU_TEST_FLAKY_TESTS'), 'Test is unstable on GitLab')
> +
>       def test_s390_ccw_virtio_tcg(self):
>           """
>           :avocado: tags=machine:s390-ccw-virtio
> diff --git a/tests/avocado/boot_linux_console.py b/tests/avocado/boot_linux_console.py
> index 6eab515718..231b4f68e5 100644
> --- a/tests/avocado/boot_linux_console.py
> +++ b/tests/avocado/boot_linux_console.py
> @@ -15,7 +15,7 @@
>   
>   from avocado import skip
>   from avocado import skipUnless
> -from avocado import skipIf
> +from avocado import skipUnless
>   from avocado_qemu import QemuSystemTest
>   from avocado_qemu import exec_command
>   from avocado_qemu import exec_command_and_wait_for_pattern
> @@ -1419,7 +1419,8 @@ def test_ppc_mac99(self):
>       # This test has a 6-10% failure rate on various hosts that look
>       # like issues with a buggy kernel. As a result we don't want it
>       # gating releases on Gitlab.
> -    @skipIf(os.getenv('GITLAB_CI'), 'Running on GitLab')
> +    @skipUnless(os.getenv('QEMU_TEST_FLAKY_TESTS'), 'Test is unstable on GitLab')
> +
>       def test_sh4_r2d(self):
>           """
>           :avocado: tags=arch:sh4
> diff --git a/tests/avocado/intel_iommu.py b/tests/avocado/intel_iommu.py
> index 77635ab56c..2dd11a6346 100644
> --- a/tests/avocado/intel_iommu.py
> +++ b/tests/avocado/intel_iommu.py
> @@ -9,10 +9,11 @@
>   # later.  See the COPYING file in the top-level directory.
>   import os
>   
> -from avocado import skipIf
> +from avocado import skipUnless
>   from avocado_qemu import LinuxTest
>   
> -@skipIf(os.getenv('GITLAB_CI'), 'Running on GitLab')
> +@skipUnless(os.getenv('QEMU_TEST_FLAKY_TESTS'), 'Test is unstable on GitLab')
> +
>   class IntelIOMMU(LinuxTest):
>       """
>       :avocado: tags=arch:x86_64
> diff --git a/tests/avocado/linux_initrd.py b/tests/avocado/linux_initrd.py
> index ba02e5a563..c40a987bd1 100644
> --- a/tests/avocado/linux_initrd.py
> +++ b/tests/avocado/linux_initrd.py
> @@ -13,7 +13,7 @@
>   import tempfile
>   
>   from avocado_qemu import QemuSystemTest
> -from avocado import skipIf
> +from avocado import skipUnless
>   
>   
>   class LinuxInitrd(QemuSystemTest):
> @@ -53,7 +53,8 @@ def test_with_2gib_file_should_exit_error_msg_with_linux_v3_6(self):
>                   max_size + 1)
>               self.assertRegex(self.vm.get_log(), expected_msg)
>   
> -    @skipIf(os.getenv('GITLAB_CI'), 'Running on GitLab')
> +    @skipUnless(os.getenv('QEMU_TEST_FLAKY_TESTS'), 'Test is unstable on GitLab')
> +
>       def test_with_2gib_file_should_work_with_linux_v4_16(self):
>           """
>           QEMU has supported up to 4 GiB initrd for recent kernel
> diff --git a/tests/avocado/machine_aspeed.py b/tests/avocado/machine_aspeed.py
> index df31b2a8a8..258fb50c47 100644
> --- a/tests/avocado/machine_aspeed.py
> +++ b/tests/avocado/machine_aspeed.py
> @@ -18,7 +18,7 @@
>   from avocado_qemu import interrupt_interactive_console_until_pattern
>   from avocado_qemu import has_cmd
>   from avocado.utils import archive
> -from avocado import skipIf
> +from avocado import skipUnless
>   from avocado import skipUnless
>   
>   
> @@ -311,7 +311,8 @@ def do_test_arm_aspeed_sdk_start(self, image):
>               self, 'boot', '## Loading kernel from FIT Image')
>           self.wait_for_console_pattern('Starting kernel ...')
>   
> -    @skipIf(os.getenv('GITLAB_CI'), 'Running on GitLab')
> +    @skipUnless(os.getenv('QEMU_TEST_FLAKY_TESTS'), 'Test is unstable on GitLab')
> +
>       def test_arm_ast2500_evb_sdk(self):
>           """
>           :avocado: tags=arch:arm
> @@ -329,7 +330,8 @@ def test_arm_ast2500_evb_sdk(self):
>               self.workdir + '/ast2500-default/image-bmc')
>           self.wait_for_console_pattern('nodistro.0 ast2500-default ttyS4')
>   
> -    @skipIf(os.getenv('GITLAB_CI'), 'Running on GitLab')
> +    @skipUnless(os.getenv('QEMU_TEST_FLAKY_TESTS'), 'Test is unstable on GitLab')
> +
>       def test_arm_ast2600_evb_sdk(self):

The Aspeed SDK images are rather heavy and booting them can be slow.
Is that the problem ? because I have never seen these tests fail (on
fast machines). We should remove in that case. CI can not test all
FW images and it should be fast.


Thanks,

C.



>           """
>           :avocado: tags=arch:arm
> diff --git a/tests/avocado/machine_mips_malta.py b/tests/avocado/machine_mips_malta.py
> index 9bd54518bf..959dcf5602 100644
> --- a/tests/avocado/machine_mips_malta.py
> +++ b/tests/avocado/machine_mips_malta.py
> @@ -11,7 +11,7 @@
>   import gzip
>   import logging
>   
> -from avocado import skipIf
> +from avocado import skipUnless
>   from avocado import skipUnless
>   from avocado.utils import archive
>   from avocado_qemu import QemuSystemTest
> @@ -101,7 +101,8 @@ def test_mips_malta_i6400_framebuffer_logo_1core(self):
>           """
>           self.do_test_i6400_framebuffer_logo(1)
>   
> -    @skipIf(os.getenv('GITLAB_CI'), 'Running on GitLab')
> +    @skipUnless(os.getenv('QEMU_TEST_FLAKY_TESTS'), 'Test is unstable on GitLab')
> +
>       def test_mips_malta_i6400_framebuffer_logo_7cores(self):
>           """
>           :avocado: tags=arch:mips64el
> @@ -111,7 +112,8 @@ def test_mips_malta_i6400_framebuffer_logo_7cores(self):
>           """
>           self.do_test_i6400_framebuffer_logo(7)
>   
> -    @skipIf(os.getenv('GITLAB_CI'), 'Running on GitLab')
> +    @skipUnless(os.getenv('QEMU_TEST_FLAKY_TESTS'), 'Test is unstable on GitLab')
> +
>       def test_mips_malta_i6400_framebuffer_logo_8cores(self):
>           """
>           :avocado: tags=arch:mips64el
> diff --git a/tests/avocado/machine_rx_gdbsim.py b/tests/avocado/machine_rx_gdbsim.py
> index 6cd8704b01..350a73fbbb 100644
> --- a/tests/avocado/machine_rx_gdbsim.py
> +++ b/tests/avocado/machine_rx_gdbsim.py
> @@ -10,7 +10,7 @@
>   
>   import os
>   
> -from avocado import skipIf
> +from avocado import skipUnless
>   from avocado_qemu import QemuSystemTest
>   from avocado_qemu import exec_command_and_wait_for_pattern
>   from avocado_qemu import wait_for_console_pattern
> @@ -22,7 +22,8 @@ class RxGdbSimMachine(QemuSystemTest):
>       timeout = 30
>       KERNEL_COMMON_COMMAND_LINE = 'printk.time=0 '
>   
> -    @skipIf(os.getenv('GITLAB_CI'), 'Running on GitLab')
> +    @skipUnless(os.getenv('QEMU_TEST_FLAKY_TESTS'), 'Test is unstable on GitLab')
> +
>       def test_uboot(self):
>           """
>           U-Boot and checks that the console is operational.
> @@ -46,7 +47,8 @@ def test_uboot(self):
>           # FIXME limit baudrate on chardev, else we type too fast
>           #exec_command_and_wait_for_pattern(self, 'version', gcc_version)
>   
> -    @skipIf(os.getenv('GITLAB_CI'), 'Running on GitLab')
> +    @skipUnless(os.getenv('QEMU_TEST_FLAKY_TESTS'), 'Test is unstable on GitLab')
> +
>       def test_linux_sash(self):
>           """
>           Boots a Linux kernel and checks that the console is operational.
> diff --git a/tests/avocado/machine_s390_ccw_virtio.py b/tests/avocado/machine_s390_ccw_virtio.py
> index ffd914ded9..61e75d8f9e 100644
> --- a/tests/avocado/machine_s390_ccw_virtio.py
> +++ b/tests/avocado/machine_s390_ccw_virtio.py
> @@ -12,7 +12,7 @@
>   import os
>   import tempfile
>   
> -from avocado import skipIf
> +from avocado import skipUnless
>   from avocado_qemu import QemuSystemTest
>   from avocado_qemu import exec_command_and_wait_for_pattern
>   from avocado_qemu import wait_for_console_pattern
> diff --git a/tests/avocado/replay_kernel.py b/tests/avocado/replay_kernel.py
> index 53cb7e5091..a60f1d1e54 100644
> --- a/tests/avocado/replay_kernel.py
> +++ b/tests/avocado/replay_kernel.py
> @@ -15,7 +15,7 @@
>   import time
>   
>   from avocado import skip
> -from avocado import skipIf
> +from avocado import skipUnless
>   from avocado import skipUnless
>   from avocado_qemu import wait_for_console_pattern
>   from avocado.utils import archive
> @@ -179,7 +179,8 @@ def test_arm_virt(self):
>   
>           self.run_rr(kernel_path, kernel_command_line, console_pattern, shift=1)
>   
> -    @skipIf(os.getenv('GITLAB_CI'), 'Running on GitLab')
> +    @skipUnless(os.getenv('QEMU_TEST_FLAKY_TESTS'), 'Test is unstable on GitLab')
> +
>       def test_arm_cubieboard_initrd(self):
>           """
>           :avocado: tags=arch:arm
> diff --git a/tests/avocado/reverse_debugging.py b/tests/avocado/reverse_debugging.py
> index ed04e92bb4..9a468321e5 100644
> --- a/tests/avocado/reverse_debugging.py
> +++ b/tests/avocado/reverse_debugging.py
> @@ -10,7 +10,7 @@
>   import os
>   import logging
>   
> -from avocado import skipIf
> +from avocado import skipUnless
>   from avocado_qemu import BUILD_DIR
>   from avocado.utils import datadrainer
>   from avocado.utils import gdb
> @@ -206,7 +206,8 @@ def get_pc(self, g):
>               + self.get_reg_le(g, self.REG_CS) * 0x10
>   
>       # unidentified gitlab timeout problem
> -    @skipIf(os.getenv('GITLAB_CI'), 'Running on GitLab')
> +    @skipUnless(os.getenv('QEMU_TEST_FLAKY_TESTS'), 'Test is unstable on GitLab')
> +
>       def test_x86_64_pc(self):
>           """
>           :avocado: tags=arch:x86_64
> @@ -223,7 +224,8 @@ class ReverseDebugging_AArch64(ReverseDebugging):
>       REG_PC = 32
>   
>       # unidentified gitlab timeout problem
> -    @skipIf(os.getenv('GITLAB_CI'), 'Running on GitLab')
> +    @skipUnless(os.getenv('QEMU_TEST_FLAKY_TESTS'), 'Test is unstable on GitLab')
> +
>       def test_aarch64_virt(self):
>           """
>           :avocado: tags=arch:aarch64
> @@ -247,7 +249,8 @@ class ReverseDebugging_ppc64(ReverseDebugging):
>       REG_PC = 0x40
>   
>       # unidentified gitlab timeout problem
> -    @skipIf(os.getenv('GITLAB_CI'), 'Running on GitLab')
> +    @skipUnless(os.getenv('QEMU_TEST_FLAKY_TESTS'), 'Test is unstable on GitLab')
> +
>       def test_ppc64_pseries(self):
>           """
>           :avocado: tags=arch:ppc64
> @@ -260,7 +263,8 @@ def test_ppc64_pseries(self):
>           self.reverse_debugging()
>   
>       # See https://gitlab.com/qemu-project/qemu/-/issues/1992
> -    @skipIf(os.getenv('GITLAB_CI'), 'Running on GitLab')
> +    @skipUnless(os.getenv('QEMU_TEST_FLAKY_TESTS'), 'Test is unstable on GitLab')
> +
>       def test_ppc64_powernv(self):
>           """
>           :avocado: tags=arch:ppc64
> diff --git a/tests/avocado/smmu.py b/tests/avocado/smmu.py
> index b3c4de6bf4..05b34418a5 100644
> --- a/tests/avocado/smmu.py
> +++ b/tests/avocado/smmu.py
> @@ -9,10 +9,11 @@
>   # later.  See the COPYING file in the top-level directory.
>   import os
>   
> -from avocado import skipIf
> +from avocado import skipUnless
>   from avocado_qemu import LinuxTest, BUILD_DIR
>   
> -@skipIf(os.getenv('GITLAB_CI'), 'Running on GitLab')
> +@skipUnless(os.getenv('QEMU_TEST_FLAKY_TESTS'), 'Test is unstable on GitLab')
> +
>   class SMMU(LinuxTest):
>       """
>       :avocado: tags=accel:kvm
> diff --git a/tests/avocado/tuxrun_baselines.py b/tests/avocado/tuxrun_baselines.py
> index c99bea6c0b..5f859f4e6f 100644
> --- a/tests/avocado/tuxrun_baselines.py
> +++ b/tests/avocado/tuxrun_baselines.py
> @@ -13,7 +13,7 @@
>   import time
>   import tempfile
>   
> -from avocado import skip, skipIf
> +from avocado import skip, skipUnless
>   from avocado_qemu import QemuSystemTest
>   from avocado_qemu import exec_command, exec_command_and_wait_for_pattern
>   from avocado_qemu import wait_for_console_pattern
> @@ -551,7 +551,7 @@ def test_s390(self):
>                              haltmsg="Requesting system halt")
>   
>       # Note: some segfaults caused by unaligned userspace access
> -    @skipIf(os.getenv('GITLAB_CI'), 'Skipping unstable test on GitLab')
> +    @skipUnless(os.getenv('QEMU_TEST_FLAKY_TESTS'), 'Test is unstable on GitLab')
>       def test_sh4(self):
>           """
>           :avocado: tags=arch:sh4
