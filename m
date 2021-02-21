Received: by 2002:a19:690d:0:0:0:0:0 with SMTP id e13csp1140167lfc;
        Sun, 21 Feb 2021 09:27:00 -0800 (PST)
X-Received: by 2002:adf:fb8a:: with SMTP id a10mr18023901wrr.365.1613928419920;
        Sun, 21 Feb 2021 09:26:59 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1613928419; cv=none;
        d=google.com; s=arc-20160816;
        b=EhCYi4QBiywHoyqBwqgXMR1Iy+opzLS0CK36DN3tXpANiIy1W7+iLdGLu9PxmPSsRx
         CWqg0JYQwmtxlopFKLd1ciSottdjZizLcef9m7GwdFXcDO6LmaN41a3XUl9hPL6/idT2
         6LXmwRJJLjtwHkiaU5oB/2DLZcWvSLUdpzfN5+f0ObbPr9C8Y/lUHO6BCtYHAwtSBglm
         7hbSRoxCdWgif7M8QPMUXucWRg3FL3x+V5y15u4gvOGh+sBQ2/+iVrK6dBAsmeguxwXY
         w8Uesvr9Abobg0OiHTZV/l81FHXqSUtl8mkuH/u/n9fjb4RP8XoU0S4ht4Ra3uNdWpZN
         fAAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:mime-version:user-agent
         :date:message-id:subject:from:cc:to:sender:dkim-signature;
        bh=tF4eNh85eh0bn6NbpeiEEndXzktbUY2q4Orgo5qnfm8=;
        b=mSd3ha528bRtECRkPxY86ghS+xHO9q6+bmttKkMizBeAwbwIc3LfYlvNJXLwpljwjA
         9g1vDaATD7RaRgTSDMTNIwLL34xwZt1jLE4tXxy4N/jsJPRxrR/bQcDv+Ac06gEYSkSf
         DLi1OjuFMf9RHiV9clYCik8Ja4w1xa/OmYFLMA4NuelNy+VVK+tcXJPefyj0IHSb2h3M
         /GddziRnvPHVMPg6COe+HXzX6TQytr5oJOBJ+Pz/gSGkADGPKL2wBlq3cTClUmcBfKdh
         d0skHW2G02uZOA+HKACt8YKPb7iO1rWQFQtJjs7G/9Vc1mW3Y9YO5//EGhmuPkrAs5jS
         jScw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=QOGn9VJI;
       spf=pass (google.com: domain of philippe.mathieu.daude@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=philippe.mathieu.daude@gmail.com;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <philippe.mathieu.daude@gmail.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d18sor228166wrw.38.2021.02.21.09.26.59
        (Google Transport Security);
        Sun, 21 Feb 2021 09:26:59 -0800 (PST)
Received-SPF: pass (google.com: domain of philippe.mathieu.daude@gmail.com designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=QOGn9VJI;
       spf=pass (google.com: domain of philippe.mathieu.daude@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=philippe.mathieu.daude@gmail.com;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:to:cc:from:subject:message-id:date:user-agent:mime-version
         :content-language:content-transfer-encoding;
        bh=tF4eNh85eh0bn6NbpeiEEndXzktbUY2q4Orgo5qnfm8=;
        b=QOGn9VJIDMryA2bc/RmcT9iNKDRsLEqNdBj68gzut0ZGL9Bwy5XCk0tV5mg1u31G2w
         qEMPzMu7qwBmjiSya5V5WFuF/r4HHyE7d3m8tcex08UdiGTC3ThKA5zJFe53a7mB/e5X
         AxIKcZn3NFcnsdNbCXQP5ggkCEzhbJEx5ZOtXvwkCw0x97qi/Swq9hSQWTeBw8gN+4B2
         UHoqAcB0QVMWRwaCX44tUmzyLhCMPssXpNy5GYwYYKslUpKgkp8P3tgnnLYGRq/xjz65
         u7unbMqGYigLd2xJP+dzBHKeFhWKHb2acWEyVcQQY+nj30h6KCazxSZjr18NepgTrWzF
         msGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:to:cc:from:subject:message-id:date
         :user-agent:mime-version:content-language:content-transfer-encoding;
        bh=tF4eNh85eh0bn6NbpeiEEndXzktbUY2q4Orgo5qnfm8=;
        b=gp1pS8bChcn/gc3qxwS19DZ7ArQ7XuH8ewMSCHx48DTn+ZdeXETDi48DmzEN9FXe9V
         y6NvIx1FCwp/i0E9nXQkdMxqtvnJ5nMbLEeNR6GwvYKxJ92ptQO69ouXIekLITNZSY07
         oBwJ3YSaQQ0Mf3KoNoXN7yxGevqExKxFMwC6NUix0ih3MIuTZznwoDHGGMUvZ51rL/ZP
         FO6ndFBLuBdifHwSpDGTUClXULwTxWpYa5fkkckB/WM0Zgh0UXj8RrHDDLK4QMUfsPPN
         opmrhGaadntu/2JxGLRFsPneNW1KpKLDNdLT59eNhuRwf1sfQ/uZvJzeszhHdw4FbPRz
         FLfg==
X-Gm-Message-State: AOAM531KdxM028vfuWzT5dSNuVT4ZcCFrhb2r7gWAhf/fv4VeRmatsdw
	XIEsovSp3vlbyGg30A6ALrRioT8gvXw=
X-Google-Smtp-Source: ABdhPJwu+8qNIW1H9SgG3H+tC/ZpZK3QNyPePXuTxTiUi2QNCXFAsPwrgLS6Ss8icIekMJEohvZyVw==
X-Received: by 2002:adf:ee12:: with SMTP id y18mr996597wrn.102.1613928419665;
        Sun, 21 Feb 2021 09:26:59 -0800 (PST)
Return-Path: <philippe.mathieu.daude@gmail.com>
Received: from [192.168.1.36] (68.red-83-57-175.dynamicip.rima-tde.net. [83.57.175.68])
        by smtp.gmail.com with ESMTPSA id e12sm24640984wrv.59.2021.02.21.09.26.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 21 Feb 2021 09:26:59 -0800 (PST)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philippe.mathieu.daude@gmail.com>
To: Thomas Huth <thuth@redhat.com>, Peter Maydell <peter.maydell@linaro.org>
Cc: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Subject: tests: n810 arm failing
Message-ID: <cef2f119-3612-65a0-d828-b480179dc3a9@amsat.org>
Date: Sun, 21 Feb 2021 18:26:58 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TUID: 2RoYzAgJ+T21

Hi,

The n810 arm test failed on latest master:

https://gitlab.com/qemu-project/qemu/-/jobs/1045015424/artifacts/browse/build/tests/results/latest/test-results/26-tests_acceptance_machine_arm_n8x0.py_N8x0Machine.test_n810/

16:02:18 DEBUG| PARAMS (key=arch, path=*, default=arm) => 'arm'
16:02:18 DEBUG| PARAMS (key=machine, path=*, default=n810) => 'n810'
16:02:18 DEBUG| PARAMS (key=qemu_bin, path=*, default=./qemu-system-arm)
=> './qemu-system-arm'
16:02:18 DEBUG| VM launch command: './qemu-system-arm -display none -vga
none -chardev
socket,id=mon,path=/var/tmp/avo_qemu_sock_nv8s4w64/qemu-850-monitor.sock
-mon chardev=mon,mode=control -machine n810 -serial null -chardev
socket,id=console,path=/var/tmp/avo_qemu_sock_nv8s4w64/qemu-850-console.sock,server=on,wait=off
-serial chardev:console -kernel
/builds/qemu-project/qemu/avocado-cache/by_location/07af9de13713c2905e8c6a88d6600eb1bc885c5c/meego-arm-n8x0-1.0.80.20100712.1431-vmlinuz-2.6.35~rc4-129.1-n8x0
-append printk.time=0 console=ttyS1'
16:02:21 DEBUG| >>> {'execute': 'qmp_capabilities'}
16:02:21 DEBUG| <<< {'return': {}}
16:03:49 ERROR|
16:03:49 ERROR| Reproduced traceback from:
tests/venv/lib/python3.7/site-packages/avocado/core/test.py:767
16:03:49 ERROR| Traceback (most recent call last):
16:03:49 ERROR|   File "tests/acceptance/machine_arm_n8x0.py", line 49,
in test_n810
16:03:49 ERROR|     self.__do_test_n8x0()
16:03:49 ERROR|   File "tests/acceptance/machine_arm_n8x0.py", line 33,
in __do_test_n8x0
16:03:49 ERROR|     wait_for_console_pattern(self, 'TSC2005 driver
initializing')
16:03:49 ERROR|   File "tests/acceptance/avocado_qemu/__init__.py", line
140, in wait_for_console_pattern
16:03:49 ERROR|     _console_interaction(test, success_message,
failure_message, None, vm=vm)
16:03:49 ERROR|   File "tests/acceptance/avocado_qemu/__init__.py", line
92, in _console_interaction
16:03:49 ERROR|     msg = console.readline().strip()
16:03:49 ERROR|   File "/usr/lib/python3.7/socket.py", line 589, in readinto
16:03:49 ERROR|     return self._sock.recv_into(b)
16:03:49 ERROR|   File
"tests/venv/lib/python3.7/site-packages/avocado/plugins/runner.py", line
77, in sigterm_handler
16:03:49 ERROR|     raise RuntimeError("Test interrupted by SIGTERM")
16:03:49 ERROR| RuntimeError: Test interrupted by SIGTERM
16:03:49 ERROR|
16:03:49 DEBUG| Local variables:
16:03:49 DEBUG|  -> self <class 'machine_arm_n8x0.N8x0Machine'>:
26-tests/acceptance/machine_arm_n8x0.py:N8x0Machine.test_n810
16:03:49 DEBUG| >>> {'execute': 'quit'}
16:03:49 DEBUG| <<< {'return': {}}
16:03:49 DEBUG| DATA (filename=output.expected) => NOT FOUND (data
sources: variant, test, file)
16:03:49 DEBUG| DATA (filename=stdout.expected) => NOT FOUND (data
sources: variant, test, file)
16:03:49 DEBUG| DATA (filename=stderr.expected) => NOT FOUND (data
sources: variant, test, file)
16:03:49 ERROR| Traceback (most recent call last):
16:03:49 ERROR|   File
"tests/venv/lib/python3.7/site-packages/avocado/core/test.py", line 856,
in _run_avocado
    raise test_exception
16:03:49 ERROR|   File
"tests/venv/lib/python3.7/site-packages/avocado/core/test.py", line 762,
in _run_avocado
    testMethod()
16:03:49 ERROR|   File "tests/acceptance/machine_arm_n8x0.py", line 49,
in test_n810
    self.__do_test_n8x0()
16:03:49 ERROR|   File "tests/acceptance/machine_arm_n8x0.py", line 33,
in __do_test_n8x0
    wait_for_console_pattern(self, 'TSC2005 driver initializing')
16:03:49 ERROR|   File "tests/acceptance/avocado_qemu/__init__.py", line
140, in wait_for_console_pattern
    _console_interaction(test, success_message, failure_message, None,
vm=vm)
16:03:49 ERROR|   File "tests/acceptance/avocado_qemu/__init__.py", line
92, in _console_interaction
    msg = console.readline().strip()
16:03:49 ERROR|   File "/usr/lib/python3.7/socket.py", line 589, in readinto
    return self._sock.recv_into(b)
16:03:49 ERROR|   File
"tests/venv/lib/python3.7/site-packages/avocado/plugins/runner.py", line
77, in sigterm_handler
    raise RuntimeError("Test interrupted by SIGTERM")
16:03:49 ERROR| RuntimeError: Test interrupted by SIGTERM
16:03:49 ERROR| ERROR
26-tests/acceptance/machine_arm_n8x0.py:N8x0Machine.test_n810 ->
RuntimeError: Test interrupted by SIGTERM
16:03:49 INFO |
Runner error occurred: Timeout reached
Original status: ERROR
{'name':
'26-tests/acceptance/machine_arm_n8x0.py:N8x0Machine.test_n810',
'logdir':
'26-tests_acceptance_machine_arm_n8x0.py_N8x0Machine.test_n810',
'logfile':
'26-tests_acceptance_machine_arm_n8x0.py_N8x0Machine.test_n810/debug.log',
'status': 'ERROR', 'running': False, 'paused': False, 'time_start':
1613923338.892834, 'time_elapsed': 90.31178283691406, 'time_end':
1613923429.2046168, 'fail_reason': 'Test interrupted by SIGTERM',
'fail_class': 'RuntimeError', 'traceback': 'Traceback (most recent call
last):\n  File
"tests/venv/lib/python3.7/site-packages/avocado/core/test.py", line 856,
in _run_avocado\n    raise test_exception\n  File
"tests/venv/lib/python3.7/site-packages/avocado/core/test.py", line 762,
in _run_avocado\n    testMethod()\n  File
"tests/acceptance/machine_arm_n8x0.py", line 49, in test_n810\n
self.__do_test_n8x0()\n  File "tests/acceptance/machine_arm_n8x0.py",
line 33, in __do_test_n8x0\n    wait_for_console_pattern(self, \'TSC2005
driver initializing\')\n  File
"tests/acceptance/avocado_qemu/__init__.py", line 140, in
wait_for_console_pattern\n    _console_interaction(test,
success_message, failure_message, None, vm=vm)\n  File
"tests/acceptance/avocado_qemu/__init__.py", line 92, in
_console_interaction\n    msg = console.readline().strip()\n  File
"/usr/lib/python3.7/socket.py", line 589, in readinto\n    return
self._sock.recv_into(b)\n  File
"tests/venv/lib/python3.7/site-packages/avocado/plugins/runner.py", line
77, in sigterm_handler\n    raise RuntimeError("Test interrupted by
SIGTERM")\nRuntimeError: Test interrupted by SIGTERM\n', 'timeout': 90,
'whiteboard': '', 'phase': 'FINISHED', 'class_name': 'N8x0Machine',
'job_logdir': 'tests/results/job-2021-02-21T16.00-e662b93',
'job_unique_id': 'e662b936b3c04ad082359ee970534ac7ae7ec3bc', 'params': []}
