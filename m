Received: by 2002:a17:906:c785:b0:9bd:85f7:2662 with SMTP id cw5csp141022ejb;
        Wed, 25 Oct 2023 22:36:22 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH33MYwcC6g9mMltRYeplihvMOQelnXdQS+1lM0h7fSNAnsRM99CgXa3yywmCQnjWzpRmW7
X-Received: by 2002:a05:600c:3b9a:b0:401:b92f:eec5 with SMTP id n26-20020a05600c3b9a00b00401b92feec5mr1615906wms.9.1698298581831;
        Wed, 25 Oct 2023 22:36:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1698298581; cv=none;
        d=google.com; s=arc-20160816;
        b=Uwop7MVPVCbRnn1wD3sqyUW3QpHXs6PxYbhYmHtJGNycRSuaZ2rwruMJqKQS8Czda5
         GCEHVwUAjjSBGi0zResCdMkZLyXhigxvBPP2wNKe4Bt7rbn1chYA/BuS/gapt+waZeuR
         fAZBH0d2nedZHSNmn4/tZdJOTgA10KI2xL1z9Q6zeCAvNiKmBmcsyM6exEHARpU6l4ZB
         98b8xsGnrLUYSWorfTbV9jNnoZ5gnuL8xDxrzZCUa9y8R6rbSMcVMhh5/ED/Bw10n5uz
         kGZBgJFBXVaT5jczQeryfHK1sI6eazMBDDgr3SF8PnD7mpztia7gp3xUgWGnNL8bBiHA
         dA+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:autocrypt:from:references:cc:to
         :subject:user-agent:mime-version:date:message-id:dkim-signature;
        bh=tIfNG8YvH6foowrqenfZ56vrAE4NkFAwK2XL+sbF25o=;
        fh=0zTg7JqpEkRv6PpnFgWax7BLxT45hIRqZHSy67B+2mI=;
        b=YbXFH17KYLEH9DS0jhtHZ+C2Wmt3j8muhV6VjlVdA9oWEl4/hZDCecWapjs2q2E2Rl
         3EzImoJuAK4JRmKncyyXDkpvMS5YNrxQuKds8/CTAKkPVR8gIXtwJBGP0bNnec5FSlJU
         IrRVsJnl3pUWDhTprCYAWalO9Tb8k2iqIt2ySB/pexRU2IpGjCbo5YdKZATag68Ta9wy
         bmuhapSjrzNa9Lgqu7ZPPb+ky3/8QzqMOCfSMCbSTYayGetVABk8ZWbN8pcym97aJ1Ig
         0/zCTOdkiLi9RjzkLXHuTm3GTCCger611ljEdSmsFzlqdqyfwN9xkXSS/QPODkOl3J4R
         jFMw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=iNNIEji6;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p30-20020a05600c1d9e00b0040859d4f3d5si1092289wms.92.2023.10.25.22.36.21
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 25 Oct 2023 22:36:21 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=iNNIEji6;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qvt2Q-0003cN-PY; Thu, 26 Oct 2023 01:36:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1qvt2N-0003XQ-Ru
 for qemu-arm@nongnu.org; Thu, 26 Oct 2023 01:36:08 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1qvt2L-0003B0-4A
 for qemu-arm@nongnu.org; Thu, 26 Oct 2023 01:36:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1698298564;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=tIfNG8YvH6foowrqenfZ56vrAE4NkFAwK2XL+sbF25o=;
 b=iNNIEji6uyyI/Y0+63lA38IocoLpDVJt0EgY3sNOOkW6/tw1na8AnX5+3WhqisodBQjGxh
 Ct8rfMUq931zjpGIY5QuAlyEIOkYopnyLuqj9yF3CjLfnhW0Lj3Gq2voc5xk+GoY8Uq1mJ
 xd/G9V/5bmFEpDf8hDRUQFm7DmUEMsE=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-126-DVTLn0LqM3mkwchM0oxrAA-1; Thu, 26 Oct 2023 01:36:02 -0400
X-MC-Unique: DVTLn0LqM3mkwchM0oxrAA-1
Received: by mail-ej1-f71.google.com with SMTP id
 a640c23a62f3a-9bea60bd1adso177054866b.0
 for <qemu-arm@nongnu.org>; Wed, 25 Oct 2023 22:36:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698298561; x=1698903361;
 h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
 :to:content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=tIfNG8YvH6foowrqenfZ56vrAE4NkFAwK2XL+sbF25o=;
 b=Acj2TcSGYHCfH47WswkvAbGLWAMZCICMYOD+VVjDS0gEwOatODw8y9cUVjgxf3qtzS
 JyAcxooctxUbWK/hTBIG864kwgs7T3k6yiyVf3UwI1J5Sxcr+CZ3JSGw29eopfLg65hv
 CcTlQaLKuhoP5SDGjYlG/5NPn768bl6imD1A0hN6wAFvjOajvHAJ3MjZ34htbcmnLZcj
 Mt3AhM+LsNBqhHbgbychlnWSX8dYzrk4a2JHtCFRefnJWXI48qBEKcNETClj+JvCc3Zr
 TH6jRqE3l5AZ05nTj3OVR1WrLvC6YmjERdASZg8Q9iXwuZ2u7H82KBQcdqrMbCVzNwzc
 o12A==
X-Gm-Message-State: AOJu0Yx2rHz86WRqdFdlf/fo1L1uPVozhGB3srJWZCC/KXMkCgdCRXJs
 hJBvmnpbZYLW7LwrObYe86HAVlDqDDmvh6LLsFjotzvUfwaFZt4qXaOa/CZnN2rBKkETpwZShkk
 xLx3NgYl7IpHd
X-Received: by 2002:a17:907:7f0f:b0:9bd:a029:1a10 with SMTP id
 qf15-20020a1709077f0f00b009bda0291a10mr1836506ejc.32.1698298561469; 
 Wed, 25 Oct 2023 22:36:01 -0700 (PDT)
X-Received: by 2002:a17:907:7f0f:b0:9bd:a029:1a10 with SMTP id
 qf15-20020a1709077f0f00b009bda0291a10mr1836482ejc.32.1698298561197; 
 Wed, 25 Oct 2023 22:36:01 -0700 (PDT)
Received: from [192.168.0.6] (ip-109-43-176-238.web.vodafone.de.
 [109.43.176.238]) by smtp.gmail.com with ESMTPSA id
 i25-20020a170906251900b009ca522853ecsm5926116ejb.58.2023.10.25.22.35.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 25 Oct 2023 22:36:00 -0700 (PDT)
Message-ID: <bfaa19e0-3909-4377-9836-95c11de3f4bd@redhat.com>
Date: Thu, 26 Oct 2023 07:35:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 09/23] ui/console: allow to override the default VC
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
 <20231025190818.3278423-10-marcandre.lureau@redhat.com>
From: Thomas Huth <thuth@redhat.com>
Autocrypt: addr=thuth@redhat.com; keydata=
 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
In-Reply-To: <20231025190818.3278423-10-marcandre.lureau@redhat.com>
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
X-TUID: LEJSVz4s+MKC

On 25/10/2023 21.08, marcandre.lureau@redhat.com wrote:
> From: Marc-André Lureau <marcandre.lureau@redhat.com>
> 
> If a display is backed by a specialized VC, allow to override the
> default "vc:80Cx24C". For that, set the dpy.type just before creating
> the default serial/parallel/monitor.
> 
> As suggested by Paolo, if the display doesn't implement a VC (get_vc()
> returns NULL), use a fallback that will use a muxed console on stdio.
> 
> This changes the behaviour of "qemu -display none", to create a muxed
> serial/monitor by default.
> 
> Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
> ---


Reviewed-by: Thomas Huth <thuth@redhat.com>

