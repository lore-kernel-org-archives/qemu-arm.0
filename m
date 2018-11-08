Received: by 2002:a5d:6844:0:0:0:0:0 with SMTP id o4-v6csp224495wrw;
        Thu, 8 Nov 2018 06:54:47 -0800 (PST)
X-Google-Smtp-Source: AJdET5ddSTpwG7lR0HuMKPT6dhrqfmzZMWSZ3VM56J9sNhMstrF1x11UNFjOca8hidskVOSVpMWX
X-Received: by 2002:aed:2539:: with SMTP id v54mr4528157qtc.211.1541688887519;
        Thu, 08 Nov 2018 06:54:47 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1541688887; cv=none;
        d=google.com; s=arc-20160816;
        b=PoS3ZZuNWPnnlZGPF3eZtro0I07UGaERPz1enF8fa57ESCXjgQJoX9LmPLDCT6sxKK
         Q7mK7iducPqgRfEeH3RMSQ26WMMCuFxibrRzIyeE+/9SFNxhQryTSZ6QN5dLWwR4Fr0M
         mQ0Z1p5uX2i36aUHraEVOiLVyVuJf5vSi2PSiX91Zdwz+nPhWDI0/ka93Azt/Kr5jIbq
         HoetALoFBn2MmKWSOntL1b6KbeXSNQovtMFc3JFp7TfXMyqJVX+CDAmtHxs/mR33HGMK
         yBI/DL+Bp0kty8hzMpAThORy8naS6SdJh+rSoUzC+UD/NR0wCG/HBhz6n5sHahaAqHCQ
         J3QQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:to:from:date;
        bh=aenuZmuTPqPvvoUHTrbRaaxf9etfeTX86d8f13Gt5kM=;
        b=WJAp3CCtrVSsQYDVqVwURXCBmg5Q5KFT7Z3noJZxY5JDZ55Ex7t0ssACxMHyNDiv/b
         sL2iKqBctQ3KQLCQy2UIi59QLGBsZAqURuIE9T1xqppN9TYfLKsA8913l+mdUCSXnh0c
         vh1CDFOtoRIXAXOyzNP0ElHehqVmU99DQb4T8JTfk+DcjHL4Urc+oG+o7mYXj7x35wNf
         60z+vqGSwpGVoYSguLodSQA73Vn0fSMgPSWF6qo+E15qbTKWNMC4yv6/e8wBfkEepfNA
         6/J9br89Hm5mcNpJeQeJmacl9kG2RyRRoGWRtCoQ/dNdAm8UoXKnaLoXuLqxU4AInvXP
         SXWQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 31si226770qvp.175.2018.11.08.06.54.47
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 08 Nov 2018 06:54:47 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:57217 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gKlhn-0000sp-2V
	for alex.bennee@linaro.org; Thu, 08 Nov 2018 09:54:47 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35599)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1gKlhL-0000rI-Do
	for qemu-devel@nongnu.org; Thu, 08 Nov 2018 09:54:19 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1gKlhD-00035J-N2
	for qemu-devel@nongnu.org; Thu, 08 Nov 2018 09:54:15 -0500
Received: from mx1.redhat.com ([209.132.183.28]:52760)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <imammedo@redhat.com>)
	id 1gKlh2-0002wE-TB; Thu, 08 Nov 2018 09:54:02 -0500
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 584E8307DAA9;
	Thu,  8 Nov 2018 14:53:57 +0000 (UTC)
Received: from localhost (unknown [10.43.2.182])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 75E07105706C;
	Thu,  8 Nov 2018 14:53:50 +0000 (UTC)
Date: Thu, 8 Nov 2018 15:53:48 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: Samuel Ortiz <sameo@linux.intel.com>
Message-ID: <20181108155348.03d368db@redhat.com>
In-Reply-To: <20181108151623.4de26ecb@redhat.com>
References: <20181105014047.26447-1-sameo@linux.intel.com>
	<20181105014047.26447-6-sameo@linux.intel.com>
	<20181108151623.4de26ecb@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.42]);
	Thu, 08 Nov 2018 14:53:57 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PATCH v5 05/24] hw: acpi: Implement XSDT support
 for RSDP
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Eduardo Habkost <ehabkost@redhat.com>, "Michael
	S. Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org,
	Shannon Zhao <shannon.zhaosl@gmail.com>, qemu-arm@nongnu.org,
	xen-devel@lists.xenproject.org, Anthony Perard <anthony.perard@citrix.com>,
	Paolo Bonzini <pbonzini@redhat.com>, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 6ROJzQMrq3H9

On Thu, 8 Nov 2018 15:16:23 +0100
Igor Mammedov <imammedo@redhat.com> wrote:

[...]
>   patch 4: convert arm's impl. to build_append_int_noprefix() API (commit 5d7a334f7)

>            ... move out to aml-build.c
my mistake, generally when we move something out,
we should do it in separate path preferably without any changes to the moved code
so it would be easier to review. So it should be a separate patch.

[...]

