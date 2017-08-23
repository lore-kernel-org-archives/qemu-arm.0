Received: by 10.223.188.70 with SMTP id a6csp260808wrh;
        Tue, 22 Aug 2017 22:22:43 -0700 (PDT)
X-Received: by 10.237.56.228 with SMTP id k91mr1959645qte.146.1503465763472;
        Tue, 22 Aug 2017 22:22:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1503465763; cv=none;
        d=google.com; s=arc-20160816;
        b=tC6eUmvrybGQjv4Q0UHu7vnJMFXB0tNbl7EJu+FaXNSLchLgolLeqwgjdDhHnWKD3o
         1wTtPDckbFeRhHCdVd8nV0VVLtYRqWOEEVU+4yWPSh2omC64Y3ePrYV9fSS28IGy5f97
         YJi2e2PT7Y9FBh5zBHVhfVuasV0dXB3AUu5Le6JjElFZIITPldft66nxS1idwInIiR0O
         y1TTtJInzdkUQfWWhnUMpGjyi14vH/vTBmU7nhCp+0HGSumWZ4z++SJCAt5gUh/GUSnI
         o2VrpIFh9DXbpCTI0htXhacul2NDDXFvgaS4JWDtL29QA4rd0lfexaE3hvP/i6PpTQvj
         VgPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:dmarc-filter
         :arc-authentication-results;
        bh=ifja4dtrAwwXHOKgAjjX5OiV1irF31DqRoKcMyiKPss=;
        b=Mpdfrjhh4+1ynn6D4oW10HydH+y4l2SIXQx5TyUSRrGCcAFlBSs15pFd2h7iaseaFX
         sFhyzkJ9+OAcHOewG8VrO+ECumHgxkK6ZA3jVq+9se+BkoTXwJDKR5OjdlxrRRUhIV1C
         8uxlLvgGCReo5+QrOUQnbjiwokZhcgeIYOIYA+q5ZA+T4+z9sH7dpQCfeTnkPWf9fm46
         a8sIxWq7bsEZ5NWsS9e1QVADZ8iuFhijGH/Mjomc/51GCIFzhLqw4uHZmgTIh3fLrLVf
         4b9NuoKtPTyzESBNLFgfP9oQQKhBJp+poa2zsfqfObA4yNMV89r7DEyikH5v+RXBD1/7
         x/HQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id x35si705145qtc.251.2017.08.22.22.22.42
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 22 Aug 2017 22:22:43 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:39009 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dkO7l-00084N-3Z
	for alex.bennee@linaro.org; Wed, 23 Aug 2017 01:22:41 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36212)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1dkO7d-00082b-Vv
	for qemu-arm@nongnu.org; Wed, 23 Aug 2017 01:22:34 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1dkO7a-0005eQ-1b
	for qemu-arm@nongnu.org; Wed, 23 Aug 2017 01:22:33 -0400
Received: from mx1.redhat.com ([209.132.183.28]:40166)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <thuth@redhat.com>)
	id 1dkO7Z-0005dv-RA; Wed, 23 Aug 2017 01:22:29 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 6F6A780B2A;
	Wed, 23 Aug 2017 05:22:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 6F6A780B2A
Authentication-Results: ext-mx04.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx04.extmail.prod.ext.phx2.redhat.com;
	spf=fail smtp.mailfrom=thuth@redhat.com
Received: from [10.36.116.93] (ovpn-116-93.ams2.redhat.com [10.36.116.93])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A59F0619A0;
	Wed, 23 Aug 2017 05:22:26 +0000 (UTC)
To: KONRAD Frederic <frederic.konrad@adacore.com>
References: <1503414375-21009-1-git-send-email-thuth@redhat.com>
	<27da1dae-1e2f-559a-d8f0-c7e15289363e@adacore.com>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <d5be8092-dc56-14aa-b950-d82e7f959ec1@redhat.com>
Date: Wed, 23 Aug 2017 07:22:25 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.2.0
MIME-Version: 1.0
In-Reply-To: <27da1dae-1e2f-559a-d8f0-c7e15289363e@adacore.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.28]);
	Wed, 23 Aug 2017 05:22:28 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [PATCH] hw/misc/auxbus.c: Mark the aux-to-i2c-bridge
 device as non-hotpluggable
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-trivial@nongnu.org,
	qemu-devel@nongnu.org, Alistair Francis <alistair.francis@xilinx.com>,
	qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: kvlexa+J3n0S

On 22.08.2017 20:15, KONRAD Frederic wrote:
> Hi Thomas,
> 
> Looking to this seems there is a second issue:
> The aux-to-i2c-bridge device should connect on a TYPE_AUX_BUS.
> 
> I don't think there isn't any on integratorcp..
> 
> Anyway the patch you sent fix this issue indirectly and as far as
> I remember I wasn't able to make this I2C bridge an
> TYPE_AUX_DEVICE as it's a special device and it is internal (only
> instantiated at the bus creation).

If it is intended to be completely internal only (i.e. also not for use
with the "-device" parameter), then it should even be marked with
"user_creatable = false"! ... if you got some spare minutes, could you
maybe sent a patch for that? I'm not familiar with that code, so I'm
always having trouble to give the reasoning for setting a
"user_creatable = false" somewhere...

 Thanks,
  Thomas
