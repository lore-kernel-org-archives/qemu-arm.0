Received: by 2002:a19:791d:0:0:0:0:0 with SMTP id u29csp581858lfc;
        Fri, 17 Dec 2021 02:56:50 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwvdUvtM/+9vYiGFgKS2FcfsNRBwF4R5CnLBh2ihDVCDgQ2F9pph1cLXx7f3zj69cnWLtvk
X-Received: by 2002:a5d:47a8:: with SMTP id 8mr1992005wrb.233.1639738610782;
        Fri, 17 Dec 2021 02:56:50 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1639738610; cv=none;
        d=google.com; s=arc-20160816;
        b=COU/GFIYM6bd+eCnoOmCF//yxkybRnSbMML8vdjuJo8OgkwZxqn6iWSWvdvAwZ2A5R
         APeC7lAkOBNNv6uOOKzaP1ujK1Nirt/T68Vc2P28AAJ4+Go1x8/FmbKfwOPu8l0/nG2Q
         5ChWCUpGHpfrROC5tiVAAZwOZkAKMu1Lf7T2oJltnp+7trry98aNHEbiBeI/ahxbncBb
         riPcXk8B0N7o+qnE/hHFkGeKaendC9580pjj0/7v0s4c65xU6J2BevmFyW3fIAB0SZp3
         jXRlKw6egIfbT6QZxOBGqi+evYNLPqeW5Wsxm9f9rn/BgBnv4tSWusXmgrawx+j9Nuz9
         6P1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id;
        bh=bMjBjh2pKKFEYM4rLGX/4Y5WDlsFasLhUHgk7c9bgTY=;
        b=cxX5kGrJbyZc0r681TbLUIx57ulrHD+ow28g+JgtN20QLjk/O6LI0aDrgIV7AW/aMz
         Z//fHDoJ6F+ZofGfTKvs6QImrae6tE9VOt0/ey27kIzQORRE02VTOSI9CBTMXUpG//Cn
         nrIWwwPx1BBXeE6awKZ+7UiYnqF2Mk+2v/n9xd+h7KYse/P2XZHQAOvM63AaCB+Mr4Y6
         NMh84cASzgM15uh7fTyb3vbvvPibOMo4dJOAWnGDOFSCtBbSGFbg/3hWIb7IsT73A21H
         t2qtg+vqKNBnzsrcd2T3/QWDRixiFiVj3emENihHki9pTFOahljFGEFIQrFLye7KjqEe
         T88w==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=neutral (google.com: 212.227.17.10 is neither permitted nor denied by best guess record for domain of laurent@vivier.eu) smtp.mailfrom=laurent@vivier.eu
Return-Path: <laurent@vivier.eu>
Received: from mout.kundenserver.de (mout.kundenserver.de. [212.227.17.10])
        by mx.google.com with ESMTPS id n8si5089797wrr.801.2021.12.17.02.56.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Dec 2021 02:56:50 -0800 (PST)
Received-SPF: neutral (google.com: 212.227.17.10 is neither permitted nor denied by best guess record for domain of laurent@vivier.eu) client-ip=212.227.17.10;
Authentication-Results: mx.google.com;
       spf=neutral (google.com: 212.227.17.10 is neither permitted nor denied by best guess record for domain of laurent@vivier.eu) smtp.mailfrom=laurent@vivier.eu
Received: from [192.168.100.1] ([82.142.30.186]) by mrelayeu.kundenserver.de
 (mreue106 [213.165.67.119]) with ESMTPSA (Nemesis) id
 1N8XDT-1mThhG2h9d-014VqR; Fri, 17 Dec 2021 11:56:47 +0100
Message-ID: <af2c49ea-69c8-32cd-0cf0-571640ab3cb6@vivier.eu>
Date: Fri, 17 Dec 2021 11:56:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH v3 24/28] tests/qtest: Replace g_memdup() by g_memdup2()
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
 <20210903174510.751630-25-philmd@redhat.com>
From: Laurent Vivier <laurent@vivier.eu>
In-Reply-To: <20210903174510.751630-25-philmd@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:SL+pO6j1OrP191s1v9vkjW0/R5XANarHdOJfeNnG49iHt5V016K
 gLJwacv0PQi+V1s4xBClosJoXy+AeVKrozPZKzKYMKv8Y8KZ/g45+oMkP+GaGmU983Dw2dp
 63z/PRGnWKTwaOIKQLx93w6vIzNzw8pDftQQffakIdKhufPY6dyDqVp/uGG+c8uSD+QKPxM
 V4tH8LpzyMv2bfGvN5lYg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:Q+CKb5EiIDg=:dYE43IFdu0ii7IOli4vLu2
 w7guNIWC3qacK9naUD/v2GcfYTqr6w4pBfIiFPTVvc69DDonAjxNjfbXSQwEWG8Tl7kdNVPnR
 1BM6Q2+LN9lL4x7PlsGO++T1p4n331kN9BGzZKS36XuTRXEY+oV6S68spu/UNqDZPqDPFPMLr
 R9e0HONYFkMCjtbCKa4m8lpO9BmMlM8i6tUnDF9c60Kq9cQsgCN518Y+TrRG1FXXWiQKRzeyZ
 KTqVCpxkeakAF2MQGC3U8uFB+yYsAVBDvDsHID35WDr9NXXAaeudNk06EFCMHF2xL6hvcyCuC
 u4q/Y8QO4/sXGsySyZQ/lLQOBM5hznQxFl6SKouKW1ibE5RxdgpsjEHVbt+m3eNESQEU3bc/8
 LD4a8wnR1Wz+qjgs5XILdhZA0VNWLnpt7eRb/CqlIJVHskebURXFungHYjtmIORLf/tDfiiz3
 dnOWNIQKASR+d7TSG+nx60olHlmxljt2Vdh7QuSt8SLK/2rP7KJJFGQK6PsKIk5/59kwtrbqO
 9zNfmLOVWG1zmtIanlFtElOb0ri0CfeHC96JIG+SM+pQ0MEoplYQkU863djEk24MJLbXuT+WT
 RyOufvE2yFh3HMIGq8ksT3abiAp8yPSSjCSx12FM3ABq89EQ7ND4DSeBUfw51gLR4xSZhfow/
 E+f1hy8LZ0SLv4PW/978IBDPi8a/SZ595vhqx+TnIhhgxG5gyq5+WVBG+tDBJvIY2Aa8=
X-TUID: ff6htwFo9Kn0

Le 03/09/2021 à 19:45, Philippe Mathieu-Daudé a écrit :
> Per https://discourse.gnome.org/t/port-your-module-from-g-memdup-to-g-memdup2-now/5538
> 
>    The old API took the size of the memory to duplicate as a guint,
>    whereas most memory functions take memory sizes as a gsize. This
>    made it easy to accidentally pass a gsize to g_memdup(). For large
>    values, that would lead to a silent truncation of the size from 64
>    to 32 bits, and result in a heap area being returned which is
>    significantly smaller than what the caller expects. This can likely
>    be exploited in various modules to cause a heap buffer overflow.
> 
> Replace g_memdup() by the safer g_memdup2() wrapper.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> ---
>   tests/qtest/libqos/ahci.c   | 6 +++---
>   tests/qtest/libqos/qgraph.c | 2 +-
>   2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/tests/qtest/libqos/ahci.c b/tests/qtest/libqos/ahci.c
> index fba3e7a954e..eaa2096512e 100644
> --- a/tests/qtest/libqos/ahci.c
> +++ b/tests/qtest/libqos/ahci.c
> @@ -639,8 +639,8 @@ void ahci_exec(AHCIQState *ahci, uint8_t port,
>       AHCIOpts *opts;
>       uint64_t buffer_in;
>   
> -    opts = g_memdup((opts_in == NULL ? &default_opts : opts_in),
> -                    sizeof(AHCIOpts));
> +    opts = g_memdup2((opts_in == NULL ? &default_opts : opts_in),
> +                     sizeof(AHCIOpts));
>   
>       buffer_in = opts->buffer;
>   
> @@ -860,7 +860,7 @@ AHCICommand *ahci_command_create(uint8_t command_name)
>       g_assert(!props->ncq || props->lba48);
>   
>       /* Defaults and book-keeping */
> -    cmd->props = g_memdup(props, sizeof(AHCICommandProp));
> +    cmd->props = g_memdup2(props, sizeof(AHCICommandProp));
>       cmd->name = command_name;
>       cmd->xbytes = props->size;
>       cmd->prd_size = 4096;
> diff --git a/tests/qtest/libqos/qgraph.c b/tests/qtest/libqos/qgraph.c
> index d1dc4919305..109ff04e1e8 100644
> --- a/tests/qtest/libqos/qgraph.c
> +++ b/tests/qtest/libqos/qgraph.c
> @@ -93,7 +93,7 @@ static void add_edge(const char *source, const char *dest,
>       edge->type = type;
>       edge->dest = g_strdup(dest);
>       edge->edge_name = g_strdup(opts->edge_name ?: dest);
> -    edge->arg = g_memdup(opts->arg, opts->size_arg);
> +    edge->arg = g_memdup2(opts->arg, opts->size_arg);
>   
>       edge->before_cmd_line =
>           opts->before_cmd_line ? g_strconcat(" ", opts->before_cmd_line, NULL) : NULL;
> 

Applied to my trivial-patches branch.

Thanks,
Laurent
