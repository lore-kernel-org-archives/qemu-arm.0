Received: by 10.223.150.237 with SMTP id u100csp4141031wrb;
        Fri, 10 Nov 2017 11:55:45 -0800 (PST)
X-Google-Smtp-Source: AGs4zMa1amMKSmf4e7j+uZfdyu8X4S9+0kHl9cj95+ZvbMNP0FzMYIpgaDE9oa7kKoNrYZxWhmoH
X-Received: by 10.129.41.18 with SMTP id p18mr1069361ywp.245.1510343745215;
        Fri, 10 Nov 2017 11:55:45 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1510343745; cv=none;
        d=google.com; s=arc-20160816;
        b=eW0IpXA8dUP+rQPkWk8SZj3cbp4siRtTT5b11UCQB2GdtK9trpmWPvPuP8HxBGlHEO
         uacX/VS85uuKBTNck3Gvzg0Qvb08nRicZrsFr35mnCw0BuihmBtcTGIB5GzfoF09T7g1
         pXcoqwo3RN/rOp55m5KtgcH2374s2yv3y4uxQ6Cih+7DIDWLKy4I7ao+9vRZjSySHc8V
         fG0kNXISq5WRCC+fux7ZNTpPoTDjRy7NQC64a8c+I96l7+ypxwqJ0wsOncqlqBUWp2Mo
         CLs+KS9wgSFnNcqgpBnYN7+8wRdXnmsMsDZ87dmGL0pnx/4Jw9M7RH91rcf0j3JpKAed
         yFpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature:dkim-signature
         :arc-authentication-results;
        bh=pqHQJ2NtykbD73t2beuDfy4hyiS2WPvv0q1MpbtqhJk=;
        b=0Ns15LZx2DS6wQkvk3yelbzQInxJfsGPFUYUOYwOrcab1gtV4mEJ/pi2BLfrAgpR5w
         Y4FJB5lnpRrHqh4APTnHzaEujeS+Hy2zQyyzMr7p9VESyYMGH0kpIcNoeRZF90XlMmgX
         XTmk5GHIS4/GQ69KEdzLtZ6xnh6GsYQ6x7IhDeqNA23I6zCFf4SEitMmR9FWXwfjZ/pW
         vqSdnrFAY8+w8GhWc2gOQjONChQHyNOQ8c/Ypc0pSkzY8NJ/I3FuNObeXVJbid7r1+G/
         w2sGFja8PELmEndSRWGKWPeT47F9sb7ZwmK6EhgCcFzR7yKrxx8vp5UPND9bAzfpU5Yt
         k/FQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@braap.org header.s=mesmtp header.b=A1HlLjaK;
       dkim=fail header.i=@messagingengine.com header.s=fm1 header.b=SyFQc5dC;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id g142si102741yba.84.2017.11.10.11.55.45
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 10 Nov 2017 11:55:45 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@braap.org header.s=mesmtp header.b=A1HlLjaK;
       dkim=fail header.i=@messagingengine.com header.s=fm1 header.b=SyFQc5dC;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:43256 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eDFOy-0006s2-JS
	for alex.bennee@linaro.org; Fri, 10 Nov 2017 14:55:44 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47277)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <cota@braap.org>) id 1eDFNA-0005Le-3y
	for qemu-arm@nongnu.org; Fri, 10 Nov 2017 14:53:54 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <cota@braap.org>) id 1eDFN6-0006BZ-2z
	for qemu-arm@nongnu.org; Fri, 10 Nov 2017 14:53:50 -0500
Received: from out4-smtp.messagingengine.com ([66.111.4.28]:37759)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <cota@braap.org>)
	id 1eDFN5-0006BH-VW; Fri, 10 Nov 2017 14:53:48 -0500
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
	by mailout.nyi.internal (Postfix) with ESMTP id 7E76C212D8;
	Fri, 10 Nov 2017 14:53:47 -0500 (EST)
Received: from frontend1 ([10.202.2.160])
	by compute4.internal (MEProxy); Fri, 10 Nov 2017 14:53:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=braap.org; h=cc
	:date:from:in-reply-to:message-id:references:subject:to
	:x-me-sender:x-me-sender:x-sasl-enc; s=mesmtp; bh=pqHQJ2NtykbD73
	t2beuDfy4hyiS2WPvv0q1MpbtqhJk=; b=A1HlLjaKbPctNunYfoyQW/NwBu+c7L
	k9sHm861ymDQJB/WHQFnMp2SXg7vtMvGmdFFyS9tfmHf839jhgnDAy4gMzR3ghVW
	vr3MC+1oCqNbex+J99BYQ9V63sAt8NbtncTw8fD/sG3qJx41SfYdc9YAv8IUmmlP
	OYk8eGdwkY3tg=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:date:from:in-reply-to:message-id
	:references:subject:to:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm1; bh=pqHQJ2NtykbD73t2beuDfy4hyiS2WPvv0q1MpbtqhJk=; b=SyFQc5dC
	2e472gdOzKBW5uWOGWJuLpaaY3/RifTaJydd38nxOlBtiui8UsQVJCCKC2l/MXzX
	ataLGP+tLIRT5lOYW6FW+nPwxtOmhRKqLcuI16b3ofGJtVUypNScs3sClsVM0QSj
	unsIIobpepHw36Z61DNB24L0fU3UaBkLgpeXB+dgo0yFdsmjlidbE4chzmAOWkqt
	tGzsqpqxm7jdWag5VcnMtop1EfJyc1qRtbbmBom3QVkfIxrpa9b9j8DlhK3ErBC7
	Tew8VdWXnfOeSUHMd6/QjlH5zxiWItRnRb2TiTseSpm3akXMGLDQ43Ladxz8OB9Y
	VyDcZhHMBZFo8Q==
X-ME-Sender: <xms:ywMGWuFundPc43oe9JdUS3h_V9Kf2AbBYz2_M9EPmagO4jjwDjYX-w>
Received: from localhost (flamenco.cs.columbia.edu [128.59.20.216])
	by mail.messagingengine.com (Postfix) with ESMTPA id 4021E7E6B8;
	Fri, 10 Nov 2017 14:53:47 -0500 (EST)
From: "Emilio G. Cota" <cota@braap.org>
To: qemu-devel@nongnu.org
Date: Fri, 10 Nov 2017 14:53:45 -0500
Message-Id: <1510343626-25861-5-git-send-email-cota@braap.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1510343626-25861-1-git-send-email-cota@braap.org>
References: <1510343626-25861-1-git-send-email-cota@braap.org>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.111.4.28
Subject: [Qemu-arm] [PATCH for 2.11 4/5] xlnx-zcu102: Specify the max number
 of CPUs for the EP108
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
	Eduardo Habkost <ehabkost@redhat.com>,
	Igor Mitsyanko <i.mitsyanko@gmail.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Alistair Francis <alistair.francis@xilinx.com>,
	qemu-arm@nongnu.org, Marcel Apfelbaum <marcel@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: j9tMY3Z1zyXM

Just like the zcu102, the ep108 can instantiate several CPUs.

Signed-off-by: Emilio G. Cota <cota@braap.org>
---
 hw/arm/xlnx-zcu102.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/arm/xlnx-zcu102.c b/hw/arm/xlnx-zcu102.c
index adddd23..190eb69 100644
--- a/hw/arm/xlnx-zcu102.c
+++ b/hw/arm/xlnx-zcu102.c
@@ -188,6 +188,7 @@ static void xlnx_ep108_machine_class_init(ObjectClass *oc, void *data)
     mc->block_default_type = IF_IDE;
     mc->units_per_default_bus = 1;
     mc->ignore_memory_transaction_failures = true;
+    mc->max_cpus = XLNX_ZYNQMP_NUM_APU_CPUS + XLNX_ZYNQMP_NUM_RPU_CPUS;
 }
 
 static const TypeInfo xlnx_ep108_machine_init_typeinfo = {
-- 
2.7.4

