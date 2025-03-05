Received: by 2002:a17:504:6810:b0:1be9:327d:8ee3 with SMTP id f16csp648856njm;
        Wed, 5 Mar 2025 00:17:18 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEKSjHd4UHTK+K5efMbaFqhBFOTYoqqwRSrvws8gAkoJ15TTu1q5tgv0XIp+msXbsYi9BKs
X-Received: by 2002:a05:620a:86cb:b0:7c0:b1aa:ba5a with SMTP id af79cd13be357-7c3d8e7bd36mr321627385a.33.1741162638408;
        Wed, 05 Mar 2025 00:17:18 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1741162638; cv=none;
        d=google.com; s=arc-20240605;
        b=f1vGxAn2B54528eKI4Jv9MGFQbHF/QU8yb/GyfsrZp6QBpGTvENxW/LfzCiU3x0noI
         RnC0CKtwsc1vG1pJK5jIm6hxzPOAAYj0LT01XOBHcjxDfXrjxaVXmAnDuK4xac1umbFG
         5Kfdbsxg+UjB1mEVyWqB1kEBebTWXCIzScCDDtsCSD89dW7RO3Huy25nYwJlT+DWUNHe
         FK0gCA0HtAPfTPCL5oEleae89tRFTNWO+TDF2YF/xar5EYiJYDXYPHp1iW88JFOQAIod
         sfizIhXhxtp55jjBYSwpLc2RPOW9yQ40OazTWZwQRXkfQg2szzpa68FMKRKF8meUgDNz
         fZuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:content-language:in-reply-to:autocrypt
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:dkim-signature;
        bh=lCS1o7wFnfMW+Zqg8GFXuEo/T96XtVvKMwlOwSEiPSc=;
        fh=HIOtrNxQ0hnz3EHw+tiAsJYkdfi4QK9y44Hwm43nND0=;
        b=OgIuNgVeEznbTH1WPC3Bm/an8WM5R9SJTcHWsXnK5gxnRifzbOX2QniJHn4ubww5LK
         cPuT6gfOcTRRSdYqqb/MjjTfzD+FJgxwVkSNwr/3CgLPg+EXZvhbmB7U1z9S1Vz/WO0k
         NpprgFTPBOVsjeFsPt2afhNV64ZdcuMOoaXsVmlHv/Ij7syNAKZPaTUwEo+HzUDo93HY
         xc6tRRVPRaWMONsO7rcJBmrSVtVO9FNcdq5u7rYZlBwl0xP1/X9jq+ybkDDJMh+J3e9A
         9E3glhWt8+q9CWrzEdNL2JSWyWL+H+j6kRGFSNpegtKL5XkQRBb5WvOKlen8Lqubm9Lq
         v1JQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=EpP99xY1;
       spf=pass (google.com: domain of thuth@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <thuth@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id af79cd13be357-7c3be579291si558473385a.215.2025.03.05.00.17.18
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Mar 2025 00:17:18 -0800 (PST)
Received-SPF: pass (google.com: domain of thuth@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=EpP99xY1;
       spf=pass (google.com: domain of thuth@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1741162638;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=lCS1o7wFnfMW+Zqg8GFXuEo/T96XtVvKMwlOwSEiPSc=;
	b=EpP99xY1W4k+QP3tiwMX3i+HTrRFak+Y86nma/w7P+50LFyr4HNIoleLZVE7QPEF9SGzCf
	TLmhOOJgE+6Py72GWc1/dGA0DPLrU+ffrIp4b6uUQf0+qyywkZCQanIbrea55EQiDEsNLq
	gMG0+OSYmJDi90hhV+sSd7QtZz8tDvY=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-275-NpJhVORPMXqCFWks8ABVcg-1; Wed, 05 Mar 2025 03:17:14 -0500
X-MC-Unique: NpJhVORPMXqCFWks8ABVcg-1
X-Mimecast-MFC-AGG-ID: NpJhVORPMXqCFWks8ABVcg_1741162634
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-43bcc04d2ebso12256735e9.1
        for <alex.bennee@linaro.org>; Wed, 05 Mar 2025 00:17:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741162634; x=1741767434;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lCS1o7wFnfMW+Zqg8GFXuEo/T96XtVvKMwlOwSEiPSc=;
        b=Fqf0a6LsyWj+cCoD56hR5gVj27Av/1DQxA/cKsE14ux0nd6e6Yz6rc1b0pJbz2zO9V
         X1c3OwNK0KtMLS77vHRCEbCwudGxsKPR/1OaL0rr/e7fy12+ug4dR2I6UkZDeBtP9dya
         9XZFIworM7AldXXKuEKV50mgOUUriBXym/fC3JmSGkk8vsj5QDV3EVbPgNAD5BOBWRg6
         zNXmSn5WCsn8SaAyKDpiOqbSQWsu9PUH/syI8qWjZtq2Km5GGnV5JMs6hDNIeEdMGrkl
         /AiHOrzwhQ8ogIjZPxWgmtI6PMN8Tggezhr19j/fEEqVugs0uB3p8rio/5NMt13qtPVq
         32OQ==
X-Gm-Message-State: AOJu0YwuI+3HqnLn4/srZK/kbxw0YXQq3X/Skii3LjTj3q5DvR2cDxtf
	nSrRz03r/ttyWhMAReV+aA0l/STqf/ohJN4bbb2+o0YfnNCe3/fZ8KvLEtowSF64GW+0UR6LLcc
	F2HLWYjn7g6G2p7bTKT2MvM/BgBP9hVwjWIhk5m7vTe1FjwPUog+OJgUOhN9BETbvTB3jt0bTXI
	sTAlwwWN5j8XXV361pTzXh/5KkrL0ljE9JHA==
X-Gm-Gg: ASbGnct5cet+yxVFtUmHEt4AgBcVyT6Mm2nnaDRc2GjpmIgWoMa9CGVxjvo6wIREISE
	AsKUzQBqpEemqI4bXzBq2UPi8FPS4G6cfTfiY2P7eCDn8dBiiUIckHhjbCdvlCMJvR5Z1hpFMs/
	vCj4QFyYFgf2l547LeolvFZRSsC8DcGx5bekf8M/aARgMsmLFyqvzcS2JktuBngpzUF7jk5ipNn
	GbsdTtXAHoZVdr0qKkjqbUYVm3zYFz/jCDj6SW7ADfdBa4Lf8LJMmDihGYtnC85FtGmLiW3j/J/
	k/8Z4TsVtW/PJexF7O7XK6LoF9V2VmKjRmXI5wU14cZstvM=
X-Received: by 2002:a05:600c:4f83:b0:43b:cfc2:fff with SMTP id 5b1f17b1804b1-43bd2979938mr14900565e9.12.1741162633734;
        Wed, 05 Mar 2025 00:17:13 -0800 (PST)
X-Received: by 2002:a05:600c:4f83:b0:43b:cfc2:fff with SMTP id 5b1f17b1804b1-43bd2979938mr14899955e9.12.1741162633159;
        Wed, 05 Mar 2025 00:17:13 -0800 (PST)
Return-Path: <thuth@redhat.com>
Received: from [192.168.0.7] (ip-109-42-51-231.web.vodafone.de. [109.42.51.231])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43bd435c592sm9765395e9.35.2025.03.05.00.17.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 05 Mar 2025 00:17:12 -0800 (PST)
Message-ID: <58227a15-801c-4190-999a-b5f896ad6505@redhat.com>
Date: Wed, 5 Mar 2025 09:17:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 01/32] tests/functional: move aarch64 GPU test into own
 file
To: =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>, Li-Wen Hsu <lwhsu@freebsd.org>,
 Peter Maydell <peter.maydell@linaro.org>, Laurent Vivier
 <laurent@vivier.eu>, qemu-arm@nongnu.org, Alexandre Iooss
 <erdnaxe@crans.org>, Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Riku Voipio <riku.voipio@iki.fi>, Warner Losh <imp@bsdimp.com>,
 Brian Cain <brian.cain@oss.qualcomm.com>,
 Mahmoud Mandour <ma.mandourr@gmail.com>, Kyle Evans <kevans@freebsd.org>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 Ed Maste <emaste@freebsd.org>, Pierrick Bouvier
 <pierrick.bouvier@linaro.org>,
 =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>
References: <20250304222439.2035603-1-alex.bennee@linaro.org>
 <20250304222439.2035603-2-alex.bennee@linaro.org>
From: Thomas Huth <thuth@redhat.com>
Autocrypt: addr=thuth@redhat.com; keydata=
 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
In-Reply-To: <20250304222439.2035603-2-alex.bennee@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 4O9en4F3naKNPRq_fg2J6Q__paT5iGsMYaieof8Gcr0_1741162634
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: lK4j+9yPZ7T8

On 04/03/2025 23.24, Alex Bennée wrote:
> I want to expand the number of tests to cover a wide range of
> configurations. That starts with splitting off from the normal virt
> test from which it doesn't really share much code. We can also reduce
> the timeout of the original virt test now it is now longer burdened
> with testing the GPU.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
...
> diff --git a/tests/functional/test_aarch64_virt_gpu.py b/tests/functional/test_aarch64_virt_gpu.py
> new file mode 100755
> index 0000000000..616e6ed656
> --- /dev/null
> +++ b/tests/functional/test_aarch64_virt_gpu.py
> @@ -0,0 +1,94 @@
> +#!/usr/bin/env python3
> +#
> +# Functional tests for the various graphics modes we can support.
> +#
> +# Copyright (c) 2024, 2025 Linaro Ltd.
> +#
> +# Author:
> +#  Alex Bennée <alex.bennee@linaro.org>
> +#
> +# SPDX-License-Identifier: GPL-2.0-or-later
> +
> +from qemu.machine.machine import VMLaunchFailure
> +
> +from qemu_test import QemuSystemTest, Asset
> +from qemu_test import exec_command, exec_command_and_wait_for_pattern
> +from qemu_test import skipIfMissingCommands
> +
> +from qemu_test.linuxkernel import LinuxKernelTest
...
> +
> +if __name__ == '__main__':
> +    QemuSystemTest.main()

You could call LinuxKernelTest.main() instead, then you don't have to import 
QemuSystemTest anymore.

Anyway,
Reviewed-by: Thomas Huth <thuth@redhat.com>
