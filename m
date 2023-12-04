Received: by 2002:a17:906:3657:b0:a0d:e0d9:b5bf with SMTP id r23csp2475062ejb;
        Sun, 3 Dec 2023 21:07:38 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG4IgDF0CWpMAcnufyYc5e99swM89tWvGT3BM/b5zqRB3Qcv1Ib9kftE0yJk4SO+yhaXGid
X-Received: by 2002:a05:620a:1189:b0:77f:28e:17c0 with SMTP id b9-20020a05620a118900b0077f028e17c0mr3280776qkk.98.1701666458620;
        Sun, 03 Dec 2023 21:07:38 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1701666458; cv=none;
        d=google.com; s=arc-20160816;
        b=uRZ7EXJA/3bAXhdEaJeFY6SvQ0j40FPIGc0TT4zB3gbMEYZ9iJK0XsF07C3y4/xJPg
         RtdCleadw3ZQUFWv4/2an1Nd/0/ITtFW/gGSXAppY887Hu0yIkdFkYyPcRS2Tvvp/q5W
         ogXL5HmJoFGjejTacGUg4qkIXb+IqSA4H+D5ypYiRGRYROanGq5uzZRGFUtwbxZ6JNXS
         Pbe87OuyIXZ2SxZ1iiYGYlwYZeHuh2WqJoK/mJiLkj5OCdSXl+hRMhxyW3Rs6+Y7dE0h
         EfApELFS+MN7EDstO1/E5Kh0trbjEvJmT1jSPxYyLifoK7VqCMCK+fhWTFpvr0BdpIdG
         9W9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=WGnIUK3zSJXAxMdd7aMNLjAWeg7/5KSLFErHzAl47Us=;
        fh=wNVsHX33rtlNsfcIRu7HE2C+HLDFGyJ8WHvp6XTm43k=;
        b=t/1A2gqIMDv5g6rIlMHx8gDYsL30i31jATZwRqWDKqnI6cqpKMe8lxX7zBPeFv06S3
         iWnt7+dmh+52hcM61/yAvENnAO5Wbq9o7NLpzFildepKI761HOC8Ha6l0BYuhotF1dTM
         kW1Cr8GmA2OLQsv6QoK98QLH4fPlYL85/sqwqOU7/P3KZNC+uVyvg4jtfJnAe94lWMOJ
         7TsCLaM/GEaR480nuKCeQQ8tfHAN5I6pos7hGJEdFudAaodVehH/+B+B3k5gIIIxtBFy
         XtgSdPCHyej3Em2TOYg5PMma1m30Ram4LI4bR2lbdtb3TAB9p3hjwZ6k2Lyq+EdPJzOT
         +X0g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=BJmMAWh3;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y19-20020a05620a44d300b00779df1bedbdsi9350751qkp.310.2023.12.03.21.07.38
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 03 Dec 2023 21:07:38 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=BJmMAWh3;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rA1Ak-0006AS-Jo; Mon, 04 Dec 2023 00:07:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1rA17F-000479-1k
 for qemu-arm@nongnu.org; Mon, 04 Dec 2023 00:03:33 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1rA170-0001lR-8V
 for qemu-arm@nongnu.org; Mon, 04 Dec 2023 00:03:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1701666197;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=WGnIUK3zSJXAxMdd7aMNLjAWeg7/5KSLFErHzAl47Us=;
 b=BJmMAWh3vEpKa8YUuW7KyY/IiKPY9dY8tP5eY4rDBSH7NWzz3YE2SjZJCtZRHO9APRj3yB
 pBo3mbxTJYIirYLNy45s1v9gmgFq6XiQYCF6jIgHi4zztAIN59hfNnX7oLGZwECKM3OxVy
 ql73BiyWkilFklrxHugccxaF78Emebs=
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com
 [209.85.214.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-349-fZqt331PMFyYEStMhzqNxQ-1; Mon, 04 Dec 2023 00:03:13 -0500
X-MC-Unique: fZqt331PMFyYEStMhzqNxQ-1
Received: by mail-pl1-f197.google.com with SMTP id
 d9443c01a7336-1d053282390so13538865ad.2
 for <qemu-arm@nongnu.org>; Sun, 03 Dec 2023 21:03:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701666193; x=1702270993;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=WGnIUK3zSJXAxMdd7aMNLjAWeg7/5KSLFErHzAl47Us=;
 b=eCIB+RUJ3DJdCw7ISSMg5e1KsFNu64THN7NybWp3BbHvtJxwImuxVczfE9LrcKlXZ+
 VVDIcPBQCzQpa39EaqpGT4gfAR2AVXytxtCQDyNxrxKCQZqI/PWqgJ3Kr6CMhaTkAG4o
 CE7XmMoB864D4UqSTNRlASctmey4Nf1I6wfX0wE53UpsZfglZnjULgcGyC1y9VKpsq0J
 HTZ9g1WAacNsi3rcf8UNO0rkY/CK6ABCrB4rTj8cQGSuNLRZD4YwDEfOV5mrOw0a0kKG
 kTKtuKtTUc5+G/T1r5TYTTREbfhZqRV+k6VqNwZFveJXktcfly7IpOatAWv/IWeTr6Wj
 4yaA==
X-Gm-Message-State: AOJu0YyX0VasgcAbZz5VBKy4hWfdXuMIWIYBYk1zshdS+C79If8PzfLr
 QgU0tw8oWA8VghlP8Dfp6fbPZ8wX55lUErryQMPdud0ZlBCLYIvFzIn9cp3qRQ0sxoZDeUpm1yX
 JO0YGCveZf0Uz
X-Received: by 2002:a17:902:9048:b0:1d0:6ffd:f223 with SMTP id
 w8-20020a170902904800b001d06ffdf223mr917891plz.121.1701666192984; 
 Sun, 03 Dec 2023 21:03:12 -0800 (PST)
X-Received: by 2002:a17:902:9048:b0:1d0:6ffd:f223 with SMTP id
 w8-20020a170902904800b001d06ffdf223mr917887plz.121.1701666192677; 
 Sun, 03 Dec 2023 21:03:12 -0800 (PST)
Received: from [192.168.68.51] ([43.252.115.3])
 by smtp.gmail.com with ESMTPSA id
 h21-20020a170902f7d500b001d058ad8770sm5298193plw.306.2023.12.03.21.03.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 03 Dec 2023 21:03:12 -0800 (PST)
Message-ID: <d49e9d47-09e1-497f-9da9-11b0a181edd8@redhat.com>
Date: Mon, 4 Dec 2023 15:03:07 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH-for-9.0 24/25] hw/nvram: Simplify
 memory_region_init_rom_device() calls
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: David Hildenbrand <david@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, "Michael S. Tsirkin"
 <mst@redhat.com>, qemu-arm@nongnu.org,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Markus Armbruster <armbru@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>, qemu-ppc@nongnu.org,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>,
 Peter Xu <peterx@redhat.com>, Joel Stanley <joel@jms.id.au>
References: <20231120213301.24349-1-philmd@linaro.org>
 <20231120213301.24349-25-philmd@linaro.org>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20231120213301.24349-25-philmd@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=gshan@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: jqIW7Qc3xH5l

On 11/21/23 07:32, Philippe Mathieu-Daudé wrote:
> Mechanical change using the following coccinelle script:
> 
> @@
> expression mr, owner, arg3, arg4, arg5, arg6, errp;
> @@
> -   memory_region_init_rom_device(mr, owner, arg3, arg4, arg5, arg6, &errp);
>      if (
> -       errp
> +       !memory_region_init_rom_device(mr, owner, arg3, arg4, arg5, arg6, &errp)
>      ) {
>          ...
>          return;
>      }
> 
> and removing the local Error variable.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   hw/nvram/nrf51_nvm.c | 7 ++-----
>   1 file changed, 2 insertions(+), 5 deletions(-)
> 
Reviewed-by: Gavin Shan <gshan@redhat.com>

