Received: by 2002:a17:907:c68a:b0:84d:2074:29bb with SMTP id ue10csp931733ejc;
        Fri, 20 Jan 2023 00:55:15 -0800 (PST)
X-Google-Smtp-Source: AMrXdXvo5qX95c2AZvcVnXt07WbZnLxLGVCucoCNExSrInIfG7z7Eg6hk9m/8XquczIrSXHdvaKY
X-Received: by 2002:a05:6214:501a:b0:4c7:4f64:cb3e with SMTP id jo26-20020a056214501a00b004c74f64cb3emr30515420qvb.11.1674204915382;
        Fri, 20 Jan 2023 00:55:15 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1674204915; cv=none;
        d=google.com; s=arc-20160816;
        b=aQLIxloyEz4F1kTt/YqRIINZkxqBNJQGEfHWXg9tP28x3g1IP+M4bUNXu2sDC2V2aX
         n1fEwXSHZaOfP3X2aErA4u+hN8ENXhNLvAH9PMjS7yxfQGESvApOlb4vMQCliqyz/XND
         GUulqZrlp5rHRSpIhWfFTBGb/7EfUGzEf5ZpR7EuRjI1uutpacRThbPOjJlEsqdZToV8
         Ka8Au40R86W5d5be0GBu20W4abDpmLWcGbKQofKqRXZXFHQCj++bCazgF6dfvr4M/U9O
         D0rfDg7vrmjTfVM+Z+KjoGud/T+GNoAKOZKd5R8MW3ZERQ4vjybLTWcMuYqF2TQjvwg8
         oxSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=/uvHHDaKHWJigG1GeKZODgcoUqjIuk/XpIQCCaxfM2g=;
        b=FcpzrkWcJjXbPpF31ErnUEljveyKCRLoTusXH0dYL2wnJ34YApIoBUqcUPgeqmPkDQ
         yAPkcm6YpQIYeYmB0MRpPAfyzG7h3jUtO/z/uKH83Nr7eahKIiTUs8iKCN2ZfFc7r36x
         uCA82weIKl3uRlJpTda5xXlI3xlH3cKO5pzlhAKoKQJIEZLOjySamvRDTjBEeIjyxxgj
         mkTXLw7PdAeWn0GGcbgQ0dfhOoFYErYHrBgYmd5XUEDtErxLGmBvXon3Y5Jlk4+Bp7si
         I9AiLU05xlktU7oGFKVej83UnFbe7kID009GlkeS60kskgkkQnCYQDLXd6RysRYTY4Q8
         nC2g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=WSP111eO;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id jq15-20020ad45fcf000000b00534ba012774si11229102qvb.217.2023.01.20.00.55.15
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 20 Jan 2023 00:55:15 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=WSP111eO;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pInAC-00026Q-5g; Fri, 20 Jan 2023 03:54:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pInA8-000266-BZ
 for qemu-arm@nongnu.org; Fri, 20 Jan 2023 03:54:16 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pInA6-0002eL-Ma
 for qemu-arm@nongnu.org; Fri, 20 Jan 2023 03:54:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1674204854;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/uvHHDaKHWJigG1GeKZODgcoUqjIuk/XpIQCCaxfM2g=;
 b=WSP111eOMLSY7aCy9lNAKYcLDGe9SnWt1J0KbwuAh0IDJgSUw2+O6db3LnukKByP7BmvK9
 1ESZoNmuWsfLMeW2HFIhmgCpbO6y2V4dIbFYhDlZJleTCetZFzPn7SqiJH6q1CjZM3oKBb
 LngrCORofEZyWdATvtSI2CDQaRtOtN0=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-90-5lXOu0VtN1Orp-wK-y8R_A-1; Fri, 20 Jan 2023 03:54:10 -0500
X-MC-Unique: 5lXOu0VtN1Orp-wK-y8R_A-1
Received: by mail-qv1-f72.google.com with SMTP id
 x6-20020a0cc506000000b005349c8b39d6so2211254qvi.2
 for <qemu-arm@nongnu.org>; Fri, 20 Jan 2023 00:54:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=/uvHHDaKHWJigG1GeKZODgcoUqjIuk/XpIQCCaxfM2g=;
 b=WmAVBzN9RHe8FjAoQIHndf2eDQAMSkldLRz9otJ8M3/dsPwjlOxKCIXnPF4hs2YuNy
 zaEqZOn545PjLz/2Bzha9apvr3VZscAWYMArLSOxACxQXcG7g5vAZkIMR8AlDBT0s0GL
 sE3kxp8vH4G4Gu3eNx9C1SX9rI4wWa/jZrOvcycrRf3nPqb/sa4i6osGkvG6Q4QOZBl6
 R/LHbp6dlEtjV3YhTpVA3mo80pK3BpQTlmKtV3qEa3mCCu+cBwLFUycz9pv1EVCzCXLp
 0E97h/McIhgcm1wvWwEL+nPxR+u4NuYHLUkjFs5D5/g2icqzIMRk7pNIvqwuAOHpp2aA
 TH9A==
X-Gm-Message-State: AFqh2kqe6edv8grGTgFYiZ2DtfC11iLsV6uvywou/uwF/m3e1qG4u8Vq
 iYT4uNZYXvE+ylQrJSMCpE/JwW5VvDM4QO7nDazHpSqfyABkC8o+U2wmDxK4Xq3D66a4SBhigly
 HrPzJ2wPKoQc2
X-Received: by 2002:a05:6214:57d1:b0:515:5e33:505b with SMTP id
 lw17-20020a05621457d100b005155e33505bmr20997451qvb.20.1674204850419; 
 Fri, 20 Jan 2023 00:54:10 -0800 (PST)
X-Received: by 2002:a05:6214:57d1:b0:515:5e33:505b with SMTP id
 lw17-20020a05621457d100b005155e33505bmr20997435qvb.20.1674204850144; 
 Fri, 20 Jan 2023 00:54:10 -0800 (PST)
Received: from [192.168.0.2] (ip-109-43-177-118.web.vodafone.de.
 [109.43.177.118]) by smtp.gmail.com with ESMTPSA id
 bn39-20020a05620a2ae700b00706bc44fda8sm4292790qkb.79.2023.01.20.00.54.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 20 Jan 2023 00:54:09 -0800 (PST)
Message-ID: <60ea4601-f342-b865-2ede-9cbcbbdd0230@redhat.com>
Date: Fri, 20 Jan 2023 09:54:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH v2 02/11] tests/qtest/boot-serial-test: Simplify
 test_machine() a bit
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Juan Quintela <quintela@redhat.com>, Laurent Vivier <lvivier@redhat.com>, 
 Paolo Bonzini <pbonzini@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, qemu-arm@nongnu.org,
 Fabiano Rosas <farosas@suse.de>
References: <20230119145838.41835-1-philmd@linaro.org>
 <20230119145838.41835-3-philmd@linaro.org>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20230119145838.41835-3-philmd@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
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
X-TUID: pUMrnfMARvJo

On 19/01/2023 15.58, Philippe Mathieu-Daudé wrote:
> Slighly modify test_machine() to simplify next commit review.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   tests/qtest/boot-serial-test.c | 21 +++++++--------------
>   1 file changed, 7 insertions(+), 14 deletions(-)
> 
> diff --git a/tests/qtest/boot-serial-test.c b/tests/qtest/boot-serial-test.c
> index 3aef3a97a9..3a854b0174 100644
> --- a/tests/qtest/boot-serial-test.c
> +++ b/tests/qtest/boot-serial-test.c
> @@ -227,7 +227,6 @@ static void test_machine(const void *data)
>       g_autofree char *serialtmp = NULL;
>       g_autofree char *codetmp = NULL;
>       const char *codeparam = "";
> -    const uint8_t *code = NULL;
>       QTestState *qts;
>       int ser_fd;
>   
> @@ -235,21 +234,13 @@ static void test_machine(const void *data)
>       g_assert(ser_fd != -1);
>       close(ser_fd);
>   
> -    if (test->kernel) {
> -        code = test->kernel;
> -        codeparam = "-kernel";
> -    } else if (test->bios) {
> -        code = test->bios;
> -        codeparam = "-bios";
> -    }
> -
> -    if (code) {
> +    if (test->kernel || test->bios) {
>           ssize_t wlen;
>           int code_fd;
>   
>           code_fd = g_file_open_tmp("qtest-boot-serial-cXXXXXX", &codetmp, NULL);
>           g_assert(code_fd != -1);
> -        wlen = write(code_fd, code, test->codesize);
> +        wlen = write(code_fd, test->kernel ? : test->bios, test->codesize);

Just a matter of taste, but I prefer the Elvis operator without space in 
between.

>           g_assert(wlen == test->codesize);
>           close(code_fd);
>       }
> @@ -258,12 +249,14 @@ static void test_machine(const void *data)
>        * Make sure that this test uses tcg if available: It is used as a
>        * fast-enough smoketest for that.
>        */
> -    qts = qtest_initf("%s %s -M %s -no-shutdown "
> +    qts = qtest_initf("%s %s %s -M %s -no-shutdown "
>                         "-chardev file,id=serial0,path=%s "
>                         "-serial chardev:serial0 -accel tcg -accel kvm %s",
> -                      codeparam, code ? codetmp : "", test->machine,
> +                      codeparam,

You removed the initialization of codeparam, so this is now always the empty 
string, isn't it? ... please just remove it completely now.

> +                      test->kernel ? "-kernel " : test->bios ? "-bios " : "",
> +                      codetmp ? : "", test->machine,
>                         serialtmp, test->extra);
> -    if (code) {
> +    if (codetmp) {
>           unlink(codetmp);
>       }
>   

  Thomas

