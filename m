Received: by 2002:a17:504:749a:b0:1be9:327d:8ee3 with SMTP id a26csp30475njk;
        Wed, 16 Apr 2025 04:56:06 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWFcaJX6POkdoAkvUP7u7IbW7ZSKrm0fTgzIY6uiizboLiMD2mH9flKEFMYil75JNwOBqJ04JcSlft8Og==@linaro.org
X-Google-Smtp-Source: AGHT+IGxq7+neSf4XZ4twQ64FdwqKMVt3BM5N1nbWsJ8UFtpeD6Isd+NXRPPw/EQTlQDN4GDH5aw
X-Received: by 2002:a5d:584f:0:b0:391:43cb:43e6 with SMTP id ffacd0b85a97d-39ee5ba01f0mr1508867f8f.51.1744804566525;
        Wed, 16 Apr 2025 04:56:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1744804566; cv=none;
        d=google.com; s=arc-20240605;
        b=a6osvYuPa/JdDrl4hxyLhJ6XzAnSCdQMm2cqIGFCjw+1RtSuwCVL9Sk2ejfBQsgXju
         67MhwfZFTTzzndQDfyS9ofLvCRMYqgu5LPardwdImkKQlf3cnLck11vM1+/W2gIxi5dy
         v3oOiLnvkjvmjTy84VpC4um129Ecu3gnyqeYi+WutvQL6EsaUyUQpwy6Druw2bbMXpK8
         IMggmbbVesJOXkFglJHARNOtSkGGMmPZE1P/cEA0dRJ0dYPeJAHrFki6xw1xGmluKx8Q
         XzeSsNw+mTV4k0eKeMnreZ7/MaBJ/iwDM5b6ujBo9KWI0Wsru22YDNmlTHPceOxeWeXX
         Ww1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :date;
        bh=LWCw4EY4JF8g7EemMHlUxF0MisOZK/fedcxuaLdlmxc=;
        fh=bn9hZl/3WSY7EHYmNoFvkGecCUwCqI9+/4TR+4fmFmA=;
        b=OsTNQk/h3lwHsy2+9inKJTOfriAlLWxU8WYCawjgMVBA1eheT4xDgWEa/5VRWpc8Y0
         LgmGWEfl0kpv6mrelm/EUZhVVl2n9USl27g+JHpSP714LxXtch8vdTYitipgLdUqnPfk
         MQxRFqukElOKKyjM15NzcX+Chl0y4efM9jjKH3h++j3pwJ0R6s2MPA/ilYXkHkNsw4g4
         ocy8mtCS51aOH015ir+2Utbz6tSD01oJHZkfNGr4RuFNT9LHCHH8re+KpToJr636E3Vs
         zpVnwUTQPA5pjbc0Q+cmTKEAL9R1UsNT+r105YYwIC7UKy2Eiq/U/rTvZh3U4YmUVSVS
         H7CQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of balaton@eik.bme.hu designates 2001:738:2001:2001::2001 as permitted sender) smtp.mailfrom=balaton@eik.bme.hu;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=eik.bme.hu
Return-Path: <balaton@eik.bme.hu>
Received: from zero.eik.bme.hu (zero.eik.bme.hu. [2001:738:2001:2001::2001])
        by mx.google.com with ESMTPS id ffacd0b85a97d-39eaf427ec2si7573105f8f.355.2025.04.16.04.56.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Apr 2025 04:56:06 -0700 (PDT)
Received-SPF: pass (google.com: domain of balaton@eik.bme.hu designates 2001:738:2001:2001::2001 as permitted sender) client-ip=2001:738:2001:2001::2001;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of balaton@eik.bme.hu designates 2001:738:2001:2001::2001 as permitted sender) smtp.mailfrom=balaton@eik.bme.hu;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=eik.bme.hu
Received: from zero.eik.bme.hu (localhost [127.0.0.1])
	by zero.eik.bme.hu (Postfix) with ESMTP id D058B4E6033;
	Wed, 16 Apr 2025 13:56:05 +0200 (CEST)
X-Virus-Scanned: amavisd-new at eik.bme.hu
Received: from zero.eik.bme.hu ([127.0.0.1])
 by zero.eik.bme.hu (zero.eik.bme.hu [127.0.0.1]) (amavisd-new, port 10028)
 with ESMTP id 8l-mtgXqr-oN; Wed, 16 Apr 2025 13:56:03 +0200 (CEST)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
	id E0DE14E6027; Wed, 16 Apr 2025 13:56:03 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by zero.eik.bme.hu (Postfix) with ESMTP id DE66574577C;
	Wed, 16 Apr 2025 13:56:03 +0200 (CEST)
Date: Wed, 16 Apr 2025 13:56:03 +0200 (CEST)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: Kohei Tokunaga <ktokunaga.mail@gmail.com>
cc: qemu-devel@nongnu.org, 
    =?ISO-8859-15?Q?Alex_Benn=E9e?= <alex.bennee@linaro.org>, 
    =?ISO-8859-15?Q?Philippe_Mathieu-Daud=E9?= <philmd@linaro.org>, 
    Thomas Huth <thuth@redhat.com>, Kevin Wolf <kwolf@redhat.com>, 
    Hanna Reitz <hreitz@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>, 
    Alexandre Iooss <erdnaxe@crans.org>, 
    Mahmoud Mandour <ma.mandourr@gmail.com>, 
    Pierrick Bouvier <pierrick.bouvier@linaro.org>, 
    Pavel Pisa <pisa@cmp.felk.cvut.cz>, 
    Francisco Iglesias <francisco.iglesias@amd.com>, 
    Vikram Garhwal <vikram.garhwal@bytedance.com>, 
    Jason Wang <jasowang@redhat.com>, 
    =?ISO-8859-15?Q?Marc-Andr=E9_Lureau?= <marcandre.lureau@redhat.com>, 
    =?ISO-8859-15?Q?Daniel_P_=2E_Berrang=E9?= <berrange@redhat.com>, 
    Eduardo Habkost <eduardo@habkost.net>, 
    Peter Maydell <peter.maydell@linaro.org>, Zhao Liu <zhao1.liu@intel.com>, 
    Nicholas Piggin <npiggin@gmail.com>, 
    Daniel Henrique Barboza <danielhb413@gmail.com>, 
    David Hildenbrand <david@redhat.com>, 
    Richard Henderson <richard.henderson@linaro.org>, 
    Ilya Leoshkevich <iii@linux.ibm.com>, 
    Stefan Hajnoczi <stefanha@redhat.com>, qemu-block@nongnu.org, 
    qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-s390x@nongnu.org
Subject: Re: [PATCH 10/19] include/glib-compat.h: Poison g_list_sort and
 g_slist_sort
In-Reply-To: <f6e0e42ae3491564478929e412991c2a16ee3539.1744787186.git.ktokunaga.mail@gmail.com>
Message-ID: <263e4803-65d0-5a41-4031-99766b067915@eik.bme.hu>
References: <cover.1744787186.git.ktokunaga.mail@gmail.com> <f6e0e42ae3491564478929e412991c2a16ee3539.1744787186.git.ktokunaga.mail@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII; format=flowed
X-TUID: G30Pe/lw9y9w

On Wed, 16 Apr 2025, Kohei Tokunaga wrote:
> On emscripten, function pointer casts can cause function call
> failure. g_list_sort and g_slist_sort performs this internally so can't be
> used on Emscripten. Instead, g_list_sort_with_data and
> g_slist_sort_with_data should be used.
>
> Signed-off-by: Kohei Tokunaga <ktokunaga.mail@gmail.com>
> ---
> include/glib-compat.h | 6 ++++++
> 1 file changed, 6 insertions(+)
>
> diff --git a/include/glib-compat.h b/include/glib-compat.h
> index 86be439ba0..e441b396ef 100644
> --- a/include/glib-compat.h
> +++ b/include/glib-compat.h
> @@ -36,6 +36,12 @@
> #include <pwd.h>
> #endif
>
> +/* These functions perform function pointer casts which can cause function call
> + * failure on Emscripten. Use g_slist_sort_with_data and g_list_sort_with_data
> + * insted of these functions.

Typo: instead

Regards,
BALATON Zoltan

> + */
> +#pragma GCC poison g_slist_sort g_list_sort
> +
> /*
>  * Note that because of the GLIB_VERSION_MAX_ALLOWED constant above, allowing
>  * use of functions from newer GLib via this compat header needs a little
>
