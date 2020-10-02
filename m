Received: by 2002:ac2:4c26:0:0:0:0:0 with SMTP id u6csp1325035lfq;
        Fri, 2 Oct 2020 01:11:00 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxWUBleENbVNobhV4PqyqYpgrwDi+r9HQKEO2VXjxtnJsl8UgqC/l1deF0M29FbxzPX3eLO
X-Received: by 2002:a25:8182:: with SMTP id p2mr1243733ybk.474.1601626259904;
        Fri, 02 Oct 2020 01:10:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1601626259; cv=none;
        d=google.com; s=arc-20160816;
        b=hgyJ1jmctitJOXEjZATtF9LdCgpnO7o3EhJ4HPNPgWUbuVbBjLpG0Ihm5LX60Aw9S8
         2T7qVEG5CVdJ9ImwJoIcWpG7BvJ6P8JxRMHBQ130pXduMTPiHmTz/ILyA/oMwY+idCBw
         nmNZmYuamcCniaDb8vMfipW5gNGO93C3tpmUqN/ezbDBP4qoPG+uKDI/DTQrmLYEN2ve
         VBbN5UvxTRmkAwKd3jjrYicOAOhkBBvmA/RpZCf/UlfSqTcL73ZHt8tWXPswfLFhWsvf
         1pcncusb45IoAOt7mS+nbuc6Pt+h/9WbGYz5XlhMhtnAMkVqeTKvjFTGAF02g/WxR6tA
         Hzww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from:dkim-signature;
        bh=T2KAyG9+GcnWb+hQJRM2BaLdbK3udo5BOAO1tzVT6Qg=;
        b=lgjFpuE8363jaQ5YATVOWcwgsNvfw5izAGqiPz1WVV28kAOFazuluw/qWekKljfqwi
         8JL18WjrjJA/ezauY0tFbLyZ4qlH1j+lT0X0LWAVsmbWDQ7MCw73vut8N9Gy+gB/GF0U
         EijG0+vMADJEnl6JPVIM7YzB1gB9ze+gvrXLp6LbibikQN7qEAb8OwBKL85rP5R0zymK
         jDarS6m3ixReTJ3UVdQdPhp8WnvVozzqlOf17OJDIqJvpeVwhu6ciqT2ISfwWSc2lwtX
         LZJPikfO51ldGMGq/MZ/CY7Cbdo4BwYJRAL8z/a/cIDPyGUFSCv2xYDo1Ovg8hz2xrBB
         7Mtg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b="PNzO/eOG";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f7si1112462ybj.493.2020.10.02.01.10.59
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 02 Oct 2020 01:10:59 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b="PNzO/eOG";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Received: from localhost ([::1]:49908 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kOG9b-0003CQ-C2
	for alex.bennee@linaro.org; Fri, 02 Oct 2020 04:10:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36124)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kOG8M-0002LG-9I; Fri, 02 Oct 2020 04:09:42 -0400
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442]:46741)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kOG8K-0008HQ-S3; Fri, 02 Oct 2020 04:09:42 -0400
Received: by mail-wr1-x442.google.com with SMTP id o5so714698wrn.13;
 Fri, 02 Oct 2020 01:09:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=T2KAyG9+GcnWb+hQJRM2BaLdbK3udo5BOAO1tzVT6Qg=;
 b=PNzO/eOGDc7X3YLvqMbuE/63cB5ZTHcUJXofMZ9/m2QgSUT1VNQZDbMQxvW2hRapkW
 FOB42j/7MsC8q4AUWOyk0LXjBL3kAqshH6a1lviDCkDAaOSwrAe7rL3LwXoCUkIRbCQr
 jks3ZuKYu1+ASEAKOmJ692WNcLhWHOWxfnKvKpIgYDViSJucKyX/HU9thN/cpSS8uKep
 bOYO21tUyb+T2hd89Eb+P1y4gBBtXOafMMfuqhzQLl2b3mnbCL54CpCs6Qsy0s7Km30m
 pDyNmZdS2/cCeTf0FwnxZmub189Oe+K87D2z0pyTwZy+SDcPw+Rp/pRWKueQQmC+SWGh
 s7kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=T2KAyG9+GcnWb+hQJRM2BaLdbK3udo5BOAO1tzVT6Qg=;
 b=FxsYhc5LX1D8isyQfBc8haQVrE1WNkfSnuR7csFd6c9joYTWjIxKbkrOFHZxFroMRq
 a4aPgDl920bHK7L8H+YFcj90nAA5iw5z6GVWX+0S7MQtscEVcOHeHvEsdwfTq3eW+im9
 GpzNbBKN5dUAt6ElitcmWR75nUswdxeXAUm9NTjqy3syUAKifTL2niM+CMwSwGUv8wLt
 uSVXRqKWYB57LilPd22kxhsWUEWhLJSAyJrkxUEYvoWqyC21Zv5WZYs7DcfWAeYV8fIN
 7EqWkmgtPFmVm4+qrUSOolzuouXneIU/kAMOT3YuB8AA6jQtuyxtYlB6nn4cVrkUjQdI
 PibA==
X-Gm-Message-State: AOAM530Mk7Mu84CKH0QaB7KuqUHgwrQ9xVhOZsId82vom/weY2UP8Dzx
 XiHFzh4X394IJit3O2cxRtZeB+QPyvg=
X-Received: by 2002:adf:ef0a:: with SMTP id e10mr1554020wro.362.1601626178249; 
 Fri, 02 Oct 2020 01:09:38 -0700 (PDT)
Received: from localhost.localdomain (74.red-83-53-161.dynamicip.rima-tde.net.
 [83.53.161.74])
 by smtp.gmail.com with ESMTPSA id t203sm838508wmg.43.2020.10.02.01.09.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 Oct 2020 01:09:37 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH] hw/arm/fsl-imx25: Fix a typo
Date: Fri,  2 Oct 2020 10:09:35 +0200
Message-Id: <20201002080935.1660005-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::442;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x442.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.001,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: qemu-trivial@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Jean-Christophe Dubois <jcd@tribudubois.net>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Obp/+iInuh3i

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 include/hw/arm/fsl-imx25.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/hw/arm/fsl-imx25.h b/include/hw/arm/fsl-imx25.h
index 971f35dd16..c1603b2ac2 100644
--- a/include/hw/arm/fsl-imx25.h
+++ b/include/hw/arm/fsl-imx25.h
@@ -179,7 +179,7 @@ struct FslIMX25State {
  * 0xBB00_0000 0xBB00_0FFF 4 Kbytes     NAND flash main area buffer
  * 0xBB00_1000 0xBB00_11FF 512 B        NAND flash spare area buffer
  * 0xBB00_1200 0xBB00_1DFF 3 Kbytes     Reserved
- * 0xBB00_1E00 0xBB00_1FFF 512 B        NAND flash control regisers
+ * 0xBB00_1E00 0xBB00_1FFF 512 B        NAND flash control registers
  * 0xBB01_2000 0xBFFF_FFFF 96 Mbytes (minus 8 Kbytes) Reserved
  * 0xC000_0000 0xFFFF_FFFF 1024 Mbytes  Reserved
  */
-- 
2.26.2

