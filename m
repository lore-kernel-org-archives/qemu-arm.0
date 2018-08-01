Received: by 2002:a5d:6782:0:0:0:0:0 with SMTP id v2-v6csp575449wru;
        Wed, 1 Aug 2018 03:27:22 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpeF/GDHcST3peYsotDLVT+E2XKifSivlHYCR3czm9fhLIL1dflVc1fOm6DZbsJHDI3992V1
X-Received: by 2002:a37:27c3:: with SMTP id n186-v6mr23257897qkn.387.1533119242874;
        Wed, 01 Aug 2018 03:27:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1533119242; cv=none;
        d=google.com; s=arc-20160816;
        b=yexXvJU9ZlEOTL45uN/S9WgILt9yvRQSbGdsnx664ENDj7sp3GRm2d4XNJugca/JQV
         88dcm4op0nFcqUmSAraSG+bNoztef8qLGj6Woq7NyhGAmjH0Tnepkf3O36tEach93aT+
         7/5l+0uqkAYHXHTgg7ktqoFbuk4DOrUtDxCfnLE55LfeEgyEZ227GvLLIr1OvLAjPkGX
         4g/bhJu12lQZSTa7GVaFxOnj/CFSBvw2bXvaiXh391gr3mvn8lir5g1wosRq6lJeqNBr
         x9RjHZ12IrB6noNQdW1OfEY5CfJewuJVZvD+VTBScDuYK4sL303pLl6QJrgaBMoIqsWo
         rvyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to
         :dkim-signature:arc-authentication-results;
        bh=wdyvAKXH6B0jB20sw94F59p8snZItjIxe3YeWeeXtmc=;
        b=tO4KAmGB0D89CMPoxfpNJCjWIoFzOpXO8XMSlaDtKvY755lJTyoPSkB6kjVQ5+P1S4
         Wsp/p/1ELqQkiLfrMzJHSItlTGCThq/q36VX7w4B3jJJPHZzTWXpLC2rMBXM8JBQgoHN
         i0wLXYJWVjZs+S+YQKzXR+e8PbiT1LCAC99W69dNxAf5w5LhTEP9tKLrcrHKd/deRNfy
         q00RHsOlNPzFJ3DAUDBjyQ/ivvv6kX4aEjhXcgeC49S4IUrCPteukrUtS4DrmodArh4I
         sO2JMRls8TCvQdmi0kcronw8AI81ZGyL1Xc/qycEpl3utzoS7NM2V0V1dnIw/laXdXPG
         SspA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=QLspHAPA;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id a17-v6si3444723qtp.320.2018.08.01.03.27.22
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 01 Aug 2018 03:27:22 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=QLspHAPA;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:38836 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fkoLi-0002e7-CM
	for alex.bennee@linaro.org; Wed, 01 Aug 2018 06:27:22 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52605)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1fkoLZ-0002dp-WB
	for qemu-arm@nongnu.org; Wed, 01 Aug 2018 06:27:14 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1fkoLV-0006WG-9B
	for qemu-arm@nongnu.org; Wed, 01 Aug 2018 06:27:14 -0400
Received: from mail-ua0-x22e.google.com ([2607:f8b0:400c:c08::22e]:43565)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1fkoLV-0006W4-4c
	for qemu-arm@nongnu.org; Wed, 01 Aug 2018 06:27:09 -0400
Received: by mail-ua0-x22e.google.com with SMTP id x24-v6so12321329ual.10
	for <qemu-arm@nongnu.org>; Wed, 01 Aug 2018 03:27:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=wdyvAKXH6B0jB20sw94F59p8snZItjIxe3YeWeeXtmc=;
	b=QLspHAPAnDvBip54YUmaAweGvgJxsgMt+8/3eyW8q8cJQZ5iRCxzRVE1mkLeWvBFL9
	PlUWq9lYqyGPZ2V4r7KUqYkiDPPcPI9WgedNX5fpjIA0JZOCmUyw9hBjYtyg5a+HIvAP
	DBDe7oMA47vZVy3snQaCk6gwFuig+d85lR8b0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=wdyvAKXH6B0jB20sw94F59p8snZItjIxe3YeWeeXtmc=;
	b=Zxx5IYuHfVkWNJ+xJCUXGeKzLaKHnSUU3ppX72kLmAUdKb6VlZnFEVI/79j5wS/gS7
	lFwkHJc0MQWURGWUqyC8vKUVcVK1ZjQXmXmHNK4Cw9NMG6BCCed1ZYxmYkp/7rH2TdrW
	hMI38BqwL63Y2QVb5p3s2+PymRAF3UF1oDK9scyad8n8aKfKFw14JCkb6iUlpdbhPYv3
	6B6DqkAyyU8tBtL7BNnDZjCceiElc24fcF/Vwcf1DkZ5lAX3DlQOdY/kGkHn9WEYrnPa
	BGYWAQAoIq8FW/uHMmn7g0oRVgM9myJqy6wibAcGVxDWEqEHSkaPC6KlIlreYHzCw2Na
	7sdg==
X-Gm-Message-State: AOUpUlFRql9FMZA5dZlnjcVe/bMia1/wcdGrDnj8ln5mudyL2kO00KhY
	PMMcI+vGmIBd+FJc+QXMqlO6S78K5AI=
X-Received: by 2002:ab0:1763:: with SMTP id
	k35-v6mr17874243uaf.3.1533119228186; 
	Wed, 01 Aug 2018 03:27:08 -0700 (PDT)
Received: from cloudburst.twiddle.net ([190.166.236.188])
	by smtp.gmail.com with ESMTPSA id
	k129-v6sm4279238vke.54.2018.08.01.03.27.06
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 01 Aug 2018 03:27:07 -0700 (PDT)
To: Laurent Desnogues <laurent.desnogues@gmail.com>
References: <CABoDooMm7+REK+8dbTA1zj2mV-OiiA0w2ib8B7b-1WwVny82PA@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <920ca79f-932e-d9d6-4b57-8974cd67d4cc@linaro.org>
Date: Wed, 1 Aug 2018 06:27:04 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <CABoDooMm7+REK+8dbTA1zj2mV-OiiA0w2ib8B7b-1WwVny82PA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400c:c08::22e
Subject: Re: [Qemu-arm] ARM: SVE movprfx issue
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
Cc: qemu-arm <qemu-arm@nongnu.org>,
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 2RvMZzQghq2R

On 08/01/2018 05:38 AM, Laurent Desnogues wrote:
> there's a typo in sve_movz_d where n[1] is used instead of n[i].

Oops.  Thanks, fix queued.


r~
