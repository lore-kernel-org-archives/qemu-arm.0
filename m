Received: by 2002:a19:ee0d:0:0:0:0:0 with SMTP id g13csp464133lfb;
        Wed, 28 Apr 2021 03:41:58 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxkuhWPb6b5OQXfa+pMAJE1uy1mCv8BSf5hs1/0ijBvUCk+0i500w1tcMlN7EhdTvDzTtIR
X-Received: by 2002:a1f:1794:: with SMTP id 142mr24341127vkx.25.1619606518027;
        Wed, 28 Apr 2021 03:41:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1619606518; cv=none;
        d=google.com; s=arc-20160816;
        b=h3khGct+tp4iqBhAXGVuDRUdBO2hS/17MbldY6EQ0w6QeLqKWKO8IwY3I7KKJNY+1W
         yW3XOureVAh8ty8NJ00cozjKxAbJJjV1LsplknnqT1hCstjyWmcb9b3dg7qmbdeoqcQI
         RkEAflb3eUmyOUnkEa5yrpHHvGwWaZVu5QCp/ngWaq2dGOUYuhxBeYfty/65NsezVcwq
         oD0Q36ToNaeJAKOcSC8ielDxrG2Wr2K/VEZW4cyzN4LOOHa+IVY17KVwYuWA6iCDGR0C
         xw+JHhVwW5vfTbHt5rkO4JEtNyvWUYy9/H13BWkkL32wq3NcNrKfOqOgaHccUj4deuWh
         HfvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-disposition:in-reply-to
         :mime-version:references:message-id:subject:to:from:date
         :dkim-signature;
        bh=wVr1BRcenpjzOiZ9xw/vOlWRBXUlFYm0CmJkb4xTAB0=;
        b=AFHVkFhwMRPbhjKu6Dkt0CSf7HzXCotTHylyrEYhcHWyKXPeNso5VStP9KYXrZcw46
         4eOb/6WP8bIZnuog/eWLH8UpuQh6WiFHL8SKUv9Q9EXnVN7xu0v+kzr6pkjSPGcDFhxq
         fwuIU1d5AU01ToK0cX+FezmnAafkjB6ri6Nggg9XEwFHQLuYDPw3TWK8YUNB+0YdYg1r
         74eVQ6pDp1IWFsQE4rBRmMkLPsoG7+o8CBoP3BwaUQBsJqUP5Q4yoZTVLY8EC5aIHMmB
         fScCR0IRzqoPS2y5BUHZQujFecOovPREsSExBnEqcDFk9ezk3z89ZJGlBoQvBMg4Il/M
         q9MA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=Iu0fSdE6;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a2si3069543uaf.205.2021.04.28.03.41.57
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 28 Apr 2021 03:41:58 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=Iu0fSdE6;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:47748 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lbhdl-0000qQ-Dp
	for alex.bennee@linaro.org; Wed, 28 Apr 2021 06:41:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59654)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1lbhdY-0000qK-JL
 for qemu-arm@nongnu.org; Wed, 28 Apr 2021 06:41:44 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:38591)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1lbhdV-0001hK-7Z
 for qemu-arm@nongnu.org; Wed, 28 Apr 2021 06:41:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619606497;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=wVr1BRcenpjzOiZ9xw/vOlWRBXUlFYm0CmJkb4xTAB0=;
 b=Iu0fSdE6BHYiA6n6gIdIIuUuH5BmqRKQopbiBUbOV1BOhR0f9vMxcZUDMWg41Yqg3I4wQL
 7/zl3t0kT9k3Ic3fjIK5Q9CDhH9hRFHTdp04KNeQSSGqsTK8foP2YMUW/zFVpkjD61+/pf
 sMn/FJl4gKQZE31v6dI+I2O2S6n1n5c=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-599-XVmJ5ENHN3-a0VglYEo_4Q-1; Wed, 28 Apr 2021 06:41:33 -0400
X-MC-Unique: XVmJ5ENHN3-a0VglYEo_4Q-1
Received: by mail-ed1-f72.google.com with SMTP id
 c15-20020a056402100fb029038518e5afc5so19145589edu.18
 for <qemu-arm@nongnu.org>; Wed, 28 Apr 2021 03:41:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=wVr1BRcenpjzOiZ9xw/vOlWRBXUlFYm0CmJkb4xTAB0=;
 b=lVN92X55UUlMHfakZDsfqInf6d7mIF6XOFcBpCyxjUelf1du7o2S8h4oK7DJzMKVb4
 RfenZWI4/62pghRSvY3f4I2QvZnYEGLhMlkfwtrfyy91XjxJDTGTcPcbcObKNQ+GjGOw
 kBEqSJWeq9NE7RjEdZmu1v7g+8uapEPxCxwtnNserR4OMKdVj3bvgXLujmtXUsDF8lA2
 wAf77GlLbGmh+k1jCRybT/FhIcb5tKoK+6gynlYxlaUD3yHcP/N+JbDvtnI571dX5zYv
 1XkXDIBVx836hCdWUWky9g6ruxuq2vYiA12vE+ZKLaPj+mMfdsvYFuDiVazrco6F41uN
 I9Rw==
X-Gm-Message-State: AOAM5310aol9zfH7UzeTyfepl9xCg2YcYnGWjfVqPS4hVR2JHuxHQ+Hb
 htq0PVqIB4lt4xFkChZKUhVhx3THVUNJTJKkaaGH7wkQZzO0kkBxLYUByvxtQeqhi6YF6iQGtBp
 RRJzIPNQaIivs
X-Received: by 2002:a17:907:a044:: with SMTP id
 gz4mr12244791ejc.55.1619606492602; 
 Wed, 28 Apr 2021 03:41:32 -0700 (PDT)
X-Received: by 2002:a17:907:a044:: with SMTP id
 gz4mr12244762ejc.55.1619606492392; 
 Wed, 28 Apr 2021 03:41:32 -0700 (PDT)
Received: from gator (cst2-174-132.cust.vodafone.cz. [31.30.174.132])
 by smtp.gmail.com with ESMTPSA id i19sm1651706ejd.114.2021.04.28.03.41.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Apr 2021 03:41:32 -0700 (PDT)
Date: Wed, 28 Apr 2021 12:41:25 +0200
From: Andrew Jones <drjones@redhat.com>
To: Yanan Wang <wangyanan55@huawei.com>
Subject: Re: [RFC PATCH v2 3/4] hw/arm/virt-acpi-build: Add cluster level for
 PPTT table
Message-ID: <20210428104125.tnj53dpohoffdjmu@gator>
References: <20210413083147.34236-1-wangyanan55@huawei.com>
 <20210413083147.34236-4-wangyanan55@huawei.com>
MIME-Version: 1.0
In-Reply-To: <20210413083147.34236-4-wangyanan55@huawei.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=drjones@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=drjones@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.22,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Barry Song <song.bao.hua@hisilicon.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 "Michael S . Tsirkin" <mst@redhat.com>, wanghaibin.wang@huawei.com,
 qemu-devel@nongnu.org, yangyicong@huawei.com,
 Shannon Zhao <shannon.zhaosl@gmail.com>, qemu-arm@nongnu.org,
 Alistair Francis <alistair.francis@wdc.com>, prime.zeng@hisilicon.com,
 Igor Mammedov <imammedo@redhat.com>, yuzenghui@huawei.com,
 Paolo Bonzini <pbonzini@redhat.com>, zhukeqian1@huawei.com,
 Jiajie Li <lijiajie11@huawei.com>, David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Dg3a8ymIBnVp

On Tue, Apr 13, 2021 at 04:31:46PM +0800, Yanan Wang wrote:
> Add a Processor Hierarchy Node of cluster level between core level
> and package level for ARM PPTT table.
> 
> Signed-off-by: Yanan Wang <wangyanan55@huawei.com>
> ---
>  hw/arm/virt-acpi-build.c | 55 ++++++++++++++++++++++++----------------
>  1 file changed, 33 insertions(+), 22 deletions(-)
>

Reviewed-by: Andrew Jones <drjones@redhat.com>

