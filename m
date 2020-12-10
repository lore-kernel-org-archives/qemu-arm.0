Received: by 2002:a19:ee0a:0:0:0:0:0 with SMTP id g10csp5950613lfb;
        Thu, 10 Dec 2020 06:28:08 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzy0BFDbWjgJ05hQgrBnLnFcNKWLN4FGYIWesfzLvUOfdAW+gh39fL/Q03eqfiedArziwft
X-Received: by 2002:aca:ab8b:: with SMTP id u133mr5645355oie.18.1607610488813;
        Thu, 10 Dec 2020 06:28:08 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1607610488; cv=none;
        d=google.com; s=arc-20160816;
        b=PdcqPE5O0trz7PctwMGP7fHsQ0PxnVEXKYqFBlsz91fld9dco8B2dr5DDDCNBZnL9m
         +uz69GEOjbc3YAQOfuP2GK+9T1TokozvqxNOTIE6elK9U66G6xXROwTbmQebSCWNI9B/
         m6S0ZpR/mMWYqbYdtl2ziS1vIpQLXe+M1zAGQKYxI5NVFFbv7RYGgTn8bMZk4KWnvwh2
         TsgRe0bL+GqgoaZUPWI928bKx7J5mlSL1S3EVUBmSVT6+Ub0SVtHYG//urwkJcUjkyQ6
         gn2uQDEC1fKPD6Re7eB5NoO0e1sw8bFjTt9G+XtacZE/bZdyt5tHAP67RxIR1WxOpQNE
         j3YA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :dkim-signature:sender:precedence:errors-to:list-subscribe:list-help
         :list-post:list-unsubscribe:list-id;
        bh=wwzUYSWq/h6EtaDoCvUeshJJpFiXqC6zBbdC+3h4P3k=;
        b=YxrHvSGs9+k0IQS1CY6ibzJ03EfEGdJWMsr4vX2fnpuOFBf0608QNlqzHi+VCWk+zo
         VzaOgJMst37fXFrSyhjkZWvw09OlSHMZL/DBAzCKu9cnHzmFUUfuyUQrEPdCVU5HV4AV
         rLs6oYaw8uzZ77Q5kNcOJH3fhbHATlZYCsdwO2aAjcM5HP1leUzdofTIt9vMDULs6WGN
         ZxsvZ7voq8R0K3C5N8XDdrgF2KVtaXMd6C9v4kGokbCNfZ9shcFqVHf6UyHezWL2uczf
         39IiSX2LE5Gb6jbbD1gF3HGHNhnY1UbSJnzcAY8n7elJh318nov6vJi5YD/p5HHQnwSM
         c17g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=PBRQfeaH;
       spf=pass (google.com: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <xen-devel-bounces@lists.xenproject.org>
Received: from lists.xenproject.org (lists.xenproject.org. [192.237.175.120])
        by mx.google.com with ESMTPS id y16si2734514otk.275.2020.12.10.06.28.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Dec 2020 06:28:08 -0800 (PST)
Received-SPF: pass (google.com: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) client-ip=192.237.175.120;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=PBRQfeaH;
       spf=pass (google.com: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from list by lists.xenproject.org with outflank-mailman.49337.87238 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1knMu4-0003dm-P9; Thu, 10 Dec 2020 14:26:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 49337.87238; Thu, 10 Dec 2020 14:26:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1knMu4-0003df-KN; Thu, 10 Dec 2020 14:26:44 +0000
Received: by outflank-mailman (input) for mailman id 49337;
 Thu, 10 Dec 2020 14:26:42 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Anpp=FO=redhat.com=philmd@srs-us1.protection.inumbo.net>)
 id 1knMu2-0003da-ND
 for xen-devel@lists.xenproject.org; Thu, 10 Dec 2020 14:26:42 +0000
Received: from us-smtp-delivery-124.mimecast.com (unknown [63.128.21.124])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id 5ed05038-207d-4f7e-bad3-00de52d3f290;
 Thu, 10 Dec 2020 14:26:41 +0000 (UTC)
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-514-13Qwd3tkOn-axT977J48wg-1; Thu, 10 Dec 2020 09:26:40 -0500
Received: by mail-wm1-f69.google.com with SMTP id w204so1293804wmb.1
 for <xen-devel@lists.xenproject.org>; Thu, 10 Dec 2020 06:26:39 -0800 (PST)
Received: from [192.168.1.36] (101.red-88-21-206.staticip.rima-tde.net.
 [88.21.206.101])
 by smtp.gmail.com with ESMTPSA id b9sm9483846wmd.32.2020.12.10.06.26.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 10 Dec 2020 06:26:37 -0800 (PST)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
X-Inumbo-ID: 5ed05038-207d-4f7e-bad3-00de52d3f290
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1607610401;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wwzUYSWq/h6EtaDoCvUeshJJpFiXqC6zBbdC+3h4P3k=;
	b=PBRQfeaHriwLyAXVmlv/JplQaG9lrRd/D+rmZ+S0fl2BMJmH79/TTgraV9IBULy67HnnQl
	6mCHEJyWz9A7qy29YB7F7rtExVwc1kLWYegHPgxbhVhWki+2fakKnhZUdx/MoLRmmmpz8U
	hv7gKU5z3vAcz+abE7PWqL/HVy3u8eY=
X-MC-Unique: 13Qwd3tkOn-axT977J48wg-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=wwzUYSWq/h6EtaDoCvUeshJJpFiXqC6zBbdC+3h4P3k=;
        b=hmXzCkhHAMuM3H+qQhNhfQUNfK8Ws0pHHWzu3Z2pvcKbSAfS319x5eTEJ9H6uCVa1K
         FLjXomy8cS077coxo1FRJpjqB5dlw9zYdLXN6WAs2hhmLHxeBgBY+DpGDoZy0R8Az46J
         vqORnZUKLEbdtMod8ZxsARgWNHtWGLdigs9hS2U4XzJRjNZo3+2QfA1rzOIHNuEhaOXB
         1oOfSXnzEgfTb8RZjL3usTCWjFsp2sBlEbH1PH44xKGACgS632+T2MDGWFx08icM2vYX
         1SRhJmc+uwCk+6lx4kaaHTwcA297WjuiCoVpAltr8h6093h6Hs3jzTgKetLwcEfm5rjx
         Ho4w==
X-Gm-Message-State: AOAM53126/9roSNblvHmf9wMP/xVmn3vmKVaRtojjsRLHGzRs4P3NaTC
	w7RmYV7f7IoNCoPM9m5t2UIvTTeLC1ugAKf3U6evVFuRqfVvKZcdlGmZstUJt3lZNR6CELw6iEG
	Ltz4LDXCOar3VqNjI9zMOd9bD+/8=
X-Received: by 2002:a1c:4c14:: with SMTP id z20mr8646313wmf.149.1607610398621;
        Thu, 10 Dec 2020 06:26:38 -0800 (PST)
X-Received: by 2002:a1c:4c14:: with SMTP id z20mr8646296wmf.149.1607610398481;
        Thu, 10 Dec 2020 06:26:38 -0800 (PST)
Subject: Re: [PATCH v3 08/13] audio: remove GNUC & MSVC check
To: marcandre.lureau@redhat.com, qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>, Paul Durrant <paul@xen.org>,
 xen-devel@lists.xenproject.org, Stefan Hajnoczi <stefanha@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony Perard <anthony.perard@citrix.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, qemu-arm@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, Peter Maydell <peter.maydell@linaro.org>
References: <20201210134752.780923-1-marcandre.lureau@redhat.com>
 <20201210134752.780923-9-marcandre.lureau@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <a162ec7c-4dc3-5784-866e-dc95f6919b1f@redhat.com>
Date: Thu, 10 Dec 2020 15:26:35 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <20201210134752.780923-9-marcandre.lureau@redhat.com>
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: s3RM57DRj5AD

On 12/10/20 2:47 PM, marcandre.lureau@redhat.com wrote:
> From: Marc-André Lureau <marcandre.lureau@redhat.com>
> 
> QEMU requires either GCC or Clang, which both advertize __GNUC__.
> Drop MSVC fallback path.
> 
> Note: I intentionally left further cleanups for a later work.
> 
> Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
> ---
>  audio/audio.c | 8 +-------
>  1 file changed, 1 insertion(+), 7 deletions(-)
> 
> diff --git a/audio/audio.c b/audio/audio.c
> index 46578e4a58..d7a00294de 100644
> --- a/audio/audio.c
> +++ b/audio/audio.c
> @@ -122,13 +122,7 @@ int audio_bug (const char *funcname, int cond)
>  
>  #if defined AUDIO_BREAKPOINT_ON_BUG
>  #  if defined HOST_I386
> -#    if defined __GNUC__
> -        __asm__ ("int3");
> -#    elif defined _MSC_VER
> -        _asm _emit 0xcc;
> -#    else
> -        abort ();
> -#    endif
> +      __asm__ ("int3");

This was 15 years ago... Why not simply use abort() today?

>  #  else
>          abort ();
>  #  endif
> 

