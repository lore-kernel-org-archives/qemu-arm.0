Received: by 2002:a17:907:76f8:b0:9a1:fa4e:495e with SMTP id kg24csp1216184ejc;
        Fri, 25 Aug 2023 00:33:25 -0700 (PDT)
X-Received: by 2002:a5d:54cd:0:b0:314:4237:8832 with SMTP id x13-20020a5d54cd000000b0031442378832mr12270597wrv.48.1692948805264;
        Fri, 25 Aug 2023 00:33:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1692948805; cv=none;
        d=google.com; s=arc-20160816;
        b=v8BlaLQGbsNoSbH61I18kMT5Oz793hszgPM2r6v7/JFBRowFQsDdEQrMItRtzyTRty
         HR968vsW+kWTc6bWRJXq+RCiFKDWCbS8iNTVO2IGt/tREsbNwLcb9g3RWAD8vPYUJknz
         MyITb1vIX1CUtFUn5I6ctjPLJ4omhXB6BHfeNauADyQ33+FCdF8eSKIwGQGolnT4vYy4
         pJT8Hfxml/pM3sC8soOngIGO3mY2MpOb1zhiOITWyNAQo65eWEYCC+jVEHY6JJlvkRfk
         15M8tCrivasNK3BAfxkSGnNHtThyYOlQR/ZPC2FCiBwy0kG3AC2TG/JHod5w9yk/jhFf
         0dUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=W5DcnYU6BQqu8Jy69UM40Ie+RxQfeMOCtE/JzbvU2jk=;
        fh=qmZ05mhLeMuz4yNBZ/q0UYaw6VXqQk8kLliJ08JnGGo=;
        b=wvRCiGYWkEyi/KYAlN7qoO2m0QS91UBg9AyQ5f+RY9cR++2T6EhvvT6qZTY5ztStXe
         wnk1Xc8FnRBguasp5WBs7C7D+G4LP2qNPTYFYQSHG2opJDve2s7gxWVAus7oYGe8nvLq
         9fx/k7wKdwkQQA3g+iGGLRMAnqw8+lDL9hGckqz/OCh14NpqHgqgPOUKNeo/1eTABca9
         x5JbKJIOZDTNNR7lPCXbVzrh1RfXIni15D53J5xdiy241V36D1s+oDDk9ZbgNT3iDJRj
         I1P4nKhfLwH0EGb8yy6c/N3NesmAqdnJ7nAJ9PdDLnO6kMS18ZZzsF3oCwu/+6dH5lFQ
         7t1w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=uMfCfw9E;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id m19-20020adfa3d3000000b00317ddc9bb7bsor446894wrb.4.2023.08.25.00.33.25
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 25 Aug 2023 00:33:25 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=uMfCfw9E;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1692948804; x=1693553604;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=W5DcnYU6BQqu8Jy69UM40Ie+RxQfeMOCtE/JzbvU2jk=;
        b=uMfCfw9E1+TdO05zcipSLViFi8+FHH3uroLRUYLqoPonpC9cs2wLnaY0dyiH0ORVzE
         h8rvkCQ+knWOXUXc2XMqm7tb2b5Wm2/H+GUM35J924ezel/tEAesP+qd1ogyF1yppHk8
         ByuNsQS32H4KB5w3QBzinl4oD7s/PknNAekc1oMzzlKTxX7HMNSUSJdzxVN8w7bh6Bt5
         hKwuCP/14gH7+Z+vxbc4VxlGFuWWa5bw3KoD006sU4F5RzcTT7usNPhOF1RU/UmYf6y7
         8jM4WH1L7jUkZ33ivn5ydJ7FAJ7lVHeOLGWczvygsobLvScYC6WlZJtqbS3QhBsVPXH9
         PHLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692948804; x=1693553604;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=W5DcnYU6BQqu8Jy69UM40Ie+RxQfeMOCtE/JzbvU2jk=;
        b=KrwL+UCYLlwi19eeO86XaQZ8LW+z5tdXRkgEgBzXVEUOKmZaqD3fVISbyk8BnqrNcc
         zQpwC7FgAptNSoFs7ZoxGMIUkCsIDgUEU66CPdSC/oMtUIWA548geuLSrStDnMjjwoQ+
         ojqm+SeuXiXB/gu8EfecMTF5VpKm/NvqRueB4NCa1X+EbQhnj8Qtm/W/Mov1Ag6iRr6i
         j7bU9hOGV0fRaeWDklvrSKgpnPeZneboPsmY/Gp0CeilFIhf35khmXjVDkyZZpZOlnKT
         Kup4BqjxtaxqKRON+5ae6e9IQfiZVzXz6eLSdJg1uDYc2dQnLRfw/W7Tindam5BAuAec
         H3pQ==
X-Gm-Message-State: AOJu0YxfvQc8RIKfApoWf0Vg53tGh5W7Puyz90vcyTeQToDCqrQ6j6d+
	w05qsFUK5do9fxnrqXlVeiPu5K81IcIhxUMic44jVg==
X-Google-Smtp-Source: AGHT+IHt/eLgsDdBEQAGJzsqccpclu+sDPMzQpFf5gp97c7NROk2904JVqQh4MO4v6bWK9/LmoTYhg==
X-Received: by 2002:a5d:53cc:0:b0:319:8cc9:6d9b with SMTP id a12-20020a5d53cc000000b003198cc96d9bmr12284868wrw.8.1692948804624;
        Fri, 25 Aug 2023 00:33:24 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from [192.168.69.115] ([176.164.69.26])
        by smtp.gmail.com with ESMTPSA id h8-20020a056000000800b0031759e6b43fsm1376439wrx.39.2023.08.25.00.33.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Aug 2023 00:33:24 -0700 (PDT)
Message-ID: <3f278596-1091-a7d5-ad72-68a03a1b0d2f@linaro.org>
Date: Fri, 25 Aug 2023 09:33:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.14.0
Subject: Re: [PATCH v2 11/12] gdbstub: replace global gdb_has_xml with a
 function
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: Beraldo Leal <bleal@redhat.com>, Nicholas Piggin <npiggin@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Markus Armbruster <armbru@redhat.com>, Yonggang Luo <luoyonggang@gmail.com>,
 qemu-ppc@nongnu.org, David Gibson <david@gibson.dropbear.id.au>,
 Daniel Henrique Barboza <danielhb413@gmail.com>, qemu-s390x@nongnu.org,
 Akihiko Odaki <akihiko.odaki@daynix.com>, qemu-arm@nongnu.org,
 Juan Quintela <quintela@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Ilya Leoshkevich <iii@linux.ibm.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 David Hildenbrand <david@redhat.com>, Greg Kurz <groug@kaod.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
References: <20230824163910.1737079-1-alex.bennee@linaro.org>
 <20230824163910.1737079-12-alex.bennee@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230824163910.1737079-12-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: WGFiZhGXVbt8

On 24/8/23 18:39, Alex Bennée wrote:
> Try and make the self reported global hack a little less hackish by
> providing a query function instead. As gdb_has_xml was always set if
> we negotiated XML we can now use the presence of ->target_xml as the
> test instead.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>   gdbstub/internals.h    |  1 +
>   include/exec/gdbstub.h | 10 +++++-----
>   gdbstub/gdbstub.c      | 12 +++++++-----
>   gdbstub/softmmu.c      |  1 -
>   gdbstub/user.c         |  1 -
>   target/arm/gdbstub.c   |  8 ++++----
>   target/ppc/gdbstub.c   |  4 ++--
>   7 files changed, 19 insertions(+), 18 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
