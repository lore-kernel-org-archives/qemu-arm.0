Received: by 2002:a17:906:da85:b0:8b1:202f:4753 with SMTP id xh5csp3136713ejb;
        Tue, 21 Feb 2023 02:54:21 -0800 (PST)
X-Google-Smtp-Source: AK7set8/Q/BuOw1je/dmPKCzudl1Sv+9BTujpIenrHkIvMvyEIBDOqe6mtKAhtZEyKbyn1++hUiP
X-Received: by 2002:a05:6214:e4f:b0:571:cb52:7ee2 with SMTP id o15-20020a0562140e4f00b00571cb527ee2mr1058177qvc.52.1676976861519;
        Tue, 21 Feb 2023 02:54:21 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1676976861; cv=none;
        d=google.com; s=arc-20160816;
        b=pEcBsU4OHY89gszyLbvpPU3atcPm6a4u0ZXWBTuL9N6sTkZf3ZTWvSG3Ev6z7IjSCu
         i6ovOhIOVb5UgMjHVo4/vy3f2xE1OmZcQ0icCBDb6mCW+72WYgZPm2d+EYl4rDOlBOLu
         0jZh2/9qEM+Hd7Ccye/pHYGQ/GHTrgAQnwatJ9AYOxX1j41Bq8Gl/SGYBN/EMKNhbSXJ
         B0BFaY1pozoF95WNpm46CUQiJsdKQiEYR4HXSPYJrzRvbFdIRSRtlq1A/UtMvUEwfX12
         8mnhjolif1g6UHNIhSJCXiIMXeWK3AEGeAfhreNH2+SkdqADl/z8AK5s9bRd4qUeiEAZ
         4DKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=R3YpjBhhQT4ScmvOdNKZrTwBto6NUHRu6NxozrhSlQk=;
        b=Gr3JjLA/2qxnpct+ZrNy+kWEC8Dbpmb5/Biz7Z8hjUzVr8kRE0cLx4ZHiiaemsXNKE
         qZSmNamcejkOc12cNACE3tibhP8Tmt/3u0MADEQBCGkLSyGlR4bmSkemhaYMWeAHiNXr
         Cr4McNKgnvBq80bNKbW8ZkxwLWKPP43afWFOYwqj+ishl9sjjcC934ndS1mOqygJobFQ
         nSkgQxGGVMLa3J+PD3uFZ5g38zBBGAtY7cxjN1f8TEANirEM+QuSlLkJbVxrmuhZ0jlK
         JmbUC/aHDsWWhOu9J3U3BkHNW08Sr6fdWoJttup86OU26H3tZ9A24q8sATVjZEvhC2Ab
         +4Tg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=RKeGyeaa;
       spf=pass (google.com: domain of thuth@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <thuth@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id k26-20020a0c971a000000b0056f2ba3d7c0si9610128qvd.353.2023.02.21.02.54.21
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Feb 2023 02:54:21 -0800 (PST)
Received-SPF: pass (google.com: domain of thuth@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=RKeGyeaa;
       spf=pass (google.com: domain of thuth@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1676976861;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=R3YpjBhhQT4ScmvOdNKZrTwBto6NUHRu6NxozrhSlQk=;
	b=RKeGyeaadRy6Rr9n9cIEudIvdEYrmXQyqDDzz6pX9j7pvCmwpZ/CLdjEm6/7qd5JG688/r
	9y+y+k29QwspoXjqy6pjX9bF9a+c7tpaNNS2Vznzeb0oKh1oVEDC0xbLa9JaL4+6mODGF5
	e46F3VOHeGTdU7ui+tu6QL+8FLTtnQc=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-164-vOu6UtBpP9u3dY51hpL-cA-1; Tue, 21 Feb 2023 05:54:19 -0500
X-MC-Unique: vOu6UtBpP9u3dY51hpL-cA-1
Received: by mail-wm1-f69.google.com with SMTP id z6-20020a7bc7c6000000b003e0107732f4so1895963wmk.1
        for <alex.bennee@linaro.org>; Tue, 21 Feb 2023 02:54:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=R3YpjBhhQT4ScmvOdNKZrTwBto6NUHRu6NxozrhSlQk=;
        b=VbKWA8q02sL7bgsE9+VbSCdgIaT1IOR9QhiVwv01l9MRD6un+jAZYsNTkOK4cFN68E
         qekegyQgBWBU7kR1wwZ+qaRMvAZDzanPvE32JhlhRdEODpFIce5ZM5wXgyBA2EYvWU7A
         16qKCjqDc8DURi5nazwWNL2w4Uoioahw9/TZLc0gFTWB7dp4zpaa7oiokjS98qYruo/p
         KlZtgMhq2pnP2tp6RnVo3Xk1m+c/4RgNAlNrO/LRkcNPIsbzwnEAAVQdGhg0ovkVJQxi
         mfxyaSh6wyBisWpM9C2peSKOdMDEc4MfM8AURMzheVe1WXpeelRKuSZ+6n/GJtPX+IiD
         o9IA==
X-Gm-Message-State: AO0yUKVLILALsdJrpuBQ0lLZfLC7xCn1cn/HYEtcNRyBFsHkEhTHKHEW
	42P0feKttWHESSsDytwZjb+0fFoeHbk/eSqVjyj5WObUAcp39E7pOc5N0T2/fM95r383JAhGkbY
	CUMs6VVAK0mScbI31bO0RWLL77LvB+awHIYOHUvlA7/wVUSoxcNbU8Cs5HZmLVVZwzwUEWLk6
X-Received: by 2002:adf:e689:0:b0:2c5:5da4:a3b1 with SMTP id r9-20020adfe689000000b002c55da4a3b1mr4648669wrm.69.1676976858771;
        Tue, 21 Feb 2023 02:54:18 -0800 (PST)
X-Received: by 2002:adf:e689:0:b0:2c5:5da4:a3b1 with SMTP id r9-20020adfe689000000b002c55da4a3b1mr4648627wrm.69.1676976858454;
        Tue, 21 Feb 2023 02:54:18 -0800 (PST)
Return-Path: <thuth@redhat.com>
Received: from [10.33.192.205] (nat-pool-str-t.redhat.com. [149.14.88.106])
        by smtp.gmail.com with ESMTPSA id u9-20020a5d5149000000b002c550eb062fsm2901414wrt.14.2023.02.21.02.54.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Feb 2023 02:54:17 -0800 (PST)
Message-ID: <d7ab036c-9a0b-5217-32cd-292ca1e55b5d@redhat.com>
Date: Tue, 21 Feb 2023 11:54:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH v2 08/14] tests: don't run benchmarks for the tsan build
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 Markus Armbruster <armbru@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Yonggang Luo <luoyonggang@gmail.com>, Li-Wen Hsu <lwhsu@freebsd.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Ed Maste <emaste@freebsd.org>,
 Bandan Das <bsd@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 Qiuhao Li <Qiuhao.Li@outlook.com>, qemu-block@nongnu.org,
 Beraldo Leal <bleal@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 qemu-arm@nongnu.org, Michael Roth <michael.roth@amd.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>, Alexander Bulekov
 <alxndr@bu.edu>, Darren Kenny <darren.kenny@oracle.com>,
 Aurelien Jarno <aurelien@aurel32.net>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 John Snow <jsnow@redhat.com>, =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?=
 <berrange@redhat.com>
References: <20230221094558.2864616-1-alex.bennee@linaro.org>
 <20230221094558.2864616-9-alex.bennee@linaro.org>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20230221094558.2864616-9-alex.bennee@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: AXqeArDhDnz2

On 21/02/2023 10.45, Alex Bennée wrote:
> All we are really doing here is checking that TSAN builds compile and are
> therefor a tool available to developers. The benchmarks are not
> representative of QEMU's actual threading behaviour and they burn
> precious CI time. Indeed switching to check-unit reveals many
> unaddressed issues which have been logged at:
> 
>    https://gitlab.com/qemu-project/qemu/-/issues/1496
> 
> So for now disable the make check and make this a build only
> test.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>   .gitlab-ci.d/buildtest.yml | 1 -
>   1 file changed, 1 deletion(-)
> 
> diff --git a/.gitlab-ci.d/buildtest.yml b/.gitlab-ci.d/buildtest.yml
> index 8f332fc36f..e9a67e0191 100644
> --- a/.gitlab-ci.d/buildtest.yml
> +++ b/.gitlab-ci.d/buildtest.yml
> @@ -465,7 +465,6 @@ tsan-build:
>       CONFIGURE_ARGS: --enable-tsan --cc=clang-10 --cxx=clang++-10
>             --enable-trace-backends=ust --enable-fdt=system --disable-slirp
>       TARGETS: x86_64-softmmu ppc64-softmmu riscv64-softmmu x86_64-linux-user
> -    MAKE_CHECK_ARGS: bench V=1
>   
>   # gcov is a GCC features
>   gcov:

Reviewed-by: Thomas Huth <thuth@redhat.com>
