Received: by 2002:a5d:4301:0:0:0:0:0 with SMTP id h1-v6csp729794wrq;
        Fri, 29 Jun 2018 06:31:05 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpfB1/yJfYLJGkJS28uf16iff+BpAr8qc8ouvKmySDZM60jMCe8VYv0+X1sWTyxOOZK+AoXz
X-Received: by 2002:a0c:94f1:: with SMTP id k46-v6mr13114634qvk.113.1530279064895;
        Fri, 29 Jun 2018 06:31:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1530279064; cv=none;
        d=google.com; s=arc-20160816;
        b=Y2YkZDrjsIWIUnBGR3JfKcAcQcEq5ylTtIxecmNbVzwYxWBirMfZxLW2g76JC+OPJ6
         nD/sY1vTZvwOGZucB1u3gXYuFeRyEZXNCykVARxcM7fU2HIlwUV+/vrMuLxOUbRbbBrq
         6jPCXX/xU9dfomvaJluKCIPBHkVWHr0Gmy3pQsNSyv1xwzF0PRqxiFt4OfF4ZL7EYbHv
         grMiEXRJ9oVNBr68X1D8ZxSrCU5VkdLC9pNNcM1mSK2n4PZ2RMYDk1VKOFfrHK6YguGI
         GUfvMU/Pj2ToZefE3eFqucz93zgL5LqbkioIeq2EoLTXycdeHaPNFCCxQIvs5DzYbpBW
         7csQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature:dkim-signature
         :dkim-signature:arc-authentication-results;
        bh=Kn7BQtlK6jylqweUwb7jgUIlPTPO+6KMm49AYSx9FWg=;
        b=mgAodyfeyYQWDXLQExF61nmOVlGRVU59kdTYB2SYaQHflZ18F9cVwrVm7s5S3UpRwm
         o6cUAVJHJuvEssYh3Ra7hCNusbOVc55tblSNSJCcOifZdVIDmftqLuiFNeqzldG0CQTb
         cvG2PKesiPczsYMLgOv46noUyoJehoxGG90AwdMTf/OvnZtg1F8l1Me6+DwV4ZlLUJzJ
         QLhPeuyW0z8f/mT6qZgEhvia30MXzKFLQAErZutSoNkPyqhIxepsQZ4Fucp6wSUrICXG
         5GawFqWi/wJwFaAyqMBLZiQLHcUmFZBld5erBgqYKCWkUF+PFf89cQsI/7jg1HJXrw35
         VAwg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=uCe6PokQ;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=7SF37hjK;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=7SF37hjK;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id y4-v6si1782804qva.178.2018.06.29.06.31.04
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 29 Jun 2018 06:31:04 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=uCe6PokQ;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=7SF37hjK;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=7SF37hjK;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:42134 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fYtUO-0007ac-6j
	for alex.bennee@linaro.org; Fri, 29 Jun 2018 09:31:04 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37850)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>) id 1fYtU6-0007Zt-Tf
	for qemu-arm@nongnu.org; Fri, 29 Jun 2018 09:30:49 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>) id 1fYtU1-0006l6-Si
	for qemu-arm@nongnu.org; Fri, 29 Jun 2018 09:30:46 -0400
Received: from greensocs.com ([193.104.36.180]:58557)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>)
	id 1fYtU1-0006ZV-Ho; Fri, 29 Jun 2018 09:30:41 -0400
Received: from localhost (localhost [127.0.0.1])
	by greensocs.com (Postfix) with ESMTP id 6FD614434B0;
	Fri, 29 Jun 2018 15:30:34 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1530279034;
	bh=hy2xioeOgpWDvjVWNTqy9JfacgGmvViw5GG6aQwA0B0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=uCe6PokQcZ8qX+glvR6h0qVezPl90zgGcl+hWtR3rkCjWM64qRTh2Ja6fnAAriHDM
	/od8K53tLl6gmTF1XOg44yO5mk8oaIqXqJWyV1hS5xMez43PFgiQCvaS/CsZlHZ0ES
	en0/jFgcTPlZxzXC2yKTPrRi7UGCJ1dEevn92heg=
X-Virus-Scanned: amavisd-new at greensocs.com
Authentication-Results: gs-01.greensocs.com (amavisd-new);
	dkim=pass (1024-bit key) header.d=greensocs.com header.b=7SF37hjK;
	dkim=pass (1024-bit key) header.d=greensocs.com header.b=7SF37hjK
Received: from greensocs.com ([127.0.0.1])
	by localhost (gs-01.greensocs.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9-y2MaalaNpm; Fri, 29 Jun 2018 15:30:33 +0200 (CEST)
Received: by greensocs.com (Postfix, from userid 998)
	id EA23C4434AF; Fri, 29 Jun 2018 15:30:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1530279032;
	bh=hy2xioeOgpWDvjVWNTqy9JfacgGmvViw5GG6aQwA0B0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=7SF37hjKAF7IXVvDtHUL+CAct+moPM+LSWquIAE/GM2sAfwAYvZdnGiKFOylb2mKH
	zjJ9elEdPMpTKIlqQ21MKumD+Joa46ted4X6tsVWn6WpZiWfU6UVIq8DMmIfdjsDue
	eUObLbdtngNUfR8MM2B/r5jaec33VtG66iuissX4=
Received: from michell-laptop.hive.antfield.fr
	(LFbn-LYO-1-488-36.w2-7.abo.wanadoo.fr [2.7.77.36])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: luc.michel@greensocs.com)
	by greensocs.com (Postfix) with ESMTPSA id CADF44434A7;
	Fri, 29 Jun 2018 15:30:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1530279032;
	bh=hy2xioeOgpWDvjVWNTqy9JfacgGmvViw5GG6aQwA0B0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=7SF37hjKAF7IXVvDtHUL+CAct+moPM+LSWquIAE/GM2sAfwAYvZdnGiKFOylb2mKH
	zjJ9elEdPMpTKIlqQ21MKumD+Joa46ted4X6tsVWn6WpZiWfU6UVIq8DMmIfdjsDue
	eUObLbdtngNUfR8MM2B/r5jaec33VtG66iuissX4=
From: Luc Michel <luc.michel@greensocs.com>
To: qemu-devel@nongnu.org
Date: Fri, 29 Jun 2018 15:29:38 +0200
Message-Id: <20180629132954.24269-5-luc.michel@greensocs.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20180629132954.24269-1-luc.michel@greensocs.com>
References: <20180629132954.24269-1-luc.michel@greensocs.com>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 193.104.36.180
Subject: [Qemu-arm] [PATCH v3 04/20] vmstate.h: Provide
 VMSTATE_UINT16_SUB_ARRAY
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
Cc: Peter Maydell <peter.maydell@linaro.org>, mark.burton@greensocs.com,
	saipava@xilinx.com, edgari@xilinx.com, qemu-arm@nongnu.org,
	Jan Kiszka <jan.kiszka@web.de>, Luc Michel <luc.michel@greensocs.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 1Cyw67W6vaLK

Provide a VMSTATE_UINT16_SUB_ARRAY macro to save a uint16_t sub-array in
a VMState.

Signed-off-by: Luc Michel <luc.michel@greensocs.com>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
---
 include/migration/vmstate.h | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/include/migration/vmstate.h b/include/migration/vmstate.h
index 42b946ce90..2b501d0466 100644
--- a/include/migration/vmstate.h
+++ b/include/migration/vmstate.h
@@ -923,6 +923,9 @@ extern const VMStateInfo vmstate_info_qtailq;
 #define VMSTATE_UINT16_ARRAY(_f, _s, _n)                               \
     VMSTATE_UINT16_ARRAY_V(_f, _s, _n, 0)
 
+#define VMSTATE_UINT16_SUB_ARRAY(_f, _s, _start, _num)                \
+    VMSTATE_SUB_ARRAY(_f, _s, _start, _num, 0, vmstate_info_uint16, uint16_t)
+
 #define VMSTATE_UINT16_2DARRAY(_f, _s, _n1, _n2)                      \
     VMSTATE_UINT16_2DARRAY_V(_f, _s, _n1, _n2, 0)
 
-- 
2.17.1

