Received: by 2002:a17:907:8744:b0:9bd:85f7:2662 with SMTP id qo4csp1286283ejc;
        Thu, 12 Oct 2023 22:57:55 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF2IBvt/aAUe3o0+2/tQmbIMraRYy/iFjzS+Qlba0IeCbYD9ibexbcRnvbBOSAr5mgLqUWY
X-Received: by 2002:a0c:ec90:0:b0:65d:f1d:d383 with SMTP id u16-20020a0cec90000000b0065d0f1dd383mr30182611qvo.3.1697176675294;
        Thu, 12 Oct 2023 22:57:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1697176675; cv=none;
        d=google.com; s=arc-20160816;
        b=ABbVpxXObIwWOZb/vaUCk1e+Urk0biza8XpZ9syF9tvakMsMcASUxVlVsQAA+sAujD
         KsfScHGKo9NLziiJgJGNJX+Kf255sEOVT4MBXqG+CFZx9OfsqNUs7On+Q/i7dVxcIlb3
         ZZwDuW3qQ0bbZwBQzy0AU6hEMU7rnhN2EnqrS1Vpr9rcA78UaUvPn765FJ++xF4XMfdH
         BhDK9uLQo54YyAuJ/G3gtVNe5UysMzLDlZ6XdMIMQo9g0ExzjlqBVHwXP6duJlD50xxs
         saJ7opl0rbBq9z5bwmZ0MPEcGBWnDqW8+O+H7cMIjqgj0BMABLwocXZvVSZaFtFdjadO
         /2oQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:autocrypt:from:references:cc:to
         :subject:user-agent:mime-version:date:message-id:dkim-signature;
        bh=McRs59FkoxvhQ0XnH8Z7ctij3r6VyU/JHsaKB2KD0co=;
        fh=gGZ8KC2O7OgwRBDPiLtlNf/Vfu8laUlcFY/sAMdpb+8=;
        b=jk+x5usSOmdVl27beCCkSZF68JSEen1rU1MjZWOLMlV9lBR+XS/K2ZtLEEmPBB3/Fp
         BUeUNptaNryrZy8WEqPbWyi2TUEvChY+HlEjMxNfRlOFc7VmGjBN3yNXOey0ck22vXKd
         bzcHGe3jH+TXHsw3110hsNw12mCYTBAiKRPhNYgh5k2Vj1ebDdzpWlpj0UbX0u1gYBnA
         USI9rD8T/MdZP3rhdZes8fx0FwyirgiXlp40VvCf0fIZyQRO3+gibxWL6eXnqSzvbSYG
         8SW92D31MMWb/rXpx3wCLlZfaI8GwVBoXK4gkk+WmAL6NM+vgu/LCaB1B2i9ToJVWppR
         KOlQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=A4cxAjkE;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id er14-20020a056214190e00b0066d0543b654si710306qvb.341.2023.10.12.22.57.55
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 12 Oct 2023 22:57:55 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=A4cxAjkE;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qrBB8-0003Xg-FZ; Fri, 13 Oct 2023 01:57:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1qrBB1-0003Us-IQ
 for qemu-arm@nongnu.org; Fri, 13 Oct 2023 01:57:36 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1qrBB0-0007gd-0j
 for qemu-arm@nongnu.org; Fri, 13 Oct 2023 01:57:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1697176653;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=McRs59FkoxvhQ0XnH8Z7ctij3r6VyU/JHsaKB2KD0co=;
 b=A4cxAjkEscafVbz/A+kVYBwOM+QApFBeqJpngDXQpVCCUWxkcgleRZr5gDOkKcDQWvnk6q
 j5AZB1Zwp4fYJi6soaFsGsc2SvS3Tobb1nidJOeRo/m2OrdNT/dE07dMSIdVaE3++cxgEc
 ToL8phiyn8O5fVLcEAARFnoIMGAKUhk=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-414-rkai7j2qNYu3acNk0k0vZw-1; Fri, 13 Oct 2023 01:57:31 -0400
X-MC-Unique: rkai7j2qNYu3acNk0k0vZw-1
Received: by mail-ed1-f71.google.com with SMTP id
 4fb4d7f45d1cf-5219ceead33so1356761a12.2
 for <qemu-arm@nongnu.org>; Thu, 12 Oct 2023 22:57:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697176650; x=1697781450;
 h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
 :to:content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=McRs59FkoxvhQ0XnH8Z7ctij3r6VyU/JHsaKB2KD0co=;
 b=KJsA4OLZf8RQBJZ9MnEZ3FOmF3kk2aok60rI+S0kShWkEnPoIJsMMacxPCkf8mTyXF
 BozHdyKr/8NbFd7QcL6bRCBT1qAgoLyfFmUYXAMxfjhy4QXxNNXbAyiMSliERhHt/shE
 5X9S3g11ZTfjdHtgiNmacZ9QsOtMwR5jB8v6deqfrlUr8P7O7SzEVcDmmfPQFIlJkRBU
 LPJ1cqnY7MIdj58Vrbx5UY6sAdrfpAc83T7vEs/aV2lzCSuYd9CwJTIrpEQWYkyJ+aYt
 RfxKjOQU8t/9DrGhV0jmGdNjjXWz79iL2tlf5iRozz7eYCfQn9lcggFdXQYDRcwgUqg/
 SPAg==
X-Gm-Message-State: AOJu0YxItwUdiJqBjKFPJmuEcF0eYZCo1+knbMRjLWNZcvcrK8qR5b/e
 mvGaUYdQ6kIsYlQQ9dZkN1rNyw7pVQrm95jlEWcvReFKCpLgvhDAexmf0UWXe8o03ZGGDeAOUzs
 1lv1mNTjNB/yN
X-Received: by 2002:a05:6402:f2a:b0:53d:a3ff:4605 with SMTP id
 i42-20020a0564020f2a00b0053da3ff4605mr8340597eda.25.1697176650474; 
 Thu, 12 Oct 2023 22:57:30 -0700 (PDT)
X-Received: by 2002:a05:6402:f2a:b0:53d:a3ff:4605 with SMTP id
 i42-20020a0564020f2a00b0053da3ff4605mr8340581eda.25.1697176650154; 
 Thu, 12 Oct 2023 22:57:30 -0700 (PDT)
Received: from [192.168.0.5] (ip-109-43-176-176.web.vodafone.de.
 [109.43.176.176]) by smtp.gmail.com with ESMTPSA id
 bm15-20020a0564020b0f00b005346925a474sm11029123edb.43.2023.10.12.22.57.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 12 Oct 2023 22:57:29 -0700 (PDT)
Message-ID: <391dd185-aa0a-4bd5-b9bb-8324a7ab9296@redhat.com>
Date: Fri, 13 Oct 2023 07:57:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 03/10] tests/virtio-scsi: Clean up global variable
 shadowing
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Alberto Garcia <berto@igalia.com>,
 Hao Wu <wuhaotsh@google.com>, Kevin Wolf <kwolf@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-block@nongnu.org, John Snow <jsnow@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Fam Zheng <fam@euphon.net>,
 Tyrone Ting <kfting@nuvoton.com>, Markus Armbruster <armbru@redhat.com>
References: <20231009100251.56019-1-philmd@linaro.org>
 <20231009100251.56019-4-philmd@linaro.org>
From: Thomas Huth <thuth@redhat.com>
Autocrypt: addr=thuth@redhat.com; keydata=
 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
In-Reply-To: <20231009100251.56019-4-philmd@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: 16DrA8+O1ajD

On 09/10/2023 12.02, Philippe Mathieu-Daudé wrote:
> Rename the (unused) 'allow' argument, following the pattern
> used by the other tests in this file. This fixes:
> 
>    tests/qtest/virtio-scsi-test.c:159:61: error: declaration shadows a variable in the global scope [-Werror,-Wshadow]
>    static void hotplug(void *obj, void *data, QGuestAllocator *alloc)
>                                                                ^
>    tests/qtest/virtio-scsi-test.c:37:25: note: previous declaration is here
>    static QGuestAllocator *alloc;
>                            ^
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   tests/qtest/virtio-scsi-test.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/tests/qtest/virtio-scsi-test.c b/tests/qtest/virtio-scsi-test.c
> index ceaa7f2415..db10d572d0 100644
> --- a/tests/qtest/virtio-scsi-test.c
> +++ b/tests/qtest/virtio-scsi-test.c
> @@ -156,7 +156,7 @@ static QVirtioSCSIQueues *qvirtio_scsi_init(QVirtioDevice *dev)
>       return vs;
>   }
>   
> -static void hotplug(void *obj, void *data, QGuestAllocator *alloc)
> +static void hotplug(void *obj, void *data, QGuestAllocator *t_alloc)
>   {
>       QTestState *qts = global_qtest;
>   

Reviewed-by: Thomas Huth <thuth@redhat.com>

