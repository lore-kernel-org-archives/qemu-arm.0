Received: by 2002:a17:906:da85:b0:8b1:202f:4753 with SMTP id xh5csp253166ejb;
        Wed, 15 Feb 2023 23:59:58 -0800 (PST)
X-Google-Smtp-Source: AK7set8bPaBhX+S088DXerei4W41crht5/NwxT2Iw+NZe6VQ3Dk4CedF/WdQynxPTUm2tvVe6Nik
X-Received: by 2002:a05:6214:5091:b0:56c:4c11:553 with SMTP id kk17-20020a056214509100b0056c4c110553mr1947176qvb.19.1676534398425;
        Wed, 15 Feb 2023 23:59:58 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1676534398; cv=none;
        d=google.com; s=arc-20160816;
        b=pAgtwYQnoZ+lF1GmMtqxAeREE0r1lQ1d01oW8kgom1slzYw+lBP3yQCsS9oW/SS84y
         x/pKM8b8v+oIyYQB0mPh7LEXgzdIQpKVULiuRSSVlqEqsw+WPHjhRAWxtPWnrzqOf4pL
         qoTnKql8HErdwLjvy3cpOvvVqHa/HIhJ8HjbR+jCWF/uVjNV3jjlIbfD1WphrXV8RFpZ
         Ow14zGzPOdptbdU4pMcF+yyBVlV342s1d9w5I+f7LPCAkCGvdVoJv6FWecTKuE53816s
         BXbIRYkHWHXPhiDH2OfUwFUrkSbqlTGL5I7o9oSKWUQtMclLbZi4Ruf0JB3suDa+tBFQ
         cwEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=vYoiOAfo3Iubs4igp2bNdYbM4OCTfMM5BsGZG6YDuEU=;
        b=XCtX1eaegkA9Aht/LUc5wrefbmOiuFo9ySC//U/3cRDKl/bEJ8xbcwK+uTZqVarzRs
         KmooPkuNlHSk/kPfrQkiep5Tw5NoC63FfS3iMDxXYHeq8CGiJQ+2BM/k9GGPK3e5c334
         VqFQN6OYzUEdJF8Nt0cxlvMjxSZBS8BHjSSGTnn63uP+m3wmA8smESQimpTyQNCXxdV4
         4udr2O1FQW977O3RhdOaCF7oL3HAv5Lp6X0JQSqbesnC+Gn7PwDmdplboWZwVJTrh5KE
         /FZxdP9mYnstkcYUzH4tiDAuOIJU8XjFTeV3bSM42xAmQ7z39ysAB7K7vfs5QYurQfg9
         MR+w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=P2QNj+hr;
       spf=pass (google.com: domain of thuth@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <thuth@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id cx15-20020a05620a51cf00b00727fc7ee88esi943581qkb.608.2023.02.15.23.59.58
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Feb 2023 23:59:58 -0800 (PST)
Received-SPF: pass (google.com: domain of thuth@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=P2QNj+hr;
       spf=pass (google.com: domain of thuth@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1676534397;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vYoiOAfo3Iubs4igp2bNdYbM4OCTfMM5BsGZG6YDuEU=;
	b=P2QNj+hr00dGIs90cdiJDEd52vspt6vokYwOnsE11WRp+bV8UrCu/JgjlhoNXQDDJMGmfz
	TYzv1Mr+G8u6msicBJG4vVpsrWBVwgvuMvnLrexKbNeJ1yViIGqGe84bckgtqGIQX3pESF
	Dr0tQBAbLNskRgWJm/UoV/i79MCRDrU=
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-245-0FrfJ7onNP2jWHmEEpAIWg-1; Thu, 16 Feb 2023 02:59:56 -0500
X-MC-Unique: 0FrfJ7onNP2jWHmEEpAIWg-1
Received: by mail-qt1-f200.google.com with SMTP id cr22-20020a05622a429600b003b694a9f291so821431qtb.1
        for <alex.bennee@linaro.org>; Wed, 15 Feb 2023 23:59:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vYoiOAfo3Iubs4igp2bNdYbM4OCTfMM5BsGZG6YDuEU=;
        b=A92y17Uqyt0E7FkOWcpvw+1Ur/OZs25a1b9fCHZfJfetPDOrqL+blMKvFuWluiYPle
         LpgEPcq212aiuuxFpjok9zao5+h0jvM4yDUSEdOCgs4XqGX6PcPIMa6uge5K8WYirAp4
         FF5997iff6uHtmIJn5AbdaWm3XLOYRjroU7iUh7lg56b3m8v5sDproMQdETESO3ZZ86/
         8+vFkCfvHLlAdB5vP8GJV/4oXws0mRsTeTiFbnvJ9On28BAP50AHHip+l0npBoO000Cc
         ddPtpcOGN+ZCINfSXw2IRxkTZ67XIok+8+V0/4C35WS33TA0+r+NIKuRDZPUadlLjpdT
         B1BA==
X-Gm-Message-State: AO0yUKXE3p8bXzNiMGNMYDibUF9x0qRb9SfrtEpioWdv22tXETw3cQI4
	VtJSVNmQ30t+uTUUXvUe7knmiTzQSzmhD0+PC8nKJDRUwMJoPzbpBy7uEnO2wmEp9Uc4oHbcsmK
	UNDMfaB5GvwVgQyKlagPgVIIP9lOeo7XHny3jLEnnPE7nXSB1J4BaKpT+SaFAbZxfGCeqD3D8
X-Received: by 2002:a05:6214:d0a:b0:56e:ff37:6b6e with SMTP id 10-20020a0562140d0a00b0056eff376b6emr584531qvh.10.1676534396242;
        Wed, 15 Feb 2023 23:59:56 -0800 (PST)
X-Received: by 2002:a05:6214:d0a:b0:56e:ff37:6b6e with SMTP id 10-20020a0562140d0a00b0056eff376b6emr584492qvh.10.1676534395945;
        Wed, 15 Feb 2023 23:59:55 -0800 (PST)
Return-Path: <thuth@redhat.com>
Received: from [192.168.0.2] (ip-109-43-176-144.web.vodafone.de. [109.43.176.144])
        by smtp.gmail.com with ESMTPSA id q202-20020a3743d3000000b0073b341148b3sm680283qka.121.2023.02.15.23.59.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Feb 2023 23:59:55 -0800 (PST)
Message-ID: <f975618a-02b1-2838-5379-ecb8ee15977d@redhat.com>
Date: Thu, 16 Feb 2023 08:59:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH 12/12] tests: ensure we export job results for some cross
 builds
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
 <20230215192530.299263-13-alex.bennee@linaro.org>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20230215192530.299263-13-alex.bennee@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: saelxGAuRiqb

On 15/02/2023 20.25, Alex Bennée wrote:
> We do run tests on some cross builds. Provide a template to ensure we
> export the testlog to the build artefacts and report the test results
> via the junit.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> Reported-by: Peter Maydell <peter.maydell@linaro.org>
> 
> ---
> v2
>    - properly format extends
> ---
>   .gitlab-ci.d/crossbuild-template.yml | 11 +++++++++++
>   .gitlab-ci.d/crossbuilds.yml         | 12 +++++++++---
>   2 files changed, 20 insertions(+), 3 deletions(-)

Reviewed-by: Thomas Huth <thuth@redhat.com>

