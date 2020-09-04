Received: by 2002:a19:ad09:0:0:0:0:0 with SMTP id t9csp1685697lfc;
        Fri, 4 Sep 2020 11:32:29 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJykSUUfi4ItjyqEtlcZXtGxUotVRPnte7KMF3aAY8kUuKZZCO/oXgkTstdaMYnYZmn2xbyJ
X-Received: by 2002:a67:ed89:: with SMTP id d9mr6476658vsp.97.1599244349263;
        Fri, 04 Sep 2020 11:32:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1599244349; cv=none;
        d=google.com; s=arc-20160816;
        b=WVblOs+WvX66yh29L0wpM4euYHgArALbR+iXtU7mOyckhXJ6kMh+hgs8ZQy8KIVIDM
         nCVZEiwkOMm1vCb20igRyboudfqykotCLGwhIkU6eGQnQnLHTdOCchk1rOkxJn+uswi+
         8qKgE2Mod/Jl3bq/9xy872cJ1hp6r+q0hPvNDTuw/Q38mAt7zfOnHzfP+so9Yxznn7kM
         OgjrWJQVF5O3h3cB/A1RhrOhgGgbjiSSJbyKUC1s/AQmeZQJXr2luKV7Mr7vBV0p8mBf
         wn+XncjGbLZ2/pV1AcYvZh115n9/lFdbAJGJQKiYlm9dmSP2QirQI1qgH1+rHb05231o
         TngA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-disposition
         :content-transfer-encoding:in-reply-to:mime-version:references
         :message-id:subject:to:from:date:dkim-signature;
        bh=vzpqcPteGfr6abqNT9T6vmLthKYLeGhaKGRpVY103II=;
        b=AGg4eL03LCc2jgNh2QNHT0ilu8uKpeje6te77zIeLE4aZbS1Ke7Zk5iAcG1F18TBxn
         uKQdx3vBy4DSn1tae9O6be04TnN6hvHCb948/Dz8YW8xyBT+u0yfol5rOKGyj8uQU0nD
         w3PJ8Rm5i7PXcozJ+rHxczeNo4ZOOYWT5mFUyXiw4SyaU5tjJ2H05WNP0dOm6oMyWi4E
         5e/r0U9NqY1oIgPzVCcHxOgtNF1WgOOyUsuPPnnP5SEWudXgesX67pav9E3DGRVTG0Uw
         LhAg8KB0blrGpUWal3hpmGPQMCGttsRrdPz5YPjk9rIZp/r9Nb/wl5wESWqjpV/+7jdb
         Lw9Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=aQadNydv;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p3si2041402vsf.270.2020.09.04.11.32.29
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 04 Sep 2020 11:32:29 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=aQadNydv;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:37570 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kEGVg-0004Qf-Ie
	for alex.bennee@linaro.org; Fri, 04 Sep 2020 14:32:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33952)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1kEGVX-0004NH-NI
 for qemu-arm@nongnu.org; Fri, 04 Sep 2020 14:32:19 -0400
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:52263
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1kEGVW-0004oA-4p
 for qemu-arm@nongnu.org; Fri, 04 Sep 2020 14:32:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1599244337;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vzpqcPteGfr6abqNT9T6vmLthKYLeGhaKGRpVY103II=;
 b=aQadNydvff9dpsEYQT8zOUD28/Da17Ht3pqj8uMJOVbt6PFUbNR3GzdyFIgtEEjsSXmWDD
 5ualKC2nCpu8CSB5RDCyhKpDAg9QJtxeF1Pjq8MFsNX/qvog1qzqytTxfR257cYYngHNUy
 jDm2EFmKjHXShC08oA4hlWIqAjQlsh8=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-212-oHKV-iK5Od6f9Bjd8RlPUg-1; Fri, 04 Sep 2020 14:32:13 -0400
X-MC-Unique: oHKV-iK5Od6f9Bjd8RlPUg-1
Received: by mail-qk1-f200.google.com with SMTP id 139so4041714qkl.11
 for <qemu-arm@nongnu.org>; Fri, 04 Sep 2020 11:32:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=vzpqcPteGfr6abqNT9T6vmLthKYLeGhaKGRpVY103II=;
 b=ci6Uek5Lsaim8RFGbF7jS6yo2p09StTx8n60YVzlyAopdqk+mLQ0aaJqnY/fkTL6ti
 5OuuWdeoW4uNOZIjO346bZcF0UYBhmJn421fIq3JEJIB0ptmvy322PKv71Yc5nJZTwz/
 cYgHOln4oZww8ec1UhJIRCXppREwnY4RvvSsdUpmunxCtHlmJd7+tK/UpymPvItT1GvD
 RqLqxoDxLzoMfbM48kGHSKDy+Yams9bhfArtGYSraIKpzHbrSc4zuCUfSZxazRHZoGiH
 fcfZoTLBcFwyUu2SRq1TUE2q7gyfFiLgVAPzyHEov15f8KqxLiTY3f9CpkqoSkiUEDso
 Ah8Q==
X-Gm-Message-State: AOAM533KV3U37hHNvucg9xBwqEw36aQ7UqOS8vPFbthCL+qhEwoGSuyw
 7+tsJVw0XrySmAs0vH2VbIaUZi6bcW0nzP2Z4qayb6XUdT6un7ho/Di+0bbG64SATGN8cTWaTu0
 fHM7H0zudSzNe
X-Received: by 2002:a37:a09:: with SMTP id 9mr9640623qkk.258.1599244333096;
 Fri, 04 Sep 2020 11:32:13 -0700 (PDT)
X-Received: by 2002:a37:a09:: with SMTP id 9mr9640592qkk.258.1599244332727;
 Fri, 04 Sep 2020 11:32:12 -0700 (PDT)
Received: from xz-x1 (bras-vprn-toroon474qw-lp130-11-70-53-122-15.dsl.bell.ca.
 [70.53.122.15])
 by smtp.gmail.com with ESMTPSA id g123sm4909284qkd.127.2020.09.04.11.32.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Sep 2020 11:32:11 -0700 (PDT)
Date: Fri, 4 Sep 2020 14:32:10 -0400
From: Peter Xu <peterx@redhat.com>
To: Eugenio =?utf-8?B?UMOpcmV6?= <eperezma@redhat.com>
Subject: Re: [PATCH 4/5] intel_iommu: Skip page walking on device iotlb
 invalidations
Message-ID: <20200904183210.GA148776@xz-x1>
References: <20200625191651.5817-1-eperezma@redhat.com>
 <20200903161446.29615-1-eperezma@redhat.com>
 <20200903161446.29615-5-eperezma@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20200903161446.29615-5-eperezma@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0.002
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Disposition: inline
Received-SPF: pass client-ip=205.139.110.61; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/04 14:32:17
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Yan Zhao <yan.y.zhao@intel.com>, Eduardo Habkost <ehabkost@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Juan Quintela <quintela@redhat.com>,
 =?utf-8?B?SGVydsOp?= Poussineau <hpoussin@reactos.org>, qemu-devel@nongnu.org,
 Eric Auger <eric.auger@redhat.com>, qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
 Avi Kivity <avi@redhat.com>, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 Richard Henderson <rth@twiddle.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: lkuhvJvdPlOC

On Thu, Sep 03, 2020 at 06:14:45PM +0200, Eugenio Pérez wrote:
> Although they didn't reach the notifier because of the filtering in
> memory_region_notify_iommu_one, the vt-d was still splitting huge
> memory invalidations in chunks. Skipping it.
> 
> This improves performance in case of netperf with vhost-net:
> * TCP_STREAM: From 1923.6Mbit/s to 2175.13Mbit/s (13%)
> * TCP_RR: From 8464.73 trans/s to 8932.703333 trans/s (5.5%)
> * UDP_RR: From 8562.08 trans/s to 9005.62/s (5.1%)
> * UDP_STREAM: No change observed (insignificant 0.1% improvement)
> 
> Signed-off-by: Eugenio Pérez <eperezma@redhat.com>

Reviewed-by: Peter Xu <peterx@redhat.com>

-- 
Peter Xu

