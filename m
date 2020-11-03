Received: by 2002:a19:6b17:0:0:0:0:0 with SMTP id d23csp4401125lfa;
        Mon, 2 Nov 2020 17:27:46 -0800 (PST)
X-Google-Smtp-Source: ABdhPJy3CkY7gLybF98f+v0ONXrbAsD0j9wk1pUXJjxqptyaqnH/Z6bCNZmWAME22ton3RcnkJ3D
X-Received: by 2002:ac8:4791:: with SMTP id k17mr17923803qtq.264.1604366866180;
        Mon, 02 Nov 2020 17:27:46 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1604366866; cv=none;
        d=google.com; s=arc-20160816;
        b=yavdBFGVmIp/CsUWrRN/dNpNpI54s/nxcyogEPa2jShL3Ve4WrT7SE3GoTFG/lyScm
         hc/VfVKsqUH3YDUh2TMK/y0IMsUDBMvlPZa0fXoTVcW5DpAcPcLXiwa1ZK5CUjWtEDop
         P/0ps7uSzQMh53R7MSI7lHS/DnUYvNDu4mF1y63k+x6As8OXpdWkPdgp1Zt5U2n4xN6r
         eORkRN65FoMx3tOy1vvCqIOuDoDiJJd/hJC19uOwQW41Z80pldZBdaUqMD5rLE7zgKfg
         DmTxcfBdAt74a6wDN5xYz1zE4mP1WvBOtn8ZSI5v0rIqdkbdlvTKqqLU7pnfcZxiU15w
         Hyzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=from:reply-to:sender:errors-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence:cc:to:subject
         :references:mime-version:message-id:in-reply-to:date:dkim-signature;
        bh=JxK2qxZcV+rPyxQ1iJcsq+gn9Mog1owPmmvYNPYF1iM=;
        b=fWMcwgTDDWQIjxa+urRmZpoooupdPLuZ9bICZlitro9CgLaCTMi+J+1R2qPxnogyWb
         n7xQ+PfQ4IWkCOpQIAtl5I5gTieGdX6k4SiFLQSIPj9qbs9d0DaSgZxri+7ZnNwrGr40
         2Ovj7PlnK5SB2ASGwxbzxGvn0eAXFdrADLAhkXW4BOsFBTtXTBpAFsO8e4vqHRxhOeeE
         ec/a3fnF8q4TYdj7V0NFOtamGQkcdnndeJaF8Ii/mcnKmwO13ImOk6mVj6nHrytcuPut
         kQjnDUxWdTJ1PaVDiGv3dDjhxjbqmjezGEoArW9/QFLXBnFU2eGmoWZsUZ2PgDRL/Qoj
         aZWA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@google.com header.s=20161025 header.b=DOME5NaI;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k9si9490537qki.296.2020.11.02.17.27.46
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 02 Nov 2020 17:27:46 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@google.com header.s=20161025 header.b=DOME5NaI;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1]:54202 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kZl6v-0007te-IQ
	for alex.bennee@linaro.org; Mon, 02 Nov 2020 20:27:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51652)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3IK-gXwsKCgUmxpnssjrtjslttlqj.htrvjrz-ij0jqstslsz.twl@flex--hskinnemoen.bounces.google.com>)
 id 1kZkuu-00083b-6k
 for qemu-devel@nongnu.org; Mon, 02 Nov 2020 20:15:20 -0500
Received: from mail-pf1-x44a.google.com ([2607:f8b0:4864:20::44a]:50328)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3IK-gXwsKCgUmxpnssjrtjslttlqj.htrvjrz-ij0jqstslsz.twl@flex--hskinnemoen.bounces.google.com>)
 id 1kZkur-0005ml-BZ
 for qemu-devel@nongnu.org; Mon, 02 Nov 2020 20:15:19 -0500
Received: by mail-pf1-x44a.google.com with SMTP id a27so11145379pfl.17
 for <qemu-devel@nongnu.org>; Mon, 02 Nov 2020 17:15:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=sender:date:in-reply-to:message-id:mime-version:references:subject
 :from:to:cc; bh=JxK2qxZcV+rPyxQ1iJcsq+gn9Mog1owPmmvYNPYF1iM=;
 b=DOME5NaItIC85TrLnDTLYORe7ados5XlgIBx1gK0bFKpLvfwoaJRcXWasPu7yXvtc8
 yxX/OUu3genXtvynWXcGoZV1DNNQbuf7pphjBckO4mjuYx/LKkvMKOlqCBbE3++AjXlF
 4Lx7m3/zzDpZFfMkepKPd+yB2st195k+djnDcaO1fMq20UmcixdGxjQ4cu32w6+YsTFy
 WoDSol0dm0+VncIAWrzw/zuPfBJiTCPzYxpEdXV+U5LO8FmpgCKdmmtRlzwgik5nID7i
 atCIFx4VR+n/fORExJX5p9kEuNt00hbGYE/LqQmXZIPF3dHyJ0jabZHJZYeAs1SDjX9S
 GxDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=JxK2qxZcV+rPyxQ1iJcsq+gn9Mog1owPmmvYNPYF1iM=;
 b=oTVGRBe9N2LDaTpZNJ8KyEnr8azgM9VueN4sKi53KbFbveCRF2HQP2UItu5XX5CN9E
 qElXhB9XSrrMaZClbnkJgPxs7eZiJ2A6SOpHZCuk/lTPlKVjQ8FO02mAmqVzOFMnprAs
 RnUBMwMEFp7GcpltDKQcx/CvMzpTDEXtlKY3uSErHdJWhWQeAdSfTEu2E9PJt8tfIoKd
 xZj35cyG/Z3b7STvO6PwdtU7mR6wmW8ECkB2PLfx7gX58TK4J0XIiEpj45cYkhmS9XRW
 iDttP2ehYIptqYv5SYSOdCoGTb76bv2OBjMVgn0jEWauVw9II/n7zOQKEOC+Y7L/9Xjv
 IRFA==
X-Gm-Message-State: AOAM533Duwb+xEAA64P5jhgdU0+F30TsiBjujguMKKRukhwwdW2nmLQh
 8nHH8fhNCtE9PXwiHnwXUTk628tyMGkKTsHuGQ==
X-Received: from skybert.c.googlers.com ([fda3:e722:ac3:10:24:72f4:c0a8:3107])
 (user=hskinnemoen job=sendgmr) by
 2002:aa7:8a8e:0:b029:160:1a45:a6e6 with
 SMTP id a14-20020aa78a8e0000b02901601a45a6e6mr24557129pfc.54.1604366112810;
 Mon, 02 Nov 2020 17:15:12 -0800 (PST)
Date: Mon,  2 Nov 2020 17:14:55 -0800
In-Reply-To: <20201103011457.2959989-1-hskinnemoen@google.com>
Message-Id: <20201103011457.2959989-2-hskinnemoen@google.com>
Mime-Version: 1.0
References: <20201103011457.2959989-1-hskinnemoen@google.com>
X-Mailer: git-send-email 2.29.1.341.ge80a0c044ae-goog
Subject: [PATCH 1/3] tests/qtest/npcm7xx_rng-test: count runs properly
To: peter.maydell@linaro.org
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, 
 Havard Skinnemoen <hskinnemoen@google.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::44a;
 envelope-from=3IK-gXwsKCgUmxpnssjrtjslttlqj.htrvjrz-ij0jqstslsz.twl@flex--hskinnemoen.bounces.google.com;
 helo=mail-pf1-x44a.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -95
X-Spam_score: -9.6
X-Spam_bar: ---------
X-Spam_report: (-9.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 USER_IN_DEF_DKIM_WL=-7.5 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Reply-to: Havard Skinnemoen <hskinnemoen@google.com>
From: Havard Skinnemoen via <qemu-devel@nongnu.org>
X-TUID: znUZ6Ecxk0bt

The number of runs is equal to the number of 0-1 and 1-0 transitions,
plus one. Currently, it's counting the number of times these transitions
do _not_ happen, plus one.

Source:
https://nvlpubs.nist.gov/nistpubs/Legacy/SP/nistspecialpublication800-22r1a.pdf
section 2.3.4 point (3).

Signed-off-by: Havard Skinnemoen <hskinnemoen@google.com>
---
 tests/qtest/npcm7xx_rng-test.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/qtest/npcm7xx_rng-test.c b/tests/qtest/npcm7xx_rng-test.c
index da6e639bf6..57787c5ffc 100644
--- a/tests/qtest/npcm7xx_rng-test.c
+++ b/tests/qtest/npcm7xx_rng-test.c
@@ -126,7 +126,7 @@ static double calc_runs_p(const unsigned long *buf, unsigned int nr_bits)
     pi = (double)nr_ones / nr_bits;
 
     for (k = 0; k < nr_bits - 1; k++) {
-        vn_obs += !(test_bit(k, buf) ^ test_bit(k + 1, buf));
+        vn_obs += (test_bit(k, buf) ^ test_bit(k + 1, buf));
     }
     vn_obs += 1;
 
-- 
2.29.1.341.ge80a0c044ae-goog

