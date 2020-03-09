Received: by 2002:a19:f015:0:0:0:0:0 with SMTP id p21csp1257687lfc;
        Mon, 9 Mar 2020 08:15:27 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vvclcnr9tpitbTP7wRFqViX7E8r8qO7N/U6/eQCWtEajMO0hz/O/ZqdDd3bX1y99Chc1+pE
X-Received: by 2002:a37:6285:: with SMTP id w127mr15142633qkb.138.1583766927118;
        Mon, 09 Mar 2020 08:15:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1583766927; cv=none;
        d=google.com; s=arc-20160816;
        b=wK+N2dpunSNkyprmRntzUqsUXXpcZe1ZWPzrl3hzWzTnwx2Hm4lsOBOsSEGnTooBL8
         E+ZgI3A8K+5FapH5rxZN0OOVoCEbdTA4JejIQ2zWNW84qmM1hBkEhPXMu+DUwq+zYvXA
         VudnMPkMMiVcHA2LyWpUJ/GuiwZfBpBa1HqrhbwFYxBfxwDU/+rodO76U9kGJprWSpGu
         SYgq0UaWiooXB266BjR/aCPwF77a7IAEPDenfCc6Sb3FpcUMTJ7iUxD+JjSKQdfeiPvM
         LNS/E2q4JPMKKkxHOuMMs+UQXNjCAzCb8zTYDk3JSIUjkXzLkAEGVrFy25p1LLX9P0mX
         3p9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from;
        bh=2BG8xjZUClVNIVKA70w3CHga9YnND0J6LkwtiF3T1hA=;
        b=mfnTNC5kyfMv9nTFZzedpfBI4EDCnPpnjyiuGEAyk4VPT7w69fTMRfTGmyrhZo8JO4
         9IR22tMBjmhjyP6sQK72lloz2IOsfUzenXKQYxyyETiCvqlgZyRz8Jsqbwyv7z7EuR+x
         7kqX1H9gO5z3cebGQGi0L8xpTh2AUv9w1/1h5htqGq0JbrGj23kLUHyZzzjx+kEGmRTK
         S+OlRxs6YLacUT5e8sR+SO1VhdwvUfzOo73Bjgdq8YVHGoHg8fR1LBevc2+Fi+IfhMsU
         3hH0JTqcfG+q4Qfl/v+8nijKHKWE5ljwvW/sZTwj9i+sqFdQWjeuOYCAGtv0n9OBZia4
         xPMw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c3si6387313qkb.191.2020.03.09.08.15.26
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 09 Mar 2020 08:15:27 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:44632 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jBK7q-00087x-Dv
	for alex.bennee@linaro.org; Mon, 09 Mar 2020 11:15:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33836)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <laurent@vivier.eu>) id 1jBK2x-0000HV-WE
 for qemu-devel@nongnu.org; Mon, 09 Mar 2020 11:10:31 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <laurent@vivier.eu>) id 1jBK2v-00083a-Pg
 for qemu-devel@nongnu.org; Mon, 09 Mar 2020 11:10:23 -0400
Received: from mout.kundenserver.de ([217.72.192.74]:34875)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <laurent@vivier.eu>)
 id 1jBK2j-0007w1-29; Mon, 09 Mar 2020 11:10:09 -0400
Received: from localhost.localdomain ([82.252.135.106]) by
 mrelayeu.kundenserver.de (mreue109 [212.227.15.183]) with ESMTPSA (Nemesis)
 id 1N79q6-1jPh9b2kkm-017RUo; Mon, 09 Mar 2020 16:09:15 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 14/33] hw/alpha/alpha_sys: Remove unused "hw/ide.h" header
Date: Mon,  9 Mar 2020 16:08:18 +0100
Message-Id: <20200309150837.3193387-15-laurent@vivier.eu>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200309150837.3193387-1-laurent@vivier.eu>
References: <20200309150837.3193387-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:uccyuDrkFn+a+xEWYIJHFbgT2Icbc+Sj4ndp1MFnVVx0HLwwqeP
 la9vjsB5CnghR36yGzsOk/Y3AFTd4A0nSrBItsgyjXayc5Kqho29niLo2I0mAGJg3DhS8n4
 Q+3IuMpRobwcsbq5qzU/QqonQVILD/6FaMWYTVqJEpWXowNdJ1ZUhQA2ZDAduZJi2q1l5io
 80LRGFOeaxEqdTTN6oYpw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:H0CLhIOz0Nk=:xUwZiqy5V4yKaT2+xD0mEx
 /i05Kz0KbWFGvNO6EQDyHLnZvGTxMZbWdKSphC0934APVF+KRPVIyI0ToU8H6ALe1xdrQKmn2
 ItJVtcaCBUsbs7XLOgAVnAVs6lcdmnpUZ6wHqI/rFPxFfrbmbzvOyKKZzmaWkVwGJsbeur35f
 QA3kABJFi4PhJpQddnWHmol8Uzi+cVrNUdpQkXTa/S9XJtoh9J4ZBwSd92z8vdall+pML6dZv
 d+08yl1DWjlS2w5fQmPFm1PSOiHgVKW17rfdhWpi6TXAz3Y38lS+OJzsl1plEMWX77xK4/Jq3
 t6fB+rNYyNnnsiONlu9IKLcoqJJHwvgfPak47GlGgGraEhdD7iymLqoJhytytlK4Ypk55siFW
 CKxAKmGFadVrlBvCZ6coVyKytOO011kzqYu0u0DqUpfwLqFEF9sXdz0N/KTG4o+lM4cGELBM6
 9kY79RvfPTbupLP0xtPHIa0VSaFy+/sa88FUbYoJcv2gu7GA1bmuzYsn1985HiZV8yD22EdnB
 8ozbw/JtcwZMW9ek2V3m5W0OLFfTkmd5t+VMSQegKihM0pdXFDmSv53mZQg0AxGJYSd8SEXMX
 3m6/HwKKNwPzDuvSp0aBw/8EQNNUymE+j61ExzGWzW6rGa9ZqwuTBso/wTlLBYoXeUJemOXgG
 zUyzobqsrXJkNWwC2w+vHlmKMhOwbXvLBcVpK+hIH3tAiSAHRgSk/FlpkXUxhmNGqe8eBeG43
 Hi8/6/onj+SjANFK6AP1ok+Gog3VT2uWKnDvYP2p6+kwxMIw2lNj77X2I+Rav4+xG+/PyH/x4
 I4Ezc4WUJoxXiE60qdBr1b0BDrgzq6n8LqgX447FRAQ+g7L4Ef6xAFHK18Q6OOFc+NCtuSa
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 217.72.192.74
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
Cc: Fam Zheng <fam@euphon.net>, Peter Maydell <peter.maydell@linaro.org>,
 Dmitry Fleytman <dmitry.fleytman@gmail.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>,
 Gerd Hoffmann <kraxel@redhat.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, qemu-block@nongnu.org,
 qemu-trivial@nongnu.org, Helge Deller <deller@gmx.de>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Michael Tokarev <mjt@tls.msk.ru>,
 Alistair Francis <alistair@alistair23.me>,
 Richard Henderson <richard.henderson@linaro.org>, Greg Kurz <groug@kaod.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, qemu-arm@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, John Snow <jsnow@redhat.com>,
 Richard Henderson <rth@twiddle.net>, Kevin Wolf <kwolf@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Igor Mitsyanko <i.mitsyanko@gmail.com>, Laurent Vivier <laurent@vivier.eu>,
 Max Reitz <mreitz@redhat.com>, Aleksandar Markovic <amarkovic@wavecomp.com>,
 Igor Mammedov <imammedo@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: kB+tyFeOznAj

From: Philippe Mathieu-Daudé <philmd@redhat.com>

alpha_sys.h does not use anything from the "hw/ide.h" header.
Remove it.

Acked-by: John Snow <jsnow@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20200228114649.12818-8-philmd@redhat.com>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 hw/alpha/alpha_sys.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/hw/alpha/alpha_sys.h b/hw/alpha/alpha_sys.h
index bc0a286226f1..e2c02e2bbe1d 100644
--- a/hw/alpha/alpha_sys.h
+++ b/hw/alpha/alpha_sys.h
@@ -6,7 +6,6 @@
 #include "target/alpha/cpu-qom.h"
 #include "hw/pci/pci.h"
 #include "hw/pci/pci_host.h"
-#include "hw/ide.h"
 #include "hw/boards.h"
 #include "hw/intc/i8259.h"
 
-- 
2.24.1

