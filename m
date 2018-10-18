Received: by 2002:a5d:4c4c:0:0:0:0:0 with SMTP id n12-v6csp2373548wrt;
        Thu, 18 Oct 2018 07:30:33 -0700 (PDT)
X-Google-Smtp-Source: ACcGV61dgsbV5e0nd2XejeFN4ZyMB9JEBgImFELPWKxhhnuerx0wvY52f7P1ZkhOFkNQKaz6LddR
X-Received: by 2002:ac8:5257:: with SMTP id y23-v6mr29474763qtn.78.1539873033613;
        Thu, 18 Oct 2018 07:30:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1539873033; cv=none;
        d=google.com; s=arc-20160816;
        b=aYWE5ye2PiMe/m1gEXTH5o+ARlbrrK30J/9pI0WPF499WzIsJMyqvigSL99/kXbOqH
         WV4yw+679xMy08aau/ImzyqZYB3WP4inNPqH8EFGSnkiIsnIYr5QIaJZsiQ3nUdkAJJS
         oa5sHwHmofLMO6c319lRoN7AYilz+98vOfEl/5CZMxt2xQKvBaEeNAiNv9RN2F/XZVpA
         AU6StBXKDjQsLRY88bLeGnsG7jJSfY2iuF11xlek2s0Q8rZ75Y5zaGoCEQgyh58bpssn
         I6P+ueY3CA/bxrT+7BwKNeQ2pT7jDJ0EoiSyxgV4/5C7HTLJCd05xFEg8IuJlYc/vGWj
         ouMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature;
        bh=+T+0170OiapUlLYmR6mwDrtKZwk+UpgBi75YYnUq0Qc=;
        b=Fh2hn5radcOjQQn2peFyE/myZ/MBP1+fvcXsWXqkx37WhfYFsNCZWhhCqiMt6bzGI+
         LrWWTwU2fe387kP7a0pl9TU/cReDNqadQOpFV/fiGj/Plt93mwco/OkIIxg4hXpJ4A/D
         ELGZI1ARA2eMx6nFS9o3yeZV9X30Oi0j6MJ4yvIcpxT1o7JIUTy50PbuvCF1Df/BYJwp
         GYE9enMwVkEfwYZNmbe1pJjYXztrDsU28tBfCx3hmTgHQToGxMgYv8HFlWKZdXTtlun8
         89thoXLnoPcKwVpT1PMmf6IjQr9/9A9UQSOE7XAs0HznUAXqXXeo26YlyrYOFyNxMfUR
         YTZg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=bsxx4GQi;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id n94-v6si4138617qtd.110.2018.10.18.07.30.33
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 18 Oct 2018 07:30:33 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=bsxx4GQi;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:42668 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gD9Jp-0004uy-5K
	for alex.bennee@linaro.org; Thu, 18 Oct 2018 10:30:33 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35347)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1gD9J9-0004Zv-DL
	for qemu-arm@nongnu.org; Thu, 18 Oct 2018 10:29:51 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1gD9J8-0005H1-L2
	for qemu-arm@nongnu.org; Thu, 18 Oct 2018 10:29:51 -0400
Received: from mail-oi1-x242.google.com ([2607:f8b0:4864:20::242]:41070)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1gD9J8-0005Dp-4q
	for qemu-arm@nongnu.org; Thu, 18 Oct 2018 10:29:50 -0400
Received: by mail-oi1-x242.google.com with SMTP id l197-v6so24142963oib.8
	for <qemu-arm@nongnu.org>; Thu, 18 Oct 2018 07:29:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=+T+0170OiapUlLYmR6mwDrtKZwk+UpgBi75YYnUq0Qc=;
	b=bsxx4GQi1h9H+eodwcb5bS2h98r3XGAGf2xbW2I+clkSdbWc9O8IjTOeZazAOPOv4W
	f5iWKVHK/eTW2kq8cMlaiVpozRRRJZ6jGRpTHqDAahRTdm3CywIV+VDSQ4kRNaPjhTqW
	gqfnNphvcngeZhTrUIf0NOKlG3UUYxvqYkf2c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=+T+0170OiapUlLYmR6mwDrtKZwk+UpgBi75YYnUq0Qc=;
	b=jsXbiG0bnWera9ZLQtRkpgm7c83gdjoIoCMvIgAGTqXLC5xRDIWLwOAT2Ud/JMFIih
	q3XvBlCUUYPjyYQ/j+cG2t6aSjtoEhb65GU7dharsv3ts4t1EulpXENfnfRl/xwH8Ifq
	NbMESmz69hSs2oe3wOGIonjDccrgZGvqccpHFxVthBWg3a6B17sBc2/bWWHxhzPAwMhk
	0EY9vYd7kT9PzHNAdVrncbiscOmjR8G0rtzYanXcKrPVvgwqnkzI7D3a89ewhyPIFkka
	jQYGfv037LUa0UqwNWhlL27QyLP7DNtMN3LddOQ+RQSW9lQbWKdLwqLWYQC4hy18TTWB
	7Spw==
X-Gm-Message-State: ABuFfojr4iD9i9S0+QO4mmMcyxjUKEGQo1lh09VO7PFuFsRj0IU3cSjb
	UrU50S7T96awuZovSyxpvg4jX63ZGWxEoQ9lo412lQ==
X-Received: by 2002:aca:c392:: with SMTP id
	t140-v6mr17191038oif.325.1539872989418; 
	Thu, 18 Oct 2018 07:29:49 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:7c90:0:0:0:0:0 with HTTP; Thu, 18 Oct 2018 07:29:28
	-0700 (PDT)
In-Reply-To: <20181018142743.29489-1-eric.auger@redhat.com>
References: <20181018142743.29489-1-eric.auger@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 18 Oct 2018 15:29:28 +0100
Message-ID: <CAFEAcA-dy=OdwwzjHcLjSACaZnPb=PzTK-fUvzL5R=iMxMhqjA@mail.gmail.com>
To: Eric Auger <eric.auger@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::242
Subject: Re: [Qemu-arm] [PATCH] hw/arm/boot: introduce fdt_add_memory_node
 helper
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
Cc: Andrew Jones <drjones@redhat.com>, QEMU Developers <qemu-devel@nongnu.org>,
	Shameerali Kolothum Thodi <shameerali.kolothum.thodi@huawei.com>,
	qemu-arm <qemu-arm@nongnu.org>, Igor Mammedov <imammedo@redhat.com>,
	Eric Auger <eric.auger.pro@gmail.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: efWruBFs+nU8

On 18 October 2018 at 15:27, Eric Auger <eric.auger@redhat.com> wrote:
> From: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
>
> We introduce an helper to create a memory node.

Hi; this seems to be missing the rationale for doing this ?

> Signed-off-by: Eric Auger <eric.auger@redhat.com>
> Signed-off-by: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>

thanks
-- PMM
