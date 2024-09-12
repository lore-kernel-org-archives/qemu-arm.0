Received: by 2002:a17:504:928f:b0:1be9:327d:8ee3 with SMTP id d15csp342509nji;
        Wed, 11 Sep 2024 17:28:30 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXCj5gTopwnTL9rMOvrMPIelJcKykrC+k5b53hUOXcgVA4Mv388XR7Btk/L+gM+vT35Qyq2vb/qPXNoCQ==@linaro.org
X-Received: by 2002:a05:6a00:218f:b0:70d:2892:402b with SMTP id d2e1a72fcca58-7192608123fmr1572344b3a.7.1726100910258;
        Wed, 11 Sep 2024 17:28:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1726100910; cv=none;
        d=google.com; s=arc-20160816;
        b=eVs0IeD7AFh2uE0ObevnNbmXyCnSltxDxFsA13aN/vuEXs7Wq4I3N69Dk1j6TkCtQL
         3cfCY3HiEijJw6b0MXVENoalYJtNNGtyPLrIloD/V4QuIQ1D9KFYFkuglA/n107/gvpu
         /We1gil+qqkP8OkL0pUdpK/FX7aDxnfGklzamncQ6WEEWti0B9ZcDZD9tlHjril+AJKs
         QbkhcX2XKUNl4GYsyLheXaEJCd04z6cVQu8c8ju4CxqQNSOWN5enVJHtnKsRqwMZ4VNz
         aOP5gJ5ELh4ILBAjTBWvtr4LinNip7n/0K1zfa9OA4ba2Xze9kFgpT8+XjEdusdd+hHC
         npXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=c9o7/Cb/II9t2dUk/lFV7V5FBEJVmX+kPV3LL4olG50=;
        fh=GCJTyuBEnJEr+LZa7wrBMy9m2+MHJZD6jrXbure55PU=;
        b=FSEhwSiC2QmL0onwe1rgVxtAjC2k2LV7e9KQyw3HuFxMBwchui2G12FLgRiqe3o0ol
         u07p06VH6KxT1lN9qAjZ7DrMq82ZHEA0wNPNqy2csuxTJrguWzwqhegTwKGY0/FS3Aao
         w3j8TGsatM8BXPVfnHwvB0OXHGmjf6y6RBCDSb5s8kCDQ2ZGJBdfMr7KuVUKhnFSS6DC
         b2AudRNaxboTbNDyiWHn23KqtNVplD87FumFpHqGfAZuZeQ/8PoDi1Rnsd5YuhzmELzT
         yTCIi5QVTrH1hdT5XJczgOcoKGorRnCew/OnE9w+XzNhrbUHewTwL0s8tfZ/A1LaTLDS
         jp+w==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Nkl9Vhfu;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d2e1a72fcca58-718e596f584sor5985162b3a.9.2024.09.11.17.28.30
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 11 Sep 2024 17:28:30 -0700 (PDT)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Nkl9Vhfu;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1726100910; x=1726705710; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=c9o7/Cb/II9t2dUk/lFV7V5FBEJVmX+kPV3LL4olG50=;
        b=Nkl9VhfuLpkCwx0SxRBx3ZtAmkrtyGxD5cczRmsISjk/xgrPZP6khmxFXuY+N94np4
         Z+vnKsp8br0XoytPJ713Jtvpc6AQwRWRg3trutJVWlhwnouKFkOqnGQFvGH4GZYXRRNM
         YxoFMoDrow1KXY+6CJT8iLIb5xacKEIdUr/hiX0q31E5CyX04RGDRqrxd2bvvu+kJPDS
         RLu+wmuMdQTXpHYKzwXyq2QVr4ykz0D6a+bzYn0ouYf5Waevhv6xVcgvS1cXfd5jYjjw
         dV5+YJfHF/3x3nDShcsZmOYcB2IBH8qQhTjFtmN2xdUyjGxI4C3e1jl9GfjcxBrw/Dys
         BduA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726100910; x=1726705710;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=c9o7/Cb/II9t2dUk/lFV7V5FBEJVmX+kPV3LL4olG50=;
        b=BW707l8KZh+foa5T1P48NIXf8ixdfHhUMjvLDXyk63QVbrkDO4d46rpgzMh40jS+Dy
         SN8Eys/YkXrVMh8TbupJa92EfWVEabKO1RAFVuAH+lgkbgq/zfipfcPFTegR/C6rNtjA
         11NWJNoVznd8/EanXnQ6rpNhzD8KI3os/4tHHRSLb7qXpL8hLknZ/APTYr7XTW3wUAQ8
         ExHQtPvYrED8ik9irQrVUeGIB2+MzubWmnfzdl/qaMugFffiPcf36a7O04NSMXNx4L8j
         ZoLK5XNYyW4rH9M+iAe5iFLNIvacg1hPuwI85mBh2372hohhkvwiFf6U2pVb2YgIn4mT
         UMNw==
X-Forwarded-Encrypted: i=1; AJvYcCXxk1o3kVud0lHTLA4V1BacVJpkONKr8rzh41WdeZFuuakSDs3oTnnGZTgn8s0bPulhxxNPwStoEaulsQ==@linaro.org
X-Gm-Message-State: AOJu0YyZY32MAkHQckOlPGbansyeth+wfD5CKmab4HIsW+7s78Q3zqE4
	3M4nL/1WPTQUNYf4EaGdsKLuY9zNK4ISmDzn/cjmxUxIM2YhHfQ4O7mXUNJYs1/YtA==
X-Google-Smtp-Source: AGHT+IG/+agFR+owCifK6LN7nBFHTLHqk0umycTEk4Q5c9uh7VrVH7bVyDXkjOez5N5fvomBj8Vk0w==
X-Received: by 2002:a05:6a21:4581:b0:1cf:4458:8b27 with SMTP id adf61e73a8af0-1cf764afde6mr1438134637.46.1726100909723;
        Wed, 11 Sep 2024 17:28:29 -0700 (PDT)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from ?IPV6:2604:3d08:9384:1d00::9633? ([2604:3d08:9384:1d00::9633])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-719090c37efsm3523445b3a.187.2024.09.11.17.28.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Sep 2024 17:28:29 -0700 (PDT)
Message-ID: <7328179f-dbc8-46da-8b87-1077a706acc7@linaro.org>
Date: Wed, 11 Sep 2024 17:28:26 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 01/39] docs/spin: replace assert(0) with
 g_assert_not_reached()
Content-Language: en-US
To: Thomas Huth <thuth@redhat.com>, "Richard W.M. Jones" <rjones@redhat.com>,
 "Maciej S. Szmigiero" <mail@maciej.szmigiero.name>
Cc: Eric Blake <eblake@redhat.com>, qemu-devel@nongnu.org,
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
 <c62bed1a-a13d-49eb-aec2-54bfe78dd1e5@redhat.com>
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
In-Reply-To: <c62bed1a-a13d-49eb-aec2-54bfe78dd1e5@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TUID: EJRdoqt/UtPW

On 9/11/24 09:13, Thomas Huth wrote:
> On 11/09/2024 14.51, Richard W.M. Jones wrote:
>> On Wed, Sep 11, 2024 at 02:46:18PM +0200, Maciej S. Szmigiero wrote:
>>> On 11.09.2024 14:37, Eric Blake wrote:
>>>> On Wed, Sep 11, 2024 at 07:33:59AM GMT, Eric Blake wrote:
>>>>> On Tue, Sep 10, 2024 at 03:15:28PM GMT, Pierrick Bouvier wrote:
>>>>>> Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
>>>>>> ---
>>>>>
>>>>> A general suggestion for the entire series: please use a commit
>>>>> message that explains why this is a good idea.  Even something as
>>>>> boiler-plate as "refer to commit XXX for rationale" that can be
>>>>> copy-pasted into all the other commits is better than nothing,
>>>>> although a self-contained message is best.  Maybe:
>>>>>
>>>>> This patch is part of a series that moves towards a consistent use of
>>>>> g_assert_not_reached() rather than an ad hoc mix of different
>>>>> assertion mechanisms.
>>>>
>>>> Or summarize your cover letter:
>>>>
>>>> Use of assert(false) can trip spurious control flow warnings from some
>>>> versions of gcc:
>>>> https://lore.kernel.org/qemu-devel/54bb02a6-1b12-460a-97f6-3f478ef766c6@linaro.org/
>>>> Solve that by unifying the code base on g_assert_not_reached()
>>>> instead.
>>>>
>>>
>>> If using g_assert_not_reached() instead of assert(false) silences
>>> the warning about missing return value in such impossible to reach
>>> locations should we also be deleting the now-unnecessary "return"
>>> statements after g_assert_not_reached()?
>>
>> Although it's unlikely to be used on any compiler that can also
>> compile qemu, there is a third implementation of g_assert_not_reached
>> that does nothing, see:
>>
>> https://gitlab.gnome.org/GNOME/glib/-/blob/927683ebd94eb66c0d7868b77863f57ce9c5bc76/glib/gtestutils.h#L269
> 
> That's only in the #ifdef G_DISABLE_ASSERT case ... and we forbid that in
> QEMU, see osdep.h:
> 
> #ifdef G_DISABLE_ASSERT
> #error building with G_DISABLE_ASSERT is not supported
> #endif
> 
> So in QEMU, g_assert_not_reached() should always abort.
> 
>    Thomas
> 

Yes indeed.

For further information:

g_assert_not_reached() expand to g_assertion_message_expr(), [1]
which is a function marked noreturn [2][3], so indeed, it always abort.

[1] 
https://gitlab.gnome.org/GNOME/glib/-/blob/927683ebd94eb66c0d7868b77863f57ce9c5bc76/glib/gtestutils.h#L274
[2] 
https://gitlab.gnome.org/GNOME/glib/-/blob/927683ebd94eb66c0d7868b77863f57ce9c5bc76/glib/gtestutils.h#L592
[3] https://docs.gtk.org/glib/macros.html#compiler
