Received: by 10.28.4.212 with SMTP id 203csp752174wme;
        Wed, 2 May 2018 06:56:33 -0700 (PDT)
X-Google-Smtp-Source: AB8JxZp5vW9nAqSIBAl4rGaJHFU9qTQoSXWfGJrD4N74DuJ4izi/niXkJS/RK56V3mkdW+yUyddL
X-Received: by 2002:a1f:ae17:: with SMTP id x23-v6mr5867119vke.191.1525269393003;
        Wed, 02 May 2018 06:56:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1525269392; cv=none;
        d=google.com; s=arc-20160816;
        b=Gf8+21nEsaU7x8p//+b5GvGjZQQQ438NRdRu2Bs+Kb62dJHuaSvd70Dbf2SasEDPRj
         isF0Rm8LYAD1iBAUTpRqu45kdym321219WddNzOLUucqjxKQW5woPIkj9XobSO6VWk0w
         /duWYHcAToHjXFYdm1hHkgGnYYuUMfdbQN9vtK2NgFQ8KVEVNib74FwWdphr8lKVIqoe
         etjcDAT+9lduTvDZFcImlgB588FxlU/+lCcrkoC/SElTfx3Ty6zkFdkTm/TI/gZYAaBH
         ix9aLUzN1sp+/yKrKN2qStWIK4DefZhOeRZBQNwuLAkTRyvOCLKG/oAkAMQ6eJHYXesO
         cuWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to
         :arc-authentication-results;
        bh=un6YQtFfN/gas4rdK0FY62yEC4PI//6HxLtltbO3eyw=;
        b=icNUlEN40dqaoTNIS1BC3PqOIUxLF4dpfqk5GtwLemgwHLm2akpA3wcdspxZM8ZdFU
         5MJNATsp9K4jo97+YSHhTEmJEs2TdS+aflMn+q4PAM8eqL16pmC/HqATzLa5OnLUFJnl
         SJ6lrKIjnLkrnR3zKm7aNb058xcm/JxFyhPsRxubZrcGNFI9OMTLqFJlgv1A5+bFT9J4
         30ikOApRvlRy7bYvT0IC7oQjgjnSXEuXO802t752uT5E+ksyVCkm+dl4bhTw4pDMogfG
         jtZtCFiDbOQ49ie4lyCUgjhFJ0QH/3e7GTtAm891Vdar4iqrciUEKgjohiv9V6ujtSYz
         /KFg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id m129-v6si6283179vkh.128.2018.05.02.06.56.32
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 02 May 2018 06:56:32 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:50611 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fDsFE-00049y-Hz
	for alex.bennee@linaro.org; Wed, 02 May 2018 09:56:32 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48948)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1fDsF7-00049t-Uf
	for qemu-arm@nongnu.org; Wed, 02 May 2018 09:56:26 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1fDsF4-0003HI-T3
	for qemu-arm@nongnu.org; Wed, 02 May 2018 09:56:26 -0400
Received: from 13.mo4.mail-out.ovh.net ([178.33.251.8]:58275)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <clg@kaod.org>) id 1fDsF4-0003GZ-LX
	for qemu-arm@nongnu.org; Wed, 02 May 2018 09:56:22 -0400
Received: from player694.ha.ovh.net (unknown [10.109.120.50])
	by mo4.mail-out.ovh.net (Postfix) with ESMTP id C0E7E16ABE0
	for <qemu-arm@nongnu.org>; Wed,  2 May 2018 15:56:20 +0200 (CEST)
Received: from zorba.kaod.org (LFbn-TOU-1-49-10.w86-201.abo.wanadoo.fr
	[86.201.141.10]) (Authenticated sender: postmaster@kaod.org)
	by player694.ha.ovh.net (Postfix) with ESMTPSA id C00162C00C0;
	Wed,  2 May 2018 15:56:14 +0200 (CEST)
To: Peter Maydell <peter.maydell@linaro.org>
References: <20180423101433.17759-1-clg@kaod.org>
	<CAFEAcA_1q4+kKunX6_d9N3+6tUFGJRRc5biqn5TqDDmh09-kiw@mail.gmail.com>
	<e2d6b0b9-2402-4c34-305e-ae61ebe10df4@kaod.org>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <707c783c-0c82-4916-c8b9-0a4d93364386@kaod.org>
Date: Wed, 2 May 2018 15:56:12 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.5.2
MIME-Version: 1.0
In-Reply-To: <e2d6b0b9-2402-4c34-305e-ae61ebe10df4@kaod.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Ovh-Tracer-Id: 14088104060614249387
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -65
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedthedrtddtgdeghecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenfghrlhcuvffnffculdefhedm
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 178.33.251.8
Subject: Re: [Qemu-arm] [PATCH v2] timer/aspeed: fix vmstate version id
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
Cc: Andrew Jeffery <andrew@aj.id.au>, qemu-arm <qemu-arm@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: gFpHEEW17lI1

> for a romulus-bmc machine, which uses a ARM1176 CPU, you can download this
> image :
> 
>    https://openpower.xyz/job/openbmc-build/distro=ubuntu,target=romulus/lastSuccessfulBuild/artifact/deploy/images/romulus/flash-romulus
> 
> but migration fails :
> 
>   qemu-system-arm: error while loading state for instance 0x0 of device 'cpu'
> 
> There seems to be an issue while reading the CPACR reg.

With a brutal setting of CPACR in cpu_reset, the romulus-bmc machine 
migrates. What would be a more appropriate approach ? 

Thanks,

C.  


@@ -166,6 +166,23 @@ static void arm_cpu_reset(CPUState *s)
 #if defined(CONFIG_USER_ONLY)
         /* Userspace expects access to cp10 and cp11 for FP/Neon */
         env->cp15.cpacr_el1 = deposit64(env->cp15.cpacr_el1, 20, 4, 0xf);
+#else
+        env->cp15.cpacr_el1 = 0;
+        if (arm_feature(env, ARM_FEATURE_VFP)) {
+            if (!arm_feature(env, ARM_FEATURE_NEON)) {
+                /* ASEDIS [31] bit is RAO/WI */
+                env->cp15.cpacr_el1 |= (1ull << 31);
+            }
+
+            /* VFPv3 and upwards with NEON implement 32 double precision
+             * registers (D0-D31).
+             */
+            if (!arm_feature(env, ARM_FEATURE_NEON) ||
+                    !arm_feature(env, ARM_FEATURE_VFP3)) {
+                /* D32DIS [30] is RAO/WI if D16-31 are not implemented. */
+                env->cp15.cpacr_el1 |= (1ull << 30);
+            }
+        }
 #endif
     }
