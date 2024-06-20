Received: by 2002:a17:907:60c:b0:a6f:8e2c:4d9d with SMTP id wp12csp2110941ejb;
        Thu, 20 Jun 2024 10:15:16 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGwz3js7NEjIS/jivsJ6RvCQKM3LUJ0IFcPcwuQw/4eeyymQNTFnKJ3vLt+nF7YRPB9pXZZ
X-Received: by 2002:a05:620a:2585:b0:795:5070:e559 with SMTP id af79cd13be357-79bb3ee24fdmr635423585a.72.1718903716420;
        Thu, 20 Jun 2024 10:15:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1718903716; cv=none;
        d=google.com; s=arc-20160816;
        b=CEqzlfmABtXwyy94uemgS9t4GhRQSzYBnzJg8RHNxubphBgrEa9gE3Lx32S8L5sLfm
         WoWXLJVLSl3i3LRvZKB4APtpXdJzjSf2LT9mkkrioNt1KE8DVvNVt4vPDyKMeFH5+aHW
         zWnvkskr37SCT6q7AN3zPZBBAXDMn/JEpJY6mMUwB5xwO220Lu3QG4FWFGb2CFKDKc6v
         ywviLIBTvHL2G5iUm1nMY8qKBMq+BNaM1s4xN2Eop+nZNxU4MahVxm5855+w1aaZAjhZ
         PDB2jnwDxK6Q4+W4dTPk4dN7zHTXPUbpMQrI+RjZ7abw6HIqwzp6C/Sq65mFJbJ47XcE
         51/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:autocrypt
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:dkim-signature;
        bh=cvReVOaxMOcLfFk/GJhrVgAzazDhgpmW/4bz55GggPg=;
        fh=5VOOsMvPo6UW0ZskeugOsB3QuyBDVdsofqJXfDllUd4=;
        b=RscgP3Kwrm/XiN72bhIKiFXvAu8ME6k8Nom9XY2B0wEwtKNtebgtT3P35/6eKsb5xp
         xHNAoUBzPP1vt4obihsMiR11DconffDLiHQJX80H2VvOYHR1pCw2ZfgeZhCKJoJQf5BD
         c0EtXQaXjIUaiolOWspESdjVWYUkz2uV7dJ0pPYSICI64AIq9S9QFsm8vRDVJNyMc2Xa
         ammE0UEnMg73NJVw1EpJ0YW6hELjkyujdNhDvE5kjJZro6UA/U5L4tw7aGqVFSqwnNi8
         51P5u90oFXqTGi30geKILdhUJKC2m9klu9cQt1PyLX544jQmLQqZIwLi9tDqOeoQI2Y7
         VsiA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="DuKt+x/P";
       spf=pass (google.com: domain of thuth@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <thuth@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id d75a77b69052e-4434bf21f4csi134916391cf.491.2024.06.20.10.15.15
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Jun 2024 10:15:16 -0700 (PDT)
Received-SPF: pass (google.com: domain of thuth@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="DuKt+x/P";
       spf=pass (google.com: domain of thuth@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1718903715;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=cvReVOaxMOcLfFk/GJhrVgAzazDhgpmW/4bz55GggPg=;
	b=DuKt+x/PL+J8nGXGWx6aolwKlGmySkIGn6o5QFVOEvYbVsPQVBQUxK2ryxV2x5rlxFlloB
	W7XwgniXsxBd/47p3k6ZDTw049kWGULu1r+sCYa4PXDQLpsoLplIfLY9PEFmsFEc4iFokk
	8TyZaMMA2Hp7pH7gJ+GWyCZCyXUMIB8=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-394-Pjxn61DtNwOgwfbwizgvXw-1; Thu, 20 Jun 2024 13:15:12 -0400
X-MC-Unique: Pjxn61DtNwOgwfbwizgvXw-1
Received: by mail-ed1-f72.google.com with SMTP id 4fb4d7f45d1cf-57c6e28b151so643415a12.2
        for <alex.bennee@linaro.org>; Thu, 20 Jun 2024 10:15:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718903711; x=1719508511;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cvReVOaxMOcLfFk/GJhrVgAzazDhgpmW/4bz55GggPg=;
        b=hKaxkG1hBVWWkAjw/gF+aWilUw+9eYfTN43pXpgJcHnmkaktMPesX8Xe/rPDnpN0GU
         OcEYgNyGjDNSyMe8ATlfM5a2UYWVJ4SSKL2ITnu6YZ/LszwytRGH7caGeRmcmoQ1RKnS
         ySmFSUSCbU4gv33Yey9mTZ9o1UIMlpQe3ILbYQNouuAzNTXD6UmuJM0X8IHR7AgP6Fp6
         hFUDln0RKvLt7fGCQCX/W7nGcRgtqOJHa7dGB8UfZj+lS0M0Igc+1YOHAQTOJjA2fP9j
         Ufc+h+tHuLbcE6Pmf8wJL9hMWAXQty+6OY5s8uM/twhzp4yuYjO63zyX95OReXV5i13t
         LyCg==
X-Gm-Message-State: AOJu0YxffEp5XyeWKkHfL7AaqtfiugRwZaHVvR8dJbYuhttFiig5JfOv
	hF7q/C8Za5DnaaICVbf0OXHg4azz3iP86Ii8HgOIXh0Iw+fb/2jzqZCXTg3LuEyO4I9L3YDNoGd
	GaUsafQCSuEac+D1Y1R++79BF+vXwjydmBcUcCpiybfcAKb9uEYBZpI/r04rxOoaHtKXWpsSpQS
	k51mwGQPsVnKbURgnaC2K7ONNoboYi6LHWbA==
X-Received: by 2002:a17:906:f902:b0:a6e:feb5:148e with SMTP id a640c23a62f3a-a6fab6171f0mr366336966b.27.1718903711193;
        Thu, 20 Jun 2024 10:15:11 -0700 (PDT)
X-Received: by 2002:a17:906:f902:b0:a6e:feb5:148e with SMTP id a640c23a62f3a-a6fab6171f0mr366332666b.27.1718903710718;
        Thu, 20 Jun 2024 10:15:10 -0700 (PDT)
Return-Path: <thuth@redhat.com>
Received: from [192.168.0.4] (ip-109-43-178-117.web.vodafone.de. [109.43.178.117])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a6f57b5e7b2sm782086066b.68.2024.06.20.10.15.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 20 Jun 2024 10:15:10 -0700 (PDT)
Message-ID: <de6a283f-7da8-4d2f-b2ea-9a3c12e754e4@redhat.com>
Date: Thu, 20 Jun 2024 19:15:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 09/12] plugins: add migration blocker
To: =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, kvm@vger.kernel.org,
 qemu-ppc@nongnu.org, Christian Borntraeger <borntraeger@linux.ibm.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Jamie Iles <quic_jiles@quicinc.com>,
 David Hildenbrand <david@redhat.com>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>,
 Mark Burton <mburton@qti.qualcomm.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>, qemu-arm@nongnu.org,
 Laurent Vivier <lvivier@redhat.com>, Alexander Graf <agraf@csgraf.de>,
 Ilya Leoshkevich <iii@linux.ibm.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Marco Liebel <mliebel@qti.qualcomm.com>, Halil Pasic <pasic@linux.ibm.com>,
 qemu-s390x@nongnu.org, Cameron Esfahani <dirty@apple.com>,
 Alexandre Iooss <erdnaxe@crans.org>, Nicholas Piggin <npiggin@gmail.com>,
 Roman Bolshakov <rbolshakov@ddn.com>,
 "Dr. David Alan Gilbert" <dave@treblig.org>,
 Marcelo Tosatti <mtosatti@redhat.com>,
 Mahmoud Mandour <ma.mandourr@gmail.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
References: <20240620152220.2192768-1-alex.bennee@linaro.org>
 <20240620152220.2192768-10-alex.bennee@linaro.org>
From: Thomas Huth <thuth@redhat.com>
Autocrypt: addr=thuth@redhat.com; keydata=
 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
In-Reply-To: <20240620152220.2192768-10-alex.bennee@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: FcAFnh0IPJiP

On 20/06/2024 17.22, Alex Bennée wrote:
> If the plugin in controlling time there is some state that might be
> missing from the plugin tracking it. Migration is unlikely to work in
> this case so lets put a migration blocker in to let the user know if
> they try.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> Suggested-by: "Dr. David Alan Gilbert" <dave@treblig.org>
> ---
>   plugins/api.c | 8 ++++++++
>   1 file changed, 8 insertions(+)
> 
> diff --git a/plugins/api.c b/plugins/api.c
> index 4431a0ea7e..c4239153af 100644
> --- a/plugins/api.c
> +++ b/plugins/api.c
> @@ -47,6 +47,8 @@
>   #include "disas/disas.h"
>   #include "plugin.h"
>   #ifndef CONFIG_USER_ONLY
> +#include "qapi/error.h"
> +#include "migration/blocker.h"
>   #include "exec/ram_addr.h"
>   #include "qemu/plugin-memory.h"
>   #include "hw/boards.h"
> @@ -589,11 +591,17 @@ uint64_t qemu_plugin_u64_sum(qemu_plugin_u64 entry)
>    * Time control
>    */
>   static bool has_control;
> +Error *migration_blocker;
>   
>   const void *qemu_plugin_request_time_control(void)
>   {
>       if (!has_control) {
>           has_control = true;
> +#ifdef CONFIG_SOFTMMU
> +        error_setg(&migration_blocker,
> +                   "TCG plugin time control does not support migration");
> +        migrate_add_blocker(&migration_blocker, NULL);
> +#endif
>           return &has_control;
>       }
>       return NULL;

Reviewed-by: Thomas Huth <thuth@redhat.com>
