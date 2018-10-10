Received: by 2002:a5d:4c4c:0:0:0:0:0 with SMTP id n12-v6csp1478840wrt;
        Wed, 10 Oct 2018 13:38:57 -0700 (PDT)
X-Google-Smtp-Source: ACcGV61KEFPUfcxGL/ie3ltTMmulTvIkst36YE9BQkncSI74vLbN3rkFxEPDSUqVjKhDBGmoIYRr
X-Received: by 2002:aed:2ba7:: with SMTP id e36-v6mr29824915qtd.154.1539203937371;
        Wed, 10 Oct 2018 13:38:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1539203937; cv=none;
        d=google.com; s=arc-20160816;
        b=HXFvFg8YFUBtsKQn1vZMrnY7si7nVBtaaQWCwr8UzivUHlKbUtriHqwxINcvsVwkkh
         TGI8jn26zXv427untPQI+YaJTCxYnpS/P7XTmvTrJIjYk8ZHk6ImlfoQltk8ZX0poJ0d
         HQJhEcgYx+MRbasVaoT0gBuFt5Pgm0JNu81h5dxIUQgobpuD5ZdnXDh20PJC/9dM+h9R
         aepTVOiWRigj/0VgOuBn6nXfMdZ+UykZ0YnsgmBn2xeyYyL6ZZ9HJEnCNrCIcvj5bwoW
         0ACbjqpC6O4GfwvZaKpHQHf61BvdUDnBpyWSFs1+j1vYYsBBPnNNIl1begCxsPxpGrXQ
         1biw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature;
        bh=O/InNUI5zywfTNAUJd/dlvGPiQLYFT0XunI5ik12f+Q=;
        b=fRC2w22KZesqpuCvTXCVb0LwV3/CSyJI0SrVHopo+UpZAVQ66LFzl2zaODxSE1nBnm
         8c5XnSeZssWFkO8qfpmr791ezheGXd9jn6/CPH87iyUmQrpKIPfOH/7CYOLKlJifGs02
         KMWkuFUpI52rn2FsTdvPAOt5SghO1goh/fCBoKh8fPQzkCfbmb6doyyjoTRzLZ4NZ7/U
         yDKUQBEAN8ckuv1ccXuomligMxgiA5c6UeH+7cM/sg0S+fNE1W+dO3m10n2FnRPgspmh
         Zh2GqUmM2/uNlsJHGv40d5rS9yRmKTNRTRF9sQbeMGfOdsN/Ov+RkTJpdXYNVlM8pI1D
         Z+yQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=fSIrR3BJ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id k26-v6si4690114qtk.49.2018.10.10.13.38.57
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 10 Oct 2018 13:38:57 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=fSIrR3BJ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:59024 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gALFw-0002t8-SD
	for alex.bennee@linaro.org; Wed, 10 Oct 2018 16:38:56 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39415)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <aclindsa@gmail.com>) id 1gALFV-0002of-SI
	for qemu-arm@nongnu.org; Wed, 10 Oct 2018 16:38:33 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <aclindsa@gmail.com>) id 1gALFT-0002OM-Rq
	for qemu-arm@nongnu.org; Wed, 10 Oct 2018 16:38:29 -0400
Received: from mail-yw1-xc35.google.com ([2607:f8b0:4864:20::c35]:37548)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <aclindsa@gmail.com>)
	id 1gALFR-0002Mx-C7; Wed, 10 Oct 2018 16:38:26 -0400
Received: by mail-yw1-xc35.google.com with SMTP id y14-v6so2726189ywa.4;
	Wed, 10 Oct 2018 13:38:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=O/InNUI5zywfTNAUJd/dlvGPiQLYFT0XunI5ik12f+Q=;
	b=fSIrR3BJUdLlvCiF4r84EIzOvBhwC0Ra29+k1UE8+wx2mKhaawzXVUYl77q1jcaxQX
	Dlc/F4K109cboP5GbTwFYNnDSEUDb0+a1uOFws8PWClmSFuMuVtAyIvq4pFvtETV6/xS
	FbhIj4qNZUo0FprXdfW3O6rAtT763qlaSIr/SkHAO/20JnGEAq9HHcYF8rSEi6hyvP/S
	0mjJoZyl9qMxvqk6OMUV9EEVZ9EvEXaHxgJ+jJbWT3qpVr4TWjS2SbElNsmvXV/eY3wg
	+UJrz8HyjY2y5UTaBmUraStl7hNO1sSqIMX4It4zr6YTO4FlqCPTt35GPZKxWmKIeMr6
	ECZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=O/InNUI5zywfTNAUJd/dlvGPiQLYFT0XunI5ik12f+Q=;
	b=NlFc1wIQ38Sz+euS2tqak7esGOgGuX/aJ4Lm3+E+P/viLXiwD/wJ9cfywZhWIvkHS7
	nm4fOokqwJvUBikRh1ZKWuPloCp89yl4KPBX+lGkmv154zLK68q7RXvod7TJBNLVKkl8
	u3pP3qB36c/ZHFyIucYZYovrHmlqTIswymy2VNuDJIMKVEnC0RlGBUm1PjlQAGPvauqZ
	n2L5fZP6z0dvh1gT8BOTuWoz63pR2llH+tecAS0efNeyX29yrSqlRsZLa+bkNL23awft
	s+h92MeWb/YiSh0Gk/LGRrx2VnvuDjDiiO8EvcryiMYYqb4Wyi+J7egm2x1rrStaCFOQ
	czDg==
X-Gm-Message-State: ABuFfohN2OCxgz3M2tLm4Z/+CY7AYVikLnHoi3Uwv4t5lg3xabmJZcft
	tY9miYX0ceb9Ewz73gLDe4HS7TtN
X-Received: by 2002:a81:3e0d:: with SMTP id
	l13-v6mr15862823ywa.380.1539203904226; 
	Wed, 10 Oct 2018 13:38:24 -0700 (PDT)
Received: from quinoa.localdomain ([216.85.170.153])
	by smtp.gmail.com with ESMTPSA id
	u131-v6sm15170728ywf.13.2018.10.10.13.38.23
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 10 Oct 2018 13:38:23 -0700 (PDT)
From: Aaron Lindsay <aclindsa@gmail.com>
To: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
	Alistair Francis <alistair.francis@xilinx.com>, Wei Huang <wei@redhat.com>,
	Peter Crosthwaite <crosthwaite.peter@gmail.com>
Date: Wed, 10 Oct 2018 16:37:22 -0400
Message-Id: <20181010203735.27918-2-aclindsa@gmail.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <20181010203735.27918-1-aclindsa@gmail.com>
References: <20181010203735.27918-1-aclindsa@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::c35
Subject: [Qemu-arm] [PATCH v6 01/14] target/arm: Mark PMINTENCLR and
 PMINTENCLR_EL1 accesses as possibly doing IO
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
Cc: Aaron Lindsay <alindsay@codeaurora.org>, Aaron Lindsay <aclindsa@gmail.com>,
	Michael Spradling <mspradli@codeaurora.org>,
	qemu-devel@nongnu.org, Digant Desai <digantd@codeaurora.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: XTNUxoghYhfb

I previously fixed this for PMINTENSET_EL1, but missed these.

Signed-off-by: Aaron Lindsay <alindsay@codeaurora.org>
Signed-off-by: Aaron Lindsay <aclindsa@gmail.com>
---
 target/arm/helper.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index c83f7c1109..52c76b7444 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -1423,12 +1423,14 @@ static const ARMCPRegInfo v7_cp_reginfo[] = {
       .writefn = pmintenset_write, .raw_writefn = raw_write,
       .resetvalue = 0x0 },
     { .name = "PMINTENCLR", .cp = 15, .crn = 9, .crm = 14, .opc1 = 0, .opc2 = 2,
-      .access = PL1_RW, .accessfn = access_tpm, .type = ARM_CP_ALIAS,
+      .access = PL1_RW, .accessfn = access_tpm,
+      .type = ARM_CP_ALIAS | ARM_CP_IO,
       .fieldoffset = offsetof(CPUARMState, cp15.c9_pminten),
       .writefn = pmintenclr_write, },
     { .name = "PMINTENCLR_EL1", .state = ARM_CP_STATE_AA64,
       .opc0 = 3, .opc1 = 0, .crn = 9, .crm = 14, .opc2 = 2,
-      .access = PL1_RW, .accessfn = access_tpm, .type = ARM_CP_ALIAS,
+      .access = PL1_RW, .accessfn = access_tpm,
+      .type = ARM_CP_ALIAS | ARM_CP_IO,
       .fieldoffset = offsetof(CPUARMState, cp15.c9_pminten),
       .writefn = pmintenclr_write },
     { .name = "CCSIDR", .state = ARM_CP_STATE_BOTH,
-- 
2.19.1

