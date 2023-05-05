Received: by 2002:a17:906:4810:b0:965:a47e:1721 with SMTP id w16csp461082ejq;
        Fri, 5 May 2023 07:31:12 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ52434YqwLQY22rcTpNAuW+CvPYoHRAls/jpcL5fo0bOvnikPk21/HingBSlIlASpSBAHmb
X-Received: by 2002:ac8:5f52:0:b0:3e4:e2fa:66b0 with SMTP id y18-20020ac85f52000000b003e4e2fa66b0mr2283751qta.29.1683297072005;
        Fri, 05 May 2023 07:31:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1683297071; cv=none;
        d=google.com; s=arc-20160816;
        b=J2WroLEOhQPpXwxCrmPqXe7Tki3IKgPpbpo9D2ArvIFm895F7YXq9nlf7TZg9YuQgd
         m51VQqoFhrrAJzcDFjV6obaeF8ksj3dBKVXg39nE1oznsBSuEzMN9jfJs1XqEbWr17Iv
         myJS+DM3qNcJiIw8dN1HDrRqRQSuCEw0QBfY+KpVr+2YNpsqHAJ0mfsjRmyKULHmqP0n
         LvQXWQAs2bZbf9Siv2u2eK9zyZRQhu9tsDCLZb3LSO3WVAwQAO7k5VGv1FINIZ00ycjV
         zJ6qUMMG/IgzaVwAOcxVz+mrFJEfAlUCzKC4HcGctiSNG9jI9Jyi8y73MG3a0WAY7Ogs
         BqHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:subject:from
         :references:cc:to:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=7IAmzZAVl9Ma5GdYJJCNFIlhk3LLvI5uITg9ilAzfT4=;
        b=d5B8Ea02J66be9gcHHIW+mvo05S/TIwTH1pPcDPbkFncPyk5rh+Qi9VCbxexB8Xi9o
         SeQsi6N84bNYTXzZ5lrpTk5e30q0RyPYOpqKkXGAeMCCzyf8cz/RIcZN6MALFb06Cb9h
         c2t7zsA3ReMA69a01pBTHIeuawMN++D+yuoe+GfD2wtVof04Y7NdkUM+UDMJxcEreLw7
         eqSpJN0+tUyBnO1yQpi6653jSv0JErPXBjHQezFMuZhEXhRLeeEAE9MNsIf8jqn/jsp9
         FU7RNMYREyLdZcVZ0Kt/2b9TyGo30fqhSNRPYyB3T5UUcdnCm93QceOQQEwctrh8rDhV
         RO+A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=ITnmtk57;
       spf=pass (google.com: domain of thuth@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <thuth@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id o14-20020a05622a138e00b003ef2f72a8efsi586617qtk.733.2023.05.05.07.31.11
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 May 2023 07:31:11 -0700 (PDT)
Received-SPF: pass (google.com: domain of thuth@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=ITnmtk57;
       spf=pass (google.com: domain of thuth@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1683297071;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7IAmzZAVl9Ma5GdYJJCNFIlhk3LLvI5uITg9ilAzfT4=;
	b=ITnmtk57SzYxVza3wwfc+pNvnkAkd1eEI9MbIrpzBeaOQLeomHoI3ANw3IEW0Nc35E03Kd
	psboZK8xD0aDLHfyKrUNtdFojFL+2EZaONe3wqp7STGsRFKDu17ifymF8/JXrDnNMsALgw
	BPKtK6R4/atOru1eUy/FkMoC2+9IwoU=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-617-ff37B7T7OEqO-GzDpCC86g-1; Fri, 05 May 2023 10:31:10 -0400
X-MC-Unique: ff37B7T7OEqO-GzDpCC86g-1
Received: by mail-ej1-f70.google.com with SMTP id a640c23a62f3a-965b73d8b7eso173642266b.2
        for <alex.bennee@linaro.org>; Fri, 05 May 2023 07:31:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683297069; x=1685889069;
        h=content-transfer-encoding:in-reply-to:subject:from:content-language
         :references:cc:to:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7IAmzZAVl9Ma5GdYJJCNFIlhk3LLvI5uITg9ilAzfT4=;
        b=EJULqSguqFqqEVLaT2b56/SSP1r9ovcrYo5BlIFAF5LThr2uZ9SZX6+hFjQihMz4UH
         GziF8UaFV4fl23EOCd+yLWr22gXz7SqtG80BaaqKvEUi+j23PSyndj7g7he6F9hIqF3P
         un3712wGfnxY1jA3OGG0drIsXbh4nL8ZxEJOWjG6MWmF+oqkx60i0NRxz9AdH4Y4BF0f
         1orF0a20Kv7bSmWLc83k3HYkI3MSddSXlW/V/kqaTaxQH3XuGJclQpRm6nPfFubzI8qq
         h34D5EKKMs96e/0ubnZjKYzlMU9PRzOx5Ria1/dNtw5X96SRDOQTLAQREHjTNA49hCUc
         1gXg==
X-Gm-Message-State: AC+VfDw+H4opJvquMm2mUTg0x4jqSaiPtnv9omjDHtBjGDmCC5Z306NS
	lp1LqhHCdYwUBBMM0AJLAqXmRN1JCQ/cPLR5HXVWk5oIqETEZ35Xu6qci5q+da3zBAFOcJ5isuQ
	4pR+bAf/qPi0QRETN
X-Received: by 2002:a17:907:da1:b0:94f:6ca2:e34 with SMTP id go33-20020a1709070da100b0094f6ca20e34mr1523521ejc.66.1683297069138;
        Fri, 05 May 2023 07:31:09 -0700 (PDT)
X-Received: by 2002:a17:907:da1:b0:94f:6ca2:e34 with SMTP id go33-20020a1709070da100b0094f6ca20e34mr1523495ejc.66.1683297068868;
        Fri, 05 May 2023 07:31:08 -0700 (PDT)
Return-Path: <thuth@redhat.com>
Received: from [192.168.0.3] (ip-109-43-179-91.web.vodafone.de. [109.43.179.91])
        by smtp.gmail.com with ESMTPSA id gz5-20020a170907a04500b0094f663bced2sm1020093ejc.33.2023.05.05.07.31.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 05 May 2023 07:31:08 -0700 (PDT)
Message-ID: <5554d26d-b932-c3be-7333-a2e385066ef3@redhat.com>
Date: Fri, 5 May 2023 16:31:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
To: Fabiano Rosas <farosas@suse.de>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, John Snow <jsnow@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>
References: <20230505123524.23401-1-farosas@suse.de>
 <20230505123524.23401-4-farosas@suse.de>
From: Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH v2 3/3] tests/qtest: Don't run cdrom tests if no
 accelerator is present
In-Reply-To: <20230505123524.23401-4-farosas@suse.de>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TUID: vlmzuXGLSkbF

On 05/05/2023 14.35, Fabiano Rosas wrote:
> On a build configured with: --disable-tcg --enable-xen it is possible
> to produce a QEMU binary with no TCG nor KVM support. Skip the test if
> that's the case.
> 
> Fixes: 0c1ae3ff9d ("tests/qtest: Fix tests when no KVM or TCG are present")
> Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>
> Signed-off-by: Fabiano Rosas <farosas@suse.de>
> ---
>   tests/qtest/cdrom-test.c | 5 +++++
>   1 file changed, 5 insertions(+)
> 
> diff --git a/tests/qtest/cdrom-test.c b/tests/qtest/cdrom-test.c
> index 26a2400181..09655e6ff0 100644
> --- a/tests/qtest/cdrom-test.c
> +++ b/tests/qtest/cdrom-test.c
> @@ -205,6 +205,11 @@ int main(int argc, char **argv)
>   
>       g_test_init(&argc, &argv, NULL);
>   
> +    if (!qtest_has_accel("tcg") && !qtest_has_accel("kvm")) {
> +        g_test_skip("No KVM or TCG accelerator available");
> +        return 0;
> +    }

You only nee to skip the test if running with x86 or s390x, all other 
targets use only "-accel qtest" IIRC, so those shoul be fine.

  Thomas
