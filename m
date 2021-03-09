Received: by 2002:a19:6d5:0:0:0:0:0 with SMTP id 204csp3221019lfg;
        Tue, 9 Mar 2021 14:27:24 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxWj5cqvF1dDn1jgIwMTm+b6zK8OMtCLdqNbSr+MwrDvmUZKSxISxaThOBfdJQG9/RNChjl
X-Received: by 2002:a25:bf8b:: with SMTP id l11mr37372ybk.358.1615328844010;
        Tue, 09 Mar 2021 14:27:24 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1615328844; cv=none;
        d=google.com; s=arc-20160816;
        b=eJy7FX9U//HRsdbNpKJGoJAh0FfqMWnf9ZlCtAJIyVBCqFRo4u8cCAAqodLtW2Z92N
         EZ3p6eelE9jutT09aAbAy5lMBKgkz+zmRi+fFQoIo+DxfnN7HPz+2OxA1znv7H8HMtbS
         Qko1DHnd5JKW1LuZp7pgVhNn//9vrGWDT28dUil4+TZPsH5el3TJ9QhBbq/iOTikKKbf
         R6l8CYhIkSUD85B8lOY5CL08FUmnkuC4WJ7nVN7L2EnodDujyJXqXYz94gmCuw9yUJZe
         VxrmOhdlzRHyKTCF5Rmz5PJgVC5gj81+VyUV2AKX7unm/3QDyOxULf59cSXBxYTpGiuP
         P2eQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=waypPTrL9HbDSh/r8YG8J4eKLb6Zf5sO+ndWAU14lRQ=;
        b=AJunw9DRQ44RY1UrwJOOa3cEahb0bCrVsWadJ+WwkeJcm81SffCHxOyEHhA0AsDjGZ
         BsvuItvEpdPZZegUvCvkUmd542d8yRIlE+Txp4O1JheS4CYwaruzBV+rBRy/WXHmO1mk
         msH3LXvp8YQ/NNE8gQRfqpmMkVIsau3NY60RnA5u3jLVJZoks62qESzsqLC7cKTVAqav
         jEpkQVdo3R6B2dwIpW90kd2jgd2h38xpm9gbavaIr1j5YQVtBh6geH81FuREpMlk86em
         qwd0wXvm+/8AZ/bq4585Jh3xjM/by5MVAZ/ODvu2Rqcp75lAGLdzr0XivYOilqaZ59J2
         Gg8w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=div5lIRc;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y8si19463757ybk.341.2021.03.09.14.27.23
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 09 Mar 2021 14:27:24 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=div5lIRc;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Received: from localhost ([::1]:38044 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lJkp1-0007qJ-Bz
	for alex.bennee@linaro.org; Tue, 09 Mar 2021 17:27:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46660)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lJkos-0007oF-Th; Tue, 09 Mar 2021 17:27:14 -0500
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632]:45112)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lJkor-0004aS-B0; Tue, 09 Mar 2021 17:27:14 -0500
Received: by mail-ej1-x632.google.com with SMTP id mm21so32343368ejb.12;
 Tue, 09 Mar 2021 14:27:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=waypPTrL9HbDSh/r8YG8J4eKLb6Zf5sO+ndWAU14lRQ=;
 b=div5lIRcAfjar/L8wbRIwBPWzRGSpmqMIkuvA/o7rHRWbUyz8fFA5czJbR4UePs659
 f76wv55l2t/8DZUeAdIJlElsZed9A6dHKW03nSx81kuOx/Nalg2yV4k88yEIQzDzteRd
 pLp1wFbCMw7bwGmb9es186x39xyFlHcxZg8DfjbLok9Uc477379pRMscXohQFwAC7yS6
 5BB+gZs4ZYzsTw9/kkJUkNlJfOjqWaRnHDgQ4DXBz2pd/2gDURLRddRabnbHMIWEx2r+
 7pufQlwQQSLddYrsd5UjIUplmYqCgT8MOzmgJx2JupNjuqkuBUX7de25SjV6fNluvNip
 UC6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=waypPTrL9HbDSh/r8YG8J4eKLb6Zf5sO+ndWAU14lRQ=;
 b=Ljv01QqcsgxFxNOHsDbz5nc0d/WUzG1KEE5VqBec4uFd+s3dVafM6yZUQo5TmTZAVJ
 BgbnphzRBLZvUaGlXtAHWlcqfXSu1IkTsUgXRsLPqk0xjtmvN/s0eeiXAQ03cArVxl7W
 JNq5tVNN1oTFekFiNVy8BrvIidDfn8UL/ZfrWP+7MrUkFmYLUAhkkhrMXTyAiFXtKIut
 h9k12M5KZ9qGbpr58M8Bc+91069xXyy7kbzv9ROfU6KIQlrEJ3iW0vEGaBQJDSCnMVcr
 XfMoJH8YJB2JmxVSMAJAJ47d0LNOKSwkjSQwryH6rUdERRjYr5i9uPAkxoRV7955u3Gj
 HBXQ==
X-Gm-Message-State: AOAM532oO72UVi6+E8XSzhccGEStiB/1RKVdTRdZCw3Z6nyIpYSXBlkV
 MCR3+rtAZoGvv8bsXUgyCcw=
X-Received: by 2002:a17:906:f02:: with SMTP id z2mr249595eji.469.1615328830990; 
 Tue, 09 Mar 2021 14:27:10 -0800 (PST)
Received: from [192.168.1.36] (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id i11sm8633157ejf.76.2021.03.09.14.27.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 09 Mar 2021 14:27:10 -0800 (PST)
Subject: Re: [PATCH v2] tests/acceptance: Add bFLT loader linux-user test
To: qemu-devel@nongnu.org
References: <20210214194524.768660-1-f4bug@amsat.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <cae49194-7c6e-4c5e-6407-687c08ef67b9@amsat.org>
Date: Tue, 9 Mar 2021 23:27:09 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210214194524.768660-1-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::632;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ej1-x632.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Laurent Vivier <laurent@vivier.eu>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Willian Rampazzo <willianr@redhat.com>, qemu-arm@nongnu.org,
 Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: MIIRP+X9hrSh

ping?

On 2/14/21 8:45 PM, Philippe Mathieu-Daudé wrote:
> Add a very quick test that runs a busybox binary in bFLT format:
> 
>   $ avocado --show=app run -t linux_user tests/acceptance/load_bflt.py
>   JOB ID     : db94d5960ce564c50904d666a7e259148c27e88f
>   JOB LOG    : ~/avocado/job-results/job-2019-06-25T10.52-db94d59/job.log
>    (1/1) tests/acceptance/load_bflt.py:LoadBFLT.test_stm32: PASS (0.15 s)
>   RESULTS    : PASS 1 | ERROR 0 | FAIL 0 | SKIP 0 | WARN 0 | INTERRUPT 0 | CANCEL 0
>   JOB TIME   : 0.54 s
> 
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
> Based-on: <20210214175912.732946-1-f4bug@amsat.org>
>   tests/acceptance: Extract QemuBaseTest from Test
>   tests/acceptance: Make pick_default_qemu_bin() more generic
>   tests/acceptance: Introduce QemuUserTest base class
> ---
>  tests/acceptance/load_bflt.py | 51 +++++++++++++++++++++++++++++++++++
>  1 file changed, 51 insertions(+)
>  create mode 100644 tests/acceptance/load_bflt.py
> 
> diff --git a/tests/acceptance/load_bflt.py b/tests/acceptance/load_bflt.py
> new file mode 100644
> index 00000000000..4b7796d0775
> --- /dev/null
> +++ b/tests/acceptance/load_bflt.py
> @@ -0,0 +1,51 @@
> +# Test the bFLT format
> +#
> +# Copyright (C) 2019 Philippe Mathieu-Daudé <f4bug@amsat.org>
> +#
> +# SPDX-License-Identifier: GPL-2.0-or-later
> +
> +import os
> +import bz2
> +import subprocess
> +
> +from avocado_qemu import QemuUserTest
> +
> +
> +class LoadBFLT(QemuUserTest):
> +
> +    def extract_cpio(self, cpio_path):
> +        """
> +        Extracts a cpio archive into the test workdir
> +
> +        :param cpio_path: path to the cpio archive
> +        """
> +        cwd = os.getcwd()
> +        os.chdir(self.workdir)
> +        with bz2.open(cpio_path, 'rb') as archive_cpio:
> +            subprocess.run(['cpio', '-i'], input=archive_cpio.read(),
> +                           stderr=subprocess.DEVNULL)
> +        os.chdir(cwd)
> +
> +    @skipUnless(os.getenv('AVOCADO_ALLOW_UNTRUSTED_CODE'), 'untrusted code')
> +    def test_stm32(self):
> +        """
> +        :avocado: tags=arch:arm
> +        :avocado: tags=linux_user
> +        :avocado: tags=quick
> +        """
> +        # See https://elinux.org/STM32#User_Space
> +        rootfs_url = ('https://elinux.org/images/5/51/'
> +                      'Stm32_mini_rootfs.cpio.bz2')
> +        rootfs_hash = '9f065e6ba40cce7411ba757f924f30fcc57951e6'
> +        rootfs_path_bz2 = self.fetch_asset(rootfs_url, asset_hash=rootfs_hash)
> +        busybox_path = self.workdir + "/bin/busybox"
> +
> +        self.extract_cpio(rootfs_path_bz2)
> +
> +        res = self.run(busybox_path)
> +        ver = 'BusyBox v1.24.0.git (2015-02-03 22:17:13 CET) multi-call binary.'
> +        self.assertIn(ver, res.stdout_text)
> +
> +        res = self.run(busybox_path, ['uname', '-a'])
> +        unm = 'armv7l GNU/Linux'
> +        self.assertIn(unm, res.stdout_text)
> 
