Received: by 2002:a19:5205:0:0:0:0:0 with SMTP id m5csp1672711lfb;
        Fri, 3 Sep 2021 14:14:58 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzctFqniTQy5N8rSag0pXgYfiUbqkFhbqV8eQpjF5QsSG0bU3Z7+xBe0xmWb9KpvxP4gBbs
X-Received: by 2002:a05:6402:959:: with SMTP id h25mr919307edz.283.1630703698777;
        Fri, 03 Sep 2021 14:14:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1630703698; cv=none;
        d=google.com; s=arc-20160816;
        b=VUrav8/AOq7+phB1mJifm7H1WiMDQuk3ayxjcxmdCpFRGSeEXXZwaWV2AhPLyWkptk
         p+SAwW70t5vVfk3cR/oGvkAbJyf3FTj8VaAZXk658t2SlF4JRHyA956ycSpmWeKmmN+h
         9QQeAQD7lKIx0fZaWxOQz9sERFbNB8A2jb1u2utfPtd+ene+WKarYu7JqpWNYn2aUz/q
         uaaJEeSGZD2stYsoG4DdISwMzR7+2kDd+lD6uIgwV1Pn5nRsJaqxQyZqsRzJ1sJ/QZXc
         rOeNkCF78zeqaA/CWPWQLDc8j5kM0PjCPkov3Q958trMpMUrJdetUrMrR3VeZ+csgSOM
         xy1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :dkim-signature;
        bh=pKKjhL+HpQ6aSK5Mve6G6r1C/eZqCFc4GZy7hYfLCYg=;
        b=MM6nM3RkIMxFYQsl04uuiwF+FjnV4Fwa+GfxSsPP23LkdWziVdPUY0wWMc0KS2Bi5X
         VKF0z9DXCnC363CUCx/AJ74m1bm5mewoS75BuFBTgHp11z/df2bDH7ek9kfXUPBgTGS/
         Kmmbmtg+j+z4MhN8u1CbTpm2LyIICVBSSNm7dFgCT4MTR/TTwv9o0xSow5k29S94JZfK
         vXEzFAuM198G0jj/rKaLeQcF5BUjuLeGvJj0vMkEOvka1+MoR52KRPc5j249cQSfXjuv
         0xnp7asQCsEubxYrHW0rENswPJMhji/0oXTpzFaxi9peCmSxXZE1Ud2+h9YNFjQuZNPs
         E1hg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=BG3P88gq;
       spf=pass (google.com: domain of philmd@redhat.com designates 216.205.24.124 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <philmd@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [216.205.24.124])
        by mx.google.com with ESMTPS id t6si559457edd.81.2021.09.03.14.14.58
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 03 Sep 2021 14:14:58 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@redhat.com designates 216.205.24.124 as permitted sender) client-ip=216.205.24.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=BG3P88gq;
       spf=pass (google.com: domain of philmd@redhat.com designates 216.205.24.124 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1630703697;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=pKKjhL+HpQ6aSK5Mve6G6r1C/eZqCFc4GZy7hYfLCYg=;
	b=BG3P88gqTzUszN04krEUzVt0W5x0LEMQkH9Ru3K9bOyuPM2sIXUzbgB6LcW23kziPhrHHb
	T7775LhxxYreTZXgzjbZ2Bq2hw2I5mq1bC4cLbTjaLxL779kfqMpHjQyIUQ00PaoeMNGdt
	u9aaBVICcNlrDe8DtFMXNlOXQF/W0e0=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-267-raUW4idoP0iUamoXWAXZ_w-1; Fri, 03 Sep 2021 17:14:54 -0400
X-MC-Unique: raUW4idoP0iUamoXWAXZ_w-1
Received: by mail-wm1-f71.google.com with SMTP id h1-20020a05600c350100b002e751bf6733so199091wmq.8
        for <alex.bennee@linaro.org>; Fri, 03 Sep 2021 14:14:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=pKKjhL+HpQ6aSK5Mve6G6r1C/eZqCFc4GZy7hYfLCYg=;
        b=dnMY11ApMfAs7rT0SBYR4YLDO5gpCChUMf5rC8la8dShAbTMYOFt1hzo0j8wLtxdd/
         PjFALpro0CZfPPaK7H1m6h3BPXTTVpId0fFZ7c8vYCTar2u8zqTmNDEzo7dzoIRFooKv
         9LcP6ymTT1uym3Kz9ItuzQc6Tc3ibL6Do0Xt9YSuasBB7NM29aa86hxKZ9Exm7uGg9j9
         qKk7JM1QvW4U3Zd72rCUPDALlSRuWPjfORWgpyiGaNPHshoXEJANp1h0s59zYjiDysQ0
         ENzj2/t/DX/4pTMLPBg3jnQ3iNL9lkrSD6hE7mTFTNsaBg4eo7KyQ/KiwR42c+2ZkcVJ
         odkw==
X-Gm-Message-State: AOAM530BWW73yyzseeDeVPhLWld3BPyDFRtvV7d4t4fcuOl8eSoFFlDz
	HSvlNw1mzbHuYMWTCMuZeZ1j1g/2FmW2q278dELj7iBjIxZL3+fWE4HL2lM87VPQBI1XDmzlip6
	uaYPUTXwds4NA+5gb
X-Received: by 2002:a05:6000:160f:: with SMTP id u15mr1003545wrb.166.1630703693410;
        Fri, 03 Sep 2021 14:14:53 -0700 (PDT)
X-Received: by 2002:a05:6000:160f:: with SMTP id u15mr1003522wrb.166.1630703693236;
        Fri, 03 Sep 2021 14:14:53 -0700 (PDT)
Return-Path: <philmd@redhat.com>
Received: from [192.168.1.36] (21.red-83-52-55.dynamicip.rima-tde.net. [83.52.55.21])
        by smtp.gmail.com with ESMTPSA id y4sm394108wmi.22.2021.09.03.14.14.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 Sep 2021 14:14:52 -0700 (PDT)
Subject: Re: [PATCH v3 05/28] block/qcow2-bitmap: Replace g_memdup() by
 g_memdup2()
To: Eric Blake <eblake@redhat.com>
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
 John Snow <jsnow@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Hanna Reitz <hreitz@redhat.com>, qemu-block@nongnu.org, qemu-ppc@nongnu.org,
 "Daniel P . Berrange" <berrange@redhat.com>
References: <20210903174510.751630-1-philmd@redhat.com>
 <20210903174510.751630-6-philmd@redhat.com>
 <20210903211322.n5isnkxin6jlkxrf@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <51de5796-3137-6ac3-c935-eb097fc4ca45@redhat.com>
Date: Fri, 3 Sep 2021 23:14:51 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210903211322.n5isnkxin6jlkxrf@redhat.com>
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: HRf5XtqdAdwF

On 9/3/21 11:13 PM, Eric Blake wrote:
> On Fri, Sep 03, 2021 at 07:44:47PM +0200, Philippe Mathieu-Daudé wrote:
>> Per https://discourse.gnome.org/t/port-your-module-from-g-memdup-to-g-memdup2-now/5538
>>
>>   The old API took the size of the memory to duplicate as a guint,
>>   whereas most memory functions take memory sizes as a gsize. This
>>   made it easy to accidentally pass a gsize to g_memdup(). For large
>>   values, that would lead to a silent truncation of the size from 64
>>   to 32 bits, and result in a heap area being returned which is
>>   significantly smaller than what the caller expects. This can likely
>>   be exploited in various modules to cause a heap buffer overflow.
>>
>> Replace g_memdup() by the safer g_memdup2() wrapper.
>>
>> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
>> ---
>>  block/qcow2-bitmap.c | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/block/qcow2-bitmap.c b/block/qcow2-bitmap.c
>> index 8fb47315515..218a0dc712a 100644
>> --- a/block/qcow2-bitmap.c
>> +++ b/block/qcow2-bitmap.c
>> @@ -1599,7 +1599,7 @@ bool qcow2_store_persistent_dirty_bitmaps(BlockDriverState *bs,
>>                             name);
>>                  goto fail;
>>              }
>> -            tb = g_memdup(&bm->table, sizeof(bm->table));
>> +            tb = g_memdup2(&bm->table, sizeof(bm->table));
> 
> Trivially safe.  It might be worth a comment in the various commit
> messages for which patches are trivially safe (because the argument
> was directly from sizeof), and which would require a larger audit of
> callers to see if we had any (unlikely) bug (such as patch 3/28).

Yes, will do.

> Reviewed-by: Eric Blake <eblake@redhat.com>

Thanks!
