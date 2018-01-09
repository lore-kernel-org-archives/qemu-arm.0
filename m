Received: by 10.28.173.206 with SMTP id w197csp3849852wme;
        Tue, 9 Jan 2018 07:59:29 -0800 (PST)
X-Google-Smtp-Source: ACJfBovxKc8p9XiLyjcwgTBmL84kT02K2YP73gSPd/mJqa7kPuFQaZsWKMr4z/GUr+7N2Gpme005
X-Received: by 10.129.199.68 with SMTP id i4mr14134226ywl.102.1515513569260;
        Tue, 09 Jan 2018 07:59:29 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1515513569; cv=none;
        d=google.com; s=arc-20160816;
        b=MCDAPdUs2vKD25ACPEd1gDNpJIiCBG+PlRe2U8TqWEBeRpYfEfcmCc1DP+pYH31p7G
         QqjW4k0Jw5HBUUjpEZLk1qcLV8kbPgaeAMbld1NG1k35D88KZFyJ6A0evk5e2of1r+ds
         /pLMumBzEDceavovWsnkm48KYbd3YI21rD7XEO6wmaf+ZBqwusWMOO5+sw25rrNuSLLb
         uzeSMtN8eq7UoKBQmlS8Y1aPTz0jGHGvzosLrOwIIUr+KL+Tns+6gIhJIaAmpSoHOyzr
         RLdHLjKkCJNrRb//gbTJLrrqFxiXtv+uvrFqYbvc2lj4Y09CZIxU061ieEqOU+KN5TKP
         swvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to
         :arc-authentication-results;
        bh=JjBg9EMHJsCYsdRucLdKH2nNP4KLDOlf1QO91oCRzYo=;
        b=x2ZoW3dpIedcghf0scdzclt5kIPZqdzVQ8aIuNGlHr/frZY5MNpGQUxvMM2Sg0eVIH
         jmrblC/lPauuxrIh/zg1lze6qN1ErSKy84B7+q1aemCZfcaQmKcI1o6X05FWV5DLDQud
         MN+WKC2k48uUyGz10kVAnrbBRUiAvv5RavfMRTx7TFWqBpumMESvmtTGuXbcX6aYSrQv
         bmdDuTioD6ea4qPj0xtTHkBCfIu2p3Ys6z0FHY6ElSNLCbGUVqX9UFJH7PpXj4nzP97u
         Hck2mJjesXtojY5CziRxgc86yqBbw460gQE+WQ5IVd8GMi8miP3uyBSyDP3DHhaWb7Ee
         B9Vw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id t71si3023912ywg.773.2018.01.09.07.59.29
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 09 Jan 2018 07:59:29 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:59589 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eYwJE-00021N-Lh
	for alex.bennee@linaro.org; Tue, 09 Jan 2018 10:59:28 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47950)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lersek@redhat.com>) id 1eYwIx-0001ws-B7
	for qemu-arm@nongnu.org; Tue, 09 Jan 2018 10:59:15 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <lersek@redhat.com>) id 1eYwIt-000445-7B
	for qemu-arm@nongnu.org; Tue, 09 Jan 2018 10:59:11 -0500
Received: from mx1.redhat.com ([209.132.183.28]:14386)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <lersek@redhat.com>)
	id 1eYwIt-00043m-0a; Tue, 09 Jan 2018 10:59:07 -0500
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id BEBF1C262B;
	Tue,  9 Jan 2018 15:59:05 +0000 (UTC)
Received: from lacos-laptop-7.usersys.redhat.com (ovpn-120-223.rdu2.redhat.com
	[10.10.120.223])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 8F99280608;
	Tue,  9 Jan 2018 15:58:57 +0000 (UTC)
To: Peter Maydell <peter.maydell@linaro.org>
References: <1513183941-24300-1-git-send-email-peter.maydell@linaro.org>
	<CAFEAcA8NbL7ROZs99hWhpAF2Rdi2qEiWLNo3hr_9W7gmgXyw4A@mail.gmail.com>
From: Laszlo Ersek <lersek@redhat.com>
Message-ID: <6d20557d-5722-706f-ca4f-489ab85358c0@redhat.com>
Date: Tue, 9 Jan 2018 16:58:56 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.5.2
MIME-Version: 1.0
In-Reply-To: <CAFEAcA8NbL7ROZs99hWhpAF2Rdi2qEiWLNo3hr_9W7gmgXyw4A@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.28]);
	Tue, 09 Jan 2018 15:59:05 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [PATCH 0/2] GICv2 & GICv3: RAZ/WI reserved addresses
 rather than aborting
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
Cc: Drew Jones <drjones@redhat.com>, "patches@linaro.org" <patches@linaro.org>,
	Ard Biesheuvel <ard.biesheuvel@linaro.org>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Auger Eric <eric.auger@redhat.com>, qemu-arm <qemu-arm@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 7bdBbEntQ4b/

On 01/09/18 15:24, Peter Maydell wrote:
> Ping for code review?
> 
> thanks
> -- PMM
> 
> On 13 December 2017 at 16:52, Peter Maydell <peter.maydell@linaro.org> wrote:
>> The GICv2 and GICv3 specifications

here's where I had started running from your patch...

>> say that reserved register
>> addresses should RAZ/WI.

...and I remarked only looking over my shoulder that "RAZ/WI" is not a
verb :)

Sorry, no clue about any of this -- where should I read up?	

Ard did ask a question though:

https://www.mail-archive.com/qemu-devel@nongnu.org/msg500055.html

CC'ing Drew, Eric and Wei. In particular (IIUC) Eric has been looking
into a weird "why do we have so many (and so slow) aborts with GICv4
emulation" issue, at launching UEFI.

Thanks
Laszlo

>> This means we need to return MEMTX_OK, not
>> MEMTX_ERROR, because now that we support generating external aborts
>> the latter will cause an abort on new board models.
>>
>> In particular, at least some versions of UEFI try to
>> access a reserved address in the GICv3 redistributor
>> (at SGI_base + 0x184) and fail to boot on the virt board
>> without this.
>>
>> thanks
>> -- PMM
>>
>> Peter Maydell (2):
>>   hw/intc/arm_gicv3: Make reserved register addresses RAZ/WI
>>   hw/intc/arm_gic: reserved register addresses are RAZ/WI
>>
>>  hw/intc/arm_gic.c              |  5 +++--
>>  hw/intc/arm_gicv3_dist.c       | 13 +++++++++++++
>>  hw/intc/arm_gicv3_its_common.c |  8 +++-----
>>  hw/intc/arm_gicv3_redist.c     | 13 +++++++++++++
>>  4 files changed, 32 insertions(+), 7 deletions(-)

