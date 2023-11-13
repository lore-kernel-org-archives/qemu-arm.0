Received: by 2002:a17:906:5a52:b0:9d0:bf65:29fa with SMTP id my18csp1162882ejc;
        Sun, 12 Nov 2023 23:21:47 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF/BbsABjS4qTlSUPMj4MF1AqXfN5c/nbDOSuP2fgSRndcaiXM1EVsWqLlc8k1AINpYjgQE
X-Received: by 2002:a05:622a:1709:b0:403:a262:7751 with SMTP id h9-20020a05622a170900b00403a2627751mr9747540qtk.12.1699860107330;
        Sun, 12 Nov 2023 23:21:47 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1699860107; cv=none;
        d=google.com; s=arc-20160816;
        b=Ltw4ZqUHYydgyqray0anJ3d+IS5JXC58XS+I0MYyxHq1VJmVOR1vOgOPto9pWO7XPQ
         3KVXDJ12uyPIp+zviSL5qbFt1YlyNZUzf+N/73ff83nFCq/ge4uZTrRMD1f3Y08wL4+m
         rOTqJfN6XW79DYym+UiCLNtHpSQgav7nE5HdclZZL22Vfbqdv9QuPwwICZLHDMaJy2Tw
         i6CCAY7rR9SD2IFbdyrAThuy6aH3kYkFCRwEuDcCh6gQ6KOlgWIm+NK6ks6f7oT9kOGC
         ZjgdnGGPCfXnYvCR9KHqV4t0WaaSrP9KRDTEcKkocmtJfFgohM0wYTr/56oCpYFNJieS
         bTsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:autocrypt:from:references:cc:to
         :subject:user-agent:mime-version:date:message-id:dkim-signature;
        bh=qfJVQsUqGpB1RqBgS62YRW+GczcLxPYNUjYdR3wiqtQ=;
        fh=cdcpt/zj1rZwYjkgpwo+f/7C+eNeUzk+0LeVcUP+HBM=;
        b=Tq521ywvWR8AEEg6dnx1AyXJOFmSWa581Vz7qgymKcGPfFO41qLu/0h2Gf243CYs76
         y3nS8AZM/V48TSZt6oiFynHchEKX8w7s7Hvgx6zPftE+vpGZi/xUNJcNSFO4zs/EciXK
         cVDwumi5wYFJnbtbN9VrV3eNElMPOCNVfvVmElmYIJ15U9gRVmk8d5ZvSjS9cnTuQ/iT
         ave1ampep1prrPSdlZjsYzGr+E2z1XuijQrAF1RN2ejks92M7Ts/SvZZDgvg4LlR8mYQ
         KAGJJ26nzCBCS8+0CCaRsT4eixqF8Qimww7o5DUdciQSgOk/kSpbT7Crw/16m4e/h6gL
         gxlw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=fYkTbpce;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f9-20020ac85d09000000b00417aec1fb7bsi4126620qtx.353.2023.11.12.23.21.47
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 12 Nov 2023 23:21:47 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=fYkTbpce;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1r2RGF-0000ga-UI; Mon, 13 Nov 2023 02:21:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1r2RG0-0000fp-41
 for qemu-arm@nongnu.org; Mon, 13 Nov 2023 02:21:17 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1r2RFy-0000Aa-AF
 for qemu-arm@nongnu.org; Mon, 13 Nov 2023 02:21:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1699860072;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=qfJVQsUqGpB1RqBgS62YRW+GczcLxPYNUjYdR3wiqtQ=;
 b=fYkTbpceuolQipULgjHzmBQGCwTeK4tNlixOib3PbIjl+G6QTJv+zkIjNTcpzOaEzUBc2I
 GNysET/E+wWmxZg9dC1s+VI5k0mT9aIK9l3L3d9mkmo0m40T6/UBG2pVgWjOm5NPIS3LrN
 C0ima3CqHYz517zUzF5+pceXZBd1Trw=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-250-meMvxUeOOA6ZtaguXqGRZQ-1; Mon, 13 Nov 2023 02:21:11 -0500
X-MC-Unique: meMvxUeOOA6ZtaguXqGRZQ-1
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-77bc4c1d8bcso365044085a.1
 for <qemu-arm@nongnu.org>; Sun, 12 Nov 2023 23:21:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699860071; x=1700464871;
 h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
 :to:content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=qfJVQsUqGpB1RqBgS62YRW+GczcLxPYNUjYdR3wiqtQ=;
 b=nLaHGWFlvYViBORr7SoGQXljAGKMvrTuEjZXwsyiCZQ0hb/ldPO2qASPasi9/REPRy
 MwJPyHMuXgVIw6O8/zs+D2SB7CsdZqJNoq+nh13ISDiiE09n0YhRoI+xlDyV752nsZ9B
 g8U8ruB8IOq82G5siQEbgMvkc9fHpWnZfOYFOA8rbwUNNzNsxc4gnbKp8xF8shpwQwxm
 AN7OVKVDltR2bTw4hpc1ZH8VRK3+DjJ+bp5b+9E+w59wp2UBY4hrNX8mXReKCG37mq4r
 +DYWDHXLJ4fie8vvScPMDiWjw9q4oFhZtDsw0+xjzrOe1w4qy6MmvXtzVepBGZOEt/nb
 Yxeg==
X-Gm-Message-State: AOJu0YxhvnDg/a79+TSL8o5u3jS9JkLwYZCgkINk1B2OO456l6Tc6pXN
 BPsZjrxTIQ+O6bYmtqjbPIM/6IGLVdrE+ws5t2Mb3NUiKgVe/4U7RVP/4VSRBiVGKv+b9vQZRg5
 KIf8/R7/oyG95
X-Received: by 2002:a05:620a:1590:b0:77b:b1d2:1b82 with SMTP id
 d16-20020a05620a159000b0077bb1d21b82mr6930302qkk.20.1699860070927; 
 Sun, 12 Nov 2023 23:21:10 -0800 (PST)
X-Received: by 2002:a05:620a:1590:b0:77b:b1d2:1b82 with SMTP id
 d16-20020a05620a159000b0077bb1d21b82mr6930293qkk.20.1699860070685; 
 Sun, 12 Nov 2023 23:21:10 -0800 (PST)
Received: from [192.168.0.6] (ip-109-43-177-79.web.vodafone.de.
 [109.43.177.79]) by smtp.gmail.com with ESMTPSA id
 s27-20020a05620a031b00b0076cbcf8ad3bsm1673862qkm.55.2023.11.12.23.21.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 12 Nov 2023 23:21:10 -0800 (PST)
Message-ID: <b92285b4-156b-4a39-baba-ffc2e80e21bf@redhat.com>
Date: Mon, 13 Nov 2023 08:21:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-8.2] test-resv-mem: Fix CID 1523911
To: Eric Auger <eric.auger@redhat.com>, eric.auger.pro@gmail.com,
 qemu-devel@nongnu.org, qemu-arm@nongnu.org, peter.maydell@linaro.org
Cc: clg@redhat.com
References: <20231110083654.277345-1-eric.auger@redhat.com>
From: Thomas Huth <thuth@redhat.com>
Autocrypt: addr=thuth@redhat.com; keydata=
 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
In-Reply-To: <20231110083654.277345-1-eric.auger@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: Cchl2hYPHa05

On 10/11/2023 09.36, Eric Auger wrote:
> Coverity complains about passing "&expected" to "run_range_inverse_array",
> which dereferences null "expected". I guess the problem is that the
> compare_ranges() loop dereferences 'e' without testing it. However the
> loop condition is based on 'ranges' which is garanteed to have
> the same length as 'expected' given the g_assert_cmpint() just
> before the loop. So the code looks safe to me.
> 
> Nevertheless adding a test on expected before the loop to get rid of the
> warning.
> 
> Fixes: CID 1523901
> Signed-off-by: Eric Auger <eric.auger@redhat.com>
> Reported-by: Coverity (CID 1523901)
> 
> ---
> 
> Hope this fixes the Coverity warning as I cannot test.
> ---
>   tests/unit/test-resv-mem.c | 4 ++++
>   1 file changed, 4 insertions(+)
> 
> diff --git a/tests/unit/test-resv-mem.c b/tests/unit/test-resv-mem.c
> index 5963274e2c..cd8f7318cc 100644
> --- a/tests/unit/test-resv-mem.c
> +++ b/tests/unit/test-resv-mem.c
> @@ -44,6 +44,10 @@ static void compare_ranges(const char *prefix, GList *ranges,
>       print_ranges("out", ranges);
>       print_ranges("expected", expected);
>   #endif
> +    if (!expected) {
> +        g_assert_true(!ranges);
> +        return;
> +    }
>       g_assert_cmpint(g_list_length(ranges), ==, g_list_length(expected));
>       for (l = ranges, e = expected; l ; l = l->next, e = e->next) {
>           Range *r = (Range *)l->data;

Reviewed-by: Thomas Huth <thuth@redhat.com>

I'll queue it (unless somebody else wants to take this?).

