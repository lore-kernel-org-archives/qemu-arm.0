Received: by 2002:a17:907:8744:b0:9bd:85f7:2662 with SMTP id qo4csp1286007ejc;
        Thu, 12 Oct 2023 22:57:04 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGBjrHRgLArBHY7Nk+LumHtmJVW+35UCuFAJLyb1KMX3c5jA0k6Li8qdzO+c167vqzXoRrD
X-Received: by 2002:a05:620a:244b:b0:774:2113:743a with SMTP id h11-20020a05620a244b00b007742113743amr32517243qkn.19.1697176624447;
        Thu, 12 Oct 2023 22:57:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1697176624; cv=none;
        d=google.com; s=arc-20160816;
        b=uNDq97RaEUStJw4IMzlFXupgjVuNmuVgnZj8PxHsXhSN2HmrEP/mkR1+m5h2mrssw+
         C4TmYOYfTxBzf7kFA8gfLSRnu6PKe3YDbBMK2RKGF26rB+/HqtwKbc6T1vzyJRH1ONMu
         GRhLIdyGsUEc9GOyBSy64SHoxIQUZC2FKanNt/J/oI9vHh9puQIMzJurvHBPPpBsP7bg
         smsNjI+yj0j5Y/+5pBNZ2s+EWYo0SqZiGjmp9R0F1ogDm+S28qH4Mm6RE7q/x/lz3RAy
         GFpI79SmfY7rrVMoK6EB3mYYlK9o+4sAaa5qDPa2Mgg9T/71kEhXyp2p+lJQZCVrCQ75
         RyAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:autocrypt:from:references:cc:to
         :subject:user-agent:mime-version:date:message-id:dkim-signature;
        bh=VGTGO0kZLu44/JCec7M1A/HLbsedHb1MG+2UMAuKgJU=;
        fh=gGZ8KC2O7OgwRBDPiLtlNf/Vfu8laUlcFY/sAMdpb+8=;
        b=JMUR2bhjMrWtPe5CuJkl6hSa7POhbpHVM6P26lqpBDW2lRdOnlcFqfq68ahy++89wE
         zA7nqX8/qWkxM2ovnYmVaG/AnwCdhdlix4srxEBnt+Rfyl1TcD4OlAmfthP/92avqFSD
         6HxDM99WCjjiwQmVlVU7i7T8/Vp0uMQoYHHwXMurhJPxQxWN5p/HBUZO5ZYhZJlQtyUe
         tVOSsoJcKXDkotE3cxSl4pFTt01128Aaw+YH9sfdAMsmaGJzI8r8Syaj661l9neVBehT
         8cAK6W9oCttzfEclJWZAHHQAJU6tjlK/CXJliqaBXp3kC7ARnEgY5JVKdrQ/YMtHcSa4
         m4MA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=KjArJl4R;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id qj19-20020a05620a881300b007742b023d3esi708807qkn.99.2023.10.12.22.57.04
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 12 Oct 2023 22:57:04 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=KjArJl4R;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qrBAE-0003Ar-43; Fri, 13 Oct 2023 01:56:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1qrBAC-0003AS-Qy
 for qemu-arm@nongnu.org; Fri, 13 Oct 2023 01:56:44 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1qrBAA-0007RC-4B
 for qemu-arm@nongnu.org; Fri, 13 Oct 2023 01:56:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1697176601;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=VGTGO0kZLu44/JCec7M1A/HLbsedHb1MG+2UMAuKgJU=;
 b=KjArJl4Rn41rhfElSC5fh9mcoUCRnHhDfxOnpxxt52tArrSwKAENVF66TPv+ofWezpsFOF
 YMXk07RAxXDpvh7l13djNbSNnEdQu50HkBdBYzLp5HA5ntfrgOYOn2fLvvfijd/4I0ho/Y
 +xSrd4JR8xLfu+MheEZFa6MjD1+Orwk=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-661-IW_lSWj0N5ekBsegRKWeNw-1; Fri, 13 Oct 2023 01:56:39 -0400
X-MC-Unique: IW_lSWj0N5ekBsegRKWeNw-1
Received: by mail-ed1-f71.google.com with SMTP id
 4fb4d7f45d1cf-5362b33e8ffso1310536a12.3
 for <qemu-arm@nongnu.org>; Thu, 12 Oct 2023 22:56:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697176598; x=1697781398;
 h=content-transfer-encoding:in-reply-to:autocrypt:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=VGTGO0kZLu44/JCec7M1A/HLbsedHb1MG+2UMAuKgJU=;
 b=SBng5dud5dVNX3NvIpXHzl8vXwMgUgtQjo6PzlSX3tHc+X7Sbte/65A13vXoJF9aag
 gcTdKXtd/ryL60gJlBbl8OD6j1fh8L5aN/EV0dHNlEISjTfqVSSDmAR0tmaHtpJ1dz9B
 V+0W+K/LQaFruMRPz/HdLUXAkKZ4voctrtX0jLLveVdZC42sfJfEZH7ySrp6H9PD3tEv
 48OUSzWgagXdZA6siuu7eHMznwZ79IBoA/QEHBoC9Zs3EtkkJw4d7GRil6vnC/T+jP/0
 BORw8gknOSeT5IDxoXQpCN8B7Zf59TuSzN5xcU8hU6CSRYi1w69vEltQ/Yicgya5NsJN
 6+QA==
X-Gm-Message-State: AOJu0YzsVc2hvZRHIOSxeud49bcG1NSZJC+KsPyEtksbqG22JwFf+kVQ
 uhLcfmOrHhVPM83mFhCCfm70qCyKFgywpDmjfAUqTdGhbeehTJaX3ydRr9rOovSwqS1EUsWPOb5
 0QaaYEQABZRil
X-Received: by 2002:a05:6402:26cc:b0:53e:34c5:fc14 with SMTP id
 x12-20020a05640226cc00b0053e34c5fc14mr1112875edd.23.1697176598119; 
 Thu, 12 Oct 2023 22:56:38 -0700 (PDT)
X-Received: by 2002:a05:6402:26cc:b0:53e:34c5:fc14 with SMTP id
 x12-20020a05640226cc00b0053e34c5fc14mr1112853edd.23.1697176597701; 
 Thu, 12 Oct 2023 22:56:37 -0700 (PDT)
Received: from [192.168.0.5] (ip-109-43-176-176.web.vodafone.de.
 [109.43.176.176]) by smtp.gmail.com with ESMTPSA id
 bm15-20020a0564020b0f00b005346925a474sm11029123edb.43.2023.10.12.22.56.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 12 Oct 2023 22:56:37 -0700 (PDT)
Message-ID: <feda1abb-b74a-4c47-8b6d-b83e87cd805e@redhat.com>
Date: Fri, 13 Oct 2023 07:56:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 01/10] system/qtest: Clean up global variable shadowing in
 qtest_server_init()
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Alberto Garcia <berto@igalia.com>,
 Hao Wu <wuhaotsh@google.com>, Kevin Wolf <kwolf@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-block@nongnu.org, John Snow <jsnow@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Fam Zheng <fam@euphon.net>,
 Tyrone Ting <kfting@nuvoton.com>, Markus Armbruster <armbru@redhat.com>
References: <20231009100251.56019-1-philmd@linaro.org>
 <20231009100251.56019-2-philmd@linaro.org>
From: Thomas Huth <thuth@redhat.com>
Autocrypt: addr=thuth@redhat.com; keydata=
 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
In-Reply-To: <20231009100251.56019-2-philmd@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
X-TUID: ItNVF3062X0L

On 09/10/2023 12.02, Philippe Mathieu-Daudé wrote:
> Rename the variable to fix:
> 
>    softmmu/qtest.c:869:13: error: declaration shadows a variable in the global scope [-Werror,-Wshadow]
>        Object *qtest;
>                ^
>    softmmu/qtest.c:53:15: note: previous declaration is here
>    static QTest *qtest;
>                  ^
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   softmmu/qtest.c | 16 ++++++++--------
>   1 file changed, 8 insertions(+), 8 deletions(-)
> 
> diff --git a/softmmu/qtest.c b/softmmu/qtest.c
> index 35b643a274..7964f0b248 100644
> --- a/softmmu/qtest.c
> +++ b/softmmu/qtest.c
> @@ -866,7 +866,7 @@ void qtest_server_init(const char *qtest_chrdev, const char *qtest_log, Error **
>   {
>       ERRP_GUARD();
>       Chardev *chr;
> -    Object *qtest;
> +    Object *qobj;
>   
>       chr = qemu_chr_new("qtest", qtest_chrdev, NULL);
>       if (chr == NULL) {
> @@ -875,18 +875,18 @@ void qtest_server_init(const char *qtest_chrdev, const char *qtest_log, Error **
>           return;
>       }
>   
> -    qtest = object_new(TYPE_QTEST);
> -    object_property_set_str(qtest, "chardev", chr->label, &error_abort);
> +    qobj = object_new(TYPE_QTEST);
> +    object_property_set_str(qobj, "chardev", chr->label, &error_abort);
>       if (qtest_log) {
> -        object_property_set_str(qtest, "log", qtest_log, &error_abort);
> +        object_property_set_str(qobj, "log", qtest_log, &error_abort);
>       }
> -    object_property_add_child(qdev_get_machine(), "qtest", qtest);
> -    user_creatable_complete(USER_CREATABLE(qtest), errp);
> +    object_property_add_child(qdev_get_machine(), "qtest", qobj);
> +    user_creatable_complete(USER_CREATABLE(qobj), errp);
>       if (*errp) {
> -        object_unparent(qtest);
> +        object_unparent(qobj);
>       }
>       object_unref(OBJECT(chr));
> -    object_unref(qtest);
> +    object_unref(qobj);
>   }

Reviewed-by: Thomas Huth <thuth@redhat.com>


