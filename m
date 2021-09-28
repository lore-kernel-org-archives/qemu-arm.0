Received: by 2002:ac2:5978:0:0:0:0:0 with SMTP id h24csp4748324lfp;
        Tue, 28 Sep 2021 03:56:09 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy+IXUi232mINOxWTLEWlGqSymcxIGNxAigfOOUetqXfW8jUnbEilIyx2m8XWVr8Q8EeMTB
X-Received: by 2002:aca:c615:: with SMTP id w21mr3076537oif.169.1632826569839;
        Tue, 28 Sep 2021 03:56:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1632826569; cv=none;
        d=google.com; s=arc-20160816;
        b=zahp/M9yIuha/Pa5iZIZ1B3a4O0hmhrXKyKGlBxndy5fKW4/QXDsmJFq1kHOnWkecF
         M1H7Y10zh7M2rrNZ+sl0Ixc+gy2C9/XKFEpAyanvo9saGwiJHus93vTpfjq2wQiUvfrw
         j7bG4HYPMrp44QJ0EB6pgnNOKgszuuoqh9RWZMRg/fNOMJiYaWXDFJ7KDSaDuH9O3S6j
         4mIQgLegx0+zpDV8LF9whfFSToUCqxd5cRiu8utbPJtuDzEF4V6BHErcuo4FQM+K+pkc
         V0ZyVl617MhZMMu4pbKUMwopsErcxJBDeTKx1oF47ziavWSkUSBXxLRq4bDeBT1LT/tG
         R9Dw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:from:references:to:subject:user-agent
         :mime-version:date:message-id:dkim-signature;
        bh=QTdvgLcUXL25Wjrq7DElBBiLFgk5FkoKVdgwEE/g5Vw=;
        b=Pqe2sSxuZ0s0WQbdk/sb4cfc8BS6HJHykVFdwINIQqguSw03MkP8Zg99Fr+FrfatT7
         UymwPkQPo210qbtFhk8UrmzUcMbjdPKhTMREInoIxaw4V8ggRx4zSndCSPpxqbWWijSi
         ny9N8+/aZ3D4EL7Ob/B1SXE/AHRMlGUa18qTM1+5piSmZUOZTmP2JsUgDkMiPjfbsw1e
         /qOHkAeqIf0HjGyEETaVRadVPvTYGar5xKghFhNarDDP5OjLIbaeH+SmsrVXJiingZFS
         RjFujTMHamfdeeWEgkFF9I8/u1k5yn5lD9sMl5YNAIOlVV7df2ClzfI4QzWncPJxKFOu
         BSZw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=GGhjncET;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h65si18626345oth.162.2021.09.28.03.56.09
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 28 Sep 2021 03:56:09 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=GGhjncET;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:39938 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mVAmP-0005nV-6Y
	for alex.bennee@linaro.org; Tue, 28 Sep 2021 06:56:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35228)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mVAi1-0007D2-GQ
 for qemu-devel@nongnu.org; Tue, 28 Sep 2021 06:51:39 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:22782)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mVAhz-0002L4-FP
 for qemu-devel@nongnu.org; Tue, 28 Sep 2021 06:51:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1632826294;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QTdvgLcUXL25Wjrq7DElBBiLFgk5FkoKVdgwEE/g5Vw=;
 b=GGhjncETbK3JsMOZvD8JiytXOEaYiJbClR0X05tmBbDJ2qsqXzfqh3+d/R/85rjpsZStVZ
 BFrSQa3qNd9oquMNMiT4iiX8PvEox3uYEB5XGeAIUKgGSTTPjtYMZHtvhRtBQ50BmpHOL+
 iHqV4tSruo5FfR4x1BpE8ZLOMkF/k1U=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-424-_afs2v74M365XEuWwoETig-1; Tue, 28 Sep 2021 06:51:33 -0400
X-MC-Unique: _afs2v74M365XEuWwoETig-1
Received: by mail-wr1-f72.google.com with SMTP id
 s13-20020adfeccd000000b00160531902f4so7285211wro.2
 for <qemu-devel@nongnu.org>; Tue, 28 Sep 2021 03:51:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=QTdvgLcUXL25Wjrq7DElBBiLFgk5FkoKVdgwEE/g5Vw=;
 b=1HTzHELj2EJ2z0LhD3DdnifGwKiLY5RZmyz5mMTZxQgIDxW0cY7LspigUCjt5z1ied
 MRRyc9SIqT/0PFYNakT1w8zPk6TmN4COpRn3/hAz4a2dY8/Zidf0ckyXJWEfpWfymsP5
 IhJTe/XU3H2ZltMKmKVfujvN/Be1qeRrux23TZ6x0ZVRp3L7XF3r+N5WfruYIEWmlJFv
 IMs8avMkbkyo03968jkZKwZOC0M0QUau74zabxROHnR3f1DAYvmPiFfWq0APC+bHRlkP
 54JRwxjTgR6unSQCUQujUFHtvW9PPu3aOrjrg/AsZYp6oY2nirqZUXzKdFtwOlQwu9PB
 WNaA==
X-Gm-Message-State: AOAM533VY61ya0/yynV4sFQkjRptLIMQUyT5jvdOueUNXTyfe43ZnPdL
 HOLnvyWBVfSEDdmIHY9FQMHZRTxFoa9vgB0rGjZhUQ8nNMoP1Myggy4OeJeS38b0sJaTvku+OXe
 xK42f9Z9D+8QshoA=
X-Received: by 2002:a1c:f216:: with SMTP id s22mr4065790wmc.27.1632826292499; 
 Tue, 28 Sep 2021 03:51:32 -0700 (PDT)
X-Received: by 2002:a1c:f216:: with SMTP id s22mr4065742wmc.27.1632826291973; 
 Tue, 28 Sep 2021 03:51:31 -0700 (PDT)
Received: from [192.168.1.36] (118.red-83-35-24.dynamicip.rima-tde.net.
 [83.35.24.118])
 by smtp.gmail.com with ESMTPSA id s2sm11361886wru.3.2021.09.28.03.51.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 28 Sep 2021 03:51:31 -0700 (PDT)
Message-ID: <59536bf7-0f3a-5138-7b7c-2f2063feaeb6@redhat.com>
Date: Tue, 28 Sep 2021 12:51:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH v11 07/14] qtest/numa-test: Use detailed -smp CLIs in
 test_def_cpu_split
To: Yanan Wang <wangyanan55@huawei.com>, Eduardo Habkost
 <ehabkost@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Daniel_P_=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Andrew Jones <drjones@redhat.com>
References: <20210928035755.11684-1-wangyanan55@huawei.com>
 <20210928035755.11684-8-wangyanan55@huawei.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
In-Reply-To: <20210928035755.11684-8-wangyanan55@huawei.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -53
X-Spam_score: -5.4
X-Spam_bar: -----
X-Spam_report: (-5.4 / 5.0 requ) BAYES_00=-1.9, CTE_8BIT_MISMATCH=0.001,
 DKIMWL_WL_HIGH=-0.001, DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1,
 DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.562, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Pierre Morel <pmorel@linux.ibm.com>,
 Pankaj Gupta <pankaj.gupta.linux@gmail.com>, qemu-ppc@nongnu.org,
 Cornelia Huck <cohuck@redhat.com>, qemu-devel@nongnu.org,
 qemu-s390x@nongnu.org, qemu-arm@nongnu.org,
 "Michael S . Tsirkin" <mst@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 wanghaibin.wang@huawei.com, David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: r/fxeiPJwi8d

On 9/28/21 05:57, Yanan Wang wrote:
> Since commit 80d7835749 (qemu-options: rewrite help for -smp options),
> the preference of sockets/cores in -smp parsing is considered liable
> to change, and actually we are going to change it in a coming commit.
> So it'll be more stable to use detailed -smp CLIs in the testcases
> that have strong dependency on the parsing results.
> 
> Currently, test_def_cpu_split use "-smp 8" and will get 8 CPU sockets
> based on current parsing rule. But if we change to prefer cores over
> sockets we will get one CPU socket with 8 cores, and this testcase
> will not get expected numa set by default on x86_64 (Ok on aarch64).
> 
> So now explicitly use "-smp 8,sockets=8" to avoid affect from parsing
> logic change.
> 
> Cc: Paolo Bonzini <pbonzini@redhat.com>
> Cc: Igor Mammedov <imammedo@redhat.com>
> Signed-off-by: Yanan Wang <wangyanan55@huawei.com>
> Reviewed-by: Andrew Jones <drjones@redhat.com>
> ---
>  tests/qtest/numa-test.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>

