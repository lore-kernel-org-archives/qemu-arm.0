Received: by 2002:a17:504:664e:b0:1be9:327d:8ee3 with SMTP id l14csp1049254njk;
        Wed, 18 Dec 2024 08:25:56 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE9k6TW/emvKbBtLFHSSxmv800oUNDk5TfZHDd75EsIB9A9V3VMZASrZtv1i7Ky6AurGL6n
X-Received: by 2002:a05:6102:15a0:b0:4b2:ad82:133a with SMTP id ada2fe7eead31-4b2ae8abef9mr3059928137.25.1734539156390;
        Wed, 18 Dec 2024 08:25:56 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1734539156; cv=none;
        d=google.com; s=arc-20240605;
        b=k/OOEZnRvxNI7vae+TEZ9of6w/giIKsH5egRw3tYSCQze8I6pBbUWuSZmv0+8AJ3xx
         aKFu1kiLJrj02DMG0Z8BkbIuAA2Acv4z1Zq7JzdS96ix3W8McwpA2huZPIXQBHt7ZpGZ
         R0BXuskHYYn0IdaVjEf5CdFPYD8vY9j3glm76LxZTJ5fqIVDmV7GCeomMX+QGrjDFM4E
         8IJJn+zwqS4R9lmJ32f8SQepuoTC5W3gdEDums8EOhi7E9HFYeyOlDrBPhC3f9RBI95n
         +qrUE4eODmqyPgt/3K0QCVarHKkaIr5G9mfZvtSl3z2JT1k0dofKDE12/YggiZBSPrNJ
         9lQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:content-language:in-reply-to:autocrypt
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:dkim-signature;
        bh=r5JJSS4cJSqnn/MEVRTYbUDJnDkKD81QZB2/Z2Hzk+o=;
        fh=9Zke7ipf+XgxgP6XBLMA+c7xIpH91AiCyh1cNrY82/E=;
        b=ikbCapB26ns2xbInulyr8S7i2hCB2/g4nCfxdnkYT6SCGCLVd5HYqLpWDOF0UFOn13
         paDlpmJaNhQ5Fkfgbxho0hsg3QmSN83mM91j3l+0UPJcFn0CTcj5d0BVMNmie14qaAeY
         Peq3yxWOURtpJY4jpmh4cEhbTb6k56J+8nAfYQ2druJ7Rg9O+MlsbRXYT9+EHZVjutB3
         oHeesFCVhqJIaS44x7P8BqEITae2Ppk/puZbgZ96khbShcutod1E+i45fppzOg1ggJRP
         /k5501EJoFz4qszsU/jEwFk1FWxgMr1+ycVdLEggOAXXUHHP15yh6Z08nbcavihdoU6R
         U/mQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=c6BtrEsJ;
       spf=pass (google.com: domain of thuth@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <thuth@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id ada2fe7eead31-4b2704d1717si2808453137.752.2024.12.18.08.25.56
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Dec 2024 08:25:56 -0800 (PST)
Received-SPF: pass (google.com: domain of thuth@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=c6BtrEsJ;
       spf=pass (google.com: domain of thuth@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1734539156;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=r5JJSS4cJSqnn/MEVRTYbUDJnDkKD81QZB2/Z2Hzk+o=;
	b=c6BtrEsJP7EBVDtndOHItIMvUsUvNn+pvTTeHVSKQmcVcmUo7KVU+CkszuvMfjMnLrdBN5
	Whfy+BqkbjNP5inJlkWYK3C0W63PPdyyljH3sp2CQOo/Ewz/KMXR9Ebk1VMIftYHxptRqk
	7RVoPmPSmKtqE6HTEf0DzqwaI2gzmQM=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-439-x-2adLSDM3O3DphOyI2-Jg-1; Wed, 18 Dec 2024 11:25:55 -0500
X-MC-Unique: x-2adLSDM3O3DphOyI2-Jg-1
X-Mimecast-MFC-AGG-ID: x-2adLSDM3O3DphOyI2-Jg
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7b6c6429421so1032282985a.0
        for <alex.bennee@linaro.org>; Wed, 18 Dec 2024 08:25:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734539154; x=1735143954;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=r5JJSS4cJSqnn/MEVRTYbUDJnDkKD81QZB2/Z2Hzk+o=;
        b=wA4f+BdH17VGglOg6+Rv39sE8mFxWV6s7nhMyRUttDt1Dgd1dfUxeda7TW5M8auVl/
         5cV3rm1ouzci8ZsSgQfVFJXSIoI7o1Ffs3M1lY+dVATOvwKA+AQ3oUsFGK9PRVuUTexd
         dtNcVtCRAan6OBpxRzsgWZzp/cYQxdMQOeoT5GzdrAac8J6sELmaf2i3wN2Rt93ASQdN
         uUU5fcq1HrnUWRRrczSSF7+qMhDhF+YnU/vy53AKv71XdOguDydghhFJpLty7ZqzMOCT
         r8goj43v8veYgK/6bkCcrVO+86CFJAaXrLvNTJoUF/gMnN4mhtJX/cyXzE84kd6vVkf2
         Y8Vg==
X-Gm-Message-State: AOJu0YwNs96UcgizDC2/Q6LhO8q1fuQjXG5xH5XWmeqQYkskXTq82j8E
	3gK2IQUB/7TQhRPqYafxI0FUr7ePc+43KLBrEDEu2DD/6qYi5be/V832SZ1/d+ULuSdkHHYe2bQ
	g9xkyABLu89I1rwe8FPqNhALdzbU26Nt9QeJbN3dXw2dvJSNzjcyU2+xsJU//7zerexHUYjf/iJ
	g6ECf5pluKu4L370o60esRFn7ttG3ACScYIA==
X-Gm-Gg: ASbGncsdDza3BNfMISoVePjbHNCdiFXwwDrVOJZK32NOifRCtYaTBMnSIqnCkpQgp/W
	S+RxjsRjtwPpz4yQDmCmVgIDM20r1WE4GzUr9UT9CFq84DZsxX/xt3FIvXo+dslyU5e3x6ntTT/
	R5wG6xuWtBO0Fra8+rRLwzmoBnrlGndM+CC01Cn+jbaPus7jNNLBh21SOIwECxG1/6JnBxTEF4E
	u3mQ26V+XtHi0BviCUAyJWEK3wDbvq38yVdsKeEs7oBtY/NUgVBqRAsWrBiqfKaBOfup136slXG
	SfhYPSvTf8+H
X-Received: by 2002:a05:620a:45aa:b0:7b6:e47a:8e13 with SMTP id af79cd13be357-7b86375d0e9mr473002085a.31.1734539154544;
        Wed, 18 Dec 2024 08:25:54 -0800 (PST)
X-Received: by 2002:a05:620a:45aa:b0:7b6:e47a:8e13 with SMTP id af79cd13be357-7b86375d0e9mr472994585a.31.1734539154160;
        Wed, 18 Dec 2024 08:25:54 -0800 (PST)
Return-Path: <thuth@redhat.com>
Received: from [192.168.0.6] (ip-109-42-49-186.web.vodafone.de. [109.42.49.186])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7b7047cd507sm443078285a.31.2024.12.18.08.25.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Dec 2024 08:25:53 -0800 (PST)
Message-ID: <49df9668-5345-402e-bb0b-6a7e787c6da6@redhat.com>
Date: Wed, 18 Dec 2024 17:25:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 19/27] tests/functional: remove hacky sleep from the
 tests
To: =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 Ed Maste <emaste@freebsd.org>, Eric Farman <farman@linux.ibm.com>,
 Li-Wen Hsu <lwhsu@freebsd.org>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Aurelien Jarno <aurelien@aurel32.net>, Fabiano Rosas <farosas@suse.de>,
 Radoslaw Biernacki <rad@semihalf.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-riscv@nongnu.org, Nicholas Piggin <npiggin@gmail.com>,
 Joel Stanley <joel@jms.id.au>, Beraldo Leal <bleal@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Jiaxun Yang
 <jiaxun.yang@flygoat.com>, Weiwei Li <liwei1518@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>, Cleber Rosa <crosa@redhat.com>,
 Leif Lindholm <quic_llindhol@quicinc.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 John Snow <jsnow@redhat.com>, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Bin Meng <bmeng.cn@gmail.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Laurent Vivier <laurent@vivier.eu>,
 Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>,
 Richard Henderson <richard.henderson@linaro.org>,
 Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>,
 Halil Pasic <pasic@linux.ibm.com>, qemu-arm@nongnu.org,
 Harsh Prateek Bora <harshpb@linux.ibm.com>, qemu-ppc@nongnu.org,
 Bernhard Beschow <shentey@gmail.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 qemu-s390x@nongnu.org, Laurent Vivier <lvivier@redhat.com>,
 Alistair Francis <alistair.francis@wdc.com>
References: <20241218162104.3493551-1-alex.bennee@linaro.org>
 <20241218162104.3493551-20-alex.bennee@linaro.org>
From: Thomas Huth <thuth@redhat.com>
Autocrypt: addr=thuth@redhat.com; keydata=
 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
In-Reply-To: <20241218162104.3493551-20-alex.bennee@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: sur9dtApT4h_bMMJZZvmUlHZWTxRRnC_JLjqDl7iXWQ_1734539154
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: +CGENdz3eySy

On 18/12/2024 17.20, Alex Bennée wrote:
> We have proper detection of prompts now so we don't need to guess with
> sleep() sprinkled through the test. The extra step of calling halt is
> just to flush the final bits of the log (although the last line is
> still missed).
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>

Reviewed-by: Thomas Huth <thuth@redhat.com>
