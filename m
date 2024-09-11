Received: by 2002:a17:504:928f:b0:1be9:327d:8ee3 with SMTP id d15csp203668nji;
        Wed, 11 Sep 2024 08:25:48 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVQrUJDfSMHv2weMrGeOEac+7E8ntH1q4u/NQCy/oWsCqLr7p/tBfcXzUs8Om88FBYy0d00PMzpglIi5A==@linaro.org
X-Received: by 2002:a17:902:f547:b0:205:8407:631d with SMTP id d9443c01a7336-2074c5d3c5fmr46292515ad.13.1726068348598;
        Wed, 11 Sep 2024 08:25:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1726068348; cv=none;
        d=google.com; s=arc-20160816;
        b=t52V70/ORvmDjmINDMKLuFet1bIv6XuAV6RTeoFuJvb7euk3zMVPJwd43QX50sgZX9
         Bgh2BIMaZRBQSKECb3V6NueZ1oqIxeEeS4SkOvBo3mj6Dg230ze9L6zloiD3L4uuCawl
         sPRHlN/CF8KUojxjRVa7Ddq2EvLJQUckjTuGJNyGtcUmg475rA6ktUxH+KOzd/PNrbam
         xWTTTgbZCkgS6vPs0SDcYcFO1O/oelynGq0h0yCK1uyvXkQ6kixBD2Sf7Lhsqh4epvFM
         WnKRUlf16CScjdchi1wy70hHkhnymyDBqWi90KnLa1+WKIYXkVBzHUnWiUtPAdhY0nJ0
         NItA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=KOIqyxflpQF2OIgg5Cs8RejsCarR4kHtT8bNPVM50WU=;
        fh=2oe6gJbS4ateGkXvuaaMA79H+ZZeMD4aQDhtSRWWLBk=;
        b=j88DL8wJ/1XOloFvt7amPGwtXD8145YSveFpdO1bhiQmhT048OSu0XMckktFqPF61R
         b7uByH/b1Gshm0yc31Yp+C0YwOFP+UjNVdWD4MiSJbHgk9Gmmw3GCepmJYVlGSzzrO6m
         Acs5FIokL6islQso1FoOlCAV4vWLaUgAk5MQoaFotE8rPpiJWHlPfnFb/WVVPdGhUCXY
         jeDvE//bYfeIXmONuJ4CnAGDpi/kHJrFokSX0iLpt2f4z9NUwZklGBJu2fqJMTMGJcVB
         ob3l27zhYpiofmL6EQnoBbBUHW062DTJ1SgWQRyX3lV76m5wEwsUe6Nfrxvrd3Ryp4fB
         aWKg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=lYBgFE4V;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d9443c01a7336-20710e841a9sor41104065ad.9.2024.09.11.08.25.48
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 11 Sep 2024 08:25:48 -0700 (PDT)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=lYBgFE4V;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1726068348; x=1726673148; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=KOIqyxflpQF2OIgg5Cs8RejsCarR4kHtT8bNPVM50WU=;
        b=lYBgFE4V7froC2BWx5JG+RmJpjOvCMGD7iUntWKTl2FCQ4Vb4kLwH+cNXPbcOn089q
         UCztCAM5D9twkXBzPoDpLGfzbq0SjjsVHEzAqhH3ul1Ll+OqExqSgnF4u+AwbRTnQjHe
         uF/MHkAJ25t4FN1wJwqYQqmFQKqVkYjlAhz+Ccmr346ps8Yt670Ct3+pqr7IOjieXB6Y
         npAAtRHI+JNcD6NTH0Cdkp7Y1McIp5VJQYe8mrKWuJe4IMqOXHGs/xA2X12g5zQGTItC
         UcYdCrAfcvzI/gMsBrJfO5tQ+h1g8BQJtNeArsuuXUr5eWoZQMxSODzrMmH7pQVSAREl
         D9uA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726068348; x=1726673148;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KOIqyxflpQF2OIgg5Cs8RejsCarR4kHtT8bNPVM50WU=;
        b=un+5DvBkJpmJ7lLEGSrK/aNy5MbNu0e4snQ2chSKr0/yPb2E4IrblUZjP8GzTQQEW3
         tsm/HJlMgiEcdep0nhQF0P5ZMQlnSq6ETW6uVElrJpHs3F4d+0YePxzOwjQ80100A9He
         dR50kRSJ/gn6dVwan3uSFVklSq7xX51PhY04tzzoWGQyokCGhzxH3DDEdjaBthyF2haM
         4O2ET/fXKmM/WWyVdmZ7vvczBFLH19bORO1J4ecwfLuFAto7lng8fRmphPcb8aOQu1zZ
         Kdm07b1vOGZAX6UanOkG0vMh3BNX59+ETPvScgOxKNFN5ivVtaNRM/O993gPrQz0dWx/
         azpw==
X-Forwarded-Encrypted: i=1; AJvYcCWw5yQylKUvTZgaFfBQKuj1vihIK2dwXYsg5GG3OrAR3idon2bVkXwpiKm3VCZaFtWFhVaLQHDwhMlR3Q==@linaro.org
X-Gm-Message-State: AOJu0YyKKeVHbdySKcPg0AqGaoGWuDAjKdUGxBzBp7kUkMK1kEhA7f4/
	XBwoz6gWSYpM+HEZTLJ8VB2qSuagmyyj3WAYq/mwuxeks99MjWKbGRWw6eNnXpoKPA==
X-Google-Smtp-Source: AGHT+IEo3j0LjjLmX6e/pgB28NMglTb3qohZUhTxnnknsMeupJHRg8k/VIdzXloihGE5TJFpijhPog==
X-Received: by 2002:a17:902:d54f:b0:207:db0:cb6c with SMTP id d9443c01a7336-2074c612765mr72854645ad.34.1726068347907;
        Wed, 11 Sep 2024 08:25:47 -0700 (PDT)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from ?IPV6:2604:3d08:9384:1d00::9633? ([2604:3d08:9384:1d00::9633])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2076af25407sm1022925ad.41.2024.09.11.08.25.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Sep 2024 08:25:47 -0700 (PDT)
Message-ID: <6818337d-ba58-4051-8105-05f679f71b88@linaro.org>
Date: Wed, 11 Sep 2024 08:25:44 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 01/39] docs/spin: replace assert(0) with
 g_assert_not_reached()
Content-Language: en-US
To: "Richard W.M. Jones" <rjones@redhat.com>,
 "Maciej S. Szmigiero" <mail@maciej.szmigiero.name>
Cc: Eric Blake <eblake@redhat.com>, qemu-devel@nongnu.org,
 Zhao Liu <zhao1.liu@intel.com>, Joel Stanley <joel@jms.id.au>,
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
 qemu-ppc@nongnu.org, Daniel Henrique Barboza <danielhb413@gmail.com>,
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
 <10d6d67a-32f6-40fc-aba9-c62a74d9d98d@maciej.szmigiero.name>
 <20240911125126.GS1450@redhat.com>
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
In-Reply-To: <20240911125126.GS1450@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TUID: SdVWZ3cyuaMH

On 9/11/24 05:51, Richard W.M. Jones wrote:
> On Wed, Sep 11, 2024 at 02:46:18PM +0200, Maciej S. Szmigiero wrote:
>> On 11.09.2024 14:37, Eric Blake wrote:
>>> On Wed, Sep 11, 2024 at 07:33:59AM GMT, Eric Blake wrote:
>>>> On Tue, Sep 10, 2024 at 03:15:28PM GMT, Pierrick Bouvier wrote:
>>>>> Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
>>>>> ---
>>>>
>>>> A general suggestion for the entire series: please use a commit
>>>> message that explains why this is a good idea.  Even something as
>>>> boiler-plate as "refer to commit XXX for rationale" that can be
>>>> copy-pasted into all the other commits is better than nothing,
>>>> although a self-contained message is best.  Maybe:
>>>>
>>>> This patch is part of a series that moves towards a consistent use of
>>>> g_assert_not_reached() rather than an ad hoc mix of different
>>>> assertion mechanisms.
>>>
>>> Or summarize your cover letter:
>>>
>>> Use of assert(false) can trip spurious control flow warnings from some
>>> versions of gcc:
>>> https://lore.kernel.org/qemu-devel/54bb02a6-1b12-460a-97f6-3f478ef766c6@linaro.org/
>>> Solve that by unifying the code base on g_assert_not_reached()
>>> instead.
>>>
>>
>> If using g_assert_not_reached() instead of assert(false) silences
>> the warning about missing return value in such impossible to reach
>> locations should we also be deleting the now-unnecessary "return"
>> statements after g_assert_not_reached()?
> 
> Although it's unlikely to be used on any compiler that can also
> compile qemu, there is a third implementation of g_assert_not_reached
> that does nothing, see:
> 
> https://gitlab.gnome.org/GNOME/glib/-/blob/927683ebd94eb66c0d7868b77863f57ce9c5bc76/glib/gtestutils.h#L269
> 
> Rich.
> 

Interesting.
At least gcc, clang and msvc are covered, this should be ok for most of 
the builds.

Thanks for sharing,
Pierrick
