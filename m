Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp619363wrt;
        Fri, 25 Jan 2019 10:31:03 -0800 (PST)
X-Google-Smtp-Source: ALg8bN40c1M5yCjOpCzkpQ7SQxGe3BI4yAv+AhSlyJOvkyHJjAc09E1RruiZr73JjJTeOc38plLO
X-Received: by 2002:a1c:b455:: with SMTP id d82mr8180666wmf.78.1548441063184;
        Fri, 25 Jan 2019 10:31:03 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1548441063; cv=none;
        d=google.com; s=arc-20160816;
        b=rWlTQznxJEgvCLoEAOzl6E/XoOQrMBfDgVQSzD0d4LoPnCK2t+06SaObuIGoOLwJjG
         ZgR7AVNZG75aSll/IrjpRVFh6XZj+FmVBBB/RJLQDNDW/9mjmz7xoZhp57BthgFz7Zxg
         Zcu1JfK9ZIQOju/rcbyzn2RiWHE4qKK9ftJWk6MqmF2r9t+xz3rEwev3MdPzIXV460Fi
         uvzKG1N26+TClYhBjvoffQSt4iw9o9k8mnocjpKggo4ytGjS5HwzX4S0K5+mToCAPPfB
         CjeVux+BI7/XgdAjj95HC2f8JMVJMgRatCCq/TgiyCjRtrEIvYDIvoF8P9akSmuExz3O
         OcTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature;
        bh=O1du06yHQQZbH4UvjLrkhnO8CuAthMbLXRKig3LlNvA=;
        b=JsAu2etzjMofgwKhS8vtkzMiEhBFuZERghDfRf1OHP8jXvxHnYzjbmxfxliE3uoTn/
         Jm1wlNK8NT6y/VdLKzvhCUmclEeQ8JvMsXQ660VkPy6UU7CrVA/BpQ4U9CMtjK48Xr1k
         HKQTFmxjTZNROj9caV/2MXNqTlfjge81xbajUkMSscqZUndwu9g2m+XgQQLNFNKDluc2
         MsSle4dU8nQORV/uCYu+0fCRdjOJwmmMjetMPGRbSKiQ7wRUDRHb5+jyqHxonAXPZi5m
         HK+/ENQ+QeRAwb9NqlcusqgIXVei8vCw3RKQdJZQjNqwDe2iSrXYhAYxutN85F+oTNZr
         m9zg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=IQkIjy15;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f16si55525906wrt.428.2019.01.25.10.31.03
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 25 Jan 2019 10:31:03 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=IQkIjy15;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([127.0.0.1]:49027 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gn6Fq-0007gm-8W
	for alex.bennee@linaro.org; Fri, 25 Jan 2019 13:31:02 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54575)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1gn6Bo-0004Nh-D8
	for qemu-arm@nongnu.org; Fri, 25 Jan 2019 13:26:55 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1gn6Bi-0002eU-LL
	for qemu-arm@nongnu.org; Fri, 25 Jan 2019 13:26:52 -0500
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442]:35286)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1gn6Bi-0002Sc-Cq
	for qemu-arm@nongnu.org; Fri, 25 Jan 2019 13:26:46 -0500
Received: by mail-wr1-x442.google.com with SMTP id 96so11363424wrb.2
	for <qemu-arm@nongnu.org>; Fri, 25 Jan 2019 10:26:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=O1du06yHQQZbH4UvjLrkhnO8CuAthMbLXRKig3LlNvA=;
	b=IQkIjy15DBzO8ZGYaVEJowdX6E59xUuiB7s9AJ2liqLNumT1oJ7izk+yabCGW0SOpR
	VimWqwIbYNC9l/xpWMdpHFMJiUKgJejD17eRsD4yDbsbAO60DA2JCv1Fjh+QbfSRaZSf
	TlhFo0Q7zvcJmdTTBeyuOfZ3AVGWguBYFM5S0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=O1du06yHQQZbH4UvjLrkhnO8CuAthMbLXRKig3LlNvA=;
	b=aFEaWDgvohyquOwEdyRIG2r8eLRGhN7ZUG+nPUrJlW/mbY8czrFe3G3L2wKzT0NuXg
	Llm5YRbFuI1YaXy5cekXIBAR4mHGZhbxjPZrQGpzyv8bfzoFil7j85PEoupGMwq6PWV0
	7dU5oMI+teEkz+Agpq1u19y1TEBAOsH8xW9iOX/fKApVCq7Fx8Js7spj1KYNAC78iLtC
	c7M65F8ifzcLs7d9BTsuAB+hiXB88aZP20nDMYt+Ucdz553Ek2QwcqPGUOmtntavwYe9
	LaqnQk/iBlrVCEl+cQ2X79vJCSpguaifFsa89nfzkcDfzZheLJrSNNlDhu5mRLGIaRLa
	bkvg==
X-Gm-Message-State: AJcUukf1AKVFhjwH2EjdrOuK7epRg7eEZ3nOWn3+yYRKOaj7mdP2AODd
	xYjkqCqldBtgZKuBxkWN3sxYeAP/5RHbGQ==
X-Received: by 2002:a5d:45d0:: with SMTP id b16mr11994858wrs.86.1548440791392; 
	Fri, 25 Jan 2019 10:26:31 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
	by smtp.gmail.com with ESMTPSA id
	t5sm45014921wmg.43.2019.01.25.10.26.30
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 25 Jan 2019 10:26:30 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Fri, 25 Jan 2019 18:26:21 +0000
Message-Id: <20190125182626.9221-3-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190125182626.9221-1-peter.maydell@linaro.org>
References: <20190125182626.9221-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::442
Subject: [Qemu-arm] [PATCH 2/7] target/arm/translate-a64: Don't underdecode
 PRFM
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
Cc: Laurent Desnogues <laurent.desnogues@gmail.com>, patches@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 6GtUyR8yGslX

The PRFM prefetch insn in the load/store with imm9 encodings
requires idx field 0b00; we were underdecoding this by
only checking !is_unpriv (which is equivalent to idx != 2).
Correctly UNDEF the unallocated encodings where idx == 0b01
and 0b11 as well as 0b10.

Reported-by: Laurent Desnogues <laurent.desnogues@gmail.com>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/translate-a64.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index e6df303e321..8e081758e03 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -2803,7 +2803,7 @@ static void disas_ldst_reg_imm9(DisasContext *s, uint32_t insn,
     } else {
         if (size == 3 && opc == 2) {
             /* PRFM - prefetch */
-            if (is_unpriv) {
+            if (idx != 0) {
                 unallocated_encoding(s);
                 return;
             }
-- 
2.20.1

