Received: by 10.223.188.70 with SMTP id a6csp4192718wrh;
        Mon, 28 Aug 2017 01:42:06 -0700 (PDT)
X-Received: by 10.55.214.6 with SMTP id t6mr7670716qki.273.1503909726628;
        Mon, 28 Aug 2017 01:42:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1503909726; cv=none;
        d=google.com; s=arc-20160816;
        b=iWSuvnSWDIpY6qbsiieZSQKuwh5YfBoZUi6eIahqKyB1ebPuGj+crbWaj7c/rcGT8r
         7qTmrusGFOKnzEXgDyFTYcRKg1p/pvzF1/ORU1t8auSrCf6NL8FPTqTZa///9zV5qAIM
         keuUONrq/bb5jy6rBvqPtLfuBMeodvSOtMsT3an/7sMeLcYe6//1xIp6S2qBYWH7rb4p
         0l9GKAviMfAnwc1ODJP1cLVhUOjyVVFpHO7lMLweZYhi6WEGux4WgqZiX5A1oCg+F/Sc
         HvHaTKIGNm6r947dtW37ipgs/DlulrBibn1rk2V4BK8jDgUn2H6IQZmCykh9KCFj45sL
         KgpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:mime-version:message-id
         :date:user-agent:references:in-reply-to:to:from:dkim-signature
         :arc-authentication-results;
        bh=MQM0k6tQuFVr+P19nPvulRPRjSnfAvTd/nalCOe9akM=;
        b=M72DkKoJayVs4vDWhVChqEeU6IYvNpSvI4cAUQMTNa4i6fGWJWpNcYAw968VX4i0K+
         egIb/AM2X39EG6yFkhEb4gfFc21fRkhPbtWEP4+RG/+TSteq1jJUogQIgwQeo6S21QHi
         8Z+M6rg1mq8RF+Jj5DX1U7oh3ZUzZoIEPyHkT20se4btWc5yWM8xn0FxBdcPs9eXlqmv
         upujlJvqbTMQvIFNVj//zqJeYm/qwp8BG2JdTtOsMJixQRfm92255BU7M2sX6qrp3byO
         ijqLFxZBdqlgBxqrFwaKAjNq1j2HtMayZkBYLScfPoUAYHiUSK4Zs+ARdzlzdB2+BDgK
         zl9g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@igalia.com header.s=20170329 header.b=o6Ei9uua;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 74si5387081qkt.392.2017.08.28.01.42.06
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 28 Aug 2017 01:42:06 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@igalia.com header.s=20170329 header.b=o6Ei9uua;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:37519 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dmFcS-0003vI-Ib
	for alex.bennee@linaro.org; Mon, 28 Aug 2017 04:42:04 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35854)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <berto@igalia.com>) id 1dmFbJ-0003Ip-Qc
	for qemu-devel@nongnu.org; Mon, 28 Aug 2017 04:40:54 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <berto@igalia.com>) id 1dmFbE-0006bm-VU
	for qemu-devel@nongnu.org; Mon, 28 Aug 2017 04:40:53 -0400
Received: from fanzine.igalia.com ([91.117.99.155]:59388)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <berto@igalia.com>)
	id 1dmFbE-0006QS-Gk; Mon, 28 Aug 2017 04:40:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; 
	h=Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From;
	bh=MQM0k6tQuFVr+P19nPvulRPRjSnfAvTd/nalCOe9akM=; 
	b=o6Ei9uuaayWoGQYIxznxbYphd9bBN1zc5nfr3S//a+1A7J1O0zbxdIpGvzLFVl6MjrLzK43AniwMkURSDquF4T9wx82qgKFmNZ5EYibGQ+K3C56iSvRmcefWS9GG7yy2Y1ESwYzSaivyICulA8EmJdzSyEMDn6/whi4xoNBp5C6gfizBEs5NHhVSR2zCidVPAhXH+9Yr4wkIkQmaWM5z6noiQlWpmITs4+XjbwOQMVeZLhhUjtZMP84FG+hYlZl25o3bdpr7DPsUl5//HjPcoCa4GgD04LTA7IUE9QsFDmK3zZihxVcxqSPBoCGGDSpgst+C68M3JFi3cyAg/Vkiyg==;
Received: from maestria.local.igalia.com ([192.168.10.14] helo=mail.igalia.com)
	by fanzine.igalia.com with esmtps 
	(Cipher TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim)
	id 1dmFac-0004HA-7X; Mon, 28 Aug 2017 10:40:10 +0200
Received: from berto by mail.igalia.com with local (Exim)
	id 1dmFac-0005d1-53; Mon, 28 Aug 2017 10:40:10 +0200
From: Alberto Garcia <berto@igalia.com>
To: Eduardo Habkost <ehabkost@redhat.com>, qemu-devel@nongnu.org
In-Reply-To: <20170825193922.GN27715@localhost.localdomain>
References: <20170823221445.15243-1-ehabkost@redhat.com>
	<20170823221445.15243-5-ehabkost@redhat.com>
	<20170825193922.GN27715@localhost.localdomain>
User-Agent: Notmuch/0.18.2 (http://notmuchmail.org) Emacs/24.4.1
	(i586-pc-linux-gnu)
Date: Mon, 28 Aug 2017 10:40:10 +0200
Message-ID: <w51y3q4ulud.fsf@maestria.local.igalia.com>
MIME-Version: 1.0
Content-Type: text/plain
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x (no
	timestamps) [generic] [fuzzy]
X-Received-From: 91.117.99.155
Subject: Re: [Qemu-devel] [PATCH 4/5] pci: Add INTERFACE_LEGACY_PCI_DEVICE
 to legacy PCI devices
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
Cc: xen-devel@lists.xenproject.org, qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
	qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: RikTfQCsyYRR

On Fri 25 Aug 2017 09:39:22 PM CEST, Eduardo Habkost wrote:
> CCing maintainers of affected devices (sorry for not CCing you
> before).

>> diff --git a/hw/ipack/tpci200.c b/hw/ipack/tpci200.c
>> index 4dfa6b3..e380378 100644
>> --- a/hw/ipack/tpci200.c
>> +++ b/hw/ipack/tpci200.c
>> @@ -646,6 +646,10 @@ static const TypeInfo tpci200_info = {
>>      .parent        = TYPE_PCI_DEVICE,
>>      .instance_size = sizeof(TPCI200State),
>>      .class_init    = tpci200_class_init,
>> +    .interfaces = (InterfaceInfo[]) {
>> +        { INTERFACE_LEGACY_PCI_DEVICE },
>> +        { },
>> +    },
>>  };

Acked-by: Alberto Garcia <berto@igalia.com>

Berto
