Received: by 2002:a17:505:a0c:b0:1be9:327d:8ee3 with SMTP id cg12csp2384380njb;
        Sun, 8 Dec 2024 22:47:47 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUhLVBSXVosspzIAG7FDNsvMo4VxJ1C3GcwSOouTc6/+PP48yXfSYeRkOwL+AKZdgcFrcAfNlxpWE/4JA==@linaro.org
X-Google-Smtp-Source: AGHT+IGRZNWMa2n3UKwkU1UaQiCaP9ljoqzfl1ExaEzgzNaUMJXX0lqibmqmPWihhHvDIRJzf80A
X-Received: by 2002:a05:622a:4013:b0:467:5454:57b4 with SMTP id d75a77b69052e-46754546138mr95696091cf.49.1733726867397;
        Sun, 08 Dec 2024 22:47:47 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1733726867; cv=none;
        d=google.com; s=arc-20240605;
        b=ABDFs3RPPakgdNM8OQGRA2s7l+06Z0f1ABbpyjF6J330wxeXOle4wzHLfErH/e2PTM
         qIkVHE0pydTBcCYI32Xi0JwNPKPfeYoG3UxjQmb/zmHqn5cD9HQ0P5RepImJagV0wgPE
         wcGrLnseKICQAtKEDLWKpmdeFjfMvEQciyAZkCawYDDDMbSg0C8ymeKheuIp1LYee6+n
         xRd+INAzh3oVtjXAgMqTOehVyUKCW+z3PMzPIjDti6NpquqHgHEH3EcQFDpg8utBY1jU
         CAzmh9DaybSelbmZ+3irtQF5kqTXwIKuuDz/HkGit5Cy/uBVz+TKSDcZ2Hxghbq7xCj8
         yLsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:content-language:in-reply-to:autocrypt
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:dkim-signature;
        bh=GmCXuikQ3JNx2WWkuLyBL+t1kGZ+SJ5e5/g1X1UNIxo=;
        fh=sNGSp/yUHHWYlnLp64NZwDnud+4laiBukRWdJ5vFdV4=;
        b=IVvU08TN+tIzGFMdOJohZUhYQxpkyKfYKq6wSKJoZWyQGMpUxqp2Oi7WlctdBN93nr
         nbtkI/WUQNzKySlzbcWVIBPZwsmUs7JG9p3uFuYwstpHg+69FKosPyWTfN3g01R7qDSq
         oRTycxyRkwDe50FgS8nqxHXoiQ4N6vj3SsAi/ThJd9u3o5mYRg81BBZWl6+3M6pXBIX9
         4JwyVXghGcGb6Jrrso/oESQytq8WC5QJtzXQSjMx8h/zi1W7zR4bfWBOwCXaTNufJir3
         ZpCk4bcqwf36sckUzzMft1uMaVZGZGR5SSMpB01i5gnfCMsKJW06eHBsjSDKatQI0jnF
         oqrw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Uxjo1L6m;
       spf=pass (google.com: domain of thuth@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <thuth@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id d75a77b69052e-46747afba61si58039331cf.131.2024.12.08.22.47.47
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Dec 2024 22:47:47 -0800 (PST)
Received-SPF: pass (google.com: domain of thuth@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Uxjo1L6m;
       spf=pass (google.com: domain of thuth@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1733726867;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=GmCXuikQ3JNx2WWkuLyBL+t1kGZ+SJ5e5/g1X1UNIxo=;
	b=Uxjo1L6mxyQexcwTRDsTP1ZAD6j3NMxVeDeCdoPTeFyalI8LODg5CjxP/Gffk5Bhb+Lu17
	qNR3MSe+ZZQRWwpgArfiIEfyTtCZGShmtmpiJiCxOWUbF0ARFEeGUOMzxlIndiIELxd6FD
	l5g+oY+W8IHq4pXZVlTKzOFd/ir5Oek=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-594-FyBwmuWlNRqqsqrHBiSYzA-1; Mon, 09 Dec 2024 01:47:45 -0500
X-MC-Unique: FyBwmuWlNRqqsqrHBiSYzA-1
X-Mimecast-MFC-AGG-ID: FyBwmuWlNRqqsqrHBiSYzA
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-434f0d1484bso6443015e9.1
        for <alex.bennee@linaro.org>; Sun, 08 Dec 2024 22:47:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733726864; x=1734331664;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GmCXuikQ3JNx2WWkuLyBL+t1kGZ+SJ5e5/g1X1UNIxo=;
        b=vdp7gBtUsIs93uEbParkVRdCMsrKUYKE9iloD5qhm+US02NbN44bXy73FmcLZBeUPP
         hmQr6qVy8naag5iL3LEDc6xo0EqqTl4oRxxQyeFd5KLYlbcUFeJznqHztC5BUyRea5On
         pjiwmnaOK5IHT8hB0FDFOxbnQw+NWcKNORkiGiXbaaiO8e6Q0B5wv+rP5X3fW1yBESc4
         2xbs3JrKcMsL1ePFcH24rAH4q8nOcIdnK46iYTmKEjggdV1MwGtqtOZQsk3y9AyuX6zU
         wb6QlWWhK+MrZ0NAeRZxJcedJ81o0M6hfqRT4emvi/RqUkKHgyIPkYvBmGRmipHp8r6W
         hmtw==
X-Forwarded-Encrypted: i=1; AJvYcCUAp7L0/cU9BXUESXq1gDMxmiMD6duMKLYIQkhaX3RnWsXz4AMQbUM8UaW3WD7xUMAoUToMOVMDyWkqZw==@linaro.org
X-Gm-Message-State: AOJu0YxTu5em9NFC+imhsclYfCUM1EJQKdDuWM7aP76jsK4tNBWSh0nl
	0eBtqMeP6i7PDjQt1HvgAhdACB5KYTUcK+QNg7SdmVy4/Em9Gj7aniqRqguI9gY6I6FwgyhNWyw
	byAOT0/UOwcWZMhGefcQvkT6d3fKJamLIZkH0nKRbDDybZ/B+RLcGKQ==
X-Gm-Gg: ASbGncspw66rMYEcQglzNYokAHggWABME6odBt3C96ZwSm4dyFEEim5F2IN5liCCFUz
	xOoHESMdK8IOk84NgZkXAC2h9bc5AEzV5A4yLjAO290ThcJ9a1nNKxwVWutjLhEBDQuj5C9ow8F
	a3wuxjAdmu72p89s4+5aeTLzVMTGohE7Pjf6ySyrkgwUbLCxUU33dU21N5FMABYIOo3zEwpYu5e
	JKYobHaDnYThclLzhVhL6nNdCGY2LwmWE0ImpChH6h/5/+Ina51EFVRyveGZtAtQ2oIcCSkdTVz
	/6c=
X-Received: by 2002:a05:600c:1d21:b0:434:9cc4:5139 with SMTP id 5b1f17b1804b1-434ddeb0492mr99462465e9.17.1733726864551;
        Sun, 08 Dec 2024 22:47:44 -0800 (PST)
X-Received: by 2002:a05:600c:1d21:b0:434:9cc4:5139 with SMTP id 5b1f17b1804b1-434ddeb0492mr99462315e9.17.1733726864164;
        Sun, 08 Dec 2024 22:47:44 -0800 (PST)
Return-Path: <thuth@redhat.com>
Received: from [192.168.0.6] (ip-109-42-49-52.web.vodafone.de. [109.42.49.52])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38621fbbe15sm12114373f8f.92.2024.12.08.22.47.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 08 Dec 2024 22:47:43 -0800 (PST)
Message-ID: <2f99cd24-768a-4e28-b5b4-d2697ca244af@redhat.com>
Date: Mon, 9 Dec 2024 07:47:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/6] docs/devel: add b4 for patch retrieval
To: Pierrick Bouvier <pierrick.bouvier@linaro.org>, qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-block@nongnu.org,
 philmd@linaro.org, Paolo Bonzini <pbonzini@redhat.com>,
 Fabiano Rosas <farosas@suse.de>,
 Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, qemu-arm@nongnu.org,
 Michael Roth <michael.roth@amd.com>, Peter Xu <peterx@redhat.com>,
 gustavo.romero@linaro.org, Yuri Benditovich <yuri.benditovich@daynix.com>,
 Eric Blake <eblake@redhat.com>, Andrew Melnychenko <andrew@daynix.com>,
 Konstantin Kostiuk <kkostiuk@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 Jason Wang <jasowang@redhat.com>, manos.pitsidianakis@linaro.org
References: <20241206192900.3893118-1-pierrick.bouvier@linaro.org>
 <20241206192900.3893118-4-pierrick.bouvier@linaro.org>
From: Thomas Huth <thuth@redhat.com>
Autocrypt: addr=thuth@redhat.com; keydata=
 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
In-Reply-To: <20241206192900.3893118-4-pierrick.bouvier@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 5qpP9fYIp1yNXgd5ftCLf_H75UgoPEAHnxTKuXOvNWo_1733726864
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TUID: OwxrkDE9TIr4

On 06/12/2024 20.28, Pierrick Bouvier wrote:
> Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
> ---
>   docs/devel/submitting-a-patch.rst | 10 ++++++++++
>   1 file changed, 10 insertions(+)
> 
> diff --git a/docs/devel/submitting-a-patch.rst b/docs/devel/submitting-a-patch.rst
> index 69df7682c5e..1ef7d137320 100644
> --- a/docs/devel/submitting-a-patch.rst
> +++ b/docs/devel/submitting-a-patch.rst
> @@ -433,6 +433,16 @@ For more details on how QEMU's stable process works, refer to the
>   
>   .. _participating_in_code_review:
>   
> +Retrieve an existing series
> +---------------------------
> +
> +If you want to apply an existing series on top of your tree, you can simply use
> +`b4 <https://github.com/mricon/b4>`__.
> +
> +::
> +
> +    b4 shazam $msg-id

Should we elaborate on $msg-id here? (saying that this is about patch series 
that have been sent to the mailing list and you have the retrieve the 
"Message-Id:" header from one of the patches?)

Apart from that the patch looks fine to me, thanks for tackling this!

  Thomas
