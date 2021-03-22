Received: by 2002:a0c:aac5:0:0:0:0:0 with SMTP id g5csp4755304qvb;
        Mon, 22 Mar 2021 08:47:47 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxIUB+bhGD/z9azn/WosXh/awHQBGsS62A5a7larVuQLi7geo03c22Zrs9/L+080fOw4Dkc
X-Received: by 2002:a6b:650f:: with SMTP id z15mr320309iob.128.1616428067084;
        Mon, 22 Mar 2021 08:47:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1616428067; cv=none;
        d=google.com; s=arc-20160816;
        b=xAg8s2Zk/3Q6Q66DRQFBwIGy2zHq1cT77JEsWOefnOnVkGT/agrGo3Gn1UssvI30Yw
         F4mCf41VVYKzzaJ+UvioK8/HkZEKDZn1B3DEcFH2dy8L7xguVVHU08tIxaXi9ZqxVHbZ
         yxBT4DGDlo5+WJOdMtcrKvbm2FzLwyJFGYWONXUMC34VAnTAePOBDCnwrmP7ar1jj8Tr
         FlvTuwLE1Gb1qrsqxR11A9VqfSfduXX7rw2v7Q1rkEDq9dgVdmaKnXquubxTyMCUeHCM
         shOupDWiicUayp5gKqUBJgGswVtp4qxievhqB6KDiUM8zmguht+Bu14sT+NHu/ufmZGb
         sKhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:user-agent:references:in-reply-to:date:to:from:subject
         :message-id:dkim-signature;
        bh=EDJemio96d8tkoZ6jV/4FbNdtDb7eGAaj0+0SsP6A8Y=;
        b=fcBBNLGPV2taOrR7JPdefw9fR4fEHOO8dxebvlqlNNOdA5ZfVV8LL9NpxrZc1SG0Ee
         gpHzsJAuJ9bJ7NkC1cqGhbsGeYW0FF38R7xkTfnIwK6IHDWSMset6X+nhEVPDhCaJ1DC
         KC+tSXM1jMWfoz5s81L4RvwtCFzsyeXX4CJaiBwjI1kgMvXhM4jvY2RolsARsTs81kte
         r8NPESbXcT4y3V+NL2sWliXDpRqs5EcRq0I3Qopmpt37QUKqJditQ25HWKaSUZ7Cs3KB
         8j/7z8dLEc0XOVQEI+t2udPJ5EgBMksf+lXjmpoOp74xoSkdMp7omgsqFZcYUYXChyQH
         dQ5Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=E+EY72y2;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m18si9390123ili.98.2021.03.22.08.47.47
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 22 Mar 2021 08:47:47 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=E+EY72y2;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:60400 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lOMmQ-0006QA-E4
	for alex.bennee@linaro.org; Mon, 22 Mar 2021 11:47:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38350)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <abologna@redhat.com>)
 id 1lOMir-0003Le-5Q
 for qemu-devel@nongnu.org; Mon, 22 Mar 2021 11:44:05 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:31928)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <abologna@redhat.com>)
 id 1lOMio-0006P9-L1
 for qemu-devel@nongnu.org; Mon, 22 Mar 2021 11:44:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616427841;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=EDJemio96d8tkoZ6jV/4FbNdtDb7eGAaj0+0SsP6A8Y=;
 b=E+EY72y2R47Ib15l42o68HHh7RfDRsF42Q4fp+1UdW+lA0JLz6SVr/kxba/tyOnbBguciV
 wQUGnMDh1Eu4sBfbaU80fuotgid1O734XzGPQLTi0qaqHNS+83mLkN2zjQRqB43cDkpZ/b
 PJg2f1wHJfSTV6BfbeLKGfe6Xopa+sg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-370-ED0fzuqpOAWBk7JqJM4ddw-1; Mon, 22 Mar 2021 11:42:30 -0400
X-MC-Unique: ED0fzuqpOAWBk7JqJM4ddw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1DDF38018A1;
 Mon, 22 Mar 2021 15:42:29 +0000 (UTC)
Received: from harajuku.usersys.redhat.com (unknown [10.40.195.160])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 4663C60BE5;
 Mon, 22 Mar 2021 15:42:25 +0000 (UTC)
Message-ID: <4b35e1dc2c6a2af117542eca6571ddf1e261fe10.camel@redhat.com>
Subject: Re: [PATCH 0/3] target/arm: Add nested virtualization support
From: Andrea Bolognani <abologna@redhat.com>
To: Haibo Xu <haibo.xu@linaro.org>, qemu-devel@nongnu.org, qemu-arm@nongnu.org
Date: Mon, 22 Mar 2021 16:42:23 +0100
In-Reply-To: <cover.1616052889.git.haibo.xu@linaro.org>
References: <cover.1616052889.git.haibo.xu@linaro.org>
User-Agent: Evolution 3.36.5 (3.36.5-2.fc32)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=abologna@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=abologna@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: peter.maydell@linaro.org, drjones@redhat.com, philmd@redhat.com,
 richard.henderson@linaro.org, pbonzini@redhat.com
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: skyB2JvC5YbN

On Mon, 2021-03-22 at 10:07 +0000, Haibo Xu wrote:
> This series add support for ARMv8.3/8.4 nested virtualization support
> in KVM mode. It's based on Marc Zyngier's kernel KVM patches[1], and
> has been tested on a FVP model to run a L2 guest with Qemu. Now the
> feature can be enabled by "-M virt,accel=kvm,virtualization=on" when
> starting a VM.

Why the need to enable this explicitly? AFAIK, that's not necessary
for any other architecture: on x86, you just need to make sure you're
using '-cpu host' and pass a parameter to the kernel module.

Even assuming this can't be enabled transparently, wouldn't its
availability it be controlled by a CPU feature flag, similar to what
already happens for SVE and PMU, rather than a machine type option?

That would also address the discoverability issue: unless I'm
mistaken (which I very well might be :), with the current
implementation there's no way to tell whether nested KVM will be
usable short of trying and seeing whether QEMU errors out.

-- 
Andrea Bolognani / Red Hat / Virtualization

