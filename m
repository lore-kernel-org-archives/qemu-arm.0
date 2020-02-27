Received: by 2002:a19:cb43:0:0:0:0:0 with SMTP id b64csp4284319lfg;
        Thu, 27 Feb 2020 02:58:31 -0800 (PST)
X-Google-Smtp-Source: APXvYqwoEQWTCGh2QBk8Qm1+UwNDQAmuNfBHcf5aw02lB3h25p46X/BOuDF4ZDrQhrHTlQytomuC
X-Received: by 2002:a81:82c5:: with SMTP id s188mr3590175ywf.59.1582801111367;
        Thu, 27 Feb 2020 02:58:31 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1582801111; cv=none;
        d=google.com; s=arc-20160816;
        b=PoW+QkPsatW1sdbDprAN2bY2cC2447b3FW/VNadeg8HFrWc9VhaOUG7j2JDJ+AlIPp
         t07GTf0aPFGwhuXczdM2vIpyVTRAzqP4U7BZN2nC5QR7IYMMnxyaQIP4jMSbP/ZJvmOF
         nz2SYe4kF9IS+dbpMoCjpDnac+mCqqYSP/43g1SP5uOlizlKoI6QSnTrjUA7YjzDcRpI
         4btL4kF3/9HUbSvfX+uOec2ON3WLGAjmUODN+2Tk4nbHKnnsV+yqF21v2hMn54Mvpu+D
         v8MeSkyM2hGJGNhIXDzrAAayO+mQEaYrx9ZiM5CQtAo/GSlSHWSAWNUcUBagymz31bBP
         VwhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :dkim-signature;
        bh=UrdnczjsEWWNjtotmmqNLls3aVkmAt5pMu4j0pbKRrU=;
        b=jL1hBAzeLXOhIasMDSEBduFMuGHq50b372uiAl8vEtzCtOQx9GizY7o3+L3x56ybNi
         D0wl54RKaCKPScV5X0DD3qViEEkQp9EkZ4kiHoY7uScAKGuI8flGyoWQ4zIXERcH+8P6
         WWmeeAnyx8rWLtg4m9NeK571/tv5NHTYM4sODE00trhqz5o1Jvsxl9eBclgitttQzCw0
         rAY99xrbRBmC3Hp4K8vRSJtVeDWFu7pRNKjxMUZcz4li3GT8esDMRcwiJYqtejnIQv3q
         jZ/95lyqTIlutOLt9UoiLBp+hU0m61a5sn2RMpDWnc6Mk8zMCXPibJmRA88GF8/IawWN
         Rh7A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=GQdN6Hr5;
       spf=pass (google.com: domain of philmd@redhat.com designates 205.139.110.120 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <philmd@redhat.com>
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com. [205.139.110.120])
        by mx.google.com with ESMTPS id a3si1217095ybk.474.2020.02.27.02.58.31
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 27 Feb 2020 02:58:31 -0800 (PST)
Received-SPF: pass (google.com: domain of philmd@redhat.com designates 205.139.110.120 as permitted sender) client-ip=205.139.110.120;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=GQdN6Hr5;
       spf=pass (google.com: domain of philmd@redhat.com designates 205.139.110.120 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1582801110;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=UrdnczjsEWWNjtotmmqNLls3aVkmAt5pMu4j0pbKRrU=;
	b=GQdN6Hr5Bkd6bRLlrHY4cQVBI01DLBp5hKppRqYxJCg7EevLYJNJAzStFZA1wm4Uzg/mMh
	LWTkp1MUcaMVuGK8+CDVGZtTwsRbW81QSBeVQOMEAiufGr/zBjVfNc9qrzWGm3WilEg1Hv
	g5qZ9QqiDqnF6UED2AsTalCZnzIyNx4=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-218-qsThTFYqPamdXUukRNTJng-1; Thu, 27 Feb 2020 05:58:29 -0500
X-MC-Unique: qsThTFYqPamdXUukRNTJng-1
Received: by mail-wm1-f70.google.com with SMTP id p2so858863wma.3
        for <alex.bennee@linaro.org>; Thu, 27 Feb 2020 02:58:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=QOFvF90OznVufott3/i8QcVk7EhMvYsLQ0aGYHPLWt4=;
        b=FCLnIXT6jAK3wggF/IkAM3Da4KDyGrkBayigTykuSA/jEwlyeyK88V5f9VYSgMyhq7
         pqs7R96aurNjkjui5Xe6PLOX4YR+kuAD+zAsFbqHL6GbjSYlxYMX6RPdhIbc/flwml+b
         YT1uDY33RjwUcM0TI1MWVCZDszyANjNYI3jjZQ6zao5jyEkkrAwI9WnVCdZDV0K3eaVn
         WzoVpfdi8GYFT5aC9saOVHkcc03lDzMNt7E7zlMxo21cH5UVC2qIJ1AQNs4adYQwkwrE
         ps3rFPBnVni5UyHjJzvb/aIMkfkz0sSg05W+U0f8ZwpJbTU8mS4E4exMeZwPnV3CM25M
         pndQ==
X-Gm-Message-State: APjAAAUO9W+M/TnAymsx1X2YtCOfxj9rPhWFQNYqymIkO7yLHLqdU52g
	450B5abK5nMvg3x8eRJN+kKet9xhA8F8w9KBwzFJq/W+3ERH2pb+6snM349YTJ86mV4Xe5vS3sj
	wW2Afl+kpwRuEXrie
X-Received: by 2002:adf:fa43:: with SMTP id y3mr4177465wrr.404.1582801107947;
        Thu, 27 Feb 2020 02:58:27 -0800 (PST)
X-Received: by 2002:adf:fa43:: with SMTP id y3mr4177440wrr.404.1582801107699;
        Thu, 27 Feb 2020 02:58:27 -0800 (PST)
Return-Path: <philmd@redhat.com>
Received: from [192.168.1.35] (47.red-88-21-205.staticip.rima-tde.net. [88.21.205.47])
        by smtp.gmail.com with ESMTPSA id s8sm7699090wrt.57.2020.02.27.02.58.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Feb 2020 02:58:26 -0800 (PST)
Subject: Re: [PATCH v1 2/4] accel/tcg: remove link between guest ram and TCG
 cache size
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: Niek Linnenbank <nieklinnenbank@gmail.com>, qemu-arm@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Richard Henderson <rth@twiddle.net>
References: <20200226181020.19592-1-alex.bennee@linaro.org>
 <20200226181020.19592-3-alex.bennee@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <74b1fa34-59c1-f7de-cb91-10f1387087fc@redhat.com>
Date: Thu, 27 Feb 2020 11:58:25 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200226181020.19592-3-alex.bennee@linaro.org>
Content-Language: en-US
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-TUID: ydt0E6MyD9OH

On 2/26/20 7:10 PM, Alex Benn=C3=A9e wrote:
> Basing the TB cache size on the ram_size was always a little heuristic
> and was broken by a1b18df9a4 which caused ram_size not to be fully
> realised at the time we initialise the TCG translation cache.
>=20
> The current DEFAULT_CODE_GEN_BUFFER_SIZE may still be a little small
> but follow-up patches will address that.
>=20
> Fixes: a1b18df9a4
> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> Cc: Niek Linnenbank <nieklinnenbank@gmail.com>
> Cc: Igor Mammedov <imammedo@redhat.com>
> ---
>   accel/tcg/translate-all.c | 8 --------
>   1 file changed, 8 deletions(-)
>=20
> diff --git a/accel/tcg/translate-all.c b/accel/tcg/translate-all.c
> index 238b0e575bf..5b66af783b5 100644
> --- a/accel/tcg/translate-all.c
> +++ b/accel/tcg/translate-all.c
> @@ -938,15 +938,7 @@ static inline size_t size_code_gen_buffer(size_t tb_=
size)
>   {
>       /* Size the buffer.  */
>       if (tb_size =3D=3D 0) {
> -#ifdef USE_STATIC_CODE_GEN_BUFFER
>           tb_size =3D DEFAULT_CODE_GEN_BUFFER_SIZE;
> -#else
> -        /* ??? Needs adjustments.  */
> -        /* ??? If we relax the requirement that CONFIG_USER_ONLY use the
> -           static buffer, we could size this on RESERVED_VA, on the text
> -           segment size of the executable, or continue to use the defaul=
t.  */
> -        tb_size =3D (unsigned long)(ram_size / 4);
> -#endif
>       }
>       if (tb_size < MIN_CODE_GEN_BUFFER_SIZE) {
>           tb_size =3D MIN_CODE_GEN_BUFFER_SIZE;
>=20

Tested-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
