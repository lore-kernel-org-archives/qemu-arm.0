Received: by 2002:a19:711a:0:0:0:0:0 with SMTP id m26csp366216lfc;
        Wed, 3 Jun 2020 03:21:43 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxhrQCXUkccjud6iO39ot7kMrTxTE5vo1hCK7Kvze8tbYVEix0KM/3peWmZBYaRLmhz9dzx
X-Received: by 2002:a25:bdd3:: with SMTP id g19mr40014101ybk.5.1591179703623;
        Wed, 03 Jun 2020 03:21:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1591179703; cv=none;
        d=google.com; s=arc-20160816;
        b=mb1CtGCj3fTNbVSH9G/LQJJt8SKznqt9f/E6k+Hu3FmzxpteoRRglMPvY90jrnAIjF
         v1t3X7dAAl4RsI+2TPNJZWdQ2SWppjgVZ51YSL0Blr870aAMgn8TsKR/Ov/Q0lwRODJf
         iij1cS/30LtoYR2rm0u3Za7Rz1ssqCi/Sb2iyPxse1/yQHyX9hzofuSgS0T3+mR3d5Cf
         5/RAm+7gO6Zm/8CGEaKUZT84dj/BgR1Oido37Ndfr7JF3elnSqBgrnAfdaBsmkCqCENR
         sAHQd2wGXyfhAh6qFR++z4NMfwACT36FsBh+bvCqBWm8CSUXxxAygzO6+19HGR1h2XIx
         ZTEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-disposition:in-reply-to
         :mime-version:references:message-id:subject:to:from:date
         :dkim-signature;
        bh=ubCKNk2hK8bGorveHiGhACw/Pb3m7Tjx1HF/i4fxwZI=;
        b=yJZoM9Y05a98BSxdPK8+HYblLea7FramhicSo8aUeqXULruh90kUSomxHqSe8YIQN7
         uNkMS2HUvOBkq87prFH7S9TwS6jY6p+GRWV8++QJnnZOgFipB/g3mOWH5HZhypwiye9S
         v9M8Ftf4/tmn/gkxL+FqkJcpZIj/mbkyWIbcEjsq93enUtv4iyJHPZkf9G5csWZ4ml7d
         YAaVI7ILbbTyRHmkJZqHOhQ6z1vzQ+SukfLwM2IeayVLLkcN4h1gspObtoHzUNcTbN3o
         PWRH0RiW3If+4Yx3mAqeSCPeN85mMB6WAz+L5EX+ooyMnVo43I0UsPSFWocqv+sWa7dA
         YDHw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=KbudaQL0;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j74si1483824ybg.361.2020.06.03.03.21.43
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 03 Jun 2020 03:21:43 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=KbudaQL0;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:33888 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jgQWl-0000NA-0c
	for alex.bennee@linaro.org; Wed, 03 Jun 2020 06:21:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55210)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1jgQWd-0000LX-KB
 for qemu-arm@nongnu.org; Wed, 03 Jun 2020 06:21:35 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:43636
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1jgQWc-0001zK-LS
 for qemu-arm@nongnu.org; Wed, 03 Jun 2020 06:21:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1591179693;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ubCKNk2hK8bGorveHiGhACw/Pb3m7Tjx1HF/i4fxwZI=;
 b=KbudaQL0yk1QYCr1mOfLoa90/Fx9qdxEli9ClnSDEOvlDZYj4ohXY0pK6Sr3R2yyWPLHVr
 2LMowptE9ZQ1OIoS4WFviGrl2h6VkofTtbv78Kxf6zL6swYTiSIEWezdYH5TyCGbug+X9A
 LHAFtWixf9DqUV+UtY/6d04DAfn9FHg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-432-xVa8t5FTNE64-_J_8Hj00w-1; Wed, 03 Jun 2020 06:21:31 -0400
X-MC-Unique: xVa8t5FTNE64-_J_8Hj00w-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2BD9E1005512;
 Wed,  3 Jun 2020 10:21:30 +0000 (UTC)
Received: from kamzik.brq.redhat.com (unknown [10.40.192.141])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 041B65C290;
 Wed,  3 Jun 2020 10:21:20 +0000 (UTC)
Date: Wed, 3 Jun 2020 12:21:16 +0200
From: Andrew Jones <drjones@redhat.com>
To: Auger Eric <eric.auger@redhat.com>
Subject: Re: [Question] Regarding PMU initialization within the QEMU for ARM
 VCPUs
Message-ID: <20200603102116.hbo4kmaitvh2kofl@kamzik.brq.redhat.com>
References: <b2e401cd17fe49d792d09b31bd726e35@huawei.com>
 <20200603093745.dwfb55ny34az7rez@kamzik.brq.redhat.com>
 <fb9cf73c-e94b-b7f9-1d11-dc0353dd3996@redhat.com>
MIME-Version: 1.0
In-Reply-To: <fb9cf73c-e94b-b7f9-1d11-dc0353dd3996@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=205.139.110.120; envelope-from=drjones@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/03 01:04:35
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Salil Mehta <salil.mehta@huawei.com>, "mst@redhat.com" <mst@redhat.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
 Igor Mammedov <imammedo@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: xy1nA8usfhun

On Wed, Jun 03, 2020 at 11:59:23AM +0200, Auger Eric wrote:
> Hi Drew,
> 
> On 6/3/20 11:37 AM, Andrew Jones wrote:
> > On Mon, Jun 01, 2020 at 03:04:33PM +0000, Salil Mehta wrote:
> >> Hello,
> >> I could see below within function fdt_add_pmu_nodes() part of
> >> hw/arm/virt.c during virt machine initialization time:
> >>
> >> Observation:
> >> In below function, support of PMU feature is being checked for
> >> each vcpu and if the PMU is found part of the features then PMU
> >> is initialized with in the host/KVM. But if there is even one
> >> vcpu which is found to not support the PMU then loop is exited
> >> and PMU is not initialized for the rest of the vcpus as well.
> >>
> >> Questions:
> >> Q1. Not sure what is the logic of the premature exit and not
> >>     continuing with further checks and initialization of other
> >>     VCPU PMUs?
> > 
> > KVM requires all VCPUs to have a PMU if one does.
> 
> I fail to find where this is enforced? Do you know the place?

kvm_vcpu_set_target(), called from KVM_ARM_VCPU_INIT. It ensures
all VCPUs have identical features selected. The PMU requires a
VCPU feature (KVM_ARM_VCPU_PMU_V3) to be set.

Thanks,
drew

