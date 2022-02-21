Received: by 2002:ac2:5cd0:0:0:0:0:0 with SMTP id f16csp2752374lfq;
        Mon, 21 Feb 2022 06:07:53 -0800 (PST)
X-Received: by 2002:adf:ecc5:0:b0:1e5:7908:966b with SMTP id s5-20020adfecc5000000b001e57908966bmr15472177wro.661.1645452473376;
        Mon, 21 Feb 2022 06:07:53 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1645452473; cv=none;
        d=google.com; s=arc-20160816;
        b=XWbgoyD7x4IpJFhceF2P+1AAOH9kN7SkYvZQie4Nd54XhwnscuYbKqIRM/Ro+eah4p
         Ai3qWZY9HN+v9RsdMRboDGcj7r3wplYwJUNKPdlSgFxRrEbEKiGN7jmXC+eeV8vWtOPS
         PnB6u3k49vO9jmZOsBhAh3yMYZFE4rtl8YxrzD9zwjVwCdnFGW0yk5GJ7EB85uRB2lDm
         XrLMJ78VUT1+OGGZGzt55HU+AasHhJ8kX8yUd7O1NIWJzstpzkiU4s53DvgY7hzejim6
         XaKnPxUckVD/EmydDcK7+kCken0Gt7hw59Ass2FwG4arBq8r3OJbxhIeg2UwSkgQcbmo
         3cXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:dkim-signature;
        bh=lkWx7QGGS8WiDESf3HzDhqm0HFpYN0QbjJr4eJ5EUck=;
        b=IASrXfZEjkkKCiQ7lM3tBr7DxeaBzAxayNXNsVSfvOxLrAZ8Px9P3iWqdVpXeONN1y
         grQnBb/C10HkHXJ9gquefXOFnNBuIhggBI8A7ug5v6NoVZpgKV6Hn6BFB8le0+fewSeT
         CG33A38OybvDkSHPTjLdnkRHeqM6FaihcrwR/6xfypLd/gaNP1c9gqBVG920I2zO/hRY
         SsDM/4iVvAjRdjfeGBABETyH1kMhv+/sSCw/G5BBbzB+IqtSexBTvTMXnkeXLFjeGp6z
         FaGl2bG+fWsASJ549gNij/s/EIOU1D93prWbFlmgThjL2xnTEDvd5hTD5CnuUsJqFuOT
         aOXw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=MA+iHguQ;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id l18sor9269414wrt.2.2022.02.21.06.07.53
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 21 Feb 2022 06:07:53 -0800 (PST)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=MA+iHguQ;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=lkWx7QGGS8WiDESf3HzDhqm0HFpYN0QbjJr4eJ5EUck=;
        b=MA+iHguQp6cxeUPl//YOmWMzt0KxwHN8hYOJlUrPiqGGfdfB5/YDsu2UPElvri19C/
         SodtW2Es+gQrDKmWR5up+mN7lY2rBxeb24qKh7YC+g+8alZ6+bF7jzFPtPzd8TfIszWC
         M8WtZ7V45C1wrtNv3n6ibg/Urcq6wQBXYny6Nm5EdELac1jtjG0SSXWMCyw91hpcBrT+
         Tqt8vpl0YqSodqMLgacelOX2j7etLniTyPz+sO4aCySVePEq5LvOMzmSWD0pkFFQC32o
         y4n27sD3+/qRlBkKSolJzTFyi8+tWZwvZr4VpQK9QtqKbaGkmW39QDKhCo7WCner+eZ4
         bJpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=lkWx7QGGS8WiDESf3HzDhqm0HFpYN0QbjJr4eJ5EUck=;
        b=K+IJbGEfRp8TIQILPR7khZfX65bp2MBvyJMtTj0/rms1bqevJU9JRmKAV3DfOYyn4r
         /0lhfSaYfTgYliavDMmavDnX4Shm4ra3UtljDl/WNUpwf62eKDjZ508PXUX4JilYHUkl
         UFO20k6nEWXSYeCP/mwowbYBpNMMHq9KlKEQbdSS4q1LsTwbCpA5dYWM8cfaxV74MaRS
         YKlYi44EMxg18ur/5GUeLEtmxpi/oJ7K/P0D67a/Ce6Hl6y3NLUXhdJDspj5bJ8B/Y7y
         p+35f3NdM/qR+gHhwbEB+TYLQn4t+Z2kZ7jjNl6ID6KIcjVRlvkZhvvbQEJJ52rUxzK8
         4vHQ==
X-Gm-Message-State: AOAM531XJ5utSbJPwmdq72d6LPMsE7yKCPDJ8i6xWor/K4aKr6XU3giF
	6yYCRG+hByFGbbc0pOC5R+GG/GQ0
X-Google-Smtp-Source: ABdhPJxzu+n9BY+sqAMyjY9D+uYDZf81o0DKihDZTRbeKdhaN8WGwE2wEoNzagoz1ruBtnvazB4DcQ==
X-Received: by 2002:a05:6000:23b:b0:1e4:a4d1:a9f3 with SMTP id l27-20020a056000023b00b001e4a4d1a9f3mr16143296wrz.278.1645452473046;
        Mon, 21 Feb 2022 06:07:53 -0800 (PST)
Return-Path: <peter.maydell@linaro.org>
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
        by smtp.gmail.com with ESMTPSA id x10sm14024253wre.110.2022.02.21.06.07.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Feb 2022 06:07:52 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	Cleber Rosa <crosa@redhat.com>
Subject: [PATCH] hw/input/tsc210x: Don't abort on bad SPI word widths
Date: Mon, 21 Feb 2022 14:07:50 +0000
Message-Id: <20220221140750.514557-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: RgsKtZDjp9bR

The tsc210x doesn't support anything other than 16-bit reads on the
SPI bus, but the guest can program the SPI controller to attempt
them anyway. If this happens, don't abort QEMU, just log this as
a guest error.

This fixes our machine_arm_n8x0.py:N8x0Machine.test_n800
acceptance test, which hits this assertion.

The reason we hit the assertion is because the guest kernel thinks
there is a TSC2005 on this SPI bus address, not a TSC210x.  (The n810
*does* have a TSC2005 at this address.) The TSC2005 supports the
24-bit accesses which the guest driver makes, and the TSC210x does
not (that is, our TSC210x emulation is not missing support for a word
width the hardware can handle).  It's not clear whether the problem
here is that the guest kernel incorrectly thinks the n800 has the
same device at this SPI bus address as the n810, or that QEMU's n810
board model doesn't get the SPI devices right.  At this late date
there no longer appears to be any reliable information on the web
about the hardware behaviour, but I am inclined to think this is a
guest kernel bug.  In any case, we prefer not to abort QEMU for
guest-triggerable conditions, so logging the error is the right thing
to do.

Resolves: https://gitlab.com/qemu-project/qemu/-/issues/736
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/input/tsc210x.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/hw/input/tsc210x.c b/hw/input/tsc210x.c
index 182d3725fc9..e0362d71719 100644
--- a/hw/input/tsc210x.c
+++ b/hw/input/tsc210x.c
@@ -23,6 +23,7 @@
 #include "hw/hw.h"
 #include "audio/audio.h"
 #include "qemu/timer.h"
+#include "qemu/log.h"
 #include "sysemu/reset.h"
 #include "ui/console.h"
 #include "hw/arm/omap.h"            /* For I2SCodec */
@@ -909,8 +910,11 @@ uint32_t tsc210x_txrx(void *opaque, uint32_t value, int len)
     TSC210xState *s = opaque;
     uint32_t ret = 0;
 
-    if (len != 16)
-        hw_error("%s: FIXME: bad SPI word width %i\n", __func__, len);
+    if (len != 16) {
+        qemu_log_mask(LOG_GUEST_ERROR,
+                      "%s: bad SPI word width %i\n", __func__, len);
+        return 0;
+    }
 
     /* TODO: sequential reads etc - how do we make sure the host doesn't
      * unintentionally read out a conversion result from a register while
-- 
2.25.1
