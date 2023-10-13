Received: by 2002:a17:907:8744:b0:9bd:85f7:2662 with SMTP id qo4csp1298303ejc;
        Thu, 12 Oct 2023 23:28:57 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEWHT3ymYXItEDX5l9rYkHKdVXlWyoSmoOJKVeU867gC+qXMJire2oWCFjoYQWyMbbUFzUa
X-Received: by 2002:ac8:5815:0:b0:411:f5c0:5db with SMTP id g21-20020ac85815000000b00411f5c005dbmr32788893qtg.26.1697178537020;
        Thu, 12 Oct 2023 23:28:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1697178537; cv=none;
        d=google.com; s=arc-20160816;
        b=K8O2KCEdTtfr7lQFqwPRTydkEXy9h9XqicWToDfW+DoVqMoZ29RPIKylaNEx/35mlG
         2KqdxgF8NYYO0jbAv9zawL1tetN9jOMUbRoV3LuYSHWxrU1WIEUUTIYXscZAh4y+kqRb
         yyVAy3WcR+ggomhp6x/N5138vwVCjKFGOGnEnSujCIiFT2RzvXOxppRPltKGXtU9htCd
         WOGOeaFORoCL5eLH4fq5M7q2ieY9n2+wGWADgcFBKO1lso1mR7RwFNSMSJj/rebw1HWL
         +rVId5qCVvU+sqvl9zd22mfEBgmIYqwaMkPyttew9ea9xVgspSAMDj0QW9FagC2nZm76
         j0Qw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:autocrypt:from:references:cc:to
         :subject:user-agent:mime-version:date:message-id:dkim-signature;
        bh=nS3c0yX6775ErUYiGM257OspaLSskQXdHZo+imQiXwM=;
        fh=gGZ8KC2O7OgwRBDPiLtlNf/Vfu8laUlcFY/sAMdpb+8=;
        b=W23xchA3q+fpnLSK9DgX6LWzJj2JBIspzILG2dA2wVsuqp3buHBp5arW9WNcvPW/Zn
         cd6g06WU0h8pRzaXcaT2DWCiXYT6O9bHkTpkWn+hZHlhTp0TOLoocJb6RY27il/woNIN
         kKCE8yukwaltZdjg0ebXJ5RJnMWusHsugIqxfaaVYh4+E5fzfNR0ePjWVcb+Jw3ITXy+
         epGqx93KWPY2CrQaK4UKQsjKYHSMqe4FnVMjYDdSUG2eHQU9GHRVsehB8hKZ+DqmZJ5C
         FdW+fZny5Zo19JFIBSYZpK54g9X+/JjzwxA0yhoqDljvJilhVnh+GPgvqb63gQzdWqIB
         LFWQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=cA4gLwi5;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p20-20020a05622a00d400b0041981d576b4si735777qtw.733.2023.10.12.23.28.56
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 12 Oct 2023 23:28:56 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=cA4gLwi5;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qrBem-0000D1-J7; Fri, 13 Oct 2023 02:28:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1qrBed-0000A0-Mv
 for qemu-arm@nongnu.org; Fri, 13 Oct 2023 02:28:13 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1qrBec-0005li-Cu
 for qemu-arm@nongnu.org; Fri, 13 Oct 2023 02:28:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1697178488;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=nS3c0yX6775ErUYiGM257OspaLSskQXdHZo+imQiXwM=;
 b=cA4gLwi5IObnSGyujVjNDX5VaYCrYCU+InmccpgJez0Q9zwRz45ZNbnK5r0OJHcS4dV3lG
 coqSEIthBS4BZ8PFesVPTTfYTyfqvESIzBqJdkR2Q0A8qjLI/lRSE71R79shCj2Ry93e8E
 8fA4g7fpQgW7P8rlr/ZVJniToDao4/A=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-493-73s8CA5RPMORl-QmJd9quQ-1; Fri, 13 Oct 2023 02:27:52 -0400
X-MC-Unique: 73s8CA5RPMORl-QmJd9quQ-1
Received: by mail-ed1-f70.google.com with SMTP id
 4fb4d7f45d1cf-5346626c1c5so1506352a12.1
 for <qemu-arm@nongnu.org>; Thu, 12 Oct 2023 23:27:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697178471; x=1697783271;
 h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
 :to:content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=nS3c0yX6775ErUYiGM257OspaLSskQXdHZo+imQiXwM=;
 b=o7FviwIGdeMtjYGSOi7bugvUilcxl3IOZ4k6uxHb/FGCKWRVQvlif22VUXodYHtHIb
 LfMDTLfo2Re+w3p2mFzelyyzZy4lb/4Kw5DLCXY4YpDdArYh3CiJ2MAi8uk/gZ+HHLWA
 KbbKfrLPS8gM+CEl8W5WOyrcBsN5N8p/tay7TvxuLNYe/GjObmTR2GyEhqctjJZDu0Dc
 H9vU4emkUdT7RfZLt3PipCdAHl6LVvO2QJYfLiMIcKOeKXJjjpVPqXVjsrTbKxa+h8ol
 6vvC4qkB3aBlzsPUrwn8FufZ/YH+vb4+Desc1G9UHLgXf3CpZ99/UUHPVGVy9NJUrbuW
 yCYA==
X-Gm-Message-State: AOJu0YzFJ15z84r6dvlMcxIsNWmU+WyXR7JuAejZRZj0kbl3tA56IcbH
 NJ7N+cmr1H5T/hvqyei/tU0Q8zbQNoBZCTc9m1hVoVCY2mCSgFa1LnnO71Fa4bdF7Nq09VEo8by
 T4jXaib50nAeC
X-Received: by 2002:a05:6402:1608:b0:52b:c8d9:1d66 with SMTP id
 f8-20020a056402160800b0052bc8d91d66mr18860814edv.42.1697178471069; 
 Thu, 12 Oct 2023 23:27:51 -0700 (PDT)
X-Received: by 2002:a05:6402:1608:b0:52b:c8d9:1d66 with SMTP id
 f8-20020a056402160800b0052bc8d91d66mr18860796edv.42.1697178470807; 
 Thu, 12 Oct 2023 23:27:50 -0700 (PDT)
Received: from [192.168.0.5] (ip-109-43-176-176.web.vodafone.de.
 [109.43.176.176]) by smtp.gmail.com with ESMTPSA id
 i22-20020a50d756000000b0053dda7926fcsm2953926edj.60.2023.10.12.23.27.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 12 Oct 2023 23:27:50 -0700 (PDT)
Message-ID: <24ac3531-239a-4cc8-adea-3466a9f66cbd@redhat.com>
Date: Fri, 13 Oct 2023 08:27:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 10/10] tests/coroutine: Clean up global variable shadowing
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Alberto Garcia <berto@igalia.com>,
 Hao Wu <wuhaotsh@google.com>, Kevin Wolf <kwolf@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-block@nongnu.org, John Snow <jsnow@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Fam Zheng <fam@euphon.net>,
 Tyrone Ting <kfting@nuvoton.com>, Markus Armbruster <armbru@redhat.com>
References: <20231009100251.56019-1-philmd@linaro.org>
 <20231009100251.56019-11-philmd@linaro.org>
From: Thomas Huth <thuth@redhat.com>
Autocrypt: addr=thuth@redhat.com; keydata=
 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
In-Reply-To: <20231009100251.56019-11-philmd@linaro.org>
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
X-TUID: 588b9Yi+H4KS

On 09/10/2023 12.02, Philippe Mathieu-Daudé wrote:
> Rename the global variable to avoid:
> 
>    tests/unit/test-coroutine.c:430:11: error: declaration shadows a variable in the global scope [-Werror,-Wshadow]
>        bool *done = opaque;
>              ^
>    tests/unit/test-coroutine.c:438:10: error: declaration shadows a variable in the global scope [-Werror,-Wshadow]
>        bool done = false;
>             ^
>    tests/unit/test-coroutine.c:198:12: note: previous declaration is here
>    static int done;
>               ^
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   tests/unit/test-coroutine.c | 12 ++++++------
>   1 file changed, 6 insertions(+), 6 deletions(-)

Reviewed-by: Thomas Huth <thuth@redhat.com>


