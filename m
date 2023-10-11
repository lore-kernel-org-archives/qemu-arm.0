Received: by 2002:a17:906:6d0c:b0:9b2:89ee:1eb8 with SMTP id m12csp552192ejr;
        Tue, 10 Oct 2023 19:44:44 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHEh5tTpUW1dwzlRMcPEx45ocrcbElbaGePYmRkJZC4Q6EIQ8xSBNrSnuwudM3Ry+UFxQS4
X-Received: by 2002:a05:6a20:258d:b0:14d:e075:fc5d with SMTP id k13-20020a056a20258d00b0014de075fc5dmr19715543pzd.40.1696992284384;
        Tue, 10 Oct 2023 19:44:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1696992284; cv=none;
        d=google.com; s=arc-20160816;
        b=MnlIh5Cuw+2Zy+GJecqyNJkqlVLOhDtpUkmLRm6kLiT01g7NKWc8dVFA8gjdFXBx02
         18x2+ea+g6H2ToDQ2A83MKm/i52WMjS+ywiektqRaIyX2va9weu77Jf3qRb4lc+E5HBe
         VpL0v+NOJK3WdHNtyjvm4YZ7femyirc+HUCpWkyDEIdDKQ1cZ/o+gjpusZ/iwQpJFMsy
         42FiHWpUPVVu9P29KGSh9KFh5K0HCWVGcNx/A3hQSybyVr1nM1RAGGhuExU1qhzM67ow
         cK1wKxWI+i5sFHSNLWQZHcnKcJtz+ndObYbQx2g/GqxOPZ5zDS5mbwQi2N0Mq0ebCdib
         ajUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-id:precedence:content-transfer-encoding:in-reply-to:from
         :references:cc:to:content-language:subject:user-agent:mime-version
         :date:message-id:dkim-signature;
        bh=0r+nZWjXBLko/PJ79KzGJfGzh06JS4c3rSs5rvlxLDw=;
        fh=Jsw78AsOtw7xdVOTbJ13Ei17OZhWpxJUyoQE6bDe05Q=;
        b=dk2uIBb3vm4F/JcP7gQa4Pka15ZZbZkf025zPiamvURKpj2wJm6sFmqDqUz2flbRAM
         PVHO2g+4IRXjTicB9aTpAy6brPYS9SqGVhwPRrRXWUpmVwlnVWIaxLb/wxjCivMD/IeA
         7a8njeKzlvll+6S1S2g4pvt8L2C4GP92KAlVJE5CfdOu08Bn6OYdz8UeQAVUpbOX5UCc
         p27Qm2wwh2Nl+YnnJ8geh2ZAZdz4KMChCS5jqIqacyroaxZDl88lyQ1wUCyCGVcbDhZK
         8hxvaKIZryDVOiVqWNFGTJvYFUSvbjiZ4XY2o1rMlePb1t/Y+fZ5mdJQeEywUohqM4o7
         fn+Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Sy0A5zUK;
       spf=pass (google.com: domain of kvm-owner@vger.kernel.org designates 2620:137:e000::3:5 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <kvm-owner@vger.kernel.org>
Received: from groat.vger.email (groat.vger.email. [2620:137:e000::3:5])
        by mx.google.com with ESMTPS id d11-20020a170903230b00b001c3fa9a1e3esi14374984plh.493.2023.10.10.19.44.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Oct 2023 19:44:44 -0700 (PDT)
Received-SPF: pass (google.com: domain of kvm-owner@vger.kernel.org designates 2620:137:e000::3:5 as permitted sender) client-ip=2620:137:e000::3:5;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Sy0A5zUK;
       spf=pass (google.com: domain of kvm-owner@vger.kernel.org designates 2620:137:e000::3:5 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from out1.vger.email (depot.vger.email [IPv6:2620:137:e000::3:0])
	by groat.vger.email (Postfix) with ESMTP id 7293F8026F41;
	Tue, 10 Oct 2023 19:44:42 -0700 (PDT)
X-Virus-Status: Clean
X-Virus-Scanned: clamav-milter 0.103.10 at groat.vger.email
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344874AbjJKCol (ORCPT <rfc822;mathieu.poirier@linaro.org>
        + 2 others); Tue, 10 Oct 2023 22:44:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56672 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344853AbjJKCok (ORCPT <rfc822;kvm@vger.kernel.org>);
        Tue, 10 Oct 2023 22:44:40 -0400
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com [IPv6:2a00:1450:4864:20::635])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DA9B4B0
        for <kvm@vger.kernel.org>; Tue, 10 Oct 2023 19:44:38 -0700 (PDT)
Received: by mail-ej1-x635.google.com with SMTP id a640c23a62f3a-9b64b98656bso1073768266b.0
        for <kvm@vger.kernel.org>; Tue, 10 Oct 2023 19:44:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1696992277; x=1697597077; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0r+nZWjXBLko/PJ79KzGJfGzh06JS4c3rSs5rvlxLDw=;
        b=Sy0A5zUK5WWDElGDD326JlLdFpXnwYyo6o91ncEDpgL3/u54DoS0bHhRynsRgs7o/O
         cgurQkWET/+5SF4X2QcoH0PKuK0PmNluA+qIXbVpCH/+VDbMbzFdt2PCyzmJT2ZXYd05
         +4IAD48B+LGn4uU40sKJngrB/8lkx9D6hsT8FRDV55AdqbYJMwtlrUZM7m+OQvoHs22o
         DLOhBBtcGBdyfCJzcKUMxXWTZUkVUmcmIEbEkQ1keRro2cxPg6IIeQXrD4ING1HbbBdk
         PTUawHmnfwiDaLFUXWAZ+0/dI7H87gDo3juSdfwJVm8Ico1aTaJhxq5yKJlMh1Bl2/n8
         0C3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696992277; x=1697597077;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0r+nZWjXBLko/PJ79KzGJfGzh06JS4c3rSs5rvlxLDw=;
        b=C+ruScf9W63qBQTOZw6VlSTHlf4a+/lSgTLte4NAZNZPyIQxaVnd10cOGX2BWPqHsg
         C6OmyQWWIRdNxgu7B7Brpq9lHH0xCAjIrxQHWAYP0wGgHqepSyQ5ApSAZZr64mbbGF1G
         5VbfZirdKQ8S1vhFI05HH+0GZeEyZT4UAG19vCVQdTKowWbkZtMnqJnhSUBA31JAA3a5
         +8uywA4SXUkbDhcuOy1G+RXqaa8TuLIwpBmhldZyB0HL0kxZX8WFgzOVZ0Cs1I+Hss9x
         LY+VQKG5GxTCO9I1gYK0iSI+UKop4V2Bj75BV4djIjmNlxJ9pPPr6eFHpaEP5uN7TREl
         F01g==
X-Gm-Message-State: AOJu0YzHB9RBShJsk7rhWeUzhyKiolyeI37TS6EwoOMoM0T9FF40XUxs
        gCoZq44aQT3ClCbItgu69wRxaA==
X-Received: by 2002:a17:906:3012:b0:9a2:225a:8d01 with SMTP id 18-20020a170906301200b009a2225a8d01mr17885725ejz.7.1696992277404;
        Tue, 10 Oct 2023 19:44:37 -0700 (PDT)
Received: from [192.168.69.115] (mdq11-h01-176-173-161-48.dsl.sta.abo.bbox.fr. [176.173.161.48])
        by smtp.gmail.com with ESMTPSA id gq7-20020a170906e24700b009adc5802d08sm9208149ejb.190.2023.10.10.19.44.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Oct 2023 19:44:37 -0700 (PDT)
Message-ID: <e3e0a6c6-8125-f010-de73-7fb3ce2d8a88@linaro.org>
Date:   Wed, 11 Oct 2023 04:44:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.15.1
Subject: Re: [PATCH v2 2/3] arm/kvm: convert to kvm_get_one_reg
Content-Language: en-US
To:     Cornelia Huck <cohuck@redhat.com>,
        Peter Maydell <peter.maydell@linaro.org>,
        Paolo Bonzini <pbonzini@redhat.com>
Cc:     Gavin Shan <gshan@redhat.com>, qemu-arm@nongnu.org,
        qemu-devel@nongnu.org, kvm@vger.kernel.org
References: <20231010142453.224369-1-cohuck@redhat.com>
 <20231010142453.224369-3-cohuck@redhat.com>
From:   =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20231010142453.224369-3-cohuck@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.6 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,RCVD_IN_SBL_CSS,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on groat.vger.email
Precedence: bulk
List-ID: <kvm.vger.kernel.org>
X-Mailing-List: kvm@vger.kernel.org
X-Greylist: Sender passed SPF test, not delayed by milter-greylist-4.6.4 (groat.vger.email [0.0.0.0]); Tue, 10 Oct 2023 19:44:42 -0700 (PDT)
X-TUID: DGBBHJiQvVVD

On 10/10/23 16:24, Cornelia Huck wrote:
> We can neaten the code by switching the callers that work on a
> CPUstate to the kvm_get_one_reg function.
> 
> Reviewed-by: Gavin Shan <gshan@redhat.com>
> Signed-off-by: Cornelia Huck <cohuck@redhat.com>
> ---
>   target/arm/kvm.c   | 15 +++---------
>   target/arm/kvm64.c | 57 ++++++++++++----------------------------------
>   2 files changed, 18 insertions(+), 54 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
