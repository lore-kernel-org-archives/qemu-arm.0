Received: by 2002:a5d:4301:0:0:0:0:0 with SMTP id h1-v6csp1006858wrq;
        Fri, 15 Jun 2018 08:51:49 -0700 (PDT)
X-Google-Smtp-Source: ADUXVKKTJ41ReQp8exF0d7GPpeMSCYm4mtufNDzr7fuyG5o0pdnqSu/6OWeuXmjQWOzlJSksNo54
X-Received: by 2002:ac8:2dc6:: with SMTP id q6-v6mr1965179qta.83.1529077909470;
        Fri, 15 Jun 2018 08:51:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1529077909; cv=none;
        d=google.com; s=arc-20160816;
        b=a5jYnW5QuQz2Yyq+wRmV7SL+iRIAY+jspL58d0WRneiq8tVrCMLevbiCMA1CI/+Lal
         PIX1ZkCotv8gZ+sU/mipDhdpFr9sJvB8ECRusnrmlz6CH/xM2r2kez1RINcMDVopgmv/
         AkeeSN99irgNAiXM4R+PwbuFccFg6IqUbHel2n/1k9vC7+AACuSu5y4eL59kV1pltuh7
         48jwfmZ4Qcxiyj4Ng59Argw2XH+yLPHErSXzWcrRSJCgU91HY4d8fFJ6AfJo9nGG3gqG
         VrZNklRwiRwc4aBFeKukfIN1/7pHXeTpji+Xff4uXrNbVowlAQwDZj4TmexHXrIts2LI
         heiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:arc-authentication-results;
        bh=WHtkMTss9wEgAa8qYvN9c48Ew4TuYN3DVmIKkT1K3yA=;
        b=qG1FhHTr5omsJK/H3tBn+IbRZAQlwLpWIMR8EKN0rowAUh2riKFEJnJ5QqC5wgR/pb
         wglCLYuqXaKt0NB2mNjxBf8cKgT1BluNOQEPN663yuTwX/djSQ0nxv1KAvCfXvBBzkJ+
         lBXK3eFnFCeZeJIVHIrCnrD5kMtdryRY+8Hph8fJg3z20dDyAOL2AFOvctedau4Spuxv
         fRIhBtYVyZ2VBM/pjU8iZcwpLcTXAyptm0Dr1ENCABbmA0Z/TFGiOdSt3CUJfNJSHQBA
         k6Zyy3hkD+Jt25b28C90MunRLJ2lLdKdOyBE3ab0s6MR6S7/XrvfwQgamLaiXeU+gUNe
         R6Yg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 11-v6si153388qtz.29.2018.06.15.08.51.49
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 15 Jun 2018 08:51:49 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:47733 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fTr0u-0000Gb-Sl
	for alex.bennee@linaro.org; Fri, 15 Jun 2018 11:51:48 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47518)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1fTqQH-0002WD-0P
	for qemu-arm@nongnu.org; Fri, 15 Jun 2018 11:13:58 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1fTqQD-00085v-RM
	for qemu-arm@nongnu.org; Fri, 15 Jun 2018 11:13:56 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:56250 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1fTqQD-00085d-J5; Fri, 15 Jun 2018 11:13:53 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id E8426401EF03;
	Fri, 15 Jun 2018 15:13:52 +0000 (UTC)
Received: from localhost.localdomain (ovpn-117-106.ams2.redhat.com
	[10.36.117.106])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 436A863A5B;
	Fri, 15 Jun 2018 15:13:52 +0000 (UTC)
To: Peter Maydell <peter.maydell@linaro.org>
References: <1528554193-27270-1-git-send-email-eric.auger@redhat.com>
	<1528554193-27270-3-git-send-email-eric.auger@redhat.com>
	<CAFEAcA_R_68FDq-=1coazcTpc1MGqh2ZanccP8C=C9ZJ9_T_6Q@mail.gmail.com>
From: Auger Eric <eric.auger@redhat.com>
Message-ID: <ee86518f-5eb3-f54c-1892-893f87c0b4a9@redhat.com>
Date: Fri, 15 Jun 2018 17:13:51 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA_R_68FDq-=1coazcTpc1MGqh2ZanccP8C=C9ZJ9_T_6Q@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.5]);
	Fri, 15 Jun 2018 15:13:52 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.5]);
	Fri, 15 Jun 2018 15:13:52 +0000 (UTC) for IP:'10.11.54.5'
	DOMAIN:'int-mx05.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'eric.auger@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: Re: [Qemu-arm] [PATCH 2/2] hw/arm/virt: Silence dtc /memory warning
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
	Eric Auger <eric.auger.pro@gmail.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: apL+PF0/RIOY

Hi Peter,

On 06/15/2018 02:26 PM, Peter Maydell wrote:
> On 9 June 2018 at 15:23, Eric Auger <eric.auger@redhat.com> wrote:
>> When running dtc on the guest /proc/device-tree we get the
>> following warning: Warning (unit_address_vs_reg): Node /memory
>> has a reg or ranges property, but no unit name".
>>
>> Let's fix that by adding the unit address to the node name. We also
>> don't create the /memory node anymore in create_fdt(). We directly
>> create it in load_dtb. /chosen still needs to be created in create_fdt
>> as the uart needs it. In case the user provided his own dtb, either
>> the bank is added to the existing /memory node or if this latter is
>> not found we create a new separate memory node.
>>
>> Signed-off-by: Eric Auger <eric.auger@redhat.com>
>> ---
>>  hw/arm/boot.c | 20 ++++++++++++++------
>>  hw/arm/virt.c |  6 ------
>>  2 files changed, 14 insertions(+), 12 deletions(-)
>>
>> diff --git a/hw/arm/boot.c b/hw/arm/boot.c
>> index 1e2be20..2054670 100644
>> --- a/hw/arm/boot.c
>> +++ b/hw/arm/boot.c
>> @@ -593,24 +593,32 @@ static int load_dtb(hwaddr addr, const struct arm_boot_info *binfo,
>>              g_free(nodename);
>>          }
>>      } else {
> 
> I think you need also to change the "if" half of this if..else,
> which deals with NUMA, because it assumes a "/memory" node was
> created by the virt.c code and now it will not be.

You're right.

Besides, what is unclear to me is the use case where the end-user
provides his own dtb. In that case, do we want to "erase" all the
/memory@addr nodes defined by the user and replace them by the nodes
below? Potentially the end user could have provided several memory
nodes, right?

Same question for non NUMA case, do we want to remove all the /memory
nodes provided by the end-user?

Thanks

Eric
> 
>> +        char *nodename = g_strdup("/memory");
>>          Error *err = NULL;
>>
>> -        rc = fdt_path_offset(fdt, "/memory");
>> +        /* If there is an existing /memory node (user provided dtb), we add the
>> +         * new bank into it, otherwise we create a /memory@addr node
>> +         */
>> +        rc = fdt_path_offset(fdt, nodename);
> 
> If we create /memory@addr nodes then we should also look for them in
> an input dtb, I think. Otherwise we'll break the usecase where the
> user asks QEMU to dump the generated dtb to a file, edits it and
> then passes it back to a subsequent QEMU invocation, because we won't
> find the memory node we created.
> 
> thanks
> -- PMM
> 
