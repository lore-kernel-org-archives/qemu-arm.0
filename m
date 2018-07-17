Received: by 2002:a5d:6782:0:0:0:0:0 with SMTP id v2-v6csp2740125wru;
        Tue, 17 Jul 2018 07:33:41 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpeIx1EIBSLYYLWo+7RYmvIs3oF6sjNFslaU1GXUT0iR/pvm3v7Fe+oWS2SI/+VEwBb4VzgB
X-Received: by 2002:a0c:9c09:: with SMTP id v9-v6mr2012055qve.186.1531838021112;
        Tue, 17 Jul 2018 07:33:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1531838021; cv=none;
        d=google.com; s=arc-20160816;
        b=XozE2uqQNDOF9fq7rpebus6U3sdU8Gku67LkVfpl+GEkWbcqvSBHirF3ScfAnPWWyb
         pzyRsygdAqF/nygWHu9SrtXVUko7Dj+4DbtH3t58qy0ygzOf1SMCts7DPXkGzElGz1NB
         eHrTG8uaoET32ukVr2agK8b/5GnSCQHlI6u5BwDtd7SCJ5ZNadKDH51hW7xra0F8R1cz
         ilQt+PsSaJAbZc/TBpwXYiuEIFteHoODMf58NtYJKMOlWIab+Mvi6frdm6OdNqDjzp08
         tr+JYNALmmfZkombACXEyrkQa5iuuwp1DJU8F7Xa6PQHcK9A+h1kv9d/tEDNcP/2gfRj
         nNEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=FuWtXIp1MPxGhG8cBM7AukHWtTh5/6AH8ZoBx69inBA=;
        b=wFBACksgMvMxrHCPVpyxtHi+s2L4mFqAjUi7F/dcz2z3GTdx0ySmMZ0iwWHVMwogeD
         TBCGndnTccJwIo4EZQM8f5YqhKUT0CLLFRriZ5QCNGQIvUj6Od/65wDstmDEkdv3tlAg
         GLg9mhpMxAFufiTrBBE6nYz575jPqd6e5MXjCCBFmq4EOq62iLrf/aVhNqQD227skic5
         3oPGPvFckzMu42RRAIaTQ9PeWq1yozL2ht84iQ+YVB3TFlcDHougK/7Z7iMILfPkB1Bw
         Z6UwTK+gv1HjE3NJxlpOlyxQPuQxV0ecNtT4eW033jIF5qOWMN7o8AA+y7q6J96kLWpY
         5ygA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=PC5uE4hp;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 75-v6si942026qkg.314.2018.07.17.07.33.40
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 17 Jul 2018 07:33:41 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=PC5uE4hp;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:59695 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ffR2q-0004xT-LA
	for alex.bennee@linaro.org; Tue, 17 Jul 2018 10:33:40 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37425)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1ffR2f-0004xK-Lk
	for qemu-arm@nongnu.org; Tue, 17 Jul 2018 10:33:30 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1ffR2e-00058E-U3
	for qemu-arm@nongnu.org; Tue, 17 Jul 2018 10:33:29 -0400
Received: from mail-oi0-x241.google.com ([2607:f8b0:4003:c06::241]:42722)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1ffR2e-00057L-OV
	for qemu-arm@nongnu.org; Tue, 17 Jul 2018 10:33:28 -0400
Received: by mail-oi0-x241.google.com with SMTP id n84-v6so2404805oib.9
	for <qemu-arm@nongnu.org>; Tue, 17 Jul 2018 07:33:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=FuWtXIp1MPxGhG8cBM7AukHWtTh5/6AH8ZoBx69inBA=;
	b=PC5uE4hpkG6rmmeomAuTiZJCaONUpu3bqagVltuOydKBA/jIaapLXAmQ87NJ4EeIMt
	B+ZoE5AIRG86FGK/F/IaNItQwlcwMJn1lAnd1Hx7nyfRmYYJX+McpErYBrU1zeEpwXsK
	DUFbjxaE8VmXW73AjTvVunStyLwji3klW7AYE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=FuWtXIp1MPxGhG8cBM7AukHWtTh5/6AH8ZoBx69inBA=;
	b=WPQFKZqyX54yrykXL9bMWKyOKrWftmgpu0GC53E/IM7Y4tdxZmR9ORyrKTq9SCImEM
	su0yDlM0+UVWv2o5qLkzCEuOQSm868IVoTWY3rqYPZINCxxwx5o+bQ80v5jCL7UujphQ
	6j7FpXCaoiPyVxnZ7e1ZDw0T2IEsp5A8B3YqAHLXrocErMLkzeDtA0s0FfbAt9NWfDZb
	Zcsb/YpnrpWhDS0dEC4IA9muOrYtJrVQ/C0wuquGht6toqmIkSw2yW3ql6crShX0ZXBg
	OY+2S4zgV+C1L6aYVrHrnYiIaDVJMQEMHLQRaKqkwdS55e8WUgc9pqRnokqbF4tqXX6v
	Umzw==
X-Gm-Message-State: AOUpUlHhF+8xXjwcilNgajlRzKTmw9MyeO8GohkVh7TcMbaRRkkPY6lc
	mwGpUsgV7eb5/pXmlmO3L3YfmdbRz923iplheg7YxA==
X-Received: by 2002:aca:a982:: with SMTP id
	s124-v6mr2056196oie.80.1531838007878; 
	Tue, 17 Jul 2018 07:33:27 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:5c8a:0:0:0:0:0 with HTTP; Tue, 17 Jul 2018 07:33:07
	-0700 (PDT)
In-Reply-To: <20180714171601.5734-1-luc.michel@greensocs.com>
References: <20180714171601.5734-1-luc.michel@greensocs.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 17 Jul 2018 15:33:07 +0100
Message-ID: <CAFEAcA9sZe6WM7vAKU7E1oPa_ju09sPrek35OnmW+Tz9gzx5dw@mail.gmail.com>
To: Luc Michel <luc.michel@greensocs.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c06::241
Subject: Re: [Qemu-arm] [PATCH v4 00/20] arm_gic: add virtualization
 extensions support
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
Cc: Mark Burton <mark.burton@greensocs.com>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Sai Pavan Boddu <saipava@xilinx.com>, Edgar Iglesias <edgari@xilinx.com>,
	qemu-arm <qemu-arm@nongnu.org>, Jan Kiszka <jan.kiszka@web.de>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: DxXC75RSF5Zc

On 14 July 2018 at 18:15, Luc Michel <luc.michel@greensocs.com> wrote:
> v4:

I've now reviewed or commented on all the patches I think
except the xilinx board one.

You'll want to rebase on top of current master -- this version
doesn't apply (probably as a result of the for-3.0 bugfix
patches that are now in master).

thanks
-- PMM
