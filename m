Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp246373lfp;
        Mon, 20 Jan 2020 06:11:50 -0800 (PST)
X-Google-Smtp-Source: APXvYqxMvZjaSOaI0hXuN/vHXy4JCAN49n/g6troFdSteCSj3LiCjrxkKEa2L25HLbnimXj7QphB
X-Received: by 2002:a17:906:4a97:: with SMTP id x23mr21020732eju.66.1579529510452;
        Mon, 20 Jan 2020 06:11:50 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1579529510; cv=none;
        d=google.com; s=arc-20160816;
        b=kF7B4VjXYLJSi7MLubTUnbXt5HxA/CmL94J/YeDoLyJBfEHTdzqoyekaOBZ5nnbiuS
         qnFzTVfwflwhBBf0djCC7oQ+t0BF5e7uQHi2PhZ3F+240ZOv55yE324tfZ9sCnw65KwF
         eOgzQZuHCFicYd5HdSLdvJVN9/13b8p8gin4IoEBztPzF+PD0L9fh0R/GjeUhiymxEZd
         RsdNo2QyhRW27GadRI51DuYbCEEceQNRWjN2BEcJzV3veehozTArJxPOqZAbYixIorjf
         ZH3JgaEMVdoYICaqgJsea7jbqa/c0AwNMtySGBXycAnjVmfu6TIqd3Dn3l4oBl+sLdk3
         PXOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=CDGAV3QhU/eE1Y7cuVyRbz2nXej2CCA9CZvlP9eg7jc=;
        b=ewsaIrGexDATDYjhU/7Pq67+gXwLYRZdn/L/r/SxXRKcqMeFjjnYoLhN0dskJBOuXd
         6f/Obks9Ls1iMNXXlhulQL651LHvPL1l8tKgCxreIaCLeC7UPvsAvpXHd6LODyvGSZSj
         VAO/TWE7eLKqrdu1vZd+XVpO2Va+y7/+gB7eYfQ3Fl1g3Cm6M7zd72kvVs2pUzL16eQD
         ST8FcY26Tl/50T/wyZ03dPYjUyUQLdeQu60CUvf5Ka9VWue8ZMCWN6MXMgFcBG5ZOKOI
         gGNV+Zd0g5P/TmwosQxi9mxjwElBbp6r//NxTNDwVsuKcBCaAeuz/xYDMDCSgE6goHfO
         gl1w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=Z0Sq1fJF;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a25si22448578ejx.331.2020.01.20.06.11.50
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 20 Jan 2020 06:11:50 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=Z0Sq1fJF;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:37184 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1itXmP-0001kw-2t
	for alex.bennee@linaro.org; Mon, 20 Jan 2020 09:11:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38571)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1itXmE-0001kc-6n
 for qemu-arm@nongnu.org; Mon, 20 Jan 2020 09:11:41 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1itXmA-0006Jr-CR
 for qemu-arm@nongnu.org; Mon, 20 Jan 2020 09:11:38 -0500
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:30755
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1itXmA-0006JD-8V
 for qemu-arm@nongnu.org; Mon, 20 Jan 2020 09:11:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1579529493;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=CDGAV3QhU/eE1Y7cuVyRbz2nXej2CCA9CZvlP9eg7jc=;
 b=Z0Sq1fJFLJ6FKHUwNqRI8YkUnBMoaAniVA1JlkrTB3khUuP6DldKu+kFCMXZkXDMuJCIYJ
 LIUhZM/l+KMTh9BMC9m8hQVirZV+UYBmTV8OVly+PVVsehBSPRSgMLTXkE9g2Nws6lj3/9
 ONkbTXo1QIjIAAaEWAOAIg5lTcZUZoY=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-330-H1ERMKbBOpKT_jfoc2SRVg-1; Mon, 20 Jan 2020 09:11:32 -0500
Received: by mail-wr1-f69.google.com with SMTP id t3so14101815wrm.23
 for <qemu-arm@nongnu.org>; Mon, 20 Jan 2020 06:11:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=SxnHpeVt7Kxi5Mq7w5H+O8eTfhJBUNne0/A1tG5HIpU=;
 b=AJX45MS6OiZRemaayoxzw3lNitT1WLUW836Q+vtQolGD/pmP+Gf8epZGBbecZTa6MM
 F46F8MTEYjmjs4LtgRkIqD5e0j1t45/OugrPrlYYtgoO9ZBtRrGVTcC9RJcaJvaJQqvH
 5ZJbR/NPBUIu0p0IId/5ckqyqHDDMieni1eR48rVrjzXnc9TJDPfHdsSMfs50R83daS+
 QGaRh7ux3mqYU1oLH3Y1xg9MdQGyQhLn5hbQ+M9s76riCG8ItkZOXS8YtOUqwwamShTB
 v7wvklAnUdzadkLnFcKCY/0NMIM+sX5lOudPN6eZ6qMb6GH8vn6DaLaCOkuZ3nmwOfy4
 YcKw==
X-Gm-Message-State: APjAAAVcfn775viaT2Q66JHYwrKWzIqqlwOPUkE/2HoxhBIqhHdC+EFs
 +XJd2gpxQLYV3qxCS82MUcQWloWacuxtP7u7rkMtAM/SRsA03aQaWC7dIBFsnsMAKQvv9/SGOS2
 4t7ltsVBWT4fw
X-Received: by 2002:a5d:46d0:: with SMTP id g16mr17916651wrs.287.1579529489355; 
 Mon, 20 Jan 2020 06:11:29 -0800 (PST)
X-Received: by 2002:a5d:46d0:: with SMTP id g16mr17916620wrs.287.1579529488979; 
 Mon, 20 Jan 2020 06:11:28 -0800 (PST)
Received: from [192.168.1.35] (113.red-83-57-172.dynamicip.rima-tde.net.
 [83.57.172.113])
 by smtp.gmail.com with ESMTPSA id n10sm46877943wrt.14.2020.01.20.06.11.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 Jan 2020 06:11:28 -0800 (PST)
Subject: Re: [PATCH v2 2/2] MAINTAINERS: Move the OMAP section inside the ARM
 Machines one
To: Peter Maydell <peter.maydell@linaro.org>
References: <20200118085509.30182-1-philmd@redhat.com>
 <20200118085509.30182-3-philmd@redhat.com>
 <CAFEAcA92AOY1m9yUew4WtwKfJ63kSF-xwnaYNjmxY33rJEhzJg@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <1c978771-a622-f0ca-3fa4-d3e27c416391@redhat.com>
Date: Mon, 20 Jan 2020 15:11:27 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <CAFEAcA92AOY1m9yUew4WtwKfJ63kSF-xwnaYNjmxY33rJEhzJg@mail.gmail.com>
Content-Language: en-US
X-MC-Unique: H1ERMKbBOpKT_jfoc2SRVg-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 205.139.110.120
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Alistair Francis <alistair@alistair23.me>,
 QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: mdfyBwVJI0q6

On 1/20/20 2:24 PM, Peter Maydell wrote:
> On Sat, 18 Jan 2020 at 08:55, Philippe Mathieu-Daud=C3=A9 <philmd@redhat.=
com> wrote:
>>
>> Add the Siemens SX1 (OMAP310) machines with the other ARM machines.
>=20
>> +OMAP
>> +M: Peter Maydell <peter.maydell@linaro.org>
>> +L: qemu-arm@nongnu.org
>> +S: Maintained
>> +F: hw/*/omap*
>> +F: include/hw/arm/omap.h
>=20
> This is the block that covers the various devices
> and SoC objects for all the OMAP boards. I'm not clear
> why the commit message calls out the SX1 in particular ?

I missed that indeed, thanks.

