Received: by 2002:adf:9061:0:0:0:0:0 with SMTP id h88csp1055047wrh;
        Thu, 9 May 2019 10:40:10 -0700 (PDT)
X-Received: by 2002:a5d:55cc:: with SMTP id i12mr4162009wrw.179.1557423610407;
        Thu, 09 May 2019 10:40:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1557423610; cv=none;
        d=google.com; s=arc-20160816;
        b=uRdkqs0w/rQq5YWm8wM2zDBXhAIEZ5+tCoTKfMGrjJ6nR9G30CrZxkyvAYTDxFZjcD
         hxrcGSRYyQZXeitCF0QBZPporEU6nLSrIdHwFQIx2ZXISNEKcg6F7QIo66nfv29SP6O8
         yk3vyc7ccbKhjfhmD+TmzDgXD+VgH02jPMjOKZ7fyVVNWk9OzseT2irI2NjRXgPK4l/V
         ctHkJcqPqiFG7Zd+l55vtsvzPZNlqqoamoRj908FZgrQ/Etn+yAsxZqJQw9502aYghMh
         BlK5sNIwcx/5VqeRVJRcfpizrLlrSMCAtaUa1leJ+LRY1g5Je/hBk/+lGX55DqLuq5lt
         arTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:cc:to:subject;
        bh=fevb3l/p5zVEWGTm7Zi/zkky6bCKPzqheYXEJdK+uUA=;
        b=AtG7itWLPRa/xeVVgNFWlMG/SGt0iTkUSEnPK/pyfsNaBIoDlzBlA42CS3OFOREiLM
         VovEyirmmky4iOaj9iODD9egDNmVYgGB42i6h9r7aLx4m9QbEZmwlUs+5Ayv6Ebf3Pth
         zb/7t7P8DslTJ2C9eZLb7NO0UYt5uWgOJlsMsmgmZUp37VbB30HUdSKt4qTN/5cG9/EW
         c98/ObANt8m6q8X6oRlPy3l8YTk2LBL60i82z7M3AZB1Na1DFqZ+z9vrb5ZlL7mp3yWH
         /LSWL2+IpQeED6g4OxPajQYq8xDvsNmJuN1bppj5vb7ooD1bVNY746Uh+CAuP1174/Se
         vQMQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of philmd@redhat.com designates 209.85.220.65 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <philmd@redhat.com>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id m21sor1767725wmg.13.2019.05.09.10.40.10
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 09 May 2019 10:40:10 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@redhat.com designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of philmd@redhat.com designates 209.85.220.65 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=fevb3l/p5zVEWGTm7Zi/zkky6bCKPzqheYXEJdK+uUA=;
        b=Lhb/+/syP1Jipx/hIsvyLZgqXvyCFb3kIBBn8fSjJdfCx16ngSDlm+JU6BxiAQg0y3
         7bKZxqKomMOkP2F0nbYE53ADZ+aUwy9kvAYnqTDFzKAxvG/ydBXCKIIqpR9nK9nbRZpB
         HB9DPH9unTb7XL9WpCmyJhhR8Lg5Re3/txgy+dcwxmYxSJz7+ym9aoUHK+sdYO0930wc
         UCbanEEaVmyLFp52Wej/sqayI49QcdX/NQ0ysctMjgBPk+sVjeVZZqRdhOf6U8AGO4Hv
         e9vkDFVEGJfDF+NbaK99PMkyLgQuJBWww0b3dAn7xayz7zfqRQGwmzhubGaKmnEhDJrj
         aNIw==
X-Gm-Message-State: APjAAAWU2b0wtOvSJS+t3CHGfpIjGbEpaN0dfxIV++9x5Hg/vKrf6RdW
	Kzxfd30LD+kmYhJ8GR7EgpjG9w==
X-Google-Smtp-Source: APXvYqxo9tb18hOiu2nizx1mU2PxBMC9v4YJIlPg148ZlOJyCi4eWAJ3a/nELO2XiYhT1dekEilZzA==
X-Received: by 2002:a1c:7518:: with SMTP id o24mr3815304wmc.42.1557423610191;
        Thu, 09 May 2019 10:40:10 -0700 (PDT)
Return-Path: <philmd@redhat.com>
Received: from [192.168.1.33] (193.red-88-21-103.staticip.rima-tde.net. [88.21.103.193])
        by smtp.gmail.com with ESMTPSA id h12sm1674857wrq.95.2019.05.09.10.40.09
        (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
        Thu, 09 May 2019 10:40:09 -0700 (PDT)
Subject: Re: [PATCH v1 02/23] tests/docker: Test more components on the Fedora
 default image
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Fam Zheng <fam@euphon.net>
References: <20190509165912.10512-1-alex.bennee@linaro.org>
 <20190509165912.10512-3-alex.bennee@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Openpgp: id=89C1E78F601EE86C867495CBA2A3FD6EDEADC0DE;
 url=http://pgp.mit.edu/pks/lookup?op=get&search=0xA2A3FD6EDEADC0DE
Message-ID: <089bf7b5-8461-699b-4c9a-30c4d735282e@redhat.com>
Date: Thu, 9 May 2019 19:40:08 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190509165912.10512-3-alex.bennee@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: Xv0a2B/DbW4t

On 5/9/19 6:58 PM, Alex Bennée wrote:
> From: Philippe Mathieu-Daudé <philmd@redhat.com>
> 
> Install optional dependencies of QEMU to get better coverage.
> 
> The following components are now enabled:
> 
>   $ ./configure
>   ...
>   Multipath support yes
>   VNC SASL support  yes
>   RDMA support      yes
>   PVRDMA support    yes
>   libiscsi support  yes
>   seccomp support   yes
>   libpmem support   yes
>   libudev           yes
> 
> Note: The udev-devel package is provided by systemd-devel.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>

Acked-by: Marcel Apfelbaum<marcel.apfelbaum@gmail.com>

> Message-Id: <20190504055440.20406-1-philmd@redhat.com>
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>  tests/docker/dockerfiles/fedora.docker | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/tests/docker/dockerfiles/fedora.docker b/tests/docker/dockerfiles/fedora.docker
> index 69d4a7f5d75..afbba29adaa 100644
> --- a/tests/docker/dockerfiles/fedora.docker
> +++ b/tests/docker/dockerfiles/fedora.docker
> @@ -8,6 +8,7 @@ ENV PACKAGES \
>      bzip2-devel \
>      ccache \
>      clang \
> +    cyrus-sasl-devel \
>      device-mapper-multipath-devel \
>      findutils \
>      flex \
> @@ -23,13 +24,17 @@ ENV PACKAGES \
>      libaio-devel \
>      libasan \
>      libattr-devel \
> +    libblockdev-mpath-devel \
>      libcap-devel \
>      libcap-ng-devel \
>      libcurl-devel \
>      libfdt-devel \
> +    libiscsi-devel \
>      libjpeg-devel \
> +    libpmem-devel \
>      libpng-devel \
>      librbd-devel \
> +    libseccomp-devel \
>      libssh2-devel \
>      libubsan \
>      libusbx-devel \
> @@ -74,10 +79,12 @@ ENV PACKAGES \
>      pixman-devel \
>      python3 \
>      PyYAML \
> +    rdma-core-devel \
>      SDL2-devel \
>      snappy-devel \
>      sparse \
>      spice-server-devel \
> +    systemd-devel \
>      systemtap-sdt-devel \
>      tar \
>      usbredir-devel \
> 
