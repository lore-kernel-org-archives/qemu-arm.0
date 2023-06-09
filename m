Received: by 2002:a17:906:fcb7:b0:974:3dd3:6e73 with SMTP id qw23csp289593ejb;
        Fri, 9 Jun 2023 03:49:07 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ7jHESi4ZD0ZxeQGW1tvyegYqD5AX/vPdrgTKCG5t/CYE1XNbbbo7gKlSaQNuH0deDrhcBA
X-Received: by 2002:a05:622a:3cc:b0:3f0:a426:5f29 with SMTP id k12-20020a05622a03cc00b003f0a4265f29mr1233162qtx.11.1686307747763;
        Fri, 09 Jun 2023 03:49:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1686307747; cv=none;
        d=google.com; s=arc-20160816;
        b=sKlnfbfaLbrd8bD9Hr4+wxA0i+DuzMRiHXv15gUvz98pmdRcT5gHdopSGzveMWpXtH
         S9n2WwAQFO4o09+3nYICqBRJ6kjaAWcZALljXX4iVO8GhN7+3rWsTc0rjWOHNDltBpiG
         02HXGVDp0jjWwhtMKAu5T//sh7VZ2Pn5xCZRL8inIRY28F1Js2wrRl6sqDpFQThRFk1y
         FWlpAGL19YHdrf/tDb1TYxirK8bTd13a1QTGWR4areBK2FjrDZaPgiu052QbG2vqmo6t
         L4oNX1/g8NKJ4JXU4RJimHJ6wtAR4339CUgse0pvn0yQU7/sKwmlLdOB4O5FZjzXAu7/
         dWZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=t1gQ05YVuLQqB4KG1j7pOjx2rNDQj4Y5tpKZYfWuMtY=;
        b=FRdidbrGguPDnrNlVjXUsSLAbEHOuqd6f4kG8e8yY1WW0TLSkwlSp0/Xoy/Ufl5fKo
         alIBl1e7RW04Q5j93tlJDQcw3Vu2niGLklwC4LsNNWN3f/cVCmfKrgbUm8ayquqEVkO/
         jUsYr3LKKPTOzQ7WyOaU6IBBqotemStpHGVrqcWikiisZcwwn2FjNDkE7mZGd/84BrOC
         0RVccr/PYZC+bIUsURU1zEyTRXTKsYPDRG95CTjMxALNFK+G5TiqV527QbIYIn58xg+K
         9yRHAMkJdCb3KzJVHRoMuIi9cndkaDn8ZihnO+IvWPJ5Qqap0pEpKeMUBE+PjEYzoOg1
         zjFw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=gM7Xu01Q;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b1-20020ac85bc1000000b003f5aa8ecaddsi1873334qtb.278.2023.06.09.03.49.07
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 09 Jun 2023 03:49:07 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=gM7Xu01Q;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1q7ZeV-0000kO-7u; Fri, 09 Jun 2023 06:47:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1q7ZeU-0000k6-EP
 for qemu-arm@nongnu.org; Fri, 09 Jun 2023 06:47:30 -0400
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1q7ZeS-0001B6-VZ
 for qemu-arm@nongnu.org; Fri, 09 Jun 2023 06:47:30 -0400
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-3f6dfc4e01fso15718545e9.0
 for <qemu-arm@nongnu.org>; Fri, 09 Jun 2023 03:47:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1686307647; x=1688899647;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=t1gQ05YVuLQqB4KG1j7pOjx2rNDQj4Y5tpKZYfWuMtY=;
 b=gM7Xu01QhbWT6jQTJNAKFdl70jHpQPVBkiQ2LEiyMLl+DUQXzBHHmwscBtr0yxty+U
 99zeX7aafIn0MrAtmoVRpnmViRXQMjC2ejLewkkKlABwZe+ev9uf4yVFP5QYETvMRJpY
 9ijxH5yAu9lWpWp1whZCGu/sy3dZbOi+sDtXusr2bGWXqgilFyVqGgE9orcPoLbeh5gc
 ijFFxSbQ99VIFCIQ8z/z3hi1qduR/00cxtJJoEosTWM7I/2tsh5aqQwGPDU/GYl6n9Fr
 kZ6SWg1bNOI1q9heclwrwRcAcdE9qPdYLx8BLzJHNRqip1uLs8y1PDVBWVnrIn6UCxRj
 pSoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686307647; x=1688899647;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=t1gQ05YVuLQqB4KG1j7pOjx2rNDQj4Y5tpKZYfWuMtY=;
 b=d66ReBwGldcwCFg1LVRsq+dqRbLLY9LRoxL8/tDspRjzZLOjWyULLNRCKRjLvo7uam
 uqitW2BV9LZCbzSSsHirsnD2Qk6pAZ9hJm3RJCk+zl0b564Tnzk3lVhCbySBwUzQONUj
 oLLZNkkhoVJjJqqSnNZEa2HPXSF9IpOeT/8BbI2Qc3SFpqVWTdFUNtlAhRCkRrEz0/aj
 YKx0Va46k/fqg8oppgxl29nKctN0lcsJMM9H/cXQ59s3DlpK9PfsNao0gOZNuLS6+aoV
 ub0OitPQ825ts77kgGB6aFhoZye/cstQrMHFd9nfp98l1KjcrUsA3+MA7+Y3kBtSVNFp
 TTeg==
X-Gm-Message-State: AC+VfDzaZn6Y/bY/tWDdkI36D2Si+m2FkuIuEyyxW5mdGS8vxABN3Z08
 p3WlWbleI5VblCWe/PwA3xajuQ==
X-Received: by 2002:a05:600c:2204:b0:3f7:35a9:dfdf with SMTP id
 z4-20020a05600c220400b003f735a9dfdfmr836061wml.24.1686307647181; 
 Fri, 09 Jun 2023 03:47:27 -0700 (PDT)
Received: from localhost.localdomain (23.171.88.92.rev.sfr.net. [92.88.171.23])
 by smtp.gmail.com with ESMTPSA id
 4-20020a05600c024400b003f60101074dsm2274132wmj.33.2023.06.09.03.47.25
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 09 Jun 2023 03:47:26 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 01/22] plugins: Remove unused 'exec/helper-proto.h' header
Date: Fri,  9 Jun 2023 12:46:56 +0200
Message-Id: <20230609104717.95555-2-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230609104717.95555-1-philmd@linaro.org>
References: <20230609104717.95555-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x336.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: dgD//qKmQwss

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 plugins/core.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/plugins/core.c b/plugins/core.c
index 9912f2cfdb..3c4e26c7ed 100644
--- a/plugins/core.c
+++ b/plugins/core.c
@@ -25,7 +25,6 @@
 
 #include "exec/exec-all.h"
 #include "exec/tb-flush.h"
-#include "exec/helper-proto.h"
 #include "tcg/tcg.h"
 #include "tcg/tcg-op.h"
 #include "plugin.h"
-- 
2.38.1

