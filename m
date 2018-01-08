Received: by 10.28.173.206 with SMTP id w197csp2616760wme;
        Mon, 8 Jan 2018 07:49:55 -0800 (PST)
X-Google-Smtp-Source: ACJfBosxWx751OJJl6FroMIbanPgs+1dmNFq9dTLDm0vLmz4v81iIMisFg29+6l3Rust8dqU3WJ6
X-Received: by 10.37.177.10 with SMTP id g10mr9829262ybj.434.1515426595378;
        Mon, 08 Jan 2018 07:49:55 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1515426595; cv=none;
        d=google.com; s=arc-20160816;
        b=bIfirtdjQa3dRGkSSPEyPwsPw7IiWTTWUBOf90wXkbEKZ4eaUU9A6GHcK6J0Lp65+Q
         mPqDS08XeUVJnRJbHFQPr+iV/RfAVzxQbN0d3dGSPLpVuiOC7pRG8RSU0J1YbYlTK9NP
         rWTkMhGvbSYsfPs/6hjVAgEL655M/+9JHX/o1ril2ZDtf9C4IcOpHUYaZlX1wcCNcbm6
         4Mv23Fsu8wZ1DUPRGL5/tpRo9f40ZWextpknV4irgYcqX+kUj9urx/BVVRQo7Sr4AG/Z
         Pgb7wPVq4THq6sgYFnJyMcVBqptrrcyU+aA5o4ez88kS43FLVaSLIP/bSRr3s4yh2POk
         u9Yw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=TGk1y1NgAOHx6z2oAsS3h8NgRi9Cia8aMOVFgxSLVKI=;
        b=VZQJ0YdAzSgbLq2PUMSeVFq5BgZeSdg8U0/C6ECJ2Nn2lqH8uNizk6xMhqyNGHMcUs
         StJCLtej3tRJdskFYAUbsZqeh79+Cssa6ykd/2UHa5lBOpG6N8vjJmS0ZEj92+DillBn
         vxlZBN1AvoLAuTkr6zHrf/PQBt0ue799lTNF36/z8EcmMUv/zxlGfbZFNC/aWwmyUlZE
         ccYnf7sdcg5LTwNWd02RPavB7QF9XUsYwWhQGti24GayPNwsch3mVgbZKFADxYud0JLk
         ilR/zEiJPmBj5rmiJFu9ItRodfYn7RIb+XO4Qk+oIRHIcLmJg306OGjGIcXSUTD2LJFg
         8b4g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=s+MecAyC;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id v19si123179ywg.528.2018.01.08.07.49.55
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 08 Jan 2018 07:49:55 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=s+MecAyC;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:41267 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eYZgQ-0006UG-Ha
	for alex.bennee@linaro.org; Mon, 08 Jan 2018 10:49:54 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41859)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1eYZal-0001bs-JB
	for qemu-arm@nongnu.org; Mon, 08 Jan 2018 10:44:04 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1eYZak-0007MA-NZ
	for qemu-arm@nongnu.org; Mon, 08 Jan 2018 10:44:03 -0500
Received: from mail-qk0-x242.google.com ([2607:f8b0:400d:c09::242]:38415)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1eYZag-0007Ju-DH; Mon, 08 Jan 2018 10:43:58 -0500
Received: by mail-qk0-x242.google.com with SMTP id j185so3819379qkc.5;
	Mon, 08 Jan 2018 07:43:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=TGk1y1NgAOHx6z2oAsS3h8NgRi9Cia8aMOVFgxSLVKI=;
	b=s+MecAyCiSXvlbRwV+HKJPB5HxLcf1CqlyuUoCHDB4TVC0vW7QemwWLudQghgDUQZR
	WkBScC1Zoxu+f1eaQreGtIKBuEGL75muwmGfLMiWxgRDKinZ/XJkEHURj+77seT2PGqX
	scwSU2ccVp9wdCg0Db1y0KnseHanMmOqasuvcoXsrRkSnpr2i1LZd5/LNuv5L2ZvaDgq
	iDTyA5Bp6y6V8Zv8v6TvEF1r4QVOdaipAiGs0e29ord31NIU+xfv4nuNkl3+YlmLn04G
	Yi8eU9/Hpq7L69aitRqwuzT4+sMnMdj5OG/t3PAublJUTZFDog4ln2eoMdF9rCtf09l+
	lnvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references;
	bh=TGk1y1NgAOHx6z2oAsS3h8NgRi9Cia8aMOVFgxSLVKI=;
	b=h1qCzGD3UQEF1mqsQC3szXmejs5b6z0Lz0hdcsCwNPx1H2Ra8rpMZ8keZe1B47uAK4
	KfVLCWnLQkpeKWbdciVQPD5gTKvxKOl2o0RpDNpP3rUVhk8GU5/BqOXo9iVT3lkCunpC
	UcSbquzj9L4Ift7a/H882mZ4Bj9GYAsUxChT0sOrow1jqf6OjprhDVY614wzThCJD/De
	DFpH73m0OiQXQFhtkMGl52w1A0EiN74rHnJSHfUQS3ZH596jPb4K+qQUInhXwzoZn+cW
	x5HfZSDYFY15B5UycBdvL1lzODQbe9vcDp1i7yO9R9iW3FNwZhsqOrx3xfqDXa1Ih0zd
	3tIQ==
X-Gm-Message-State: AKwxytc22hz+Ibqy+BFYuuZVNDO0hmwkuLQW3V7ZJy23ofRFyenvbrGm
	ilJhDtGNPxj8rY36RtgFxTA=
X-Received: by 10.55.144.7 with SMTP id s7mr15397111qkd.65.1515426237913;
	Mon, 08 Jan 2018 07:43:57 -0800 (PST)
Received: from x1.local ([138.117.48.219]) by smtp.gmail.com with ESMTPSA id
	u36sm7832382qtc.58.2018.01.08.07.43.52
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 08 Jan 2018 07:43:57 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Alistair Francis <alistair.francis@xilinx.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Andrey Smirnov <andrew.smirnov@gmail.com>,
	Igor Mitsyanko <i.mitsyanko@gmail.com>
Date: Mon,  8 Jan 2018 12:42:39 -0300
Message-Id: <20180108154303.6522-8-f4bug@amsat.org>
X-Mailer: git-send-email 2.15.1
In-Reply-To: <20180108154303.6522-1-f4bug@amsat.org>
References: <20180108154303.6522-1-f4bug@amsat.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::242
Subject: [Qemu-arm] [PATCH v5 07/31] sdhci: Fix 64-bit ADMA2
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
Cc: "Edgar E . Iglesias" <edgar.iglesias@xilinx.com>,
	Prasad J Pandit <pjp@fedoraproject.org>,
	=?UTF-8?q?Gr=C3=A9gory=20Estrade?= <gregory.estrade@gmail.com>,
	qemu-devel@nongnu.org, Krzysztof Kozlowski <krzk@kernel.org>,
	Jean-Christophe Dubois <jcd@tribudubois.net>,
	Sai Pavan Boddu <saipava@xilinx.com>, qemu-arm@nongnu.org,
	Clement Deschamps <clement.deschamps@antfield.fr>,
	Andrew Baumann <Andrew.Baumann@microsoft.com>,
	Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 3mvXu9TrgVnb

From: Sai Pavan Boddu <saipava@xilinx.com>

The 64-bit ADMA address is not converted to the cpu endianes correctly.
This patch fixes the issue and uses a valid mask for the attribute data.

Signed-off-by: Sai Pavan Boddu <saipava@xilinx.com>
[AF: Re-write commit message]
Reviewed-by: Alistair Francis <alistair.francis@xilinx.com>
---
 hw/sd/sdhci.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/sd/sdhci.c b/hw/sd/sdhci.c
index 88052fcc44..83b027a3b6 100644
--- a/hw/sd/sdhci.c
+++ b/hw/sd/sdhci.c
@@ -623,8 +623,8 @@ static void get_adma_description(SDHCIState *s, ADMADescr *dscr)
         dscr->length = le16_to_cpu(dscr->length);
         dma_memory_read(&s->dma_as, entry_addr + 4,
                         (uint8_t *)(&dscr->addr), 8);
-        dscr->attr = le64_to_cpu(dscr->attr);
-        dscr->attr &= 0xfffffff8;
+        dscr->addr = le64_to_cpu(dscr->addr);
+        dscr->attr &= (uint8_t) ~0xC0;
         dscr->incr = 12;
         break;
     }
-- 
2.15.1

