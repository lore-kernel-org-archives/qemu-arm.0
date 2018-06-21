Received: by 2002:a5d:4301:0:0:0:0:0 with SMTP id h1-v6csp2311915wrq;
        Thu, 21 Jun 2018 11:10:37 -0700 (PDT)
X-Google-Smtp-Source: ADUXVKLFcZ3tbe+/UCnaFlxDnQlrDnn5K85ogTrd/LtVOxEUFHvvT3MQ/Wg5dhHd0T/osh7AxF1T
X-Received: by 2002:aed:2387:: with SMTP id j7-v6mr24947557qtc.121.1529604637164;
        Thu, 21 Jun 2018 11:10:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1529604637; cv=none;
        d=google.com; s=arc-20160816;
        b=Z2hcAjlhUdZ5t7x2+Ptk/gC5llhAntGADrPn521bqJpxsaY+nbKFl5KzKqvt+CLo9G
         eD0Lnteq1hWvdwd8vGFRVulSASZsLOtcQCAm81+CbZX5WybaZEmbC9Nl53jnHNU9fVlm
         FH6ssoXUFavqQkQQggobKIjHvIFPH74/IkMtLbAmNtf48N0V0UEgJa8AOuJZ95mkb8l5
         WQZuI3rdKzQ4YuQoNdR7IOFvOEhpFwzK/Vk+Zb9wXgImOK73XdH6QkNPRP4dp3Og84OD
         Ld9knfy362DDcLpRf0Ras/RFEQOJdjfE+w8U/Cwwr/yNCqSzXS65As/solXFWJmIfC0U
         YUuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=qye9mbQZXI6hIS6hiPWJ+dp36BJWQL8i3rGz3aurZ+o=;
        b=gl7jD4XQnD8Yw68Kc5d+y6FGp6fETtrE6qWt3dJoiM1PPvHkHCPuzAIPiZSkkAmVxn
         zA5Ow5O76Xtx4197EBwE5p/RRE/1sz9ieY6MyPaPVJrxfg85fAxOlV3I/ENGcBvlhXfE
         swLnPXpw46iWi8Oegg13/s6kDDKnG5ot6ArDtR1ANNNIMt6GFaQk+ozqOLqwq83fuMMQ
         6dCWf/g6NOIvZaeW1nE4jjwCjwXVwTdYEFCkjPHe4iN2xOZUYmJ11TRt52ectXegGd+V
         asLKIP0li+Se/qcGJLp1USf9MpA/POPc9RF2CUiUwNiI+Z7smlYyw5P5IqLDwLxMjjlo
         rvMg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b="cnjg9/o3";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id e63-v6si514626qtb.5.2018.06.21.11.10.37
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 21 Jun 2018 11:10:37 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b="cnjg9/o3";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:57047 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fW42W-0006Mg-JW
	for alex.bennee@linaro.org; Thu, 21 Jun 2018 14:10:36 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59434)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fW3vC-0000gc-TH
	for qemu-devel@nongnu.org; Thu, 21 Jun 2018 14:03:06 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fW3vC-0006dy-9U
	for qemu-devel@nongnu.org; Thu, 21 Jun 2018 14:03:02 -0400
Received: from mail-qk0-x22b.google.com ([2607:f8b0:400d:c09::22b]:37051)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fW3vC-0006dt-5c; Thu, 21 Jun 2018 14:03:02 -0400
Received: by mail-qk0-x22b.google.com with SMTP id j12-v6so2260030qkk.4;
	Thu, 21 Jun 2018 11:03:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=qye9mbQZXI6hIS6hiPWJ+dp36BJWQL8i3rGz3aurZ+o=;
	b=cnjg9/o3yJxdD0jBvXXoqZAx3HWzyZd03Fqs+HyZlroJXA5Y/a8C3IEmOspY+c9Mz0
	DzCHT+qVne/aZm2nD1Zi5yzKvt+RwCyBgYU6gLFt1HuqEa2vo2MxxvBWwwheU9PA1iTo
	a44+6SlDdCLnmPyaemzJB8dHCuTTC/U+tIO/XfqeHw+LdsA0AxaOpKrHxoDaWbeWFH9E
	HiIvTVlvQla6rrKJGj7olH+HOUvM04T0cR5tWNfrQvYQYVSAnMAK4KjspfKsCvXuAU+X
	oqXg/8kVjJoSiNyhCkh0+FeF6S0tPfpn9rTzGDQhHNps2Md76KNB1HkU19q1+BfwOrMP
	/mTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=qye9mbQZXI6hIS6hiPWJ+dp36BJWQL8i3rGz3aurZ+o=;
	b=bfFSiJ154MebAsm7J0/+H/j8Mus/dwMjSTf+GHPExPOEuTPgwNiaomzHor/A46eJBU
	5NL0veBktFr2Q7HZfGdgqwSTvOSW9LWPnMcENeLJZsXJmEGZ5B1YY6uFccFAbVRS9w12
	Vrdksf6rpnzXrvuEtTJu37DVIdJijgKweEiYlNr/n1bOoeC7PLxM1y9Zes2JMJQmTqRZ
	Zh6NY5AmMQwlmGAJldfumBQat/9Qp0etZxMkaMmFpHtOFR3FctAEt2jfMWve5zUw/CWJ
	KikA08+k0MsGfSZqOAno40vkK2MOAoAiTIAk0RhdyTRiZw7MfflUT92h4+aRfZv8Kt0B
	xc8g==
X-Gm-Message-State: APt69E2/ugnz4jIpzRF12t2hHKKfXPyrv+h7f+QcIbFAQCikMIBi7HP2
	tbMoGTEJ+P2NuDiwWcbPZskJyKVv
X-Received: by 2002:a37:ab04:: with SMTP id
	u4-v6mr21542984qke.92.1529604181552; 
	Thu, 21 Jun 2018 11:03:01 -0700 (PDT)
Received: from x1.local ([138.117.48.222]) by smtp.gmail.com with ESMTPSA id
	w51-v6sm2469469qta.12.2018.06.21.11.02.59
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 21 Jun 2018 11:03:01 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 21 Jun 2018 15:02:22 -0300
Message-Id: <20180621180224.8312-10-f4bug@amsat.org>
X-Mailer: git-send-email 2.18.0.rc2
In-Reply-To: <20180621180224.8312-1-f4bug@amsat.org>
References: <20180621180224.8312-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::22b
Subject: [Qemu-devel] [PATCH 09/11] hw/arm/stellaris: Use
 qemu_log_mask(UNIMP) instead of fprintf
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
Cc: qemu-trivial@nongnu.org, qemu-arm@nongnu.org,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 1sdyR7xoLso7

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/arm/stellaris.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/arm/stellaris.c b/hw/arm/stellaris.c
index a8f1f6a912..d06e366402 100644
--- a/hw/arm/stellaris.c
+++ b/hw/arm/stellaris.c
@@ -560,7 +560,7 @@ static void ssys_write(void *opaque, hwaddr offset,
     case 0x040: /* SRCR0 */
     case 0x044: /* SRCR1 */
     case 0x048: /* SRCR2 */
-        fprintf(stderr, "Peripheral reset not implemented\n");
+        qemu_log_mask(LOG_UNIMP, "Peripheral reset not implemented\n");
         break;
     case 0x054: /* IMC */
         s->int_mask = value & 0x7f;
-- 
2.18.0.rc2

