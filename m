Received: by 2002:a17:907:1627:b0:8ed:b3f:fd98 with SMTP id hb39csp6790783ejc;
        Wed, 1 Mar 2023 02:36:33 -0800 (PST)
X-Received: by 2002:a05:600c:444e:b0:3eb:40de:9838 with SMTP id v14-20020a05600c444e00b003eb40de9838mr4622316wmn.7.1677666993051;
        Wed, 01 Mar 2023 02:36:33 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1677666993; cv=none;
        d=google.com; s=arc-20160816;
        b=Oy6bHOiXSpBZA8yhzaJ+zteGGdJI1HFbxvda0JHfZlvgJ9iDJN5K365H3ydyV7E/y8
         8AG8Fry13RCn+iM+jrHv0gKWU3EP5JpQj8V7C1WU7hDvQ9SAVFbXGvSuBLn2RcYnLUtT
         oiQ3kqjiy61xRmEt3w3/JEt/S5162/IqygkK4NdVcw9ywiW+8RZ3TfZ61IdB4elK4DjZ
         QB1spve0OaRQ9Tfc2u3W7qypFT6+2DepUplBgYFnnM5n9pPj2bkg4hyg3/CQkFfK2blc
         iF9MFHzWjitVPdEIyeQ9WKGeVems47FXovei8SzQ3rp9ERWA+s0kBtlWVqsZ8I8qQy8d
         xsWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=2Azoh8xSU5TJ2zojXyKIHJjeHgyY2Otsjeo2O616Z/E=;
        b=KNVXP9cDv5zZbphGAw8tUcTOpmhfPtU6Lnafo04QSEqLL4UD4u9Va6RaMYCBPo6wY6
         FV0BmxvCYciwGuNWiRO3bKaHLfY00N7FYKf86dACoDt7G39kwxUT0btwIGmNPmdec+kZ
         Di+r1wr+9tLwv+oWgfpUMUcbzfbuK/Trs+WYm/WEDJMZ0OwQ71tZXwHOBWrWSsqu4ea/
         p2taPWfVUzINn+U6ivvErCTDL1vfzBnPn1yyE8Ighh3TbpT6SqHKtOr8qkv9OkSD9eyc
         B2U84qHCtxDOQ1ZGcnUlL8u1f/UuXJw/xozgsno2lTP7cYzctnx1nfAdcO3JVbvdGpL5
         6BUQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=MomJXPLw;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id f6-20020a05600c4e8600b003e206c8065asor3582860wmq.8.2023.03.01.02.36.33
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 01 Mar 2023 02:36:33 -0800 (PST)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=MomJXPLw;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1677666992;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2Azoh8xSU5TJ2zojXyKIHJjeHgyY2Otsjeo2O616Z/E=;
        b=MomJXPLw6+iDG4sN17aGuvICmyfpwP31iyI5zx6XY5gqQQhf/8wJt3wlkPK2hzzX9R
         if+afbT5jmbXAkEBFgk4mR6ALEIQ+TKygiBgSaZoA8i/5h9J1IS5eKgtYKNgM2OTk2EC
         htZM4Qp+Jpt+5OhxyHFWjUvKSMgCJ6xM9JjI1JJ9skacX7jiMfi1GLxUoYbpYvJVW811
         poAxvaMy3BdG/sJMY1noHRfmtxj81KsBQBB/ePgIJWxVRv6FSknW6R7U6/mykRLUKi9H
         74Dt/ThY48ExkGh2Aho+fW46PJQ4cULf+9Zc9MkteZ2CCbmJ0sKu3fXTmI3E08re8YgZ
         nlZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677666992;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2Azoh8xSU5TJ2zojXyKIHJjeHgyY2Otsjeo2O616Z/E=;
        b=KHFauuc3xhOOZf+K5irWKv9xrRViSMbtez/lbUe1GMmrqG+xUpffS6uvvBffo8xphz
         15QMV5WgqMyv12Q7Mn41k3Gr5ETyxmQB63E0GZTMkVXulwW9CY2lt20t+z+6/mOahkci
         +BAwu1chV3QgTNBleldIbTeEdkBIhrEWHipKBEeICI/dOz5gUe8qJsLcidz4ju/3tmgq
         r/e9hgK/mU8j+NhyeLWgVhPxy6ScQam74pl40YNWHZTlWs4diIffZ+rHkX7HBr63Rtnm
         m4Qxdt7pDe49X9ZP3dckjSGcdXvMPVg/rhA1BHLN1reDO2O0uL8s97Gz6qEVeVx3k+vu
         XhbA==
X-Gm-Message-State: AO0yUKUkwGkulryhFS/4a8BrxGql7zws0Xgu6W1ycU0IcOfjDCf1whlv
	/xz1GsTHJ0g4SsiQrofa/wEnOE3TJyT2ZEctCe0=
X-Google-Smtp-Source: AK7set8g/7p+t7QJoU73e1BpHuSpVY4QWxYvgCy8MekatUiMFjrnBeNyJGweicw0Xa5AOL2Ipn7oxA==
X-Received: by 2002:a05:600c:3495:b0:3de:a525:1d05 with SMTP id a21-20020a05600c349500b003dea5251d05mr4832350wmq.8.1677666992518;
        Wed, 01 Mar 2023 02:36:32 -0800 (PST)
Return-Path: <philmd@linaro.org>
Received: from [192.168.30.216] ([81.0.6.76])
        by smtp.gmail.com with ESMTPSA id v20-20020a1cf714000000b003db03725e86sm15236841wmh.8.2023.03.01.02.36.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Mar 2023 02:36:31 -0800 (PST)
Message-ID: <02a2118a-badf-29a9-716d-44f5a6c2923d@linaro.org>
Date: Wed, 1 Mar 2023 11:36:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: [PATCH v3 23/24] tests/docker: add zstdtools to the images
 (!AWAITING UPSTREAM)
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Michael Roth <michael.roth@amd.com>, Peter Maydell
 <peter.maydell@linaro.org>, Kevin Wolf <kwolf@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, Alexander Bulekov <alxndr@bu.edu>,
 Aurelien Jarno <aurelien@aurel32.net>, Markus Armbruster
 <armbru@redhat.com>, Darren Kenny <darren.kenny@oracle.com>,
 Hanna Reitz <hreitz@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 John Snow <jsnow@redhat.com>, Ed Maste <emaste@freebsd.org>,
 qemu-arm@nongnu.org, Fam Zheng <fam@euphon.net>,
 Thomas Huth <thuth@redhat.com>, Yonggang Luo <luoyonggang@gmail.com>,
 qemu-block@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Bandan Das <bsd@redhat.com>,
 Li-Wen Hsu <lwhsu@freebsd.org>, Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>,
 Laurent Vivier <lvivier@redhat.com>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Qiuhao Li <Qiuhao.Li@outlook.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>
References: <20230228190653.1602033-1-alex.bennee@linaro.org>
 <20230228190653.1602033-24-alex.bennee@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230228190653.1602033-24-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: tLW5160/vtAs

On 28/2/23 20:06, Alex Bennée wrote:
> We need this to be able to run the tuxrun_baseline tests in CI which
> in turn helps us reduce overhead running other tests.
> 
> [See https://gitlab.com/libvirt/libvirt-ci/-/merge_requests/361]
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>   tests/docker/dockerfiles/alpine.docker                | 1 +
>   tests/docker/dockerfiles/centos8.docker               | 3 ++-
>   tests/docker/dockerfiles/debian-amd64-cross.docker    | 3 ++-
>   tests/docker/dockerfiles/debian-amd64.docker          | 3 ++-
>   tests/docker/dockerfiles/debian-arm64-cross.docker    | 3 ++-
>   tests/docker/dockerfiles/debian-armel-cross.docker    | 3 ++-
>   tests/docker/dockerfiles/debian-armhf-cross.docker    | 3 ++-
>   tests/docker/dockerfiles/debian-mips64el-cross.docker | 3 ++-
>   tests/docker/dockerfiles/debian-mipsel-cross.docker   | 3 ++-
>   tests/docker/dockerfiles/debian-ppc64el-cross.docker  | 3 ++-
>   tests/docker/dockerfiles/debian-s390x-cross.docker    | 3 ++-
>   tests/docker/dockerfiles/fedora-win32-cross.docker    | 3 ++-
>   tests/docker/dockerfiles/fedora-win64-cross.docker    | 3 ++-
>   tests/docker/dockerfiles/fedora.docker                | 3 ++-
>   tests/docker/dockerfiles/opensuse-leap.docker         | 3 ++-
>   tests/docker/dockerfiles/ubuntu2004.docker            | 3 ++-
>   tests/docker/dockerfiles/ubuntu2204.docker            | 3 ++-
>   tests/lcitool/projects/qemu.yml                       | 1 +
>   18 files changed, 34 insertions(+), 16 deletions(-)

You simply ran 'lcitool-refresh', right? (not obvious from the
commit desc).

If #361 got merged, this patch should also change the
tests/lcitool/libvirt-ci submodule to include it, isn't it?
