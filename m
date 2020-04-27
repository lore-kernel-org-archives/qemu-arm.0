Received: by 2002:ac2:52b1:0:0:0:0:0 with SMTP id r17csp4439766lfm;
        Mon, 27 Apr 2020 11:18:50 -0700 (PDT)
X-Google-Smtp-Source: APiQypINOGJx4meYmVJ3UYvNjddhBpWHkncuctv3OsEFHEs1ArPSrF2l71/pIc3KwhCK73a9je4y
X-Received: by 2002:a05:620a:1202:: with SMTP id u2mr24203481qkj.285.1588011530094;
        Mon, 27 Apr 2020 11:18:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1588011530; cv=none;
        d=google.com; s=arc-20160816;
        b=Uuk08Umsekpj9hnCCxJp3iy0maaMlxdLVlz5BSbl2OuaU7Y+LIlhBIjizIEg1ojgS+
         quW8lfcCalrv7SXua0Wk+5nht8Dlz0JZN9D0f7v94KHp0/+4RUjveGa2s4yjOdtZyHd+
         I8wx7u6WT4ftVCKFKCquDXg2WoDe6ZEACBQoHwhbfYvhx29F0YMwwcAlZIPXGfYvEhG+
         Qf7w4iMAdN/lr7JqHvOr+ohFgGqWHVGHaU6Id1pLjO2AMUlM7Bm5m8Vk5BvoTnFrj6cs
         aK+XrFB66J6yQSEmhchAwmfzYbaJ6I9SJR65U7VXzgl1QhpIWHVYKbY5R84XwtZ1hrae
         kiWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=imA9fwmW65enK4C7DtcxVyFgyC1JiD9jIZy37bLdKzA=;
        b=jwSQ+kYHXaERZ1iCaqL/lTkLghUx7sLlUMa28dg9OAOlDU8U4nA/rWGl20eKZ2Uu1w
         +1YE/Q8c3y1FLYWx4fBffYM0EaI1nMBphY8sCXPsjZ3mHfRtJMiI2dxRXo8jxxiwBdOZ
         1USlqGUudiLHsv+BBj+CuLh5sgjrr73pi5mDECx4dhAe0CT4aFgRO6FnwSK23XbF9yg+
         ic/aAgmeySADk6yeBa3w6ZZeQrDNp9dalDZ7FeelSR75llUoGd8+NzWiM9Tz2Bb2XnO2
         uSk2NVFsvNdzkwgUsKNixt/r7EYpQonJDtwWoFHv8I3Xu8XrrKzKZYo7JFmCh6Hd5D/J
         BRUw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=LutW+6cj;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id r14si9075725qvw.130.2020.04.27.11.18.49
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 27 Apr 2020 11:18:50 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=LutW+6cj;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:57334 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jT8LB-0002hq-BI
	for alex.bennee@linaro.org; Mon, 27 Apr 2020 14:18:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34874)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <edgar.iglesias@gmail.com>) id 1jT8JP-0000C9-7z
 for qemu-devel@nongnu.org; Mon, 27 Apr 2020 14:17:00 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.90_1)
 (envelope-from <edgar.iglesias@gmail.com>) id 1jT8JO-0005H5-RU
 for qemu-devel@nongnu.org; Mon, 27 Apr 2020 14:16:59 -0400
Received: from mail-lf1-x141.google.com ([2a00:1450:4864:20::141]:34730)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <edgar.iglesias@gmail.com>)
 id 1jT8JK-0005Fh-Dv; Mon, 27 Apr 2020 14:16:58 -0400
Received: by mail-lf1-x141.google.com with SMTP id x23so14676725lfq.1;
 Mon, 27 Apr 2020 11:16:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=imA9fwmW65enK4C7DtcxVyFgyC1JiD9jIZy37bLdKzA=;
 b=LutW+6cjsy6R/z4S3MClvUV8bdb2VRamskbo6Hes6LNk/KIyForn6+rjV2pRtxcApS
 pd3g9OwqyZNCQ5FXEXSsiaTSZEUQqUon3uFhMpbI9TEZHrM9egG2HG949b8dmXBXElfH
 1a8NJVg47hIIkosXelXNJDh9EhVAlaMu5ZWdacM1V1ZDMYSuRzjh15Q/Y38U0ebn/XRm
 WXGjHFgD9kzxFMeL+B3XNP9uq9XOXi4V5hr93Y6trVaiLAZNDo/qSaCNBsTiORZDpXlo
 z6D0qn5VV46dn/rL99S3g1sqmv/uC1Db/f6RAl37dmv74hDnxmb8TEdPQhH0P6H44Q58
 h1fQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=imA9fwmW65enK4C7DtcxVyFgyC1JiD9jIZy37bLdKzA=;
 b=OXpj1l+QkyVgf2rmu0G9UwyutaeF37ZYDTYV1apOYDshfAcc1oujbSiBgllbUBFEfI
 Lz56AWRbKSDv2m5+SekUdwhcGspawgcVzNI9doBGbWlFSGQuCtUlTwWEsYC2KwcR7OMp
 nJ0M3ZU5PFjZXlb8I5mZAMCkv1m4dYwGfoggFjHjckXAwbybSVyQrCjsTaeekjTJPXkj
 ijeh12Opt5rfHKpJnxuH8zhaIGXbFiitEKnBEsUhLp2Nj8UPwB/Xk3ErKb3CrT0lMWCG
 RfcOyyatmtFzl3i3plSEc1J6KoauQS02zMvTIgrSw2nY0KI7AGcEMd9x2bkapRS2Sf83
 1/DQ==
X-Gm-Message-State: AGi0PuYBcLLVlxh/hzf43ItJ+Aqfd+9w8j5iBFiACE4H9cU8barpjp7d
 IxO70DhkDJh5ftGo444IRDkDQ6unoxg=
X-Received: by 2002:ac2:4463:: with SMTP id y3mr99292lfl.62.1588011412001;
 Mon, 27 Apr 2020 11:16:52 -0700 (PDT)
Received: from gmail.com (81-231-232-130-no39.tbcn.telia.com. [81.231.232.130])
 by smtp.gmail.com with ESMTPSA id s7sm12072296lfb.40.2020.04.27.11.16.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Apr 2020 11:16:51 -0700 (PDT)
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v1 01/11] hw/arm: versal: Remove inclusion of
 arm_gicv3_common.h
Date: Mon, 27 Apr 2020 20:16:39 +0200
Message-Id: <20200427181649.26851-2-edgar.iglesias@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200427181649.26851-1-edgar.iglesias@gmail.com>
References: <20200427181649.26851-1-edgar.iglesias@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::141;
 envelope-from=edgar.iglesias@gmail.com; helo=mail-lf1-x141.google.com
X-detected-operating-system: by eggs.gnu.org: Error: [-] PROGRAM ABORT :
 Malformed IPv6 address (bad octet value).
 Location : parse_addr6(), p0f-client.c:67
X-Received-From: 2a00:1450:4864:20::141
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
Cc: figlesia@xilinx.com, peter.maydell@linaro.org, sstabellini@kernel.org,
 edgar.iglesias@xilinx.com, sai.pavan.boddu@xilinx.com,
 frasse.iglesias@gmail.com, alistair@alistair23.me,
 richard.henderson@linaro.org, frederic.konrad@adacore.com, qemu-arm@nongnu.org,
 philmd@redhat.com, luc.michel@greensocs.com
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: B8+UPnUzGCEo

From: "Edgar E. Iglesias" <edgar.iglesias@xilinx.com>

Remove inclusion of arm_gicv3_common.h, this already gets
included via xlnx-versal.h.

Signed-off-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
---
 hw/arm/xlnx-versal.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/hw/arm/xlnx-versal.c b/hw/arm/xlnx-versal.c
index 94460f2343..c73b2fe755 100644
--- a/hw/arm/xlnx-versal.c
+++ b/hw/arm/xlnx-versal.c
@@ -20,7 +20,6 @@
 #include "hw/arm/boot.h"
 #include "kvm_arm.h"
 #include "hw/misc/unimp.h"
-#include "hw/intc/arm_gicv3_common.h"
 #include "hw/arm/xlnx-versal.h"
 #include "hw/char/pl011.h"
 
-- 
2.20.1

