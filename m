Received: by 10.28.71.155 with SMTP id m27csp288005wmi;
        Fri, 23 Mar 2018 03:27:00 -0700 (PDT)
X-Google-Smtp-Source: AG47ELt/LY8tA1GkQQ/vMQQIMe3it+rlOKlM2v6rK0yYVQtkc3x6DPYkEmIhTudMI18GEPxLpLZP
X-Received: by 10.237.44.100 with SMTP id f91mr41608756qtd.80.1521800820115;
        Fri, 23 Mar 2018 03:27:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1521800820; cv=none;
        d=google.com; s=arc-20160816;
        b=otmiqJQhymHzt7HT3dp7NJMkeGpuLQe/k1cbDnMQ6gVpTcyi7RGNHwmkZJWkoSSKg2
         +NL9Xa725EWbltEMxbrgD6wL6oI43JMUSnZqMXksE0BvOFNJJEhTrktRylKLMoESbq9r
         HY5BCtSeGW8IAiBVR50Pr3sgHZ3bArgzI/flcGjXPLtgxz9/Xbr/yu7qQmx/mGtrZg3+
         RsjJr/ksYy12zUdf00FxxtxToKdHstZIv4oI/AHgD+YAoto8mSKRSLdrkmcQvjJlCdXM
         POD1Bj4ebgEuV/ljT0d0UV6URmmCnfM6/Nm+FU2p7hDoAwl/7WSPvj0Tbqj/RzbyhTBo
         FBpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=1FeHCVnkwdK0zKC+2NPalboy1JybXlNqioF1c1LoXv0=;
        b=GryYoj8WUDyxqN/7Cut8QSsLn9WIxQHFLkyqxX6Y5WzQEb+t0sPVmtV04CaV207rp3
         ZxifED4+P0rE4RaE1Bx6T+3sLvX14gm0p3hEtIvUSwR5hIJAx9Px0jxLfGIAKfXOXkTb
         sz+5gYPuKOjhff+VUUkhtZ/mH91Bs8sGpS/0MWO2/P6l7BCuGkK3RcBl4ZsVzLrXxkFD
         kXvDm91N2woBv04CxMdVnzd377y3zuzzus8AhoPkSc9pObkBlSFWnHbBkdkhYRivpWak
         CTaOUL5AhomR9SCnUWNN+0xH3WkTnOC0OpqU924VpD82Ra/aLfHm7xpgg7MjujLPXXGN
         eq8w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=AdR1GNHP;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id m124si604450qkf.48.2018.03.23.03.26.59
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 23 Mar 2018 03:27:00 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=AdR1GNHP;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:37042 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ezJuV-0000u6-JK
	for alex.bennee@linaro.org; Fri, 23 Mar 2018 06:26:59 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56656)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1ezJuM-0000tq-KO
	for qemu-arm@nongnu.org; Fri, 23 Mar 2018 06:26:51 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1ezJuL-0004Y0-Qp
	for qemu-arm@nongnu.org; Fri, 23 Mar 2018 06:26:50 -0400
Received: from mail-oi0-x22d.google.com ([2607:f8b0:4003:c06::22d]:34080)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1ezJuL-0004Xo-LC
	for qemu-arm@nongnu.org; Fri, 23 Mar 2018 06:26:49 -0400
Received: by mail-oi0-x22d.google.com with SMTP id u141-v6so9904506oif.1
	for <qemu-arm@nongnu.org>; Fri, 23 Mar 2018 03:26:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=1FeHCVnkwdK0zKC+2NPalboy1JybXlNqioF1c1LoXv0=;
	b=AdR1GNHPEYhdhEbNCebhNB+NDXBLE/89gZUIUMu0ZmRzHzo9DsvjgD1Og23vVcMoL9
	GsA9HvazT2pR52ZzVHk5tU/6XofV/3WbInHY4/YCFyALB2/A60gJWrdIQ+AD2sOT4bf9
	yNM6yv2x17+cx3prrHRJHswxN0Hkn7PjkPiAs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=1FeHCVnkwdK0zKC+2NPalboy1JybXlNqioF1c1LoXv0=;
	b=VTDuOlabwSuYxtcKMUlPZOlxjklSHgP4ucZ6PToxsTYbjP+7Ymb9DBvth66I8lwz1x
	6C/S83smT1ePywsKP94S48C7OWgedYS7gySqVCYuXg75dIMhFJk5d6txEopk0W6y0H+J
	JACe608eVIRnx3NXqA1A0EJLxdEOFykrbp+xZ+6zELaLN/O/hgBt8S2sGVQYugTF2HGd
	ZmurCkB1FVSJkPsM+q2fQc3Dr3IDDgiSyxiMysAifho8KL6FTJoMt4c8h7B8T5OEjxKw
	N4b2nXj2Tqrlia9/eARIgT26B2y/Q/OWQ1wAtdOuGAd/x3mpHXW+9bD7d45pWryRx5Qu
	sPLA==
X-Gm-Message-State: AElRT7E7c1Dag3K+PJYmoOeM2ONaAaxr3tlpUJW4UKEaN2KRuYB8IyQn
	f4ujtZPOVgOgHFsdUbm0kSx1Me8M7nbfqhGgJ7ewHw==
X-Received: by 10.202.224.67 with SMTP id x64mr2456299oig.164.1521800808830;
	Fri, 23 Mar 2018 03:26:48 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:2286:0:0:0:0:0 with HTTP; Fri, 23 Mar 2018 03:26:28
	-0700 (PDT)
In-Reply-To: <d29ae6aa-5758-277b-b754-4e6fe7666e6b@redhat.com>
References: <d29ae6aa-5758-277b-b754-4e6fe7666e6b@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 23 Mar 2018 10:26:28 +0000
Message-ID: <CAFEAcA9dHPLj6aF=JsS8dXaDWf_ONQ_A+SD1xXQO7DdsWK3yAw@mail.gmail.com>
To: Auger Eric <eric.auger@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c06::22d
Subject: Re: [Qemu-arm] Regression on KVM qemu-system-aarch64 since
 "monitor: enable IO thread for (qmp & !mux) typed"
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
Cc: qemu-arm <qemu-arm@nongnu.org>, Eric Blake <eblake@redhat.com>,
	qemu list <qemu-devel@nongnu.org>, Peter Xu <peterx@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: u+aoqG5UUr8H

On 23 March 2018 at 10:24, Auger Eric <eric.auger@redhat.com> wrote:
> Hi,
>
> I observe a regression on KVM accelerated qemu-system-aarch64:
>
> Unexpected error in kvm_device_access() at
> /home/augere/UPSTREAM/qemu/accel/kvm/kvm-all.c:2164:
> 2018-03-23T09:59:59.629439Z qemu-system-aarch64: KVM_GET_DEVICE_ATTR
> failed: Group 6 attr 0x000000000000c664: Device or resource busy
> 2018-03-23 10:00:00.085+0000: shutting down, reason=crashed

Can you get a backtrace for this? (I guess you'd need to fiddle
with the kvm_device_access() code to make it assert rather
than passing back the error).

thanks
-- PMM
