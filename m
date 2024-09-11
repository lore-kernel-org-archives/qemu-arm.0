Received: by 2002:a17:504:928f:b0:1be9:327d:8ee3 with SMTP id d15csp219957nji;
        Wed, 11 Sep 2024 09:13:44 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVL5pqVxCWVLkyr3VYyBUXfab5Us9AisgNifeQuGBaJdXL5ieaSP1r86CzEbVJBbYEHnf6HXO5qlrBEYQ==@linaro.org
X-Google-Smtp-Source: AGHT+IHp12wPi15LA3YDmcBVbNzk3aGgM+57cvTNlCoLxPX0NhiK+ySJRrVdXJC//pHynFY9NrsU
X-Received: by 2002:a05:6102:e0d:b0:493:dee7:9b8a with SMTP id ada2fe7eead31-49d41513da0mr131295137.13.1726071223791;
        Wed, 11 Sep 2024 09:13:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1726071223; cv=none;
        d=google.com; s=arc-20240605;
        b=aC7WE5vHz5NfjlR8hOWK+CiOokhTU3yTSFaIER5CCUAPN6+rWnoS0OlHI0FnTyaPUB
         oPVx9wpxFw9iVJPNngWWFS+Iu5EwBTBW9urCVBQXJDhCYJ+gxsP9XjiUd8n3mByPuoKO
         ZyRTK9tZegj0QLPpD/23yTX+50ttwAzZqfhiKZOVZzQ/LpJSaEcGbm0oUzUXSoiLSflH
         wFNfAhb3Gg7ww6/F2rl0Xse5A1jzcaK/ZmzmuVVjFUOQrHSkcsxui6fG9D4dzVaZloo5
         JECknaz8Yeql2A6vL+/efeArm4cyJF+9HeMJpoHML8AfbU31RsMQ/2XSnOnIo6aJQtqb
         ZsYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:content-language:in-reply-to:autocrypt
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:dkim-signature;
        bh=eseXdDpfz/U6BsWSABfXPfB77+/2Dy1yLZdnZJ55/wc=;
        fh=kJbp5RVVVVpjtjhjpUZlup5oRD3HvAiYFIuj0aoSxCQ=;
        b=Apmrm/qbkQUcXx30nsx7q0tpxb9KMb1Ya1kvRuBcvRrOY5tzEtK1gTpN/bv+t7b1dr
         P2C2MmqDedky/40sVWtyyTBghXlDV7j0QfxciIZPcRgKOP0bywWVGNyLrZgH0WAFZEUU
         3U4YgMoj8gA8+H8aaeYT6mPbxw8nW1gM1JEKU8BTO1mAMCt74SIQQlSSwqX+ht+f7GvK
         QIuIHhnVOirz45eQy0pcvABBPgF3ozJs1VzVhkMCTBgr9O+MAPhsk8ygpLBwmQ386Ife
         EmSfpHBSJNjBK90RvRNUYzfxvAyso6mHoLrTEinB5G94cIVFBuTCnwlsDC5MXJhdHBq8
         hqcQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="Kkl/tywz";
       spf=pass (google.com: domain of thuth@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <thuth@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id ada2fe7eead31-49c16e20750si1337110137.718.2024.09.11.09.13.43
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Sep 2024 09:13:43 -0700 (PDT)
Received-SPF: pass (google.com: domain of thuth@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="Kkl/tywz";
       spf=pass (google.com: domain of thuth@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1726071223;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=eseXdDpfz/U6BsWSABfXPfB77+/2Dy1yLZdnZJ55/wc=;
	b=Kkl/tywz8FZ6peJzEl5Y9dynZCxypzBwqGf4QVJIIGPYBWsTfQ4pfa5t9uxrmDgOn+2Hbt
	ievQHH8uRD+UVgLXM7sOxOC9H+8OeCZx8S8j0KtaW6Gb1QbqU437lhg9pivfUEBwpvqXX8
	f4/WxoVGulszmFjQOcqeTRKnSH7LAmQ=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-655-ODfQf1eAOvOSp2JG0yJzsw-1; Wed, 11 Sep 2024 12:13:42 -0400
X-MC-Unique: ODfQf1eAOvOSp2JG0yJzsw-1
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-378ab5b74e1so10009f8f.3
        for <alex.bennee@linaro.org>; Wed, 11 Sep 2024 09:13:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726071221; x=1726676021;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eseXdDpfz/U6BsWSABfXPfB77+/2Dy1yLZdnZJ55/wc=;
        b=VhvrpQuJDulIuJwAEPwhQe88tljaHucp2ztQ7Fh0la3zAeX/yozkLcb6be42TpERuY
         cB/v70/YKzhLOYsM1d0uh+LXCOyx3gc1v6TGQUrw9FzVF3ZByzcRe9LQVLW5ANAk8Hel
         Oy3hEDA4diUEE2mzkIm68SZhOvuuLBNypdiXX6WbKyW9GAnRv6bHUYPA+oZfHx/Y2ECM
         dPPpAo5a0a5mnKdCnvc/Gk4FXm9e3NphSTjgAwqesplREPBYyFGJHOVyFX08IMqMKGdP
         WBiyowDVKMiathRUEzUkKD96GPTRBPjJOUnf4iskZVhXoWeyhvd2CYM2XetBxjMXDgBs
         6nRw==
X-Forwarded-Encrypted: i=1; AJvYcCW/EdL0+26fW9BY5WLFfm9hAbdSdkdaJmaXxeJo0iw+AlZAvo8fDVuuRJ3eGiygPh664yDtnmx3pSpJIw==@linaro.org
X-Gm-Message-State: AOJu0Yx6jhdhTb4sIobH2kWxpJbHXXb/ky+Yeilktl8z/tiRxTMtoO9/
	BXtJ2fQF3m7XvmPZo0m+2s/zmFhdvXDrhT5YAqTcadvlm6Ty6+U798ib05Gd1Jng55bAqLUTpMo
	jGddelqqaNTQSLvIPkTNkDXAoq61eoMQQcj5yzydJHdNpD7oqCJqZ5g==
X-Received: by 2002:adf:8b9c:0:b0:375:f59f:221 with SMTP id ffacd0b85a97d-378895c70bemr10513531f8f.14.1726071220955;
        Wed, 11 Sep 2024 09:13:40 -0700 (PDT)
X-Received: by 2002:adf:8b9c:0:b0:375:f59f:221 with SMTP id ffacd0b85a97d-378895c70bemr10513446f8f.14.1726071220269;
        Wed, 11 Sep 2024 09:13:40 -0700 (PDT)
Return-Path: <thuth@redhat.com>
Received: from [192.168.0.6] (ip-109-43-178-122.web.vodafone.de. [109.43.178.122])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-378956dddacsm11852571f8f.107.2024.09.11.09.13.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Sep 2024 09:13:39 -0700 (PDT)
Message-ID: <c62bed1a-a13d-49eb-aec2-54bfe78dd1e5@redhat.com>
Date: Wed, 11 Sep 2024 18:13:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 01/39] docs/spin: replace assert(0) with
 g_assert_not_reached()
To: "Richard W.M. Jones" <rjones@redhat.com>,
 "Maciej S. Szmigiero" <mail@maciej.szmigiero.name>
Cc: Eric Blake <eblake@redhat.com>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>, qemu-devel@nongnu.org,
 Zhao Liu <zhao1.liu@intel.com>, Joel Stanley <joel@jms.id.au>,
 Kevin Wolf <kwolf@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-arm@nongnu.org, Corey Minyard <minyard@acm.org>,
 Eric Farman <farman@linux.ibm.com>, Keith Busch <kbusch@kernel.org>,
 WANG Xuerui <git@xen0n.name>, Hyman Huang <yong.huang@smartx.com>,
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
From: Thomas Huth <thuth@redhat.com>
Autocrypt: addr=thuth@redhat.com; keydata=
 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
In-Reply-To: <20240911125126.GS1450@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TUID: ELhrS7057ByC

On 11/09/2024 14.51, Richard W.M. Jones wrote:
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

That's only in the #ifdef G_DISABLE_ASSERT case ... and we forbid that in 
QEMU, see osdep.h:

#ifdef G_DISABLE_ASSERT
#error building with G_DISABLE_ASSERT is not supported
#endif

So in QEMU, g_assert_not_reached() should always abort.

  Thomas
