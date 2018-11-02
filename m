Received: by 2002:adf:a111:0:0:0:0:0 with SMTP id o17-v6csp2132152wro;
        Fri, 2 Nov 2018 06:46:52 -0700 (PDT)
X-Google-Smtp-Source: AJdET5eatU6FfiZpO8oXistas7o59rzYG4MeAcNL6AFpvz1IzmfldnoZKr1OWm2MNKHv65EMeess
X-Received: by 2002:a37:cc88:: with SMTP id n8mr10226463qkl.319.1541166411992;
        Fri, 02 Nov 2018 06:46:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1541166411; cv=none;
        d=google.com; s=arc-20160816;
        b=k3j87H1fOUYgzsAIxAMP5RrfMEtxgTl+w9XYv2ur8wq13dD+XYVZ31TLdE0NI5qJqO
         cp6o3aNcpAFAuxkV43PR+38NQTCo46WRq7ljQdgy0D9EdeIIDS22VjEkzsUQdCYBRT9s
         YZqj6a6urRU53NaPSgOhVb3tTdP3CwQWjSuKKCpmRWKd4iehCwsVmSDlQceaM7TOr9fb
         +t2u3MEV7AWhGfQ+aUNNhUAR3ajo00MNZybdp4eQZf6oMmh5Qmqc0pSUisah/eZBrJ4e
         BdbNPvYFn0CTgdllzLSFH+XFm7ovMm/8adQbZEPFGcgjddep9Z6r3xXJ2HX36yp5kpy2
         h5wA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:message-id:date:to:from
         :dkim-signature;
        bh=XT8e3HmF7c4zNygduq8noYj6bU6DNbhJdx5Ae9CfDjo=;
        b=xYCe95EgSucNJOvVVkuGQSXDB44FxUMuE/KfuSLwMQ79SO+m0DbXmFfq6jqCQOX4EH
         IvwlLbldbKOWasvgEp3R8dcV608r71mW14PY6/VNLAwcpdpk64fJMsIIkloKJOG1iemk
         05kNfKuLfPuh8IsfioJodSo0SbRQAUtcmClAfx6pnFx+bvoQbjXuDBIcDPoPuFfWmJPj
         pwSMTuFVkGR4v40P+Sf3D3XhINNgoh2FlTf6RtC0hH/iQbpGP8mElRAJGGolZDUuIcXh
         nPaxoo3aiEJgnfxPHlE+s1qWZIsrUv2lsLhzamFaSiMoU8+gutZQ7TYVUPEbhyMskJZL
         oBSQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Tqbb7sLD;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 80si1082810qkb.146.2018.11.02.06.46.51
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 02 Nov 2018 06:46:51 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Tqbb7sLD;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:51788 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gIZml-0003iO-JE
	for alex.bennee@linaro.org; Fri, 02 Nov 2018 09:46:51 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60788)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1gIZhp-0007C7-AE
	for qemu-devel@nongnu.org; Fri, 02 Nov 2018 09:41:46 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1gIZhn-0007PY-Bd
	for qemu-devel@nongnu.org; Fri, 02 Nov 2018 09:41:45 -0400
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442]:38625)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1gIZhl-00079j-NJ
	for qemu-devel@nongnu.org; Fri, 02 Nov 2018 09:41:43 -0400
Received: by mail-wr1-x442.google.com with SMTP id d10-v6so2043157wrs.5
	for <qemu-devel@nongnu.org>; Fri, 02 Nov 2018 06:41:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id;
	bh=XT8e3HmF7c4zNygduq8noYj6bU6DNbhJdx5Ae9CfDjo=;
	b=Tqbb7sLDkkLzKeCDQ8yBb5tk93yiR8erTxXnK6PnX2NVMUswOCdClVMHjjVrdKVycT
	WPzpJ60vrq0+M+ZT7FWuKyo4K2p2dAhcAz7Og1zgCiQ+nOINKOLDP/RJ7SZaEHDiRy4q
	CSV8ju44o+l2izLL/RyNkn7+WY89/68pyA6yE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=XT8e3HmF7c4zNygduq8noYj6bU6DNbhJdx5Ae9CfDjo=;
	b=Hm89eDdzaFrxUJTeC5sW6tTM0p+m4n6CR0Cw8RVJcm+R9C2ehZFVIvbuExZtBbXui9
	VbHTLz1TnRS/e/1+Pj0nyI6vqNf0modC50ceVgcdJf2VeAGNeZKqJ1yIYlppX2wmTnTO
	dHjPJZpsfZKA3fz9UTsv/4snX4UiZ6ezuF77qCpVeAjSyIcdyStUrPnRC6F6r7sP5WJn
	0CN9iBvoripoHQ87RrjHIrLfxb6aoQnmtbAw1NkFnsogt9+mEGoE44HrB1UM6RaSjptb
	CCaCiyRtFoxLK5FvcIfYiED2ghHPx/dYcYez0QNYxK6zgzOUcJPG5EsmylBRzKGWKQjd
	awnw==
X-Gm-Message-State: AGRZ1gLJC7/igPPg2CltsjRYRCfBRblkvEVuDZm68L190wNJ6r4CfzCl
	uquUrsV7dNx/h5+pIwdW6a/RVvFkaXc=
X-Received: by 2002:adf:f181:: with SMTP id h1-v6mr4653300wro.79.1541166077774;
	Fri, 02 Nov 2018 06:41:17 -0700 (PDT)
Received: from cloudburst.Home ([2a02:c7f:504f:6300:a3de:88d8:75ae:bf4c])
	by smtp.gmail.com with ESMTPSA id
	e10-v6sm1629686wrp.56.2018.11.02.06.41.16
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Fri, 02 Nov 2018 06:41:17 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Date: Fri,  2 Nov 2018 13:41:08 +0000
Message-Id: <20181102134112.26370-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.2
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::442
Subject: [Qemu-devel] [PATCH for-4.0 0/4] target/arm: LOR, HPD,
 AA32HPD extensions
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
Cc: qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: xJdPIpjRuW8p

Three relatively simple post-8.0 extensions.


r~


Richard Henderson (4):
  target/arm: Move id_aa64mmfr* to ARMISARegisters
  target/arm: Implement the ARMv8.1-LOR extension
  target/arm: Implement the ARMv8.1-HPD extension
  target/arm: Implement the ARMv8.2-AA32HPD extension

 target/arm/cpu.h           | 35 ++++++++++++++++-
 target/arm/internals.h     |  3 +-
 target/arm/cpu.c           |  4 ++
 target/arm/cpu64.c         | 11 ++++--
 target/arm/helper.c        | 80 +++++++++++++++++++++++++++++++++-----
 target/arm/translate-a64.c | 12 ++++++
 6 files changed, 129 insertions(+), 16 deletions(-)

-- 
2.17.2

