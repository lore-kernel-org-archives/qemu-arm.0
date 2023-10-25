Received: by 2002:a17:906:fc07:b0:9bd:85f7:2662 with SMTP id ov7csp2619017ejb;
        Wed, 25 Oct 2023 02:56:33 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGupNijJGyLmgntafuNZS0ZLweNOtVnp8Q2pDU5G4IwYZjsolhyAKJ0xw//OdwF1Fmzo5qe
X-Received: by 2002:a05:6214:2265:b0:66d:6439:4383 with SMTP id gs5-20020a056214226500b0066d64394383mr20665853qvb.58.1698227793097;
        Wed, 25 Oct 2023 02:56:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1698227793; cv=none;
        d=google.com; s=arc-20160816;
        b=I5PvZk2slufZIT7CZ9dLKUUqOKLUFsjW+FVu/TWYDEX5jM9nwlfqOn+OmgipC32xu6
         gSoOuZ123GRWuxWSrU7pukWSDs2FrOA+6EyYFajBQpAwitMAiCDac6L6kHmKsulp+t4V
         GwcCUkfAq5GD95ZsaSxwgEMefzRYtwb4B3piyHzd86GawVttTlV77ua8gEWRZxxPYtkN
         KCWwziV0Ijmubw7QXSEwFqcC2WbhfQIIP4jKxBKQk+jDUhMywz+TL9Ng5rxMbw2lzOYl
         2CAtWMxCcpfooSoPmsKelSJ0yfs7pCe9er3EhCsGi+NTzHQiDTRJgPSYuPZ/5Hb8ch7X
         flMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:autocrypt:from:references:cc:to
         :subject:user-agent:mime-version:date:message-id:dkim-signature;
        bh=QVmD8zqZydoV3shRVykzUUzCW6h5w8chMX44XbLS5tc=;
        fh=0SwnxTk/kH/eCu4S7mbtHkWoZOqjr8yjdh6t+AwknJ0=;
        b=ypyVVvqpxIc8p+C+T6y2kmSplQqzfMqNFqn0F20oOy8jFum9f2Kcrz0paN/Id7TVbL
         dwAMmZ0EzslrJCszDNTooJDJ9PHgUa1WANMoRUwf8QLB5T1k9YnHbOGmzihi3Qs5lkYV
         Za8hr/yNJaj8+kFa1mDiQdHekjgJWHU0HDzNx3GbEYgrM8RPao1zbastYfNFEcnltqL3
         XKOFrfkP7zKyVpTmZQ42VzcF5lAXey64dhs/xm5YxfgSmpdXLqQZBcVQpsd7drEEaA2r
         +kcfdpuP7Vcjk3EtOM761GSrhVwtEk0qsZWmzkzIgvnEuump/aPJk7XvH2Bzk+qAkCZ1
         g7/g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=RUHSqHEj;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s19-20020a05620a16b300b007742059b2c9si7835229qkj.482.2023.10.25.02.56.32
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 25 Oct 2023 02:56:33 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=RUHSqHEj;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qvace-0000xr-4Z; Wed, 25 Oct 2023 05:56:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1qvacd-0000wv-8y
 for qemu-arm@nongnu.org; Wed, 25 Oct 2023 05:56:19 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1qvacV-0007Yf-OJ
 for qemu-arm@nongnu.org; Wed, 25 Oct 2023 05:56:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1698227768;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=QVmD8zqZydoV3shRVykzUUzCW6h5w8chMX44XbLS5tc=;
 b=RUHSqHEjQ97Qp6hMFT1PjQpQTvEZfF8B39t3MuYeiVX5n+n7VoO8q2V1bt/G6ReU3kPB8S
 HT9peFzECI7boGe1jrM4QNMHv7TUR4cKGBo4loHRsS+xR5W9mxJIV2aJcc3lCqRM6EFj8p
 dFfB92cvNn1FIkeqG1EBBnRZNa+Gh8o=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-562-RANHXc4oPI6G01FgvxwSAw-1; Wed, 25 Oct 2023 05:56:07 -0400
X-MC-Unique: RANHXc4oPI6G01FgvxwSAw-1
Received: by mail-qk1-f199.google.com with SMTP id
 af79cd13be357-77892f2ee51so725061285a.1
 for <qemu-arm@nongnu.org>; Wed, 25 Oct 2023 02:56:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698227767; x=1698832567;
 h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
 :to:content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=QVmD8zqZydoV3shRVykzUUzCW6h5w8chMX44XbLS5tc=;
 b=f+0KGMV7c99oijm09zs9S35oWhw3ylU6PimU8ahDi69/F0an0xDOQZ385b0TcJQ9qe
 LhsHRT2DFg3S3xokA5boSC/CDtmUfGofgEL5G/JV+Fd8NfuDKYimWT5OBSfF+c9C23mW
 Tfrz44Y4rXImb9ThYEIuvLHCjRjhzDzRyfYKkPxgcU4x3RWXiBZEXf3vGzpC5fjcuovo
 90UwVmTPH/DXBuwFUnRsUWDz/etoyiQujP7XRjBDnRwNQzAGCQl8qFZd5wxYExBTr7k2
 iSDIuHInqBp6HyIjUzVi4Bar3PdzerB4AXrXw7s/+GG/iRWittCghMPiDLs08bG1Qb+b
 4ugg==
X-Gm-Message-State: AOJu0YyLVhy2n63OZ36LpV22nj4CcdZ+tMqHeRmX1abuotV2wZbcqozz
 Jk6Ut9/s8M14uSuGCVJy0/CQ3qKzS3gkzyOnAiNOu7jL0dEX04/JG5fPo7lh/pMtFY3VA9E1RYC
 waqIJ+X3nIQ+9
X-Received: by 2002:a05:620a:3193:b0:778:b3fa:e0cf with SMTP id
 bi19-20020a05620a319300b00778b3fae0cfmr15624329qkb.40.1698227767294; 
 Wed, 25 Oct 2023 02:56:07 -0700 (PDT)
X-Received: by 2002:a05:620a:3193:b0:778:b3fa:e0cf with SMTP id
 bi19-20020a05620a319300b00778b3fae0cfmr15624316qkb.40.1698227767068; 
 Wed, 25 Oct 2023 02:56:07 -0700 (PDT)
Received: from [192.168.0.6] (ip-109-43-176-238.web.vodafone.de.
 [109.43.176.238]) by smtp.gmail.com with ESMTPSA id
 ay7-20020a05620a178700b007758d87524esm4075930qkb.3.2023.10.25.02.56.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 25 Oct 2023 02:56:05 -0700 (PDT)
Message-ID: <4af29498-c70f-4969-ba71-2b30ed281ea6@redhat.com>
Date: Wed, 25 Oct 2023 11:56:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 04/19] vl: move display early init before default
 devices
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
 <20231023113047.2572137-5-marcandre.lureau@redhat.com>
From: Thomas Huth <thuth@redhat.com>
Autocrypt: addr=thuth@redhat.com; keydata=
 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
In-Reply-To: <20231023113047.2572137-5-marcandre.lureau@redhat.com>
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
X-TUID: ODJFzW3cLDfh

On 23/10/2023 13.30, marcandre.lureau@redhat.com wrote:
> From: Marc-André Lureau <marcandre.lureau@redhat.com>
> 
> The next commit needs to have the display registered itself before
> creating the default VCs.
> 
> Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
> ---
>   system/vl.c | 41 +++++++++++++++++++++++------------------
>   1 file changed, 23 insertions(+), 18 deletions(-)
> 
> diff --git a/system/vl.c b/system/vl.c
> index 92d29bf521..2cecb3d884 100644
> --- a/system/vl.c
> +++ b/system/vl.c
> @@ -1349,6 +1349,28 @@ static void qemu_disable_default_devices(void)
>       }
>   }
>   
> +static void qemu_early_display_init(void)
> +{
> +#if defined(CONFIG_VNC)
> +    if (!QTAILQ_EMPTY(&(qemu_find_opts("vnc")->head))) {
> +        display_remote++;
> +    }
> +#endif
> +    if (dpy.type == DISPLAY_TYPE_DEFAULT && !display_remote) {
> +        if (!qemu_display_find_default(&dpy)) {
> +            dpy.type = DISPLAY_TYPE_NONE;
> +#if defined(CONFIG_VNC)
> +            vnc_parse("localhost:0,to=99,id=default");
> +#endif
> +        }
> +    }
> +    if (dpy.type == DISPLAY_TYPE_DEFAULT) {
> +        dpy.type = DISPLAY_TYPE_NONE;
> +    }
> +
> +    qemu_display_early_init(&dpy);
> +}

So we now have qemu_early_display_init() and qemu_display_early_init() ... ? 
That's very confusing, could you maybe come up with a different name for the 
new function?

  Thomas


