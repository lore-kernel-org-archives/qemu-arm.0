Received: by 2002:a17:906:da85:b0:8b1:202f:4753 with SMTP id xh5csp2098459ejb;
        Mon, 20 Feb 2023 01:14:06 -0800 (PST)
X-Received: by 2002:adf:f481:0:b0:2c4:71d:244c with SMTP id l1-20020adff481000000b002c4071d244cmr988794wro.25.1676884445936;
        Mon, 20 Feb 2023 01:14:05 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1676884445; cv=none;
        d=google.com; s=arc-20160816;
        b=we8hv0YfUMTetf/XrxEev64muoHRhnxoJzxXMuC95/uAXBTb/zRjhMR2x2gG5y3ixM
         a7pCCAb1Uwr2+URqD5PZembX5d7J6dexQzCXlJhY/kzW9EU6lrZZ06QTuWiuwM5HA3Oc
         PDGhAfBVs5hFEAZSX7s6u19mqFZoVXnzzlXC0O6ljw1iZ6XR7odofwYJyzFv+YIBnKaf
         +cLH0zz0Iq7f/fjnUHtYSOAqlN56cwJP8U+ipd+k5p7rP+9v716P29KQ4TllBlV5AgP0
         snb7cG4j3CywL+4CH8T0gIwWcVg2uWLNMCNsvDUYHWB1L1nz6mt7y3//90GkaTjeIHhy
         QNrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=vbq7Yid+DCc0hkC10nW8TDlz85UdxpCIIBbqcQwiV2Q=;
        b=q3k6RcCZgSgeQgLGynUs+L5+9ap0pM+lWFBxyTwLZthhVyxvSfYEOwwCy1cpnPyEMi
         LEalPW33UFZehwdhdx8UTCdeDjXtei3GwPFtvNX7WueCE4Uce0tBwrmOdanr3ou6VjiG
         hwrCai0veUVWQPviSwGNGDkB9Prld5vR/x/DbFOjVWeu8vCvGGfZMbD4bun+EvVF7p6T
         tWpv7PYSVq5Mwf273rMm7RivDodeSsAVfkSaONRLWczuwWwPWR7hdEO7k/EDJIfy2Drs
         ucg1xKNTK1t2gC5Dv2+MiFGm+oNmjwQkpedLwlfuryVmEoT6l9TUMj5t+2HR1wr7zuSe
         nIMA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=WyFW55FB;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id j26-20020a05600c1c1a00b003e20efd631bsor3698284wms.24.2023.02.20.01.14.05
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 20 Feb 2023 01:14:05 -0800 (PST)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=WyFW55FB;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vbq7Yid+DCc0hkC10nW8TDlz85UdxpCIIBbqcQwiV2Q=;
        b=WyFW55FBx+SX8Sfu9PUlqVniIPHXR4bFEAKvxqiyXg5bbhj14tXeRvguO3HNwrERsi
         C48k05vsddw/0PNtFfSih+OjUqy7rX0yfXsLrasMrbKzU4l7VIPkJPiP7nQGRe8gu10X
         umJsRUtK0zd/A3J1GdClHcjeHirMzykf48gui0h+PNt9qFiilo/+uNtVEejiDBwHhqtQ
         V9uYhuxGPFK0k3OSVy+WnipyWXbDzZYTYR3y/5tsmwC9xf06OsedLvJLrzPUTFQ72Yna
         CC4VArW3RBB5+QU/ToN4Zi6xbPByAy3TK3xV7NfVCk+m9tVUrT0U0OvPqnKON55Su9o7
         w/2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vbq7Yid+DCc0hkC10nW8TDlz85UdxpCIIBbqcQwiV2Q=;
        b=72vc+yFDFGTqdZYg9Aci+/9ONxPLRqbMuCwY7CrBY++5I5hkF5+epUBSpEFDxc7VKr
         PiUT1iCKEcqLLnmultEAfRltLZEY0g9JevNH49zZC3NKnIdDDhYdkQXv8fQct2dDhGzl
         P12wxFN6bCxv304dRMXmogbG98M+fRsW9D4imqpp44IOi8I2GdktmrBSpk5rzomatGR9
         StrmZ9Izyu2x6o8Iw0nXukQuHlnmqeTCULHaKOAWlQPqBLhKU57yEYABhG0M8i+hkGpG
         x5GaKZ5MvPyDgnddKXWRpearNQK3Vx6sINbWrldk8/pS0ffTxUZvp0gSMcQBhwO2vjtc
         v1FQ==
X-Gm-Message-State: AO0yUKUKUvWDPXJN5cbXle5UOx2SMtaeyNy84tSxzGXVp9gAq3EApwgX
	wQvgpuUOX0YahHkIrcXJR0uQOdahc+8GRCRrd1o=
X-Google-Smtp-Source: AK7set+ttxMO8CM69nAYXXOVx/A4xcnaQbgnUl2oWnaNoITFoBw+2NIP/RoGkKo/FECmgO8G2vJFlA==
X-Received: by 2002:a05:600c:1d0b:b0:3d2:2d2a:d581 with SMTP id l11-20020a05600c1d0b00b003d22d2ad581mr245290wms.30.1676884445575;
        Mon, 20 Feb 2023 01:14:05 -0800 (PST)
Return-Path: <philmd@linaro.org>
Received: from localhost.localdomain ([81.0.6.76])
        by smtp.gmail.com with ESMTPSA id b13-20020adff90d000000b002c3f50228afsm2765498wrr.3.2023.02.20.01.14.04
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 20 Feb 2023 01:14:05 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org,
	John Snow <jsnow@redhat.com>,
	qemu-block@nongnu.org,
	qemu-arm@nongnu.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v2 01/24] MAINTAINERS: Mark IDE and Floppy as "Odd Fixes"
Date: Mon, 20 Feb 2023 10:13:35 +0100
Message-Id: <20230220091358.17038-2-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230220091358.17038-1-philmd@linaro.org>
References: <20230220091358.17038-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: nRG7RspNKkod

From: John Snow <jsnow@redhat.com>

I have not been able to give these devices the love they need for a
while now. Update the maintainers file to reflect the truth of the
matter.

Signed-off-by: John Snow <jsnow@redhat.com>
Message-Id: <20230206182544.711117-1-jsnow@redhat.com>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 MAINTAINERS | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index fd54c1f140..0612fff63b 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1791,7 +1791,7 @@ F: hw/misc/edu.c
 IDE
 M: John Snow <jsnow@redhat.com>
 L: qemu-block@nongnu.org
-S: Supported
+S: Odd Fixes
 F: include/hw/ide.h
 F: include/hw/ide/
 F: hw/ide/
@@ -1816,7 +1816,7 @@ T: git https://github.com/cminyard/qemu.git master-ipmi-rebase
 Floppy
 M: John Snow <jsnow@redhat.com>
 L: qemu-block@nongnu.org
-S: Supported
+S: Odd Fixes
 F: hw/block/fdc.c
 F: hw/block/fdc-internal.h
 F: hw/block/fdc-isa.c
-- 
2.38.1
