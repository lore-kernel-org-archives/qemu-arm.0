Received: by 10.25.0.6 with SMTP id 6csp342824lfa;
        Fri, 26 May 2017 08:01:41 -0700 (PDT)
X-Received: by 10.237.36.3 with SMTP id r3mr3078523qtc.200.1495810901693;
        Fri, 26 May 2017 08:01:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1495810901; cv=none;
        d=google.com; s=arc-20160816;
        b=z4yHsSnN1/XdGU9XDJJuAyu9qH35v3SZAyRvUVR2ihIjTHTEHEwOdxeglqKMoYe9cs
         ADDsEPfVoMk9KIhpnUitom1a0gwimSzJwffA2rrE/ASP9VitUPkWv0hiIFpsOjvrVKuZ
         oZhiZ4/5DsVETjUDcMrOVrDxEby7l5NLwJfzg+r6mXcSz/mblWj2+K8OyDQn9F5rAvmp
         Bqsf8mfcXFIjnbUCrNyQnbp3p77Fz/v28nE293rsI9nJE7pgZLOUsSvzBCkmoYtMimx/
         1OfCP9JTT0uL/VOBF1RGDO/XXMK6jZyd4//+DYorSxaBbKRv4zpP6zgICYIAbgFSYNPD
         B+wA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date
         :dkim-filter:dmarc-filter:arc-authentication-results;
        bh=u448yjFtfP4vLmviCYL1FmUMuoeMVhJlLd9BYM97u3Q=;
        b=wxAbe/YJNrTYQz7jSCThJr/ZjmUzc+RFqfvlu1YdyLBjLg0c7k5NoXVgoEruRcvwsv
         e2uGoO2yFBnEQS+Mle7Sg11bGWJV/RnhN1+gNf3Ib/xWAhYMEoxbPPyOgRkaKl32W2Ap
         OwfEaOVvUl/k4rMUQbpDp8L4YN3ntjx5Q89Bo4Enz2cHUGpSdkSuutW3Ez4sYDBU8Q8d
         iEoymdyHzF6CEcA9SMgNiliZjySwRYMAncpg+78YXOlxW95abtpD3mNmZ9305Qh1OsQ+
         PtxpF+ldvZ7F6xm3evm0gGykqg2+N2IM+sCrrXX68NJwTAnElTHD9s/kN/cTyZsExN6z
         2U+Q==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id e30si978953qtf.272.2017.05.26.08.01.41
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 26 May 2017 08:01:41 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:37187 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dEGkH-0006Cv-6L
	for alex.bennee@linaro.org; Fri, 26 May 2017 11:01:41 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40659)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1dEGk5-0006CO-SX
	for qemu-arm@nongnu.org; Fri, 26 May 2017 11:01:35 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1dEGk2-00009k-RU
	for qemu-arm@nongnu.org; Fri, 26 May 2017 11:01:29 -0400
Received: from mx1.redhat.com ([209.132.183.28]:40182)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <ehabkost@redhat.com>)
	id 1dEGk2-00008P-LZ; Fri, 26 May 2017 11:01:26 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 7C10580C10;
	Fri, 26 May 2017 15:01:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 7C10580C10
Authentication-Results: ext-mx02.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx02.extmail.prod.ext.phx2.redhat.com;
	spf=pass smtp.mailfrom=ehabkost@redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.redhat.com 7C10580C10
Received: from localhost (ovpn-116-57.gru2.redhat.com [10.97.116.57])
	by smtp.corp.redhat.com (Postfix) with ESMTP id DB2287C777;
	Fri, 26 May 2017 15:01:23 +0000 (UTC)
Date: Fri, 26 May 2017 12:01:21 -0300
From: Eduardo Habkost <ehabkost@redhat.com>
To: Igor Mammedov <imammedo@redhat.com>
Message-ID: <20170526150121.GF22043@thinpad.lan.raisama.net>
References: <1495550330-34087-1-git-send-email-imammedo@redhat.com>
	<1495550330-34087-2-git-send-email-imammedo@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1495550330-34087-2-git-send-email-imammedo@redhat.com>
X-Fnord: you can see the fnord
User-Agent: Mutt/1.8.0 (2017-02-23)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.26]);
	Fri, 26 May 2017 15:01:25 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v2 1/5] numa: consolidate
 cpu_preplug fixups/checks for pc/arm/spapr
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
Cc: Andrew Jones <drjones@redhat.com>, qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
	qemu-devel@nongnu.org, David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: F91Qr6/Qi3kV

On Tue, May 23, 2017 at 04:38:46PM +0200, Igor Mammedov wrote:
> Signed-off-by: Igor Mammedov <imammedo@redhat.com>
> Reviewed-by: David Gibson <david@gibson.dropbear.id.au>

Queued on machine-next, thanks.

-- 
Eduardo
