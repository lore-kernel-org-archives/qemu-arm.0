Received: by 2002:a5d:610e:0:0:0:0:0 with SMTP id v14csp988330wrt;
        Mon, 11 Mar 2019 12:12:56 -0700 (PDT)
X-Google-Smtp-Source: APXvYqz4007eFALeiichJHYAug6XgmdGAFhTPfS+SsIp/2JwZJVO+EsmK1rqL5jQ98ElDU+h39if
X-Received: by 2002:a25:c78e:: with SMTP id w136mr29068360ybe.358.1552331576088;
        Mon, 11 Mar 2019 12:12:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1552331576; cv=none;
        d=google.com; s=arc-20160816;
        b=EvuqhGttgIp7vrCBwt+1AZLaePJWISvRQ2xVTURlvG8M7KZVoA8Vo4wDrHpU+3KqCB
         dmuwNtcsoukwOBC1ceZxrGKamtSZxZxy7cCIytAYaMhigsXQBys+ddKd7okoO0zKpWpc
         kBc2kefhEkW/lffDpNQFiofha+i+oy9YKR44PRcwZuoJkbUubl1mu2MvZZcXBHD//vjG
         jjz19LNVWY6xgYHxo2vFd+UwJT2jU8Q+/CiFipT9slTn5TxvYdyykv58JRv+6ErsM0Tc
         s4W420+phUmuIxsANQ3E6wwgqfE86Qcq9zMFyiyl0yeZLWH1GM8tBpGHeTntADJ5ef7N
         Cs2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=YXTd9VR0WEK+TViJZemPcvJEpGYCDpiHjuvXF7Kdjz4=;
        b=hZfOJkOt3v0LwbdIj8fSvmWpyiX5896Qxbm/CAh9s+d1h3IIIvj76v65ka3O/b8agC
         daSqzktHUJ3FzJ7tI8Xy/O/8efvEpe5Gx/LLDEecOHtX278CsNYLXIBhmlJNH9FWRZYb
         sBbVrn1imzQbDBeN3/A2ME2MBgsBRC0/fM8Nzz2wTt2t6YE2E2Om7EVYiJEhikiw32WJ
         t1thbPHk+1koMXd0SDAODgVMwFitchk3MK3lc4sd8oyOLUhZQPDOyUqhKx1EoTEUSWDr
         QCRoE5mAHkTU7KPGUjLtw0PPi7QxA4ms77LpKQ1W40Uj3Lmsa7LXok3rvNjj4xEGPjH5
         CdYw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i12si3455324ybp.85.2019.03.11.12.12.55
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 11 Mar 2019 12:12:56 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([127.0.0.1]:38812 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1h3QM3-0005PU-CH
	for alex.bennee@linaro.org; Mon, 11 Mar 2019 15:12:55 -0400
Received: from eggs.gnu.org ([209.51.188.92]:60122)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1h3QL5-0005NN-CH
	for qemu-devel@nongnu.org; Mon, 11 Mar 2019 15:11:56 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1h3QL4-0003W6-L9
	for qemu-devel@nongnu.org; Mon, 11 Mar 2019 15:11:55 -0400
Received: from mout.kundenserver.de ([217.72.192.73]:49325)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <laurent@vivier.eu>)
	id 1h3QL2-0003SY-Ix; Mon, 11 Mar 2019 15:11:52 -0400
Received: from localhost.localdomain ([78.238.229.36]) by
	mrelayeu.kundenserver.de (mreue109 [212.227.15.183]) with ESMTPSA
	(Nemesis)
	id 1Mgek6-1gZaEQ1tJk-00h8LM; Mon, 11 Mar 2019 20:11:38 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Date: Mon, 11 Mar 2019 20:11:26 +0100
Message-Id: <20190311191128.30562-4-laurent@vivier.eu>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190311191128.30562-1-laurent@vivier.eu>
References: <20190311191128.30562-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:+/7vQYnWzSBZpyc21fQiaX1NhoLlLObmbxfRYYgeqZRGWk36tgV
	uqMOEowoEasOPODlDJiBTw+tR6WUCf+fyZXmNlY9e5oyUKe22dyBK4OLZhzn3Zo4KZQfOlk
	+fdtjIaWkjTrpvIISRhXJevtyrK33at/n6TB91gCQp3FayzXxtG4q49X1y9O9bKkvqKx1Yt
	Vp3llgE7QHshWl8f+1cLw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:RNrBHDC5rY8=:St7pIStrAkgi2QCwDbggJT
	qYwJYS+FveRoBPtFRZb3coEVATExAKb3A9MCbMSXTRq3au8uoROztW7Q0Z7UY8U5XP95VaLxR
	woQ86ZqWbDnH3f8lvL45AVpDuCNWnUuUlrlzKNs9hT182XwKuFFCRqWOIn6f7Agi72/8VCN8v
	/fQkWesBktCIkN1I3iBKzalYTCiF791yfpIaLxfFl6eyyEaRG0+JUMvtUtOKokpwudEqTgv+a
	znDIz79DmvbunB8RNuG1sHiO9FbMxL5UsD3MJgRFruA54df+/35HJo/UUW+UaIL2BhGFP/hl7
	qSCo++ALCP2f0GifbS9hlMxTdoVrRvi/XDrNk6LJLYTou8uSoD+SzGuWttnmOusG8IB9jfqUE
	XOalJQIFqzUKK6wNu3jwIJpogQZ0TWQcBocK1VTT7P3znJtqGVLF74mV5UP6KFofsmhI27EhB
	n2yb4ZG1cS0UBSBEc2bdqEKNy8eNDg1Lz27lpUNfL8vgqqaoUVp7IR2boGjrpLrGFaxoaK9yL
	fc18OeCgqYIhKbl7OgLLGoHAYbfTgCIpuadcrLV8+GD4ZiReO2C+ZTB+D2Z2fuwWHgccT5gnK
	xqKZXufG5FzapSKRRxBEYzcTsdkSRlxTNOwIA4jF3kxZKVKKOfqN/8OZ8Ij56fwSS2N1QCKGa
	5Iz83ZLspo6UPruZ+tqsmZeB4AbWRJULSjwpjfRZGjp/txF2g/Ue4yzzmfAtGLUsLv8IBsYUl
	vlxrExVSx+PT0rL+ZHZNLRwhOcOezQll1GElg+qQaXZTD69wpI5vhXeisIY=
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 217.72.192.73
Subject: [Qemu-devel] [PULL 3/5] hw/i386: Remove unused include
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
	"Michael S. Tsirkin" <mst@redhat.com>, qemu-trivial@nongnu.org,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
	Riku Voipio <riku.voipio@iki.fi>, Michael Tokarev <mjt@tls.msk.ru>,
	Laurent Vivier <laurent@vivier.eu>, qemu-arm@nongnu.org,
	Gerd Hoffmann <kraxel@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>, Laszlo Ersek <lersek@redhat.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: fBFpKWbX2qQY

From: Philippe Mathieu-Daudé <philmd@redhat.com>

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Reviewed-by: Laszlo Ersek <lersek@redhat.com>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Message-Id: <20190308013222.12524-3-philmd@redhat.com>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 hw/acpi/piix4.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/hw/acpi/piix4.c b/hw/acpi/piix4.c
index 8fd25a59269a..7b98121070f6 100644
--- a/hw/acpi/piix4.c
+++ b/hw/acpi/piix4.c
@@ -28,7 +28,6 @@
 #include "sysemu/sysemu.h"
 #include "qapi/error.h"
 #include "qemu/range.h"
-#include "hw/nvram/fw_cfg.h"
 #include "exec/address-spaces.h"
 #include "hw/acpi/piix4.h"
 #include "hw/acpi/pcihp.h"
-- 
2.20.1

