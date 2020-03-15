Received: by 2002:a19:f015:0:0:0:0:0 with SMTP id p21csp2096421lfc;
        Sun, 15 Mar 2020 12:40:33 -0700 (PDT)
X-Received: by 2002:a62:1513:: with SMTP id 19mr24619300pfv.85.1584301233287;
        Sun, 15 Mar 2020 12:40:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1584301233; cv=none;
        d=google.com; s=arc-20160816;
        b=sa4+N9ThsnWj9DK/8JnH1GYqV+QvVrgYe/eg+tPAPnR5mYpTFE6QivabMOtFZvKr+8
         zad/QkQykta1fYR1meEI9DqaNyWF/EI+ualfNh7Pal6okWzqcQc+i/kiG492+X+R3EI8
         OED7Og3hCmCnJvV7uR/fw0Vt4KX8ThIxw5uCt7Hta0WaA04mOlwiku+Jk2Q2YO93D8N1
         RcdmNqKeQhzr6ChjfDecBDrCIjAADWVcS5aQgNvnGfclz1S5IVyQYfbyHcWZE+nWSsld
         UVLsd9scG7N+hVETbplVWrtIV5DdzlGoUBsieFbVvAJcuFuyBk5QTz7iI60D4YctTXHA
         zZsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :dkim-signature;
        bh=rWBBelztWn3l+5B9ii97cqEND3HA6vz9gtBRsg/4GDk=;
        b=jwrC2NWRYYQxkCbRKk9h41zW3fVcZ6UxCLKhxqD0WvnzAnESU66lkN/+UH0dM5aCUF
         h6R7A9e9AFIv5H+Nw0X8VVV/Hr5wY4Ly9BKznjG40qJa1xy+DCowR6MLTE7a2FzvShS8
         nP+dEFgxRGpUkBESTO2mLsq5oJyZD3W9YE+rfhg77rrXfxGEM3YeD5cOmyzwFkX9Ugfv
         JHXjMCkXBB7cFM1CKvOFrANnKqoPe0oiSx7SpzP5pK4kAk/eDhG6kw5e0nix5ub21F00
         D/8kH0n9wIozPEmbEOm5rc0nVnWRTv3sPMzHLDJVVmc77bgkIXGlZbRbAQ+pyhCgHOzz
         jr5A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ac2Gpel3;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id u9sor15968449pjb.18.2020.03.15.12.40.33
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Sun, 15 Mar 2020 12:40:33 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ac2Gpel3;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=rWBBelztWn3l+5B9ii97cqEND3HA6vz9gtBRsg/4GDk=;
        b=ac2Gpel3xEJzjwabmHZif3J9mt9XgySciaQaRRBNrLq1iaaa3p9AKh5ZySm1pAY+Wp
         7WuKXI64uAFvtSkL5C5WMOU0SXkBEUSSjegxl9b+nKzqmfdNTORVxSH5t0+yjClmSp7W
         Tz2PrmPeQyvdCA36I6k/2Mcx3LO2c3duap5dCHTioRCJ4dKMKAO0p0dS8HHA9UJRElnF
         aT12x/VChm/7HI0GkzHeDaeyw0FiduEbnhJOq+o/FKUyuR//GmSpojfS+nWJPpDspKn8
         QxXseEw2BdchnUilkPznxWU+QuvOiusmC+9reybUUqly+PVtym2oHdmPZHHdTtvSEfdy
         OxSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=rWBBelztWn3l+5B9ii97cqEND3HA6vz9gtBRsg/4GDk=;
        b=giVxhMKZothVe5beJT9NOSnT9+JSELpvOuRNdATfba5VlUNID6Dir5dlnpxgtIHOVh
         khyi8e1R4TKY+hihsSFfWHk+FA+ri4//QzTCacnSIRkdWp15L0hqFBLnTPYx+beMbXam
         aZ7PHj3AusnoPfIKSJDtUyKYE7rZJKBRmNIedJRMfEH8j4/aXhU1bi9855daQ1f57srw
         RJ7XE7xllhE6LWtpoGXddrGI98tdaAL6lEWw+Dc6XKYcXEvWpRibHw9sxG/iTczvhAh7
         bDRi4GPkm/pI2dItS5TT/lUQ9BI8Y5jShg41FHjn7O8zpgJHOaeYkY52eXdWrBmgW5Qo
         ipjg==
X-Gm-Message-State: ANhLgQ1XgmAqRobGojFM4+cxy7QDfTgAE6mm9dGAdOPJxvjexEFShrdt
	l2+z+h9E2XrA4rMqLhMKANh8H3dN
X-Google-Smtp-Source: ADFU+vuMK7+04gVLvdHhAT2GvWb0irP3tImbd3yniMzCLD0R01olHGsz5yWjP1wd6/UMp1F5aiO4Dg==
X-Received: by 2002:a17:90a:a385:: with SMTP id x5mr22056292pjp.102.1584301232723;
        Sun, 15 Mar 2020 12:40:32 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from [192.168.1.11] (97-126-123-70.tukw.qwest.net. [97.126.123.70])
        by smtp.gmail.com with ESMTPSA id m1sm13078527pjl.38.2020.03.15.12.40.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 15 Mar 2020 12:40:31 -0700 (PDT)
Subject: Re: [PATCH 01/14] Makefile: Only build virtiofsd if system-mode is
 enabled
To: Laurent Vivier <laurent@vivier.eu>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-riscv@nongnu.org,
 Eduardo Habkost <ehabkost@redhat.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 David Hildenbrand <david@redhat.com>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Cornelia Huck <cohuck@redhat.com>, qemu-s390x@nongnu.org,
 qemu-arm@nongnu.org, qemu-ppc@nongnu.org, Paolo Bonzini
 <pbonzini@redhat.com>, Alistair Francis <Alistair.Francis@wdc.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Richard Henderson <rth@twiddle.net>
References: <20200313183652.10258-1-philmd@redhat.com>
 <20200313183652.10258-2-philmd@redhat.com>
 <8f73d608-d28e-b896-b1f0-f95d599502f0@vivier.eu>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <d9b29b2b-58ff-512c-c426-0ffe7bcad295@linaro.org>
Date: Sun, 15 Mar 2020 12:40:28 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <8f73d608-d28e-b896-b1f0-f95d599502f0@vivier.eu>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TUID: UhkgOi5q5tMb

On 3/13/20 3:28 PM, Laurent Vivier wrote:
>>  ifeq ($(CONFIG_LINUX)$(CONFIG_SECCOMP)$(CONFIG_LIBCAP_NG),yyy)
>> -HELPERS-y += virtiofsd$(EXESUF)
>> -vhost-user-json-y += tools/virtiofsd/50-qemu-virtiofsd.json
>> +HELPERS-$(CONFIG_SOFTMMU) += virtiofsd$(EXESUF)
>> +vhost-user-json-$(CONFIG_SOFTMMU) += tools/virtiofsd/50-qemu-virtiofsd.json
...
> 
> Why don't you do that instead?
> 
>   ifeq
> ($(CONFIG_LINUX)$(CONFIG_SECCOMP)$(CONFIG_LIBCAP_NG)$(CONFIG_SOFTMMU),yyyy)

Seconded.

r~
