Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp2884708wrt;
        Mon, 14 Jan 2019 02:31:38 -0800 (PST)
X-Google-Smtp-Source: ALg8bN5k1IaVsvv6nqd8pbXY+2C6wNaJO27AFJ6kCLGRWB8Sqzq6U52DiV6kLxdT8+Dc4p6Bb0t/
X-Received: by 2002:a1c:8f41:: with SMTP id r62mr10703330wmd.141.1547461898798;
        Mon, 14 Jan 2019 02:31:38 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1547461898; cv=none;
        d=google.com; s=arc-20160816;
        b=Qmt0uyqy+iBCCWelXyyVQ+qD2EZp4YtkJld4RKCpO63cPZCB8XxaUzvLLYCWl7zYva
         98zk2Ig5NS/5pIKgTfdKJe2MK23O/BKm00id5rBbY2j3b0AZIdaTea47/W65/a6O6qcv
         ZhJd8Ehs3BR189M6Fh84J6wFCNAGQBvopPGlMnffEnZSVSJUF12gv4BNL+SEWVu6IPct
         0gRDE3Wo5hAt9NpilaxBSW4cG1nWk7Aw4/LUaza9EjaH124W8oA3ulFetG1BoeCdNVGN
         qX4cr6DkXu4xoiyTpVq8NY8DLttNjxHzxZAuv2nD2BoBcziJScMOe3MoaknS+4wh/GNk
         S1NQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to;
        bh=8wJbY17/f06lMXGrQA6ray344Svez0dL+cKLHzhG6t0=;
        b=VaytC6q8JEVkDNm80nQwM2mwEDF/C39bS7yYXW9J4b5JrnMQ1cuOik6kWYXFfKQ3G8
         5D8n011oD0c9nE35lfE/iVyyR0CmC6MkfkCqRdcMWzQT6UyYX5UchqLUThFK7UofagLj
         USMauxtZ6Ii14BIx/gHCS+P8CUgXVXm96rGbGh385xF6konMd0q20B/b6YOJ3kV3ufKF
         kI0C/zH652cMewhLz3C0BQl2mtt4t8zphJ7QXJqwAVj7rGSD6oL34ExU+vQG1YtvRT8G
         0QLLFg+3KdAKWNciuTRn/SvVmcJ+U4VxqXDGu3ssM+fcEjcnBXKJq+8U8YL2K0uOWGed
         jUtw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 79si12599446wmh.7.2019.01.14.02.31.38
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 14 Jan 2019 02:31:38 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:38920 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gizWr-0004I4-RV
	for alex.bennee@linaro.org; Mon, 14 Jan 2019 05:31:37 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50984)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1gizW3-0003tu-KA
	for qemu-arm@nongnu.org; Mon, 14 Jan 2019 05:30:49 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1gizW2-000882-Sl
	for qemu-arm@nongnu.org; Mon, 14 Jan 2019 05:30:47 -0500
Received: from mail-wr1-f66.google.com ([209.85.221.66]:42770)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philmd@redhat.com>) id 1gizW2-00086x-Mx
	for qemu-arm@nongnu.org; Mon, 14 Jan 2019 05:30:46 -0500
Received: by mail-wr1-f66.google.com with SMTP id q18so22156555wrx.9
	for <qemu-arm@nongnu.org>; Mon, 14 Jan 2019 02:30:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=8wJbY17/f06lMXGrQA6ray344Svez0dL+cKLHzhG6t0=;
	b=dXCD4Cx+UIdozBvHl+NK7bsa44DMfQdv23veqCgafNOigPXcSUxvnyiEA+h9aNjt6f
	J9MYhSmzLII74SpxwREPLmnyoVuaII9++Ft62YUaYA8MO/8AhZHpkVnyLs7vkKTE/itz
	nCX5H4KQfLdMiVAsdB+tnO8b7WrH4t+JjnJ9RP5pGivT24dbQOxepUU727rcoUMsj4od
	xhsUXoCwvYz0VtTpvNNs6G9nu8Y4KiiIcYq4yLYs3GZMgPhQzcCbWvcAZYR/7OjGjrBY
	LtRptSZX0zTGei4do7w5sWXkQpWao27dFKY2IYjne/Ghi19GbTKg4VtSyAVvW4Tw5mCI
	psmw==
X-Gm-Message-State: AJcUuke5H0QGdkf3ERYiRrEalDIZLIvmy0QAYzGCf7ns20rb+v7zutvz
	qG9g46GlR1l+bYSt/L1qhqP7IQ==
X-Received: by 2002:adf:9d85:: with SMTP id p5mr22499659wre.41.1547461845759; 
	Mon, 14 Jan 2019 02:30:45 -0800 (PST)
Received: from [192.168.1.33] (110.red-83-51-161.dynamicip.rima-tde.net.
	[83.51.161.110]) by smtp.gmail.com with ESMTPSA id
	s8sm87375251wrn.44.2019.01.14.02.30.44
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 14 Jan 2019 02:30:45 -0800 (PST)
To: Thomas Huth <thuth@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
	qemu-devel@nongnu.org
References: <20190111140857.4211-1-philmd@redhat.com>
	<20190111140857.4211-11-philmd@redhat.com>
	<3d52c4eb-1254-08e2-440c-3edb42c2ba01@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Openpgp: id=89C1E78F601EE86C867495CBA2A3FD6EDEADC0DE;
	url=http://pgp.mit.edu/pks/lookup?op=get&search=0xA2A3FD6EDEADC0DE
Message-ID: <1588529c-2606-5994-2a25-10e3488e7f28@redhat.com>
Date: Mon, 14 Jan 2019 11:30:44 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.3.1
MIME-Version: 1.0
In-Reply-To: <3d52c4eb-1254-08e2-440c-3edb42c2ba01@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.221.66
Subject: Re: [Qemu-arm] [PATCH 10/15] range: Remove Range from
 "qemu/typedefs.h"
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
	Xiao Guangrong <xiaoguangrong.eric@gmail.com>,
	qemu-block@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>,
	qemu-arm@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Igor Mammedov <imammedo@redhat.com>, Laszlo Ersek <lersek@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ah2zjkG3g7FZ

On 1/14/19 9:56 AM, Thomas Huth wrote:
> On 2019-01-11 15:08, Philippe Mathieu-Daudé wrote:
>> Range is only used in "hw/pci-host/q35.h" in the MCHPCIState, and
>> in "hw/pci/pci.h" by pci_bus_get_w64_range().  Let them include
>> "qemu/range.h" directly to simplify "qemu/typedefs.h".
>>
>> To clean "qemu/typedefs.h", move the declaration to "qemu/range.h"
>> (removing the forward declaration).
> 
> Since Range seems to be meant as a common type (i.e. not specific to any
> device like the other typedefs that you move in this series), I think
> it's should be OK if this resides in typedefs.h ?

My idea was to clean files not very used, and this one is only used
twice. Why rebuild the World if someone add another function or fix a
typo in "qemu/range.h"?
I agree this typedef is meant for global use however.

Since I don't have a strong opinion, I'll drop it (until someone else
respond to this thread).
