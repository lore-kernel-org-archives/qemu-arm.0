Received: by 2002:adf:9061:0:0:0:0:0 with SMTP id h88csp1590372wrh;
        Thu, 9 May 2019 21:45:11 -0700 (PDT)
X-Google-Smtp-Source: APXvYqz97nBDh2iBS5JT4/DBCORAE0DbsOx+7JskEzdLUNNLfec/mb1G+T3i9aqdPJoPy/WgUJsh
X-Received: by 2002:ac8:51c4:: with SMTP id d4mr7323711qtn.327.1557463511543;
        Thu, 09 May 2019 21:45:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1557463511; cv=none;
        d=google.com; s=arc-20160816;
        b=Cv71D7iT0hY+Ef3rEnMjP/2an8b8w2yOJJ0pprjawKdfsbaAFaRso5sgooYPhMbFgF
         6de18k4DOnf+tHGDxcLx9/qNowebLXmXu9TsEBdFqANEJx0+aOtbjjHMlj6+RFwJ92w0
         I418wXMlBtscF7NWEhMOi7Bu/wtlAAjAGCBJhi2K5N5o4OPbxs8RHZ950E0wJzDckJub
         x7aAapW1jeszwt4fUzMkmtD4VaUyfFZrdKPI9pvrLAiOHYks6Dz10FEHaTKA1da7pi2c
         qHlySCzK1tdEaRsTG4bvcnyp01sVTzddErKE5Akl2O6CFYhIL8rh/Ma4Dn3j1MnK03mb
         /Bvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:organization:autocrypt:openpgp:from
         :references:cc:to:subject;
        bh=raPENVWRyHdO7dxNwV50gsQTmv8HMIOZzm9YGq2YXf4=;
        b=FWz7fr68PNeZYd7aPPw6KRJOwo1yb29gkxtyaK0LRdqPQnGkl7YXMdwHS2YFneIZ6l
         lyjh4MFdovqokOm80be5avRz+ZtfpvibI9fsi5pMBq6Kag6Up8X4UtOp9NV2RAHfQatU
         evyfhZ2vh/UI41L0VMMP7RdkX4DWkaCDKb1mtdQH30FwNc5e+TxoZgOH0sOk+GY73K69
         VZtH1kasN6Hh6ID5XP0aE/2fMqfgNDiDr7SNihw7ZHWXo5Y+LPCfiGpf2+jPrhriBCcz
         RYcNkWfErTinFiSNdH6J7htgCGro7I581dv7FfrGN/Qtms9yr7ic77mApoTRf1aIifH2
         LzHw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of thuth@redhat.com designates 209.132.183.28 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <thuth@redhat.com>
Received: from mx1.redhat.com (mx1.redhat.com. [209.132.183.28])
        by mx.google.com with ESMTPS id j68si253732qkc.231.2019.05.09.21.45.11
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 09 May 2019 21:45:11 -0700 (PDT)
Received-SPF: pass (google.com: domain of thuth@redhat.com designates 209.132.183.28 as permitted sender) client-ip=209.132.183.28;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of thuth@redhat.com designates 209.132.183.28 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 98B843087BA9;
	Fri, 10 May 2019 04:45:10 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-116-72.ams2.redhat.com [10.36.116.72])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 5593017A61;
	Fri, 10 May 2019 04:45:04 +0000 (UTC)
Subject: Re: [Qemu-devel] [PATCH v1 22/23] tests/qemu-iotests: re-format
 output to for make check-block
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-arm@nongnu.org,
 "open list:Block layer core" <qemu-block@nongnu.org>,
 Max Reitz <mreitz@redhat.com>
References: <20190509165912.10512-1-alex.bennee@linaro.org>
 <20190509165912.10512-23-alex.bennee@linaro.org>
From: Thomas Huth <thuth@redhat.com>
Openpgp: preference=signencrypt
Autocrypt: addr=thuth@redhat.com; keydata=
 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
Organization: Red Hat
Message-ID: <8cac9b0f-1fb9-a3f6-742d-b897e99859bc@redhat.com>
Date: Fri, 10 May 2019 06:45:03 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190509165912.10512-23-alex.bennee@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.45]); Fri, 10 May 2019 04:45:10 +0000 (UTC)
X-TUID: Q3HkHK5uT5Ux

On 09/05/2019 18.59, Alex Bennée wrote:
> This attempts to clean-up the output to better match the output of the
> rest of the QEMU check system. This includes:
> 
>   - formatting as "  TEST    iotest: nnn"
>   - calculating time diff at the end
>   - only dumping config on failure
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> Message-Id: <20190503143904.31211-1-alex.bennee@linaro.org>
> ---
>  tests/qemu-iotests/check | 101 +++++++++++++++++++++++----------------
>  1 file changed, 61 insertions(+), 40 deletions(-)
[...]
> -cat <<EOF
> -QEMU          -- "$QEMU_PROG" $QEMU_OPTIONS
> -QEMU_IMG      -- "$QEMU_IMG_PROG" $QEMU_IMG_OPTIONS
> -QEMU_IO       -- "$QEMU_IO_PROG" $QEMU_IO_OPTIONS
> -QEMU_NBD      -- "$QEMU_NBD_PROG" $QEMU_NBD_OPTIONS
> -IMGFMT        -- $FULL_IMGFMT_DETAILS
> -IMGPROTO      -- $IMGPROTO
> -PLATFORM      -- $FULL_HOST_DETAILS
> -TEST_DIR      -- $TEST_DIR
> -SOCKET_SCM_HELPER -- $SOCKET_SCM_HELPER
> -
> -EOF
> +if ! $pretty; then
> +    _full_env_details
> +fi
>  
>  seq="check"
[...]
> @@ -852,9 +869,13 @@ do
>      #
>      if $err
>      then
> +        _report_test_result $seq "FAILED $reason"
> +        _full_env_details

I'd suggest to wrap the _full_env_details with a "if $pretty" statement,
otherwise the env will be printed out twice, one time at the beginning,
and one time in case of an error.

>          bad="$bad $seq"
>          n_bad=$(expr $n_bad + 1)
>          quick=false
> +    else
> +        _report_test_result $seq "$results"
>      fi
>      [ -f $seq.notrun ] || try=$(expr $try + 1)
>  
> 

 Thomas
