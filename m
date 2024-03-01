Received: by 2002:a17:906:489:b0:a44:3ba0:e9d1 with SMTP id f9csp1266901eja;
        Fri, 1 Mar 2024 11:13:13 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCX4oEDuG9B/6ROJZdd/W3avqznCARJCD75KJsAedaQxgwZkTPWjHyYV911fBGjUhTkYn6F8HmXLvMI/eDhC6d+C4yAPXqSv
X-Google-Smtp-Source: AGHT+IFT0QoyhntEr1I00T1LdN6QKmS8TSyChfRiBMcPQqVlGyd+yU0mntKpU5rWDM+CbuKQtJng
X-Received: by 2002:a05:6358:5920:b0:17b:f881:6649 with SMTP id g32-20020a056358592000b0017bf8816649mr3220844rwf.26.1709320393047;
        Fri, 01 Mar 2024 11:13:13 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1709320393; cv=none;
        d=google.com; s=arc-20160816;
        b=Wt4SIe3/La3gNQZl19XXP9gihdPx3QD7YrRQN8plgyLVmxzGWLEzzJ36oTfIQ2ryTI
         P5TUuTVSNxDpq7CdNLtjUoZyi5WhFSIXcxsDj/8CYdhB9uYBId6RalhdfPnBmNOeenH6
         W/Ht/C6Hw2Qs2LXKjid5E8nLe+w9MkCrC3MCMFAYSYKLO/liQMhqSLheNi0dMVz89vvY
         8tHg7ouMyMe4d/+cJSoFfRYdzLEE7gfivFm/lAayVqRVFOvkCQzqNini4v5R3NXpFzzP
         5IFCchtbkYlCNXZx1L9sFmt1hBLOsXpkae7Jd5Dv8fpZCwUPmWDKusH/uCuLSxKnQX8e
         qGgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:autocrypt:references:cc:to:from
         :subject:user-agent:mime-version:date:message-id:dkim-signature;
        bh=PIsUyFN4xwH/5id5+SBMr2eHJBtzf9Fc7n9haEC66sE=;
        fh=9MhWuUJCKEHuOguOjE28Httg8vlIwrI5rZN9BpgwSIw=;
        b=G4PZBk2aohtSWqbhmW62OfjSkXQ3bGxmlshDGQg9EQy2YpoaonAXKzzwtSZeUrp2dX
         1EsD6Y7wUhImBqeWl/4Gvmm69SDYFFKaFZ/sR3PSEJkwC1f72h8Fy/PiX6tOZZu7fqKr
         +Tl3hXTNENN4zBEQclgb19+VDQVlcXTkuIwH0BuHpukOAcR4arMlminmj60qT65ed7A4
         PJVm9OvfkJC892hTebcApTDqKIuZ6hKUsXnW20Yel0eFheEsL7dhl1/ubG2X4GQJ6jHh
         Di8+UW7BoYT5vE5kkGCXDCXL50A+EWdO91t8F3OlFyfAJlmPpXw0EHBVYH0gE3/hKggA
         QoXw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=hw1jZ3KT;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f2-20020a0562141d2200b0068f03325de7si4255970qvd.366.2024.03.01.11.13.12
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 01 Mar 2024 11:13:13 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=hw1jZ3KT;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rg8Jc-0008Ap-Q5; Fri, 01 Mar 2024 14:13:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1rg8JV-00087C-R0
 for qemu-arm@nongnu.org; Fri, 01 Mar 2024 14:12:58 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1rg8JS-0006rm-Te
 for qemu-arm@nongnu.org; Fri, 01 Mar 2024 14:12:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1709320373;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=PIsUyFN4xwH/5id5+SBMr2eHJBtzf9Fc7n9haEC66sE=;
 b=hw1jZ3KTJ+dIuZwmxJFwHMajoOg5cxXsvt7Q8njuXlOGvPMc/XdQx3m3KET7CG7pXnC5Yl
 aIqNLEme7vznImXI3yyB4CMcG6IayF5+zLbAnKCM3CU/b02RVNgiSANNkkLYRElEcORRK5
 8LejoWZTi/X3CjOwH7s1IgyUmRRaOoU=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-523-lDJlbiuCMwGB4BLq4ghPfA-1; Fri, 01 Mar 2024 14:12:52 -0500
X-MC-Unique: lDJlbiuCMwGB4BLq4ghPfA-1
Received: by mail-qk1-f200.google.com with SMTP id
 af79cd13be357-78732274d13so230701985a.1
 for <qemu-arm@nongnu.org>; Fri, 01 Mar 2024 11:12:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709320372; x=1709925172;
 h=content-transfer-encoding:in-reply-to:autocrypt:references:cc:to
 :from:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=PIsUyFN4xwH/5id5+SBMr2eHJBtzf9Fc7n9haEC66sE=;
 b=MlxkuU/7zewk6eZKON5FEaqa6KLnAwaNSMBsdaxWT0x9S/yq2CilAsEFrOzFTnSu7k
 hKRMwqUZ1gjwjwSEHA6saIiqGnU3YJpjwYsB6xdurLuGbxEF0elsINV2aVhX5XfXm2Uj
 hD5hK0nKyiF4C0DR3M0sHhjNbkOaih2vo9057T90YhNxztWPuYLLt9HUKrs/c3SMDJbO
 7L7TvhKFbe1+0X7CXzzg0oymdFRk5WtVsCZyJSVd7bgyMyFtPKXe8mvOdwS7WWD3/Zqq
 6pDFfI2fbaw/EosmYjLbvaHL9cWkfRKxA65aljmrwjI4svqTD2uQYkGwWJu9hfzq2CS7
 lyxQ==
X-Gm-Message-State: AOJu0Yx/UHw/1ESvCJ8r2609EwmrUd+xlJ0zeGDlZ2oa0lIBY0gMhMgX
 1Jiza+BV5KgpVPoiP7x4Qm9ICwMpm4HSYbVI2xLjAnOHIdOLAwkDQw8YaHqmlqSdcd5hs7f1JoM
 YX6+arqaAolmVX/9nqmL1VJbAUYBYs5+k6gdo3uxUkh70gQckqTdx1B4tm4KyXWyZWHALbEZY8e
 Ec12rh6l7OgLPPLMFCgckMSg9fzhgzDA==
X-Received: by 2002:a05:620a:478c:b0:787:d984:774b with SMTP id
 dt12-20020a05620a478c00b00787d984774bmr2564700qkb.3.1709320372113; 
 Fri, 01 Mar 2024 11:12:52 -0800 (PST)
X-Received: by 2002:a05:620a:478c:b0:787:d984:774b with SMTP id
 dt12-20020a05620a478c00b00787d984774bmr2564684qkb.3.1709320371833; 
 Fri, 01 Mar 2024 11:12:51 -0800 (PST)
Received: from [192.168.0.9] (ip-109-43-178-133.web.vodafone.de.
 [109.43.178.133]) by smtp.gmail.com with ESMTPSA id
 h24-20020ae9ec18000000b00787d6a14d0bsm1910758qkg.10.2024.03.01.11.12.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 01 Mar 2024 11:12:51 -0800 (PST)
Message-ID: <b2585806-d05c-4eef-9a2b-15bf2c68e2c0@redhat.com>
Date: Fri, 1 Mar 2024 20:12:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/3] target/arm: Allow compilation without
 CONFIG_ARM_V7M
From: Thomas Huth <thuth@redhat.com>
To: qemu-arm@nongnu.org, qemu-devel@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>
Cc: Fabiano Rosas <farosas@suse.de>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
References: <20240129081835.137726-1-thuth@redhat.com>
Autocrypt: addr=thuth@redhat.com; keydata=
 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
In-Reply-To: <20240129081835.137726-1-thuth@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.096,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: wMvCke26L9RD

On 29/01/2024 09.18, Thomas Huth wrote:
> We've got a switch to disable v7m code since a long time - but it
> currently cannot be disabled since linking then fails due to missing
> functions. But thanks to the clean-ups that have been done during the
> past years, it's not that difficult anymore to finally make it possible
> to disable CONFIG_ARM_V7M: We just have to move some v7m-related code
> out of cpu32.c to a separate file (that we only compile if the switch
> CONFIG_ARM_V7M is enabled) and make sure to use the stub functions in
> m_helper.c if it is disabled. Then we can finally remove the hard-coded
> "select ARM_V7M" from the Kconfig file.
> 
> v2:
> - Updated a comment
> - Avoid #ifdef in cpu-v7m.c, handle it via meson.build instead
> 
> Thomas Huth (3):
>    target/arm: Move v7m-related code from cpu32.c into a separate file
>    target/arm/tcg/m_helper.c: Include the full helpers only with
>      CONFIG_ARM_V7M
>    target/arm/Kconfig: Stop requiring CONFIG_ARM_V7M
> 
>   target/arm/tcg/cpu-v7m.c   | 290 +++++++++++++++++++++++++++++++++++++
>   target/arm/tcg/cpu32.c     | 261 ---------------------------------
>   target/arm/tcg/m_helper.c  |   3 +-
>   target/arm/Kconfig         |   4 -
>   target/arm/meson.build     |   3 +
>   target/arm/tcg/meson.build |   3 +
>   6 files changed, 298 insertions(+), 266 deletions(-)
>   create mode 100644 target/arm/tcg/cpu-v7m.c

*ping*

Any hints how to continue here? Or is the series fine as it is?

  Thomas

