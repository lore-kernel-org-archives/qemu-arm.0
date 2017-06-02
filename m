Received: by 10.25.0.23 with SMTP id 23csp25254lfa;
        Fri, 2 Jun 2017 09:41:33 -0700 (PDT)
X-Received: by 10.200.52.165 with SMTP id w34mr9656683qtb.77.1496421693858;
        Fri, 02 Jun 2017 09:41:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1496421693; cv=none;
        d=google.com; s=arc-20160816;
        b=tLU4fEquSELrbfiieiyMh21GQnbRVSWOtmSPccCql4r9/OgdfQHyOtkuwxbAZFqIE6
         vEYzoKkOhgzvoXCRQHm4cSvQvjlqir4uFQdXIoztAFnGfXW1f9jRswROrmlmWzUT77+W
         XdSb9jrWy4iCYcHnt0DD8L4mvH/CyCqe5WSCDfTWshY3c2xTXIojMvy29pscNPbJjjT2
         f1b2eYFIb9gS1Z2pafNmkkGqIF0N2KCREeBxX4Ox67On8yK3m8T+IJ/ZhXkv9l4P0OB5
         fsflnR0QujGUqf928GElogTtWuqzrdZt8AIipL4OR9MNeshNrgUTKerjACKKtlIZUXuN
         wmkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dmarc-filter:arc-authentication-results;
        bh=Foupl2r4M2j/aunGPbqTN9g5JVXYUScX/fqtP0sj8KQ=;
        b=nECWTVXoXA3dl4Yva7gyHQqRawQuYSGRuRelD06uuoiBx1dBIclEkjXFD3fYgB8zhu
         LLN6F95u/95TTPuaXyar1UmwJxmWycvIl3XY4r5g3AhKDXk8vIrKon9FXin9srAHkELL
         dBST81hMUrykgRyYIDEHprZVk8O6BqBfa3SqGarP/ZFgQvZhzJNHJ/PM6aIpSw5h+lQq
         7512M/OqOliBmwsKxB61gx6cnAHVYfkCkrt4MkV7nlvFCWB4+MZ/czN82j6iQPHCV0Le
         0w8otBN9uT131a0iR0ce0EW+mk5aCjCOhNFRT4dGsGXGeSD5pniTbTBKjGRdKQE0WA+p
         +l5w==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id u64si23275153qku.52.2017.06.02.09.41.33
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 02 Jun 2017 09:41:33 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:50743 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dGpdj-0005sS-9s
	for alex.bennee@linaro.org; Fri, 02 Jun 2017 12:41:31 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35229)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <krzk@kernel.org>) id 1dGpZ9-0001Az-4N
	for qemu-arm@nongnu.org; Fri, 02 Jun 2017 12:36:47 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <krzk@kernel.org>) id 1dGpZ6-0007gE-Nt
	for qemu-arm@nongnu.org; Fri, 02 Jun 2017 12:36:47 -0400
Received: from mail.kernel.org ([198.145.29.99]:53910)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <krzk@kernel.org>)
	id 1dGpZ6-0007fg-H0; Fri, 02 Jun 2017 12:36:44 -0400
Received: from kozik-lap.dzcmts001-cpe-001.datazug.ch
	(pub082136089155.dh-hfc.datazug.ch [82.136.89.155])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id 105FB23A09;
	Fri,  2 Jun 2017 16:36:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 105FB23A09
Authentication-Results: mail.kernel.org;
	dmarc=none (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=krzk@kernel.org
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Igor Mitsyanko <i.mitsyanko@gmail.com>,
	Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Fri,  2 Jun 2017 18:36:15 +0200
Message-Id: <20170602163618.6369-6-krzk@kernel.org>
X-Mailer: git-send-email 2.9.3
In-Reply-To: <20170602163618.6369-1-krzk@kernel.org>
References: <20170602162857.6065-1-krzk@kernel.org>
	<20170602163618.6369-1-krzk@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 198.145.29.99
Subject: [Qemu-arm] [PATCH v4 6/9] hw/arm/exynos: Declare local variables in
 some order
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
Cc: Eric Blake <eblake@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	Krzysztof Kozlowski <krzk@kernel.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: +28TEmwyxWr5

Bring some more readability by declaring local function variables: first
initialized ones and then the rest (with reversed-christmas-tree order).

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
Reviewed-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
---
 hw/arm/exynos4210.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/arm/exynos4210.c b/hw/arm/exynos4210.c
index 0da877f8db0a..27a7bf28a5a9 100644
--- a/hw/arm/exynos4210.c
+++ b/hw/arm/exynos4210.c
@@ -162,12 +162,12 @@ static uint64_t exynos4210_calc_affinity(int cpu)
=20
 Exynos4210State *exynos4210_init(MemoryRegion *system_mem)
 {
-    int i, n;
     Exynos4210State *s =3D g_new(Exynos4210State, 1);
     qemu_irq gate_irq[EXYNOS4210_NCPUS][EXYNOS4210_IRQ_GATE_NINPUTS];
-    DeviceState *dev;
     SysBusDevice *busdev;
     ObjectClass *cpu_oc;
+    DeviceState *dev;
+    int i, n;
=20
     cpu_oc =3D cpu_class_by_name(TYPE_ARM_CPU, "cortex-a9");
     assert(cpu_oc);
--=20
2.9.3

