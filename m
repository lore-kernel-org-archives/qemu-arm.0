Received: by 2002:a05:7022:221:b0:5e:6ea8:9f07 with SMTP id 33csp200100dll;
        Wed, 15 Feb 2023 23:32:48 -0800 (PST)
X-Google-Smtp-Source: AK7set9WhJJTIOL+5V+zmXIkMHSjH3l/a3tC4hmNxPkasUI9kr0SD+LqgRLfEJSQ7vCoWHHzotHk
X-Received: by 2002:a05:622a:5c9:b0:3bc:d0de:6adf with SMTP id d9-20020a05622a05c900b003bcd0de6adfmr8201829qtb.31.1676532767970;
        Wed, 15 Feb 2023 23:32:47 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1676532767; cv=none;
        d=google.com; s=arc-20160816;
        b=Tt7JE8u/oCD/OapwDwI+K/je2Hjg7gMiSYCGEwl20ddazY4ipXkLozdI8IhB87zDgR
         BZLcbNsLn55AgtOsqllPHdwOdRkqYrnHERU0rUUE+U0x90Ljo2KHZ+5Sh1PAY0CSR8w4
         x9rh8P+uuqgrtKE3Uwhjbsp9hC7MYlYkpyNok6CixDEmK8ca0+D2zbqJeGGTo/SLFilh
         vXA+TJXnUpBiqOBvT5PLT+07Wt7ej3FB11l6NKSNOe7swJqcr/ErRQqQnEc4tGRlIrSl
         k57TNK7S/kfz+vnhXr8yRuDR6+uDefTIJnJqaMo0LTyYan4s8LbzBo2TFLoQgne4OwJG
         g61g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=vpYWYfCv9xvpyVMbEw/vB0QdfPlqAFjQcuseLsJL8RI=;
        b=ryA7+0k39EkSARF6+L6SWnBlwv91Ig4oHnR5Dq9zHXYpRWAkU22W4qC9+vouRVM6hp
         b7kdnSLKHioibI15kf8J1Rr/K3g7VQLPHeQIiqAVAOvxLsP0NTWGuwlw6M2i0HtJ7RTI
         mMtNbxPsYLTANmsCCIxd95y/OVBCSERQKS3RLCQVkWhtKUL/rg/OwhFmqqFA8JKS7ws4
         xrHoFcptj3m/r7Yr5eEns9sqITYSzcG0fZgFhyi1UqDq3Ot05I5iOiWS1UBu3EV+k27M
         AGJxeLGbtj9bztNCPn92miLc1Jm/tNwUkKhBSynoYTX6tFMWi87uT2d/keYpcAzf2dyK
         JLyg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=UM7WJ4pU;
       spf=pass (google.com: domain of thuth@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <thuth@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id t16-20020ac85890000000b003b9a5397c6fsi1087166qta.308.2023.02.15.23.32.47
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Feb 2023 23:32:47 -0800 (PST)
Received-SPF: pass (google.com: domain of thuth@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=UM7WJ4pU;
       spf=pass (google.com: domain of thuth@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1676532767;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vpYWYfCv9xvpyVMbEw/vB0QdfPlqAFjQcuseLsJL8RI=;
	b=UM7WJ4pUUOxYJKPTwikEqb+K9poICv7RwO+0R0oFbiriFqsGz5BzasiCcqYZEDayAKKxwU
	1zHbMVKejyPZBbmWpvR6yK7MG3RQviOx6K3JJAf9kuxA+/SMI1xEEmFL17+0BeAW6PV96b
	AiqQ73lWMjg1p9pltXeJ3B8oqF/ZIl8=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-624-ifAqTfthP7KbMxK088nqvw-1; Thu, 16 Feb 2023 02:32:44 -0500
X-MC-Unique: ifAqTfthP7KbMxK088nqvw-1
Received: by mail-qk1-f198.google.com with SMTP id c9-20020a05620a11a900b0072a014ecc4aso686757qkk.18
        for <alex.bennee@linaro.org>; Wed, 15 Feb 2023 23:32:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vpYWYfCv9xvpyVMbEw/vB0QdfPlqAFjQcuseLsJL8RI=;
        b=1D4+DsiOojZGF2/VABGWN4XRYrxh5sPPa3v/swZObv4gctnWtIyfuSP3awPjMqqXmP
         83Kk5V+5Di0IFY3t/2XGF9YBoY0Ydlg9D24WM5ISZM1RXbiN/UCr7OgzhP03SRTneHfW
         LR+4auRwDetIYkN56AKYO8TaeG3T4b4DoGlwPsKan9r4lwqhIrV8L5zIjxTkPo79qnG7
         SfB3SyU6gmr/2zeJAZcye3+sFjhqAEgN5WAph+Zp3kaeYJUBVGjVsGJpF8uvdSt9yRFN
         hmgJSnXc+ipMPJ5gP9IcE7xGKtDxIrFur08YirA4Ema2caON4wIldiQqyJ5+RFY6EIOW
         E1RQ==
X-Gm-Message-State: AO0yUKXAvmA253byKZPSHjzbedaO8DtYrO8l7r6taFlk3xyVUtJPk5qh
	zFN99ksdLoYgQ6MEyXe2Dc9R36rShIoVL6q4KztisgyWbTiTT/7zEO+q9P9JyJ/C6RJwXp9YLkE
	hU3ca+MCWGvYsvKBtSTJJDxzeyBpO8Q+LxN/qyVJ1fbdk1evkyMKcuQ4vhOxhKuwufc8zs0Ka
X-Received: by 2002:ac8:570f:0:b0:3b9:abfb:61cd with SMTP id 15-20020ac8570f000000b003b9abfb61cdmr8301777qtw.26.1676532763853;
        Wed, 15 Feb 2023 23:32:43 -0800 (PST)
X-Received: by 2002:ac8:570f:0:b0:3b9:abfb:61cd with SMTP id 15-20020ac8570f000000b003b9abfb61cdmr8301728qtw.26.1676532763497;
        Wed, 15 Feb 2023 23:32:43 -0800 (PST)
Return-Path: <thuth@redhat.com>
Received: from [192.168.0.2] (ip-109-43-176-144.web.vodafone.de. [109.43.176.144])
        by smtp.gmail.com with ESMTPSA id e4-20020ac84e44000000b003b9bca1e093sm814019qtw.27.2023.02.15.23.32.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Feb 2023 23:32:43 -0800 (PST)
Message-ID: <9d47c51d-07bb-d951-0656-688abb625062@redhat.com>
Date: Thu, 16 Feb 2023 08:32:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH 01/12] gitlab: tweak and filter ninja output to reduce
 build noise
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: Michael Roth <michael.roth@amd.com>, Alexander Bulekov <alxndr@bu.edu>,
 Qiuhao Li <Qiuhao.Li@outlook.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 Markus Armbruster <armbru@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-arm@nongnu.org, John Snow <jsnow@redhat.com>,
 Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>,
 Darren Kenny <darren.kenny@oracle.com>, Stefan Hajnoczi
 <stefanha@redhat.com>, Bandan Das <bsd@redhat.com>,
 Cleber Rosa <crosa@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Yonggang Luo <luoyonggang@gmail.com>, Li-Wen Hsu <lwhsu@freebsd.org>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, Ed Maste <emaste@freebsd.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>
References: <20230215192530.299263-1-alex.bennee@linaro.org>
 <20230215192530.299263-2-alex.bennee@linaro.org>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20230215192530.299263-2-alex.bennee@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: 3/pZeWDh5PRV

On 15/02/2023 20.25, Alex Bennée wrote:
> A significant portion of our CI logs are just enumerating each
> successfully built object file. The current widespread versions of
> ninja don't have a quiet option so we use NINJA_STATUS to add a fixed
> string to the ninja output which we then filter with grep. If there
> are any errors in the output we get them from the compiler.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>   .gitlab-ci.d/buildtest-template.yml | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/.gitlab-ci.d/buildtest-template.yml b/.gitlab-ci.d/buildtest-template.yml
> index 73ecfabb8d..3af51846cd 100644
> --- a/.gitlab-ci.d/buildtest-template.yml
> +++ b/.gitlab-ci.d/buildtest-template.yml
> @@ -21,7 +21,7 @@
>         then
>           ../meson/meson.py configure . -Dbackend_max_links="$LD_JOBS" ;
>         fi || exit 1;
> -    - make -j"$JOBS"
> +    - env NINJA_STATUS="[ninja][%f/%t] " make -j"$JOBS" | grep -v "\[ninja\]\[.*[123456789]/"
>       - if test -n "$MAKE_CHECK_ARGS";
>         then
>           make -j"$JOBS" $MAKE_CHECK_ARGS ;

Not meant as a veto, but just for the records: I still don't like the idea. 
Having a log of the files that got compiled is still sometimes useful for 
me, e.g. when I want to check whether a certain file has been compiled at 
all or not (when e.g. debugging meson.build problems). So I'm still in 
favour of dropping this patch.

IMHO if you want to shorten the build log in the CI, please get those chatty 
softfloat tests fixed instead.

  Thomas
