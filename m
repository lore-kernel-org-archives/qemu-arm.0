Received: by 2002:a17:906:c785:b0:9bd:85f7:2662 with SMTP id cw5csp143275ejb;
        Wed, 25 Oct 2023 22:43:02 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH7ZYUfZWPoPEESJSGXl+0Z2LhYpib7x+ZERY2eHx4jev90bAlml6fCB3+9Ys5eqEvuKJWX
X-Received: by 2002:ac8:578f:0:b0:40f:f9c8:1b98 with SMTP id v15-20020ac8578f000000b0040ff9c81b98mr25036658qta.10.1698298982495;
        Wed, 25 Oct 2023 22:43:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1698298982; cv=none;
        d=google.com; s=arc-20160816;
        b=GQA0dxFltk8nB1PTw+oOgM0+RShERHRF2zE9cVpOrP6NHV086eFb1sz/E940seU0tH
         XPBkHRjL/aCJwMXmDpVapLT86upCNEEZ0ohGZi7KZOBdL1w8/kW6KAzVp6D90TiKBicF
         KNTiqsLjIZKU0kj6AmVYveAWWnpOnWF+ddNbC7ABEKTpm78aQq5fvmT/wCCPrLs/I0Gv
         HmzhDkMJbBoWNOz/kWlhXx7ZHvXbW5fnApblOBcTRUGgfG9AUNWOUJaBRbmlU70yU8U7
         +X95aAnTopOP/Zk3KkfL+b2d0QJzNFzGdX/y5jszyoNk9EZxHgEazpGLk5HFPr7KaK8+
         mjFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:autocrypt:from:references:cc:to
         :subject:user-agent:mime-version:date:message-id:dkim-signature;
        bh=M62oP6RMWxo24vYvkkGivV8c/vOdV9qNohO+nUDSQtg=;
        fh=0zTg7JqpEkRv6PpnFgWax7BLxT45hIRqZHSy67B+2mI=;
        b=LV3vp4P7sEj9zJ+BjMPuaeOBcl3uARuvX37jBJR6xeFoW5ZrhgWo7FNvHyZ3Ei+8tu
         3Al3ki4iSJtROy/6nwjSYGjOsw9pz5OjqBCGCE4VhQ2Vmv6RJ7uJL4KamVifdsIjyvrn
         FAmpw55zS2+kWwFg20P0aOlu+xfanL9xq42viSHHjr7nmK/MM0oFIjsJSpdGej+fPyMe
         SQJW418eHw290qI5yEPtwormHxAwMPHbkAqJLIdeWsiquTjzyrYhr9Oqs6ctv9yuS3qm
         l+00T/AFpXrUcU7Hob4fGULOZkL+p0od13vaHMkPnJNgqTzKMScFZqnUgUsIAHphIIYG
         Zvcg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Xkp81zex;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u16-20020a05622a14d000b00419785380efsi9158945qtx.115.2023.10.25.22.43.02
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 25 Oct 2023 22:43:02 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Xkp81zex;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qvt8s-00015G-Vm; Thu, 26 Oct 2023 01:42:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1qvt8r-00011g-Of
 for qemu-arm@nongnu.org; Thu, 26 Oct 2023 01:42:49 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1qvt8q-0006Dm-9X
 for qemu-arm@nongnu.org; Thu, 26 Oct 2023 01:42:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1698298967;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=M62oP6RMWxo24vYvkkGivV8c/vOdV9qNohO+nUDSQtg=;
 b=Xkp81zexVVL+DfxwrDLbG+W1RQ49REct3vsFfDd7oGbNIWBBB1WuSmu3Ruw/PH8pYDOq4H
 kBKyhzyQfCKYds7bLI6mEqO9BzTj3XjsVeCehygoTatpfMksVp5cb/tj013/P70Al89XrK
 vBwDkE3oIPgOdXvz7yPbuRJk8G53TbI=
Received: from mail-lf1-f72.google.com (mail-lf1-f72.google.com
 [209.85.167.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-594-owcgf2U8OAyxvCYEBnRNqA-1; Thu, 26 Oct 2023 01:42:46 -0400
X-MC-Unique: owcgf2U8OAyxvCYEBnRNqA-1
Received: by mail-lf1-f72.google.com with SMTP id
 2adb3069b0e04-5079fd97838so459712e87.1
 for <qemu-arm@nongnu.org>; Wed, 25 Oct 2023 22:42:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698298965; x=1698903765;
 h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
 :to:content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=M62oP6RMWxo24vYvkkGivV8c/vOdV9qNohO+nUDSQtg=;
 b=dzF2J4s++SgXkhiDKBEU2/LpQjokH4gxz0oLtASwXgc/MrtVvHH9vjnzRINN7ld3FU
 JHKQ/RjPqiditiMwObTX/STS2+fPUjpjm0eSNL0Y5yDKYAh5s1WQXK1XDbVNx9v2Hk6h
 qvjjgNQj+AELYHSBOrOpbBlZrLQpt3lB70J1Ax6lCRDLfDSEudafgQR6KmxqDucL1W0g
 kauuubSfVqKZ+vw/neb5P0Lgk5YryPZbwFGaMrsjjoRUxejjE5cmlJJljD2LvQmwV4fz
 p9jzXTXnHBYwoSr+BRkQdOYMWzK/M68IBCcUWbiWWc004s90RiOQxqmZDpQd8BIOG7GQ
 +6pQ==
X-Gm-Message-State: AOJu0YwGIiUQddq5lM3jXDtl7e2CXrffEKqJgAfxyLxVhly5tfkUGJD5
 TmRE04fZKcXa929CyGnq/UPT5KahffqHyh1LHq4OE+K0tcRhxmtpXJCSgT+5e9LfcpZbOXR6nXK
 8T4E2WrnNth0d
X-Received: by 2002:a05:6512:401d:b0:508:1a25:a194 with SMTP id
 br29-20020a056512401d00b005081a25a194mr2943361lfb.21.1698298964859; 
 Wed, 25 Oct 2023 22:42:44 -0700 (PDT)
X-Received: by 2002:a05:6512:401d:b0:508:1a25:a194 with SMTP id
 br29-20020a056512401d00b005081a25a194mr2943343lfb.21.1698298964556; 
 Wed, 25 Oct 2023 22:42:44 -0700 (PDT)
Received: from [192.168.0.6] (ip-109-43-176-238.web.vodafone.de.
 [109.43.176.238]) by smtp.gmail.com with ESMTPSA id
 if5-20020a0564025d8500b0053f10da1105sm10675390edb.87.2023.10.25.22.42.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 25 Oct 2023 22:42:44 -0700 (PDT)
Message-ID: <f9849959-1b64-4d3c-9987-3b035949d9b1@redhat.com>
Date: Thu, 26 Oct 2023 07:42:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 23/23] build-sys: make pixman actually optional
To: marcandre.lureau@redhat.com, qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 "Dr. David Alan Gilbert" <dave@treblig.org>, Eric Blake <eblake@redhat.com>,
 BALATON Zoltan <balaton@eik.bme.hu>, Gerd Hoffmann <kraxel@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, qemu-arm@nongnu.org,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
References: <20231025190818.3278423-1-marcandre.lureau@redhat.com>
 <20231025190818.3278423-24-marcandre.lureau@redhat.com>
From: Thomas Huth <thuth@redhat.com>
Autocrypt: addr=thuth@redhat.com; keydata=
 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
In-Reply-To: <20231025190818.3278423-24-marcandre.lureau@redhat.com>
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
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: yjywsDy75wv1

On 25/10/2023 21.08, marcandre.lureau@redhat.com wrote:
> From: Marc-André Lureau <marcandre.lureau@redhat.com>
> 
> Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
> ---
>   meson.build | 3 ---
>   1 file changed, 3 deletions(-)
> 
> diff --git a/meson.build b/meson.build
> index ad1e0155ee..a35cd860aa 100644
> --- a/meson.build
> +++ b/meson.build
> @@ -817,9 +817,6 @@ if not get_option('pixman').auto() or have_system or have_tools
>     pixman = dependency('pixman-1', required: get_option('pixman'), version:'>=0.21.8',
>                         method: 'pkg-config')
>   endif
> -if not pixman.found() and (have_system or have_tools)
> -  error('FIXME: pixman is currently required')
> -endif
>   
>   zlib = dependency('zlib', required: true)
>   

Reviewed-by: Thomas Huth <thuth@redhat.com>

