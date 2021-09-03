Received: by 2002:a19:5205:0:0:0:0:0 with SMTP id m5csp1485496lfb;
        Fri, 3 Sep 2021 10:09:51 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxQeXq3ZSTRiulp2xuTZli8udT0c4hal2ktA95H3824jEuwoCKrNh57NbcluEOxvvzybPr/
X-Received: by 2002:a05:6402:2551:: with SMTP id l17mr4667edb.242.1630688991269;
        Fri, 03 Sep 2021 10:09:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1630688991; cv=none;
        d=google.com; s=arc-20160816;
        b=WgUT+tXuA/X+pfNhfMw1tK0HEYFhyoPCMUO0bXkLmv9XiVGOneBWAGHI/KK8miyMz5
         Ah+lA5QVLFYgnQT6Q+GLhQhdPDjWbZbTrFw7p/ks0I2paXmKzjgWObTksZjSpog2d0DG
         dEbaV2NFF16bU1FPv8pm+buTJIwYVd5uOsyd4FmT2VxtLkuyMiZQ2cxDclQOU4tLLqfQ
         HyuOZ+/gWajktlEVwfP8Djm37uYBfAqlvnUe0f6/mn9fGSJzN9bFX2ZpLBzq73GqOLPK
         sj6t2nVn3GmGrVA2eUVWzinWOAvpOyXyrsrnaxpKe80AdvFMjniCnAOqRXedEJt4p//p
         XnhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :dkim-signature;
        bh=/Yk5Mkmp0VM67dSuNmhQd5hRlbMvQIpshO5Xo/MC910=;
        b=VL1F8ktE40c0zcX+iBh9/ZavCfCwfQcMSdPfT+7YeSKHk3sc8PntgQ35vikyq0arbs
         dm1uV16vlRGHJtaaqzMLCnemvNvDZtMX1uuk6q4d7l+I8vqGsxYrhQb7NrX4gKhrXFnC
         wRcr0xwZ8ERlO8rbYdT0EVE9kGZSVRP8hZAmC9bOcLNUtOUEINUJG/jqiUNJXiu2Fom5
         cCnPvwLBs7p2XHMrqPWSNSAM8dk+SvWjIdy2hK7HOzFqSzj0ZBczSG33tRBAz21CO1zl
         J0yb/3vFuqzJpJawdX/Ro5HP5md+vXZuqUjUNy6NT2LHaFOxw4Xmmhcx6R1J+Cpyi27+
         qrug==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=R6NRMW++;
       spf=pass (google.com: domain of philmd@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <philmd@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id p21si6129912ejn.229.2021.09.03.10.09.50
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 03 Sep 2021 10:09:51 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=R6NRMW++;
       spf=pass (google.com: domain of philmd@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1630688990;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/Yk5Mkmp0VM67dSuNmhQd5hRlbMvQIpshO5Xo/MC910=;
	b=R6NRMW++nZEmFONw55/wyEXgJdl6VmZVj6AUtLsdvgWZQIQBYiChEEf8f9aDGZyX9HtVaS
	uGbdmfI+7I5Qf+bms8gosi6pplc+jQnMUXLntf2ml8xg8qJ/n9HLhfL0bOwkTePuKC8U2j
	Mpp2kk22S6Z0IfhA6PPLQfRVmlPM/ro=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-484-QsuVDCvVMYyVJgk9Ij6-DA-1; Fri, 03 Sep 2021 13:09:47 -0400
X-MC-Unique: QsuVDCvVMYyVJgk9Ij6-DA-1
Received: by mail-wm1-f69.google.com with SMTP id j135-20020a1c238d000000b002e87aa95b5aso5960wmj.4
        for <alex.bennee@linaro.org>; Fri, 03 Sep 2021 10:09:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=/Yk5Mkmp0VM67dSuNmhQd5hRlbMvQIpshO5Xo/MC910=;
        b=EgMy15oqO9gNzoEnZISMuiUWGssL9hqtw09Lt3BeGLMjIU76NpPEpEUCfAepYujHFu
         zNz+y5qNPMtDEnLeH7IHc4zMZ6O6CZlTD6AZON9xxw3JSb8N9uxNeghIRvfB+8ckfBKK
         Kj3IWPm1nc0jVBbKy/SGDoUUCVwOVtTdKO/w6JBkLM/BEsN6NoXqthVGOc1bYtDLppb1
         0nnH0b/QlgO0oyW5BetxPJHb4HLAOjfhnp+QUl5z/vHdTLwHRHcDo2PVHHgLXVg+Xm7o
         8cLrSJdaX+Vz/RcBslnNqYFtCvMIGZChCbyvbfxYm4zmbwGgV108VpwkOAnQccE8NQQ/
         leeA==
X-Gm-Message-State: AOAM5329feC1GZS7dKNHy4zYe2gTWZMeHcQE9e7K+hFprpV87xGjcXpg
	YQg1YMx1sqLYfT7aLK31uWXBPSVmdFibH7OnNkcIscT4I3JpDWxhqxIEgojSGmYAA8FxTNI6R+e
	Xq1BuJEO/fAW+eEN6
X-Received: by 2002:a7b:c38a:: with SMTP id s10mr1411793wmj.109.1630688985876;
        Fri, 03 Sep 2021 10:09:45 -0700 (PDT)
X-Received: by 2002:a7b:c38a:: with SMTP id s10mr1411736wmj.109.1630688985659;
        Fri, 03 Sep 2021 10:09:45 -0700 (PDT)
Return-Path: <philmd@redhat.com>
Received: from [192.168.1.36] (21.red-83-52-55.dynamicip.rima-tde.net. [83.52.55.21])
        by smtp.gmail.com with ESMTPSA id o7sm4356404wmq.36.2021.09.03.10.09.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 Sep 2021 10:09:44 -0700 (PDT)
Subject: Re: [PATCH 02/28] glib-compat: Introduce g_memdup2() wrapper
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
Cc: qemu-devel@nongnu.org, Fam Zheng <fam@euphon.net>,
 Peter Maydell <peter.maydell@linaro.org>,
 Li Zhijian <lizhijian@cn.fujitsu.com>, "Michael S. Tsirkin"
 <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>,
 Yuval Shaia <yuval.shaia.ml@gmail.com>, Peter Xu <peterx@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Alexandre Iooss <erdnaxe@crans.org>,
 Eric Blake <eblake@redhat.com>, qemu-block@nongnu.org,
 Zhang Chen <chen.zhang@intel.com>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>, Helge Deller <deller@gmx.de>,
 David Hildenbrand <david@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 "Gonglei (Arei)" <arei.gonglei@huawei.com>, Stefan Weil <sw@weilnetz.de>,
 Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Michael Roth <michael.roth@amd.com>,
 Richard Henderson <richard.henderson@linaro.org>, Greg Kurz
 <groug@kaod.org>, Alex Williamson <alex.williamson@redhat.com>,
 qemu-arm@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 John Snow <jsnow@redhat.com>, David Gibson <david@gibson.dropbear.id.au>,
 Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Laurent Vivier <laurent@vivier.eu>, Shannon Zhao <shannon.zhaosl@gmail.com>,
 Hanna Reitz <hreitz@redhat.com>, qemu-ppc@nongnu.org,
 Igor Mammedov <imammedo@redhat.com>, Mahmoud Mandour <ma.mandourr@gmail.com>
References: <20210903110702.588291-1-philmd@redhat.com>
 <20210903110702.588291-3-philmd@redhat.com> <YTIEDKAgWGRt/I6y@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <3b9a88eb-f921-56c5-96ff-4a5fc77c190b@redhat.com>
Date: Fri, 3 Sep 2021 19:09:43 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <YTIEDKAgWGRt/I6y@redhat.com>
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: JGW7fnzZaDGR

On 9/3/21 1:16 PM, Daniel P. Berrangé wrote:
> On Fri, Sep 03, 2021 at 01:06:36PM +0200, Philippe Mathieu-Daudé wrote:
>> When experimenting raising GLIB_VERSION_MIN_REQUIRED to 2.68
>> (Fedora 34 provides GLib 2.68.1) we get:
>>
>>   hw/virtio/virtio-crypto.c:245:24: error: 'g_memdup' is deprecated: Use 'g_memdup2' instead [-Werror,-Wdeprecated-declarations]
>>   ...
>>
>> g_memdup() has been updated by g_memdup2() to fix eventual security
>> issues (size argument is 32-bit and could be truncated / wrapping).
>> GLib recommends to copy their static inline version of g_memdup2():
>> https://discourse.gnome.org/t/port-your-module-from-g-memdup-to-g-memdup2-now/5538
>>
>> Our glib-compat.h provides a comment explaining how to deal with
>> these deprecated declarations (see commit e71e8cc0355
>> "glib: enforce the minimum required version and warn about old APIs").
>>
>> Following this comment suggestion, implement the g_memdup2_qemu()
>> wrapper to g_memdup2(), and use the safer equivalent inlined when
>> we are using pre-2.68 GLib.
>>
>> Reported-by: Eric Blake <eblake@redhat.com>
>> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
>> ---
>>  include/glib-compat.h | 36 ++++++++++++++++++++++++++++++++++++
>>  1 file changed, 36 insertions(+)
>>
>> diff --git a/include/glib-compat.h b/include/glib-compat.h
>> index 9e95c888f54..6577d9ab393 100644
>> --- a/include/glib-compat.h
>> +++ b/include/glib-compat.h
>> @@ -68,6 +68,42 @@
>>   * without generating warnings.
>>   */
>>  
>> +/*
>> + * g_memdup2_qemu:
>> + * @mem: (nullable): the memory to copy.
>> + * @byte_size: the number of bytes to copy.
>> + *
>> + * Allocates @byte_size bytes of memory, and copies @byte_size bytes into it
>> + * from @mem. If @mem is %NULL it returns %NULL.
>> + *
>> + * This replaces g_memdup(), which was prone to integer overflows when
>> + * converting the argument from a #gsize to a #guint.
>> + *
>> + * This static inline version is a backport of the new public API from
>> + * GLib 2.68, kept internal to GLib for backport to older stable releases.
>> + * See https://gitlab.gnome.org/GNOME/glib/-/issues/2319.
>> + *
>> + * Returns: (nullable): a pointer to the newly-allocated copy of the memory,
>> + *          or %NULL if @mem is %NULL.
>> + */
>> +static inline gpointer g_memdup2_qemu(gconstpointer mem, gsize byte_size)
>> +{
>> +#if GLIB_CHECK_VERSION(2, 68, 0)
>> +    return g_memdup2(mem, byte_size);
>> +#else
>> +    gpointer new_mem;
>> +
>> +    if (mem && byte_size != 0) {
>> +        new_mem = g_malloc(byte_size);
>> +        memcpy(new_mem, mem, byte_size);
>> +    } else {
>> +        new_mem = NULL;
>> +    }
>> +
>> +    return new_mem;
>> +#endif
>> +}
> 
> Close, but you missed the final piece of the puzzle
> 
>    #define g_memdup2(a) g_memdup2_qemu(a)

Doh :/

> Such that in all following patches you can use the normal "g_memdup2"
> API. This means when we later update min glib, we just delete the
> compat code here, and the callers don't need updates.

Painful rebase in perspective...
