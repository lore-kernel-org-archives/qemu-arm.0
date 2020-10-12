Received: by 2002:a19:6b17:0:0:0:0:0 with SMTP id d23csp1152003lfa;
        Mon, 12 Oct 2020 08:40:18 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzaErT7UuXqORpqV3w2w3GnU8kWwLMUnX76yqn0SrRMbJAm+KlhllAjX5j2hEua5EeKSeUb
X-Received: by 2002:a25:2c0a:: with SMTP id s10mr11230487ybs.217.1602517218065;
        Mon, 12 Oct 2020 08:40:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1602517218; cv=none;
        d=google.com; s=arc-20160816;
        b=UoyNVbZhM7O1pmgcR0KLbMYL4V/m5KNU1tj4hHgcb1fH2qYm8NZMcDXl4+M87zW9L7
         7xcCO3yB9fJZXYtS9MzCGU2OQ9uCnDw0hY8pYSWcg2RvyyzhqDB/eV1HWm85LaqAODzK
         VlzeyMiK618DpytlXinqHTcqGqE8GrYSy45Yo3S55Ih4pSDOr5I22h0XpBlPi2DRSn12
         yVDYVfB/mn99QMjyl3csqbDhWJQw1MFteY/T0hc9AZu9EyWCHeXL8TLLX3F4bMD/0789
         1cHC9grOBtuhST3Z77IcYr/Z8lv7ciX9PepjXPi2UksWq6Ru9a/lgQjqTADl+namalhN
         pV2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=6I9SMKjr6PmWwGXVMVs+FgMWnXt/xrUHEYtD8jIqzQE=;
        b=L89mMVLu2WUyfDgx4iHrC1wm+f79rlZkHxez8n0OAnawVe5HRk018wU/YrmAecmbzf
         mG+x+OUpte3rksh/0J3ugasvjmyF1FnPyQTk+Hlw6/0f2ok1SUAxHwaGogHtcaHqdWJr
         HsjOOmyzLnsiRcNFYwd2h1ALJSioCosbb4FlKmXU8gPTHP00/G6WOdbNqHS62TZZt+Y8
         OtmqFApJq0SS2ZfkUox8hKuqUbAnBjolFQUJeNIy1OYvqfLwjoxV0gOCBNNf9CMPJ1+3
         MlVsh86GLvow50B1kdCSgI2+/qNLAQPf2jRY2QyyR1kG65Lnzpp+cPsi3SbiT4GLpeNS
         5OzQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=tPyAQW57;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s201si1468206ybc.125.2020.10.12.08.40.17
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 12 Oct 2020 08:40:18 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=tPyAQW57;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:47652 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kRzvt-0005ua-DK
	for alex.bennee@linaro.org; Mon, 12 Oct 2020 11:40:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56578)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kRzqC-0006ed-7D
 for qemu-arm@nongnu.org; Mon, 12 Oct 2020 11:34:24 -0400
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443]:34526)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kRzqA-0007Go-DG
 for qemu-arm@nongnu.org; Mon, 12 Oct 2020 11:34:23 -0400
Received: by mail-wr1-x443.google.com with SMTP id i1so13561613wro.1
 for <qemu-arm@nongnu.org>; Mon, 12 Oct 2020 08:34:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=6I9SMKjr6PmWwGXVMVs+FgMWnXt/xrUHEYtD8jIqzQE=;
 b=tPyAQW57KsDRbOr93Mg6m8QsfI33jkUUv749yVbo4mOsNQZk2Qznr1ltL3peF3Ntl5
 Xhmr/+0qAovF/bCSxj8O3xW4+93hCaIr9EMucxd5Qm5zyqsTPXO0tyq19cR/nZE4d88/
 YL7yxQbg2lh3GDU6RTzu4dTQGgX7Y3kYYi878YTrO0DzRDcUjm6VAsdkyth1nX7hgqzp
 hWooGB4VPq3Mi7/+P4ljKrFxWL4PiNDk2ls11WBXd9s7C69b2XaHnAiAApUXV3kpj4DK
 CYnqfqCwgfrQ50USmaIYB+mAOEf1KpV2xMtHznTlwJ8u7eXGfsEJVUfFAi8x9PyCQo2m
 000A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=6I9SMKjr6PmWwGXVMVs+FgMWnXt/xrUHEYtD8jIqzQE=;
 b=LG8mReXjOA0Nr+GdLOHrIsSyjcf2yUk5hBrm6wgiLm1SzMakISAj8Sm/Hr2tSaMMqf
 dnWkHWeGhT9ZQmagziOUc2IWCI46t619o/tp7nLypzh8cQCwd08PFcD9KkAcS0bS/UKD
 qSsoIqlxuEIaqr1OOgmC8cShQhoBg2hy7uhuBQlPn83Wr+VGKF0BN778Vw3DzAWhHCpB
 bVlMbtawHHBHAWTFYA7/0OiqU53zW0kSAbybvSNrg24DEnWc5a29jZKNHecmfnomE1mX
 PlF3hjzHlPXzMAtnqC45BQpqgVhu9bUlv9ZVXvktIKs81GAAZe1Rm9laBwbRvK+Eyh51
 Y1cg==
X-Gm-Message-State: AOAM5324F1rU8kRSyiusnQmARGU//bFoMczPZCdBn/6WKi3c0LCvPDjA
 Zj3Kw0zb/2NzEdz5KzbmSLSRiZMYzLEHqm4F
X-Received: by 2002:adf:f043:: with SMTP id t3mr18402943wro.234.1602516860825; 
 Mon, 12 Oct 2020 08:34:20 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id y10sm19675284wrq.73.2020.10.12.08.34.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Oct 2020 08:34:20 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH for-5.1] docs/system/arm/virt: Document mte machine option
Date: Mon, 12 Oct 2020 16:33:32 +0100
Message-Id: <20201012153408.9747-10-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201012153408.9747-1-peter.maydell@linaro.org>
References: <20201012153408.9747-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::443;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x443.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Richard Henderson <richard.henderson@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Y+Fj6/HGpfJc

Commit 6a0b7505f1fd6769c which added documentation of the virt board
crossed in the post with commit 6f4e1405b91da0d0 which added a new
'mte' machine option. Update the docs to include the new option.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 docs/system/arm/virt.rst | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/docs/system/arm/virt.rst b/docs/system/arm/virt.rst
index 6621ab7205d..32dc5eb22ee 100644
--- a/docs/system/arm/virt.rst
+++ b/docs/system/arm/virt.rst
@@ -79,6 +79,10 @@ virtualization
   Set ``on``/``off`` to enable/disable emulating a guest CPU which implements the
   Arm Virtualization Extensions. The default is ``off``.
 
+mte
+  Set ``on``/``off`` to enable/disable emulating a guest CPU which implements the
+  Arm Memory Tagging Extensions. The default is ``off``.
+
 highmem
   Set ``on``/``off`` to enable/disable placing devices and RAM in physical
   address space above 32 bits. The default is ``on`` for machine types
-- 
2.20.1

