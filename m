Received: by 2002:ac2:4c26:0:0:0:0:0 with SMTP id u6csp485938lfq;
        Tue, 8 Sep 2020 03:44:16 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJym1Z2AAk/gbahd5e/15DVWFSHhUJrdLr8HyqN5rsLCKzvo9MNpU5F8rMVGO4ln8QrG10xZ
X-Received: by 2002:a25:b212:: with SMTP id i18mr33816281ybj.148.1599561856658;
        Tue, 08 Sep 2020 03:44:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1599561856; cv=none;
        d=google.com; s=arc-20160816;
        b=KbFIHngLnpJk2i7YWhMTrjvp3oWLkFRT8dxEd5ZloOMbYYXo9foYzlx/Yv8rpx4L4Q
         jdkoX4AcEfk2nBqLVEIOLGV436lwVFuDa1YU7aw5qzlBvAX1g3exVmeCXGt2stZsTpsW
         KLSUqJxWeFLJYkg9AhFNk6JnvwTYpAou7H8pFoMgq9zJ33wCHtUBUUjh5w8aQZpqg/lY
         p/GVuMZIzih1AWRNMVvE3oJ5ab41cyg1OxZSK4c+xO/IJeMq1B7K9RG/5PjGNhX1yFGY
         4+mh2AkSXqJHGpaSHk7nFyfx5SWMF6A3Iv872LByZEL69/JNXHYMiJo9YfL/SXQ55YAA
         c0DA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-disposition:in-reply-to
         :mime-version:references:message-id:subject:to:from:date
         :dkim-signature;
        bh=xeKQhe8sP7klT0wswShjRTS0h4GzqXUbdPER/WgkHUw=;
        b=KUwQ5EBImYYxsIBrvS1okrVqCt7wCj5sQGs7pjr2uDvHRQWXZ+Dj1vHKje9q9kVidU
         IVVvKA9JbGfEo+Z9sxrPW24878y6N4k5B9r20g7AriY43kLtEKvHYzzovydYn3DRI266
         PJKO3fHRZbiG2VQSyyjQiPeJt6lej16pahlQptF/nISUYYoWmWONGGow7qh+AlEFR+Oa
         l0tuIDzrR1KLuouXChPuGHKPEvXRnt40xKxZ1bWSAh/ZAUPY87RyHzQET5r4iSlySHYA
         enylUdwSKbSHeRwiC9dh+fZCa51Rrg8CUXM/hOb+5l8kBvHHyc8hNnAHQqTSRG55IoaU
         3sEw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=ZJR7StRW;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d7si12504170ybj.386.2020.09.08.03.44.16
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 08 Sep 2020 03:44:16 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=ZJR7StRW;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:43698 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kFb6m-0006al-1L
	for alex.bennee@linaro.org; Tue, 08 Sep 2020 06:44:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36734)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1kFb6b-0006aH-ET
 for qemu-arm@nongnu.org; Tue, 08 Sep 2020 06:44:05 -0400
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:57685
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1kFb6a-0002b7-1I
 for qemu-arm@nongnu.org; Tue, 08 Sep 2020 06:44:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1599561843;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=xeKQhe8sP7klT0wswShjRTS0h4GzqXUbdPER/WgkHUw=;
 b=ZJR7StRWUnq96/eBG1ykBu2DqFXYF3oIgGhG7jlTV0WMJM7pnKgpL1jfrWcPFmm4wXrpk4
 oaBDVkIq9q2fI1vuzCb/Ry6lCXg2Uwrz+MWLHyniKe4n8xIHYJ/231Yz+mDD+R10L39YQg
 GYP/O76uGI2a3dxUBHV7Mag/fgolsdY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-405-c-63jmhmM8GSW72nm3txEw-1; Tue, 08 Sep 2020 06:43:59 -0400
X-MC-Unique: c-63jmhmM8GSW72nm3txEw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6CDB910082E5;
 Tue,  8 Sep 2020 10:43:58 +0000 (UTC)
Received: from kamzik.brq.redhat.com (unknown [10.40.192.171])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id ABAA99CBA;
 Tue,  8 Sep 2020 10:43:56 +0000 (UTC)
Date: Tue, 8 Sep 2020 12:43:53 +0200
From: Andrew Jones <drjones@redhat.com>
To: Haibo Xu <haibo.xu@linaro.org>
Subject: Re: [PATCH v2 02/12] target/arm/kvm: spe: Add helper to detect SPE
 when using KVM
Message-ID: <20200908104353.licjxf3rsjhagogq@kamzik.brq.redhat.com>
References: <cover.1599549462.git.haibo.xu@linaro.org>
 <e4a8f10ed4e3379994b7e260ad6ef715512289d4.1599549462.git.haibo.xu@linaro.org>
MIME-Version: 1.0
In-Reply-To: <e4a8f10ed4e3379994b7e260ad6ef715512289d4.1599549462.git.haibo.xu@linaro.org>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=drjones@redhat.com
X-Mimecast-Spam-Score: 0.002
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=207.211.31.81; envelope-from=drjones@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/08 03:00:34
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: philmd@redhat.com, qemu-arm@nongnu.org, richard.henderson@linaro.org,
 qemu-devel@nongnu.org, peter.maydell@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: W5wjVeLQbW+5

On Tue, Sep 08, 2020 at 08:13:20AM +0000, Haibo Xu wrote:
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> Signed-off-by: Haibo Xu <haibo.xu@linaro.org>
> ---
>  target/arm/kvm.c     |  5 +++++
>  target/arm/kvm_arm.h | 13 +++++++++++++
>  2 files changed, 18 insertions(+)
> 
> diff --git a/target/arm/kvm.c b/target/arm/kvm.c
> index 8bb7318378..58f991e890 100644
> --- a/target/arm/kvm.c
> +++ b/target/arm/kvm.c
> @@ -214,6 +214,11 @@ bool kvm_arm_pmu_supported(void)
>      return kvm_check_extension(kvm_state, KVM_CAP_ARM_PMU_V3);
>  }
>

Reviewed-by: Andrew Jones <drjones@redhat.com>  

