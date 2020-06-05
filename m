Received: by 2002:a19:711a:0:0:0:0:0 with SMTP id m26csp2551062lfc;
        Fri, 5 Jun 2020 08:24:39 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxXg3JJsJkeBSqcCzomzn7jB9H7ST7+GqijjiOzMjJxeBWIhPNl43td8rp+Tp+wpOuFY10y
X-Received: by 2002:a25:bacd:: with SMTP id a13mr17603787ybk.461.1591370678924;
        Fri, 05 Jun 2020 08:24:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1591370678; cv=none;
        d=google.com; s=arc-20160816;
        b=zi2+a5K9Ohk4JRgvpd5ft3wvzioLwq2Y2Bvn0Evu835PYv6lj+b5eJVzR2snTVSfvn
         tJDxTTzpWP6FjrizInmAmM8/V1ns1mKtHDmlCLauZYaIMva8zqhRIUcE5Fqg6NbcbXd6
         aHmzl4AZOwnfFvp4Zvvw8B4b60E0ABzWrKv5adA/3spCBSTcY1jBwGo/I3R58HY3M/99
         hFMcdlIfGmLL5PuxDs60TOvpya+sZ5HgWciGOBBSH8SD9Vl+Z1N95OThUog5LUy3liGt
         Hbfc7Y8Y+u8OHNprkddpLjvhSZykAe4KckULodbeWmPaw/MqwVwIGfZbmfqmEDQu5Q0K
         BHgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:subject:to:from:date
         :dkim-signature;
        bh=1a4Lc9LJKRWBN97WMw3GxEXZ3GwuV+Hh2ZYz4jH+Czg=;
        b=DoM3Y+ACe0FwqtT44MpRcIMyo688Eea0S8sHCBGflbrmOxwt5QJFHSL0NqqkXayrtr
         1zp1IZy8xV2q4iZPhBX8f2Orpd139SqvNQ0Yy6EN0WbwcsEGzYkXdvqTUecZX2Uhwfbw
         azj0C+1LaRDkNNOKZYpe+v5kcomf1r5rJOKxVj0Z8iViypXuiCMoXAamaPTeZvJ5hoB0
         lT2jAS8fOB0Jf08OrxiDjrAO5cGIqZq0Zf0y4y2I4CO1TwtxYsORGbxErAXns+bq2n1d
         cYGL1JBDuRZf+6LZM/JkZuFdZED4uQpCTfNUkPQgI5CdEFBF0bEGdbw9Vp0UX8QGgTrK
         oPYg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b="Ctioa+V/";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b125si6184167ybg.145.2020.06.05.08.24.38
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 05 Jun 2020 08:24:38 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b="Ctioa+V/";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:38982 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jhED0-0000Kw-AX
	for alex.bennee@linaro.org; Fri, 05 Jun 2020 11:24:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54738)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1jhECo-0000Jy-0r
 for qemu-arm@nongnu.org; Fri, 05 Jun 2020 11:24:26 -0400
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:39354
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1jhECn-0006HM-A4
 for qemu-arm@nongnu.org; Fri, 05 Jun 2020 11:24:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1591370662;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1a4Lc9LJKRWBN97WMw3GxEXZ3GwuV+Hh2ZYz4jH+Czg=;
 b=Ctioa+V/c5F/kRuzVpcV2WBjYajarmi1Ytr5isk6NPEe02NeUq4S3q3G6y4YnGO5wysfCJ
 52mHGI7UfhDrfRUjKslmEmSIctVssJSgLBSdxgmLZYICbEk9cwPWpXaIfDqNVp2eMid743
 zXuQZOxbe80ko65MfSRXwo6uuDgC828=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-221-1e4UGJH1OFWt5bpWnLSZbw-1; Fri, 05 Jun 2020 11:24:18 -0400
X-MC-Unique: 1e4UGJH1OFWt5bpWnLSZbw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 991A21854C44;
 Fri,  5 Jun 2020 15:24:16 +0000 (UTC)
Received: from localhost (unknown [10.40.208.51])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3D91510013C0;
 Fri,  5 Jun 2020 15:24:09 +0000 (UTC)
Date: Fri, 5 Jun 2020 17:24:05 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Andrew Jones <drjones@redhat.com>
Subject: Re: [Question] Regarding PMU initialization within the QEMU for ARM
 VCPUs
Message-ID: <20200605172405.1626979b@redhat.com>
In-Reply-To: <20200603102116.hbo4kmaitvh2kofl@kamzik.brq.redhat.com>
References: <b2e401cd17fe49d792d09b31bd726e35@huawei.com>
 <20200603093745.dwfb55ny34az7rez@kamzik.brq.redhat.com>
 <fb9cf73c-e94b-b7f9-1d11-dc0353dd3996@redhat.com>
 <20200603102116.hbo4kmaitvh2kofl@kamzik.brq.redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=207.211.31.81; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/05 03:40:54
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
 Auger Eric <eric.auger@redhat.com>,
 "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: KfunT9LYj17y

On Wed, 3 Jun 2020 12:21:16 +0200
Andrew Jones <drjones@redhat.com> wrote:

> On Wed, Jun 03, 2020 at 11:59:23AM +0200, Auger Eric wrote:
> > Hi Drew,
> > 
> > On 6/3/20 11:37 AM, Andrew Jones wrote:  
> > > On Mon, Jun 01, 2020 at 03:04:33PM +0000, Salil Mehta wrote:  
> > >> Hello,
> > >> I could see below within function fdt_add_pmu_nodes() part of
> > >> hw/arm/virt.c during virt machine initialization time:
> > >>
> > >> Observation:
> > >> In below function, support of PMU feature is being checked for
> > >> each vcpu and if the PMU is found part of the features then PMU
> > >> is initialized with in the host/KVM. But if there is even one
> > >> vcpu which is found to not support the PMU then loop is exited
> > >> and PMU is not initialized for the rest of the vcpus as well.
> > >>
> > >> Questions:
> > >> Q1. Not sure what is the logic of the premature exit and not
> > >>     continuing with further checks and initialization of other
> > >>     VCPU PMUs?  
> > > 
> > > KVM requires all VCPUs to have a PMU if one does.  
> > 
> > I fail to find where this is enforced? Do you know the place?  
> 
> kvm_vcpu_set_target(), called from KVM_ARM_VCPU_INIT. It ensures
> all VCPUs have identical features selected. The PMU requires a
> VCPU feature (KVM_ARM_VCPU_PMU_V3) to be set.

perhaps add a check at cpu_preplug time to ensure that it's so before cpu is create
instead of much later FDT initialization?

> 
> Thanks,
> drew

