Received: by 2002:a17:906:fc07:b0:9bd:85f7:2662 with SMTP id ov7csp2624105ejb;
        Wed, 25 Oct 2023 03:05:16 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHw95Mv8FPO+GO6k6FbrQr3pw6naJNS4qJwbn/TdNugMsxB3o1Wyb7EBraCQCQcM8S4UShO
X-Received: by 2002:a5d:60c5:0:b0:32d:6031:2824 with SMTP id x5-20020a5d60c5000000b0032d60312824mr11607500wrt.24.1698228316271;
        Wed, 25 Oct 2023 03:05:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1698228316; cv=none;
        d=google.com; s=arc-20160816;
        b=n6jNOWXQzAGEm0iZ/ndKnF1kfa+gmWUTP70Oi+o5Odowpv8JOkissD5oOLj/2aDhTu
         4749NTBdRo4uefodJV/2gszPZhU00Mb9FmCEtpbkptiukYdB5yHgs4Pt2aKi16exyxRo
         WJAhf0fyNBdrgU1nNLvOWAsTjxdMhfhUcx83if0+FmsNQiO8rHUDByeBnIt5dGKhCMKJ
         0YqDbeYg5S3Iwu05ywpAbprKBvXQWbmQ5MBFeULfHum1FqqrEyBJX/Z9jhwomOHrx2M7
         BKMjpkcbA1zy1QwuBSWjyiqRCtVc3ZhdBzI17E3Lp8WRkH3AFfEz3KVra5hlr77PFoFT
         frMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:autocrypt:from:references:cc:to
         :subject:user-agent:mime-version:date:message-id:dkim-signature;
        bh=WBkTec3I6PN0o+qGas23BhhkU4ufnWccXl+PvFU5hhc=;
        fh=0SwnxTk/kH/eCu4S7mbtHkWoZOqjr8yjdh6t+AwknJ0=;
        b=idPYXa13Xtgu+oYebP3ro4dSB/uwQ9djZ4UyuDXuRHfmwHFgvOMQOLwGzY+FfwwoRJ
         C8QvbxAcIczm8XG/hmOY7KpZw9QIQp+IKvfzhlyFxaKUIp7ZZmD1R2NkkA8Ey6CxWCBz
         YM8Bn2vRq49gHmf4J9+J6NdsG5t5nbLwm6nRLIOStcSzY8+aNOLyIscGrK0J0f9d+t69
         AusmJWc4rm2vchRGprNygfslCrDHmmzHga18gOMQEJxEznQ1P3dUUqfP7NfyKWIYwegD
         Dn+fp+zxgjZVj3saIuJljdawXpfsZH0FdyU24HhxsUT/KciICCExD+PCBVr4C8Afu9GN
         AbLg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=fRthbvoF;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id bo17-20020a056000069100b0032d9cb622bcsi7768125wrb.1055.2023.10.25.03.05.16
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 25 Oct 2023 03:05:16 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=fRthbvoF;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qval3-0004sS-1z; Wed, 25 Oct 2023 06:05:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1qvakx-0004ns-Na
 for qemu-arm@nongnu.org; Wed, 25 Oct 2023 06:04:55 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1qvakw-0000Ty-8U
 for qemu-arm@nongnu.org; Wed, 25 Oct 2023 06:04:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1698228293;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=WBkTec3I6PN0o+qGas23BhhkU4ufnWccXl+PvFU5hhc=;
 b=fRthbvoFnsG4T4hZAVVEbSbyj9+psk5MPSzjpFO7sC11yJ0LlS1cCmT9wNtGuw8woAS5Hh
 mhvMFEGk4ff6Tw2khX/axvrn9OJpgpVdHZy2PIUtgqtgtDsVjCuV/S7DemSU72wZ+5ZbFF
 9tmCaavrKZXcFN4vh7sqFFHNOP3hvFo=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-588-GlCoHm4vPHubbAE0Y4uDiA-1; Wed, 25 Oct 2023 06:04:41 -0400
X-MC-Unique: GlCoHm4vPHubbAE0Y4uDiA-1
Received: by mail-qv1-f69.google.com with SMTP id
 6a1803df08f44-66d03dcdc6bso75396016d6.1
 for <qemu-arm@nongnu.org>; Wed, 25 Oct 2023 03:04:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698228281; x=1698833081;
 h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
 :to:content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=WBkTec3I6PN0o+qGas23BhhkU4ufnWccXl+PvFU5hhc=;
 b=M+75/BUo/TVfXvlyENxGJUDeC3Ql9Uwv3PMA6BkFIptGyybDrHI9WYAddwbN9smSAt
 yzHSWrk9wYDTdtE/n+rY8xXfN6359DSWqaygcsRWmHHyC2Mh4tcVUM8u7ed+kWHmadFH
 fIvVN3xLaICDjQayLqWj/IJk497/t6DgKCP4ImM6boMUEKZDe2rGYabBaBuHGrZUm4rH
 fynTtTGhZGFS7D1k6B3ZZQ1L47B4AfC4JzMvqDKUbnvCV1iarZM2XE7qLANY+piXOIjG
 wDmFP6SDZfhMI69hAyVvpRSHAS9l5ZEsHFM5KGqciwoV3xjM7sX6eVzpc0f1CHsWZHDf
 kO8A==
X-Gm-Message-State: AOJu0Yw8Xm2MEYnKXgCL4lhAObnqDuMyQPsY882yU40zLcaoTcEs1QIN
 pPvtVfYEFjjGCG1IRhJZCRsIUBaMmWZDyMnVkbCisxM/LcvbT6D8Sa1ZJb9xzDJJO/9Foe2Oq0k
 cypizCyUpeY2X
X-Received: by 2002:ad4:5e87:0:b0:66d:11fd:c9c2 with SMTP id
 jl7-20020ad45e87000000b0066d11fdc9c2mr22341881qvb.17.1698228281507; 
 Wed, 25 Oct 2023 03:04:41 -0700 (PDT)
X-Received: by 2002:ad4:5e87:0:b0:66d:11fd:c9c2 with SMTP id
 jl7-20020ad45e87000000b0066d11fdc9c2mr22341868qvb.17.1698228281317; 
 Wed, 25 Oct 2023 03:04:41 -0700 (PDT)
Received: from [192.168.0.6] (ip-109-43-176-238.web.vodafone.de.
 [109.43.176.238]) by smtp.gmail.com with ESMTPSA id
 dp2-20020a05621409c200b006585c7f64a3sm4279849qvb.14.2023.10.25.03.04.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 25 Oct 2023 03:04:39 -0700 (PDT)
Message-ID: <ee4e84fc-4076-414f-ab9c-b03b4f029423@redhat.com>
Date: Wed, 25 Oct 2023 12:04:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 07/19] qmp/hmp: disable screendump if PIXMAN is missing
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
 <20231023113047.2572137-8-marcandre.lureau@redhat.com>
From: Thomas Huth <thuth@redhat.com>
Autocrypt: addr=thuth@redhat.com; keydata=
 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
In-Reply-To: <20231023113047.2572137-8-marcandre.lureau@redhat.com>
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
X-TUID: WfnfBfqgiDzz

On 23/10/2023 13.30, marcandre.lureau@redhat.com wrote:
> From: Marc-André Lureau <marcandre.lureau@redhat.com>
> 
> The command requires color conversion and line-by-line feeding. We could
> have a simple fallback for simple formats though.
> 
> Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
> Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   qapi/ui.json     | 3 ++-
>   ui/ui-hmp-cmds.c | 2 ++
>   ui/ui-qmp-cmds.c | 2 ++
>   hmp-commands.hx  | 2 ++
>   4 files changed, 8 insertions(+), 1 deletion(-)

Reviewed-by: Thomas Huth <thuth@redhat.com>


