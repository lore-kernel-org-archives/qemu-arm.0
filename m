Received: by 2002:a19:5205:0:0:0:0:0 with SMTP id m5csp3879382lfb;
        Mon, 30 Aug 2021 01:41:28 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzTC+nf0BzFwbCrV1Q3cuVZKxzOTQX1TCNXWdTO4BoZSYch6BLXI9VntoET1VBS10+M/4Xv
X-Received: by 2002:a25:be02:: with SMTP id h2mr22172866ybk.91.1630312888396;
        Mon, 30 Aug 2021 01:41:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1630312888; cv=none;
        d=google.com; s=arc-20160816;
        b=IeV0T2OkExTqNmWnMwo8AhDxDv8RixzIJUup5O/qeGrFUkeOPtNhVKKKEOJsE/jNwg
         D+qd7hZQnnBsadMmf+EtbY4Bn8gc+D2XLI4z99afcV8ZWT6s90ppFuKreYLD7uBMFPai
         iRedBh+KYlno6fw1XRIQcra9zObqSrduhTZFvGIPrzlQGaxH0lGQxbu/PydM41ZXw1/j
         TsGvdxDAI6ZksipbNUrhshcnEj1bTgtoMMCQF+s3qqXuFrUswEz2eXNXG8C3HEFmv+T8
         C5ijwW55AV7abTvs3ZNrFtcTI7OoXIg1i1+TqkGHh0CIk39WXNOoMaW8jNDQL28z0AZ2
         NieQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-disposition:in-reply-to
         :mime-version:references:message-id:subject:to:from:date
         :dkim-signature;
        bh=zbGeAHx9mz3GDIOt+owuKfWc210mNj0q8+VSMNPz+Xc=;
        b=0JkcNatdryyg9vSL4YorYB91Gr2L4R1/9m2YqJd1gyG9A/6Xc9Q6YMSBp8bH58aQ/D
         ke+D5jzCE4HpDf1c5se7/WqRnnnURZVkDIDF2jkTDZUpbmlozYO6CPlkWhYRaCfH1x4M
         5MsYQ+3H5lPOhiulIv2fpV8G+sR7hGtn8fmAngNdLg56nmldTy1QGZNziu4jYuWhK/bj
         Fey5uG4EhFyDzsP3jD84hqunNfG6AhqG5PTa6cqTFK2BOkjDZ8Q7wmfg20jJdMRTnW1t
         jzyrklF+FKWa4Vmj4oBX6hgS2mO7ae8GF2Itx0plfMiwF6NkpTVhk5cm+yW7FC2kZkYt
         fMYg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=CJ+mHrIr;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e14si14234379ybq.328.2021.08.30.01.41.28
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 30 Aug 2021 01:41:28 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=CJ+mHrIr;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:41516 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mKcr9-0007Ib-PW
	for alex.bennee@linaro.org; Mon, 30 Aug 2021 04:41:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38842)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1mKcqw-0007Ei-6j
 for qemu-arm@nongnu.org; Mon, 30 Aug 2021 04:41:14 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:34948)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1mKcqu-00031G-Mk
 for qemu-arm@nongnu.org; Mon, 30 Aug 2021 04:41:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630312872;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=zbGeAHx9mz3GDIOt+owuKfWc210mNj0q8+VSMNPz+Xc=;
 b=CJ+mHrIrokGxR7UVJfKTsG//6Wm9J+OAnqu75LNSf/ZPjvGZN6KtaZk3hoQMzcBfsUm9v4
 R4RbWH3nk/v197DLyOvfuQRzw9qyadGtQTXJk8okSWI3k1Rf2HbVE3YqVY2LHfFri5W6NA
 L8ddUxFT+bACEPGLo3GYO9YNVh8H6zY=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-481-3-bxYVOQNoylm5luYlLtCg-1; Mon, 30 Aug 2021 04:41:10 -0400
X-MC-Unique: 3-bxYVOQNoylm5luYlLtCg-1
Received: by mail-ed1-f70.google.com with SMTP id
 b8-20020a056402350800b003c5e3d4e2a7so6153264edd.2
 for <qemu-arm@nongnu.org>; Mon, 30 Aug 2021 01:41:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=zbGeAHx9mz3GDIOt+owuKfWc210mNj0q8+VSMNPz+Xc=;
 b=FdtXSdGndM3pvloQRzjdurWs1GkQtOwhsMAEUhpgiJsg91SxL3K15C0P/3zj9a4NLd
 AEHvFSAqibuvYIMGM9iiXfOQh6F/kARoDuFBbtbxYd+eCTVO0ujUyvT6NmoUUa3VNyKd
 +SYbjza9oMCj2VkcCuFd7AmNYIGNWADPcFVH8zNrOthBhclmvnO9MSnLMLebJF8nSbS5
 d0qkmpT+yPiQGP7KgRVJLLZW4+oD2LeX4mG5bLTyNFKwIAzrHRPghW7fyAKfhHNMCk1h
 xh02lYVs9K28TYFvZS1eMOMX+lv26UI/mZqqmAMZ8B6pZQifYZ4wuvDJ87xGnxg0KIcO
 CL6A==
X-Gm-Message-State: AOAM532vznP0fSKWQrD8uN5CoAEyaXjqWgxGzQFHNkA3Ena7pHJmRHXM
 jiRN2cexHEOyZzbwq2+bxuv9UzpwrqXlJRfCdndia/e50SQf8PEiTwOoqv2EDT6AnShgtcOjjXV
 ra4orI6JTvaTK
X-Received: by 2002:a50:ed0b:: with SMTP id j11mr22858215eds.97.1630312869394; 
 Mon, 30 Aug 2021 01:41:09 -0700 (PDT)
X-Received: by 2002:a50:ed0b:: with SMTP id j11mr22858207eds.97.1630312869209; 
 Mon, 30 Aug 2021 01:41:09 -0700 (PDT)
Received: from gator.home (cst2-174-132.cust.vodafone.cz. [31.30.174.132])
 by smtp.gmail.com with ESMTPSA id n23sm7302839eds.41.2021.08.30.01.41.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 Aug 2021 01:41:08 -0700 (PDT)
Date: Mon, 30 Aug 2021 10:41:07 +0200
From: Andrew Jones <drjones@redhat.com>
To: Shuuichirou Ishii <ishii.shuuichir@fujitsu.com>
Subject: Re: [PATCH v5 3/3] tests/arm-cpu-features: Add A64FX processor related
Message-ID: <20210830084107.ce43ww5glhtmwor6@gator.home>
References: <20210830082820.2690275-1-ishii.shuuichir@fujitsu.com>
 <20210830082820.2690275-4-ishii.shuuichir@fujitsu.com>
MIME-Version: 1.0
In-Reply-To: <20210830082820.2690275-4-ishii.shuuichir@fujitsu.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=drjones@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=drjones@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.393,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: dEvMGH5iCO83

On Mon, Aug 30, 2021 at 05:28:20PM +0900, Shuuichirou Ishii wrote:

nit: A commit message would be nice, even if it's just a simple
sentence expanding on the summary.

> Signed-off-by: Shuuichirou Ishii <ishii.shuuichir@fujitsu.com>
> ---
>  tests/qtest/arm-cpu-features.c | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
> 
> diff --git a/tests/qtest/arm-cpu-features.c b/tests/qtest/arm-cpu-features.c
> index 8252b85bb8..90a87f0ea9 100644
> --- a/tests/qtest/arm-cpu-features.c
> +++ b/tests/qtest/arm-cpu-features.c
> @@ -473,6 +473,19 @@ static void test_query_cpu_model_expansion(const void *data)
>          assert_has_feature_enabled(qts, "cortex-a57", "pmu");
>          assert_has_feature_enabled(qts, "cortex-a57", "aarch64");
>  
> +        assert_has_feature_enabled(qts, "a64fx", "pmu");
> +        assert_has_feature_enabled(qts, "a64fx", "aarch64");
> +        /*
> +         * A64FX does not support any other vector lengths besides those
> +         * that are enabled by default(128bit, 256bits, 512bit).
> +         */
> +        assert_has_feature_enabled(qts, "a64fx", "sve");
> +        assert_sve_vls(qts, "a64fx", 0xb, NULL);
> +        assert_error(qts, "a64fx", "cannot enable sve384",
> +                     "{ 'sve384': true }");
> +        assert_error(qts, "a64fx", "cannot enable sve640",
> +                     "{ 'sve640': true }");
> +
>          sve_tests_default(qts, "max");
>          pauth_tests_default(qts, "max");
>  
> -- 
> 2.27.0
>

Reviewed-by: Andrew Jones <drjones@redhat.com>

