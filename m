Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp1400781lfp;
        Thu, 6 Feb 2020 04:53:27 -0800 (PST)
X-Google-Smtp-Source: APXvYqzOpKcy3pOPXCNcKhAIjbOX20DL+vIcuv0sm9lH9EMeE0HxoSbm5QmbY4cORqE6qjEPMXKF
X-Received: by 2002:ac8:2af4:: with SMTP id c49mr2422793qta.367.1580993607091;
        Thu, 06 Feb 2020 04:53:27 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1580993607; cv=none;
        d=google.com; s=arc-20160816;
        b=CGCFY9togDCnVzw1oWlno6B7W37hvTRW2VHQhU3ZLY//7IN3H2rM/XGZetGzsEIaoi
         avx8aMSX3Yu9GhpO6aTjM/5wr94NTSBWuSdDpgPz1RGTIcM32jHp+lqTT7vQ+5asXIH/
         V3huufdsbQfzIPyx614F70VG0lST+Gw3TrFHQqEkdcawKJynAzgZd+kZAeQ1XPCDBGfD
         14MdpTb7cFf7jJ8pEkbObNb9DyrYDOek0ZA1YVWJPvkZ7fTQctL+yQ06caMvk7S2xyyW
         /1QO1pmbwAOo1+sCqyZSjVc+DVhB1GeA0HWIsB+ebnrPbz2LS9Ate5uJne+1eAXvkDo3
         c77A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from;
        bh=5HlWrljIaUi/cXK4VDHI3yE7C4xPVpkDEz/L+WTU/RE=;
        b=QwtfZR79Lfw7ksJEBmq8uVZu+xli8hsEznYfAQrFXYmuHg66gJ1npreBTnKtVbS5fC
         x1RHrgTzfexlDE54ZUJt4N5bxKJziNCGpDz5P2E1aAENIQT8jm29izGueC9g8XLQQcyn
         7QXcotesgwt/4kYgjK+fvJi97qrOz75UsyD2/dADvGorcG6GzNm+GB0EC9cYyH9U68F6
         hfSg+75THGOZx/8UBtiI2UsVd0dFhHHkku5uaIYT8g6NL3Ah1QvfqN0YGKfeya8Pu03L
         Yl9oTrZlhlYgjW6PBlZVQoEoi88sCUcH7eLK9LTR2/cnF3wY5KpMq0BB1zhoN1B/MXQm
         4xSw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t12si1357804qti.315.2020.02.06.04.53.26
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 06 Feb 2020 04:53:27 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:38200 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1izges-0006qE-HL
	for alex.bennee@linaro.org; Thu, 06 Feb 2020 07:53:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56454)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <laurent@vivier.eu>) id 1izgca-0001C0-Lk
 for qemu-arm@nongnu.org; Thu, 06 Feb 2020 07:51:05 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <laurent@vivier.eu>) id 1izgcY-00066A-92
 for qemu-arm@nongnu.org; Thu, 06 Feb 2020 07:51:04 -0500
Received: from mout.kundenserver.de ([212.227.126.135]:57101)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <laurent@vivier.eu>)
 id 1izgcT-0005qx-Qu; Thu, 06 Feb 2020 07:50:58 -0500
Received: from localhost.localdomain ([78.238.229.36]) by
 mrelayeu.kundenserver.de (mreue010 [212.227.15.167]) with ESMTPSA (Nemesis)
 id 1MyJx6-1jj0DB0NUy-00yjFj; Thu, 06 Feb 2020 13:50:45 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 07/12] MAINTAINERS: Cover hppa-softmmu.mak in the HP-PARISC
 Machines section
Date: Thu,  6 Feb 2020 13:50:22 +0100
Message-Id: <20200206125027.1926263-8-laurent@vivier.eu>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200206125027.1926263-1-laurent@vivier.eu>
References: <20200206125027.1926263-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:AnBQfhgGBWDNaHxLS/Q0ayMp/lBlof3BqLNVOHGMqFEab2mi9pb
 PtsEatNcZuX3ZltEGvVdqdX3kg5kc3io+FdHsY8t8FZ+N/VQhK6+AdvfJc1YQd70esmcB72
 mFqIkfK0wqVkR5qtUsJo0UM5EbXRRQe1jJwFOFmNVRqPJXpc0TFASaTbohde3uNDRNyxQeJ
 Nky+yguP/NsBo4X/CWjbQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:8VFWjTevfTI=:wolqUyxQLtCo2o9zTCRU+a
 71MTWfGicdMB84j8pc3Ouy2mZubYHMiqjV6gW28L7B1q6UwaXdbSM5erNcH9GG8gxujlvCDOW
 +KJ6jQD4RcQPs7j7wLM5XtF341YySWqsU9OSVuw55Ow5yrT/i6JtbrxSyS7elUsGl/Y0s1o9b
 wKvBQmYf8vM0fCHPq+UM+KoAJ6ZO/e+Byy4TldBN+O13Zty8Tw/kStYKJDb+beWjACHkYw9vP
 ZRbf6C4ZUkklKnueY1u6XtVJp8ZKQHmDQya2E5T2aqimYuTyJ7vOnA3Y7RQ/kgmfxke/m1FFT
 icJW1q+J2M+Lt9npLVouCfTyx6J3ZYdrcRUzMK+fpV2Y+WsCoFk60V6RqpmmXWMvIGV9vx+C9
 FtVnzXifyGewi6mzjl3zhmV9eCDY690QqWGqHadxN2zuKt17oKsrjYv/T/0hnm0GXdFknXrox
 50f55f7z85DQy217Sev6MSOl5dcL/QUJVyCGTHjM4noydKJVNZToVz9xUt1dNGaTvGFJ2A+kn
 MhkyyzolHC/DP9HbWUgVNzyhaFJNCQ/RIJFCGzAeBO7j2TI3BfkwrQHBmvHWz/1/qixdlzZ2f
 uhvdlFFwhb968Ty1b8cD/XvGlhHnWKEjErvxRN3h6s7FgKm0QvVsSnYOOpz4VKyoKTgVHDKQi
 798WTUOK6rJQrcj30BbfTaOfRuCTM676igGKe+FjPh9Aq9Ya9M7zF2aGX8x4Tb5QY8m6ZUqZO
 tSPNh4Pzs3T6/xoT7Sunwq+MPxj4wVcEw8f+1zjjauDwtSvzqXSUb/xOi/3/hrsUO9Sw97Xwy
 2x2cz3pXCO/DMze58k0TpRjGWGpZ86TGf8UDywzZvTsjxbSkmcE4s8D5yWxQUtMu2ezf0Rc
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 212.227.126.135
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
Cc: Kevin Wolf <kwolf@redhat.com>, Laurent Vivier <laurent@vivier.eu>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-block@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>, Andrew Jeffery <andrew@aj.id.au>,
 Markus Armbruster <armbru@redhat.com>, Helge Deller <deller@gmx.de>,
 "Michael S. Tsirkin" <mst@redhat.com>, Michael Tokarev <mjt@tls.msk.ru>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Max Reitz <mreitz@redhat.com>,
 qemu-trivial@nongnu.org, =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 qemu-arm@nongnu.org, Joel Stanley <joel@jms.id.au>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Richard Henderson <rth@twiddle.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Ggl6xxVoyI9E

From: Philippe Mathieu-Daudé <philmd@redhat.com>

Modifications to default-configs/hppa-softmmu.mak should be
reviewed by the hppa-softmmu users (currently a single machine).

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Acked-by: Helge Deller <deller@gmx.de>
Message-Id: <20200129190316.16901-1-philmd@redhat.com>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 259688174ace..9d45ac274ed7 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -896,6 +896,7 @@ HP B160L
 M: Richard Henderson <rth@twiddle.net>
 R: Helge Deller <deller@gmx.de>
 S: Odd Fixes
+F: default-configs/hppa-softmmu.mak
 F: hw/hppa/
 F: pc-bios/hppa-firmware.img
 
-- 
2.24.1

