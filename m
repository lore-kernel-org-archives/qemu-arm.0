Received: by 2002:a17:906:da85:b0:8b1:202f:4753 with SMTP id xh5csp5298ejb;
        Mon, 13 Feb 2023 00:03:46 -0800 (PST)
X-Google-Smtp-Source: AK7set9D2ezrFJO4nKKiApRbc36eo50y/L02HXr5k9asl0JWNJ/Bko6Z39qwjBW2jo+yjj/+wIP/
X-Received: by 2002:a05:6214:2408:b0:56e:9da4:82ff with SMTP id fv8-20020a056214240800b0056e9da482ffmr16022615qvb.50.1676275426282;
        Mon, 13 Feb 2023 00:03:46 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1676275426; cv=none;
        d=google.com; s=arc-20160816;
        b=zbKT7rB3aYgI+Kll7XizzKK1JtTpucgDwtr3T8phEjAElqvV2rd7TYze10qu4PNo/d
         KrwGRuZ2DgSkQydENzclAyajeSGaBrdZx878/Q7TUsPOOwmxDtshxHhD6ztECG7eNzhD
         +bAw4PaYyZf7tGuysRXstqXhNfAdK6aJAIWKq6IhDm2kiixPlysmmYeIEY8s6OoD4RHZ
         8mPmgw22SzuMpl9Rf5yibsLzCDcOOoDaHmKiUoKH0/pUAZNWewVyE0SINyK00A2QfDWn
         roIetGZriJvgTg1+vI2quVjbWdnlFa0/TvvOF0CtUknpL9qG0AXH3+6GxnXnVNP+/JOA
         ASzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=aSitCtNhmp5AtYUbGOXfqv/6Iaoyb77s5SuNMIJ2sXg=;
        b=YXvwLvjW+yb5IJiIPm8ZS88cw1e0jsPM/YLl0eNxg8YtaQtA5QupdzEZsotflSDdsR
         nAfqXGwn9B4t8MJhHH9IfejQ2Ldy5zrtrwahz21/fkJUdksTjc/h1n1vAcVKVOv8woyj
         shzxRAZR4uV2RBhGBioFPyKE3y0Jum0u4jKMmm1D457VVZSMEM5Ufa1Wte8Te/9pksbo
         r1gx17KNf+6XYvxFRWHcMchx/9lQgu9+rHzeitvzK3ytUCs2Q2QQ4X4XuMdHApKteRpH
         wPYbB2uFIQ3ZTAHVUYt018fFNWAEG5rLDIvAmLS1SvKyeQOwIBnR1TkrlME3q1aNEo9t
         Azmg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=X5j9816A;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x27-20020a0cb21b000000b0053538910039si9464363qvd.316.2023.02.13.00.03.46
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 13 Feb 2023 00:03:46 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=X5j9816A;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pRTo0-00012N-WB; Mon, 13 Feb 2023 03:03:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pRTny-00011k-DS
 for qemu-arm@nongnu.org; Mon, 13 Feb 2023 03:03:19 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pRTnv-0000la-Q3
 for qemu-arm@nongnu.org; Mon, 13 Feb 2023 03:03:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676275394;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=aSitCtNhmp5AtYUbGOXfqv/6Iaoyb77s5SuNMIJ2sXg=;
 b=X5j9816AItHvCl0PkzFBXbegKbJai1COkVKOymmP21gahaYKZDah/cDcs56OxHMU2d0kzz
 5x48wJouml7qKdCeBdxWqInwyTEK+fUtGSpLF1h5zH3gjjb3U1W6iX/8OlGs9n1riIjzec
 B/d452xtdLuFFNHsmALDNA4Ixh4lLcU=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-531-l5dIBS3wN3K1WTIFkSb36Q-1; Mon, 13 Feb 2023 03:03:11 -0500
X-MC-Unique: l5dIBS3wN3K1WTIFkSb36Q-1
Received: by mail-qk1-f198.google.com with SMTP id
 x12-20020a05620a258c00b007051ae500a2so7018894qko.15
 for <qemu-arm@nongnu.org>; Mon, 13 Feb 2023 00:03:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=aSitCtNhmp5AtYUbGOXfqv/6Iaoyb77s5SuNMIJ2sXg=;
 b=PEG55mvYSn3dhsaFyAixwrbSnAoapp1ZpGPsMRzmOQ9s3QIu0+x6SkJHWZ2wlmRgi5
 jD0hEX9wYHpRjhvGMh44TjcV+ud6rZOiTjKZ3ETdFHe7Sn02M28HK7zgNXNcV0USZanc
 5VqNRncVmH4Ly/exGJzOLtSF/CV0SR+p8gqviNCuFzbuRBdTNZgl5EBD71GrG+hrHunD
 BH/AJu+JEKvQF0AjLBr4y3hzHCvhK4V4DQXJMAvq/IhAYhzrebpWO4c/uugd7saQLQc7
 VePayrGdmvJUqVG2VTjJs0e37wC1ZH/FyDL5zHoKbSQrV9KGzpC/8T0wnPOn1hZ/VM1J
 aCFQ==
X-Gm-Message-State: AO0yUKVG5uSqDIHhKM5zRdxSuKKC0zgCuplU7OM97tPtbTSz/6jEWZgr
 Cg4KCSj4shvhO+Js6aJJ9JhDzktl6S3UW+P9JpeM+dURDv4ypjDrhF0rwMpd/xssCH8jwtcAl9C
 qXvcLHyPD39Iz
X-Received: by 2002:a05:6214:765:b0:56c:20e1:2669 with SMTP id
 f5-20020a056214076500b0056c20e12669mr27027905qvz.42.1676275390703; 
 Mon, 13 Feb 2023 00:03:10 -0800 (PST)
X-Received: by 2002:a05:6214:765:b0:56c:20e1:2669 with SMTP id
 f5-20020a056214076500b0056c20e12669mr27027881qvz.42.1676275390477; 
 Mon, 13 Feb 2023 00:03:10 -0800 (PST)
Received: from [192.168.0.2] (ip-109-43-177-185.web.vodafone.de.
 [109.43.177.185]) by smtp.gmail.com with ESMTPSA id
 69-20020a370a48000000b0071b158849e5sm9330793qkk.46.2023.02.13.00.03.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 13 Feb 2023 00:03:09 -0800 (PST)
Message-ID: <6e4c4982-4865-8237-0dd1-a187d0ab757a@redhat.com>
Date: Mon, 13 Feb 2023 09:03:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH 1/4] tests: use closesocket()
To: marcandre.lureau@redhat.com, qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, Stefan Weil <sw@weilnetz.de>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Joel Stanley <joel@jms.id.au>,
 Laurent Vivier <lvivier@redhat.com>, Jason Wang <jasowang@redhat.com>,
 qemu-arm@nongnu.org, Stefan Berger <stefanb@linux.vnet.ibm.com>
References: <20230212204942.1905959-1-marcandre.lureau@redhat.com>
 <20230212204942.1905959-2-marcandre.lureau@redhat.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20230212204942.1905959-2-marcandre.lureau@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.348, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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
X-TUID: uhnsgB5hMSgL

On 12/02/2023 21.49, marcandre.lureau@redhat.com wrote:
> From: Marc-André Lureau <marcandre.lureau@redhat.com>
> 
> Because they are actually sockets...
> 
> Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
> ---
>   tests/unit/socket-helpers.c | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/tests/unit/socket-helpers.c b/tests/unit/socket-helpers.c
> index eecadf3a3c..914b3aa0cf 100644
> --- a/tests/unit/socket-helpers.c
> +++ b/tests/unit/socket-helpers.c
> @@ -117,13 +117,13 @@ static int socket_can_bind_connect(const char *hostname, int family)
>   
>    cleanup:
>       if (afd != -1) {
> -        close(afd);
> +        closesocket(afd);
>       }
>       if (cfd != -1) {
> -        close(cfd);
> +        closesocket(cfd);
>       }
>       if (lfd != -1) {
> -        close(lfd);
> +        closesocket(lfd);
>       }
>       if (res) {
>           freeaddrinfo(res);

Reviewed-by: Thomas Huth <thuth@redhat.com>

