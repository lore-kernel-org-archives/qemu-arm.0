Received: by 2002:a05:6000:88:0:0:0:0 with SMTP id m8csp5375222wrx;
        Tue, 26 Mar 2019 10:49:45 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxbXyI2kchc8XRb0IPcosqR5h5/4H4ub2kbNo/J888kWguk8nWwuK9WoWmNZ0GKNcDZLkF+
X-Received: by 2002:a24:ee4c:: with SMTP id b73mr125072iti.100.1553622584956;
        Tue, 26 Mar 2019 10:49:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1553622584; cv=none;
        d=google.com; s=arc-20160816;
        b=rgWbaprZpOPGkSY5txIDgdXVZlavUMEEqio7uDCuUHfBB+CK1lGVGhzowmbz3nOc5c
         SgUiXlhEMltb3SdQJtaiKWJzNb0ghEx529cpBUwXCV13zB1Zgn7HwPxBEuhbZueK2Rl+
         bqAQDfhG8tyTQikhIuN1o5Uo7dDvBLuVUb1bVjlNys1cfvSCTnQiYZXGf8eMzaHl6Qcm
         DYah3f37+9jiZbbKDP42Ngp+xMITQkxhNrjGc9vDNHiGI1AnnEKaBgM/RnsV+gRHvFbU
         zXzYHZxcJf61NwIZ2lSHMK5BKetoGZCDe/e6bsjUtNF1VS5mX8Y+QogaeO/t5EFUEBYn
         0NYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date;
        bh=W++kU5Evqp+NrHZicWRSppC+oeYfrqQvgeytvgP0zSU=;
        b=UAFuWLNPqEOuLIPvemcSqkrXZXY2/TKoFwhBNum71A7XgTqZ/aXfXjH6IceOVqOD5a
         ot5EqotuZlM21+Xrb5/HnNAKh67YLax8W6kxtK8Scm5lArad2lJlm4h6l3ZhbkQLszdu
         JQUvqe+cL2xfMAH3iqkG0gBj+aS0jyrqXIVJF4q7iHpymXe6GH5ydEFTAjPv3B0rijQa
         bQfjI4fgqQbjH/8sKg4VcKatJeyB2to5HlunQN+VvMXxM/2tgHuMHbK5lqtE4m2MnER9
         d8BB9jV9pRztb3nBLUtAqKFaJ6obZDb9ooOQw03KfDKyJbQxM/hdDsj0Mc4YQRzPECwM
         iffQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u9si7705266itj.75.2019.03.26.10.49.44
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 26 Mar 2019 10:49:44 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:35882 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1h8qCm-0007f3-6c
	for alex.bennee@linaro.org; Tue, 26 Mar 2019 13:49:44 -0400
Received: from eggs.gnu.org ([209.51.188.92]:50145)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <drjones@redhat.com>) id 1h8qCU-0007c9-8C
	for qemu-arm@nongnu.org; Tue, 26 Mar 2019 13:49:28 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <drjones@redhat.com>) id 1h8qCS-0003W6-07
	for qemu-arm@nongnu.org; Tue, 26 Mar 2019 13:49:26 -0400
Received: from mx1.redhat.com ([209.132.183.28]:33860)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <drjones@redhat.com>)
	id 1h8qCR-0003V8-O8; Tue, 26 Mar 2019 13:49:23 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 0BD743092675;
	Tue, 26 Mar 2019 17:49:21 +0000 (UTC)
Received: from kamzik.brq.redhat.com (unknown [10.43.2.160])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0D03D5C72F;
	Tue, 26 Mar 2019 17:49:19 +0000 (UTC)
Date: Tue, 26 Mar 2019 18:49:17 +0100
From: Andrew Jones <drjones@redhat.com>
To: Aaron Lindsay OS <aaron@os.amperecomputing.com>
Message-ID: <20190326174917.ur7hik5fx4kf7l2j@kamzik.brq.redhat.com>
References: <20190322162333.17159-1-drjones@redhat.com>
	<20190322162333.17159-3-drjones@redhat.com>
	<20190326173844.GJ28178@quinoa.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190326173844.GJ28178@quinoa.localdomain>
User-Agent: NeoMutt/20180716
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.43]);
	Tue, 26 Mar 2019 17:49:21 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [PATCH 2/3] target/arm: cortex-a7 and cortex-a15
 have pmus
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: "peter.maydell@linaro.org" <peter.maydell@linaro.org>,
	"qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: aaj2/672AtB0

On Tue, Mar 26, 2019 at 05:38:36PM +0000, Aaron Lindsay OS wrote:
> On Mar 22 17:23, Andrew Jones wrote:
> > cortex-a7 and cortex-a15 have pmus (PMUv2) and they advertise
> > them in ID_DFR0. Let's allow them to function. This also enables
> > the pmu cpu property to work with these cpu types, i.e. we can
> > now do '-cpu cortex-a15,pmu=off' to remove the pmu.
> 
> I'm a little nervous about this one, but PMUv2 isn't fresh enough in my
> mind to have a good reason other than that I didn't consider it when
> writing my recent PMU patches. Do you know if this boots a kernel that
> can detect and use the PMU successfully while thinking it's PMUv2?
>

I didn't try booting a kernel and running perf or anything like that.
It does now run the pmu kvm-unit-tests test though. As this patch is
now in master the test you propose can be done with a latest build :)

Thanks,
drew
