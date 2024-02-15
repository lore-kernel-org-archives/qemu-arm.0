Received: by 2002:a17:906:d9da:b0:a3d:1c09:7d3d with SMTP id qk26csp739287ejb;
        Thu, 15 Feb 2024 10:04:08 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCVxY5GYXh/J7j/yhaF2KcToPAqJYqrHcuOaaDe/ioP/98K8HAqnTlx19dO3ifxIDColkVJAm91yW/yZTNy+xtGhyQge/XTI
X-Google-Smtp-Source: AGHT+IGuWgE/vQbSnHD1+2y7YKF7+i35YwoHRwUY75bGpEVOPsQV/gg32RxGoSB3qSKNa5wM0+gZ
X-Received: by 2002:a05:6830:1bf6:b0:6e2:f14c:ffdd with SMTP id k22-20020a0568301bf600b006e2f14cffddmr2586316otb.36.1708020248684;
        Thu, 15 Feb 2024 10:04:08 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1708020248; cv=none;
        d=google.com; s=arc-20160816;
        b=X+o1UI1HKRKVebn2Rnoc947OYx02u1PwZqArwlmD42b1ZIAP/KUU0GFJqa3f5dfnpM
         JUfeqagTOfR0Cy/E7GHp3yq70SSwEPHGKK1nf4tjzN0+RwpejkoYUg1mLf+6gEZg3779
         cBMsjWD5Q2bLD/sDBxv5uHPUstX5z0114J1SxwCIsS9nD8PDrJdtpOwImkYoRpJh8mFa
         fx52b3SvFERQ2mY9dMcw4cSpxjC7CgkPAz4VNnBmoy0ZdxVm18TSOBrNThSgvJCQnxUe
         j5vrLbjsXDU2IuU8DNmrasTp1TeXIBg23C2AOF+EF1PWq1tulWS1jX4DK+IX8RjPxGtw
         taNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=WEJdbRYZWg5QsSQgBLhE630AfThAxul3xJqfLIQC7T0=;
        fh=DaNyg/VAQn4L19/AGDUal5lIiUVMR8n+wSbtZ64W5jk=;
        b=ywiC0N9sQjk1GQ0SR2fCebWNSKw0zvb3LEWl6NUYQ94ssnWZG83jkZE7abId9/3AE4
         419iWSMkn1MVrAxLqieC4txJ1ofu7u9keiUeY56SV/KIGIGd86byvqNmxu1fWQGPZa5y
         cq2FZospNilG9+cxMWc0RvRLU11pyKVtySiTfQb32VvEr+0Mtuvr2dSRLozcIgs3jfXd
         GHmZe9YGvJtx9422GzFx7EC2PuAbeLTTYbc9ZzTd7b4KUNkAt5K0UglUqrh4ro3xZWAe
         XhDGHKPX6MxQ6/ZQxmVS6kRyeC3//df99U2DlRna6zBLo+GXdQ1qvCIIO4+SdD5pt+Qd
         2o4g==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=HIzhCUfM;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c10-20020a0561023c8a00b0046d1d4ca8f9si440103vsv.114.2024.02.15.10.04.08
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 15 Feb 2024 10:04:08 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=HIzhCUfM;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1rag5L-0001vC-Pk; Thu, 15 Feb 2024 13:03:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rag4m-0008Vr-4a
 for qemu-devel@nongnu.org; Thu, 15 Feb 2024 13:03:17 -0500
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rag4c-00031Z-S8
 for qemu-devel@nongnu.org; Thu, 15 Feb 2024 13:03:08 -0500
Received: by mail-ej1-x636.google.com with SMTP id
 a640c23a62f3a-a3d159220c7so149194566b.2
 for <qemu-devel@nongnu.org>; Thu, 15 Feb 2024 10:03:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1708020180; x=1708624980; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=WEJdbRYZWg5QsSQgBLhE630AfThAxul3xJqfLIQC7T0=;
 b=HIzhCUfMFArrAr7NvD/9RyU6GhxskXXZoCtFNqoHVtaT6XXrMGsK3mDO0ekDRDM60j
 XENZGajeUlsM3VCkdCmPdP3QhQo0ytlSK2QgRsjTdDqphr6QXgxooERi6F2lHULnzz3t
 1KbBnaY9966R8nIWs82Delc2n2dq/J+PSdS87bMOiHYnf/qC1s7+j0f3/shCg6ovWwkN
 b4t/9xgs4vMK7OecEM/EgxfiDZ4ItCMWOUFn86rM7GaSLVDySUSrEfZZybBsPmoja1zn
 7rb2SU1mSazmWwnzsxPQ5LjBSogmSmv2RiycOukpxHSK0oQDgxcjHaPINWyVX9g5U1pr
 HMbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708020180; x=1708624980;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=WEJdbRYZWg5QsSQgBLhE630AfThAxul3xJqfLIQC7T0=;
 b=CJkCT8B1NPuAz7s0MmMMdzee0LCaCW9zK2Gb2XnEFBQYS6okCPVebWp83KMZFYm0U5
 liiVpY0SSM4Kq1NSU3XdhSrP4N10koRRM2dRBMvtyS4ouNxA0WQ5xs7WnyS04YFo3JlQ
 rV9kXWKQk862j1aSjyqcOwCv9w6H4dem4CAX7NrbmVTF+U4fOm7fe55yxsvqsmPmrc2x
 WENoid2d3WYPMHn+fvrPZmjXWgejUKqxBKp+KX6WxfABhJ491LBRNLH85ujEO1Q9otC8
 Obigv38CHQsD220O7zt1Jr+lI5vkM/ZY6LWOFn8HMMRPCDE+lqkWMY5b8hSYdFtoh+jL
 vMrw==
X-Gm-Message-State: AOJu0Yyapzazj+6Rh9FDzbx/IRuCp/BB+RR9EbWv5Wmr/2/WBtH7KuRH
 ulolyZihOhy2Ma8245adDxYIbGo3vLc8QwQDJ4Xtne681zuVlWicp0JqREeA2jtcB6fztJMpTC4
 SyQ4=
X-Received: by 2002:a17:906:3c18:b0:a3c:ea61:9359 with SMTP id
 h24-20020a1709063c1800b00a3cea619359mr1621901ejg.77.1708020179824; 
 Thu, 15 Feb 2024 10:02:59 -0800 (PST)
Received: from m1x-phil.lan ([176.187.193.50])
 by smtp.gmail.com with ESMTPSA id
 lj8-20020a170907188800b00a3dbc39a376sm190751ejc.52.2024.02.15.10.02.58
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 15 Feb 2024 10:02:59 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, qemu-arm@nongnu.org, qemu-block@nongnu.org,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PULL 45/56] MAINTAINERS: Add myself as reviewer for TCG Plugins
Date: Thu, 15 Feb 2024 18:57:39 +0100
Message-ID: <20240215175752.82828-46-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240215175752.82828-1-philmd@linaro.org>
References: <20240215175752.82828-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::636;
 envelope-from=philmd@linaro.org; helo=mail-ej1-x636.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01,
 T_SPF_TEMPERROR=0.01 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
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
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: JucmL020Yox5

From: Pierrick Bouvier <pierrick.bouvier@linaro.org>

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
Message-ID: <20240118032400.3762658-14-pierrick.bouvier@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 0ab73b265a..6c19ea41d1 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3706,6 +3706,7 @@ TCG Plugins
 M: Alex Bennée <alex.bennee@linaro.org>
 R: Alexandre Iooss <erdnaxe@crans.org>
 R: Mahmoud Mandour <ma.mandourr@gmail.com>
+R: Pierrick Bouvier <pierrick.bouvier@linaro.org>
 S: Maintained
 F: docs/devel/tcg-plugins.rst
 F: plugins/
-- 
2.41.0

