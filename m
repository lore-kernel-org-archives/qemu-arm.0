Received: by 2002:a17:906:b2c6:b0:930:eaf4:5c09 with SMTP id cf6csp2823982ejb;
        Tue, 28 Mar 2023 10:31:33 -0700 (PDT)
X-Received: by 2002:a5d:4b52:0:b0:2c7:cbea:1140 with SMTP id w18-20020a5d4b52000000b002c7cbea1140mr12229987wrs.71.1680024693561;
        Tue, 28 Mar 2023 10:31:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1680024693; cv=none;
        d=google.com; s=arc-20160816;
        b=LcKnpUpGh8mUb40AnXtvX4uh01Q5Z4Ql+ClNUlcaGZ8F4euddovx9qB2qDu+60EleA
         HDdKiFYlk5sYbZzUweopbcesZVKGTS8huypxuiIYTtyepVywMz7DqXzMz+dhKcQnk7Qp
         3cGNovzEwEX14xTWlalx7fP37kbz2cCEQT0/Jornp2yLBDrG2twoe7bpnXgmzAirHg9f
         f8VjBkyY71UsKB2e8MUEPhuU9xHkFuKEiGzf7ASb9uECy0Cwn+BpCM8iZAuGXqWzGTzR
         cxzEcz37u65vCSaFPwio8ipQz0Ms66BwsxzhRAIMehdFy/accCyVQJC21hBZj4MzKzSv
         XCJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=dtiprwlUv8RpyZHXqJVAug6oqdjSRp6/2zuWFlQJTRs=;
        b=aff3DZWk1fSGSbZu3aqYeBU1jIBskoQZ63GT7b7JIqYX2fZCkzCbGZiLgiRNWUvYka
         aLPr/bb6RFgKj8qOd3siVYmClnr1yzHyI2oCghE0xIvVbX5MPsdclI/Em95+ntmQ5Zbm
         CiXv+ihmO+xQpW2ZOhnkS7tJORPfqbBfQHanmP5R4nogxTMuIVuoOL2uuqg1aA3bUuLc
         VyHYN/+IRyoxUgwKkS9VSOgPijhhx+KfqZqqGzypUGT6bkPOLsqgCRQsfrs6GZDZowhv
         aQ8rXs3fD7+AIuIDyTwLprYs8z4xMoNwYqVy2UYLq9Cfd6X8kzTZU8aYzZtvM1LzvCF8
         OlSg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=jRrDLlb5;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id y4-20020a056000108400b002c6e8376f39sor12837151wrw.28.2023.03.28.10.31.33
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 28 Mar 2023 10:31:33 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=jRrDLlb5;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680024693;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dtiprwlUv8RpyZHXqJVAug6oqdjSRp6/2zuWFlQJTRs=;
        b=jRrDLlb5Rr0/bjgs0sXnPhocTF2kfFeBSzLF6bstz/3ygI64v/eWDrZCogYGgynYQP
         A3hrl61AOTFeEGUhH99GhdE3G0beq7SNPicGoCu/67HMpRZ7OOxl/8FYyDGxYfostrQF
         O9jrP876HInNbbghyBLQwnS2deq8MHy5UCkIqOGupZNO/yjTu2Ytzvs1ahaP6Zg8hVqW
         iuw9CwKVPjBDtUPPo0bcuhM26bnS9Re/sMKECuZ6iP7XHy3eu1ZQllM5QS6B13i8Aa2s
         VUk9MjN7Pf8XFoXdNmBGvfruTlKaVjDP1NjyanfzO+a7iGGWHKkI/AjIDvpQQ8SDgTht
         gO8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680024693;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dtiprwlUv8RpyZHXqJVAug6oqdjSRp6/2zuWFlQJTRs=;
        b=xWDHPRy7fx8shUo8oz/6/JDwphlXZFSHJ0kMsznW9Y/0cOJjrDn/8UDDQrfukIPjPH
         Ou/pr19d/kOxWr3B6pKhXfdpSVZ6QkfCiXkrfSrzEh2NdxxTEYQ6ZZ+yUD8ei8aP07+r
         8NwY0ec4yQhYWHtdN82Tw/dCK/71csWWrtakjMKMyrDfTp/CX+c71UirhO7LPpOOL7a+
         i++UVkFUKlw4PhNCjEa6C/lP59yvgJJPud+sDwsnSALcSyS0+VfDsHDypnxt9EBm/4W5
         VXRBddNTd+atiUIHFxT/crzTByWucy6/AGqVeGRfYMrK4GaywOQdJRbcEKsrn/EVf+GL
         40rA==
X-Gm-Message-State: AAQBX9e2FNt2ePPMoXvyZKgWh6eAG+VwSnABN73y5mT8E5W7CMSsATML
	aA35xY/U5EIMWvbqwHlnYsXUez8g
X-Google-Smtp-Source: AKy350YcLKf496WO/PMS7jSwOOzxrOynCtjMnJtsPQhvloi8lsidFYl2ZcxsFhfyhqCqdSMllBmsSg==
X-Received: by 2002:a5d:428a:0:b0:2d1:6104:76ab with SMTP id k10-20020a5d428a000000b002d1610476abmr12558802wrq.2.1680024693303;
        Tue, 28 Mar 2023 10:31:33 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from localhost.localdomain ([176.187.210.212])
        by smtp.gmail.com with ESMTPSA id c8-20020adfe708000000b002cde626cd96sm27997076wrm.65.2023.03.28.10.31.31
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 28 Mar 2023 10:31:32 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Halil Pasic <pasic@linux.ibm.com>,
	David Gibson <david@gibson.dropbear.id.au>,
	Daniel Henrique Barboza <danielhb413@gmail.com>,
	qemu-ppc@nongnu.org,
	Yanan Wang <wangyanan55@huawei.com>,
	David Hildenbrand <david@redhat.com>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Eduardo Habkost <eduardo@habkost.net>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Greg Kurz <groug@kaod.org>,
	kvm@vger.kernel.org,
	Ilya Leoshkevich <iii@linux.ibm.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Fabiano Rosas <farosas@suse.de>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Thomas Huth <thuth@redhat.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	qemu-s390x@nongnu.org,
	qemu-arm@nongnu.org,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	=?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Subject: [PATCH-for-8.0 v2 2/3] softmmu/watchpoint: Add missing 'qemu/error-report.h' include
Date: Tue, 28 Mar 2023 19:31:16 +0200
Message-Id: <20230328173117.15226-3-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230328173117.15226-1-philmd@linaro.org>
References: <20230328173117.15226-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: OzVw712YaAKn

cpu_watchpoint_insert() calls error_report() which is declared
in "qemu/error-report.h". When moving this code in commit 2609ec2868
("softmmu: Extract watchpoint API from physmem.c") we neglected to
include this header. This works so far because it is indirectly
included by TCG headers -> "qemu/plugin.h" -> "qemu/error-report.h".

Currently cpu_watchpoint_insert() is only built with the TCG
accelerator. When building it with other ones (or without TCG)
we get:

  softmmu/watchpoint.c:38:9: error: implicit declaration of function 'error_report' is invalid in C99 [-Werror,-Wimplicit-function-declaration]
        error_report("tried to set invalid watchpoint at %"
        ^

Include "qemu/error-report.h" in order to fix this for non-TCG
builds.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 softmmu/watchpoint.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/softmmu/watchpoint.c b/softmmu/watchpoint.c
index ad58736787..9d6ae68499 100644
--- a/softmmu/watchpoint.c
+++ b/softmmu/watchpoint.c
@@ -19,6 +19,7 @@
 
 #include "qemu/osdep.h"
 #include "qemu/main-loop.h"
+#include "qemu/error-report.h"
 #include "exec/exec-all.h"
 #include "exec/translate-all.h"
 #include "sysemu/tcg.h"
-- 
2.38.1
