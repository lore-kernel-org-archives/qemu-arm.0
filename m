Received: by 2002:a19:e212:0:0:0:0:0 with SMTP id z18csp741726lfg;
        Thu, 19 Aug 2021 15:53:29 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxOs/9SEaJAHbp3QufGgzp0gQudrZUKw3MZEM5TCK+B6lupGWe1yZB0NK32I5ooS8OycVtn
X-Received: by 2002:a02:8549:: with SMTP id g67mr6348770jai.73.1629413608937;
        Thu, 19 Aug 2021 15:53:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1629413608; cv=none;
        d=google.com; s=arc-20160816;
        b=I16GycmTrnCJune7vLuWJra1t/a6AcqG1VULNPYsgdg3W50IpNrFGoK931eJ0IGRY6
         DDQQUOB5fFHI3JwJbqFSxvbwwgbqbmyuYL0hmkpjUlN+efNX0CDjBdrykqMp4oemVz2Y
         +HU0s7uOIgm/RitYxuTVT6DxLvRIP3edYCo9rB4HyZ6DRNb034lHX4mVyOraA89uqXIX
         2WD7H1/LtXhfDze/0zH9JZjTRMTbs46nKXr77cg5CRz+F5uhtShSo97E7hxcuVzrp9g+
         uPHCH5TTnMVaZGRSwSXxfaoZXyi55JXXcj9NJsS6ZpomUPI7zgSdBvtcb3tJZexWv9gX
         x9Xw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=g4oHSq3D3/aszrGiK5fX4TKEs3uTF+2UfVH/knIwM/w=;
        b=KNEa4uOmoXNvG66xsHXg/mRrj2eLcTkSTTLMzmigHnV37VQx43S6wZTbBloEeFy/dC
         ElmLrdTj9UOR0wPX+o+0Mkydsz5Sw5gxfluiUllyKSoZpDcJ4hYJN8ufVec91iwIHUfR
         JTjCiuvPCcvYTCDFXSF83n8nT96s7yegZ2y0FObjZGvaJ3exvzpDDrR/CTdd8N69N8p5
         GQgEVvVUdbGBQAJ82QcoIAnlGs/Wb0awzCKdvpEk7hJOs8dM7mMC8Vnj3FmEEP1mniNn
         dWLH6/64J18j8YZAlthnc6Kl60+GexJ5Wb4PEc93r0JX9cx36/HZKGLZvSiF1tmH1EhT
         DVZg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=cFitx9+m;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id r25si4358279ioh.63.2021.08.19.15.53.28
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 19 Aug 2021 15:53:28 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=cFitx9+m;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:45816 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mGque-0006RI-8A
	for alex.bennee@linaro.org; Thu, 19 Aug 2021 18:53:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57564)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mGqtQ-00046I-UT
 for qemu-arm@nongnu.org; Thu, 19 Aug 2021 18:52:12 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:50793)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mGqtP-0008Ak-Eq
 for qemu-arm@nongnu.org; Thu, 19 Aug 2021 18:52:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1629413530;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=g4oHSq3D3/aszrGiK5fX4TKEs3uTF+2UfVH/knIwM/w=;
 b=cFitx9+mETyYMPSRBPv50pWBjBroQAviyn8jsEYyMBO4iHTNkphgUTEi2tY2bs9eBFl9Y4
 7pEJRI2hvazJ65Mg7Wk6FQD8JaMAd05iFSnB5L9KzaKYltDWCmNq1Hgi+nG/tQIh+YEBmQ
 L+I1SbfFNm6sYxgNERMp3FePP1wUJVM=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-13-qJr1CJNZNWqKnUOUeHyspg-1; Thu, 19 Aug 2021 18:52:07 -0400
X-MC-Unique: qJr1CJNZNWqKnUOUeHyspg-1
Received: by mail-wm1-f71.google.com with SMTP id
 o8-20020a05600c378800b002e72385f8e7so88029wmr.8
 for <qemu-arm@nongnu.org>; Thu, 19 Aug 2021 15:52:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=g4oHSq3D3/aszrGiK5fX4TKEs3uTF+2UfVH/knIwM/w=;
 b=IZd1SMiIKb/wNz5WAl3qdZS+NuAHPaRV1fpkNA1E/tu0IdBvHv4iv77EvunWFGyQgI
 T4cIq1MskO/jUFhlsgjBKKtySQ34vnRsXTlwxfKDEwnYcqKb9WBIyg14KDrI+B/8VmMa
 5v/QTyvb3d1t+wqp40VOSI9WfrYOR/KPeiJSTwoeITjCDKE0rSUvFDn8LbEIw8hMxJow
 zT6xMcvAEXi2WVlm9GgMvvgoZBFcN336gmM9suaXRXbvl79K9o9bg/fWkBO2yTnAQ7wY
 uQHc2qFSWDNJpyN9O+DJA8CDyT6VcRuP62DwIgvNKj4ZIoJ9eAN8QAcZ4X/t5vqsmB7M
 0mNA==
X-Gm-Message-State: AOAM530IIm+s5tzkvkp6uaJA3pilgSzjuZ+wevjj1Q0m0vhCqadXYXdZ
 aOvq0a5da8itw5nrRl81O2IN8Jm+OdnpiWYRU0VV7tG5TpeIcS3gkc1S3wdIa4my4r1rvEreVBu
 CguIEJwGgWH8z
X-Received: by 2002:a05:600c:a44:: with SMTP id c4mr789538wmq.83.1629413525958; 
 Thu, 19 Aug 2021 15:52:05 -0700 (PDT)
X-Received: by 2002:a05:600c:a44:: with SMTP id c4mr789516wmq.83.1629413525620; 
 Thu, 19 Aug 2021 15:52:05 -0700 (PDT)
Received: from [192.168.1.36] (163.red-83-52-55.dynamicip.rima-tde.net.
 [83.52.55.163])
 by smtp.gmail.com with ESMTPSA id g6sm3856358wmq.14.2021.08.19.15.52.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 19 Aug 2021 15:52:05 -0700 (PDT)
Subject: Re: [PATCH 2/4] target/arm/kvm64: Ensure sve vls map is completely
 clear
To: Andrew Jones <drjones@redhat.com>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org
References: <20210819193758.149660-1-drjones@redhat.com>
 <20210819193758.149660-3-drjones@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <7a864706-6445-760b-efd8-0026892c00f8@redhat.com>
Date: Fri, 20 Aug 2021 00:52:04 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210819193758.149660-3-drjones@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -53
X-Spam_score: -5.4
X-Spam_bar: -----
X-Spam_report: (-5.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.591, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: peter.maydell@linaro.org, richard.henderson@linaro.org,
 ishii.shuuichir@fujitsu.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: YbUTSTfs2sBS

On 8/19/21 9:37 PM, Andrew Jones wrote:
> bitmap_clear() only clears the given range. While the given
> range should be sufficient in this case we might as well be
> 100% sure all bits are zeroed by using bitmap_zero().
> 
> Signed-off-by: Andrew Jones <drjones@redhat.com>
> ---
>  target/arm/kvm64.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>

