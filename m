Received: by 2002:a17:906:3657:b0:a0d:e0d9:b5bf with SMTP id r23csp2469340ejb;
        Sun, 3 Dec 2023 20:50:45 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGpONioKZfJ4O+HIRlMc65LQmC62QStKntbsfSPOXupymG2l8pjbmDAIlnDj4QGEiQcDm6H
X-Received: by 2002:a05:620a:269e:b0:77d:8c40:6046 with SMTP id c30-20020a05620a269e00b0077d8c406046mr4916805qkp.13.1701665445540;
        Sun, 03 Dec 2023 20:50:45 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1701665445; cv=none;
        d=google.com; s=arc-20160816;
        b=R+LVp3hkQ1Ms55hQspka1QbG/BxQVdSvilDONDmAaDPakbYTeE+5Mx9w5ppop0bOyH
         BMhGFPW+MSn7Iuq97KepPSP22OMwXRFSCfl5vXEX6wReIKfFK/q7oXxspgrT/DeKxRkA
         uz0t+ytiFE5N7oBfHjgyRQ43eg80OFNu3V07+FiDTfmtjscvWgnLVaU5SMaHxL8kGPWp
         dNuH1WEG4UvyX5efS9tNypRJTYyoM9m20RMJAn/hoHsP6+XHt0XxW7mMFhAPlu4VZ17e
         RcOy0h06J1WJ1NDRmtR0yNonZZe5nEj0mym0QX5wKQlBLiRRODUXcSVMFxQwCGQGU76Z
         eHVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=AyvluW14Mtmaf6oC/lcJ7nSrxSnwRamKQj5ILYpIE6M=;
        fh=7ioxn6LWsCzgGR12WMVU/wASROmAygH/3PvRDFKIzPw=;
        b=Xy7qnzVR5XDF8UN+XvG5Gi+n8CoHrEB7uY9vjDyziPyg4SULjvj5BALwMzcT8W5QHu
         VZ/jT+Y3KcTixCysIvt+KxdHqehxDQgFidfgt170x/oOSljEyzOxWXkyiMNadQP7BMpt
         vTRPbk/HNzivrjyb9sBxviPmAZ2fKJGVYpL7H4YFXoyzDt9tHxQlFVpRpZwZwFwOKjuP
         1kigDyULlXQ0uOFPW+Clw6nvvgTkJjvFCbGlStWSxOxs0RxS3TWEh6DEtvJaug/w7Eqy
         xjAjYxQzOkahhDhiuthesEokyTBF0iFGtIFxcOEg0CSpKiqUoW9ylxlTMiidlxuW3867
         FRxg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=GZDgpgZl;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u39-20020a05622a19a700b00423d64d4491si9296382qtc.71.2023.12.03.20.50.45
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 03 Dec 2023 20:50:45 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=GZDgpgZl;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1rA0uZ-0000z4-U3; Sun, 03 Dec 2023 23:50:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1rA0uW-0000xv-9O
 for qemu-devel@nongnu.org; Sun, 03 Dec 2023 23:50:24 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1rA0uU-0004I8-SS
 for qemu-devel@nongnu.org; Sun, 03 Dec 2023 23:50:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1701665422;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=AyvluW14Mtmaf6oC/lcJ7nSrxSnwRamKQj5ILYpIE6M=;
 b=GZDgpgZlPA1S917RZ0XDrogivoOEMoeIwQlkw2HWteaQH2zthktXxqQCRxrO77uHSUwE7f
 naeQW6nGC+/maRCEPbBOl9TiL3N4TpqtF4f60r38leuJkvyX38sngLis8Ya1tmWEfOQCYQ
 5Cab5fFQ5c+KUfU6WJ3QSsekmWjx1oQ=
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com
 [209.85.214.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-322-ipaL-tnsO0mcvayoiCK3Cg-1; Sun, 03 Dec 2023 23:50:20 -0500
X-MC-Unique: ipaL-tnsO0mcvayoiCK3Cg-1
Received: by mail-pl1-f197.google.com with SMTP id
 d9443c01a7336-1d0544c07c3so15718485ad.3
 for <qemu-devel@nongnu.org>; Sun, 03 Dec 2023 20:50:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701665419; x=1702270219;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=AyvluW14Mtmaf6oC/lcJ7nSrxSnwRamKQj5ILYpIE6M=;
 b=d0j+0xVWKX4SnsYe0WNoMeP1afYPWZqsoR1roWa9rUohHoyv7HW08VPM3FmF/FQ2QM
 k5nZAoir4MeMWHpGFneOB0PHQ2ObgnXvd1WHORa2Dk6sJEyjUQbhzRsw/IK7M4vg29BQ
 GwS8t8duybjXnJAPXOY4moCJ5/8JpZqp8dO9c+fRbV+74SadMEaEbJ6RVWv5w7nPi6GW
 eyPD0STyz78D30Xqso16LOJ21aLGj1uTeIQU14khrsfKZRL9VDFreCdz3HcAvsKB5ydi
 cyU8lvV4gEtUwxp/cYzfUBh32++/KMnFmJarlhLH9rdd3BgvDZnqa7rsfFtQ/R6/6qiD
 M89Q==
X-Gm-Message-State: AOJu0YzKYOYHlG3B7SVFMQ17QTg7AJOuUg6LH/chBfAoJFfCh/HWZguA
 ZeDN6YOHh9Nf+bcdOsK0HavEsIju8QoUYL7hrooIubnrTAEGBO5PW8b7JWw93ntD4ZZepzMUeXY
 zcXtxSOnYbPrBG0k=
X-Received: by 2002:a17:902:bd01:b0:1d0:b1f0:fdb with SMTP id
 p1-20020a170902bd0100b001d0b1f00fdbmr187939pls.46.1701665419263; 
 Sun, 03 Dec 2023 20:50:19 -0800 (PST)
X-Received: by 2002:a17:902:bd01:b0:1d0:b1f0:fdb with SMTP id
 p1-20020a170902bd0100b001d0b1f00fdbmr187929pls.46.1701665418973; 
 Sun, 03 Dec 2023 20:50:18 -0800 (PST)
Received: from [192.168.68.51] ([43.252.115.3])
 by smtp.gmail.com with ESMTPSA id
 h21-20020a170902f7d500b001d058ad8770sm5298193plw.306.2023.12.03.20.50.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 03 Dec 2023 20:50:18 -0800 (PST)
Message-ID: <a0bfc0e0-9c77-4176-960d-fae3609dff5c@redhat.com>
Date: Mon, 4 Dec 2023 14:50:13 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH-for-9.0 09/25] memory: Simplify
 memory_region_init_rom_device_nomigrate() calls
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: David Hildenbrand <david@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, "Michael S. Tsirkin"
 <mst@redhat.com>, qemu-arm@nongnu.org,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Markus Armbruster <armbru@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>, qemu-ppc@nongnu.org,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>,
 Peter Xu <peterx@redhat.com>
References: <20231120213301.24349-1-philmd@linaro.org>
 <20231120213301.24349-10-philmd@linaro.org>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20231120213301.24349-10-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=gshan@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -5
X-Spam_score: -0.6
X-Spam_bar: /
X-Spam_report: (-0.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 RCVD_IN_SORBS_WEB=1.5, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
X-TUID: qpz9Lt3rbmDR

On 11/21/23 07:32, Philippe Mathieu-Daudé wrote:
> Mechanical change using the following coccinelle script:
> 
> @@
> expression mr, owner, arg3, arg4, arg5, arg6, errp;
> @@
> -   memory_region_init_rom_device_nomigrate(mr, owner, arg3, arg4, arg5, arg6, &errp);
>      if (
> -       errp
> +       !memory_region_init_rom_device_nomigrate(mr, owner, arg3, arg4, arg5, arg6, &errp)
>      ) {
>          ...
>          return;
>      }
> 
> and removing the local Error variable.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   system/memory.c | 7 ++-----
>   1 file changed, 2 insertions(+), 5 deletions(-)
> 

Reviewed-by: Gavin Shan <gshan@redhat.com>

