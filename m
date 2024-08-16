Received: by 2002:a17:504:9188:b0:1be9:327d:8ee3 with SMTP id i8csp1240415njf;
        Fri, 16 Aug 2024 07:46:29 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCW8dhfW8C8RJAVlY6HICP69NpThazTncU2N9188Oa+5wYAHwfCfqSXh0/hPaV1LRYdvWjT1t6b2zFzkx+KjP6ev8XnXMSuc
X-Google-Smtp-Source: AGHT+IGtCgojkQ/dU9WW4eY99I4oJ/LuqAbjws7ON314PSnp1wp/PXKLwiHBa0io/KyneAhzc6st
X-Received: by 2002:a05:6214:2622:b0:6b7:923c:e0b7 with SMTP id 6a1803df08f44-6bf6de389a2mr128448696d6.21.1723819588861;
        Fri, 16 Aug 2024 07:46:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1723819588; cv=none;
        d=google.com; s=arc-20160816;
        b=t1PDzQVIQrGFpAODZkwOGiEeT0u84eMJY808vXGTHRVpxCWVjqBOwpzBXF+juVr6qM
         szLTp/7XC1eb+qX1mm0G4iVy7IFKxn9H5QPEpErjQdOIYeW7OfGxCGjDy64VEjCilviG
         LyI+WCfJPA6rkqIMNWUvRYi/syC1U0kV0Ffo8V1HzuD2aWlgZ3RgxX1ckBDXKIr6wByA
         d4UI2aKob7XqIiFv8hJ4ToIKB+SkLPREMI68UsvmiYjDCjqRfHbyhzYZulz/vacSGSLZ
         Nv3yHbtT+y293bbmj13mfCILAMt4EXsq7duyilhdz9Q8A5zAVn4ljjwWFo18IPS0oUkQ
         VkYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:autocrypt
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:dkim-signature;
        bh=6P3wmI/BdIdkSTMmbckGK8/t74YD719k3jioQVh7WHE=;
        fh=qgz1MrmtvfmG4iGcKuOku9UBsrgJlNEJ7r5JgAsixGg=;
        b=Va2D/XkXHmfrY054bjADHa+Li+Gz0deqHjEeF3yXqHgks3wsLGvHZGYtF6Lyow+AHx
         fPt4lyunXqm2vTj0Qm4xSWrXxWTnbIhnwAg1gtqjiS0bL1b9iIGiQAEUi5EYUXkTAEDm
         ez5Y1eQ81vm+Ff6l2XsVcGhqTNC12rbzxb8lUaPyfC5U9BR5VviLdgJUp/l9w372wkcf
         oMMm72YKpXUdOCg8eP6G3mKcAgLUVUB8qsQ5x/o+OeFkrP2Wm8lIFsEteSx1g6d+Ufo6
         WwCQPcuGUaAU+3a8/jUQ4xvgFUU/xgSiquq9SBpAnBoCmRjU+3cH0xPGZYhFlwkWv1Ny
         f4nQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=YbCK0WT1;
       spf=pass (google.com: domain of thuth@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <thuth@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id 6a1803df08f44-6bf6fec402asi42643686d6.218.2024.08.16.07.46.28
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Aug 2024 07:46:28 -0700 (PDT)
Received-SPF: pass (google.com: domain of thuth@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=YbCK0WT1;
       spf=pass (google.com: domain of thuth@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1723819588;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=6P3wmI/BdIdkSTMmbckGK8/t74YD719k3jioQVh7WHE=;
	b=YbCK0WT15sOXl4s9vo3Oq35UasLRfJxvrEuMLcXNzKpHXjhF+9jeMi12bJloWiIYaKnLjQ
	GSHyVikfZa9ksexVDjm7TT2RfhtevjLA+KE9qLykm47L34oxzXAqTaI1wsW4pP5mXdLi9g
	bJcKzVc0Dnm+taQY9A56LFp8cq0/cAA=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-425-KKnReNw0MhezBt_A5Dne2A-1; Fri, 16 Aug 2024 10:46:27 -0400
X-MC-Unique: KKnReNw0MhezBt_A5Dne2A-1
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-45029fafac8so57061491cf.0
        for <alex.bennee@linaro.org>; Fri, 16 Aug 2024 07:46:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723819587; x=1724424387;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6P3wmI/BdIdkSTMmbckGK8/t74YD719k3jioQVh7WHE=;
        b=KkO/BG7Q4itNPgifdDPaz3dd214bd7fl9UW6vqIEYpsDeJ3NxdF80f5CNYeBE2wPhi
         ko4JO4oddnAfqChPP0zu4ET0JGAF1xDQ17cIYHGbq1mkpM6QFJjToRbSyHM5wPHwyC+x
         YDcSnsv5rwm4bzvQjAMaERpgV8mEd2Ad0mxIq8yhQk3iW1FDIsGmfyLoqzb3Z4t2xkhX
         lF5ySppF8ijsM37VUQRyyc8aOqJoWFncipjo+vyKXkRa2yFv9BqrXzCeFIFCn3rN1HM2
         IKzzdceMEYicOV7s/Echs/VtETVdw9yampVqX5auqdH4IgpY8zokGjE6L6toL+5WFpf+
         Qbvw==
X-Forwarded-Encrypted: i=1; AJvYcCV4XupuklHho4R3G8uSJkpJOmDxcyD98Af0Zkizyxd0YmcPRjlBqjAPXs5kE+VJ/LTBYTbK2j19vO0DuIKlViWLBqV2Yay5
X-Gm-Message-State: AOJu0YyzOqtR11GVlSYMUkrSs0vAwqA8WC6+HU6c7McaAiSQJQTeN7n3
	A/JYmBNc5gENszMMdPZeFzvV2wM9zJsWDgGtSGrD+uYRlnOCOM6ER7zGQo5ztD2gKhvdnXhj2a0
	i6KyVvy5/CXYr7DI0uu/ghEloM0ZIcOFpeXko5BUH7C4ykeeQM4T9WA==
X-Received: by 2002:a05:622a:4aca:b0:447:dd66:8004 with SMTP id d75a77b69052e-45375295fa0mr54671131cf.27.1723819586732;
        Fri, 16 Aug 2024 07:46:26 -0700 (PDT)
X-Received: by 2002:a05:622a:4aca:b0:447:dd66:8004 with SMTP id d75a77b69052e-45375295fa0mr54670731cf.27.1723819586399;
        Fri, 16 Aug 2024 07:46:26 -0700 (PDT)
Return-Path: <thuth@redhat.com>
Received: from [192.168.0.6] (ip-109-43-177-15.web.vodafone.de. [109.43.177.15])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-45369fd9de3sm17133211cf.5.2024.08.16.07.46.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 Aug 2024 07:46:25 -0700 (PDT)
Message-ID: <8b73bc40-1a57-46d7-98c1-41b984b12ebe@redhat.com>
Date: Fri, 16 Aug 2024 16:46:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/9] tests/avocado: add cdrom permission related tests
To: Cleber Rosa <crosa@redhat.com>, qemu-devel@nongnu.org
Cc: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>,
 Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>,
 Radoslaw Biernacki <rad@semihalf.com>, Troy Lee <leetroy@gmail.com>,
 Akihiko Odaki <akihiko.odaki@daynix.com>, Beraldo Leal <bleal@redhat.com>,
 kvm@vger.kernel.org, Joel Stanley <joel@jms.id.au>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Aurelien Jarno <aurelien@aurel32.net>,
 Sriram Yagnaraman <sriram.yagnaraman@ericsson.com>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, Paul Durrant
 <paul@xen.org>, Eric Auger <eric.auger@redhat.com>,
 David Woodhouse <dwmw2@infradead.org>, qemu-arm@nongnu.org,
 Andrew Jeffery <andrew@codeconstruct.com.au>,
 Jamin Lin <jamin_lin@aspeedtech.com>, Steven Lee
 <steven_lee@aspeedtech.com>, Peter Maydell <peter.maydell@linaro.org>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Leif Lindholm <quic_llindhol@quicinc.com>
References: <20240806173119.582857-1-crosa@redhat.com>
 <20240806173119.582857-4-crosa@redhat.com>
From: Thomas Huth <thuth@redhat.com>
Autocrypt: addr=thuth@redhat.com; keydata=
 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
In-Reply-To: <20240806173119.582857-4-crosa@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TUID: S7v692CoBtJ8

On 06/08/2024 19.31, Cleber Rosa wrote:
> The "media=cdrom" parameter is also used on some Avocado tests as a
> way to protect files from being written.  The tests here bring a more
> fundamental check that this behavior can be trusted.
> 
> Signed-off-by: Cleber Rosa <crosa@redhat.com>
> ---
>   tests/avocado/cdrom.py | 41 +++++++++++++++++++++++++++++++++++++++++
>   1 file changed, 41 insertions(+)
>   create mode 100644 tests/avocado/cdrom.py
> 
> diff --git a/tests/avocado/cdrom.py b/tests/avocado/cdrom.py
> new file mode 100644
> index 0000000000..c9aa5d69cb
> --- /dev/null
> +++ b/tests/avocado/cdrom.py
> @@ -0,0 +1,41 @@
> +# Simple functional tests for cdrom devices
> +#
> +# Copyright (c) 2023 Red Hat, Inc.
> +#
> +# Author:
> +#  Cleber Rosa <crosa@redhat.com>
> +#
> +# This work is licensed under the terms of the GNU GPL, version 2 or
> +# later.  See the COPYING file in the top-level directory.
> +
> +import os
> +
> +from avocado.utils.iso9660 import iso9660
> +from avocado_qemu import QemuSystemTest
> +
> +
> +class Cdrom(QemuSystemTest):
> +    """
> +    :avocado: tags=block,cdrom,quick
> +    :avocado: tags=machine:none
> +    """
> +    def setUp(self):
> +        super().setUp()
> +        self.iso_path = os.path.join(self.workdir, "cdrom.iso")
> +        iso = iso9660(self.iso_path)
> +        iso.create()
> +        iso.close()
> +
> +    def test_plain_iso_rw(self):
> +        self.vm.add_args('-drive', f'file={self.iso_path}')
> +        self.vm.launch()
> +        query_block_result = self.vm.qmp('query-block')['return']
> +        self.assertEqual(len(query_block_result), 1)
> +        self.assertFalse(query_block_result[0]["inserted"]["ro"])
> +
> +    def test_media_cdrom_ro(self):
> +        self.vm.add_args('-drive', f'file={self.iso_path},media=cdrom')
> +        self.vm.launch()
> +        query_block_result = self.vm.qmp('query-block')['return']
> +        self.assertEqual(len(query_block_result), 1)
> +        self.assertTrue(query_block_result[0]["inserted"]["ro"])

I think such a test would be a better fit for the qemu-iotests, e.g. 
tests/qemu-iotests/118 looks pretty similar already, maybe this could be 
added there instead?

  Thomas

