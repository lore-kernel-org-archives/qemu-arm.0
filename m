Received: by 2002:a5d:4301:0:0:0:0:0 with SMTP id h1-v6csp813022wrq;
        Wed, 20 Jun 2018 07:09:01 -0700 (PDT)
X-Google-Smtp-Source: ADUXVKLa9bWn8dShrcuU0ZbrGpdluv5ewZtWz8xrLufUyWwXR/RWZUrtsvK/o01+llY0QMYdFtJe
X-Received: by 2002:a0c:b98a:: with SMTP id v10-v6mr18511393qvf.175.1529503741201;
        Wed, 20 Jun 2018 07:09:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1529503741; cv=none;
        d=google.com; s=arc-20160816;
        b=e5jd/snf5v+BPuYw0DrCy4mI92Zj3aY5Zwj/ZL2qeQgslLHuDJpnKPLQE+HgjsPDdF
         InKFEcRXOhFAQJwqPhUmU12ksZBkKTJ2xe+sSuyW03ffKDQ9/T45sxLXWXYLuKGPP2n/
         h7A8juMvngUaVIq3eHVfTx8901LLx/lJvBgSlhmpEmiPE0uNphkwHqT9ew22A4YuTpqb
         6vCMiPqzPtjxcPFLaZfw6jvOsvyKuSwbYULDDt0j6kGz+/oBR8qKPq4Xvd+KEaQQYO7S
         ZONR+AOBkSNRu/XveAFePoqnWP52dTfmoVo43TR7uW/mKvl/43exaaDH3gbkbjArivkB
         250w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:arc-authentication-results;
        bh=yiskrlHteEMULkBS0kmat0UdbVZ21f2HLQjrRz+dbwU=;
        b=PkiGSYfvK/vRRAEIC8Xri9CkUgpd+h8UHRkNvNp2lj0anMhcnO5lnFdntYzS+qE0fu
         qbxNFj/W8Wi3XkOx6fDYQf+g5EKzUnOBYbwXBAsrHYhmWPTzva6lCe10qXa7vl14ieky
         0CHGcM/w0v4kU8q0pvpztUUrgW22ZGZyNZ9t3afSPqbUrIC3P4FjFs8SpS+pQzAzaIk6
         W2V4Vr8OjmVDK9pm2nri/mPzAv9+pDF9115OJfKfzaFXuvWzka9uKA1NCL8v+n/yya5b
         NNK2pRWg2sPQnPZ6gXnzletzRRXaSAg4ifsCLx5kzBS1O56LHw9ryKuPmMT6wWigaSwR
         jspw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id s126-v6si2396072qkb.19.2018.06.20.07.09.01
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 20 Jun 2018 07:09:01 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:49923 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fVdnA-0006kB-KV
	for alex.bennee@linaro.org; Wed, 20 Jun 2018 10:09:00 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38811)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1fVdmd-0006hV-4Z
	for qemu-devel@nongnu.org; Wed, 20 Jun 2018 10:08:28 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1fVdmc-00050r-9r
	for qemu-devel@nongnu.org; Wed, 20 Jun 2018 10:08:27 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:52976 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1fVdmX-0004zB-T1; Wed, 20 Jun 2018 10:08:21 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 716D840AC6DF;
	Wed, 20 Jun 2018 14:08:21 +0000 (UTC)
Received: from localhost.localdomain (ovpn-117-106.ams2.redhat.com
	[10.36.117.106])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id BED0176E9;
	Wed, 20 Jun 2018 14:08:17 +0000 (UTC)
To: Peter Maydell <peter.maydell@linaro.org>
References: <1529072910-16156-1-git-send-email-eric.auger@redhat.com>
	<1529072910-16156-2-git-send-email-eric.auger@redhat.com>
	<CAFEAcA-wS9oy1JSgpwrCZie9GQaKLOf2wQxZOUtaLfw+HGP_GA@mail.gmail.com>
	<7fc96a3d-f1e2-7ab4-a46d-3d3482cc5e71@redhat.com>
	<CAFEAcA_s+LY-WS20HEi5xSkMRoA313To55kqeiX+GWW2qXq+XQ@mail.gmail.com>
From: Auger Eric <eric.auger@redhat.com>
Message-ID: <85ba1b73-869c-01fb-09f3-d629ef1e5efc@redhat.com>
Date: Wed, 20 Jun 2018 16:08:16 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA_s+LY-WS20HEi5xSkMRoA313To55kqeiX+GWW2qXq+XQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.7]);
	Wed, 20 Jun 2018 14:08:21 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.7]);
	Wed, 20 Jun 2018 14:08:21 +0000 (UTC) for IP:'10.11.54.5'
	DOMAIN:'int-mx05.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'eric.auger@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: Re: [Qemu-devel] [PATCH v2 01/11] linux-headers: Update to 4.18-rc0
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
Cc: Wei Huang <wei@redhat.com>, Andrew Jones <drjones@redhat.com>,
	Ard Biesheuvel <ard.biesheuvel@linaro.org>,
	Marc Zyngier <marc.zyngier@arm.com>,
	Christoffer Dall <christoffer.dall@arm.com>,
	QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
	Shannon Zhao <zhaoshenglong@huawei.com>, Laszlo Ersek <lersek@redhat.com>,
	Eric Auger <eric.auger.pro@gmail.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: d+1Daz12VgiV

Hi Peter,

On 06/20/2018 04:06 PM, Peter Maydell wrote:
> On 20 June 2018 at 15:03, Auger Eric <eric.auger@redhat.com> wrote:
>> Hi Peter,
>> On 06/20/2018 03:57 PM, Peter Maydell wrote:
>>> On 15 June 2018 at 15:28, Eric Auger <eric.auger@redhat.com> wrote:
>>>> commit b357bf6023a948cf6a9472f07a1b0caac0e4f8e8
>>>> Merge tag 'for-linus' of git://git.kernel.org/pub/scm/virt/kvm/kvm
>>>>
>>>> Signed-off-by: Eric Auger <eric.auger@redhat.com>
>>>
>>> What's 4.18-rc0? The upstream kernel doesn't have a tag by that
>>> name and looking at the Makefile the last thing before 4.18-rc1
>>> was 4.17.
>>>
>>> Still, since it is a commit on mainline I guess we're fine?
>> Yes it is post 4.17 and before 4.18-rc1. I didn't know how to call that.
> 
> I've tweaked the commit message to read:
>> linux-headers: Update to kernel mainline commit b357bf602
thank you!

Eric
>>
>> Update our kernel headers to mainline commit
>> b357bf6023a948cf6a9472f07a1b0caac0e4f8e8
>> ("Merge tag 'for-linus' of git://git.kernel.org/pub/scm/virt/kvm/kvm")
> 
> thanks
> -- PMM
> 
