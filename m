Received: by 2002:a17:505:a60a:b0:1be9:327d:8ee3 with SMTP id qv10csp5276747njc;
        Fri, 22 Nov 2024 02:12:14 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHF0eIRhMzyyDZbD1gjqjH+6xUv3JU+M+tAiAFG89ZMfB2gFL5hDEowyv0mpkLFG3aDzXWV
X-Received: by 2002:a05:6902:f82:b0:e38:b6be:1d52 with SMTP id 3f1490d57ef6-e38f8b31f37mr2564245276.15.1732270334492;
        Fri, 22 Nov 2024 02:12:14 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1732270334; cv=none;
        d=google.com; s=arc-20240605;
        b=hmcIaNE7BKnztaeV5OXITGyKWljCXLMvzlbk/U/RZNtzGFxM3s/thmKDgif/QdhFOu
         YvwUWi1u3ScgrYbZKRep1m6/4xoiIlt49GR9vSEfUyUE6/2BoJPbzD1YSoWcETB0T+Jc
         JdtczyS52q38ba/DdvCxUKApk0XJIAZAhQC38p0uuqEAluYqqNxLWYtqI3wL+HpvQtJp
         3FfNURKYKg0x4B0qKUZDd3RfLJXsrpzuYtw9Y+lRKmKtQpyNSaDFEg46c0LSRtEYvDSD
         haJDNpl4XK0HM5V83u/gN5PuoSdg+8b4uz0iHwVOgOXPzm1TzgUdyakJTHt/dgLUYhcr
         RcDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:content-language:in-reply-to:autocrypt
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:dkim-signature;
        bh=ndtvDf8fRIWY8rG923M9dgmbFSDPcHdF5/s3r6Jp0vw=;
        fh=wyrMqsRQzp9wn+9ic3ETyfTwhE/ffyQObIHI5bvyAZ4=;
        b=J8/leezlvQ+590DwPvOfw3rtBysdUJ5sfe90UHoxpX+HAuzsnY2OmeZpgi9FxgnXDF
         vZ7AEjvDzemFr8o8XvCPQdS9CcgGbUa3XfksbeZtr5yORctRs71u3fmT4npd1jFjkHEY
         QZeN3SrNHMj8n20gKbS7xm7ogVQXemJlg5cfIbu9TMTWrAsqvaUhULacH0NSbJTfGorx
         fKOyLFUpHDwAogLciZ317FT0vuUJXeRy1Nt4oYKV37PrwznuY6LS0RkRmAMXFguf//cN
         IvblUKqPRLSHc0L+dERgUNAZKwuMrlSUiseKrp8U0IRC9M7XYstwq6smK2aX9b56qTys
         uHNA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=StJOUmAA;
       spf=pass (google.com: domain of thuth@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <thuth@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id d75a77b69052e-4653c48dac7si19876831cf.440.2024.11.22.02.12.14
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Nov 2024 02:12:14 -0800 (PST)
Received-SPF: pass (google.com: domain of thuth@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=StJOUmAA;
       spf=pass (google.com: domain of thuth@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1732270334;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=ndtvDf8fRIWY8rG923M9dgmbFSDPcHdF5/s3r6Jp0vw=;
	b=StJOUmAA3YNh+PfkB/2U8yldBu5jDh1LDHN+whO7dtOwHh2vcusWC8B0l+BQkhxlmdesX1
	s2hExUuoi6ELrlnn+QoTiXf7tHChz3kWokdbb0zjLlnYRFhoiqpxIcfnBMTXjvkaLS8hDx
	3Ycvmr5/0ovbu0xgUlQn6OvCMpAw4bY=
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com
 [209.85.210.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-564-XiOgJXXwN9G8Am96wLehmA-1; Fri, 22 Nov 2024 05:12:13 -0500
X-MC-Unique: XiOgJXXwN9G8Am96wLehmA-1
X-Mimecast-MFC-AGG-ID: XiOgJXXwN9G8Am96wLehmA
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-71e7858820eso2013786b3a.2
        for <alex.bennee@linaro.org>; Fri, 22 Nov 2024 02:12:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732270332; x=1732875132;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ndtvDf8fRIWY8rG923M9dgmbFSDPcHdF5/s3r6Jp0vw=;
        b=t4yvmm77tr48ei5kcn1xG37RNqCjSZoj7noOxAJA+QinLsvdvtxilcmX61BFFuaT8p
         xYXGzXJICY4vSKC7FHNzwCzfB+qdorCKK/PknCH646S8WlzsJ74yMACRxQVrt53vb8UM
         MHeH9/+U56ZjtKYIy6A3EkLmelIX+3+pJ8G0BLUc+bujVvSgkI0oc7OgFqo/7O2UdBhY
         DFsaYh0PbXnwK8c7BfdUg9zCDARB1gzXXSy6WTYgJpz+2V2wxN4Hm0rqFhUr8k43HSuS
         hxIuRmeAPNoa3f5j4/Wd2jU5pnmStASi0BkXaxSDEe+a6UhU1H+le1sGyU02TBqqwNeK
         WcAw==
X-Gm-Message-State: AOJu0Yw6QckKc++2hfNHlVWgDETb9/qOMck2hg5etai0WMeIYyzIeMO+
	+g53LEfNQRLa4ZoXIajMip8V3hl4NUHd7U0D0tgGgfsq46m/Q28Qs3fDNojLrW8mGrLz4uRuqk5
	JkaDn21XbUGklQjaIT+Ub1e7vZOF61VRE5D66AdeeijGRt8RXPQSlgWdZO0HHISGdVPus5OKCuA
	N/aCmBljaWM9623sHcaQaK3hC3JaV5NJjlrQ==
X-Gm-Gg: ASbGncv/NphqevxBkxsyhcHY8ktGJqUlDTDWoyoXc6o1xa9HvHv9JSGzsw8cr0bL3m0
	FBRiDIWO/BlYAW/eeuEjNKwGoQ+NfLlpDgorM9XZSvSKpItIoUQ72cQdMLwdvTzpMt1mLWJzHsJ
	FVSywQ7IIYEpS2wk/z7Ka/nAbJNAZf6eHhBJfkQu54/LqZJ+BiPDvLKjrjh0qcGQuGyRixc/Nhq
	fKn4ESnGWvOIHQ1KmB8HLLVa79jNmr6YEY5UGph4JxO2A8g7Um825G8WVUx5x+bODIW4mtDhcU=
X-Received: by 2002:a05:6a00:17a1:b0:71e:7c25:8217 with SMTP id d2e1a72fcca58-724df6a4ac4mr2556091b3a.25.1732270332020;
        Fri, 22 Nov 2024 02:12:12 -0800 (PST)
X-Received: by 2002:a05:6a00:17a1:b0:71e:7c25:8217 with SMTP id d2e1a72fcca58-724df6a4ac4mr2556029b3a.25.1732270331443;
        Fri, 22 Nov 2024 02:12:11 -0800 (PST)
Return-Path: <thuth@redhat.com>
Received: from [10.33.192.206] (nat-pool-str-t.redhat.com. [149.14.88.106])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-724de454b5asm1297928b3a.27.2024.11.22.02.11.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 22 Nov 2024 02:12:11 -0800 (PST)
Message-ID: <79d4b597-742b-402f-acd3-c36c0269c721@redhat.com>
Date: Fri, 22 Nov 2024 11:11:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 27/39] tests/functional: update the mips64el tuxrun tests
To: =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>,
 Harsh Prateek Bora <harshpb@linux.ibm.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>, qemu-ppc@nongnu.org,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Alexandre Iooss <erdnaxe@crans.org>, qemu-riscv@nongnu.org,
 Thomas Huth <huth@tuxfamily.org>, Bernhard Beschow <shentey@gmail.com>,
 Eric Farman <farman@linux.ibm.com>, Bin Meng <bmeng.cn@gmail.com>,
 qemu-s390x@nongnu.org, Niek Linnenbank <nieklinnenbank@gmail.com>,
 qemu-arm@nongnu.org, John Snow <jsnow@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Cleber Rosa <crosa@redhat.com>, qemu-rust@nongnu.org,
 Nicholas Piggin <npiggin@gmail.com>, =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?=
 <berrange@redhat.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Markus Armbruster <armbru@redhat.com>, Weiwei Li <liwei1518@gmail.com>,
 Mahmoud Mandour <ma.mandourr@gmail.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Aurelien Jarno <aurelien@aurel32.net>, Ani Sinha <anisinha@redhat.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Anders Roxell <anders.roxell@linaro.org>
References: <20241121165806.476008-1-alex.bennee@linaro.org>
 <20241121165806.476008-28-alex.bennee@linaro.org>
From: Thomas Huth <thuth@redhat.com>
Autocrypt: addr=thuth@redhat.com; keydata=
 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
In-Reply-To: <20241121165806.476008-28-alex.bennee@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: K5P7gi_vS-8gHBK1n9RmAILetQDa-hMp9-Jelfu3pXc_1732270332
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: gr5JOn09y7XC

On 21/11/2024 17.57, Alex Bennée wrote:
> Now there are new upto date images available we should update to them.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> Cc: Anders Roxell <anders.roxell@linaro.org>
> ---
>   tests/functional/test_mips64el_tuxrun.py | 8 ++++----
>   1 file changed, 4 insertions(+), 4 deletions(-)

Reviewed-by: Thomas Huth <thuth@redhat.com>
Tested-by: Thomas Huth <thuth@redhat.com>
