Received: by 10.28.71.155 with SMTP id m27csp419030wmi;
        Fri, 23 Mar 2018 05:37:47 -0700 (PDT)
X-Google-Smtp-Source: AG47ELs/Ypmz3hbb8NOnWXUO+tA/5aF9n9SqP5NGF7w7OaxgVnSzujmaIK8KEKkp5aXMcub3Kg6W
X-Received: by 10.55.118.6 with SMTP id r6mr41811314qkc.211.1521808667737;
        Fri, 23 Mar 2018 05:37:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1521808667; cv=none;
        d=google.com; s=arc-20160816;
        b=VS1Y/TvJf+Te2+aEWKexL0ifqL3Xcxxl0X/RR9jHXoX0qp2hARIfrlopwcDhTZj3ki
         k5tMa865sjgROjUquhVLxWCuB/gTS+b9pjL+bUMMRojWGb9wDz3rQp9VI+wP/rocmqL5
         TtAoIRRLg5XLmPGQYhiNbtDG2e0V7kdDeaUOj6mT39iduZnovqW7h3eoqy0oz9FX8wbD
         KnVxoLPBGNgOdv6U7Z2gYFJIQN34qX75dn3WSYyQeCykEuZxR5yCeuM6/6C89TMoEh9H
         yXBi4QZbLrrCuxojw/AwYE5ySdG5S9t/K12R0VA+59S9MMDNyv4+QpDLqAXdQAHCV3w7
         KRqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to
         :arc-authentication-results;
        bh=gYRqUtd6Ldz6OFVFqg09zfdzBTNAee+UnRzGcV+To1E=;
        b=pvtFfa0jM6mtzNwWAunX5Jloy6iZSYSYOu9dDsinbemrWfql9fO3J7B9ggmzJulSCZ
         gHcJMeDrtV9MpE/11NokJ1akTj0IxYZ9Xa2C9NJMzX2noebe5mGVZV/N8ZaLCJtVtib1
         VqWtj3zq2G36zpY81GyaRywnS8+kXEdvM435eirXJtRAmRKWVzCMvRHBtIbZjVciLlym
         lyvbmqakGTiaHZ+InZWoMvj+ZwaPE1lQzEb0F0aNEzTsreG4rowTzla3aDUF7euK1Atx
         bigQXPx6zvVvojT4VDRKemPd+0zZTO71SEkKBHj9m2ihb0pV2WVxZYoJxVbZD9BMhKga
         ANpQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 26si538030qtd.119.2018.03.23.05.37.47
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 23 Mar 2018 05:37:47 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:37861 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ezLx5-0007pg-7W
	for alex.bennee@linaro.org; Fri, 23 Mar 2018 08:37:47 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37791)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1ezLwu-0007o3-VK
	for qemu-arm@nongnu.org; Fri, 23 Mar 2018 08:37:37 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1ezLwr-0003KW-LG
	for qemu-arm@nongnu.org; Fri, 23 Mar 2018 08:37:37 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:46231)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1ezLwr-0003GY-EG; Fri, 23 Mar 2018 08:37:33 -0400
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 7F9A0413CD;
	Fri, 23 Mar 2018 15:37:24 +0300 (MSK)
Received: from [192.168.177.99] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with ESMTP id 03787D98;
	Fri, 23 Mar 2018 15:37:29 +0300 (MSK)
To: Laurent Vivier <lvivier@redhat.com>, qemu-devel@nongnu.org
References: <20180322161226.29796-1-lvivier@redhat.com>
From: Michael Tokarev <mjt@tls.msk.ru>
Message-ID: <087177af-cc0b-c8b7-ce50-98f1f9cada68@msgid.tls.msk.ru>
Date: Fri, 23 Mar 2018 15:37:24 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <20180322161226.29796-1-lvivier@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 86.62.121.231
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
	Max Filippov <jcmvbkbc@gmail.com>, Eric Blake <eblake@redhat.com>,
	Alberto Garcia <berto@igalia.com>, qemu-block@nongnu.org,
	qemu-trivial@nongnu.org, Yongbok Kim <yongbok.kim@mips.com>,
	Markus Armbruster <armbru@redhat.com>,
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
X-TUID: YwVAabcyHiMe

22.03.2018 19:12, Laurent Vivier wrote:
> I've re-run some scripts from the coccinelle directory,
> and they have found some problems.
> 
> This series fixes them.
> 
> Laurent Vivier (4):
>   error: Strip trailing '\n' from error string arguments (again again)
>   error: Remove NULL checks on error_propagate() calls
>   qdict: remove useless cast
>   Remove unnecessary variables for function return value

I've applied patches 1-3, but the 4th patch is a bit.. interesting.
As has already been said, it touches auto-generated files, which is
sort of fine, but it _also_ removes comments, which - I think - is
quite a bit wrong.

I can apply just selected hunks, but.. hmm..

/mjt
