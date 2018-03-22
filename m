Received: by 10.28.71.155 with SMTP id m27csp553869wmi;
        Thu, 22 Mar 2018 09:28:25 -0700 (PDT)
X-Google-Smtp-Source: AG47ELus4eRULFkSRyjZ1SnfWi9aQvKK1ie+IXvXnwJ4JMSTAbGOXiWXiWww0PeSpwxQag72zhlV
X-Received: by 10.200.2.153 with SMTP id p25mr36984685qtg.229.1521736105538;
        Thu, 22 Mar 2018 09:28:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1521736105; cv=none;
        d=google.com; s=arc-20160816;
        b=l5ZEGARTGDHbV77Av+RcYoA/K2bV7TrkITTBxlRq2RItGW/acvFmrRsJkOKd6dNId6
         GfQJ9KV52kMmvw86feFHmyhd7jqvz3+XlpkOSJuR/lUGM9AbwArZWPEaem/FfUNMtyZT
         NHzq2Dh4nRTA3XGUlw1IbFU6+eq2XQpebayqIyARM/eVBQ47ESbgNY92MNmMBKcQzqnc
         BKNHP8iKXtW3/jbGMrCLAigFo0PYgljBICeBbKG91rp/A5BdRyMCGPpm3atXLGPWdrQk
         UaxIC8+ajfwbW8XEwB+Sd1Go64hF5kqamyoruIV60HrYpYRT0xi6G8kgVgpaga7CKqLe
         tFHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:organization:from:references:to
         :arc-authentication-results;
        bh=0kclSSVY1zWd7Z8oO+vKoK2e/XnjbPYcnsjcBrEWsyw=;
        b=BAxdK0qkERraJXqjXyMkttAEps2ZaV7nOEvoNUiuDv5ZJKPVnXtVdG8jB47Mkswm5k
         hPFMZZeaeiDYhiIzoVRvdew9ZjODekifZr+snCZUNvZNvZMvm0bJbgAV2l3JYij/zDx5
         65dygZfg64bCGVtiMn72elTShEW5sbCpl6mWlhGg14TX5ZZTbH93sGSPoBhekQa/OfzY
         Y9AbOBjR3Ms5sq7jZTB2ib2wE+Edgnt9ojl1NTmINk9QXaKGafeJwCel3uiP59XhyES0
         wqngPtaD+eD6AtvSrWA1nOIZW7EY+DN/nRmtN8SC3i1Q8v/uzK5VCimqMIFrerks91Y2
         sVNg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id p24si1979450qtc.221.2018.03.22.09.28.25
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 22 Mar 2018 09:28:25 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:33632 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ez34j-0004Of-0Z
	for alex.bennee@linaro.org; Thu, 22 Mar 2018 12:28:25 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52791)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1ez34W-0004MA-EH
	for qemu-arm@nongnu.org; Thu, 22 Mar 2018 12:28:17 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1ez34R-0002mf-Qq
	for qemu-arm@nongnu.org; Thu, 22 Mar 2018 12:28:12 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:46522 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eblake@redhat.com>)
	id 1ez34R-0002mR-MK; Thu, 22 Mar 2018 12:28:07 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id B12834070212;
	Thu, 22 Mar 2018 16:28:03 +0000 (UTC)
Received: from [10.10.121.135] (ovpn-121-135.rdu2.redhat.com [10.10.121.135])
	by smtp.corp.redhat.com (Postfix) with ESMTP id E24F08442D;
	Thu, 22 Mar 2018 16:27:52 +0000 (UTC)
To: Laurent Vivier <lvivier@redhat.com>, qemu-devel@nongnu.org
References: <20180322161226.29796-1-lvivier@redhat.com>
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
Message-ID: <bee349e1-d665-c7a2-f81e-c27cd142dff3@redhat.com>
Date: Thu, 22 Mar 2018 11:27:52 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <20180322161226.29796-1-lvivier@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.5]);
	Thu, 22 Mar 2018 16:28:03 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.5]);
	Thu, 22 Mar 2018 16:28:03 +0000 (UTC) for IP:'10.11.54.5'
	DOMAIN:'int-mx05.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'eblake@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: Re: [Qemu-arm] [PATCH 0/4] coccinelle: re-run scripts from
 scripts/coccinelle
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
	"Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
	Markus Armbruster <armbru@redhat.com>, Max Filippov <jcmvbkbc@gmail.com>,
	Yongbok Kim <yongbok.kim@mips.com>,
	Alberto Garcia <berto@igalia.com>, qemu-block@nongnu.org,
	qemu-trivial@nongnu.org, Alexander Graf <agraf@suse.de>,
	David Gibson <david@gibson.dropbear.id.au>, Fam Zheng <famz@redhat.com>,
	Eduardo Habkost <ehabkost@redhat.com>,
	"Dr. David Alan Gilbert" <dgilbert@redhat.com>,
	qemu-arm@nongnu.org, Richard Henderson <rth@twiddle.net>,
	Kevin Wolf <kwolf@redhat.com>,
	"=?UTF-8?Q?Daniel_P._Berrang=c3=a9?=" <berrange@redhat.com>,
	Igor Mitsyanko <i.mitsyanko@gmail.com>,
	Max Reitz <mreitz@redhat.com>, qemu-ppc@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: KhYbCMSQSJ71

On 03/22/2018 11:12 AM, Laurent Vivier wrote:
> I've re-run some scripts from the coccinelle directory,
> and they have found some problems.
> 
> This series fixes them.
> 
> Laurent Vivier (4):
>    error: Strip trailing '\n' from error string arguments (again again)

This is user-visible, so appropriate during freeze as a bug fix.  It's 
closes to the error/qapi code that Markus normally maintains (and where 
I'm filling in while he is out), so I'll queue this one on my QAPI tree.

>    error: Remove NULL checks on error_propagate() calls
>    qdict: remove useless cast
>    Remove unnecessary variables for function return value

These are cosmetic; they should be no-ops.  2 and 3 are again best 
through error/qapi, while 4 is more generic, but there's little reason 
to split up the series just because 4 is not as closely related.  Unless 
anyone has an opinion otherwise, I'm planning to also include them in my 
QAPI tree for 2.12.

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org
