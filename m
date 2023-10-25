Received: by 2002:a17:906:fc07:b0:9bd:85f7:2662 with SMTP id ov7csp2679647ejb;
        Wed, 25 Oct 2023 04:53:13 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEd0TRG889CimKIsIwWUKA0tf4QYKs6L7kN8KqrUg9m7y+vAiJpGE7ETKlq60HndnC5k8ju
X-Received: by 2002:ac8:598d:0:b0:41c:b9b6:ec11 with SMTP id e13-20020ac8598d000000b0041cb9b6ec11mr18534637qte.3.1698234793124;
        Wed, 25 Oct 2023 04:53:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1698234793; cv=none;
        d=google.com; s=arc-20160816;
        b=RKFRn8R871IlruYzK4EBd7Z3eWWLSQUGvGgWa/IoGPHpy/PAKTO3YfTfmsG2Ht2HiJ
         lDAYsMkCT6tQpVqIzffMXz9ms1IsXItIqnjPh38j29SbEkrQ7o4o8zHxLQyleCc1sxYY
         0fShxdDw9KgJLyYAufW8PN7ZOuOBfdTBEV01PVS4srFTq7jFuxOBIePIHAVhkPsUy8tE
         0EKACdK3b93u1sHk33+soridBLvAw9I2lfoar3RShoFqYyxvAGcLHVk0ualUNP0G6wJk
         gsyQ1Zl41VIWa2vrnW3dJIdBBtihQTEK+a+7G6i6KBDCo42Q/K0DiUyOvqpG4ax5YNzX
         1XJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:autocrypt:from:references:cc:to
         :subject:user-agent:mime-version:date:message-id:dkim-signature;
        bh=LqXLR1fzx9sf3d1tz/D8ZhMB31ufH/Xigc7+XgPUu+g=;
        fh=0SwnxTk/kH/eCu4S7mbtHkWoZOqjr8yjdh6t+AwknJ0=;
        b=mGwFtswWBWnyB06D1Vgfpae6MgKnjMLyfKO4+euDSwkKSbDXnyg8bjlKUoc0+Yfpn1
         B6USdZcv64prPJPzL515o9k4KfDtVgyld4JedtQdecNDEUtskZJoZjTJ8yQmbLbq05oC
         Gf65E/mz3wEekHCUHBXWtczmryxDdXpuYKUt1pk6J1reYNNK9vJShAdYX3nw4WtsbWlq
         0P19xHYtbNvPW5RbfOCnAJ6GYAKAautwcT3+RsVW5lXqNhErSTqvNg059h+fjbySZs0r
         UPSIQgYl4UEWJfg7Hx9g+mvb8KT/htEfxFT46rhVU5e5/SJymZ2aGxNBpy7djtbapBOK
         ccGw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=XlXL8cYR;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 14-20020ac8574e000000b004199342839dsi8316486qtx.234.2023.10.25.04.53.12
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 25 Oct 2023 04:53:13 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=XlXL8cYR;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qvcRe-0004la-Ku; Wed, 25 Oct 2023 07:53:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1qvcRc-0004l5-3n
 for qemu-arm@nongnu.org; Wed, 25 Oct 2023 07:53:04 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1qvcRZ-0004Op-A9
 for qemu-arm@nongnu.org; Wed, 25 Oct 2023 07:53:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1698234773;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=LqXLR1fzx9sf3d1tz/D8ZhMB31ufH/Xigc7+XgPUu+g=;
 b=XlXL8cYRPv8XMw2aNaUgRjPwQSfPz249T7KgFkoF0uaIak8gtb9+8TZ+mniFVoJY0Chmyc
 +aNyp2FWYNzUNbACAfm0ifn9loWEmm3fgt/Ld4kNSDG9ME78bHUoRFI3KtnAT5D4uqFV7p
 iP22RclCfBYaUtWveCvKVAeiGNHxe0M=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-694-VtlYxIkTOiGDWE0gXEVQng-1; Wed, 25 Oct 2023 07:52:52 -0400
X-MC-Unique: VtlYxIkTOiGDWE0gXEVQng-1
Received: by mail-qt1-f198.google.com with SMTP id
 d75a77b69052e-41cca916954so72918931cf.2
 for <qemu-arm@nongnu.org>; Wed, 25 Oct 2023 04:52:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698234772; x=1698839572;
 h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
 :to:content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=LqXLR1fzx9sf3d1tz/D8ZhMB31ufH/Xigc7+XgPUu+g=;
 b=Q39dM7JCmS8E/nKH9k4p1KNAofCwBaQwxjP8Cw3PZyLEVJlFnrMcVrEXmpYnNrBj3H
 rCrCt2LUy1hpZ8a8ky7iZ/ouPmbP8VBfAVd4WbV0n0hBrXp5s37u9PbINq37g0uTLS+R
 jWCOTEhyLL+jNb8Vet2cv48EkbeKUFFDsUJhRPkrDsw0fKwZKZ1UwhZVr9Ci5Zxx76n/
 V7KmwGm4FgDkkuRmF8DBZAIBDENnWU2EsvEmd/G2Y9YdDwlnYpsF7uznsz5wyu8OoL/n
 SFjGgCH11j8Vp46/IjC9SuhEAWA6FMFqvTiPl9p/rsDolrUbbTWCCmeTOSG8EnuzprA+
 F4pA==
X-Gm-Message-State: AOJu0Yx6rC/VHQ9boCz/5UgtI5CZDAOqSUZMiMS5I5gTjz9oIuEqQ31N
 5RD/cT637cJHO4wmZqUX/fJT9MmKYl/qL+5owpYWRXADRNFG/P3U2u14izwr5EDeD8qioYtThwv
 QFS9dPzPla754
X-Received: by 2002:a05:622a:1701:b0:419:a2c6:8207 with SMTP id
 h1-20020a05622a170100b00419a2c68207mr19796389qtk.22.1698234772085; 
 Wed, 25 Oct 2023 04:52:52 -0700 (PDT)
X-Received: by 2002:a05:622a:1701:b0:419:a2c6:8207 with SMTP id
 h1-20020a05622a170100b00419a2c68207mr19796369qtk.22.1698234771832; 
 Wed, 25 Oct 2023 04:52:51 -0700 (PDT)
Received: from [192.168.0.6] (ip-109-43-176-238.web.vodafone.de.
 [109.43.176.238]) by smtp.gmail.com with ESMTPSA id
 fj22-20020a05622a551600b004198ae7f841sm4172935qtb.90.2023.10.25.04.52.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 25 Oct 2023 04:52:51 -0700 (PDT)
Message-ID: <52338f56-cf2d-4eba-a6a4-5ca517f9fea6@redhat.com>
Date: Wed, 25 Oct 2023 13:52:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 12/19] ui/vnc: VNC requires PIXMAN
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
 <20231023113047.2572137-13-marcandre.lureau@redhat.com>
From: Thomas Huth <thuth@redhat.com>
Autocrypt: addr=thuth@redhat.com; keydata=
 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
In-Reply-To: <20231023113047.2572137-13-marcandre.lureau@redhat.com>
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
X-TUID: HFeKpAMpajhs

On 23/10/2023 13.30, marcandre.lureau@redhat.com wrote:
> From: Marc-André Lureau <marcandre.lureau@redhat.com>
> 
> Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
> ---
>   meson.build    | 6 +++++-
>   ui/meson.build | 4 ++--
>   2 files changed, 7 insertions(+), 3 deletions(-)
> 
> diff --git a/meson.build b/meson.build
> index 395d7155f6..c4dd9e01ea 100644
> --- a/meson.build
> +++ b/meson.build
> @@ -1536,7 +1536,11 @@ endif
>   vnc = not_found
>   jpeg = not_found
>   sasl = not_found
> -if get_option('vnc').allowed() and have_system
> +if get_option('vnc') \
> +             .disable_auto_if(not have_system) \
> +             .require(pixman.found(),
> +                      error_message: 'cannot enable VNC if pixman is not available') \
> +             .allowed()
>     vnc = declare_dependency() # dummy dependency
>     jpeg = dependency('libjpeg', required: get_option('vnc_jpeg'),
>                       method: 'pkg-config')
> diff --git a/ui/meson.build b/ui/meson.build
> index 7c99613950..b3525ef064 100644
> --- a/ui/meson.build
> +++ b/ui/meson.build
> @@ -46,8 +46,8 @@ vnc_ss.add(files(
>   ))
>   vnc_ss.add(zlib, jpeg, gnutls)
>   vnc_ss.add(when: sasl, if_true: files('vnc-auth-sasl.c'))
> -system_ss.add_all(when: vnc, if_true: vnc_ss)
> -system_ss.add(when: vnc, if_false: files('vnc-stubs.c'))
> +system_ss.add_all(when: [vnc, pixman], if_true: vnc_ss)
> +system_ss.add(when: [vnc, pixman], if_false: files('vnc-stubs.c'))

Is the change to ui/meson.build required at all? ... if I get the first hunk 
right, if "vnc" is enabled, that means that pixman has been found, too?

  Thomas


