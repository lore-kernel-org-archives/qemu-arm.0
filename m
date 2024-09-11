Received: by 2002:a17:504:928f:b0:1be9:327d:8ee3 with SMTP id d15csp202908nji;
        Wed, 11 Sep 2024 08:23:31 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVIJrgN/PMhiZNtY2F9V4BL5rphYDyD+IbfOqP4G1HHLOy/e5oE6M7I9PPIdbFDW4pG2GhJKXmBTUtT5Q==@linaro.org
X-Received: by 2002:aa7:88d1:0:b0:70d:2708:d7ec with SMTP id d2e1a72fcca58-718e3f9dd95mr17408828b3a.5.1726068211284;
        Wed, 11 Sep 2024 08:23:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1726068211; cv=none;
        d=google.com; s=arc-20160816;
        b=OLVryZoOspCe0yZ0WWh6vCuFY/dVVJceHCBJN0MlSKJJwgRvfNtFMwRSyjxqRSWLMi
         qlli9h9FQgoD2wYjibvsObgvg45AJ3+3+A4FAuwQrgXwxNMzYyQgLV5N7DxwcZ3zwKvp
         PWPg6LZwT+i4v/JeTR+kjsxGEHXHA+ktTkt5H7y7ipcJSDkmk75epD8DhWjecgho/MB1
         TVeXuBOJT+HXKr0fYCIQLRj+v+Z0wSidgSb0WwugWOBSOarBBxQv4XeqW8ccz2BTMpea
         DPC4hrBT78cdHdlHA7Ox5kVQZVQ4G8UX9lnBZqjgMffTQJCNNVltV08R9bN4p8YscnbT
         GE8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=OuvMeDUVp0mbaD2Ccta77meu7WyU6zTm7qPRf/MNjOo=;
        fh=tTOCA7k4iJ7apvvjLY0wVMXXIilQbskgW14DpbhMPDM=;
        b=c6A2bXLZiTKqFYTb5FNh9q2B4HE1qfkgIRvGdD6KlOmNtDtaARn5mvgsXs8bxSN1uY
         JSdJKImey5z2mNI60Ws6ZVRU08m0xCH/d38o3WG5q6BL1qUbFyDUsXdr6i6pWpxiO3Q3
         mOPUGif021RYI4dL2tHoO238YgThyKqhq8n4PDN9uUgRUQXiFwelYYOpMEPvuWS+FP3m
         atkMV5FAdSupywYF64f7u+wmN7ECwKcllUMYerPFBwQlg64BtkOpHMQK8ov3HwgS3p4+
         Vq+J5jO1rBgUQ4MOLXEQ4r9dZHOUME3611Au0sAuYAYlmf5cpakb8GjDOKPbnV6UChhV
         mKcA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=m67DJ3Bn;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d2e1a72fcca58-718e5977169sor6355844b3a.7.2024.09.11.08.23.31
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 11 Sep 2024 08:23:31 -0700 (PDT)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=m67DJ3Bn;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1726068211; x=1726673011; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=OuvMeDUVp0mbaD2Ccta77meu7WyU6zTm7qPRf/MNjOo=;
        b=m67DJ3BnwO1HZfqFUfQ3sP+qvD57vFJF1rxvFo4o+bfsx+QpxsQd/2iVZr0ZhRjbDD
         fgbrZnuQnk6Dy8yLiIeGM3KXnJHombyV2QabEV+yoF/b0QX5GLGbVfL7EJUNgi0jYYKe
         D0e1F4m7dJyCdggYXkr7Ig1id6hAx3HRJNWXiP/KywRvDLRC0VnhFa1xxqayqQVWy5Fu
         zGtRtjMNgsgmfNejZA8UVCsphhLpeRBxIHddJazwt35uJQIWo85JpuPa3X2onkX/AOmY
         Am4q0H+zOzT22eXGz2BLDoATyNsoqlcBdAXEYQ7ecXAJJCsqC8sX81SIv+oAasM+UUIS
         P41Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726068211; x=1726673011;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OuvMeDUVp0mbaD2Ccta77meu7WyU6zTm7qPRf/MNjOo=;
        b=SavP8irVccQ/KzTHTLTvruviunrWeLWIar43FbHtGXnsc7GBdZcRQ445EtQEXAsOJW
         sobE8rG59nBKkURGxFS6Vod3eFx+39hxuCS6Fs7yO+HG9wAQJkeEI71DoTNCsF74yqX9
         ziIWDIwrbTH5baNXzDkp3dYvzt8ucS1rFbYHBPMYy4bYT+bAheLe4vvAN5tWq2+RM9wE
         MM+Y6qXGw+awXaVgxQj9NAKQFm6JV9CVTxNMfTRFe9/dkH5+1xd7pPToirF0tpbaR6V/
         55IABJlur8+LmMEB9ny/8A2pKSZlmm/CarO0U2ZIluWbJqd8yI3pZzVcZeOjkjfJnyuh
         MVtA==
X-Forwarded-Encrypted: i=1; AJvYcCXYfdHa3N8yUJY0iGiGtYAWy8kX1DkPsZJ8OGRZYN3PKXM2QPK98pAlkCFVlX3KS9w0nAlMw+z/3EE9Tg==@linaro.org
X-Gm-Message-State: AOJu0YxBhcqfM7jUcBp7L4LPNCckpLJbwU5hoOi4i26JFXSos8ZbmJ4k
	ey9GoyXTNhqt2N+7Sf5eAhy2zb8bjCtcWLrZWDmm83SaFc/jz5+eF1d2POUX3HxUwA==
X-Google-Smtp-Source: AGHT+IFVEaQbbNIN6u4ycMxcdISjFC11x2LnDF31jXta/zBjlVjuD+C9lapW5FnwVoc/RuMXV2R+aQ==
X-Received: by 2002:a05:6a20:d809:b0:1c6:fb07:381e with SMTP id adf61e73a8af0-1cf5e1aba0fmr5779831637.44.1726068210675;
        Wed, 11 Sep 2024 08:23:30 -0700 (PDT)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from ?IPV6:2604:3d08:9384:1d00::9633? ([2604:3d08:9384:1d00::9633])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71908fe4e7esm3102009b3a.80.2024.09.11.08.23.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Sep 2024 08:23:30 -0700 (PDT)
Message-ID: <510bda9d-031a-4235-aee3-119c5f8865ea@linaro.org>
Date: Wed, 11 Sep 2024 08:23:23 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 01/39] docs/spin: replace assert(0) with
 g_assert_not_reached()
Content-Language: en-US
To: Eric Blake <eblake@redhat.com>
Cc: qemu-devel@nongnu.org, Zhao Liu <zhao1.liu@intel.com>,
 "Richard W.M. Jones" <rjones@redhat.com>, Joel Stanley <joel@jms.id.au>,
 Kevin Wolf <kwolf@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-arm@nongnu.org, Corey Minyard <minyard@acm.org>,
 Eric Farman <farman@linux.ibm.com>, Thomas Huth <thuth@redhat.com>,
 Keith Busch <kbusch@kernel.org>, WANG Xuerui <git@xen0n.name>,
 Hyman Huang <yong.huang@smartx.com>,
 Stefan Berger <stefanb@linux.vnet.ibm.com>,
 Michael Rolnik <mrolnik@gmail.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 Sriram Yagnaraman <sriram.yagnaraman@ericsson.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, qemu-riscv@nongnu.org,
 Ani Sinha <anisinha@redhat.com>, Halil Pasic <pasic@linux.ibm.com>,
 Jesper Devantier <foss@defmacro.it>, Laurent Vivier <laurent@vivier.eu>,
 Peter Maydell <peter.maydell@linaro.org>, Igor Mammedov
 <imammedo@redhat.com>, kvm@vger.kernel.org,
 =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>, Fam Zheng
 <fam@euphon.net>, qemu-s390x@nongnu.org, Hanna Reitz <hreitz@redhat.com>,
 Nicholas Piggin <npiggin@gmail.com>, Eduardo Habkost <eduardo@habkost.net>,
 Laurent Vivier <lvivier@redhat.com>, Rob Herring <robh@kernel.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, qemu-block@nongnu.org,
 "Maciej S. Szmigiero" <maciej.szmigiero@oracle.com>, qemu-ppc@nongnu.org,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Harsh Prateek Bora <harshpb@linux.ibm.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Nina Schoetterl-Glausch <nsg@linux.ibm.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Fabiano Rosas <farosas@suse.de>,
 Helge Deller <deller@gmx.de>, Dmitry Fleytman <dmitry.fleytman@gmail.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Akihiko Odaki <akihiko.odaki@daynix.com>,
 Marcelo Tosatti <mtosatti@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 Aurelien Jarno <aurelien@aurel32.net>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Yanan Wang <wangyanan55@huawei.com>, Peter Xu <peterx@redhat.com>,
 Bin Meng <bmeng.cn@gmail.com>, Weiwei Li <liwei1518@gmail.com>,
 Klaus Jensen <its@irrelevant.dk>,
 Jean-Christophe Dubois <jcd@tribudubois.net>,
 Jason Wang <jasowang@redhat.com>
References: <20240910221606.1817478-1-pierrick.bouvier@linaro.org>
 <20240910221606.1817478-2-pierrick.bouvier@linaro.org>
 <zkyoryho5alnyirnl7ulvh5y6tkty6koccgeygmve42uml7glu@37rkdodtlx4f>
 <bwo43ms2wi6vbeqhlc7qjwmw5jyt2btxvpph3lqn7tfol4srjf@77yusngzs6wh>
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
In-Reply-To: <bwo43ms2wi6vbeqhlc7qjwmw5jyt2btxvpph3lqn7tfol4srjf@77yusngzs6wh>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TUID: V/inSNS7bUkD

On 9/11/24 05:37, Eric Blake wrote:
> On Wed, Sep 11, 2024 at 07:33:59AM GMT, Eric Blake wrote:
>> On Tue, Sep 10, 2024 at 03:15:28PM GMT, Pierrick Bouvier wrote:
>>> Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
>>> ---
>>
>> A general suggestion for the entire series: please use a commit
>> message that explains why this is a good idea.  Even something as
>> boiler-plate as "refer to commit XXX for rationale" that can be
>> copy-pasted into all the other commits is better than nothing,
>> although a self-contained message is best.  Maybe:
>>
>> This patch is part of a series that moves towards a consistent use of
>> g_assert_not_reached() rather than an ad hoc mix of different
>> assertion mechanisms.
> 
> Or summarize your cover letter:
> 
> Use of assert(false) can trip spurious control flow warnings from some
> versions of gcc:
> https://lore.kernel.org/qemu-devel/54bb02a6-1b12-460a-97f6-3f478ef766c6@linaro.org/
> Solve that by unifying the code base on g_assert_not_reached()
> instead.
> 

I'll add this to messages. Thanks.
