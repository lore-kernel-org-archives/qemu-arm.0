Received: by 2002:a5d:4308:0:0:0:0:0 with SMTP id h8-v6csp1092333wrq;
        Thu, 12 Jul 2018 01:06:25 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpeG+fRm1uHo+tKfzi+aaXbZ3DQEIc1g/zROzuk+CV/tgqIgo/u6JwAtRpQKS3cMthcU3hs8
X-Received: by 2002:ac8:855:: with SMTP id x21-v6mr944589qth.42.1531382785050;
        Thu, 12 Jul 2018 01:06:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1531382785; cv=none;
        d=google.com; s=arc-20160816;
        b=jGDGRul2r8hyDwjno/x4uVzcVVY8sKuCAs0RRtYF4q6sLKecJYUaOuA/UzidLP2HWr
         CJFwPUwl9XQK7Pza3sQk1fj3xKTrt0fgdAofyehadf6hdzS7QBusmj1O3t9310l18O8z
         vVmG1dQRXFuguw8tGHGr+Ob/N1S9JYD7jJUDxh+jEPqTNot7mLgERVGqCEZgo+r0Hnx8
         2NvdR1mEZTxaxRsz0T6t3R9qA+pB/Ey2lGQxTwF85PTtj0aURBJhIMMI9AIPambmQLhm
         dItXyoF7u0y1Ge8xbOqYbAPJmuh2u55HjhDdcRaOxg9/bA0l0zJek0CcaUJGnak2TYYs
         6vgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to
         :arc-authentication-results;
        bh=6Rlq5pPa0zGZfy2OzDSCTF2h9xfoVoPr9k/n97DocmY=;
        b=v0cuvdxzA+qV6dfa3P3hvblevdh4/AmveaxcFRs1Cbt5UBD2+sYHWSoxrd7FGDm5Fk
         POatmXcyBYsVn4SsazyrS3fifqNnLfDXVYhdd2jUIGNwllq0ngcCoBOTPoh0znkT9Rxa
         xlw/IqdWYq0QqS3NjRMvgcRP5fe+a4ruxmwX+O9rpR+fjact0IaVBrd6aFiQNVTc87P+
         gAEE9MC91qFKBZOJZ/wp52jEC2etcTl/Upkb74GQGnpW45R1ggHkOQj/QGb8egJmhCjx
         CLqk1AnhTM9qzFH3U3HeqGSP/NM8EALYF06BziyIZT0eNAO1YHJ2d7hqveOnrajOiSqa
         wTgA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id r90-v6si2742829qkr.276.2018.07.12.01.06.24
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 12 Jul 2018 01:06:25 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:57931 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fdWcK-0004Yv-Gt
	for alex.bennee@linaro.org; Thu, 12 Jul 2018 04:06:24 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55880)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1fdWbq-0004Wx-VS
	for qemu-devel@nongnu.org; Thu, 12 Jul 2018 04:05:55 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1fdWbm-0002iY-1a
	for qemu-devel@nongnu.org; Thu, 12 Jul 2018 04:05:54 -0400
Received: from mail-wm0-f65.google.com ([74.125.82.65]:34676)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <pbonzini@redhat.com>) id 1fdWbl-0002i6-Rq
	for qemu-devel@nongnu.org; Thu, 12 Jul 2018 04:05:49 -0400
Received: by mail-wm0-f65.google.com with SMTP id s13-v6so1410948wmc.1
	for <qemu-devel@nongnu.org>; Thu, 12 Jul 2018 01:05:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=6Rlq5pPa0zGZfy2OzDSCTF2h9xfoVoPr9k/n97DocmY=;
	b=JKDLHpCUkdR4Go7Lcx4DRlmLfOa1ETF5d3cBYil59MZvowHPytbxnkTIueUnpjuYO8
	6WMBrhVaysCnfo1KIhngw00IuUWWouMYm7ErhoVIdJ8tSP39MaShfJ97v0JvqUmP4Chq
	PZqZAZsVrQAE5trh9gOL+HLAfnNF//HNqhYx8e0jX+wg5UQSwLL1Ml2o2ZDi5U4zkYIy
	rTWeooJE4dJy6NShVB3xkZN+xepnBtwzBxuixU5Viu8K5y9rgMVlokr2Kc5Ppr19KwNC
	RkK0KiwgAq7pq4ar67Tp64Sqi39X2H6rq7poA7QU0NgisHWsfTy5D9tbzyGIwIR7VJoU
	rbqQ==
X-Gm-Message-State: AOUpUlFwBarfKe7ukgwDHT6SayYGlwBv9FV/csbUNoaO2girDyDpB2YC
	X3gQ0eyhYEmFgHmEkZrPcv9tYA==
X-Received: by 2002:a1c:d6cf:: with SMTP id
	n198-v6mr701711wmg.61.1531382748675; 
	Thu, 12 Jul 2018 01:05:48 -0700 (PDT)
Received: from [192.168.10.150] (dynamic-adsl-78-12-151-35.clienti.tiscali.it.
	[78.12.151.35]) by smtp.gmail.com with ESMTPSA id
	d15-v6sm1684629wmb.0.2018.07.12.01.05.47
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 12 Jul 2018 01:05:48 -0700 (PDT)
To: Eduardo Habkost <ehabkost@redhat.com>
References: <1531170180-21199-1-git-send-email-thuth@redhat.com>
	<ca91bffe-2bcf-78a2-02cd-8ae7cc48074c@redhat.com>
	<20180711183031.GM914@localhost.localdomain>
	<ce0b8bf9-b0e6-fe02-c685-5a6c3140a3ae@redhat.com>
	<20180711202351.GA31657@localhost.localdomain>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <00130bb8-4dfc-3a76-3f51-9f4c6da891c0@redhat.com>
Date: Thu, 12 Jul 2018 10:05:46 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.8.0
MIME-Version: 1.0
In-Reply-To: <20180711202351.GA31657@localhost.localdomain>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 74.125.82.65
Subject: Re: [Qemu-devel] [PATCH] hw/arm/bcm283x: Fix crash with device_add
 bcm2837 on unsupported machines
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
	qemu-arm@nongnu.org, qemu-devel@nongnu.org,
	Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 8gv6v+GosAF3

On 11/07/2018 22:23, Eduardo Habkost wrote:
> On Wed, Jul 11, 2018 at 10:16:42PM +0200, Paolo Bonzini wrote:
>> On 11/07/2018 20:30, Eduardo Habkost wrote:
>>>> The theoretical behavior should be:
>>> It's not clear below where you expect
>>>   qdev_set_parent_bus(..., sysbus_get_default())
>>> to be called (if it should be called at all).
>>>
>>> I don't know where it should be called, but I'm absolutely sure
>>> instance_init is not the right place.
>>
>> I think instance_init is fine to call qdev_set_parent_bus on contained
>> devices.  Why do you say it's not?
> 
> Because object_unref(object_new(...)) is not supposed to affect
> QEMU global state at all.

It should not affect it.  Any changes to the global state done by
instance_init are immediately undone when object_unref destroys the
child properties of the object.

Thanks,

Paolo
