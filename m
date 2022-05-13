Received: by 2002:a19:3859:0:0:0:0:0 with SMTP id d25csp332020lfj;
        Fri, 13 May 2022 07:38:23 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxdxLBGZtD5f2srEfJjRav6jxRfcm0sm6wb74igHCZvGGVssXxV2L+9m/ifGaaTY7MWFLct
X-Received: by 2002:ad4:4e05:0:b0:456:50a4:7494 with SMTP id dl5-20020ad44e05000000b0045650a47494mr4589394qvb.6.1652452703242;
        Fri, 13 May 2022 07:38:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1652452703; cv=none;
        d=google.com; s=arc-20160816;
        b=B92r8xx9Mn+o8r6HYIGuzWw5C0Aa+O5epoHpZ7QhPVTdn8OWFCLM8+LqAsL/bfwciA
         XxGdjpu10rsR/A9ThvVQyO+qh30WiZH+X4UfFKlC4OvWxUcF1ACTahA3xU5Xkw+PogwU
         CuGv6Ehn1hujHE+xVCa2tW2B2xtDmwdRIPJYGRoakZH6z1QP0NvIuWvIwmd9U+S5WBo5
         E6ugjCEyuivewhD0OfnF/+wmJ5DuI+o6boGhFGF0ux8QpcBtZYG6Q/GK1t5dcc3mfotL
         B8ugYqAkGcgll3o33LVgJh9dFWTcH97NBOHrckZvVvWqMoyIX6Aiklk7iYl3TTSJ9zTZ
         z11A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=ZFUtQhXBI6mcBGBeNmNg7/khP0t9HLPOnHJbFf6YHBI=;
        b=Ttx6MrNUC5HwgK7EBsQ7uyl+rbSXsGfIeyVAeX+wfnBlaDShnXSqjLUTnqQ5BtnJAN
         AhKMG0RSAwc4QsFSIXvTGNbhHCQoC14IlAFRJXyWeTIAagInlVLe+YdrYHlAIZck43EF
         gQdwXNlK+SwXGjd0LNLbRlRmbahTYj8c9GLgXuaAcUwa4O3LsRLPADLvYoKo0Ij8so3J
         YzSKhIjt/UbeazFzX7X3JREW5q7dlViMzwBy1YRWr2cfc1GA5G81RWaOKrnBIHJjST31
         dns9JIuoMkJaiQ5nzeGitUSnhA9XrVsCeHMVH3zmqx5qP4RD07FRr3aUBWdj2cyEvH8j
         sJOA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=YL5IKT8b;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g16-20020ac85810000000b002f1d5c19a94si1754846qtg.494.2022.05.13.07.38.23
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 13 May 2022 07:38:23 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=YL5IKT8b;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:35298 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1npWQw-0002lh-P9
	for alex.bennee@linaro.org; Fri, 13 May 2022 10:38:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58048)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1npWPm-0002GV-RJ
 for qemu-arm@nongnu.org; Fri, 13 May 2022 10:37:11 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:50485)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1npWPl-0005KF-9V
 for qemu-arm@nongnu.org; Fri, 13 May 2022 10:37:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652452628;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZFUtQhXBI6mcBGBeNmNg7/khP0t9HLPOnHJbFf6YHBI=;
 b=YL5IKT8bTpZOREvIsrjycPK9JHfvKboIuzSRGXWwQjqc6atGqvm3tNxxXOuhc7VfagBLZy
 xy/Zfp+y7AlLdsdWIem22y0Jhy2bE4nNqhO2F5XXa6b8E7MG3663Y/FucUFq+PpPlp2QQD
 QsGpRTDJQ/7GUxQdpoR3/LRP8T2rZOQ=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-248-joBpZJ33MKWcbRguLupAGg-1; Fri, 13 May 2022 10:37:05 -0400
X-MC-Unique: joBpZJ33MKWcbRguLupAGg-1
Received: by mail-wm1-f71.google.com with SMTP id
 n186-20020a1c27c3000000b00392ae974ca1so2980498wmn.0
 for <qemu-arm@nongnu.org>; Fri, 13 May 2022 07:37:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=ZFUtQhXBI6mcBGBeNmNg7/khP0t9HLPOnHJbFf6YHBI=;
 b=6jBHPr9QsIprmY1ajLTNkQsy7ono7o1S+jHNty4xX/SJXKlGwEYAELriU5lhdvufQL
 XtXzGr/4y+QCS4AQ8QvUMfFmJMLR8o7pihK4t+FXcQbibchvPa5SLxNZJsp9BYbNqGNU
 pI0nPXIqbgGSNIHxoxqQ8yEHV2jo33SyZHnPXJhUY2wk0gNE5HvqTUaBiuc5ktAGU4wR
 fWszJbi1t87IQjfLYpdYKHrWOrXwaxOdUdGpxLLQFBgomO5NsLyEVb7x440zEGvQO9M0
 tyf+6CjcActLrfHC7oH6u1pNaLxtS4NnCwI2Nzk8FgUtzJALdg6AyAz8JUlkK07EJl5U
 GUtQ==
X-Gm-Message-State: AOAM530TzW49Vjjv7MSEs0HNV8X3N0LW/ypL6JFqdMYHi/v+6oS/3Tap
 +Fvhxww9fjPaR7L05FTrRoHd3FvvF38hgCOv3SIW9j9YgHtVkTFtTfwTTkRRF0Fc4aGKA6j9H2b
 v2PWFE9zuIiZs
X-Received: by 2002:a05:600c:601c:b0:394:9595:d7f7 with SMTP id
 az28-20020a05600c601c00b003949595d7f7mr15826519wmb.98.1652452624497; 
 Fri, 13 May 2022 07:37:04 -0700 (PDT)
X-Received: by 2002:a05:600c:601c:b0:394:9595:d7f7 with SMTP id
 az28-20020a05600c601c00b003949595d7f7mr15826482wmb.98.1652452624151; 
 Fri, 13 May 2022 07:37:04 -0700 (PDT)
Received: from [192.168.8.104] (tmo-082-126.customers.d1-online.com.
 [80.187.82.126]) by smtp.gmail.com with ESMTPSA id
 p9-20020adfa209000000b0020c5253d8d0sm2381939wra.28.2022.05.13.07.37.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 13 May 2022 07:37:03 -0700 (PDT)
Message-ID: <4613a814-c858-1cac-3750-789b388cba8d@redhat.com>
Date: Fri, 13 May 2022 16:37:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH v3] hw: m25p80: allow write_enable latch get/set
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 Iris Chen <irischenlj@fb.com>
Cc: pdel@fb.com, qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 patrick@stwcx.xyz, alistair@alistair23.me, kwolf@redhat.com,
 hreitz@redhat.com, peter.maydell@linaro.org, andrew@aj.id.au,
 joel@jms.id.au, lvivier@redhat.com, pbonzini@redhat.com,
 qemu-block@nongnu.org
References: <irischenlj@gmail.com> <20220513055022.951759-1-irischenlj@fb.com>
 <bfbffeef-e7d1-8003-24ca-4cafc90e60a4@kaod.org>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <bfbffeef-e7d1-8003-24ca-4cafc90e60a4@kaod.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001,
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
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: hD6fR5vlyRXM

On 13/05/2022 15.54, Cédric Le Goater wrote:
> Thomas, and others,
> 
> Are you ok with the qtest extension proposed by Iris ?
> 
> If so, I can take them through an aspeed PR.

Fine for me!

> On 5/13/22 07:50, Iris Chen via wrote:
>> The write_enable latch property is not currently exposed.
>> This commit makes it a modifiable property.
>>
>> Signed-off-by: Iris Chen <irischenlj@fb.com>
>> ---
>> v3: Addressed comments by Peter and Cedric.
>> v2: Ran ./scripts/checkpatch.pl on the patch and added a description. 
>> Fixed comments regarding DEFINE_PROP_BOOL.

Acked-by: Thomas Huth <thuth@redhat.com>


