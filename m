Received: by 2002:a17:906:fc07:b0:9bd:85f7:2662 with SMTP id ov7csp2626473ejb;
        Wed, 25 Oct 2023 03:09:15 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFYdjheANPQ/DM2hj0s05GKTzYKsw4r9sAmUoVqz5WcUy99+rgzcf7rfe9gEFogsT3WC+ai
X-Received: by 2002:a2e:9218:0:b0:2c0:168c:e6bd with SMTP id k24-20020a2e9218000000b002c0168ce6bdmr9880467ljg.28.1698228555501;
        Wed, 25 Oct 2023 03:09:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1698228555; cv=none;
        d=google.com; s=arc-20160816;
        b=P2OD97aT+69Y+IQoYELpyz9Wy4BzfyFklTa78E869L2m1tRgC2o7iAcocF7emXvfeC
         IaK29ULxu35Ym7RXGdFFcDuwOolQfHNEBVa9WeWoCXIX2Enxq843odGZGmZVBVXUJ8bl
         uzpqpMmaNgrf4+CVeTiPGMlgV5oy/Xe3fkbOPe+7GKeU+whOA9uzsXr+DP2qGs0jYD7g
         UQE1bkCBzoCTBhY9o6yec/b0Tbn7D1UipHhZGTsixryGiZ8+abDD0CZs3l1gqcwxdtIf
         XsDndDivJjsHeY/72etO7Gjl9DDoj8uHXlr23VVP2ruNBzDrU07QX5MXjKgNsG3/T41S
         uF/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:autocrypt:from:references:cc:to:content-language
         :subject:user-agent:mime-version:date:message-id:dkim-signature;
        bh=Sp5y0za6XJ/Sd2CutG4u2SLT03s7qJXFfppJwYJDj9E=;
        fh=0SwnxTk/kH/eCu4S7mbtHkWoZOqjr8yjdh6t+AwknJ0=;
        b=Pibo01wssD+l3hC9jSz0HPYaYu/lc1a9xo6BIOByrP5ihxeLsgnoWtdUMGa8M3KDZg
         zfU0Mxb5jSWzW0yVATp67LJCHMc905re9/pSyDUcBJZvoRPv41L65VEUqpc/PGKNy9E3
         NaiRqgYhgMt8oRFTjngEbcDrPkAZxCXHKgULOeG4MctgtblVozlaogWGAqFCYY/nkbfL
         W6VkeDnNhcA96i3MUhj45JRux1CXc6NX7MWBD8wUTiZIZmo989ZfInD0uSrJhOyMLxLd
         z+F+KNLJBsTvPFUpNL7AoN+pX9PjAa9A1SyX3+odX5VUD4mD5yDgPtgANjRPsGWKvpwY
         N7+Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=QWYXFuAj;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o12-20020a5d670c000000b003233654610csi6941480wru.975.2023.10.25.03.09.15
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 25 Oct 2023 03:09:15 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=QWYXFuAj;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1qvaow-0007dQ-Md; Wed, 25 Oct 2023 06:09:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1qvaoq-0007cJ-81
 for qemu-devel@nongnu.org; Wed, 25 Oct 2023 06:08:56 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1qvaoo-0001FS-Pk
 for qemu-devel@nongnu.org; Wed, 25 Oct 2023 06:08:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1698228533;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=Sp5y0za6XJ/Sd2CutG4u2SLT03s7qJXFfppJwYJDj9E=;
 b=QWYXFuAj+LXJAmoNzQR2dEsHDDE6dE+0lFtJ3hpAfyIOQZduDQOH10p1cIBgBuXCURUe0f
 ZC4uE/cXsEGQwQRfMuv9qDb4EHPF7+kgumwxzC5BpNxBB4uu6G9axi9Gacc06nR8wfOWD0
 Jfr1gRtJFE2uLjV5mDnD72CKmL0lRqY=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-168-evXGP-EQO9W1qqgLfdEDQA-1; Wed, 25 Oct 2023 06:08:51 -0400
X-MC-Unique: evXGP-EQO9W1qqgLfdEDQA-1
Received: by mail-qv1-f72.google.com with SMTP id
 6a1803df08f44-66d040c58eeso75430356d6.3
 for <qemu-devel@nongnu.org>; Wed, 25 Oct 2023 03:08:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698228531; x=1698833331;
 h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
 :to:content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Sp5y0za6XJ/Sd2CutG4u2SLT03s7qJXFfppJwYJDj9E=;
 b=wlXBtChgcenL3sOTcG6axJXMfgYDJodzlQV7TLn2bFFQB7GIb8i+uvMit6a/4R+dK0
 Xw5AMLj1YcZ9APEXYbdm4SULCfLVyGm8or5HJWUtaO4RXv2T82Bjk4D4ED35aC+z/uo9
 2knpsaALzqMlQp8QsP5iPGtmFE5kAk1h/45XhtdNvIZz1DwPTtKaR6HB4AMLOQP1JJr+
 cjTYLO0HDbjmiYA8occKIZq9nrIG7GCnnn6mKfmEaa6YGRItYBtsynCtXiQgtB2z0kG/
 ZzoEKZOkoWhehItnaDQvmKphQctO0D3jr2xphM7jXK/KK6G452DsHLwnLQKKB7oySUKw
 /yvA==
X-Gm-Message-State: AOJu0YwIiVmnQYWfV2Tn/YkWAc5l6S5/5nCrhYUVbIqTj4zrS6JEecb4
 MrMqfMaY3TDlEZ7iUcUwiojt62hnUwaxZvsQkXLHuJE22NoF3kg6GE1kBZCny1xLNsK76PLmdNp
 aaO6YuXSRFYGcMig=
X-Received: by 2002:a05:6214:5006:b0:66d:1b61:f206 with SMTP id
 jo6-20020a056214500600b0066d1b61f206mr19284730qvb.59.1698228531383; 
 Wed, 25 Oct 2023 03:08:51 -0700 (PDT)
X-Received: by 2002:a05:6214:5006:b0:66d:1b61:f206 with SMTP id
 jo6-20020a056214500600b0066d1b61f206mr19284705qvb.59.1698228531157; 
 Wed, 25 Oct 2023 03:08:51 -0700 (PDT)
Received: from [192.168.0.6] (ip-109-43-176-238.web.vodafone.de.
 [109.43.176.238]) by smtp.gmail.com with ESMTPSA id
 r13-20020a0cf60d000000b0064f4ac061b0sm4280315qvm.12.2023.10.25.03.08.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 25 Oct 2023 03:08:50 -0700 (PDT)
Message-ID: <1390cf2c-0da0-43b8-8b50-d393f9d932a8@redhat.com>
Date: Wed, 25 Oct 2023 12:08:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 03/19] ui: add pixman-compat.h
Content-Language: en-US
To: marcandre.lureau@redhat.com, qemu-devel@nongnu.org
Cc: "Michael S. Tsirkin" <mst@redhat.com>, BALATON Zoltan
 <balaton@eik.bme.hu>, qemu-ppc@nongnu.org, Gerd Hoffmann
 <kraxel@redhat.com>, =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?=
 <philmd@linaro.org>, Markus Armbruster <armbru@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 "Dr. David Alan Gilbert" <dave@treblig.org>, Eric Blake <eblake@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
References: <20231023113047.2572137-1-marcandre.lureau@redhat.com>
 <20231023113047.2572137-4-marcandre.lureau@redhat.com>
From: Thomas Huth <thuth@redhat.com>
Autocrypt: addr=thuth@redhat.com; keydata=
 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
In-Reply-To: <20231023113047.2572137-4-marcandre.lureau@redhat.com>
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
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: Yl1ylWD4YyW2

On 23/10/2023 13.30, marcandre.lureau@redhat.com wrote:
> From: Marc-André Lureau <marcandre.lureau@redhat.com>
> 
> This is a tiny subset of PIXMAN API that is used pervasively in QEMU
> codebase to manage images and identify the underlying format.
> 
> It doesn't seems worth to wrap this in a QEMU-specific API.

IMHO it's not very beautiful, but after thinking about it for a while, I 
think it's acceptable and likely still better than disabling all the 
dependend devices...

> Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
> ---
>   include/ui/pixman-compat.h | 195 +++++++++++++++++++++++++++++++++++++

Just a matter of taste, but I think I'd rather name it "pixman-minimal.h" 
instead.

Anyway:
Acked-by: Thomas Huth <thuth@redhat.com>

