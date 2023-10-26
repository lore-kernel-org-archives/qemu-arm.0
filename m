Received: by 2002:a17:906:c785:b0:9bd:85f7:2662 with SMTP id cw5csp138427ejb;
        Wed, 25 Oct 2023 22:29:38 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGNtfY1eFkO08QSF6vFdIiviQWp490RmPdpR55s8dYeL171rpDtzWek/CxqAI4Cny/+zA2n
X-Received: by 2002:a05:600c:1c29:b0:407:5b7c:2f6a with SMTP id j41-20020a05600c1c2900b004075b7c2f6amr13204946wms.0.1698298178507;
        Wed, 25 Oct 2023 22:29:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1698298178; cv=none;
        d=google.com; s=arc-20160816;
        b=0vFECE3qkbuUA8xae+Ls93rwzpuXA/EylPAwgD4o7REz3hPn0wSB3bHZvQ3JjMR//3
         raG5sfHOoCaV0bjiBmUb4HvhtOxdZqqvV9tnrXINRZ6FzWtkT72T+KOo+I/3id11fALF
         2h7t39xWRzCiS8kJ4CFWYnfet6JzOMlGU4dlY89LCn0fReI2x7v6c/Rt/kSMbGWdM4hx
         sbTlEnf4xv0jVtMcAwqLD2LhdS/AlNiYbBIdFmXvL+jefdy8oomsNGlnRcAkFo4svYlt
         PW5NAwYK2t6NvRnf7UrdJMs+/8qv1FajK8Uw+d7dQNf7IXOwC7zoEPTjb8jg9zFHreab
         O19g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:autocrypt:from:references:cc:to
         :subject:user-agent:mime-version:date:message-id:dkim-signature;
        bh=ogvkYCilsHe/ekfvb3A3ST8Y97I0ntZS3tXu7WqCNsg=;
        fh=0zTg7JqpEkRv6PpnFgWax7BLxT45hIRqZHSy67B+2mI=;
        b=LteEITx/GLF7l532MKO3iCp763DHGSi6FodVeisTt+sZXKqjfhPa70lyU53mtSWyD0
         XXQjaztrKErQaRJSaXqRWoLg27+IA1hfRyZHxlYCw+uSdcKKoHZj5wibZ9u2RiVKvmgc
         dX3FJcpZaXCGhjUiWlmKX//aPJ7gHWVAq3eHNL2VCzjBMU0S/ix7yDapMoANSar1Os7O
         gCCmAK/4HtaNWrdjuDOLOVwvBzi82KeLPBbVfn05vPf9VNd6ZV6NJHgKFBq+GVqT8fGz
         PFHsIbJjpnMjIVks9W7BmsJAPjO0h0jywGm0nqCMoxD7sT4zq+zBaa2VO0ZO+c9STxTa
         VrPA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=eof+93Ba;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d12-20020a05600c3acc00b0040643197ad3si1072826wms.73.2023.10.25.22.29.38
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 25 Oct 2023 22:29:38 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=eof+93Ba;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qvsvu-0007EP-MP; Thu, 26 Oct 2023 01:29:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1qvsvs-0007Dy-LS
 for qemu-arm@nongnu.org; Thu, 26 Oct 2023 01:29:24 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1qvsvr-0007C7-8R
 for qemu-arm@nongnu.org; Thu, 26 Oct 2023 01:29:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1698298162;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=ogvkYCilsHe/ekfvb3A3ST8Y97I0ntZS3tXu7WqCNsg=;
 b=eof+93Ba275Alc8t26wYgKAYx9xZbp+ezRys8vwhq3zq0ikyoCMD04G0Bkork957i7IX0U
 QR0zVXST2iynYjaD2xgrF8xuT9X2mgYbmiDr7H3h+93tQo7wY0H7+yLs6PgTCpHsyFLVHU
 kwY6wd1J+sbBnRbUm8OaWUREzcy4Lx0=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-184-Uik_Tq2ZNfeYs7EJDPU3fA-1; Thu, 26 Oct 2023 01:29:21 -0400
X-MC-Unique: Uik_Tq2ZNfeYs7EJDPU3fA-1
Received: by mail-ed1-f72.google.com with SMTP id
 4fb4d7f45d1cf-5402e97fdd1so306248a12.0
 for <qemu-arm@nongnu.org>; Wed, 25 Oct 2023 22:29:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698298160; x=1698902960;
 h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
 :to:content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ogvkYCilsHe/ekfvb3A3ST8Y97I0ntZS3tXu7WqCNsg=;
 b=W+jJ5720VuvTorHz7nOz5hfVr80RIksr9HLFe0Yb0UcpYiF6OgFg9Ux+Ct/wu+J7VQ
 eP5zrL2JViDG/awBHhfUvv/QDaDaiak/3E00Y+jCgahAZUgDgSrQE/W4ZTvDMc7Ut/9Y
 hO5CRblCDAvNCcfRgDUbpLIoOii+ia0lIuIvWb9IpC1R4NPe62KhJFfeZHkLF541V5eT
 TCLIp5TRM2pdsrD+BfGsd+JBH9kKMf9CZ74S+fcu58iYGeLN0ya3UgBv7AcYSzle0Kh+
 JsrbTX1BlnkaZmtjs4DMVRPAGWA89EopKScmRpep2s+/PdCRU+83TocUa8nmpsV5PpLq
 z2FA==
X-Gm-Message-State: AOJu0YxBExWMvDpdWuHiNlLKVwop30n2K6VP86yjlpY/XsBSBkPhwzsU
 XYlRsqAJfYMAcAzILBFrFq+OE79kCjg3yhEU34b+a5ieA/AkYyf1yBjyQ+Bkv41XuP4FY2b4nDY
 C7BxByw060REO
X-Received: by 2002:a05:6402:3593:b0:53d:983c:2672 with SMTP id
 y19-20020a056402359300b0053d983c2672mr14213181edc.38.1698298159830; 
 Wed, 25 Oct 2023 22:29:19 -0700 (PDT)
X-Received: by 2002:a05:6402:3593:b0:53d:983c:2672 with SMTP id
 y19-20020a056402359300b0053d983c2672mr14213144edc.38.1698298159481; 
 Wed, 25 Oct 2023 22:29:19 -0700 (PDT)
Received: from [192.168.0.6] (ip-109-43-176-238.web.vodafone.de.
 [109.43.176.238]) by smtp.gmail.com with ESMTPSA id
 a17-20020a50c311000000b0053dfd3519f4sm10803177edb.22.2023.10.25.22.29.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 25 Oct 2023 22:29:18 -0700 (PDT)
Message-ID: <1470d93e-171e-4f92-aff9-bc6ae7d088ae@redhat.com>
Date: Thu, 26 Oct 2023 07:29:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 07/23] vl: simplify display_remote logic
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
 <20231025190818.3278423-8-marcandre.lureau@redhat.com>
From: Thomas Huth <thuth@redhat.com>
Autocrypt: addr=thuth@redhat.com; keydata=
 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
In-Reply-To: <20231025190818.3278423-8-marcandre.lureau@redhat.com>
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
X-TUID: Q/gZByWQdBDB

On 25/10/2023 21.08, marcandre.lureau@redhat.com wrote:
> From: Marc-André Lureau <marcandre.lureau@redhat.com>
> 
> Bump the display_remote variable when the -vnc option is parsed, just
> like -spice.
> 
> Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
> ---
>   system/vl.c | 6 +-----
>   1 file changed, 1 insertion(+), 5 deletions(-)
> 
> diff --git a/system/vl.c b/system/vl.c
> index de6df188da..b07805d476 100644
> --- a/system/vl.c
> +++ b/system/vl.c
> @@ -1401,11 +1401,6 @@ static void qemu_create_default_devices(void)
>   #endif
>       }
>   
> -#if defined(CONFIG_VNC)
> -    if (!QTAILQ_EMPTY(&(qemu_find_opts("vnc")->head))) {
> -        display_remote++;
> -    }
> -#endif
>       if (dpy.type == DISPLAY_TYPE_DEFAULT && !display_remote) {
>           if (!qemu_display_find_default(&dpy)) {
>               dpy.type = DISPLAY_TYPE_NONE;
> @@ -3350,6 +3345,7 @@ void qemu_init(int argc, char **argv)
>   #ifdef CONFIG_VNC
>               case QEMU_OPTION_vnc:
>                   vnc_parse(optarg);
> +                display_remote++;
>                   break;
>   #endif
>               case QEMU_OPTION_no_acpi:

Reviewed-by: Thomas Huth <thuth@redhat.com>

