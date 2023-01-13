Received: by 2002:a17:907:c68a:b0:84d:2074:29bb with SMTP id ue10csp428614ejc;
        Fri, 13 Jan 2023 06:23:35 -0800 (PST)
X-Google-Smtp-Source: AMrXdXs8tRw/6gOMT1TUf2B5cs8wi2weMdDLUIh/p3xHX7hztvhZbGofRxGxt5zBrolDZWm1ccjh
X-Received: by 2002:a05:6102:2329:b0:3d2:3201:55f with SMTP id b9-20020a056102232900b003d23201055fmr71783vsa.12.1673619815097;
        Fri, 13 Jan 2023 06:23:35 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1673619815; cv=none;
        d=google.com; s=arc-20160816;
        b=a7EmmhpJt0KvPyVjYxhL7V2PGo0tLuDG4q5n+zcV4Qn8jAozUTMwzsSusm2P+1VPts
         vKcvVROxU5OV6GuZ0wS5H4SiDfIdfd+HR1vlawhQaG0r5U1q4iS8eUX/ULa1Ya7ZKPQ8
         e5lOiRTRb5AHbtnhiJOHW/sgqHBBJZsfvBOPp718yuw3C1fmJiIhArD0ae/koElTw56C
         Jii4RapLKdzCZkNI3PTiUOWqtd4y/a0qLZsMuiYTNoPJfEQIAcjEKggEryie9pTwvZ6f
         f5/AkOVecm7VJW9DZcQj5XXIGZyLRxmZCL5o7u7Ay38fCNIujmptiRERWPjHp8S6IZXq
         UfQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=O3kkzOjzxf5gTH5Zv05I5NJOY6jMe0ZSsTM8iC04NDY=;
        b=bPKenjxkW4c8mbsPp4YMOq3+O18gcpr3ZEPYEkuphrqCvr7PMRDl4KEgr/XmSQxxud
         Y6baBq5e6P64nKnjDPupvco576B7Y1MP0TYQPNnsN+p716gQv7dDB5mIlKXo9Nzf5sm1
         pZ/76mTbYi5jBDgsL9wYYLRRjCv/A2jqMqy+bsIXKj3Gp0TlR1m6bxpQeMasIXfWO+pd
         F3HTl/5SDlaDapt+YC87QjDotN02cj8tBlHW7qi7r+psQk32tQLX+h8ElA+rTDeKEIP+
         bEetneD//1UIWqFV2+VLGnbZFZgH9llKhwAJbxl3OCfP2bZz6N6OAG2P8HEFT/C0QIJS
         pEsw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Jg2RYXCg;
       spf=pass (google.com: domain of thuth@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <thuth@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id s9-20020a67ce09000000b003b52a366a83si5006039vsl.153.2023.01.13.06.23.34
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Jan 2023 06:23:35 -0800 (PST)
Received-SPF: pass (google.com: domain of thuth@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Jg2RYXCg;
       spf=pass (google.com: domain of thuth@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1673619814;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=O3kkzOjzxf5gTH5Zv05I5NJOY6jMe0ZSsTM8iC04NDY=;
	b=Jg2RYXCgBZZnL9iZnv/72EA/t4VUpLWHsGTnaimgTuhHnXZuwYlaadQ90I71geGaAP5vgS
	eWdcavcAXgl0EzGRnvvKc+n1yu9+Cf9Jk/2EDWLalFqixkac8LqA3fR2jWQhHXdVACdXbF
	yx/6QjvrgxeA8AWSQo9djQZ6XN0xYuc=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-124-AwRJgNcfNVKRQcuknH0-CQ-1; Fri, 13 Jan 2023 09:23:33 -0500
X-MC-Unique: AwRJgNcfNVKRQcuknH0-CQ-1
Received: by mail-wm1-f72.google.com with SMTP id fl12-20020a05600c0b8c00b003d96f0a7f36so10989938wmb.1
        for <alex.bennee@linaro.org>; Fri, 13 Jan 2023 06:23:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=O3kkzOjzxf5gTH5Zv05I5NJOY6jMe0ZSsTM8iC04NDY=;
        b=rDkXnNCV/Q5Vs016NfXWZUth7K6EaOL4j2zbqZGgpBIih3BKsBPy99ZluGKR51VFxp
         RxubIN/4qMJQLCPkA61FGjFX/urkIiwdQqKepGXFgcXptcpRuIuyHdyhVyVpHn5v5NLK
         CdxdLI6zX0ZB3W411QKCDMPoN3R8gy+jp72UMETDFwLYJ5+MUnJfnJYo92HHyx8TCzlL
         hTvjW3uIYBc7bDzagHjW2chqOt8eBm1t9Xex9NMaw34E3Rx2FBSxQajGdhnI/vUytKfq
         9SpH8CGBZYqkkiOie4M+QBcJPrszdKenar0NeK7JEoB0DyTzINqv0qKFGr3pZiHcQUFw
         Df0A==
X-Gm-Message-State: AFqh2krY90V4hnI5pWB2GSyPc2zVpAZIqxlY9rAC6LUHf8XimH4/Ph60
	5YPZ/k3ary4blpSa6pLYqd5wGXZ4/27a4ZQDHv2a38X848bc1IpH86xIAGHWwChgXO7galfORln
	cnEZLf2Z2xQnVfzki
X-Received: by 2002:a05:600c:4f07:b0:3da:1bb0:4d78 with SMTP id l7-20020a05600c4f0700b003da1bb04d78mr4343460wmq.14.1673619812345;
        Fri, 13 Jan 2023 06:23:32 -0800 (PST)
X-Received: by 2002:a05:600c:4f07:b0:3da:1bb0:4d78 with SMTP id l7-20020a05600c4f0700b003da1bb04d78mr4343444wmq.14.1673619812099;
        Fri, 13 Jan 2023 06:23:32 -0800 (PST)
Return-Path: <thuth@redhat.com>
Received: from [192.168.0.2] (ip-109-43-177-39.web.vodafone.de. [109.43.177.39])
        by smtp.gmail.com with ESMTPSA id az20-20020a05600c601400b003d96bdddd3dsm25799869wmb.15.2023.01.13.06.23.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Jan 2023 06:23:31 -0800 (PST)
Message-ID: <4b9fd01e-6d6c-3046-dde0-dc8ce8de0f45@redhat.com>
Date: Fri, 13 Jan 2023 15:23:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [RFC PATCH v3 22/28] tests/qtest: Restrict bcm2835-dma-test to
 CONFIG_RASPI
To: Fabiano Rosas <farosas@suse.de>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Claudio Fontana <cfontana@suse.de>,
 Eduardo Habkost <ehabkost@redhat.com>, Alexander Graf <agraf@csgraf.de>,
 Laurent Vivier <lvivier@redhat.com>
References: <20230113140419.4013-1-farosas@suse.de>
 <20230113140419.4013-23-farosas@suse.de>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20230113140419.4013-23-farosas@suse.de>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TUID: 3LStVkcDDw8Y

On 13/01/2023 15.04, Fabiano Rosas wrote:
> We will soon enable the build without TCG, which does not support many
> machines, so only run the bcm2835-dma-test when the corresponding
> machine is present.
> 
> Signed-off-by: Fabiano Rosas <farosas@suse.de>
> ---
>   tests/qtest/meson.build | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/tests/qtest/meson.build b/tests/qtest/meson.build
> index f0ebb5fac6..1af63f8bd2 100644
> --- a/tests/qtest/meson.build
> +++ b/tests/qtest/meson.build
> @@ -207,11 +207,11 @@ qtests_aarch64 = \
>     (config_all_devices.has_key('CONFIG_TPM_TIS_SYSBUS') ? ['tpm-tis-device-test'] : []) +        \
>     (config_all_devices.has_key('CONFIG_TPM_TIS_SYSBUS') ? ['tpm-tis-device-swtpm-test'] : []) +  \
>     (config_all_devices.has_key('CONFIG_XLNX_ZYNQMP_ARM') ? ['xlnx-can-test', 'fuzz-xlnx-dp-test'] : []) + \
> +  (config_all_devices.has_key('CONFIG_RASPI') ? ['bcm2835-dma-test'] : []) +  \
>     ['arm-cpu-features',
>      'numa-test',
>      'boot-serial-test',
> -   'migration-test',
> -   'bcm2835-dma-test']
> +   'migration-test']
>   
>   qtests_s390x = \
>     (slirp.found() ? ['pxe-test', 'test-netfilter'] : []) +                 \

Reviewed-by: Thomas Huth <thuth@redhat.com>
