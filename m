Received: by 2002:a19:6d5:0:0:0:0:0 with SMTP id 204csp3212243lfg;
        Tue, 9 Mar 2021 14:13:37 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzXHfxJxtgC/xx9bixzf3//cT4dl7Jk0T358jZStnftniuaM/im/ljgmgqDYiFt/3YO6Rhf
X-Received: by 2002:adf:9bd7:: with SMTP id e23mr76138wrc.48.1615328017232;
        Tue, 09 Mar 2021 14:13:37 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1615328017; cv=none;
        d=google.com; s=arc-20160816;
        b=rgbZ+GukMlcVmR+oB1e+fkxkh1GJpNMTUkbRFx15u2yASKwQeoCe1I4rlRmdNnNLeY
         Mz7fIj0pvqRrN9fy6eyvFUxUc2HuVOIrrdeY9VJSP0A5LXxTEjgjFL7ZKfQLLyVtKtdH
         p0BDtbrbOGYbPvwti3cuqr+p+/OIFHR3tbLH/guXQCJS4IGWNYLpXIymqIZ5UxlfC6Y3
         c56trMtOtArg/2zLeQspM8MuZvJKMH2y+FuqdE9TkmdDPceJr2zmipQAnMDVwm4o5O5c
         e1/5TlLb6/uL6gqaA/hR/JQU8DKPsiSRQmzKhY4bophl087/cqJRFejzp4JBC8ww+Tcn
         RJmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject;
        bh=YT+qt9htbhNa1aq4wxIFjqqPqakO+SDoEUsnlRSP+pc=;
        b=TncsQlKkbHD3liMN4TUJZiRJz4ms8avw7fJbJmBbQTTk7GY9CLSbUskRgJz1v3trCa
         vADpFBDL3w4Efg5pugPP6V6ZN5YF/CYLcm61BXjZ7h/oJUm5aUyGkb+m/Mif0zaO3n6S
         5mirGe6vKrVEt+t4p/ETKBnkstn08nHPGHUkp/TTe8WAoZPhsfTMD3OeKFyaBYpmzLKO
         Nxk7eiJCExF/VHawB1jvzLXE/lAtBLhRedfPFAvlnrqNcmcnDAR+Cm46liOSv6fiRcfD
         /bUDQeyxrc2AKA2i8BuUtsxoKbmGqIESo7SXzpHgSrUGyh0cEITpCo3ghDuQ0CpNk0cx
         3woA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=neutral (google.com: 212.227.17.10 is neither permitted nor denied by best guess record for domain of laurent@vivier.eu) smtp.mailfrom=laurent@vivier.eu
Return-Path: <laurent@vivier.eu>
Received: from mout.kundenserver.de (mout.kundenserver.de. [212.227.17.10])
        by mx.google.com with ESMTPS id k11si15313801wrv.53.2021.03.09.14.13.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Mar 2021 14:13:37 -0800 (PST)
Received-SPF: neutral (google.com: 212.227.17.10 is neither permitted nor denied by best guess record for domain of laurent@vivier.eu) client-ip=212.227.17.10;
Authentication-Results: mx.google.com;
       spf=neutral (google.com: 212.227.17.10 is neither permitted nor denied by best guess record for domain of laurent@vivier.eu) smtp.mailfrom=laurent@vivier.eu
Received: from [192.168.100.1] ([82.142.6.26]) by mrelayeu.kundenserver.de
 (mreue109 [213.165.67.119]) with ESMTPSA (Nemesis) id
 1MaIvT-1lDrLg2j3N-00WEYS; Tue, 09 Mar 2021 23:13:29 +0100
Subject: Re: [PATCH 1/2] sysemu/runstate: Let runstate_is_running() return
 bool
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
Cc: Fam Zheng <fam@euphon.net>, Peter Maydell <peter.maydell@linaro.org>,
 Dmitry Fleytman <dmitry.fleytman@gmail.com>, kvm@vger.kernel.org,
 Paul Durrant <paul@xen.org>, Jason Wang <jasowang@redhat.com>,
 David Hildenbrand <david@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Stefano Stabellini <sstabellini@kernel.org>, qemu-block@nongnu.org,
 qemu-trivial@nongnu.org, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>, Huacai Chen <chenhuacai@kernel.org>,
 Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Anthony Perard <anthony.perard@citrix.com>, qemu-ppc@nongnu.org,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Amit Shah <amit@kernel.org>,
 Richard Henderson <richard.henderson@linaro.org>, Greg Kurz
 <groug@kaod.org>, Alex Williamson <alex.williamson@redhat.com>,
 qemu-arm@nongnu.org, =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 Stefan Hajnoczi <stefanha@redhat.com>, xen-devel@lists.xenproject.org,
 Sunil Muthuswamy <sunilmut@microsoft.com>, John Snow <jsnow@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>, Kevin Wolf <kwolf@redhat.com>,
 Marcelo Tosatti <mtosatti@redhat.com>, qemu-s390x@nongnu.org,
 Max Reitz <mreitz@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Aurelien Jarno <aurelien@aurel32.net>
References: <20210111152020.1422021-1-philmd@redhat.com>
 <20210111152020.1422021-2-philmd@redhat.com>
From: Laurent Vivier <laurent@vivier.eu>
Message-ID: <07895651-8d3f-5029-f53d-c85046a4d671@vivier.eu>
Date: Tue, 9 Mar 2021 23:13:24 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210111152020.1422021-2-philmd@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:12XOd/fQZjSctmbivNeZ1JZuQewWmbkfNL57bgUQXmbdKx9dqLq
 HByZ1sycMG2xd1f+Y6yoJ/TNHv1q6ARh/FZPZEs0rYlTXo9PPylXUW3db8Eoe56W/2ymSKS
 /crueO/Fx3A1swwtZA4GcywniuEYh2T+g3qQCTjORZGEdqbUjOU+rQWriBAh+Sl4PrvEl7W
 vTfr73lCewZh9adojPJ2A==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:0bXVhwhndoo=:bFHdv36pWdMKsFzU/9x10J
 fmKQKyh8l7iyerCElMGY2yYMA3QZwQ6jbBMMIVsI6KEc+S2AIhKNe7HuCowVP5x4JzeuftrFe
 e1+4vqqbDGJ3WGNzmpMYAhJ0Njbl6/EAgMbtJQKAqVaryqK3xVT9dpbAwX3JzDGJqUfhAXoyN
 JdHgfLNttj3xq5oyOsgInECsqt4mS31a+Lqlsy422v8f/DZtEkiOmSHFr077kI8kzB2J7k7HL
 Pq97nLqxOVL/HO97G3GmXoeFA/rtuZlezrPfR0HVlsWTR+XvzwO9rqlp5Web+tuIavvic7Vu+
 m8uJOnVXHSJSFQaDy0PAXdj4FDanqvaZ9O1bOj3zb6DcA1MOhXI+XZ/DB4Tt3isCVhPMAk1oI
 uru20n4qviPJbzX7PPt7Bo/L3VJeJyDIUhcqJHkgj+lgqfnL42QDBDbdSpSHhQ3q3VgvXUM2Y
 KfFETldzFg==
X-TUID: HAGSLONBrfB8

Le 11/01/2021 à 16:20, Philippe Mathieu-Daudé a écrit :
> runstate_check() returns a boolean. runstate_is_running()
> returns what runstate_check() returns, also a boolean.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> ---
>  include/sysemu/runstate.h | 2 +-
>  softmmu/runstate.c        | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/include/sysemu/runstate.h b/include/sysemu/runstate.h
> index e557f470d42..3ab35a039a0 100644
> --- a/include/sysemu/runstate.h
> +++ b/include/sysemu/runstate.h
> @@ -6,7 +6,7 @@
>  
>  bool runstate_check(RunState state);
>  void runstate_set(RunState new_state);
> -int runstate_is_running(void);
> +bool runstate_is_running(void);
>  bool runstate_needs_reset(void);
>  bool runstate_store(char *str, size_t size);
>  
> diff --git a/softmmu/runstate.c b/softmmu/runstate.c
> index 636aab0addb..c7a67147d17 100644
> --- a/softmmu/runstate.c
> +++ b/softmmu/runstate.c
> @@ -217,7 +217,7 @@ void runstate_set(RunState new_state)
>      current_run_state = new_state;
>  }
>  
> -int runstate_is_running(void)
> +bool runstate_is_running(void)
>  {
>      return runstate_check(RUN_STATE_RUNNING);
>  }
> 

Applied to my trivial-patches branch.

Thanks,
Laurent
