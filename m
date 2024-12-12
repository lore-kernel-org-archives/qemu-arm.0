Received: by 2002:a17:505:a0c:b0:1be9:327d:8ee3 with SMTP id cg12csp4802187njb;
        Thu, 12 Dec 2024 06:03:19 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHzlnh+hbaPWymv5Sj699QD7/jL4P7poT9DzROsij2t7+pMW9elo8Vj+hQSYgkzr8uMNejW
X-Received: by 2002:a2e:9c4e:0:b0:302:1cdd:73b9 with SMTP id 38308e7fff4ca-30251f22f1bmr832291fa.11.1734012196154;
        Thu, 12 Dec 2024 06:03:16 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1734012196; cv=none;
        d=google.com; s=arc-20240605;
        b=CCOpsxUy9GMTUQ2oLm+r6sH1mpPT5OFCTZRcDZ/KH2TxGrVjmYNztn698SCDhesFNq
         WviqiAlnkgZj97mJByXw4xz9JbZ0iCVdl9+z2v1se4PP0qArSG2prRJYBsOWMPYWXWDL
         0S5HMzaEkspAStqjnkDyM8UyvGOOMzN+MEAyIINGV1MZV/CJ4Ah66eX0Mrzw8ZrcAo6T
         c1Mo1wh5oD8PDltfqcBhIe6GYaqunryskEvI/mwi66ZmTjoD3fhqw3CIYCyXzPh9DnPc
         p4sNZFlqF+n27f51KnS8Io6uSZbNMJjdmyUS8AS1dhXJL/Ucy4Wztz0WeFhgV3Pq0kvG
         UhlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:content-language:in-reply-to:autocrypt
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:dkim-signature;
        bh=zQz6IYbah35Sgq0De7iKtBS2F5KDq0YOtSeGx1V5t9w=;
        fh=a9v6+Gdqr1+TCpArfFGGpfDRU8KFMVEEwOiP0t8t2iQ=;
        b=ZwCcboi+YEGxjKTaorBYDfxOeUArRRHYLRbNoQheH0PTaUG+3L3bJXvzbQJwAjgevu
         SZwHonnAYBQt9CHIrchkr1ddlxewYt9Ugc4e6cCwCDCjzRKckj1nmkdDYaS/nosXyLKm
         o0UVeuFs3ZG5Y7k6mzYQ3MwHll8Sg3Ugs1ut8jfXYw3ZwFy0Bu2hHCeVcrqSdSVolibq
         lfM8tk4T6+2Q5rtOoV0s2K1f7npFLNDLZCcKxr90IGDEAicolXQc3+c6tLCIwIGlhHsX
         xD69Cb0PLirkWJzo3JW5AjUe40CnIGJ/Fqh+k0eMdTsTgIN2FyDF9bW7jcKZ+oWiqRKF
         l+Cg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="OLvAM9/1";
       spf=pass (google.com: domain of thuth@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <thuth@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id 38308e7fff4ca-300d06ea5d0si39201271fa.528.2024.12.12.06.03.14
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Dec 2024 06:03:15 -0800 (PST)
Received-SPF: pass (google.com: domain of thuth@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="OLvAM9/1";
       spf=pass (google.com: domain of thuth@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1734012193;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=zQz6IYbah35Sgq0De7iKtBS2F5KDq0YOtSeGx1V5t9w=;
	b=OLvAM9/1vrtdPm+75QSZcq25r9WIo1QDdRChRPTBvmieEBUbamDOWF0by66TWLy8wtfgyQ
	EBVx9u9NftLpXv+TFLeQlWxlhVxSqSu18qD/I6myYb5RiEVGXmcNrxzlR7tF3zoaEv5rp0
	zkys+DhIiGK/lQK5RUqQbmi2J1ZCD1o=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-385-54vN_oXBOmiQfZuMEPaSMQ-1; Thu, 12 Dec 2024 09:03:09 -0500
X-MC-Unique: 54vN_oXBOmiQfZuMEPaSMQ-1
X-Mimecast-MFC-AGG-ID: 54vN_oXBOmiQfZuMEPaSMQ
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-436225d4389so5325725e9.1
        for <alex.bennee@linaro.org>; Thu, 12 Dec 2024 06:03:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734012188; x=1734616988;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zQz6IYbah35Sgq0De7iKtBS2F5KDq0YOtSeGx1V5t9w=;
        b=ggXm4NQZf1jO/MrvvwuNTub1rsLdWf13IaCf9kazILMFC8ntdUr6JUrOd8e4Lqy/GQ
         tybtHvTHCeoivtpqREkq1SS1UacqklE7LDEplg79KbstS0A0VVv/UJeGYtdjAKIW4I4B
         4Dw/BCF6aEOw8y9i76dlHui/SIkYapZvAVQBQkMSwdGyfjTn5rs4qnwxiV92b0cUsBux
         p6MStzEJbAQsAIyzWkSf6O7zuzU+eVSOjpvgy+6m/GVO5QCMu+IrPJVn85GigyMK8kKK
         fSskM9Fi1GwycuBBJ18cZTXW9arCe7c3Ud7MCLYTlljNXaxf4bF2GmBP88Ui9zZqQIZU
         Vn5Q==
X-Gm-Message-State: AOJu0Yw13QfwFuUtrsVilXgO0BL1hg/h7+skpvosIDkTSE/6z7YQRMFq
	4dh69Bnvm3O7E1F7Dl1LFkc/f09eh20Hh62m0f1oz8qrYrbw2TXMz7Ld0uv48vfO1KQyg16zQ5e
	fHekwqdbDMe0dSCPsE/9AwF/ycFvgPTJ7ZeUHB0Ngsp9GFN4KG8LJtvMLYow4SOdkBKbXGScnaR
	4+BuLDlDqOMJglKnS5UgROQScnxlsWKRwa9A==
X-Gm-Gg: ASbGncunw67ed010p7tMaNiM1G3vGv239SRJr46r+6SPy1bs972SDM5sdEdaBqxc3u/
	OLc2C3hf6fSKjWVJtShmZQs/One+753VUkb1GejUKbl2xBlZCcod9AocfM9KHJkdguZwIEYDp/8
	Q3VS1aRCBA5GZ5/eJQln6q+TBIg/BBLlKohKZM67E6GJUugaE2iZKG07IdQE6tTybHbnuzaUFDf
	t0YWvw+w/xBBO4M1tc3W6FuDfSulnnOZiseBfAu5xGIK7LGiW0yd987TnboKHyMdo1ZvQeEb8ZQ
	cxEP2Q==
X-Received: by 2002:a05:600c:501f:b0:436:1b0b:2633 with SMTP id 5b1f17b1804b1-436230eafa6mr24718525e9.9.1734012188507;
        Thu, 12 Dec 2024 06:03:08 -0800 (PST)
X-Received: by 2002:a05:600c:501f:b0:436:1b0b:2633 with SMTP id 5b1f17b1804b1-436230eafa6mr24712445e9.9.1734012182717;
        Thu, 12 Dec 2024 06:03:02 -0800 (PST)
Return-Path: <thuth@redhat.com>
Received: from [10.33.192.206] (nat-pool-str-t.redhat.com. [149.14.88.106])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-436257177c5sm17337065e9.43.2024.12.12.06.03.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Dec 2024 06:03:02 -0800 (PST)
Message-ID: <ec72b047-54c3-4712-aab5-e7b43e663dd9@redhat.com>
Date: Thu, 12 Dec 2024 15:03:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 20/20] tests/functional: extend test_aarch64_virt with
 vulkan test
To: =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org, "Daniel P. Berrange" <berrange@redhat.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>, qemu-s390x@nongnu.org,
 Halil Pasic <pasic@linux.ibm.com>, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Weiwei Li <liwei1518@gmail.com>, Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Cleber Rosa <crosa@redhat.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Leif Lindholm <quic_llindhol@quicinc.com>, Eric Farman
 <farman@linux.ibm.com>, =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?=
 <marcandre.lureau@redhat.com>, John Snow <jsnow@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Harsh Prateek Bora <harshpb@linux.ibm.com>,
 Aurelien Jarno <aurelien@aurel32.net>, Paolo Bonzini <pbonzini@redhat.com>,
 Joel Stanley <joel@jms.id.au>, Bernhard Beschow <shentey@gmail.com>,
 qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Laurent Vivier <lvivier@redhat.com>, qemu-arm@nongnu.org,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Fabiano Rosas <farosas@suse.de>, Markus Armbruster <armbru@redhat.com>,
 Bin Meng <bmeng.cn@gmail.com>, Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Beraldo Leal <bleal@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Radoslaw Biernacki <rad@semihalf.com>, Nicholas Piggin <npiggin@gmail.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Alistair Francis <alistair.francis@wdc.com>
References: <20241210204349.723590-1-alex.bennee@linaro.org>
 <20241210204349.723590-21-alex.bennee@linaro.org>
 <d2a73820-58fa-41d0-8f38-68b0ad53fa7d@redhat.com>
 <87bjxhrsjf.fsf@draig.linaro.org>
From: Thomas Huth <thuth@redhat.com>
Autocrypt: addr=thuth@redhat.com; keydata=
 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
In-Reply-To: <87bjxhrsjf.fsf@draig.linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: pzsQ5AnRaGwMNMZcLiHUVRPkvvFEgurCk39GV-u5Zyo_1734012188
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: p+S7sQhkKAIO

On 12/12/2024 13.32, Alex Bennée wrote:
> Thomas Huth <thuth@redhat.com> writes:
> 
>> On 10/12/2024 21.43, Alex Bennée wrote:
>>> Now we have virtio-gpu Vulkan support lets add a test for it.
>>> Currently this is using images build by buildroot:
>>>     https://lists.buildroot.org/pipermail/buildroot/2024-December/768196.html
>>> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> <snip>
>>> +        self.vm.set_console()
>>> +        kernel_command_line = (self.KERNEL_COMMON_COMMAND_LINE +
>>> +                               'console=ttyAMA0 root=/dev/vda')
>>> +        self.require_accelerator("tcg")
>>
>> Same, please move to the beginning since it can skip the test.
>>
>>> +        self.vm.add_args("-accel", "tcg")
> 
> Actually this could run under KVM if we have it for Aarch64. Can we
> represent that?

Simply omit the line "require" line and add an additional -accel kvm here? 
... I think nobody ever tried to run the functional tests with another 
accelerator beside kvm and tcg on aarch64 hosts, so it should be fine.

  Thomas
