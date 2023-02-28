Received: by 2002:a17:907:1627:b0:8ed:b3f:fd98 with SMTP id hb39csp5668944ejc;
        Tue, 28 Feb 2023 03:55:13 -0800 (PST)
X-Received: by 2002:a05:600c:cc5:b0:3eb:2de9:8af1 with SMTP id fk5-20020a05600c0cc500b003eb2de98af1mr1966222wmb.32.1677585313215;
        Tue, 28 Feb 2023 03:55:13 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1677585313; cv=none;
        d=google.com; s=arc-20160816;
        b=pG/iul1mQD1HQGzWFKu6xJaiJ3D8xJAdzKhDCcTkhIyU0AckcugTAPDtUkLD/HyEJh
         0W2xcAHtnEuKTrcLR+jmnyZK0JwW/rFY3SbJojtaNKHDZX6Ef+cnsNdPLHrA/xgxluC5
         8Unayo44u01uLLyAAFxNWqWmEwj8KJ2OlIy2zlelW3dLMUhjjYv/nGJAbu2+tD3skGRG
         7CGT/jmx0AM5QYyc2gBmq8eafvg0/84ataJW7l8KUkrRW1ZsDbhHB94Irm0Z+9Quc1TR
         imFFgKc+BsktKuiU/cHNfWSJYtVQ8E0OCdu4tWZRAHgkDGpoP2NuphnY6f0U+w0/BNjh
         KxZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=IWDV0voPLdjSoxMratg5IFm9JEg45iChyCwGiFkNcqA=;
        b=PrhthFhxq32qsHwsIh7+4WH6ui/UKBPBKTUq/zY+L0FupAURXz57fJNAMcyUYuggTG
         TTzklpCb03bjVz5zjhy1IHB1ZjjUstVzuitzFEy/BE+YMuALWsMev+ZzmasV14rAwQxV
         z4+cDsaipCUzwSgk7R5y+o2kn22OlnLJ0bypvAQvWjweR8ZdV30b/y0PmXuqNC4zekkA
         dlzQpJq3YXBRHCEY8XmKrvhCBPOEsjZv4SiFrwJHw0D9BBow1phYyuhq2BcMxy6ZxAW1
         QPRkq7AhpndEYWo3VW8JVi03OFTUMQYpTcDun7/d9lYPd3JdSu1MYorPIcb8JiWII6fk
         0JQA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Gc0cR8G9;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id s17-20020a7bc391000000b003dc46242c4asor2459788wmj.19.2023.02.28.03.55.13
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 28 Feb 2023 03:55:13 -0800 (PST)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Gc0cR8G9;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=IWDV0voPLdjSoxMratg5IFm9JEg45iChyCwGiFkNcqA=;
        b=Gc0cR8G9gX/q8IRHtcgAQoJBMhDelPYFwx+YZFw8svqGZ/0NJ6cr6CdifR++Wb/e4K
         OeffGswJbiq2qMdVdKHQF6i1Daab5AsdDiiSncUF1VLuTAYzi2/NyBDhAYGE0V74a7JB
         ArPcxcxjjx7OMtm27eVAqZRcy+GUvpVYYgWW4fI4mE9bHs2/NYdIWrea9h2lpK26630Q
         /3NbiW8MFB0yDgjzg9PjdseWH8uUcs0MNivDKhejgYLFi2PPpSVvkkKzJSiOeq7IRoKD
         ra71mZgr1UnS2ZlFIiSbVO6MFWxWJE+s33EjBR2ejUeCkUwTMXpIk3r7NHay67y77+/9
         SPqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IWDV0voPLdjSoxMratg5IFm9JEg45iChyCwGiFkNcqA=;
        b=MgQJ9Hn9sQsOgjcwsOscaM0ZXngCFkKtJ43Nncoh949tgt136tjkiDESc1qUSMgKYN
         800pKH4Jc5lCmCAJIE+1rLPSTdxMgpbU9qCj4oqCKeztU2ziRbwOExXdnVPiS1XblxRJ
         dtOOBsZ2dqHm6PBFnEyyWDj/a2ifSwJPxlblkRvfWysg/wfIsQkJDXQ9Z7Mi+3F6miTs
         i7PNjJtR0I8GQ1DsExZjKvjhCJ6cydKqzLXBc4g9DaoxpxJXOdSO9qaTRAmtVUOW7tXO
         OlTj6cSiyZ9Az7gUhdSqTjeXk758vOmPxG/IJeALzUKleg4viuJH19YyTxLehlBq7JQm
         3syw==
X-Gm-Message-State: AO0yUKXOotwADAc7w63riuCyHC2NhK0ENYFqY9vKWLo2YdpqVDu/LbAT
	YsJ3eYv//xFMqYPzoS/aAG8kTng4GoYcKvi5NLk=
X-Google-Smtp-Source: AK7set+iHpaU9/SDwMytt4cNRQ7P2nYrrnDLhWN0aLOrEfncnN1tpMElKmubcm7VxbECIIbMbRh76Q==
X-Received: by 2002:a05:600c:450f:b0:3ea:d620:570a with SMTP id t15-20020a05600c450f00b003ead620570amr1978546wmo.38.1677585312635;
        Tue, 28 Feb 2023 03:55:12 -0800 (PST)
Return-Path: <philmd@linaro.org>
Received: from [192.168.30.216] ([81.0.6.76])
        by smtp.gmail.com with ESMTPSA id 13-20020a05600c020d00b003dc1d668866sm15777747wmi.10.2023.02.28.03.55.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Feb 2023 03:55:11 -0800 (PST)
Message-ID: <1abd1c0a-4c9c-35e2-6f64-cc396b1a1856@linaro.org>
Date: Tue, 28 Feb 2023 12:55:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: [PATCH 5/7] tests/docker: use direct RUNC call to build
 containers
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: Li-Wen Hsu <lwhsu@freebsd.org>, Thomas Huth <thuth@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Michael Roth <michael.roth@amd.com>, Qiuhao Li <Qiuhao.Li@outlook.com>,
 Beraldo Leal <bleal@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Cleber Rosa <crosa@redhat.com>, Yonggang Luo <luoyonggang@gmail.com>,
 Ed Maste <emaste@freebsd.org>, Peter Maydell <peter.maydell@linaro.org>,
 Aurelien Jarno <aurelien@aurel32.net>, qemu-arm@nongnu.org,
 qemu-block@nongnu.org, Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 John Snow <jsnow@redhat.com>, =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?=
 <marcandre.lureau@redhat.com>, Alexander Bulekov <alxndr@bu.edu>,
 Hanna Reitz <hreitz@redhat.com>, Bandan Das <bsd@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Darren Kenny
 <darren.kenny@oracle.com>, Wainer dos Santos Moschetta
 <wainersm@redhat.com>, Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>
References: <20230224180857.1050220-1-alex.bennee@linaro.org>
 <20230224180857.1050220-6-alex.bennee@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230224180857.1050220-6-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: FjOVoXmWHP8B

On 24/2/23 19:08, Alex Bennée wrote:
> We don't really need stuff from docker.py to do the build as we have
> everything we need with a direct call. We do rely on the dockerfiles
> being able to tweak the UID/name mapping as the last step.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>   tests/docker/Makefile.include | 22 +++++++++++++---------
>   1 file changed, 13 insertions(+), 9 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
