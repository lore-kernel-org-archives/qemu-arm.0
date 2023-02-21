Received: by 2002:a17:906:da85:b0:8b1:202f:4753 with SMTP id xh5csp3111559ejb;
        Tue, 21 Feb 2023 02:11:12 -0800 (PST)
X-Google-Smtp-Source: AK7set/hyPLUx9klxUP30K1Cj4Upc1OoIYiASVd/biKxM5e3SWUg+Utrh6rJNJ77vToQu9uuhQ/M
X-Received: by 2002:a05:6214:da4:b0:56e:a620:7b39 with SMTP id h4-20020a0562140da400b0056ea6207b39mr9886888qvh.4.1676974271912;
        Tue, 21 Feb 2023 02:11:11 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1676974271; cv=none;
        d=google.com; s=arc-20160816;
        b=tHAuN6gdLtN3sLTic5XKdzDpKcV8PeoelKdNB7J2uqDQ48PpkLupCQ+uIB8s5HY8WC
         Z/c4ZqdOYTw9QSgg8cKBC8PaOH3+cR1f4wQMNe6mGtwd6iNTMBSNmO/r1wAVTI41UlNd
         1rmRLec7rgiiL3S5jzBs3K/7JRwfaVeu09CkI7z5UTcFhf++CZMn8mt+nW0wkrcgL7sN
         UHOHBXgbZrfYhDmOALh+Qh2Z3aVUaDTGLz5cV1arf5hxIVL+el/hvx4F44tMA505xmQ+
         zKCg+EA/uPso4VLzj9ElRDrTfnqEs2sglnl4Df72S6aYOFnL6hvl3h4goz/F9dIz50Y7
         /NcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=2YdYK4E8dfImOWaZXVXYI5dpFmqmpKsIQj1oVojEGUY=;
        b=N2VMfVcQOTQqFrU3ZFkT0sGORbGEbfcW+u5f52QWk5MM/3b7EGGl2DBUVZ+yjXxhpd
         9W5/uKyVnRCn4lc1l/CYYmRbqedXzkMwjV2u6+zJpSRE9sIpvUIcVutW/eEcDEHO+8F+
         TCLoBent+eiJw0Eg0JTZXAhXcwIxx1UkTJprSRl9MrZWiNjrBimvVCiaOnnijrjnSuc9
         vRvUnNNpSbsxLSsV0D7Fn7ce6urZr4boTdUchILin4n5KEin7S7KJ5dEsi950QFAtTCp
         hGqbhZYT2dnXlfc8Vsv1wxTjuLwlhdK1xhYwPWlT4DRqWFx0iHxhK+OszDmYcBN4G7Va
         fYWQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=TSZDStZq;
       spf=pass (google.com: domain of thuth@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <thuth@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id n13-20020a0ce54d000000b0056ea94f2164si5180283qvm.30.2023.02.21.02.11.11
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Feb 2023 02:11:11 -0800 (PST)
Received-SPF: pass (google.com: domain of thuth@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=TSZDStZq;
       spf=pass (google.com: domain of thuth@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1676974271;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2YdYK4E8dfImOWaZXVXYI5dpFmqmpKsIQj1oVojEGUY=;
	b=TSZDStZqakOc0Vp9xugZrCQjdezV5y2J+sV0dt05eEtYmLJwrWZee0ziFd6PIi81ZG2pDN
	Hfk8zCQ/68SsIQKm1bbYmG0rex0cTAjnnAcL45XcNlW129GYGSryD6/RsMmGRMkBgEh9bJ
	M1Cw1v7OU91+tOWsD8R2/hPbh7GCFvE=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-651-EpR1oYdpMLmwAqyBVW8liw-1; Tue, 21 Feb 2023 05:11:10 -0500
X-MC-Unique: EpR1oYdpMLmwAqyBVW8liw-1
Received: by mail-wr1-f71.google.com with SMTP id y9-20020a056000168900b002c3d80ab568so535410wrd.18
        for <alex.bennee@linaro.org>; Tue, 21 Feb 2023 02:11:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2YdYK4E8dfImOWaZXVXYI5dpFmqmpKsIQj1oVojEGUY=;
        b=TTpAKtWxqO/xSgPxQ+JRNcSpXcYv8IsqIBHR23r2qPP3CG4C5Hxulmq/vnHTkXedr3
         HZbWATP7cCCu4V2GGDo70oNJyrCUHF8ImHGs6vrTWF7i6DaxRsa4Cn51Og1HR7C47yWl
         YxTY76xAdL/mze4rLwlgckxG3kBCMPP2QSDSSzHm1K9NvXXd7qfwuxCnt20BnDjCH+zK
         +IGb1pKL98hWxKDujKadkt7vZGj3tTbmYXNyRNJmpbG30xc2YA1DTBUIRkDKjoDMk3yd
         Ql4kUz58dvfEYPaKNQ1G+ojtmTuvRP9IVapUo3wslW5kDFgeOkOZJ/9OYjhP3w9e4R08
         sFzw==
X-Gm-Message-State: AO0yUKUgdKRwIhm8tfIxvX/j4QAamTFYgIqYhPmHn18GQH4W5Az/7IK9
	kwk6+Jv7BKE4MAJx4qtUVb/MO5FGSeQhLYQCMuCeiotv5cGcbM4WHpMYmWp9Q9DxkaiEUMQ+HUF
	uTfBlEWobC688896ldhtHNs6SjhBnxaG65H/vd/SAM17RGTDRCFTIZ8rDdpa7U8S9y0msDVMf
X-Received: by 2002:a5d:4d4b:0:b0:2c5:5d15:4e25 with SMTP id a11-20020a5d4d4b000000b002c55d154e25mr4170963wru.16.1676974269338;
        Tue, 21 Feb 2023 02:11:09 -0800 (PST)
X-Received: by 2002:a5d:4d4b:0:b0:2c5:5d15:4e25 with SMTP id a11-20020a5d4d4b000000b002c55d154e25mr4170922wru.16.1676974269063;
        Tue, 21 Feb 2023 02:11:09 -0800 (PST)
Return-Path: <thuth@redhat.com>
Received: from [10.33.192.205] (nat-pool-str-t.redhat.com. [149.14.88.106])
        by smtp.gmail.com with ESMTPSA id y16-20020a5d4710000000b002c3e3ee7d1asm8417179wrq.79.2023.02.21.02.11.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Feb 2023 02:11:08 -0800 (PST)
Message-ID: <5ca3c321-1e6a-a108-7031-60be2709abda@redhat.com>
Date: Tue, 21 Feb 2023 11:11:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH v2 13/14] tests: ensure we export job results for some
 cross builds
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
 <20230221094558.2864616-14-alex.bennee@linaro.org>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20230221094558.2864616-14-alex.bennee@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: EyZ2LYlqmhtw

On 21/02/2023 10.45, Alex Bennée wrote:
> We do run tests on some cross builds. Provide a template to ensure we
> export the testlog to the build artefacts and report the test results
> via the junit.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> Reported-by: Peter Maydell <peter.maydell@linaro.org>


Reviewed-by: Thomas Huth <thuth@redhat.com>
