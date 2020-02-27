Received: by 2002:a19:cb43:0:0:0:0:0 with SMTP id b64csp4280856lfg;
        Thu, 27 Feb 2020 02:54:42 -0800 (PST)
X-Google-Smtp-Source: APXvYqz8ZiIgN9Oipg2bFhfs02ywCGZT+VAbgiaQ/68XHfbKJ+iDzS6HRvLqfM3dIFudWcXgKlpn
X-Received: by 2002:a17:906:1e56:: with SMTP id i22mr3482286ejj.314.1582800882142;
        Thu, 27 Feb 2020 02:54:42 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1582800882; cv=none;
        d=google.com; s=arc-20160816;
        b=q0p9jsN8VhPj70eq3C9MACWzCB+UlVk7fmc6WgiGmmQ7M1oqJZjV+Ae7hdxP0PI8JW
         wQZix48m8c4MOlXkdBl7VdmSP16614Oh5kanBlMDRk9qGH+IFw0ySMu/efI99xo4Td1u
         v1qRgMNfPXXkIUEITLKrlkZgUsZKBn3zim9XzQ95jJg1Pyx2y8pIDeVog0dTZ09qEqVg
         cVmlol30/d8ij2d09/SoPFKnkqUqdL3pKt/9a9asOtM5XM1pb2/C9qab6SDr1tE/cFNy
         /VlYPc+bp+M9DmO2bC2Aol9ggw1ssogUNpdLbdoFhlBXHE6hukK1nUIJTwfSAmD6FFG3
         KKog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :dkim-signature;
        bh=dzsuHGiWKbJjz/GBd39TzvO4he9cbTBOd7/2LLsaGp8=;
        b=J6Ed892oSrgPKiy2bbMy/fC38i4MIFJyNcEUCQwulGJWlsvWve+JjcyT3Vgvur4w3g
         LINIGGynEpHk/guCp5aD2N3KjdKa9O7IHVA8hUcqedMxBiaDq/35nojukrj4Dy54gxPM
         qXL72zaZ3abLrkhk/xsWEVQxg64qQosnHhg8CtQB7a8SAYpvhZKlBTLcxwQ4+W9zn6qb
         vSV7nUnGbB/P+syuCe2IbMp8kBIPg0K4ZjkexTRO0uj4n9xKYEfGX9GuAIcOA3w/21ZK
         AmUOXdsiDjpAXNEq/Ko/zqwDNu/a+4YBXt5au7L2Y+bPovC26zfxPj64SlWV84wax5u6
         UIBQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=ORczkZtE;
       spf=pass (google.com: domain of philmd@redhat.com designates 207.211.31.120 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <philmd@redhat.com>
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com. [207.211.31.120])
        by mx.google.com with ESMTPS id c14si1737088eds.9.2020.02.27.02.54.41
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 27 Feb 2020 02:54:42 -0800 (PST)
Received-SPF: pass (google.com: domain of philmd@redhat.com designates 207.211.31.120 as permitted sender) client-ip=207.211.31.120;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=ORczkZtE;
       spf=pass (google.com: domain of philmd@redhat.com designates 207.211.31.120 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1582800881;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dzsuHGiWKbJjz/GBd39TzvO4he9cbTBOd7/2LLsaGp8=;
	b=ORczkZtEtWkZ+YuweC8S1GHw8IpVa7xQZiTOa8xksmR15Mm8fKHZm9XTm2ILY9cvWLyBiL
	ahW5hAu89bPn8KIP+R7so2HLgD/pJO5QvcXgrffoAbuboKp4+RT7dr74zYvwgiiER9WyVQ
	Y6dDYZoWRwxyqWS3eGgNjEHa06a9Rsc=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-269-9tDL45thNXScnFQSS908BA-1; Thu, 27 Feb 2020 05:54:39 -0500
X-MC-Unique: 9tDL45thNXScnFQSS908BA-1
Received: by mail-wr1-f72.google.com with SMTP id f10so1154380wrv.1
        for <alex.bennee@linaro.org>; Thu, 27 Feb 2020 02:54:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=RvJYGb5l2LvhAtvzDaHsI6pAzF4cLaE643pQi22+ER4=;
        b=dhcY107Ro6b99wW3zVjRvTp38t1h6BtXo4lp99yIGbX6MiqZ6yZbEbzFLOxVzBR50O
         GtOzON61OrXl4s/MhplbHMPk3eELe8kndP6Lp68oCyTpjoV/E47HyD2Be0UEhx/dEhEv
         OjAQ28h1quq3KFpb4axarxhXEvXehtWEPGKPOsEI+yQALrXEkW6dHUC3InZsy0QefO7z
         BwRvB0zggJd+e6AvU2T0jxubBpi8/6qqGoJytKe7iSfejgbCRRJTC5hBUfRdww1uz1gj
         hPB7oywk4/bFOtm++hAPVCnzOJwqwN3NJcQub75IeEQSDNgwXLwhEdcRbCdbUscWgrcg
         LsTw==
X-Gm-Message-State: APjAAAVQWBf0QIGemXcin48CAgHg2LvAzp6VIsYXY8ppniF0Jsa8KwPE
	uPIVbipNsl9fGv8OdIFKTPOivXrwZcoS4Y0nA/ewQnFFm5tEIQeELG6Dzcnd3GKyxx/qA/7jIES
	x2TN1q7/a/jwLe/sT
X-Received: by 2002:a1c:9dcb:: with SMTP id g194mr4771273wme.114.1582800877548;
        Thu, 27 Feb 2020 02:54:37 -0800 (PST)
X-Received: by 2002:a1c:9dcb:: with SMTP id g194mr4771243wme.114.1582800877308;
        Thu, 27 Feb 2020 02:54:37 -0800 (PST)
Return-Path: <philmd@redhat.com>
Received: from [192.168.1.35] (47.red-88-21-205.staticip.rima-tde.net. [88.21.205.47])
        by smtp.gmail.com with ESMTPSA id j5sm7599168wrx.56.2020.02.27.02.54.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Feb 2020 02:54:36 -0800 (PST)
Subject: Re: [PATCH v1 1/4] accel/tcg: use units.h for defining code gen
 buffer sizes
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-arm@nongnu.org,
 Richard Henderson <rth@twiddle.net>
References: <20200226181020.19592-1-alex.bennee@linaro.org>
 <20200226181020.19592-2-alex.bennee@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <4b3b8d43-25db-6ac2-dbc6-04f2aae56638@redhat.com>
Date: Thu, 27 Feb 2020 11:54:35 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200226181020.19592-2-alex.bennee@linaro.org>
Content-Language: en-US
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-TUID: cpesXNS7lOsT

On 2/26/20 7:10 PM, Alex Benn=C3=A9e wrote:
> It's easier to read.
>=20
> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> ---
>   accel/tcg/translate-all.c | 19 ++++++++++---------
>   1 file changed, 10 insertions(+), 9 deletions(-)
>=20
> diff --git a/accel/tcg/translate-all.c b/accel/tcg/translate-all.c
> index a08ab11f657..238b0e575bf 100644
> --- a/accel/tcg/translate-all.c
> +++ b/accel/tcg/translate-all.c
> @@ -18,6 +18,7 @@
>    */
>  =20
>   #include "qemu/osdep.h"
> +#include "qemu/units.h"
>   #include "qemu-common.h"
>  =20
>   #define NO_CPU_IO_DEFS
> @@ -901,33 +902,33 @@ static void page_lock_pair(PageDesc **ret_p1, tb_pa=
ge_addr_t phys1,
>  =20
>   /* Minimum size of the code gen buffer.  This number is randomly chosen=
,
>      but not so small that we can't have a fair number of TB's live.  */
> -#define MIN_CODE_GEN_BUFFER_SIZE     (1024u * 1024)
> +#define MIN_CODE_GEN_BUFFER_SIZE     (1 * MiB)
>  =20
>   /* Maximum size of the code gen buffer we'd like to use.  Unless otherw=
ise
>      indicated, this is constrained by the range of direct branches on th=
e
>      host cpu, as used by the TCG implementation of goto_tb.  */
>   #if defined(__x86_64__)
> -# define MAX_CODE_GEN_BUFFER_SIZE  (2ul * 1024 * 1024 * 1024)
> +# define MAX_CODE_GEN_BUFFER_SIZE  (2 * GiB)
>   #elif defined(__sparc__)
> -# define MAX_CODE_GEN_BUFFER_SIZE  (2ul * 1024 * 1024 * 1024)
> +# define MAX_CODE_GEN_BUFFER_SIZE  (2 * GiB)
>   #elif defined(__powerpc64__)
> -# define MAX_CODE_GEN_BUFFER_SIZE  (2ul * 1024 * 1024 * 1024)
> +# define MAX_CODE_GEN_BUFFER_SIZE  (2 * GiB)
>   #elif defined(__powerpc__)
> -# define MAX_CODE_GEN_BUFFER_SIZE  (32u * 1024 * 1024)
> +# define MAX_CODE_GEN_BUFFER_SIZE  (32 * MiB)
>   #elif defined(__aarch64__)
> -# define MAX_CODE_GEN_BUFFER_SIZE  (2ul * 1024 * 1024 * 1024)
> +# define MAX_CODE_GEN_BUFFER_SIZE  (2 * GiB)
>   #elif defined(__s390x__)
>     /* We have a +- 4GB range on the branches; leave some slop.  */
> -# define MAX_CODE_GEN_BUFFER_SIZE  (3ul * 1024 * 1024 * 1024)
> +# define MAX_CODE_GEN_BUFFER_SIZE  (3 * GiB)
>   #elif defined(__mips__)
>     /* We have a 256MB branch region, but leave room to make sure the
>        main executable is also within that region.  */
> -# define MAX_CODE_GEN_BUFFER_SIZE  (128ul * 1024 * 1024)
> +# define MAX_CODE_GEN_BUFFER_SIZE  (128 * MiB)
>   #else
>   # define MAX_CODE_GEN_BUFFER_SIZE  ((size_t)-1)
>   #endif
>  =20
> -#define DEFAULT_CODE_GEN_BUFFER_SIZE_1 (32u * 1024 * 1024)
> +#define DEFAULT_CODE_GEN_BUFFER_SIZE_1 (32 * MiB)
>  =20
>   #define DEFAULT_CODE_GEN_BUFFER_SIZE \
>     (DEFAULT_CODE_GEN_BUFFER_SIZE_1 < MAX_CODE_GEN_BUFFER_SIZE \
>=20

Thanks!

Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
Tested-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
