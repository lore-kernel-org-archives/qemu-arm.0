Received: by 10.223.161.27 with SMTP id o27csp2552893wro;
        Thu, 2 Nov 2017 13:56:45 -0700 (PDT)
X-Google-Smtp-Source: ABhQp+S/6C3gq8ESmGV8y9GTJE+CfY5Dy6gj6KIvRxykzk2whCMQ4j6HqbR3dpSyx6gYrrPo3mMj
X-Received: by 10.129.161.199 with SMTP id y190mr3136221ywg.281.1509656205549;
        Thu, 02 Nov 2017 13:56:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1509656205; cv=none;
        d=google.com; s=arc-20160816;
        b=VMAGiEPLVVHvN8AQsqp/sTdzZNMTWz89XY3gt23+x+PGItRYX6HJJGFhDqucbH4G7N
         +WTP71L0220hM2aWNDYQYbnsKLcCSdlQF8AyDHAlfPheAFwSDDp9R/BOvbgK0CC9f9Vy
         SXeFrgX1YTNLdW8ykX5JDMALH2cHc4/ryjYwM57fh+mn1AtgS+xF8nHcDHtO5lGA7mwb
         6G7sFzKEtnVZawSle4EGXNQ2ZXv5kiXYaGQgRq+wF4JH2SE69sgIUYlGMWq2QiwQH+RA
         zO+5ClDvfzP2c5swSumvpFOVSj5pnP7WttYIHskyVv91CeKtxebeWHsLYmzxXRvo1rsp
         T46w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:dmarc-filter
         :arc-authentication-results;
        bh=Z2BtoQJh5eA2Bes5L/BvEkz2Yw//JbX/v5xJDzGrm+s=;
        b=y5oyQG4Ap5689U6OYDlGZR1gtWFJ9b3uucgkGN/tQwJKeCygA8cVk/ogDb0VL+Hr/n
         AHD+xEWROB9b3U20X7AJ9+5sdfktnRYf6jHcs7JXtdPlM5XoWq6ZDjFDV7Av44Z1Q1TK
         8/h3aeSxNg4oE4kWB1IFvBdYeV63hciaAt5gznAteQW/Ffashl2vTNAx4/WQcarqzT5G
         0Z8nIqMRwAzvOuFQ8m7T8Zl1o6kBScVSiJw5WZlXa5QWQNOIrJXYyks44hl13cTDLNgg
         fa32uYGjdTumtKobrb32tYGNPD4NEJWVR22l6Huwa9ZzLk6d9rv5SxnCsnTzHqLXAqVd
         NmLg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id s66si956622ywg.310.2017.11.02.13.56.45
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 02 Nov 2017 13:56:45 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:33870 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eAMXd-0001hB-1Y
	for alex.bennee@linaro.org; Thu, 02 Nov 2017 16:56:45 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41798)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <jsnow@redhat.com>) id 1eAMXW-0001fa-31
	for qemu-arm@nongnu.org; Thu, 02 Nov 2017 16:56:39 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <jsnow@redhat.com>) id 1eAMXO-0005zA-Nr
	for qemu-arm@nongnu.org; Thu, 02 Nov 2017 16:56:33 -0400
Received: from mx1.redhat.com ([209.132.183.28]:58638)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <jsnow@redhat.com>)
	id 1eAMXO-0005wY-Hc; Thu, 02 Nov 2017 16:56:30 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 7E5F385547;
	Thu,  2 Nov 2017 20:56:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 7E5F385547
Authentication-Results: ext-mx04.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx04.extmail.prod.ext.phx2.redhat.com;
	spf=fail smtp.mailfrom=jsnow@redhat.com
Received: from [10.18.17.35] (dhcp-17-35.bos.redhat.com [10.18.17.35])
	by smtp.corp.redhat.com (Postfix) with ESMTP id D89FE60618;
	Thu,  2 Nov 2017 20:56:28 +0000 (UTC)
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org
References: <1508784509-29377-1-git-send-email-thuth@redhat.com>
From: John Snow <jsnow@redhat.com>
Message-ID: <2aa7bf9c-cceb-fdf7-4eac-5d318c854518@redhat.com>
Date: Thu, 2 Nov 2017 16:56:28 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.3.0
MIME-Version: 1.0
In-Reply-To: <1508784509-29377-1-git-send-email-thuth@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.28]);
	Thu, 02 Nov 2017 20:56:29 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH] hw/ide/ahci: Move allwinner
 code into a separate file
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
Cc: qemu-trivial@nongnu.org, qemu-arm@nongnu.org, qemu-block@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: I0lV6Hrr//SJ



On 10/23/2017 02:48 PM, Thomas Huth wrote:
> The allwinner code is only needed for the allwinner board (for which
> we also have a separate CONFIG_ALLWINNER_A10 config switch), so it
> does not make sense that we compile this for all the other boards
> that need AHCI, too. Let's move it to a separate file that is only
> compiled when CONFIG_ALLWINNER_A10 is set.
> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>

Belated, as it's already merged to master, but:

Thanks, applied to my IDE tree:

https://github.com/jnsnow/qemu/commits/ide
https://github.com/jnsnow/qemu.git

--js
