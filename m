Received: by 2002:a17:505:917:b0:1be9:327d:8ee3 with SMTP id hq23csp588407njb;
        Thu, 22 Aug 2024 04:14:30 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVTPgTVlaFpDuux82tF+9APPTHIOAys3cfMWi+okuGE0XDwOiMvhlxEJObKjnQa+xyzlpbuUCibqfwcuA==@linaro.org
X-Google-Smtp-Source: AGHT+IEXAlJwRxswUGWwmET4IsTK1+En2LnELpcMofG5LA2FmrFttawXjzlKfpCETP847bVjEP8T
X-Received: by 2002:a05:620a:390c:b0:79f:1776:356b with SMTP id af79cd13be357-7a680a29df8mr166019085a.8.1724325270307;
        Thu, 22 Aug 2024 04:14:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1724325270; cv=none;
        d=google.com; s=arc-20160816;
        b=F9BdHm3v41v0hPW0vtrzKd6zBnBkk7qNtpEAN4tMkyhuR89wynb/4NxI4RCfHty3yV
         Dd93WFsN0n42NGQ00SZCyfuCySoiCMqzCLNChGM2xnQBUx2DYlUUIGOxn7RWFHCD+JS4
         5z116Oy1plsNYUVCRpHgG5hw/bw59uWIwfaqBolZY13oBTPzzSk7lUeBj0vhm+1r5l8w
         Luc/8M8Ri7ABXEZvA3AaSOZTqBgYUM7FkSKvytSksBZTgUnX+8J0xxX09QX4D+JuXx64
         izgprPedIsR4fpNB8JSOtCe+gUGVTDfBAmeOKbO14B0ZKiTCoEIw3y06K0KemJzo1P/v
         w6dA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:autocrypt:from:references:cc:to
         :subject:user-agent:mime-version:date:message-id:dkim-signature;
        bh=MoN4D9jCk7hGAVT3ex/lfXJ9CiJxvSpgAs5H2oc8Cos=;
        fh=7MSr54X685GGLufGCdYgXzFACKoxc0TOKq0YNhOnmG0=;
        b=obpfRBXLvX4joydJFSVp0xQSyGmgzhiKpBBOOMGgtOdwZtmJycJjTZOwYVAqjQk7dG
         sKf0C2XZYpCHXLyMvLB9juhuqtyMZtqhwSx3ZidSistjOdZEftpHwTUyBv/5+CCfEYOk
         RliW5Js3WL/CL9UFHHS1dtRIAJerP9VzsqFJuWG/ESbtAh6KU7gwPvMCekJLbf6osU8M
         mclfjwCXnFSzE34PD+v9YWFbEuYhMT6kq+4cNREE6Zoc9fZmGAyoqtCzcnH2HnGmLgsz
         +yk7KTrl0BOoLzGPWBOzy5K2Bvw6VE4BU+xDSGfFqlJwfYRLIgscAJxP045AGMjY3QBL
         axkg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=S4PjhYCq;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7a67f40df71si131369985a.507.2024.08.22.04.14.30
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 22 Aug 2024 04:14:30 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=S4PjhYCq;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sh5la-0001Au-HY; Thu, 22 Aug 2024 07:14:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1sh5lY-00019v-81
 for qemu-arm@nongnu.org; Thu, 22 Aug 2024 07:14:08 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1sh5lW-0000Ff-3G
 for qemu-arm@nongnu.org; Thu, 22 Aug 2024 07:14:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1724325244;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=MoN4D9jCk7hGAVT3ex/lfXJ9CiJxvSpgAs5H2oc8Cos=;
 b=S4PjhYCqzyWTna68DbONWPuDlTQMs6LZrqANEUFBEsjLSZAXvdlFqcp0NfFYLXtYJj/24Q
 TDAZq73bGSuZ8Wa77zsTd2pHqjuyPIDStynG/S4BCJKE8RgCSk3nN0uUc/Z9C4O5iKBbSY
 oCDui3f7pH4KUK9oJBCJFMmqTIWnWYs=
Received: from mail-ot1-f71.google.com (mail-ot1-f71.google.com
 [209.85.210.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-49-WPH9NOn-M3GTaq5Y_GM99w-1; Thu, 22 Aug 2024 07:14:03 -0400
X-MC-Unique: WPH9NOn-M3GTaq5Y_GM99w-1
Received: by mail-ot1-f71.google.com with SMTP id
 46e09a7af769-709334cc7f1so904683a34.0
 for <qemu-arm@nongnu.org>; Thu, 22 Aug 2024 04:14:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724325242; x=1724930042;
 h=content-transfer-encoding:in-reply-to:autocrypt:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=MoN4D9jCk7hGAVT3ex/lfXJ9CiJxvSpgAs5H2oc8Cos=;
 b=vhxd3C4FKR7iibQMqOFFLa2QsuKS5cWLXUjtjz/71eLPLQCYE+/FlhY0xihsHD2Pr5
 47YVq6DrLomDXndhyENI5LZHxO5WzlWoElzfW7IzHDtSe4mszqMuN5HvOwTUx3VNzJOg
 qTzI9zntTWOm5qIaea28GG142Dod5F4HaKG069sYRCnJleip/Jsx4aRACw7Sb6XNgwYa
 SVea/W5AAyBZm3RxVj7+wfa7hylgM1eOqOTm1vZSchextONGQpwwMOKcizie602/9rSZ
 ELk3jiQN16wPREiMBss/7gMoh14F4arn01iiygfM/gakDsu/nxKuM6duR88fKmMu5mGX
 BtWw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVveUlswut3WNA3WpVoBLHuv1tWSLD9TybbrqqIYtNuNBjTKm97uZvqJM1udWvzUJtj1Knh5rqLCw==@nongnu.org
X-Gm-Message-State: AOJu0Yx2ib9ERyeVAFUYghv2+YsvP7PMMHtqFANK0BEm2YzJnCv14WxC
 fhL50cWCRkuFMxEu9DYfqfHz7X9gQMseFNPz2A6ulxYUxiefxIbKqZeKcjy9FGNJpmj7aA3Os5i
 11o51YlkTbYvNXyD3xM3yNKxBemjaoon3kP470xUW6zUkL3ZVkg==
X-Received: by 2002:a05:6830:71a6:b0:709:41c2:5104 with SMTP id
 46e09a7af769-70e046b9964mr1542666a34.8.1724325242469; 
 Thu, 22 Aug 2024 04:14:02 -0700 (PDT)
X-Received: by 2002:a05:6830:71a6:b0:709:41c2:5104 with SMTP id
 46e09a7af769-70e046b9964mr1542648a34.8.1724325242143; 
 Thu, 22 Aug 2024 04:14:02 -0700 (PDT)
Received: from [192.168.0.6] (ip-109-43-177-41.web.vodafone.de.
 [109.43.177.41]) by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-454fdfc16e0sm5604191cf.7.2024.08.22.04.14.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 22 Aug 2024 04:14:01 -0700 (PDT)
Message-ID: <3435b5e3-c469-4f6a-a535-e7ef1909a5c9@redhat.com>
Date: Thu, 22 Aug 2024 13:13:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] tests/functional: Convert ARM Integrator/CP avocado tests
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org
References: <20240822110238.82312-1-philmd@linaro.org>
From: Thomas Huth <thuth@redhat.com>
Autocrypt: addr=thuth@redhat.com; keydata=
 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
In-Reply-To: <20240822110238.82312-1-philmd@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.144,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: vAHOtingixxA

On 22/08/2024 13.02, Philippe Mathieu-Daudé wrote:
> Straight forward conversion. Update the SHA1 hashes to SHA256
> hashes since SHA1 should not be used anymore nowadays.
> 
>    $ QEMU_TEST_ALLOW_UNTRUSTED_CODE=1 make check-functional-arm
>    ...
>    6/6 qemu:func-thorough+func-arm-thorough+thorough / func-arm-arm_integratorcp   OK   3.90s   2 subtests passed
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
> Based-on: <20240821082748.65853-1-thuth@redhat.com>
> ---
>   MAINTAINERS                                   |  2 +-
>   tests/functional/meson.build                  |  1 +
>   .../test_arm_integratorcp.py}                 | 56 ++++++++++---------
>   3 files changed, 33 insertions(+), 26 deletions(-)
>   rename tests/{avocado/machine_arm_integratorcp.py => functional/test_arm_integratorcp.py} (63%)
>   mode change 100644 => 100755

Reviewed-by: Thomas Huth <thuth@redhat.com>

