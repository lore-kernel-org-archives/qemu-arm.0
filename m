Received: by 2002:a19:ee0a:0:0:0:0:0 with SMTP id g10csp1418721lfb;
        Fri, 20 Nov 2020 07:52:02 -0800 (PST)
X-Google-Smtp-Source: ABdhPJx/FG1XgizwhkFAMjeg7zO82bWhBrVv52kDBd2LqCjdSCAlIeXti4l+xLigbpQ/1TT/0aXv
X-Received: by 2002:a25:bb81:: with SMTP id y1mr26445629ybg.435.1605887521990;
        Fri, 20 Nov 2020 07:52:01 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1605887521; cv=none;
        d=google.com; s=arc-20160816;
        b=0nW3yc5HGjIl/ENyRuJUK74ZBBbtNA3vr8hIboTSCOxHDdDDjrPAUz7UDSlFCsMSoT
         oAlAM1HalYIadhe9FPyGVxK17wr1Jkl4QLWEyumfpPQgX2hF/o1/Gn9944OVUOIUxmZk
         gUPQyWh3Ep2Hrb/9wQAuDWESCfsXDPTI4nexuRekYQ5e607PVuasMcg1b+jwR7U8iwTI
         OcjJDF/js0J4EQa179RE60fiDxxGN42vNyakSpZyQ1wZi/dO4u1kFhSpxRrL+Ik0ccs5
         arU2+Emuo18oLad8u2VtCgS+UWoZTdEXEFS1qJvsm7sZ7A1Ofrr9uyvAwDdU5qM4FsF6
         xSPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=8La+Nxl8yL0kTvGXeV9gvffc31yzw/54KM6x9W6sJEs=;
        b=iSBsWMnWKNLtQkXUNSup9rFrMHLDFQo/t1BLXpHp56kg5Lnxh5DlQMCE5mSwhaeqoA
         JAObBnCWXRLvRPry3iTfkHjShBgaqU+DIH/X3ki0S7uTOCrGbQHTsn0dGVnvxLw6s34a
         vFAKSYQ8jjb8IN9wAXK31dOvVytEsXqUtE6Er9qSmK5uLLt/LuxccPD2aL364CIHYjS/
         S7TSINJuVc58hDBWftIyy58GjH8gwPK46lZyjT32DlCBCMdBHLWWveS98jroN0TCA3Po
         7z4vd1A1U4zHz3PeS7/Y0s1lX7zFnlgFrZyHmXujbRBsuVCFifUVRGoMk9RkiBIOwZus
         oseA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=f1gf+8u8;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v190si865764ybc.340.2020.11.20.07.52.01
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 20 Nov 2020 07:52:01 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=f1gf+8u8;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Received: from localhost ([::1]:33686 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kg8hd-00052b-CP
	for alex.bennee@linaro.org; Fri, 20 Nov 2020 10:52:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51918)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kg8c4-0006id-0F; Fri, 20 Nov 2020 10:46:16 -0500
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433]:41892)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kg8c2-0002tr-KS; Fri, 20 Nov 2020 10:46:15 -0500
Received: by mail-wr1-x433.google.com with SMTP id 23so10465034wrc.8;
 Fri, 20 Nov 2020 07:46:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=8La+Nxl8yL0kTvGXeV9gvffc31yzw/54KM6x9W6sJEs=;
 b=f1gf+8u83jv10510UuOi5QHg/91enT+fn2AwXSvW7JCITmyZCxKRkOknvPb4CpYjqX
 kw+p8kBz8dfxjHHcnf7AngEIIfI5VkFu8q51orsN0lvcbYwO4LU81dz3gysRJHLeTBC7
 ipAVU6x4LJe0TB3LXlG+RrUjWzT2uUBxap2VMd6ohJZjf5o/z0zWlJ3HB70h28YJEAk8
 qVXtNC8cOsGnOmYyYvIhd0az5Zca9MWKyVwR3TJXp44CtTiyMDI+sW1h8+6TTGnaWrfB
 IoZpL2fLXtXa2eWd7dGqsZzH3iETBsAjF26b5H0vHA8B/FQFr40t2mJLTGguQ9+Y+MLM
 KoUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=8La+Nxl8yL0kTvGXeV9gvffc31yzw/54KM6x9W6sJEs=;
 b=TxcB6spMm+OgHcywhSf2sJGT3der63p49HthniPw5ogKQl5HyN0024o9W88Zvi3fkN
 w/+u2R1krvGQBYY23SRFz4jswBl3VIi7ajx4RrEvbyVUMV9xvKsq5348ijg+OWDaJzAf
 +P2Weu0BQpev9eK5WqAzKkHxjewthc+TJTXLaf0DLpaNVVXSmD1niO7T/uh0PPqKEu3U
 xXkG2KPy8D1XOPkalRqa39oUP2374e7vhKpZMnxkTZdtIjIk5DlXdKDAMq5ya3Lfq84b
 7gK14sNf7QNnIliY5EEryqv03FaDJBdo0XeQ3sYzOIs1nHHVxh9iymDXyCdeVMxWjV7I
 woTQ==
X-Gm-Message-State: AOAM531tZko9G23WLzBK6IihbM5SPe7CGWYO6DNN86GbpLNp5EERfdIv
 oZHolvp1MLpPNn7124UtYkDVlEZvkQI=
X-Received: by 2002:a5d:438f:: with SMTP id i15mr16811298wrq.121.1605887172736; 
 Fri, 20 Nov 2020 07:46:12 -0800 (PST)
Received: from x1w.redhat.com (234.red-83-42-66.dynamicip.rima-tde.net.
 [83.42.66.234])
 by smtp.gmail.com with ESMTPSA id u7sm5044090wmb.20.2020.11.20.07.46.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Nov 2020 07:46:12 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH-for-5.2 5/6] MAINTAINERS: Cover system/arm/sbsa.rst with
 SBSA-REF machine
Date: Fri, 20 Nov 2020 16:45:44 +0100
Message-Id: <20201120154545.2504625-6-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201120154545.2504625-1-f4bug@amsat.org>
References: <20201120154545.2504625-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x433.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Leif Lindholm <leif@nuviainc.com>, qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Radoslaw Biernacki <rad@semihalf.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: pbYS2xPI1SUX

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
Cc: Radoslaw Biernacki <rad@semihalf.com>
Cc: Leif Lindholm <leif@nuviainc.com>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 311a55317ce..73020648a64 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -858,6 +858,7 @@ R: Leif Lindholm <leif@nuviainc.com>
 L: qemu-arm@nongnu.org
 S: Maintained
 F: hw/arm/sbsa-ref.c
+F: docs/system/arm/sbsa.rst
 
 Sharp SL-5500 (Collie) PDA
 M: Peter Maydell <peter.maydell@linaro.org>
-- 
2.26.2

