Received: by 10.28.71.155 with SMTP id m27csp915849wmi;
        Fri, 23 Mar 2018 13:51:20 -0700 (PDT)
X-Google-Smtp-Source: AG47ELtUcXFmvt2v4mPN3A6beCAb2Vg1Wu5vZCiED3jAEB0c2bUp7HxqsZHI0+w0IVugyJG0JMQD
X-Received: by 10.200.24.82 with SMTP id n18mr44418908qtk.241.1521838280342;
        Fri, 23 Mar 2018 13:51:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1521838280; cv=none;
        d=google.com; s=arc-20160816;
        b=ShWB6rNdoxg1RXb1OuO7rLWskhqilp9kx+/dfiUsuEV4Kbpy1Dx8Vzoix7hMgHhNPA
         e4613rF8khmD9BF/7CqLjxHabZ1f2eH4ZwtiCr5Wxr+1bMnmCjflzI+rFpvPX6fQZpR5
         cC7SYmjK+utbjfXJsc7Pw07/jIuN2uVAj38wudp+Y2+A48f3VTvxfQ8PsdlITzAT5n3K
         QV+Ve3/l+zIB3Y7+fDoCq0xPrxvwwnZlx9eovKvoWB1f1uLIdIPkrIClRBwlbJ5c7PvJ
         x1TD7kN0/F+iXqBJU7CsklrpTXqvFtv5sxGE+wVEH8K2TFvKLYJAKtAPnQGgnBd4K8Q3
         lKNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:organization:from:references:to
         :arc-authentication-results;
        bh=e0oUFk+oMxqn0UklGy3QcKVQ2MrbkA5r3d6WSSXaGz4=;
        b=RT353Gkl3qsZe53qzu3q0cTuson/xlUYPqejAhWihLrnMMl4dx9gHVzCTfCMSIduEV
         ycZ+2hmcQluOk5ptnXyDz7C8HnqDq47QZYQTFV5Dl5kosJFq7/+v/od73aeEF5ZxwewO
         mLn0MFbTiq8gW/e5QYtZ44UX4xY6ZqXjzOHwOKs30C3UaIHLwPNHeLE1wQQBOyTLrhsl
         /SrDeqADUW9D+Ue8EnFHKtnVFa60JCoe2pxkwuF1nd/XTk07ljqNCYWn4di8PmTpa/4R
         i1qXdJRftXGu5CHq+m6CpHRvI1XWsojJpC00ylUEWlScnF1Cb+jZtaVR1/xpDh1t7cX9
         GA5A==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id p1si8837916qkh.45.2018.03.23.13.51.20
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 23 Mar 2018 13:51:20 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:39768 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ezTeh-0006fp-Ss
	for alex.bennee@linaro.org; Fri, 23 Mar 2018 16:51:19 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48397)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1ezTeX-0006eX-FD
	for qemu-arm@nongnu.org; Fri, 23 Mar 2018 16:51:10 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1ezTeT-0003SD-Iu
	for qemu-arm@nongnu.org; Fri, 23 Mar 2018 16:51:08 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:36244 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eblake@redhat.com>)
	id 1ezTeT-0003RN-Eg; Fri, 23 Mar 2018 16:51:05 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id BCF66EAEB8;
	Fri, 23 Mar 2018 20:51:04 +0000 (UTC)
Received: from [10.10.121.135] (ovpn-121-135.rdu2.redhat.com [10.10.121.135])
	by smtp.corp.redhat.com (Postfix) with ESMTP id AB81610B2B4B;
	Fri, 23 Mar 2018 20:50:55 +0000 (UTC)
To: Laurent Vivier <lvivier@redhat.com>, qemu-devel@nongnu.org
References: <20180322161226.29796-1-lvivier@redhat.com>
	<20180322161226.29796-3-lvivier@redhat.com>
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
Message-ID: <51925b27-09cc-1c3e-674c-d80b423f92c8@redhat.com>
Date: Fri, 23 Mar 2018 15:50:54 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <20180322161226.29796-3-lvivier@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.1]);
	Fri, 23 Mar 2018 20:51:04 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.1]);
	Fri, 23 Mar 2018 20:51:04 +0000 (UTC) for IP:'10.11.54.3'
	DOMAIN:'int-mx03.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'eblake@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: Re: [Qemu-arm] [PATCH 2/4] error: Remove NULL checks on
 error_propagate() calls
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
X-TUID: jm3GqZYClpxG

On 03/22/2018 11:12 AM, Laurent Vivier wrote:
> Re-run Coccinelle patch
> scripts/coccinelle/error_propagate_null.cocci
> 
> Signed-off-by: Laurent Vivier <lvivier@redhat.com>
> ---
>   io/channel-websock.c | 4 +---
>   1 file changed, 1 insertion(+), 3 deletions(-)
> 

Misses an offender in numa.c, why?

https://lists.gnu.org/archive/html/qemu-devel/2018-03/msg06382.html

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org
