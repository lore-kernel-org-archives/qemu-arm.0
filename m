Received: by 2002:a19:791d:0:0:0:0:0 with SMTP id u29csp581111lfc;
        Fri, 17 Dec 2021 02:55:28 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzv/l8QM8wJRB/YdUfXSmlkHnNvLQD2RoFDUPUyDeI7Gq5g+P/6GKxp/YLsGJ6FMMbjLYKr
X-Received: by 2002:a5d:6b09:: with SMTP id v9mr1964537wrw.591.1639738527768;
        Fri, 17 Dec 2021 02:55:27 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1639738527; cv=none;
        d=google.com; s=arc-20160816;
        b=hYE/MHOi8DG4A5wTIm3Q6VuvrI0kuKOUUTMTe0BZmI70mo4KG/XnHqHRSBu39lAz+I
         ZGvEI7TK21dfUH5JZjPgXsdcUJtjMtHy85ftOLDj9rHNTo8nQmDq7TMlmthLxi1l37Cx
         3X6+bNuixxH5S2qICU1OF27N0mnXePymR+ykJzWS9Na1wITNmoSGGeYbFmwXrb0/XhVC
         llPW9K07sKLFSO6vWQwl2MJ/lJl+uToXmpjhKSVUzvZysHRvn98RYkXdeFDPGsymRlBt
         lJCjN2gS24CD/mhTEadKhtCDz0xkEy2jJosfy7O7p7DyS726pVOz+XoNBCHatTSF+21u
         6TAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id;
        bh=Z3ga60pBn9YwpBZhZC/kFE+pUnnlO4jk+qvx7g6lS2s=;
        b=P2lJIh3/9Sr6R1KrFB8v0DWLH2tZ42510JfWf52VmGnU3R4nl4UCFyVrssvCYGbPrY
         9l0PeMj4bAurugiQylW0/qfPdH50x1kw2sOpZImChYURSXbeMeQVbPLA+jiiA1thCTOi
         +uo3U7ieMM/e2T900mDIi3CZ7Yw5QjeqYjRGPPDPAYj23305VYAb1x8cVuXtVio3voHq
         ulP/QOTRPaaSbqLANRtCAdUuTJbB8w+EAv6npiW2dVC/zm7hQ103nF/vz8fS+nDfQnMa
         Rxo8xYLRUsO9mtnjt+zRjbtNSJze2bMQQGb9qwcYfibsQix5Rzn0E+MyU7OBQ7jjd57S
         7H3w==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=neutral (google.com: 217.72.192.74 is neither permitted nor denied by best guess record for domain of laurent@vivier.eu) smtp.mailfrom=laurent@vivier.eu
Return-Path: <laurent@vivier.eu>
Received: from mout.kundenserver.de (mout.kundenserver.de. [217.72.192.74])
        by mx.google.com with ESMTPS id o5si7340305wri.982.2021.12.17.02.55.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Dec 2021 02:55:27 -0800 (PST)
Received-SPF: neutral (google.com: 217.72.192.74 is neither permitted nor denied by best guess record for domain of laurent@vivier.eu) client-ip=217.72.192.74;
Authentication-Results: mx.google.com;
       spf=neutral (google.com: 217.72.192.74 is neither permitted nor denied by best guess record for domain of laurent@vivier.eu) smtp.mailfrom=laurent@vivier.eu
Received: from [192.168.100.1] ([82.142.30.186]) by mrelayeu.kundenserver.de
 (mreue109 [213.165.67.119]) with ESMTPSA (Nemesis) id
 1N2V8T-1mVKHS0hPr-013voY; Fri, 17 Dec 2021 11:55:25 +0100
Message-ID: <8578090e-ee93-4599-62c6-3633b81da1f3@vivier.eu>
Date: Fri, 17 Dec 2021 11:55:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH v3 02/28] glib-compat: Introduce g_memdup2() wrapper
Content-Language: fr
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Eric Blake <eblake@redhat.com>,
 qemu-block@nongnu.org, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>, David Hildenbrand <david@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-arm@nongnu.org,
 John Snow <jsnow@redhat.com>, David Gibson <david@gibson.dropbear.id.au>,
 Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 "Daniel P . Berrange" <berrange@redhat.com>, Hanna Reitz
 <hreitz@redhat.com>, qemu-ppc@nongnu.org, Paolo Bonzini
 <pbonzini@redhat.com>, "qemu-trivial@nongnu.org" <qemu-trivial@nongnu.org>
References: <20210903174510.751630-1-philmd@redhat.com>
 <20210903174510.751630-3-philmd@redhat.com>
From: Laurent Vivier <laurent@vivier.eu>
In-Reply-To: <20210903174510.751630-3-philmd@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:oiiNr09RsECoGk1DwZJAfE6ar7F7As2lz9hJNQN39ICtiMe5RhX
 7TW3IDdfstQDLbmA1H8J9SaqUW8NDlvw3tB8YypIwOvkgnadGwSDm00ohaxJIUBDqTtuf4e
 USTg31KaH/Kr4W0UcPX/kWkBZ6fpuXFGUkgDnjUrPJRx2d4BCSoWQQv5p95CRkVn0mclbfI
 AYh4NAsEd6DlgXDluIXYA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:ldRfpqJwU0Q=:Grwe7gCXCtVwbcFj0cn73X
 uRw97Zfm8husyKEFhFb2AOmqNfeqkcmmu1XbsmS91rdkNiuwiM1bcgd1IpC5KoR+1BjQIrdTa
 UzCQAxZ/8MQtFNeup3ugOQM1mqEAkunbZbeOBoeldqYdBzZ6d34kdzk7F6oP6FtTKvNUaz2UC
 GG/mX6qNdgMyP5KS1Qn4NoHRs0DJaalgTrEP5WJhQR2USilQgPvupErzc+IyDlytmJB4vevWm
 iV2h1QDcCkdX4azMaWW9dK0uLJXZBBvR0epB1z+dzAMAER7RPZM3Np4LrQ6e80Ffz/LlLggLz
 6ocnH3X0pdMxdXUUmJt7aN+0I2cH6VXN2KlbsUPQc4WelvgJ+KDCL/lSo4PtwDCJ1Uj7RP15+
 IP1XvUibaRyB2NE5pIL0q9uxw0OII2kbR2RS031/DwH17lxKSFpFA9i4hG2h9cQ2HfGXnjZQR
 bxUyLsM9HCgmegS2u32ownbuFMxvyQp7HQSxUNGVQPpMbRMv7dRvAoIxJQpT02ClkbP75AaLJ
 +D8L2A0LQyYjwNi7RhVxGMeuw77qi6JMB31YKH8V+5PQ3WId0k5m4GaxDmk7l/1R9N5ocRTGi
 EIdOtdeOTFxsyHV3VdCUtspoqx7QVn91jfVij/WcOpmy3rTTkPLB4Jx2FwFoSn7pB9uIJVDz0
 a71aw6Ecas0Ls/ySDtcL81d+1Vic+nmoEUBfxt1lqwPKOs4Z+zUu236HcA9T2u4f1fG0=
X-TUID: KEJ8sPjgNZSQ

Le 03/09/2021 à 19:44, Philippe Mathieu-Daudé a écrit :
> When experimenting raising GLIB_VERSION_MIN_REQUIRED to 2.68
> (Fedora 34 provides GLib 2.68.1) we get:
> 
>    hw/virtio/virtio-crypto.c:245:24: error: 'g_memdup' is deprecated: Use 'g_memdup2' instead [-Werror,-Wdeprecated-declarations]
>    ...
> 
> g_memdup() has been updated by g_memdup2() to fix eventual security
> issues (size argument is 32-bit and could be truncated / wrapping).
> GLib recommends to copy their static inline version of g_memdup2():
> https://discourse.gnome.org/t/port-your-module-from-g-memdup-to-g-memdup2-now/5538
> 
> Our glib-compat.h provides a comment explaining how to deal with
> these deprecated declarations (see commit e71e8cc0355
> "glib: enforce the minimum required version and warn about old APIs").
> 
> Following this comment suggestion, implement the g_memdup2_qemu()
> wrapper to g_memdup2(), and use the safer equivalent inlined when
> we are using pre-2.68 GLib.
> 
> Reported-by: Eric Blake <eblake@redhat.com>
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> ---
>   include/glib-compat.h | 37 +++++++++++++++++++++++++++++++++++++
>   1 file changed, 37 insertions(+)
> 
> diff --git a/include/glib-compat.h b/include/glib-compat.h
> index 9e95c888f54..8d01a8c01fb 100644
> --- a/include/glib-compat.h
> +++ b/include/glib-compat.h
> @@ -68,6 +68,43 @@
>    * without generating warnings.
>    */
>   
> +/*
> + * g_memdup2_qemu:
> + * @mem: (nullable): the memory to copy.
> + * @byte_size: the number of bytes to copy.
> + *
> + * Allocates @byte_size bytes of memory, and copies @byte_size bytes into it
> + * from @mem. If @mem is %NULL it returns %NULL.
> + *
> + * This replaces g_memdup(), which was prone to integer overflows when
> + * converting the argument from a #gsize to a #guint.
> + *
> + * This static inline version is a backport of the new public API from
> + * GLib 2.68, kept internal to GLib for backport to older stable releases.
> + * See https://gitlab.gnome.org/GNOME/glib/-/issues/2319.
> + *
> + * Returns: (nullable): a pointer to the newly-allocated copy of the memory,
> + *          or %NULL if @mem is %NULL.
> + */
> +static inline gpointer g_memdup2_qemu(gconstpointer mem, gsize byte_size)
> +{
> +#if GLIB_CHECK_VERSION(2, 68, 0)
> +    return g_memdup2(mem, byte_size);
> +#else
> +    gpointer new_mem;
> +
> +    if (mem && byte_size != 0) {
> +        new_mem = g_malloc(byte_size);
> +        memcpy(new_mem, mem, byte_size);
> +    } else {
> +        new_mem = NULL;
> +    }
> +
> +    return new_mem;
> +#endif
> +}
> +#define g_memdup2(m, s) g_memdup2_qemu(m, s)
> +
>   #if defined(G_OS_UNIX)
>   /*
>    * Note: The fallback implementation is not MT-safe, and it returns a copy of
> 

Applied to my trivial-patches branch.

Thanks,
Laurent
