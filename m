Received: by 2002:a19:791d:0:0:0:0:0 with SMTP id u29csp582593lfc;
        Fri, 17 Dec 2021 02:58:15 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwG80KV1o6NIUmsb41NCfuZs8WBqNbX+5cK6uFGbo+zkL3T+xkjCdooThl49AfFVu4DIi0a
X-Received: by 2002:adf:bbcf:: with SMTP id z15mr2067536wrg.246.1639738695613;
        Fri, 17 Dec 2021 02:58:15 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1639738695; cv=none;
        d=google.com; s=arc-20160816;
        b=B21OXoBGj8HXqaKABTLw31jksCQ6OxGa7R2KOw9yGWzJZjUAiVbCbdsHWJz/E8nzEX
         m/zC9VY2qV4AkXr2hPIPc96NLWgdDBpa7TdbAZeHVG9ST4TFGBdsifSSwg2rLZj7C2vg
         QN2GdozxeLwAn2ZAA0r5Q+eLnn5CQAqC+t+Dz8Ti5bODrkpmqAiGI95XXlcok6bUnhQx
         zuq/2wEI/oRM0gNXSuKZifxQKAIKWKngAG0Mam/X6nDed848UQjmVEbqzMscCNAWusY7
         gN0F2v1xvtSncrr4/y7mTsXsVl15/zMw30lkI/wo98xJAAC6XhgYl4sbZLUXeSMeDlvO
         EGog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id;
        bh=ftF3e48nNtHw2nfgXuljJbI17QRdQZEhtErDHOpgFuU=;
        b=LwbP6atzHErb3oNJhbcgDGoB99dfQB7NsIHN1n4xALNNusDi4Iyt5BboA3OxKweGi5
         fpO3hVmzgZH87sdAwI3YTH6GRJEer/OUcTdF2a6LNp9BSan6aBIXrNKt6QzLg2D3V7qE
         AaYDf6y62I+v5eix4xrpTK5Bmf1/t+rHzkUg+oPLb1pkQKk1vpWNxQdAy9Jz2zI1Qske
         4+yyT4ajJ1SNpv9n/VZ79Q39TGEfDzyVVkiVmUGiWtgAIPnFyURHscFRsLSdqz65zRfd
         qSSsu+inP3Trzxemk3pu7we0vgZoaDKEqy3AYtK7baXXk7cxkm4+QtHXTBFn9OP5HJ17
         p52A==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=neutral (google.com: 217.72.192.73 is neither permitted nor denied by best guess record for domain of laurent@vivier.eu) smtp.mailfrom=laurent@vivier.eu
Return-Path: <laurent@vivier.eu>
Received: from mout.kundenserver.de (mout.kundenserver.de. [217.72.192.73])
        by mx.google.com with ESMTPS id m6si9984874wmm.223.2021.12.17.02.58.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Dec 2021 02:58:15 -0800 (PST)
Received-SPF: neutral (google.com: 217.72.192.73 is neither permitted nor denied by best guess record for domain of laurent@vivier.eu) client-ip=217.72.192.73;
Authentication-Results: mx.google.com;
       spf=neutral (google.com: 217.72.192.73 is neither permitted nor denied by best guess record for domain of laurent@vivier.eu) smtp.mailfrom=laurent@vivier.eu
Received: from [192.168.100.1] ([82.142.30.186]) by mrelayeu.kundenserver.de
 (mreue109 [213.165.67.119]) with ESMTPSA (Nemesis) id
 1M2fDl-1mvgli1HJv-004AG0; Fri, 17 Dec 2021 11:58:09 +0100
Message-ID: <ccf6ab1b-b895-97fb-36e8-2fbf09418a76@vivier.eu>
Date: Fri, 17 Dec 2021 11:58:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH v3 28/28] checkpatch: Do not allow deprecated g_memdup()
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
 <hreitz@redhat.com>, qemu-ppc@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>
References: <20210903174510.751630-1-philmd@redhat.com>
 <20210903174510.751630-29-philmd@redhat.com>
From: Laurent Vivier <laurent@vivier.eu>
In-Reply-To: <20210903174510.751630-29-philmd@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:6NEnexmQzBCoQmA6bNps6a0/TntX3VGSN6LNezQcFtncqelRKJK
 5sIJwqpvuU46u4Mu5vGiuO6SuRyLRLk7Qpybe0XuuE6e3f73TY0+2IU4nR4dXmx6MdGzu68
 SLO++7gVaxRW6VC8k+tWjlt9o7BQegziTd1Ll0f1o6qVTQCgeAEsdz7+v8Sqe4ukhg0Ajvo
 GUbyzKXo6R4Ad4dphuWvQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:FefQycjONOI=:ie1Gyivo7IM0RRo8PTn/pJ
 6n1CvSJLdyOunVFAWWUygO2baINgiuxg2P0FQ6sbevDG/m3HWl60mt2dRtd3LnR8eFuUvyC4p
 ayLWyvT0ZBMMKD19ExcDRS1aOj94GFwy0ty8sn8jqqFbdm1XgET6jN5okl51/kss3Vn5Mcfgb
 2vgdLK9lWj3Z/Sx/ECmHfvjKGksIhv7v0tt4/OzTK0I/5NwMMmkci1S+9RKtxdv0l7OvxjMdX
 cVAjK47/TGkEJPM9Tf+XEbrr/f7t8hvcz4Ii7Vq5ZxIFQIoJlWHC4mo+wA7h6rCK90x+gX/uQ
 60oJtp+FIUKwFxRkR1+qzTYUSMqbWdx5sRFEMElzgDCWRMGMHcXZ5ho+Djpgz981BIUX7gAaO
 qrofdSUrYqfLwVpj157BxP/D9zgQJlqj9jwc14amyWG/L+Xs6DgfKBgvddE2HojXf3JI1TB+a
 wttFuTltNnXVRfvZlOtuB71s5L0W6JNBcprIhYNxmhZHJoB9mpmxpNutiyHWT/nS4mKvBkbwe
 aJK5rtQfu70NYN57kzNA5vEnbRHDTOI16+Z7JXsbwdAD6+8yoe1JZEKGhaQ6KRsJtOt1VTcAz
 xtJcJyRpGISfsyY/YFXzGMlxTLRCb+NOOjmrIHHZ+RtKBUuEUV/n5jflGO2G6XXQWnr1g0Nhz
 URr+HS+bAUi+HqN/bmthr0LyiMX7AVGJBwJ10B6oUwoM8etzd64Y8052Qp8dPIb80WEo=
X-TUID: ejVmsUgYxrnF

Le 03/09/2021 à 19:45, Philippe Mathieu-Daudé a écrit :
> g_memdup() is insecure and as been deprecated in GLib 2.68.
> QEMU provides the safely equivalent g_memdup2() wrapper.
> 
> Do not allow more g_memdup() calls in the repository, provide
> a hint to use g_memdup2().
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> ---
>   scripts/checkpatch.pl | 5 +++++
>   1 file changed, 5 insertions(+)
> 
> diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
> index cb8eff233e0..5caa739db48 100755
> --- a/scripts/checkpatch.pl
> +++ b/scripts/checkpatch.pl
> @@ -2850,6 +2850,11 @@ sub process {
>   			WARN("consider using g_path_get_$1() in preference to g_strdup($1())\n" . $herecurr);
>   		}
>   
> +# enforce g_memdup2() over g_memdup()
> +		if ($line =~ /\bg_memdup\s*\(/) {
> +			ERROR("use g_memdup2() instead of unsafe g_memdup()\n" . $herecurr);
> +		}
> +
>   # recommend qemu_strto* over strto* for numeric conversions
>   		if ($line =~ /\b(strto[^kd].*?)\s*\(/) {
>   			ERROR("consider using qemu_$1 in preference to $1\n" . $herecurr);
> 

Applied to my trivial-patches branch.

Thanks,
Laurent
