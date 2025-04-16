Received: by 2002:a17:504:14cd:b0:1be9:327d:8ee3 with SMTP id g13csp3211969njc;
        Wed, 16 Apr 2025 02:36:01 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUv/arcX3jTnjP4KlXMnVaZI6wEjwym1ol3UnaoRVj+UIzR1/zFH1Y5MizQW9s8TdXqz7GzkJdIq24w/g==@linaro.org
X-Received: by 2002:a5d:47cb:0:b0:39a:ca0c:fb0c with SMTP id ffacd0b85a97d-39ee5b2f72emr1054883f8f.28.1744796161579;
        Wed, 16 Apr 2025 02:36:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1744796161; cv=none;
        d=google.com; s=arc-20240605;
        b=GirxOB0kSvkdFrvEJzq0t1iimZtMKE2vfbSGIeC5LTNNIN/QkQMcMhDX4Bb3Fr4Lx0
         KjniI6idHooTgBf7QYj4luZfv4eS7RLHbjRSXFWWWEizIQeUmM3b7VMJ8Xc4lmwXY+rd
         r9ndd7R/4jkIAid7NA3md9pLYzBxy41wh/j8BAtMsXsMwAKsMOeGyNO//jmeQTTlWsrk
         /SRPwXt4cl/fVLw4oluGibGkaggRTom5MplreNG5LHiJ/DN1Jl36XME5Yw+OapOpmjH+
         3XjYpMSEqw6YkiTQPcN392aQ+4p58w+IOfC3ZM0dm1MopLkLwHd21Pra55qfbMs63sAr
         a+Kw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=DnxaTuzWKbmI0tBX7V/dU39soBvmDZfRJhecr7WdrQ0=;
        fh=helDCwX2LVr1N+B4cDoXqR1bnYkCB7yqlmnCy7EbNW4=;
        b=idfzUWhXzLq5NGlI/olNI3DtxirphEC0GK9PQTLs26ah4tA/I/JvSZ4jqkS3WD0GMt
         p2iZXtT+RaEZjxbz4rNU/bwInWEOdOvPzNNn/BQoHBkMmV5uHFyaML3bZPLtf7dEbIOq
         UB515tdjMy7RGPj2sBPcAD+gbuqpYSBjA7abJqFN8on3hon47iN5Z4WWIWnTdkSJ3NBQ
         5bG32tn75Jnsz8ZyZYya0yA0sMA8BCdWwM7wDaZdQq1dJApe3mwX9ewAS3Q60/YBmkRc
         YUdm/5DmZQPlU7w9Wue4smHqRiJprr1RKG/QoGTSF0eIJ6P4JwMTNhQxqviKzWOFEYNA
         boUw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=BmZhDzfp;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id ffacd0b85a97d-39d893fde44sor4817636f8f.9.2025.04.16.02.36.01
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 16 Apr 2025 02:36:01 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=BmZhDzfp;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744796161; x=1745400961; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=DnxaTuzWKbmI0tBX7V/dU39soBvmDZfRJhecr7WdrQ0=;
        b=BmZhDzfp6BigUaksVpeewaEzCYWsAgmp3jpVHUQ1u3ICQR7uy85byQgGMiWCBIZAnj
         e78gn6QjGhfEJY2SIHgD0+SPuhf2wOEIFEsUURAQ1rlOa7B8T/vaE8vRHujqDefMYS6N
         nlhlT3HVcx1nn7VBKlST7uC6udVCegipGzzJVa11Z/Zx90SyXPRx5G5xN/yfMsJYAv1l
         vrDsba7uWqjuiopF/q8q5O/3cSFi+Sz8Fsz5fXO7CpI/6ct0257DsDs1UGb+FN4ZTTqo
         wMgy0XpHDfCeFNnzx8UdQjIrdWGk9MtmAs9cnylERxWsuc79CDpJwMMOWtLmrmGEHrW4
         V4Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744796161; x=1745400961;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DnxaTuzWKbmI0tBX7V/dU39soBvmDZfRJhecr7WdrQ0=;
        b=hjIASkgO1BcVfTmCwZtb+ZplSgEqyH7bxJ93gf6HfXtwptHu0MK/Hb3gj8OkkwBf2t
         r7QxkUP+MJOuQUtGRANn/kL3Crvzz47ay0/+iK70QFSE9wrKWt+yCnsFHS2ldYSyuRbI
         yxZX5TZjbP9oeJWqqBb6Wdc7IqwJSdy+A61oXixL9z3yXZonUcJqZGRhgmsdfRRJKnoD
         C2iSMupaFT24Naj39FBEHMjbrKb5O/qm+ut6OlOYFVbisFrgSzSm9Sepx2wy/ALUaXdp
         prb3rhLg0CLcf0PVLwMskGKNyM0NpV5YikYge8SMwnfUwCGgOmwH5nfnZ/7sURS+Jnwf
         vg9g==
X-Forwarded-Encrypted: i=1; AJvYcCWmsWtDllApeKdv4TBn8jVFRmo7KYJZTs1myjz92C/guDidzUsxtjG7HWdtdtDHAQkA7dNyBtfeX/28oA==@linaro.org
X-Gm-Message-State: AOJu0YzvKlGzFni1ENtnfB3QgYBv7rHiup4yu+xxqap9hAVUpb5WCIDx
	lv0Hd62j0GzWr56Y0mguLgclTM/fhCmCW53th1TinDTNmQvMHB0nV43R9z0vYBwj4A==
X-Gm-Gg: ASbGncsSAiWSPjNk807IkRhyKB9DtJad24bbwj9KNscHkBsTnGZrG3S0/AoYdfvni6B
	cRgdSaup4BcVUutxAcudMXuOt3lmv2Z10NaZIC0e1V5BxWPfzNxF5bTOL8idftj3lLKQt3cVGEo
	Bbu2qDcX2xEDwFcmvbi7Az1SKlvMpL+XnFiDvWIxD1jUz3Di2z4J89YYBXUoFUSLyeuN3LoitWY
	rOnzrF7MpJDOILfGE2hcPhNm1O4DG3ComXWCVNo0kcslqvC3bssu7pC47W0qfaGVkd3pDX1Ljeh
	jYONuBzuraIrOnAJlNO3nTizGPhg+dndzyT25pE7kCZSaZfTGsuN+JOwagKmRLj904lkaO4ZiPP
	6q1MiOSlo02tHHg==
X-Google-Smtp-Source: AGHT+IFhivAOHEHiFLZmy1rwnSXmnOTE6P6GAUFXOKhw/QY3L8LbSgNiBiKnqXUX58O1KMTWuzNArQ==
X-Received: by 2002:a05:6000:1867:b0:38d:dd52:1b5d with SMTP id ffacd0b85a97d-39ee5b1307amr1003288f8f.4.1744796160938;
        Wed, 16 Apr 2025 02:36:00 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from [192.168.69.176] (88-187-86-199.subs.proxad.net. [88.187.86.199])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4405b5abc3fsm15676865e9.37.2025.04.16.02.35.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Apr 2025 02:36:00 -0700 (PDT)
Message-ID: <3b661309-904f-4670-b5c4-d537a4745c20@linaro.org>
Date: Wed, 16 Apr 2025 11:35:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 01/19] hw/core/loader.c: Fix type conflict of GLib
 function pointers
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 Kohei Tokunaga <ktokunaga.mail@gmail.com>
Cc: qemu-devel@nongnu.org, =?UTF-8?Q?Alex_Benn=C3=A9e?=
 <alex.bennee@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Alexandre Iooss <erdnaxe@crans.org>,
 Mahmoud Mandour <ma.mandourr@gmail.com>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>,
 Pavel Pisa <pisa@cmp.felk.cvut.cz>,
 Francisco Iglesias <francisco.iglesias@amd.com>,
 Vikram Garhwal <vikram.garhwal@bytedance.com>,
 Jason Wang <jasowang@redhat.com>,
 =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>,
 Peter Maydell <peter.maydell@linaro.org>, Zhao Liu <zhao1.liu@intel.com>,
 Nicholas Piggin <npiggin@gmail.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 David Hildenbrand <david@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Ilya Leoshkevich <iii@linux.ibm.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 qemu-block@nongnu.org, qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
 qemu-s390x@nongnu.org
References: <cover.1744787186.git.ktokunaga.mail@gmail.com>
 <44e9ef95ea6e8aa33560ca8580db0033623f0e91.1744787186.git.ktokunaga.mail@gmail.com>
 <Z_9qIQhjsI5zOwXA@redhat.com>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <Z_9qIQhjsI5zOwXA@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: 7+fxAuJZRz5J

On 16/4/25 10:28, Daniel P. Berrangé wrote:
> On Wed, Apr 16, 2025 at 05:14:06PM +0900, Kohei Tokunaga wrote:
>> On emscripten, function pointer casts can cause function call failure.
>> This commit fixes the function definition to match to the type of the
>> function call using g_list_sort_with_data.
>>
>> Signed-off-by: Kohei Tokunaga <ktokunaga.mail@gmail.com>
>> ---
>>   hw/core/loader.c | 4 ++--
>>   1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/hw/core/loader.c b/hw/core/loader.c
>> index 2e35f0aa90..93a8b45d28 100644
>> --- a/hw/core/loader.c
>> +++ b/hw/core/loader.c
>> @@ -1410,7 +1410,7 @@ typedef struct RomSec {
>>    * work, but this way saves a little work later by avoiding
>>    * dealing with "gaps" of 0 length.
>>    */
>> -static gint sort_secs(gconstpointer a, gconstpointer b)
>> +static gint sort_secs(gconstpointer a, gconstpointer b, gpointer d)
>>   {
>>       RomSec *ra = (RomSec *) a;
>>       RomSec *rb = (RomSec *) b;
>> @@ -1463,7 +1463,7 @@ RomGap rom_find_largest_gap_between(hwaddr base, size_t size)
>>       /* sentinel */
>>       secs = add_romsec_to_list(secs, base + size, 1);
>>   
>> -    secs = g_list_sort(secs, sort_secs);
>> +    secs = g_list_sort_with_data(secs, sort_secs, NULL);
> 
> I don't see what the problem is with the original code.

IIUC the rationale is in patch #10 where Kohei poisons g_list_sort():

   On emscripten, function pointer casts can cause function call
   failure. g_list_sort and g_slist_sort performs this internally
   so can't be used on Emscripten. Instead, g_list_sort_with_data
   and g_slist_sort_with_data should be used.

> 
> The commit message says we have a bad function cast, but the original
> method decl is
> 
>    GList *g_list_sort(GList*list, GCompareFunc compare_func);
> 
> where the callback is
> 
>     typedef gint (*GCompareFunc)(gconstpointer a, gconstpointer b);
> 
> Our code complies with that GCompareFunc signature.
> 
> For comparison the new code uses:
> 
>    GList *g_list_sort_with_data(GList *list, GCompareDataFunc  compare_func, gpointer user_data);
> 
> where the callback is
> 
>    typedef gint (*GCompareDataFunc)(gconstpointer a, gconstpointer b, gpointer user_data);
> 
> which the new code complies with, but it is undesirable since we
> have no use for the data parameter.
> 
> With regards,
> Daniel
