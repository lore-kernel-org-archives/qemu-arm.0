Received: by 2002:a19:ca48:0:0:0:0:0 with SMTP id h8csp585520lfj;
        Fri, 14 Jan 2022 01:02:53 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwqrxE7dEagWj5AobauWdu8RqmaPPNWELjGsf60GMXgqk032TqNl8+YwQIVNBRRCwybeCnC
X-Received: by 2002:a25:c2c2:: with SMTP id s185mr11628955ybf.6.1642150973563;
        Fri, 14 Jan 2022 01:02:53 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1642150973; cv=none;
        d=google.com; s=arc-20160816;
        b=Hd3HtTUOCQkPZ7jbjySJYjL9ubbvNFmhlwyyBxFvl8G2R6a/xLtwnEWt+99v415buu
         aAEqI+JJZSC0rDDBUCrkm8e+ORq9PyxscXyhMY0BHnPrnVmq4eIOzkMbRBYyxs/30BBR
         tuN/f5lCwycHYw9+rabEaDgsLtDAqF67Gj5eIXjpIxbWWeDo6q3Y8SDVXd6RWplObLxg
         47rCPSR/ON/zrxikSkZDLSGvBGSFYG0U/R07XOMhqFQXUnY5Dm96r1XdvGCTiZEfCy9r
         rhemGo79tLseb9IYij57dMvY0VNSozRtq+C++IjdpBnABSI/kKTh+JrC5i1dzDO/IV8q
         SOaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:from:references:to:subject:user-agent
         :mime-version:date:message-id:dkim-signature;
        bh=kDgNQF3dl6EShUbLAg5jJJwDYjgeWjoB2r9bQCTvVPo=;
        b=rdlitcNb9CURn+QWliQfj+HtPM+cgmhSiti8sKLtPVSBDUPYXLdWBD/7E58vVO7fKE
         JoFYXnI7EQOVsZB+wrY9wecBmrK/XpYBy780CXP/7SxtXMTfWmkaweaXibpvto4yrarz
         Rmtkh9kFbVNEQ1BC3R8unFvVwhyzvkPLA792Sfizib14KDCqyxyIt/Q9cU22bdVawNfu
         FVP47RwA6GsdCL9RYvLQ8b6z5WT7JmAlY+sgIWB0M6EMtgPOyDLNbzwm332sh4bxEXIy
         SP0i7Xho6JLolHS4pktjIvWCnaGT4pgLr/H80nX5D4Xgvdq7ZwO0jjET8OE5q0zNFkV5
         Zzfg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=K8YypLdS;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n69si2083421yba.455.2022.01.14.01.02.53
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 14 Jan 2022 01:02:53 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=K8YypLdS;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:40468 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1n8ITz-0001N8-5R
	for alex.bennee@linaro.org; Fri, 14 Jan 2022 04:02:52 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43728)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1n8IPH-000671-Oa
 for qemu-devel@nongnu.org; Fri, 14 Jan 2022 03:58:00 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:39852)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1n8IPF-0000hH-Tk
 for qemu-devel@nongnu.org; Fri, 14 Jan 2022 03:57:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1642150677;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kDgNQF3dl6EShUbLAg5jJJwDYjgeWjoB2r9bQCTvVPo=;
 b=K8YypLdS6hZBk7dSp9m+ohpk3CelMQe1u/Xs6w5FKqKPyG4BQJUEyQHe/YY7Jw62xeDjBo
 BMrOzdE5GCys3P+ZBzHuyH1+erYJglR10DeeLpH1wk0BOodLGmB2BcvXRw8obVmVhoU0F7
 TuPlHq4jKvF1cJn4txoMLEbWWC7G71Q=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-439-eT_0V52ZO9Gn1s9sG1I98w-1; Fri, 14 Jan 2022 03:57:56 -0500
X-MC-Unique: eT_0V52ZO9Gn1s9sG1I98w-1
Received: by mail-wr1-f70.google.com with SMTP id
 n4-20020adf8b04000000b001a49cff5283so1561976wra.14
 for <qemu-devel@nongnu.org>; Fri, 14 Jan 2022 00:57:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=kDgNQF3dl6EShUbLAg5jJJwDYjgeWjoB2r9bQCTvVPo=;
 b=I1ThmXBkNsRdeGkFGPudy+sg+GtZ6BYqp+rRuoLzb5sdRSyLSjSF0TXI9SGOQCuMJP
 RgDBpdotqQlw8W1xg5A+bIyxGzZ6xDWeo3+bqAXtva/Xn489mpku4jpV608jwqiRjddi
 30/N2TgilhE/XoS+ZyRiE8ibSbR8Br0Oy50BbvWy5HxWYyItBcrYw2ItyUj/1xGDQxin
 swBJ/fO9kgnnZjAaiPH9I4OwNycRIQUcz1hdy2+TOt8w7MKPeSr2aNxKBO9nXrvLyj5v
 75cOQMTFCS/FXWkPGnmDsJlBmZLnUsQPB5ueaKx410HUicZ0QaO5kiZEnWT3ZtNiUaiZ
 WSxQ==
X-Gm-Message-State: AOAM530hwNZrLJkYvxIGXAG4kJTcNWKdI/0wH9OujawAN0JQLFbjfxPW
 L7ziJHkrU9N1BNQVZohremUgdkgAyRn6CamssKGuembH/qauAKrTLqjiHk29ON1K9DNTLrglEEl
 FLWvEpKsibjYiESw=
X-Received: by 2002:a5d:5848:: with SMTP id i8mr7342181wrf.398.1642150675202; 
 Fri, 14 Jan 2022 00:57:55 -0800 (PST)
X-Received: by 2002:a5d:5848:: with SMTP id i8mr7342171wrf.398.1642150675054; 
 Fri, 14 Jan 2022 00:57:55 -0800 (PST)
Received: from [10.33.192.205] (nat-pool-str-t.redhat.com. [149.14.88.106])
 by smtp.gmail.com with ESMTPSA id k31sm3706381wms.15.2022.01.14.00.57.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 14 Jan 2022 00:57:54 -0800 (PST)
Message-ID: <56092f82-494c-acf8-886c-f49dc1a5c874@redhat.com>
Date: Fri, 14 Jan 2022 09:57:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH 4/6] tests/qtest/vhost-user-blk-test: Setup MSIx to avoid
 error on aarch64
To: Eric Auger <eric.auger@redhat.com>, eric.auger.pro@gmail.com,
 pbonzini@redhat.com, lvivier@redhat.com, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org, peter.maydell@linaro.org, mst@redhat.com,
 david@gibson.dropbear.id.au, clg@kaod.org
References: <20220110211915.2749082-1-eric.auger@redhat.com>
 <20220110211915.2749082-5-eric.auger@redhat.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20220110211915.2749082-5-eric.auger@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.595,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: jean-philippe@linaro.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 5864TmKR3pk5

On 10/01/2022 22.19, Eric Auger wrote:
> When run on ARM, basic and indirect tests currently fail with the
> following error:
> 
> ERROR:../tests/qtest/libqos/virtio.c:224:qvirtio_wait_used_elem:
> assertion failed (got_desc_idx == desc_idx): (50331648 == 0)
> Bail out! ERROR:../tests/qtest/libqos/virtio.c:224: qvirtio_wait_used_elem:
> assertion failed (got_desc_idx == desc_idx): (50331648 == 0)
> 
> Setting up and enabling MSIX fixes the issue.
> 
> Also remove the useless libqos/libqos-pc.h header inclusion.
> 
> Signed-off-by: Eric Auger <eric.auger@redhat.com>
> ---
>   tests/qtest/vhost-user-blk-test.c | 16 +++++++++++++++-
>   1 file changed, 15 insertions(+), 1 deletion(-)

Acked-by: Thomas Huth <thuth@redhat.com>

