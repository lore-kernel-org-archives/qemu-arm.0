Received: by 2002:ac2:4c26:0:0:0:0:0 with SMTP id u6csp1063459lfq;
        Thu, 10 Sep 2020 00:07:04 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy2rD86Di79Xy3RGVEkwCsIU9GPMt+IP+9rHQsE/zCdIzEeChgxbMrDhaIH021EWpFJCk4H
X-Received: by 2002:aa7:d30b:: with SMTP id p11mr7961970edq.80.1599721624827;
        Thu, 10 Sep 2020 00:07:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1599721624; cv=none;
        d=google.com; s=arc-20160816;
        b=B9ByUvaV4yt/7eA4fJDjAE0eEKgFzvVMFKor6ESV8wP2cr+Em8HQa1mTKiJUpywrnR
         Mw5kdaPPWMM4Q3UNmF94+6EzZcxR8gEIL1m85ieoHypRGsAMfq+SvNYXjAtbre1k5DIU
         zpeV/PKKaYT1ncj5mCWjYWzYH9KOSJC1BZhrjtD+bFqPIg2s3lOC0Vgaq12HpNoZrNvG
         h8M+mL3D9CPeBiUicnJqb8x8b4RQ0Oh60Bd0Qx+UmUTeKnGEFhpfvg1RM8JTbXj/yoSu
         nX43o+8Tp1DkusCtihhUeqxrt3g74T7iLCwBiUkDY1sCgFUyEc/YIBE72VOYOK9CjTEC
         0L0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-language:content-transfer-encoding:in-reply-to:mime-version
         :user-agent:date:message-id:autocrypt:from:references:cc:to:subject
         :dkim-signature;
        bh=rEbZ+IsVviGEL+xwewmo6vrAVeSIwVEEl/J4gj7wsM4=;
        b=OW/7EXrt704fMGxXSRlQGiqECUWwqwT9g1zS5IzKfHbGOp5fnHqhOJUyme2toup3J1
         ZSOzROBJ0U2Vn82JJZGYgjUCL98pNXH+PDQvpLrg8RmSgFzah+diKzffm4jaFD16kjPO
         AkfQUt+kL6Ce4qIVGvRhaAcaxIn0Thkqwuyb0iasU7Pw0X0+u1t02ExiX/R51hczy/Zx
         WWh7UmbZ4CHBNdlhhPAOr9umMB6Dy8NOHl91F671KIxj10CSRLf0UqXvqTgU276hTkJb
         A93ZEXyrZPEnA4KZnQO3FP6NjArtEnFBS8Tg4Hyr6cCdwkMPnucB6KzoyUKiX0vh6zrW
         rgNQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=iQrNVzfz;
       spf=pass (google.com: domain of philmd@redhat.com designates 216.205.24.124 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <philmd@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [216.205.24.124])
        by mx.google.com with ESMTPS id j12si2797088ejx.16.2020.09.10.00.07.04
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 10 Sep 2020 00:07:04 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@redhat.com designates 216.205.24.124 as permitted sender) client-ip=216.205.24.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=iQrNVzfz;
       spf=pass (google.com: domain of philmd@redhat.com designates 216.205.24.124 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1599721623;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=rEbZ+IsVviGEL+xwewmo6vrAVeSIwVEEl/J4gj7wsM4=;
	b=iQrNVzfznqUEyoPmS0PfWmPtC7tQxsdhB/KxFd8EvjIeCBQ1sjjPOjYm4DBVSlcww+DhX2
	GqVzjGfLTC8tNpi3MzEGkis8K+XpWwuwLXb0xQRfXkJgOso1EbkmqkVqUfpx87zJ9VK7wM
	RTiKCSDY4dSjIu7A+Zo+SRBZzGx/pBM=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-57-jrMK53uRPqytXh1ijpQLQQ-1; Thu, 10 Sep 2020 03:07:00 -0400
X-MC-Unique: jrMK53uRPqytXh1ijpQLQQ-1
Received: by mail-wr1-f70.google.com with SMTP id l15so1891649wro.10
        for <alex.bennee@linaro.org>; Thu, 10 Sep 2020 00:07:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=rEbZ+IsVviGEL+xwewmo6vrAVeSIwVEEl/J4gj7wsM4=;
        b=gbGzgPW+yPoy35FqEf0MVvvVzzxpyD0LgCSlxFqkmcRxDY3qsCmt0y4IANsxBfJBwy
         hWLUvMiCLc8+Zd8D2ewfoLFH/BkkIfmXKubxJ8IEWEC6Cl+Ai93SnMBNbzRLUWgCsegh
         j8WZ5s2ZKAGVFizkhXmll44n0u/3BcA1kFoO1w/E8pwlRoSzFuFQ/tDm8t2A9dfXkRPY
         dL9N5VjXmkju1CjevaYI5w3Z6ro1O8evgcg1k8HMBfuVQN9/V0lCTZ9sQo/c7sVUtw7+
         D/UCA9N6LEjhURBiO80Z6OS37QYZCcz/ruvc8a376ivtzUnfrgy0fcnR/uhNVd1XD4D9
         4Krw==
X-Gm-Message-State: AOAM5314c4t+JnrISyj/qAbpJbzEfh4Q0ztxBPa+jbL/cbdqnkCb7Z5h
	Uw9GSPwM2RgfSyePRTvmi8UrM5bCB1/6Y7uxYTHxZCgnQYw5hBfAXNEIYfdlDysrxICtkz2mrgT
	3bKoxHBJBBrJWM8Wp
X-Received: by 2002:a1c:b407:: with SMTP id d7mr7418131wmf.59.1599721619819;
        Thu, 10 Sep 2020 00:06:59 -0700 (PDT)
X-Received: by 2002:a1c:b407:: with SMTP id d7mr7418114wmf.59.1599721619652;
        Thu, 10 Sep 2020 00:06:59 -0700 (PDT)
Return-Path: <philmd@redhat.com>
Received: from [192.168.1.36] (65.red-83-57-170.dynamicip.rima-tde.net. [83.57.170.65])
        by smtp.gmail.com with ESMTPSA id 11sm2229961wmi.14.2020.09.10.00.06.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Sep 2020 00:06:59 -0700 (PDT)
Subject: Re: [PATCH 2/6] hw/core/stream: Rename StreamSlave as StreamSink
To: qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 kvm@vger.kernel.org, qemu-arm@nongnu.org,
 Marcelo Tosatti <mtosatti@redhat.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, =?UTF-8?Q?C=c3=a9dric_Le_Goater?=
 <clg@kaod.org>, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Laurent Vivier <lvivier@redhat.com>, Peter Maydell
 <peter.maydell@linaro.org>, Andrew Jeffery <andrew@aj.id.au>,
 Jason Wang <jasowang@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Alistair Francis <alistair@alistair23.me>, qemu-trivial@nongnu.org,
 Eduardo Habkost <ehabkost@redhat.com>, Richard Henderson <rth@twiddle.net>,
 Joel Stanley <joel@jms.id.au>, Paolo Bonzini <pbonzini@redhat.com>
References: <20200910070131.435543-1-philmd@redhat.com>
 <20200910070131.435543-3-philmd@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Autocrypt: addr=philmd@redhat.com; keydata=
 mQINBDXML8YBEADXCtUkDBKQvNsQA7sDpw6YLE/1tKHwm24A1au9Hfy/OFmkpzo+MD+dYc+7
 bvnqWAeGweq2SDq8zbzFZ1gJBd6+e5v1a/UrTxvwBk51yEkadrpRbi+r2bDpTJwXc/uEtYAB
 GvsTZMtiQVA4kRID1KCdgLa3zztPLCj5H1VZhqZsiGvXa/nMIlhvacRXdbgllPPJ72cLUkXf
 z1Zu4AkEKpccZaJspmLWGSzGu6UTZ7UfVeR2Hcc2KI9oZB1qthmZ1+PZyGZ/Dy+z+zklC0xl
 XIpQPmnfy9+/1hj1LzJ+pe3HzEodtlVA+rdttSvA6nmHKIt8Ul6b/h1DFTmUT1lN1WbAGxmg
 CH1O26cz5nTrzdjoqC/b8PpZiT0kO5MKKgiu5S4PRIxW2+RA4H9nq7nztNZ1Y39bDpzwE5Sp
 bDHzd5owmLxMLZAINtCtQuRbSOcMjZlg4zohA9TQP9krGIk+qTR+H4CV22sWldSkVtsoTaA2
 qNeSJhfHQY0TyQvFbqRsSNIe2gTDzzEQ8itsmdHHE/yzhcCVvlUzXhAT6pIN0OT+cdsTTfif
 MIcDboys92auTuJ7U+4jWF1+WUaJ8gDL69ThAsu7mGDBbm80P3vvUZ4fQM14NkxOnuGRrJxO
 qjWNJ2ZUxgyHAh5TCxMLKWZoL5hpnvx3dF3Ti9HW2dsUUWICSQARAQABtDJQaGlsaXBwZSBN
 YXRoaWV1LURhdWTDqSAoUGhpbCkgPHBoaWxtZEByZWRoYXQuY29tPokCVQQTAQgAPwIbDwYL
 CQgHAwIGFQgCCQoLBBYCAwECHgECF4AWIQSJweePYB7obIZ0lcuio/1u3q3A3gUCXsfWwAUJ
 KtymWgAKCRCio/1u3q3A3ircD/9Vjh3aFNJ3uF3hddeoFg1H038wZr/xi8/rX27M1Vj2j9VH
 0B8Olp4KUQw/hyO6kUxqkoojmzRpmzvlpZ0cUiZJo2bQIWnvScyHxFCv33kHe+YEIqoJlaQc
 JfKYlbCoubz+02E2A6bFD9+BvCY0LBbEj5POwyKGiDMjHKCGuzSuDRbCn0Mz4kCa7nFMF5Jv
 piC+JemRdiBd6102ThqgIsyGEBXuf1sy0QIVyXgaqr9O2b/0VoXpQId7yY7OJuYYxs7kQoXI
 6WzSMpmuXGkmfxOgbc/L6YbzB0JOriX0iRClxu4dEUg8Bs2pNnr6huY2Ft+qb41RzCJvvMyu
 gS32LfN0bTZ6Qm2A8ayMtUQgnwZDSO23OKgQWZVglGliY3ezHZ6lVwC24Vjkmq/2yBSLakZE
 6DZUjZzCW1nvtRK05ebyK6tofRsx8xB8pL/kcBb9nCuh70aLR+5cmE41X4O+MVJbwfP5s/RW
 9BFSL3qgXuXso/3XuWTQjJJGgKhB6xXjMmb1J4q/h5IuVV4juv1Fem9sfmyrh+Wi5V1IzKI7
 RPJ3KVb937eBgSENk53P0gUorwzUcO+ASEo3Z1cBKkJSPigDbeEjVfXQMzNt0oDRzpQqH2vp
 apo2jHnidWt8BsckuWZpxcZ9+/9obQ55DyVQHGiTN39hkETy3Emdnz1JVHTU0Q==
Message-ID: <4eabb327-a03b-747b-eadc-54e1c7b29d81@redhat.com>
Date: Thu, 10 Sep 2020 09:06:57 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <20200910070131.435543-3-philmd@redhat.com>
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0.003
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-TUID: Q4duKnRTgiPf

On 9/10/20 9:01 AM, Philippe Mathieu-Daudé wrote:
> In order to use inclusive terminology, rename 'slave stream'
> as 'sink stream'.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> ---
[...]
> diff --git a/include/hw/stream.h b/include/hw/stream.h
> index ed09e83683d..8ca161991ca 100644
> --- a/include/hw/stream.h
> +++ b/include/hw/stream.h
> @@ -3,52 +3,52 @@
>  
>  #include "qom/object.h"
>  
> -/* stream slave. Used until qdev provides a generic way.  */
> -#define TYPE_STREAM_SLAVE "stream-slave"
> +/* stream sink. Used until qdev provides a generic way.  */
> +#define TYPE_STREAM_SINK "stream-slave"
>  
> -#define STREAM_SLAVE_CLASS(klass) \
> -     OBJECT_CLASS_CHECK(StreamSlaveClass, (klass), TYPE_STREAM_SLAVE)
> -#define STREAM_SLAVE_GET_CLASS(obj) \
> -    OBJECT_GET_CLASS(StreamSlaveClass, (obj), TYPE_STREAM_SLAVE)
> -#define STREAM_SLAVE(obj) \
> -     INTERFACE_CHECK(StreamSlave, (obj), TYPE_STREAM_SLAVE)
> +#define STREAM_SINK_CLASS(klass) \
> +     OBJECT_CLASS_CHECK(StreamSinkClass, (klass), TYPE_STREAM_SINK)
> +#define STREAM_SINK_GET_CLASS(obj) \
> +    OBJECT_GET_CLASS(StreamSinkClass, (obj), TYPE_STREAM_SINK)
> +#define STREAM_SINK(obj) \
> +     INTERFACE_CHECK(StreamSink, (obj), TYPE_STREAM_SINK)

Hmm being an interface, is it better to name it TYPE_SINK_STREAM?
