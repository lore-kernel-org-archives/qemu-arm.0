Received: by 2002:a17:907:c68a:b0:84d:2074:29bb with SMTP id ue10csp933816ejc;
        Fri, 20 Jan 2023 01:00:25 -0800 (PST)
X-Google-Smtp-Source: AMrXdXtKAmb3L9B8F5aIxMKqDfj8NiRcJm20BinVmNaaxhq/x9LQ22WzF5fnSvjNYSHNgBZgPBVj
X-Received: by 2002:a05:6214:319f:b0:535:1fd6:d83e with SMTP id lb31-20020a056214319f00b005351fd6d83emr18272037qvb.16.1674205225716;
        Fri, 20 Jan 2023 01:00:25 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1674205225; cv=none;
        d=google.com; s=arc-20160816;
        b=X99J/xVchrNCovbD1jF6CvV6fQ/cRE9A6eK3G21uH5ZXRD10BMfxzWuXTvCSkIuOmf
         2LY8b1BrJkXaujB6MoSTouIn+vEeh6Jei6YRuYZY4f1/2eNyVOwbhAndx869kFPwziYV
         c+LXeg/SJlRqn82GWH9T6VrsvlrmSDIzQSOS8P+hdC/lQMmYLQ9nQkfn1aaQnwaPQOBC
         ba8a7QatPJ0h5Ll8viUQD9uXy1cn06NvdGc1GWv517TAe7umnP7V1eXoSM7CWWN2fma+
         A6Bn8TB5gNibl6do2PgvHs2HQqEQHCN6qpmU9Kwjc7H1/WKwwM/rq6zIEm7v+asoRwp4
         dy9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=qakjVd27pCWMfxKREO/DwNWWRN9q594Ck2VyJC6l+CU=;
        b=0fOtmGoSaOsCcRdF3tYyDysL6u9cS+k3D0eUkRZ21F0O5bZwod/2FsN5NADwpMGvew
         eepqt6fCwKmbIx7dVsPz7RkYz+aPNGWinYACn4aajUNrNUVPN5xYQm5P9QWJ1rRQB3H1
         LbklRyE+OHQ9EaExgLlXyiZuL0I2ZBVs3gkET12+YBNnL7pE1cKc6gxU+m34+aD08T47
         z7abyRdH6Nea366Ii3RQ+2UZK1UX1UScFvtJOLmo157CgcH50HFqXlQIoMZmLSM7c+ht
         ozyTaIdqsdsygFcFNeZXUi1/s19DFfjSxH8aC9pQyeXAC+fid+f9Emm8vaau1G4bcihj
         OOVg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=KneBWRW6;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y18-20020a05620a44d200b006fed6c43da4si1520136qkp.629.2023.01.20.01.00.25
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 20 Jan 2023 01:00:25 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=KneBWRW6;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pInFp-0006dw-Oq; Fri, 20 Jan 2023 04:00:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pInFn-0006dh-KY
 for qemu-arm@nongnu.org; Fri, 20 Jan 2023 04:00:07 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pInFm-0003mk-2O
 for qemu-arm@nongnu.org; Fri, 20 Jan 2023 04:00:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1674205204;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qakjVd27pCWMfxKREO/DwNWWRN9q594Ck2VyJC6l+CU=;
 b=KneBWRW61/v+k4gYgoQ8sMo2JT1+xw3O8KK5IyJRz5Hf816f8r4GtcXCZg6BSrmM9E8waK
 VF+JsipG9Zi/dXAfu5YMV9YPpVlsg42/VDIPef4mTpMuYgU5ZsveVd+gEI9h8JpCYhIn2d
 cNChfeToVse6ztRh6fOr5YC44oqZRog=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-257-h2RbOrU2OFem3uhLJ_z_wA-1; Fri, 20 Jan 2023 04:00:03 -0500
X-MC-Unique: h2RbOrU2OFem3uhLJ_z_wA-1
Received: by mail-qk1-f197.google.com with SMTP id
 az16-20020a05620a171000b00709129a745eso758107qkb.8
 for <qemu-arm@nongnu.org>; Fri, 20 Jan 2023 01:00:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=qakjVd27pCWMfxKREO/DwNWWRN9q594Ck2VyJC6l+CU=;
 b=c4QsT+rAy/xn20vHiG/ewwJC5G+/BmbsJDpg65f0QUx1gSfsmjMfZ6WrGOQ3cGRpUn
 zKlnhEV/kIdvME9+dGR2O62Jv90qzHVQzEJfsWKJkDw/ps9o1DVuGEiyzo+xDHTKq2KI
 Smksjqzabiy6qoPnWHJcrat7V9PdY2vIJuQZ3uYVPPFdwCdD09rUKtl91XuLDVc/F1Jz
 lYKX40IDkGOzIsdWPxvTcS45tUpggxzjQd9G3yWkC6KU0633VO5VNjwpcZ9S4o2ctcN9
 WlkwzhQEHUFQ9pX4yJ417V37okZY21OaPvLZr0qIVhMfiichqsbb3AizV1alpfmnWxcg
 H6eA==
X-Gm-Message-State: AFqh2kptx/Qxplw1wU2p3Epitb6AeMceUzLiQWYtqpfy9eORiXZMZhLG
 PMjFqYDCBLhiMnZ+UX/87oBwGsuFP54ofdKqBoNZM8txJ7zoGj1Rokn6YwbmvuVohazBtScVyfT
 VvIXK5+ObfyzX
X-Received: by 2002:a0c:fc03:0:b0:537:4b09:670f with SMTP id
 z3-20020a0cfc03000000b005374b09670fmr227281qvo.25.1674205203151; 
 Fri, 20 Jan 2023 01:00:03 -0800 (PST)
X-Received: by 2002:a0c:fc03:0:b0:537:4b09:670f with SMTP id
 z3-20020a0cfc03000000b005374b09670fmr227255qvo.25.1674205202913; 
 Fri, 20 Jan 2023 01:00:02 -0800 (PST)
Received: from [192.168.0.2] (ip-109-43-177-118.web.vodafone.de.
 [109.43.177.118]) by smtp.gmail.com with ESMTPSA id
 ew3-20020a05622a514300b003b440ab16fasm7747515qtb.61.2023.01.20.00.59.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 20 Jan 2023 01:00:01 -0800 (PST)
Message-ID: <4b5fbb1a-204b-15a0-8cc1-71c899b9760a@redhat.com>
Date: Fri, 20 Jan 2023 09:59:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH v2 03/11] tests/qtest/boot-serial-test: Build command line
 using GString API
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Juan Quintela <quintela@redhat.com>, Laurent Vivier <lvivier@redhat.com>, 
 Paolo Bonzini <pbonzini@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, qemu-arm@nongnu.org,
 Fabiano Rosas <farosas@suse.de>
References: <20230119145838.41835-1-philmd@linaro.org>
 <20230119145838.41835-4-philmd@linaro.org>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20230119145838.41835-4-philmd@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: 11
X-Spam_score: 1.1
X-Spam_bar: +
X-Spam_report: (1.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.094, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 RCVD_IN_SBL_CSS=3.335, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
X-TUID: m5q1ucGAtkeU

On 19/01/2023 15.58, Philippe Mathieu-Daudé wrote:
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   tests/qtest/boot-serial-test.c | 23 +++++++++++++++--------
>   1 file changed, 15 insertions(+), 8 deletions(-)
> 
> diff --git a/tests/qtest/boot-serial-test.c b/tests/qtest/boot-serial-test.c
> index 3a854b0174..92890b409d 100644
> --- a/tests/qtest/boot-serial-test.c
> +++ b/tests/qtest/boot-serial-test.c
> @@ -226,14 +226,17 @@ static void test_machine(const void *data)
>       const testdef_t *test = data;
>       g_autofree char *serialtmp = NULL;
>       g_autofree char *codetmp = NULL;
> -    const char *codeparam = "";
>       QTestState *qts;
>       int ser_fd;
> +    g_autoptr(GString) cmd = g_string_new("");

You could already start with the "-no-shutdown" here.

>       ser_fd = g_file_open_tmp("qtest-boot-serial-sXXXXXX", &serialtmp, NULL);
>       g_assert(ser_fd != -1);
>       close(ser_fd);
>   
> +    g_string_append_printf(cmd, "-M %s ", test->machine);
> +    g_string_append(cmd, "-no-shutdown ");
> +
>       if (test->kernel || test->bios) {
>           ssize_t wlen;
>           int code_fd;
> @@ -243,19 +246,23 @@ static void test_machine(const void *data)
>           wlen = write(code_fd, test->kernel ? : test->bios, test->codesize);
>           g_assert(wlen == test->codesize);
>           close(code_fd);
> +        g_string_append_printf(cmd, "%s %s ",
> +                               test->kernel ? "-kernel " : "-bios ", codetmp);
>       }
>   
> +    g_string_append_printf(cmd, "-chardev file,id=serial0,path=%s "
> +                                "-serial chardev:serial0 ", serialtmp);

Why not include this in the initial g_string_append_printf statement already?

>       /*
>        * Make sure that this test uses tcg if available: It is used as a
>        * fast-enough smoketest for that.
>        */
> -    qts = qtest_initf("%s %s %s -M %s -no-shutdown "
> -                      "-chardev file,id=serial0,path=%s "
> -                      "-serial chardev:serial0 -accel tcg -accel kvm %s",
> -                      codeparam,
> -                      test->kernel ? "-kernel " : test->bios ? "-bios " : "",
> -                      codetmp ? : "", test->machine,
> -                      serialtmp, test->extra);
> +    g_string_append(cmd, "-accel tcg ");
> +    g_string_append(cmd, "-accel kvm ");
> +    g_string_append(cmd, test->extra);
> +
> +    qts = qtest_init(cmd->str);

... and I have to say that this is already quite a lot of code churn, just 
to get the -accel parameters tweaked in the end.

Why don't you simply do a single small patch that just replaces the "-accel 
tcg -accel" part with "%s %s" and add two parameters like this:

   has_tcg ? "-accel tcg" : "", has_kvm ? "-accel kvm" : ""

?

  Thomas

