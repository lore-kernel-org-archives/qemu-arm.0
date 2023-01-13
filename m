Received: by 2002:a17:907:c68a:b0:84d:2074:29bb with SMTP id ue10csp218703ejc;
        Fri, 13 Jan 2023 00:29:09 -0800 (PST)
X-Google-Smtp-Source: AMrXdXsoVk0ei6juyJKx/uJApyukMA49nuSHFIH+PHipS99Re71Vy11NPRG6EaBKdx66f81G4YXD
X-Received: by 2002:a05:622a:1f91:b0:3a5:460f:9650 with SMTP id cb17-20020a05622a1f9100b003a5460f9650mr125143963qtb.46.1673598549396;
        Fri, 13 Jan 2023 00:29:09 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1673598549; cv=none;
        d=google.com; s=arc-20160816;
        b=x7tmF02v4d2Bktppc+L6fuQhEwjUS6/SWmcaWumvyKuJ39QauRZVmQG+huDyqLOPg+
         L13/O8HogEauaq8Vt/SQLBj0Faqmdfi51TV3B2eJsqAG+/kudd9pe+y/aSHZLSnQD4gU
         O03zr7Iaeihd8jwgbPCfRfSYd3Jut1WcUSOVmzP0shyDHwRukeRR/5iDaT+PfanXM49z
         9WSMpZOmKBwb/V23U9OBrs/a5D6I6o6fAgOMs5V6+q2I+HhTU810SHIAMIftoQWEQ7cz
         mt5Ac7sLQam6od6ftZf4Ffh7mbDM6B3QHTL8fgACBUL5lvZ0J3D6JVw0DTvWQRreFKRg
         yUsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=AtYF55lI7ABSr3HOXxn349J+rDNEp7cVLLDCD2wJ5JA=;
        b=J+C2VWVbo/jGeB5k4z5Va9GQE01d12BsJiqhHZ9XKzh5v3gvmj1NSLJmr42B29x9sA
         SMqgBX+mF7EIzd7lYbR2mTxl1d/y4no0Po62O4WXWi21K2i5zo7Ie9tEIrRqz9fYEAHr
         XUEUon5ER6ZNDdoyDsfBPTxmNN0uvo0DsJOQ2c+wYsqnVJeBZl5QFyFvviP8xpyIVaye
         Vm4sRS5zdFkvNs2ssCoT32im4WOwHuCse3j3DzvLkzhQynMkDzCfHvvXhyegvIM2r7MM
         TK95Ua96xHVxWnC5LjJ0Iz3PlmznPSE7ElRdy2Tq3G+mURVC6Yx0L1JyeuVJNrGqlvUP
         DBYA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=QtaoScLW;
       spf=pass (google.com: domain of pbonzini@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=pbonzini@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <pbonzini@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id gc13-20020a05622a59cd00b003a97e3eadfdsi6726531qtb.200.2023.01.13.00.29.09
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Jan 2023 00:29:09 -0800 (PST)
Received-SPF: pass (google.com: domain of pbonzini@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=QtaoScLW;
       spf=pass (google.com: domain of pbonzini@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=pbonzini@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1673598549;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=AtYF55lI7ABSr3HOXxn349J+rDNEp7cVLLDCD2wJ5JA=;
	b=QtaoScLWqMTi0eGsYv0Gtzk15f2xb65ozOLqN0Bt5h3ABacxuLRRPuwU0sn6uqpMAE+WG+
	+xfmHdN5iC+puVj+aMkncjQ29GCH/O15XX8YTBTyOm6z3tMLK8ppeeoUqC/96HkePMn2vW
	SDoNvAb4cgEnHg9ExJzRDBhbujap7NM=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-244-HoxJTcf4P7yh5KMo7q4ChA-1; Fri, 13 Jan 2023 03:29:08 -0500
X-MC-Unique: HoxJTcf4P7yh5KMo7q4ChA-1
Received: by mail-ed1-f72.google.com with SMTP id h8-20020a056402280800b0046af59e0986so14350038ede.22
        for <alex.bennee@linaro.org>; Fri, 13 Jan 2023 00:29:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=AtYF55lI7ABSr3HOXxn349J+rDNEp7cVLLDCD2wJ5JA=;
        b=F4aD3LrjmAeWYGdFZjHjm1yTcK6nuAheDI5InY/lwVQ8R/DwazA1zz83QEUIM427dg
         z6Le/NCQnKKpVlW2XjAbZ9DLVQZtj4bXlTgYFyfp34NusspWewcDCAUWPx8I7V8UUcv2
         Fx74pggWYm2XJcJqaBBnZRPX/nZ1JVYPCCub8wD3G9Xnie3Yo916DcKvVi0YEsIhkHWH
         MBvc51a0uIQ/jNG4eLcTqsdNvNlc/5V5FnpPKTEyBJf797uyfnwjWqqGqDdKrEWDlyly
         3oKK0ZG7hLzyQSoX/RKTZYJ8Hc5yOBEeX+9vUqZAqqtKfdlkmh/LA55B0ZKpACKxN5LI
         Y1kA==
X-Gm-Message-State: AFqh2kqzni1igJf0ZG5ugqpytp1HbpRTjfOen6Ps04EVlPSuVN3Q6J8N
	r5SmgRi+1Rz0bYS1fuG08DPzAAIBHa5TFmynHqPwGM3KTfo8cQkGnOq4AosfYs16fMt+FcougRZ
	iubKkZBtaeTEbzpXzSjVcC2pKSo0qdLpoxS1qriS67qKN9R+Xi79BNo/4vp6XYKnBoA7l
X-Received: by 2002:a17:907:d387:b0:7c1:6fd3:1ef3 with SMTP id vh7-20020a170907d38700b007c16fd31ef3mr69929561ejc.33.1673598546347;
        Fri, 13 Jan 2023 00:29:06 -0800 (PST)
X-Received: by 2002:a17:907:d387:b0:7c1:6fd3:1ef3 with SMTP id vh7-20020a170907d38700b007c16fd31ef3mr69929518ejc.33.1673598545992;
        Fri, 13 Jan 2023 00:29:05 -0800 (PST)
Return-Path: <pbonzini@redhat.com>
Received: from ?IPV6:2001:b07:6468:f312:63a7:c72e:ea0e:6045? ([2001:b07:6468:f312:63a7:c72e:ea0e:6045])
        by smtp.googlemail.com with ESMTPSA id kv24-20020a17090778d800b0078d9cd0d2d6sm8332621ejc.11.2023.01.13.00.29.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Jan 2023 00:29:05 -0800 (PST)
Message-ID: <2953a506-23cc-abe7-7774-077ebdc6c341@redhat.com>
Date: Fri, 13 Jan 2023 09:29:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH 07/26] configure: replace Perl usage with sed
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Alexandre Iooss <erdnaxe@crans.org>, Beraldo Leal <bleal@redhat.com>,
 Thomas Huth <thuth@redhat.com>, John Snow <jsnow@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>,
 Elena Ufimtseva <elena.ufimtseva@oracle.com>, Ed Maste <emaste@freebsd.org>,
 Yanan Wang <wangyanan55@huawei.com>, Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 Li-Wen Hsu <lwhsu@freebsd.org>, Markus Armbruster <armbru@redhat.com>,
 Jagannathan Raman <jag.raman@oracle.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 Michael Roth <michael.roth@amd.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>, qemu-arm@nongnu.org,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Mahmoud Mandour <ma.mandourr@gmail.com>,
 John G Johnson <john.g.johnson@oracle.com>
References: <20230110173922.265055-1-alex.bennee@linaro.org>
 <20230110173922.265055-8-alex.bennee@linaro.org>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <20230110173922.265055-8-alex.bennee@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: /RVEu9T3caR7

On 1/10/23 18:39, Alex Bennée wrote:
> From: Marc-André Lureau <marcandre.lureau@redhat.com>
> 
> Let's try to reduce our Perl usage during config/build-time.
> 
> Note: this patch might be dropped if "configure: remove
> backwards-compatibility code" is merged earlier.

It can be dropped now.

Paolo

> 
> Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
> Tested-by: Thomas Huth <thuth@redhat.com>
> Message-Id: <20230110132700.833690-4-marcandre.lureau@redhat.com>
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>   configure | 8 +++-----
>   1 file changed, 3 insertions(+), 5 deletions(-)
> 
> diff --git a/configure b/configure
> index 2281892657..9a944698b4 100755
> --- a/configure
> +++ b/configure
> @@ -2571,11 +2571,9 @@ else
>     if test -f meson-private/cmd_line.txt; then
>       # Adjust old command line options whose type was changed
>       # Avoids having to use "setup --wipe" when Meson is upgraded
> -    perl -i -ne '
> -      s/^gettext = true$/gettext = auto/;
> -      s/^gettext = false$/gettext = disabled/;
> -      /^b_staticpic/ && next;
> -      print;' meson-private/cmd_line.txt
> +    sed -i.bak -e 's/^gettext = true$/gettext = auto/g' \
> +      -e 's/^gettext = false$/gettext = disabled/g' \
> +      -e '/^b_staticpic/d' meson-private/cmd_line.txt
>     fi
>   fi
>   
