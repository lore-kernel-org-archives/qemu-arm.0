Received: by 2002:a5d:6782:0:0:0:0:0 with SMTP id v2-v6csp506972wru;
        Fri, 27 Jul 2018 02:55:15 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpfr9xzyIWMGlXehsuv5MOED35GK6P8OuKijQze0BE+Sc70k6KBWg1O8UwStThXp4Jqxl0j/
X-Received: by 2002:a0c:c963:: with SMTP id v32-v6mr4898634qvj.215.1532685315887;
        Fri, 27 Jul 2018 02:55:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1532685315; cv=none;
        d=google.com; s=arc-20160816;
        b=H/eJJQPkpSphE7PnQCpFBk2E+UE0IaSsABFt5vX42mDcF+DGpCAstD5vxkv2LTJ1Vo
         Ii9YSgyecQytPtaD0VzShYKm86WCdVKv/BAvKfb2MtjcQVyLh+kLtBp2qq01ANhZakIr
         Eh3pDF4SL5AeVgWssGSIKXBDef2oRvPoAkNa0ohms1v4ygUJhwjAC0+IKyaZ/cgerW+n
         7t2huEj0zbfL16M/RhlwjQkDi3XZvkUbEzvR/0VSEJZCajUk1uR0TWXvzIwWIcnSxeHp
         FPA5/txdiHASnn1Z7jd9JMeQiimXmt8dpqSOdadDBseDFj6RlgtE+6ahniRpqmy2e2n1
         71xg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature:dkim-signature
         :dkim-signature:arc-authentication-results;
        bh=5hfLSBLw+o5wC1Ao86rguDpRgsQD2NxD4aJBH1pruW0=;
        b=W3dwZxZRLRSFCGf4JV1S4EkZUfnfJQTa4ar7SRrErCHCP5DiLhX/7IDmllw7O5stky
         lfsZCLa+yIejn71LaWltGl845eFII7zuZU4xmgosYLJNxdIPP0jZWEW+RVZF1OvWPAt+
         qRrCesaxhECtzqLZlhYwygRTN8eAokxbL4jSLTAdrq8u/5f2fOhNy+4eVPxsyBPIMqwz
         /B43zoLtdbhWbSvc8ISBh5pZXEOavfJtebqsfqgob4hnmZIgSWQaxJV4e7a+RLL4oPA7
         76PrQDO9DmJFOEqgtWjn8j4/uCYTpOq0/P89Hkd9omaG+cEyyLoQAjM4U43qlz7PF8D8
         GrFg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=V1ROwyx1;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=tBNFROtm;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=tBNFROtm;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id z3-v6si3514663qki.372.2018.07.27.02.55.15
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 27 Jul 2018 02:55:15 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=V1ROwyx1;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=tBNFROtm;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=tBNFROtm;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:40015 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fizSt-0003eF-Bc
	for alex.bennee@linaro.org; Fri, 27 Jul 2018 05:55:15 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58090)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>) id 1fizSc-0003W6-Ef
	for qemu-arm@nongnu.org; Fri, 27 Jul 2018 05:55:00 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>) id 1fizSY-00067u-G1
	for qemu-arm@nongnu.org; Fri, 27 Jul 2018 05:54:58 -0400
Received: from greensocs.com ([193.104.36.180]:47470)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>)
	id 1fizSY-00064D-1Q; Fri, 27 Jul 2018 05:54:54 -0400
Received: from localhost (localhost [127.0.0.1])
	by greensocs.com (Postfix) with ESMTP id D43C744354B;
	Fri, 27 Jul 2018 11:54:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1532685285;
	bh=1o4L6CAB0JKgZyTsEhAHf1uW//RbD8il0hTMwxGh2Zw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=V1ROwyx1b2c3tqnNOCC+wktuyVNa3DD7sx0OHNFD9vaU/5svcde4G/zaBsoytwKXo
	l8uDOkf1nZiz20UdyyALXFPBBFhaZAKepiAKgCvnzclq9xdZyZulgQNPX6CGpE+W4B
	xBfS0uPjuZs6uLi5TdcuQIbL6OFEwa51dlFANYi8=
X-Virus-Scanned: amavisd-new at greensocs.com
Authentication-Results: gs-01.greensocs.com (amavisd-new);
	dkim=pass (1024-bit key) header.d=greensocs.com header.b=tBNFROtm;
	dkim=pass (1024-bit key) header.d=greensocs.com header.b=tBNFROtm
Received: from greensocs.com ([127.0.0.1])
	by localhost (gs-01.greensocs.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id GijnWCfS8mRU; Fri, 27 Jul 2018 11:54:45 +0200 (CEST)
Received: by greensocs.com (Postfix, from userid 998)
	id 9D21B400DC8; Fri, 27 Jul 2018 11:54:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1532685284;
	bh=1o4L6CAB0JKgZyTsEhAHf1uW//RbD8il0hTMwxGh2Zw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=tBNFROtmSMhKVrhArjPLqpFlnK3vMuFoN0PHG0Cz8pn9SPWIAbSQs4iPwxf75y1GH
	tV2k5lgdzscC+5+s9wj37w3DfrVmSbqfcEtScMdu5+CQ4+Ol6Ex4pPRA20qjPBOk1g
	+4doZOTxKOHi4xub5Gy8KFhQTso4L9J+gOamObbg=
Received: from michell-laptop.bar.greensocs.com (antfield.tima.u-ga.fr
	[147.171.129.253])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: luc.michel@greensocs.com)
	by greensocs.com (Postfix) with ESMTPSA id 48D83443485;
	Fri, 27 Jul 2018 11:54:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1532685284;
	bh=1o4L6CAB0JKgZyTsEhAHf1uW//RbD8il0hTMwxGh2Zw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=tBNFROtmSMhKVrhArjPLqpFlnK3vMuFoN0PHG0Cz8pn9SPWIAbSQs4iPwxf75y1GH
	tV2k5lgdzscC+5+s9wj37w3DfrVmSbqfcEtScMdu5+CQ4+Ol6Ex4pPRA20qjPBOk1g
	+4doZOTxKOHi4xub5Gy8KFhQTso4L9J+gOamObbg=
From: Luc Michel <luc.michel@greensocs.com>
To: qemu-devel@nongnu.org
Date: Fri, 27 Jul 2018 11:54:05 +0200
Message-Id: <20180727095421.386-5-luc.michel@greensocs.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20180727095421.386-1-luc.michel@greensocs.com>
References: <20180727095421.386-1-luc.michel@greensocs.com>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 193.104.36.180
Subject: [Qemu-arm] [PATCH v5 04/20] vmstate.h: Provide
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
X-TUID: 0yZU9wfQ1z2f

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
@@ -921,10 +921,13 @@ extern const VMStateInfo vmstate_info_qtailq;
     VMSTATE_2DARRAY(_f, _s, _n1, _n2, _v, vmstate_info_uint16, uint16_t)
 
 #define VMSTATE_UINT16_ARRAY(_f, _s, _n)                               \
     VMSTATE_UINT16_ARRAY_V(_f, _s, _n, 0)
 
+#define VMSTATE_UINT16_SUB_ARRAY(_f, _s, _start, _num)                \
+    VMSTATE_SUB_ARRAY(_f, _s, _start, _num, 0, vmstate_info_uint16, uint16_t)
+
 #define VMSTATE_UINT16_2DARRAY(_f, _s, _n1, _n2)                      \
     VMSTATE_UINT16_2DARRAY_V(_f, _s, _n1, _n2, 0)
 
 #define VMSTATE_UINT8_2DARRAY_V(_f, _s, _n1, _n2, _v)                 \
     VMSTATE_2DARRAY(_f, _s, _n1, _n2, _v, vmstate_info_uint8, uint8_t)
-- 
2.18.0

