Received: by 10.28.71.155 with SMTP id m27csp752691wmi;
        Fri, 23 Mar 2018 10:42:52 -0700 (PDT)
X-Google-Smtp-Source: AG47ELu49MNTRMdXqr3oJqOKsx4uwnvXTy/0wtuoPbtSGpgLcy2xPN0R8OvfrgkOfPfaxHZOd0iN
X-Received: by 10.237.57.65 with SMTP id l59mr38649387qte.198.1521826972854;
        Fri, 23 Mar 2018 10:42:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1521826972; cv=none;
        d=google.com; s=arc-20160816;
        b=fGT2hIon3yrr3O8I6rl3vATX+pEPXVNq1YGWD0UD/UoZdmIeU5DouqVQP7X06Zjlfs
         ELOC8FXCrGkO3JykuI1KNSIHff7MMsWlqxRpJA6bCntTD58/WbOlIL0V1IkGeH7Td3Om
         I3jOT05SdupYsS7mfQHD2EK4YnUWCdnqAMIB63hkUdZxpFto9HROaCPdg4OkWkr3XEmy
         1SwXlOf/WzKqJDuA4aRqQ7eV55rAHZvyjLXEIa0HvWcj2AmMMs019bXG/vZhmNNkzq2R
         o2LKT9Mr832iO8cbX1MMVOYX/ecYVyNWFwYOHeYeqJp2pIy//L7WhhCrkA6NsI4yoeFu
         A75w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:organization:from:references:to
         :arc-authentication-results;
        bh=0IQuIIlPl8xK1sUiq6vwiZAYAhyQEPNEAYzRX1F60t4=;
        b=o3qaoAykvgVDUGmKpi5LpKlKQjVAVcb8LaELupbnDIYHN+X6hEdSsqJcSecU2bmU6R
         jEmC8As+ExSz3fuFNijYUEztLxEiIcGAGcy5CtEJ/SR25dwTuzHpwrGG0OLJrEyIjd3s
         E5cT3ohb4PdMhLbz2Ll0u88PMJqiRFeJNf5RmJhDlTU3rlNI7ngrobBpkxt3sH17bo27
         yfzoBSk37/oS0bARqANN4nFXOOeFShwMCQgmxZq3iT4JQbPGcN3lyhR2qYGjEog6YKyq
         bL7vZI97KsJpRNU4Q9rQDQrgp1zRbMsP/wxU4BsLVo3c0vTG2G5+9wn/Zuvx0QDEl0C8
         nQ7Q==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id y2si3506315qkj.382.2018.03.23.10.42.52
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 23 Mar 2018 10:42:52 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:39173 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ezQiK-0001I5-9y
	for alex.bennee@linaro.org; Fri, 23 Mar 2018 13:42:52 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:34958)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1ezQi4-0001GW-DW
	for qemu-arm@nongnu.org; Fri, 23 Mar 2018 13:42:37 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1ezQi0-0005IH-7T
	for qemu-arm@nongnu.org; Fri, 23 Mar 2018 13:42:36 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:35912 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eblake@redhat.com>)
	id 1ezQi0-0005Ht-1l; Fri, 23 Mar 2018 13:42:32 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 6ED628182D2E;
	Fri, 23 Mar 2018 17:42:31 +0000 (UTC)
Received: from [10.10.121.135] (ovpn-121-135.rdu2.redhat.com [10.10.121.135])
	by smtp.corp.redhat.com (Postfix) with ESMTP id D18222166BAE;
	Fri, 23 Mar 2018 17:42:27 +0000 (UTC)
To: Michael Tokarev <mjt@tls.msk.ru>, Laurent Vivier <lvivier@redhat.com>,
	qemu-devel@nongnu.org
References: <20180322161226.29796-1-lvivier@redhat.com>
	<087177af-cc0b-c8b7-ce50-98f1f9cada68@msgid.tls.msk.ru>
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
Message-ID: <2ed567e7-3e24-812a-f54e-c94e89b96d98@redhat.com>
Date: Fri, 23 Mar 2018 12:42:26 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <087177af-cc0b-c8b7-ce50-98f1f9cada68@msgid.tls.msk.ru>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.8]);
	Fri, 23 Mar 2018 17:42:31 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.8]);
	Fri, 23 Mar 2018 17:42:31 +0000 (UTC) for IP:'10.11.54.6'
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
	"Michael S. Tsirkin" <mst@redhat.com>,
	Jason Wang <jasowang@redhat.com>, Alexander Graf <agraf@suse.de>,
	Max Filippov <jcmvbkbc@gmail.com>, Yongbok Kim <yongbok.kim@mips.com>,
	Alberto Garcia <berto@igalia.com>, qemu-block@nongnu.org,
	qemu-trivial@nongnu.org, Markus Armbruster <armbru@redhat.com>,
	David Gibson <david@gibson.dropbear.id.au>, Fam Zheng <famz@redhat.com>,
	Eduardo Habkost <ehabkost@redhat.com>,
	"Dr. David Alan Gilbert" <dgilbert@redhat.com>,
	qemu-arm@nongnu.org, Richard Henderson <rth@twiddle.net>,
	Kevin Wolf <kwolf@redhat.com>,
	"=?UTF-8?Q?Daniel_P._Berrang=c3=a9?=" <berrange@redhat.com>,
	Igor Mitsyanko <i.mitsyanko@gmail.com>,
	Max Reitz <mreitz@redhat.com>, qemu-ppc@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: tQM0IjjpWJ1b

On 03/23/2018 07:37 AM, Michael Tokarev wrote:
> 22.03.2018 19:12, Laurent Vivier wrote:
>> I've re-run some scripts from the coccinelle directory,
>> and they have found some problems.
>>
>> This series fixes them.
>>
>> Laurent Vivier (4):
>>    error: Strip trailing '\n' from error string arguments (again again)
>>    error: Remove NULL checks on error_propagate() calls
>>    qdict: remove useless cast
>>    Remove unnecessary variables for function return value
> 
> I've applied patches 1-3, but the 4th patch is a bit.. interesting.
> As has already been said, it touches auto-generated files, which is
> sort of fine, but it _also_ removes comments, which - I think - is
> quite a bit wrong.

1-3 are also candidates for going through my qapi tree (I will probably 
do another pull request Monday or Tuesday), if that beats your trivial 
tree.  But if not, for 1-3, you can add:
Acked-by: Eric Blake <eblake@redhat.com>

> 
> I can apply just selected hunks, but.. hmm..

v2 of patch 4 is better, and the trivial tree may indeed be a better 
place for patch 4 since it doesn't really touch anything qapi-related.

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org
