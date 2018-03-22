Received: by 10.28.71.155 with SMTP id m27csp572090wmi;
        Thu, 22 Mar 2018 09:46:29 -0700 (PDT)
X-Google-Smtp-Source: AIpwx48D66IYiFcwQ4jsJxCpUqour/qG18W+kKiwC0FT69qicKDKF/nw9XPys99zQYeielC4f1qe
X-Received: by 10.55.20.78 with SMTP id e75mr5956980qkh.6.1521737189355;
        Thu, 22 Mar 2018 09:46:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1521737189; cv=none;
        d=google.com; s=arc-20160816;
        b=UM+JQV1V8eCdCwinYt4Goyvq1c//0OakZN4TjD4/prBqqIKLcAwxFB/7KCB0VGr4hJ
         J01BFkOrX3D60/iP8i/BrDBrOVgkXpzXCc795CMK0hbSC4O1OvYMhhU2aPQ/4lkc5kOi
         PS3Q2JFpjANwyv5j4JoDXVIL4ARsbCP3HJcV184MI9icZ0H5XDpYS8bgGUSfhKteLGub
         Vg6IKHX9gaKddN3442OBEOQvKVfz6rxT6DFUMsRbErbOHOJ2GAtv3ADoArLVOZX3i+oj
         1PrZ3VTXS+CnV2iaWfWTELoWlics34wYIKKets5PSN3EserNwkmciL/tMRbcpvTLwew5
         2TMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:organization:from:references:to
         :arc-authentication-results;
        bh=Tx5gfsxoORYyhK3CYUMigocAHhXkgjTL/8nrbfRe8lo=;
        b=j/kg2EalxeHE6LmjvqLJsBtYYNe5AMU2VS/XiFOO/iN7Nfzkv1eNjvJzN8rW68fqQB
         adbEcAKMGTd1uOsQmtRhO0rMWDov3Ub1wPxexJS0vhYjvKAd6F4E8TSIvzTmLwU37ufy
         PddIpsXTvJhEZN8B83KNMkSWqRFLEK4jWRpY9Gqj+5tKNSk0qUrl+eM8IkhO2pwv/+ym
         Uz9db6W6hnl0sBbOviUb63JLkNsErgY8sEL5DTHjOW3amFSTlYNxki9wpLpxuK0Wfu1j
         rQ0PwRsh3MgR1XGax+ZyZXLym9MEVe33dSVlzOs+hqsQ2hIRbbTEAjLxkKMQ/X5A/Ta4
         EEMg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id l3si3442620qkc.440.2018.03.22.09.46.29
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 22 Mar 2018 09:46:29 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:33713 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ez3MC-0005RR-Ph
	for alex.bennee@linaro.org; Thu, 22 Mar 2018 12:46:28 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56792)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1ez3Lw-0005Q8-5R
	for qemu-arm@nongnu.org; Thu, 22 Mar 2018 12:46:13 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1ez3Ls-00033W-9J
	for qemu-arm@nongnu.org; Thu, 22 Mar 2018 12:46:12 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:47248 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eblake@redhat.com>)
	id 1ez3Ls-00033G-3u; Thu, 22 Mar 2018 12:46:08 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 55652406804D;
	Thu, 22 Mar 2018 16:46:03 +0000 (UTC)
Received: from [10.10.121.135] (ovpn-121-135.rdu2.redhat.com [10.10.121.135])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 4D88C2166BAE;
	Thu, 22 Mar 2018 16:45:57 +0000 (UTC)
To: Laurent Vivier <lvivier@redhat.com>, qemu-devel@nongnu.org
References: <20180322161226.29796-1-lvivier@redhat.com>
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
Message-ID: <07d291be-bec3-666c-15d9-90ba310bdb88@redhat.com>
Date: Thu, 22 Mar 2018 11:45:56 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <20180322161226.29796-1-lvivier@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.5]);
	Thu, 22 Mar 2018 16:46:03 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.5]);
	Thu, 22 Mar 2018 16:46:03 +0000 (UTC) for IP:'10.11.54.6'
	DOMAIN:'int-mx06.intmail.prod.int.rdu2.redhat.com'
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
X-TUID: FJR2DqGnFbdN

On 03/22/2018 11:12 AM, Laurent Vivier wrote:
> I've re-run some scripts from the coccinelle directory,
> and they have found some problems.
> 
> This series fixes them.
> 
> Laurent Vivier (4):
>    error: Strip trailing '\n' from error string arguments (again again)
>    error: Remove NULL checks on error_propagate() calls
>    qdict: remove useless cast
>    Remove unnecessary variables for function return value

I've gone through all the patches to double-check for no surprises; and 
found some formatting nits on 4 that can be touched up on pull request. 
Series:
Reviewed-by: Eric Blake <eblake@redhat.com>

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org
