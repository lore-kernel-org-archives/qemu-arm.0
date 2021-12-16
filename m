Received: by 2002:a05:6214:3f4:0:0:0:0 with SMTP id cf20csp1710750qvb;
        Thu, 16 Dec 2021 10:39:16 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzbI1Ltq4UzOOqLzhyKd1KyxdYnUzSwpZxmR8isWFPHU/kn+rFAgbZPEOJh5wDSrE00fd4q
X-Received: by 2002:a17:906:9754:: with SMTP id o20mr16459721ejy.277.1639679956127;
        Thu, 16 Dec 2021 10:39:16 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1639679956; cv=none;
        d=google.com; s=arc-20160816;
        b=Vsnl/fN1yNlwFrrEMKWviJkxU5YIF89q0PLmimR2AHnv/FtmTaGDNN9iB/AJXT01q6
         MkFdWbbOywJocORF1BFIROXV8V+XN56N1soDXOqq/5PhEm/owN0wm16r7BXC55nTLI2w
         RZxhDohxZ/NZ73vi4UekTVPko9ZUNqdOr7XA7seViLym+sIBLUnBKrjyC2TV+b8JEZyS
         d1IRoRPashQ5RPoj0iJXe2mT4ETinNd2C+Nzv+xQoFYYRZe8Te9H8O8PAXbAsA+qkeLx
         E8U4uQ2bmHc0fYvLczDLbpu/5MozeC0LjcIjlYwOgfjZvqA8k79cYHVeec8ZIg/Ris/n
         1dNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=NfaU8TjKmM2SL5bUcLh7VXaP6O+RnGZA0udY5OpISrM=;
        b=WGdD8ZQnrE/CyWDp6s3RMBVVjaw4SzDIFPJnuv5joHsU0ZEEYuzwm228afMWVZm0ug
         3l+s4zEQ2egiBHWe8sekgjI797O0PqF6m+jpjkkaXVwvJIFk6qlGcKWfOG7iYqLizvJJ
         UNAvOCmaADKG8+12iSrN3xn8APyE6zAy5doyYQ/7wKvjFuR8J2llkaUAsl2a87azVvkq
         t91hPgBplFqQjnXZoqBkjRzAIHLJd+SaVFyH6cPIq4rExZWzgmQO8zeEbpcYqz4dTUFV
         XBfqbD1ufiUjLtgXaOlriGjjX0tB//473Nth/SrsoVZBkC5XXY6DpBtVRBlfPzGJjqhw
         PZ/Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Z8KT95Pz;
       spf=pass (google.com: domain of philmd@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <philmd@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id i8si3975204ejj.664.2021.12.16.10.39.15
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 16 Dec 2021 10:39:16 -0800 (PST)
Received-SPF: pass (google.com: domain of philmd@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Z8KT95Pz;
       spf=pass (google.com: domain of philmd@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1639679955;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=NfaU8TjKmM2SL5bUcLh7VXaP6O+RnGZA0udY5OpISrM=;
	b=Z8KT95PzAakXEswmsdXOuyu/EHNlVSsBG7rjaPqaAIyg1eDs+vfjOlgDIYsn5ieIcUBU2C
	LW3OSzYCoa1epOuiYkyQQGzda6TqbfMA480j2x3TTfqfBHOpxrgkFRZRFQmX78dfgqMutY
	CcSI5HHr0RiG1ZSjdVrAwzhdvL+ODEQ=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-630-RB8BNMpZNMmySB-PD2gxcA-1; Thu, 16 Dec 2021 13:39:08 -0500
X-MC-Unique: RB8BNMpZNMmySB-PD2gxcA-1
Received: by mail-wr1-f71.google.com with SMTP id q21-20020adfab15000000b001a24b36e47eso383705wrc.2
        for <alex.bennee@linaro.org>; Thu, 16 Dec 2021 10:39:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=NfaU8TjKmM2SL5bUcLh7VXaP6O+RnGZA0udY5OpISrM=;
        b=Y2MCJ0kiUmKTfI+F0c4h6TSg0dkwvEgMErEUvJ6uSf1gVoJPGFNkIqspDFFjQlXJmO
         gXd3H7sUBly9IqbyW+SYBfjIzVWHmKA9OaiFyrmvEb+6UWrmk9e6XaqVXXS+aKIc1KYP
         YUP+TInj6/7KFe2ZsixmmYRn8Jb3Bk5WMXb+vLeKRAWc1b869czNAh/138QghPtS1Xsi
         rwBm+Ri+yc6Rnr+AJ0FAGBdofoOYfy4Vo50eo4lcvgw1xBk8NFDv7WgzS/MgURCcdXSB
         W1SbvuUdCQ2V36UdcRIprsoLsdHm3CHgHvTg7mLdoJ4OZxzm/eYdGj/PqBMOySjdIrJL
         Eg9A==
X-Gm-Message-State: AOAM531+naECL5FEuBhfAG6pUVb8I9XdgeIg/p1rYrofCGlS+ENzfY6K
	kEFG9aMt7Pd5LFyxLs01xehsz3mE9wYEfChvtvhDK+xXGXwQG7BNMJDrtfXAr9MZM6ILyKnAdss
	9g3aqqwTgd1iMrlutShuXbypyHoUskqLEatFbPuCRhHv494l376Uu69NllEdCzduy7w==
X-Received: by 2002:a05:600c:4f0f:: with SMTP id l15mr6198350wmq.25.1639679947355;
        Thu, 16 Dec 2021 10:39:07 -0800 (PST)
X-Received: by 2002:a05:600c:4f0f:: with SMTP id l15mr6198302wmq.25.1639679947008;
        Thu, 16 Dec 2021 10:39:07 -0800 (PST)
Return-Path: <philmd@redhat.com>
Received: from [192.168.1.36] (174.red-83-50-185.dynamicip.rima-tde.net. [83.50.185.174])
        by smtp.gmail.com with ESMTPSA id o3sm6193100wri.103.2021.12.16.10.39.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Dec 2021 10:39:06 -0800 (PST)
Message-ID: <34bd86db-a213-bb3a-9c72-8c48bd138835@redhat.com>
Date: Thu, 16 Dec 2021 19:39:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH v3 02/28] glib-compat: Introduce g_memdup2() wrapper
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Eric Blake <eblake@redhat.com>, "Daniel P . Berrange" <berrange@redhat.com>
Cc: qemu-devel@nongnu.org, Laurent Vivier <lvivier@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 David Gibson <david@gibson.dropbear.id.au>, Kevin Wolf <kwolf@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Markus Armbruster <armbru@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Jason Wang <jasowang@redhat.com>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 David Hildenbrand <david@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 Eric Blake <eblake@redhat.com>, John Snow <jsnow@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 qemu-block@nongnu.org, qemu-ppc@nongnu.org,
 "Daniel P . Berrange" <berrange@redhat.com>
References: <20210903174510.751630-1-philmd@redhat.com>
 <20210903174510.751630-3-philmd@redhat.com> <875yrofxki.fsf@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
In-Reply-To: <875yrofxki.fsf@linaro.org>
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: WEWe63PxSSHs

On 12/16/21 15:11, Alex Bennée wrote:
> Philippe Mathieu-Daudé <philmd@redhat.com> writes:
> 
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
>>  include/glib-compat.h | 37 +++++++++++++++++++++++++++++++++++++
>>  1 file changed, 37 insertions(+)
>>
>> diff --git a/include/glib-compat.h b/include/glib-compat.h
>> index 9e95c888f54..8d01a8c01fb 100644
>> --- a/include/glib-compat.h
>> +++ b/include/glib-compat.h
>> @@ -68,6 +68,43 @@
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
>> +#define g_memdup2(m, s) g_memdup2_qemu(m, s)
>> +
> 
> As per our style wouldn't it make sense to just call it qemu_memdup(m,
> s)?

I followed the documentation in include/glib-compat.h:

/*
 * Note that because of the GLIB_VERSION_MAX_ALLOWED constant above,
allowing
 * use of functions from newer GLib via this compat header needs a little
 * trickery to prevent warnings being emitted.
 *
 * Consider a function from newer glib-X.Y that we want to use
 *
 *    int g_foo(const char *wibble)
 *
 * We must define a static inline function with the same signature that does
 * what we need, but with a "_qemu" suffix e.g.
 *
 * static inline void g_foo_qemu(const char *wibble)
 * {
 *     #if GLIB_CHECK_VERSION(X, Y, 0)
 *        g_foo(wibble)
 *     #else
 *        g_something_equivalent_in_older_glib(wibble);
 *     #endif
 * }
 *
 * The #pragma at the top of this file turns off -Wdeprecated-declarations,
 * ensuring this wrapper function impl doesn't trigger the compiler warning
 * about using too new glib APIs. Finally we can do
 *
 *   #define g_foo(a) g_foo_qemu(a)
 *
 * So now the code elsewhere in QEMU, which *does* have the
 * -Wdeprecated-declarations warning active, can call g_foo(...) as normal,
 * without generating warnings.
 */

which is how g_unix_get_passwd_entry_qemu() is implemented.

Should we reword the documentation first?
