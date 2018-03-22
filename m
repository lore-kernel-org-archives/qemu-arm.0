Received: by 10.28.71.155 with SMTP id m27csp726610wmi;
        Thu, 22 Mar 2018 12:13:19 -0700 (PDT)
X-Google-Smtp-Source: AIpwx4//5tw3ryW4OCFg4meBAUp9Xu27VL+zJOJz1UIgwntHxVYxDOJ8+UJ4+0aOg0z2V5RoowYw
X-Received: by 10.55.54.142 with SMTP id d136mr5452000qka.204.1521745998882;
        Thu, 22 Mar 2018 12:13:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1521745998; cv=none;
        d=google.com; s=arc-20160816;
        b=cd05z0CnKlXjsIDciVVlVS0eC4sXi/i02K1VtRUHr6h59qCqIYWw1x+zzlQFgGjP4r
         k73sWtiLVDaXY5SPWIFlnuPOjuq3dVJiBS1dPPA4LKWDq/S5mDcsMfNxKrljhBs5EZWo
         mTLSWl3bXf+dqZCVsaVrHSZFw6W2Xsjtbms3EfzWemueDssKv57//y6/U6SrksujGfIU
         H3cJfgz39eS6aeAu2rQxaleeN8Ba9w9kPxFmQ1MQeHfXKxmddGYs0cAAFrYcmKrbtirB
         6mNB4K7P3ACw8GzF7C8mDt1eg0f3Eh0RNPq+UG8WiMApQzBGnl5c9EdCkLh1XtcXfMLY
         jRuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:organization:from:references:to
         :arc-authentication-results;
        bh=0IlTB55RmtNAMuHDE7AkeELyh2gyBtY7h1qJ16L4Qbw=;
        b=lKqT1RlB2uqRxPGjHcin+YkZjYUO3CwjVp6nR1yYHGzbSDX1xl3cj/Wdxk74ia2gLX
         kWWSEFnMK9C5AIzh8EbKS9iF+RTwmG/XLiMFqOuYYPElqTEvgyVFnAAHeE4VQnxU+ox1
         /QO1Q3cGaFqdN7nR5zaKH3lb5zYYFU5apSH/j8IeGTiPxOvCa4Ciwebv6+uW7i3JfM+V
         k0a7wFaZLzYsHXPR/yi8RWQVsdstCedF/+0ebVKPRMRmvtLyQtfOhD0o3eYlcFQWgZTA
         JrQsuop7gz8cDJjzwVoZ4XGfQETJAxDKa5Q0Zy1iE/yxogkfF2o7toA7LMuFw7hWEvLL
         rx4A==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id o15si8063663qko.179.2018.03.22.12.13.18
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 22 Mar 2018 12:13:18 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:34374 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ez5eI-0007Md-Bo
	for alex.bennee@linaro.org; Thu, 22 Mar 2018 15:13:18 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40187)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1ez5e6-0007KO-HK
	for qemu-arm@nongnu.org; Thu, 22 Mar 2018 15:13:07 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1ez5e2-0007ZX-4t
	for qemu-arm@nongnu.org; Thu, 22 Mar 2018 15:13:06 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:56052 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eblake@redhat.com>)
	id 1ez5e2-0007ZB-0z; Thu, 22 Mar 2018 15:13:02 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 499FD722C1;
	Thu, 22 Mar 2018 19:12:51 +0000 (UTC)
Received: from [10.10.121.135] (ovpn-121-135.rdu2.redhat.com [10.10.121.135])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 9CD742166BAE;
	Thu, 22 Mar 2018 19:12:41 +0000 (UTC)
To: Peter Maydell <peter.maydell@linaro.org>,
	QEMU Developers <qemu-devel@nongnu.org>
References: <20180322161226.29796-1-lvivier@redhat.com>
	<152174145840.240.3926671265619235661@71c20359a636>
	<CAFEAcA_Uxhrh2L+FghG7y2r7n36rfo41jKw9vdGZYo32nk28cg@mail.gmail.com>
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
Message-ID: <6137f1be-98a0-1b3f-6bed-ca94be1b5d1a@redhat.com>
Date: Thu, 22 Mar 2018 14:12:41 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA_Uxhrh2L+FghG7y2r7n36rfo41jKw9vdGZYo32nk28cg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.2]);
	Thu, 22 Mar 2018 19:12:51 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.2]);
	Thu, 22 Mar 2018 19:12:51 +0000 (UTC) for IP:'10.11.54.6'
	DOMAIN:'int-mx06.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'eblake@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH 0/4] coccinelle: re-run scripts
 from scripts/coccinelle
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
Cc: "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
	Markus Armbruster <armbru@redhat.com>, Max Filippov <jcmvbkbc@gmail.com>,
	Yongbok Kim <yongbok.kim@mips.com>, Alberto Garcia <berto@igalia.com>,
	Qemu-block <qemu-block@nongnu.org>, QEMU Trivial <qemu-trivial@nongnu.org>,
	Alexander Graf <agraf@suse.de>, David Gibson <david@gibson.dropbear.id.au>,
	Laurent Vivier <lvivier@redhat.com>, Fam Zheng <famz@redhat.com>,
	Eduardo Habkost <ehabkost@redhat.com>,
	"Dr. David Alan Gilbert" <dgilbert@redhat.com>,
	qemu-arm <qemu-arm@nongnu.org>, Richard Henderson <rth@twiddle.net>,
	Kevin Wolf <kwolf@redhat.com>, Igor Mitsyanko <i.mitsyanko@gmail.com>,
	Max Reitz <mreitz@redhat.com>, qemu-ppc <qemu-ppc@nongnu.org>,
	Paolo Bonzini <pbonzini@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 3UkdUshSjpu+

On 03/22/2018 01:00 PM, Peter Maydell wrote:
> On 22 March 2018 at 17:57,  <no-reply@patchew.org> wrote:
>> Checking PATCH 4/4: Remove unnecessary variables for function return value...
>> ERROR: return is not a function, parentheses are not required
>> #251: FILE: target/mips/dsp_helper.c:3281:
>> +    return (temp[1] << 63) | (temp[0] >> 1);
> 
> This looks like a bug in checkpatch. I guess to fix it you'd need
> to make checkpatch count opening and closing parens in the line
> to see if it goes to 0 somewhere other than just before the ';'...

Or if we don't patch the false negative, you can bypass checkpatch with 
an ugly hack:

return 0 + (...) | (...);

(I'm NOT going to do that bypass - it's too ugly for my taste)

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org
