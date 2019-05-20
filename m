Received: by 2002:adf:c793:0:0:0:0:0 with SMTP id l19csp384541wrg;
        Mon, 20 May 2019 09:39:54 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwuExj7wSEU7pjJd652qUrTAZOnpOjpyPzaE9RpAj0X0uOdntG93MdH7Y+kA3MBLvLmrHvS
X-Received: by 2002:a17:906:3455:: with SMTP id d21mr16700745ejb.66.1558370394257;
        Mon, 20 May 2019 09:39:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1558370394; cv=none;
        d=google.com; s=arc-20160816;
        b=zJmnNKSiG7cR8ykvJmkOeUVagZ+CGdWx4IWLfR61Hf6LTIBaV5ofFIjLBK8ok4csN1
         LGZQtX6kljwPuzFI/9b1QUIKiNkIR28kPnSARhBQKS88eGUzuEMw4rQ+OO+gEicVhUtx
         EslMY2XoLUUpi5cgkNGrrFnhMHGtcpmEPcMftM40N4tZOw/Vl+c5cfsPgtaHRqpka1aH
         2wZ5a58chTv4Mu2zpcLGF9CxBxugkJjNwtQo19r/rEw/IGT7AyZDVSbvNfLecHFH0KMe
         f+3i+H0G1LWqHd6TkygPz8BS6mE8cSQReeiiZXKcq+a7+jq024W1tDd/pJNWvtcM+0m2
         +qnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature;
        bh=dQHnN+4pHJlYmoFJPk7sNMgKdxxuc9MbNwGNtlQi5Ao=;
        b=Ly7KbriSJwWXnBljeKsnmB4IpP7LMyJV/8gwSlGiGeuK5pJTZP1raBcCfcRKbEf/oc
         lfO4BysFsm3clN3T92CZQ/LNweuJ50bR5xiOFD2so+VlvSC2Vt+GLP5wusT9s2Pvx+11
         rmJyH0jHfZFSU+SSP7iY60cjZQ+oqbnCPqyU1cCxqJ71vUNA8fWY4y9MKvMAiH+WlS2+
         XPD5fzVxZsR+1B2qChakeHZsGB6jwZsE38f1c5WFCK1SnZPiFndcZ+eFyQH5fSh/sygh
         8j4ztu44DVRzD9Zgrz5+yzQvTG8fDUDyallyeK7rdpIh18F367O/PfdmicdH5AEUPPCX
         vc4Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="A3gT/Clv";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i41si4450938ede.444.2019.05.20.09.39.54
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 20 May 2019 09:39:54 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="A3gT/Clv";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([127.0.0.1]:38380 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hSlKL-0003Fj-87
	for alex.bennee@linaro.org; Mon, 20 May 2019 12:39:53 -0400
Received: from eggs.gnu.org ([209.51.188.92]:42772)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1hSl9H-000384-99
	for qemu-arm@nongnu.org; Mon, 20 May 2019 12:28:28 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1hSl9D-0001He-2e
	for qemu-arm@nongnu.org; Mon, 20 May 2019 12:28:25 -0400
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443]:32955)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1hSl99-0001F7-LL
	for qemu-arm@nongnu.org; Mon, 20 May 2019 12:28:21 -0400
Received: by mail-wr1-x443.google.com with SMTP id d9so2371596wrx.0
	for <qemu-arm@nongnu.org>; Mon, 20 May 2019 09:28:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=dQHnN+4pHJlYmoFJPk7sNMgKdxxuc9MbNwGNtlQi5Ao=;
	b=A3gT/ClvCRV7rtEPPnJmn1DsOMTebZrY5pD/AfpV30uVMBPOpEHXpgiWVrtV9TK4Hl
	AP0HbS3dNqAPrTIvYLokPQrdvhn5xlIKW8Y68A2SZff2mG5VIbW1GMhQPKIUeqB6whKV
	+NSf6ixOc2BjT69T/0eecTslatzI3woee0R5waM7PeBLNnFlXs1eLf3GFZ8jcNKXWoSX
	ULUM6hU6VJXZcwkW0Np4q9fQyWeS7AohOA2xpu0iWzGdHNMlHtEk+VrDMxxjGHGoYkLa
	hpNkwVkYxvAEY7BhnxFC+kUjEJtvHsJ5+yse+UQn/HFEAxK0rmHFW/E0A5UktknsV926
	YWjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=dQHnN+4pHJlYmoFJPk7sNMgKdxxuc9MbNwGNtlQi5Ao=;
	b=LPHUKwf/vszB1gShl+lXZ17ZlxTM8weY1I1v6beDp2WJLMbV8mm8qx5kgdarnSDNE3
	kspWXFDMzN1+vEOxq/xKVcbcO0wkGMTzbtuhnFq+BBa1vKdoZWbQmJT4wJfc283pJbTT
	lHofG9d4nb815+9ATbegG9W8OqO/E/NyOR7BV/PEgnDtbd8Df4sHqmCpxnWKGQbsidh8
	ziWK6J8it+IKj6GA/f6sFTkF4IGuuZxjQ5FYUa32WdaGUboPPm8mE0hgjkwMkMlO753a
	TQ3YLWPjM9keYNmc+AIlOFwT+2dZ9f9ua515CrJXvBL8ZwmrBoXmiJsCtmeWVLYlJ8tv
	OtkA==
X-Gm-Message-State: APjAAAXRPRoAMuB4i8P947pRhTaz36P054wqiN+DvAEbK0D3uCWLWRrG
	mjctTdE5E8Lyr9J2HF17RH35eGUtDRo=
X-Received: by 2002:a5d:68cf:: with SMTP id p15mr17181726wrw.105.1558369695764;
	Mon, 20 May 2019 09:28:15 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
	by smtp.gmail.com with ESMTPSA id x2sm5830394wrs.39.2019.05.20.09.28.14
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 20 May 2019 09:28:15 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Mon, 20 May 2019 17:28:08 +0100
Message-Id: <20190520162809.2677-4-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190520162809.2677-1-peter.maydell@linaro.org>
References: <20190520162809.2677-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::443
Subject: [Qemu-arm] [PATCH 3/4] hw/intc/arm_gicv3: Fix write of
 ICH_VMCR_EL2.{VBPR0, VBPR1}
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: lvUTOaleIKHq

In ich_vmcr_write() we enforce "writes of BPR fields to less than
their minimum sets them to the minimum" by doing a "read vbpr and
write it back" operation.  A typo here meant that we weren't handling
writes to these fields correctly, because we were reading from VBPR0
but writing to VBPR1.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/intc/arm_gicv3_cpuif.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/intc/arm_gicv3_cpuif.c b/hw/intc/arm_gicv3_cpuif.c
index cbad6037f19..000bdbd6247 100644
--- a/hw/intc/arm_gicv3_cpuif.c
+++ b/hw/intc/arm_gicv3_cpuif.c
@@ -2366,7 +2366,7 @@ static void ich_vmcr_write(CPUARMState *env, const ARMCPRegInfo *ri,
     /* Enforce "writing BPRs to less than minimum sets them to the minimum"
      * by reading and writing back the fields.
      */
-    write_vbpr(cs, GICV3_G1, read_vbpr(cs, GICV3_G0));
+    write_vbpr(cs, GICV3_G0, read_vbpr(cs, GICV3_G0));
     write_vbpr(cs, GICV3_G1, read_vbpr(cs, GICV3_G1));
 
     gicv3_cpuif_virt_update(cs);
-- 
2.20.1

