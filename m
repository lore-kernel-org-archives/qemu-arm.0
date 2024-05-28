Received: by 2002:a17:906:ca8a:b0:a63:3083:985b with SMTP id js10csp307355ejb;
        Mon, 27 May 2024 23:46:46 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF4Ga/YAOcVLTGAXP9Dv6jL743bWOdGlA0G+TuRT/78K6weU3qw7vkZOxXOSsU8JeI69wZ5
X-Received: by 2002:a05:622a:52:b0:43e:3d8b:b6b9 with SMTP id d75a77b69052e-43fb0ef8abemr106374691cf.44.1716878806116;
        Mon, 27 May 2024 23:46:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1716878806; cv=none;
        d=google.com; s=arc-20160816;
        b=0Dl7O1GMUdkgFm6hENVAPWyGfSSpbaJhNu0fDoiV/QO1IWCSv4yPmAa3cJsBTQN2pL
         DhMWyefM6IsOlV7ZCOShXJUfL/JU5cgJ/X2zEKgVG9fkElw+gsfbIiBX1chRtTkiiBhy
         0XhejxIgavpW+IU9gXestIyhQoIJJVP0rVoe0aJcKsCTEC4keLdOHpsqd5hkTsj16F8F
         4EgoJQYE8cJIKaUtbqIvzC+/d6KLi/TcKdbZ96y2nBjmI1kgv4eu1ORvOBpilkxb7dTx
         jjYN/VhdeV4XoDmJw5QEXt6eSeskNbC9kgHuSsWqRyVEszDkl6V5iswx5xxoyMAqYVGB
         maJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:autocrypt
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:dkim-signature;
        bh=4AM0fePRMtaS6q5DAVfXjTPy1MlJBxHVg+TTnn5GnqQ=;
        fh=gGcVA5X7letqRIE6Ctru5irj0sr93cabC9fdYGNdecg=;
        b=vFAcplmj9L6lQVa6V08+91rVx4Cc+GC1xqFe1fCv2BOkJECjfLn93xHGmL6P2LOzk2
         XXJjpyulQbRrQxCcAypd5IaBgmFCZg+75z/8ruzZtwqa9qK/VEQ3a4bpwOT4LmrNDJtQ
         ZGsXOfPyjTfyZhDwaAbsxC1mcQfdjbesG6MrCtF16yRFjlXi1VVLQupFMnVeT4HnDYEY
         Efu7ZiydHAqUI3ySFWrMuYHQKG5q9xGEPDEffHtRwd5mxipu6GkCsFnibHFyHk5wdmrp
         aGCfkhVcWbsz4MbBgOMypNs1b/3JLnOGS1iR5QYYnL0TZz4tcPG18KPUym4QHJvDYY9T
         b0+w==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=X3THNCoi;
       spf=pass (google.com: domain of thuth@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <thuth@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id d75a77b69052e-43fb18c572asi94644571cf.556.2024.05.27.23.46.45
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 May 2024 23:46:46 -0700 (PDT)
Received-SPF: pass (google.com: domain of thuth@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=X3THNCoi;
       spf=pass (google.com: domain of thuth@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1716878805;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=4AM0fePRMtaS6q5DAVfXjTPy1MlJBxHVg+TTnn5GnqQ=;
	b=X3THNCoifZSDEB1o03p6DDa5sDLIQTQH/HsOVmmPpGG/EQYZGurqw5PQhDyo2ArIbMJY4t
	XktRbd3Z6i2zklOxKHdhNIYiHWdqpt3GgGltqlp8aKhx1Z956k5qIhyOW64mF/85q1vUC/
	jKds8llaiLRIl7hT5ee7uIoPuc1Kydg=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-441-Yb1nGtrFP02Plw2gKmD3sA-1; Tue, 28 May 2024 02:46:40 -0400
X-MC-Unique: Yb1nGtrFP02Plw2gKmD3sA-1
Received: by mail-ej1-f69.google.com with SMTP id a640c23a62f3a-a6265d3cb34so23838666b.0
        for <alex.bennee@linaro.org>; Mon, 27 May 2024 23:46:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716878799; x=1717483599;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4AM0fePRMtaS6q5DAVfXjTPy1MlJBxHVg+TTnn5GnqQ=;
        b=lgWjmfWnCB88k8DP3AVGvuw3S7kuJhBMd7mKaoNchWiu7XXGJ3nE7UFGKrOUoTLgVz
         gKuuCxhULdwaePcEXPXYUZFzkOCpDnVN/BQNbkdyV7EM9aw/tt+N0tXt7TmAZlYsQk5B
         QWXEtc3/JLV5RAB2vAW88SZs9Xf2PgHkolGGicT0CtDwJl4GbaUSTJMNb3jUu8hgNaJM
         QoTgi9iHNnxudaVzKO4vo9zd9y2PlwFjIwf91YBXrk4OwMOcKr/tsWHyBnagCKMzZgrt
         GBQfCt28zuvwqJViDpK5BWm2WLPTx17HNcXm58Dk+CB9PUoFSxHW59vOxR3STjrtlc1o
         mmXA==
X-Gm-Message-State: AOJu0Yws+7UQwbOOj9g66TnJiymLR5XNOogQOXdF+AIAiEOg1y8V+Q3E
	n85w2iB0JBXNKrqTxw1Dmyp9AhNiEld6ogWZBg8ntzShYvUikhMQIFW6S/ma4cavb1Wwn3B0IK1
	iu0eC1E5MozgW4Q3jU2OJUH3F9ZDeUdqtXcpVUjwPaDDLmqYNCRJjncTBC/yCd3nkk6jKbbtRfd
	Z4LwLcW8r5HLMJ1bXPzSLwjQUfVLU+uTLR/A==
X-Received: by 2002:a17:906:a287:b0:a59:cb29:3fb3 with SMTP id a640c23a62f3a-a6265148babmr762498866b.53.1716878799326;
        Mon, 27 May 2024 23:46:39 -0700 (PDT)
X-Received: by 2002:a17:906:a287:b0:a59:cb29:3fb3 with SMTP id a640c23a62f3a-a6265148babmr762495266b.53.1716878798848;
        Mon, 27 May 2024 23:46:38 -0700 (PDT)
Return-Path: <thuth@redhat.com>
Received: from [192.168.0.4] (ip-109-43-179-186.web.vodafone.de. [109.43.179.186])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a626cc8dcbdsm587998566b.175.2024.05.27.23.46.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 May 2024 23:46:38 -0700 (PDT)
Message-ID: <ffc84cd2-f791-4758-a582-a92ad01993a0@redhat.com>
Date: Tue, 28 May 2024 08:46:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] docs/devel: update references to centos to later
 version
To: =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>,
 Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>, Beraldo Leal <bleal@redhat.com>,
 qemu-s390x@nongnu.org, John Snow <jsnow@redhat.com>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-arm@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Joel Stanley <joel@jms.id.au>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Aurelien Jarno <aurelien@aurel32.net>, Cleber Rosa <crosa@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Laurent Vivier <lvivier@redhat.com>
References: <20240521125314.1255403-1-alex.bennee@linaro.org>
 <20240521125314.1255403-3-alex.bennee@linaro.org>
From: Thomas Huth <thuth@redhat.com>
Autocrypt: addr=thuth@redhat.com; keydata=
 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
In-Reply-To: <20240521125314.1255403-3-alex.bennee@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: cPap1RbXdggz

On 21/05/2024 14.53, Alex Bennée wrote:
>  From the website:
> 
> "After May 31, 2024, CentOS Stream 8 will be archived and no further
> updates will be provided."
> 
> We have updated a few bits but there are still references that need
> fixing.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>   docs/devel/testing.rst | 8 ++++----
>   1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/docs/devel/testing.rst b/docs/devel/testing.rst
> index fa28e3ecb2..c312465fa7 100644
> --- a/docs/devel/testing.rst
> +++ b/docs/devel/testing.rst
> @@ -387,9 +387,9 @@ make target):
>   
>   .. code::
>   
> -  make docker-test-build@centos8
> +  make docker-test-build@centos9

Basically ACK, but I wonder whether we should maybe switch the documentation 
to another container here that does not have a version in its name, so we 
don't have to change it again and again each time a new version is released.
For example, what about using @fedora instead of @centos9 ?

  Thomas
