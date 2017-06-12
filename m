Received: by 10.25.0.23 with SMTP id 23csp996995lfa;
        Mon, 12 Jun 2017 12:14:51 -0700 (PDT)
X-Received: by 10.55.66.20 with SMTP id p20mr27230669qka.29.1497294891850;
        Mon, 12 Jun 2017 12:14:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1497294891; cv=none;
        d=google.com; s=arc-20160816;
        b=GJEbcp9uvdbXofcZfalipF4qsuY1/lnC5kp4RJV3vY63Y0irOBgeAIsc6kGXBwBolX
         RTIYDKxmFxO26eFnQOh0IMQLCwQkNXIamjALyoIL3JaOutyt3SI1Scp61TDRBm6RQkY+
         A01gyqGSOpvvIB1WJahpeZ4Hmzf08qq5IbI9EidUDPlSzf/D7GNqJUCj2oE0V8Uyeigw
         xLdoFtoIeLiCbXaV7wEqJjSHmEcFoKLJ5FVhQZPKs/+dTsj7afx8NgLD05PyE1SD/r5d
         6AJsekP/hOVyTITGrAG0p5WnPamBJFgqp7Z/+NHaLh0myt/yH6olDsvGa5JgIV0cPHUa
         X4aw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:dkim-filter:dmarc-filter
         :arc-authentication-results;
        bh=jA5+Q/XOq2tN/b+/QWxPTuMU8N47TRc++Hmp8j3QL/g=;
        b=rhbccZKn/NCSx+p4D4wehVoVeJCoRnZixgYmQPEi1ZGj+5vz/hNhReth+RaDIKRhCs
         lgHvjmpiY4MoBTNgSFEL0SLKWgfM6DYshaViZvUbu+eS5sp4LJrTS6X8ZdxGdR3i7PQJ
         lXr391J7G44sKdvJBw9rL78E8rC+hHG0Bja5a/5bjYeIihpMePX0gDPj2A+agpKYhfH6
         S1CJAhKPy1659/SGJu78ABB9mUz2aKQdY9eRB6UavciQxuIuvgRKWQd8tmnsyEk/bjRr
         6bjQ9XoAcwRJYCIOD2Spyh1aoU8evb24UJ3qIw7j9Ch++visqxUFwmWxTDmwIbvlx8aw
         Dwxw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id w197si9276909qka.296.2017.06.12.12.14.51
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 12 Jun 2017 12:14:51 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:39668 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dKUnZ-00087J-1p
	for alex.bennee@linaro.org; Mon, 12 Jun 2017 15:14:49 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46717)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1dKUnU-00086s-Jk
	for qemu-arm@nongnu.org; Mon, 12 Jun 2017 15:14:45 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1dKUnR-0007Zd-De
	for qemu-arm@nongnu.org; Mon, 12 Jun 2017 15:14:44 -0400
Received: from mx1.redhat.com ([209.132.183.28]:52375)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1dKUnR-0007Xr-7P; Mon, 12 Jun 2017 15:14:41 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 477197F6A4;
	Mon, 12 Jun 2017 19:14:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 477197F6A4
Authentication-Results: ext-mx01.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx01.extmail.prod.ext.phx2.redhat.com;
	spf=pass smtp.mailfrom=eric.auger@redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.redhat.com 477197F6A4
Received: from localhost.localdomain (ovpn-116-222.ams2.redhat.com
	[10.36.116.222])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 75C3062931;
	Mon, 12 Jun 2017 19:14:30 +0000 (UTC)
To: quintela@redhat.com
References: <1497023553-18411-1-git-send-email-eric.auger@redhat.com>
	<1497023553-18411-2-git-send-email-eric.auger@redhat.com>
	<87r2yplo5l.fsf@secure.mitica>
From: Auger Eric <eric.auger@redhat.com>
Message-ID: <5a97d277-58d7-84e3-97a3-a06837bd3459@redhat.com>
Date: Mon, 12 Jun 2017 21:14:28 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <87r2yplo5l.fsf@secure.mitica>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.25]);
	Mon, 12 Jun 2017 19:14:39 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v6 1/4] kvm-all: Pass an error
 object to kvm_device_access
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
Cc: peter.maydell@linaro.org, drjones@redhat.com, vijay.kilari@gmail.com,
	qemu-devel@nongnu.org, peterx@redhat.com,
	Vijaya.Kumar@cavium.com, qemu-arm@nongnu.org,
	dgilbert@redhat.com, zhaoshenglong@huawei.com,
	christoffer.dall@linaro.org, eric.auger.pro@gmail.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: t7vzEuygU5WO

Hi Juan,

On 12/06/2017 08:23, Juan Quintela wrote:
> Eric Auger <eric.auger@redhat.com> wrote:
>> In some circumstances, we don't want to abort if the
>> kvm_device_access fails. This will be the case during ITS
>> migration, in case the ITS table save/restore fails because
>> the guest did not program the vITS correctly. So let's pass an
>> error object to the function and return the ioctl value. New
>> callers will be able to make a decision upon this returned
>> value.
>>
>> Existing callers pass &error_abort which will cause the
>> function to abort on failure.
>>
>> Signed-off-by: Eric Auger <eric.auger@redhat.com>
> 
> Reviewed-by: Juan Quintela <quintela@redhat.com>

Thank you for the review!

Eric
> 
