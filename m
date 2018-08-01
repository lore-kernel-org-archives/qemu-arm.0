Received: by 2002:a5d:6782:0:0:0:0:0 with SMTP id v2-v6csp534470wru;
        Wed, 1 Aug 2018 02:38:25 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpf9WPhB0qyHIuJTaXi5sZa6hzXa/BuYSmpv3Ha1hb8IqjzWildBdzn8r4+lnSJqEjLKcM4a
X-Received: by 2002:ac8:2775:: with SMTP id h50-v6mr25322818qth.67.1533116305596;
        Wed, 01 Aug 2018 02:38:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1533116305; cv=none;
        d=google.com; s=arc-20160816;
        b=ZaGlZ0oecrdGanvl3J6HL/UBzRA54k4nO5r+Mmko1ip5Ha74uQcE0CP85ndCOTS9lC
         31JA1pMDFn5MAt6X6LNyxLqdbw7zX9ol2UOLoJN19VBSQtmrrsSq7ZfOtUX+kHNScowH
         3FnrH01wx6/IyPvoaaD1hRynfSFlB6pjAR0qC0L3fAi26MlCWspRu92JAcYBxp0hdtPe
         nR0gECqrDSOszSBtX6vq8BZVw6W98ZTeD6YYEy5Vpyc1beAOzSMIfzNFDgEKMLgg+b3U
         kzo0KyyptCXoscY4vE8zZWOGAFftu4bS+oLLOJk1ZZZCyfpXlz9va3EzRb88hJJMBifS
         q/hw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :mime-version:dkim-signature:arc-authentication-results;
        bh=+rl5VRL6f0oZB+3SiNX77IYumAzQzUwt3bu8Pkl72dg=;
        b=fi/q2VSAZqCbWHgYHjE43k1ZHMyHjCLf4pItBCeZ6nptCmkrnTJb7ES8MDiVXJ1RGE
         IU9eYvMQXkQWPMLCjMqOOpNsrh4L8Rvi2ORIwsZihk/FkJq2BrDkgEtNBs+KC5CBGfVC
         C6CqvVRarBGoqKRNIpdmPaEVB9NeR3BSlsZjib+bzmDy+5pwIFPsiOhEfOOie/ZV/NLX
         f7mvKMFwFf+qGQAvWR2RQCnDhWNpTGpzrd2Mxjat6PyDlEtJInuMjioivw8NthxsKVJF
         zqKmbLIcSikjlX3GssY5Bkoer66sMnnDr+OHsIxbNH9BKdowK2rkXlEVIrcDTyUidQ4D
         wX4g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=XU9yI2Ya;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id f20-v6si2083787qtp.48.2018.08.01.02.38.25
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 01 Aug 2018 02:38:25 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=XU9yI2Ya;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:38640 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fknaL-0004IR-6L
	for alex.bennee@linaro.org; Wed, 01 Aug 2018 05:38:25 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41211)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <laurent.desnogues@gmail.com>) id 1fkna4-0004IJ-2b
	for qemu-devel@nongnu.org; Wed, 01 Aug 2018 05:38:08 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <laurent.desnogues@gmail.com>) id 1fkna3-0001W3-FG
	for qemu-devel@nongnu.org; Wed, 01 Aug 2018 05:38:08 -0400
Received: from mail-qk0-x232.google.com ([2607:f8b0:400d:c09::232]:34786)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <laurent.desnogues@gmail.com>)
	id 1fkna3-0001Vk-9G; Wed, 01 Aug 2018 05:38:07 -0400
Received: by mail-qk0-x232.google.com with SMTP id b66-v6so12203180qkj.1;
	Wed, 01 Aug 2018 02:38:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:from:date:message-id:subject:to:cc;
	bh=+rl5VRL6f0oZB+3SiNX77IYumAzQzUwt3bu8Pkl72dg=;
	b=XU9yI2YaKVFjPiKSvIrrNlWCeTi5+m/psOhWPUy4cbySg/SX5Cghgl+I1tCO7UtZgt
	nfGS33YdEWLQP5jnXkhl8XmcBDJ9drMwqylq0lKKdt6LixXV1KoJ4z/zP+i6QIzJgmt7
	ZMffHmq0gtgM9OAT28X03Eq4lUN4OZqgchSvfjd1CXjwt5Krn2UV067c9Re+7pyc3SOr
	mg5RZ4rd70FqHbh0zAnJPHqbSmz9YxD8jGt3DShZWhW8zBdhq4ndH41gCCGeM9pdKuEv
	MUUmOuj4GySDMT2u68HCvl3KP2/sLcb9Cbtu09WdIMs/GrStWNpW/TyIn1SoC4I3Th8G
	ZjtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
	bh=+rl5VRL6f0oZB+3SiNX77IYumAzQzUwt3bu8Pkl72dg=;
	b=COsllgExHxH6X/AGp5Pjib/moSmZvkxEx9HhaZ7hVL5mjDMK/3MDQtRQL7IIBU/G+m
	oWJ9tOvY8SWQQdz0G+kBreJ15fGk1wlh/xttNXh5pUfBX6tggssPdidTg43QDLqhyILX
	yEx4kQdpFYNsDapJcdqDN95/Jwdo3We4Mha2lyruRlz3EToquIxvR2J5rmzdy7/ZnN7X
	UIyYKv+P+ptjMYhM3pfc88XpGyop+oi1NQFJlmrIR1bN2Y4NV5112EXn2YnjyV1H/sGp
	L2W+F77TWH1JMqIqu/dKlS4b6ZvHzIogl6yaQjW5TehTre72AHffPXmdElxg7L44pHiH
	pPBA==
X-Gm-Message-State: AOUpUlH1uN6qO74sKAqd/ckMUs06WULoG1dfxtvlhLOX9wnjsKz/7DLs
	KDydIuHsATErBIAYkf72YMs9a8JXhk/284qPzhY=
X-Received: by 2002:a37:9486:: with SMTP id
	w128-v6mr23290623qkd.362.1533116286553; 
	Wed, 01 Aug 2018 02:38:06 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:ac8:12c6:0:0:0:0:0 with HTTP;
	Wed, 1 Aug 2018 02:38:05 -0700 (PDT)
From: Laurent Desnogues <laurent.desnogues@gmail.com>
Date: Wed, 1 Aug 2018 11:38:05 +0200
Message-ID: <CABoDooMm7+REK+8dbTA1zj2mV-OiiA0w2ib8B7b-1WwVny82PA@mail.gmail.com>
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::232
Subject: [Qemu-devel] ARM: SVE movprfx issue
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
Cc: qemu-arm <qemu-arm@nongnu.org>,
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 04N2Iz/cmbGd

Hello Richard,

there's a typo in sve_movz_d where n[1] is used instead of n[i].

Thanks,

Laurent
