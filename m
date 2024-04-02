Received: by 2002:a17:906:bc5b:b0:a47:c39e:cbe with SMTP id s27csp3990907ejv;
        Tue, 2 Apr 2024 07:28:08 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWTc9LoCypBr3fU8WVh2DpAwmUYCdc2lAwj5H8qO2vsBdXfeTj6NmTlwXoz9qyxbVy6YYYTw3bZP0gW8z9cmKnvgOo6IhmU
X-Google-Smtp-Source: AGHT+IF68baiGMAbG9EgcnzAtxZx/cG22mbvszNeZWuMpl917DUPmj5tb4eOFJrn5Te+NgKn1k0P
X-Received: by 2002:ac8:5852:0:b0:434:3c25:93c3 with SMTP id h18-20020ac85852000000b004343c2593c3mr1027012qth.38.1712068067882;
        Tue, 02 Apr 2024 07:27:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1712068067; cv=none;
        d=google.com; s=arc-20160816;
        b=J+FIZgvS2y98mX9eyJq34HLFhFzEZmR9OywqYkeV3gxFL3+paKgx/uzENIZY3vnZ+f
         e5whVlsBzzhJqV5UKJA38XV/KVu2WD69cJSGTdG8zp2iejdsVIdFUIQjwCZXfMdlc2j9
         lTK+70szeF6CUGFt5LDIkgma8YKCzQ+baLLtPzQm3H/hPX0mukT33/HgiofS3/VCKnYc
         UhRbHIkEzjDKzIZpbZ4PHJCUBraaJzFzQ4HLFnna7ZKUDxNgzmWOAGIm/MHBp5QYRqzu
         69uYrIiDTfW4kpoxoWSJyjEytPwG4PFWPZVo67xiRAD8/g2rvOhM5M3ijBy59Fo0zLVM
         4K2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=xfL4IVrnZ8RPkVaq+CH9l8CB4XL0LMP837JbxMa4yMw=;
        fh=u1GX2advRq5dcqeGuoI2LKi7ThAXTM/KrGopOW21Dyg=;
        b=bWeERgnmOtYqR1IC9Kns8/NrYoNK2yCznCW0ju8OPnTBpyUTTds5jOQN+utOte2ksz
         CRmXJaA58Nvj3VZTEN4GM6VQ1E75Qsy49iaY3plUnmqOnT399ZXEo0R/viVhKp3TNpGB
         o+4occBfpdgeVBTwfRUa0QE3fAKFQKr57xz4g+4YkyLhCXCTZh82IKxjSvTsakusUPZf
         9kC2CBYhrbKeKYZpNfyFKoBJXiIuVxJVKiI3wDuD3MdnheEg8WTHYLTHUTH7hctkMSKR
         q9gkVcMCYbEkPNMcFDJd4p3jh796KRbMnBvmkw8D4IAnVSwiN612GtNBwttBw3M0eG9x
         xYzQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=tt5YIe7O;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id hd17-20020a05622a299100b00432c4128243si8733649qtb.745.2024.04.02.07.27.47
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 02 Apr 2024 07:27:47 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=tt5YIe7O;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rrf4w-0001L1-Rw; Tue, 02 Apr 2024 10:25:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rrf4v-0001Gt-9a
 for qemu-arm@nongnu.org; Tue, 02 Apr 2024 10:25:33 -0400
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rrf4r-0008Gu-Ay
 for qemu-arm@nongnu.org; Tue, 02 Apr 2024 10:25:32 -0400
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-4148c6132b4so34608085e9.1
 for <qemu-arm@nongnu.org>; Tue, 02 Apr 2024 07:25:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1712067927; x=1712672727; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xfL4IVrnZ8RPkVaq+CH9l8CB4XL0LMP837JbxMa4yMw=;
 b=tt5YIe7O5QhcEoB0HhnIUL3Zbj90ghdC3I278gCLtvlQMEUGovQBI+prKUBE7KVbrS
 uDe2SC3WWvvhLANdXP0qyVSfKssI2HXFi5YJa6xPFc4MgAOJDq1hR1+n+PU8GoCDrQAb
 13C7HqlJ1ydtjRlux+g1h7QyR2OWsQZVOlNeUEa3i74TMLwYmGkFDgSok9UxqAuWoTcl
 zylSZELVxNeNEHKdclGLGk7V12hWppc2mPGMcrCHDpvG6gQzFa83sGUsu/C/iU2081Tf
 pZwqB+3wEcCll+qSgCdLNn1RurR5bg+0cWC3Hpo6tDMZ4h4GNXrVbsZMkLo4NldscqCS
 REyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712067927; x=1712672727;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=xfL4IVrnZ8RPkVaq+CH9l8CB4XL0LMP837JbxMa4yMw=;
 b=u3y4dMytxo+YgP5BbXEB1leqjKb1Meb576BfZISrCAG/LBy3iYh5bJJ3VnKPpVz89G
 AXny0QPmowPyWUyRzVNa7xljIQB7nN3vraVVnQti41B6aF4yee7LfAbuRr03WBm2/7nj
 3B2qqnbR0sMqSHQBPpKOCJMTrQ9hE4gh0bJDQFN2NcUZYEy2oVX4zoNPJBXquX6n5+uy
 exbJVYpGDET7nwi1e3YPndrgKe1LFv/BbWYWqYVjQb5CkmzUvmW/60JyHNG8NWXLNz4L
 rFaUXSnvMr+4r4CSNc1KuMzpaVHcjUnj72ycPgmTSGSVPT1LGeQkb2+IRPEZ/xaQS/jU
 pmHg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXnndU0p7YDLu2/QEI30eXfcDUBJZly0uTfGXaxotwsA7DdN2Nc+xRoAmS1jgQyd0+S8LNWSdW1EPAxEMnSUGEzvTFD
X-Gm-Message-State: AOJu0YzCVlZf8JRr1Msb3KJv70J4KTV9/lcztgS4XqGfaoBCUhuOybYi
 es0l241g2awfh253VCQ9KQobyDiNuZ7tfpBlf7TRzE5FtB/Vt48lEMZuvLAFa5M=
X-Received: by 2002:a05:600c:4592:b0:415:611c:aa05 with SMTP id
 r18-20020a05600c459200b00415611caa05mr5674235wmo.18.1712067927761; 
 Tue, 02 Apr 2024 07:25:27 -0700 (PDT)
Received: from m1x-phil.lan ([176.187.202.91])
 by smtp.gmail.com with ESMTPSA id
 b3-20020a05600c4e0300b004156da408b1sm3916554wmq.22.2024.04.02.07.25.26
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 02 Apr 2024 07:25:27 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, qemu-block@nongnu.org, qemu-arm@nongnu.org,
 Zhao Liu <zhao1.liu@intel.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PULL 08/15] MAINTAINERS: Fix error-report.c entry
Date: Tue,  2 Apr 2024 16:24:23 +0200
Message-ID: <20240402142431.70700-9-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240402142431.70700-1-philmd@linaro.org>
References: <20240402142431.70700-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: hsyABKEzhm/a

From: Zhao Liu <zhao1.liu@intel.com>

The commit 15002f60f792 ("util: rename qemu-error.c to match its header
name") renamed util/qemu-error.c to util/error-report.c but missed to
change the corresponding entry.

To avoid get_maintainer.pl failing, update the error-report.c entry.

Fixes: 15002f60f7 ("util: rename qemu-error.c to match its header name")
Signed-off-by: Zhao Liu <zhao1.liu@intel.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Message-ID: <20240327115539.3860270-1-zhao1.liu@linux.intel.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 MAINTAINERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index a07af6b9d4..197a06b42f 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3013,7 +3013,7 @@ F: include/qapi/error.h
 F: include/qemu/error-report.h
 F: qapi/error.json
 F: util/error.c
-F: util/qemu-error.c
+F: util/error-report.c
 F: scripts/coccinelle/err-bad-newline.cocci
 F: scripts/coccinelle/error-use-after-free.cocci
 F: scripts/coccinelle/error_propagate_null.cocci
-- 
2.41.0

