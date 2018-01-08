Received: by 10.28.173.206 with SMTP id w197csp2638660wme;
        Mon, 8 Jan 2018 08:09:41 -0800 (PST)
X-Google-Smtp-Source: ACJfBosUGihV2AXbs5PyIxvTN8SDRHfI2gnULr8OQ5ibheiBVqfIj6kBznKyLetaTYk6ybl+wJZB
X-Received: by 10.37.186.71 with SMTP id z7mr11649751ybj.438.1515427781135;
        Mon, 08 Jan 2018 08:09:41 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1515427781; cv=none;
        d=google.com; s=arc-20160816;
        b=RZWE6k5sPWg4UW9UM3zJ6mi9baY5ObsML5k6dpMg17K/tUwLYKCT6MhufqasfO50Ho
         qNa7QvT7QKQVB42zVFDoeRZg5XmikvXhprOeliaOxunyDIAePUEip4FX0reCZeS+YV79
         ulXVqcfZuS4hwnhxVV7mSgy2sQbn2o3ebcsALs/SOMTg1ldbyOgJHYy4EiWs4udAhF1a
         +jErSOGgtFfPt/YaBSvRJW3HqK3QdW2BffwouQB6vk0NcVwCPyVQZMuECYHE0PTOY+2p
         +rbfrYm2mrw6RmK5S+8bMgc8NKKB2QDtaTG7MPpMsq7CqAsyYZLvUPeYQgStrztX+2iW
         j0kA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=qs+EJ2CmI/mNE1M/GPWrrMlCCZshfb9QWG1+yPga2fA=;
        b=k5MREwg+k+rZd3AcMv/CIsQdkLU8esFI+eVRnCwxVsR66EZdbHSfteHDwsBlQAKvGo
         phaKwpxVN1JFxkBqJxtld9IWej/IfQizMK83w8fXGlbnhx+D6s4fgMtMKn5aAkyqdPc0
         Dmx9xcPcSWuh77QKhVKLxdMwZAhVr8eqZ2KRiNmzB03nkgcwvs2jPlZHllhlb+CD1eTx
         3jTTqbu1S7BKRZoXzjBHgcEA4RkJ8KyUBR2QK47qC+3BC7sJcyN6elApSX/eA/VBFU4Y
         P1s/12SbN2C10TgenTeHwyeKhyrYsQhGgnhoxK6CwT7JBtaGMJVMttt0o6V8Xw6IaWiW
         K5Dg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=i2SJTb8y;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 189si2507558ywc.70.2018.01.08.08.09.40
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 08 Jan 2018 08:09:41 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=i2SJTb8y;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:41743 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eYZzY-00078i-Dn
	for alex.bennee@linaro.org; Mon, 08 Jan 2018 11:09:40 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43043)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1eYZcg-0003Tv-Sa
	for qemu-devel@nongnu.org; Mon, 08 Jan 2018 10:46:06 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1eYZcg-0000eG-3M
	for qemu-devel@nongnu.org; Mon, 08 Jan 2018 10:46:02 -0500
Received: from mail-qk0-x243.google.com ([2607:f8b0:400d:c09::243]:33795)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1eYZcf-0000dq-VJ; Mon, 08 Jan 2018 10:46:02 -0500
Received: by mail-qk0-x243.google.com with SMTP id b76so1780442qkc.1;
	Mon, 08 Jan 2018 07:46:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=qs+EJ2CmI/mNE1M/GPWrrMlCCZshfb9QWG1+yPga2fA=;
	b=i2SJTb8yGE2rjp1B0j2QAwFeoMYsuHTsbGKbvUix5ubGFQ6U0voeqIclyz/Wi7+DlH
	tHIgfKXweWiII7OBWmqlkEgV/09ieVE6FiRPsTX+EYnl4FVq9iZUZQ82GeDm5sveJdKF
	nmfL0moOMcxeJM2k4PIh/XbjibzBmm3zUD+WR6l1/IqSl+0ekNM2ASLuWooehJBsqs1K
	l/sdR1uOU5RTnqfXeh+hHDiTm6Vj9kU8xAxJXkBCBGYf1TOgfk/uQPlOvVAkwHe1hqVU
	qUSHxeRdb0WWpyEe7p1as18Z2tKxIq4NoVpsRLKtx9lpb9m5pZDQJSVjVKs2qqowYpWA
	ul3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=qs+EJ2CmI/mNE1M/GPWrrMlCCZshfb9QWG1+yPga2fA=;
	b=ISqAtmVbKIJEJV5WlhZyyVt6Spmb66yLKfWupjNa4KjXHjgh2miGx5WYbeLVJN5ghy
	hQzqSun37i1uiJbEI61EjvZkcI4HEj9X3K57QVMsJDRhXghHU10e6B9+w4YZ4Vil63f8
	5FJl9ffA0DYUBVcBxQnpAFybQfVST3CoKXD+TTUVtJpgrQretF4ai1CKklP0aPwTCDbi
	U5IX8hnyvqQ/C0V9OgL/sChJZYh6FdK9VlcTMpNMFUw02+zb1QxoAqCZFvaWybYXdL1i
	eOrUC4Cub0hlVHnBJoN5J+eCGo27IfsGkiChJd5WM9R8qTzaN0+WGj7JnV82ZrNmhVM5
	S+yw==
X-Gm-Message-State: AKwxytdNxLxFyjaPpiQjrZXzcC6Ppebu/82RCN2n9EDlcaXyGcy5OSZp
	1XTsYX7X4+ODj5dBQrFGiKM=
X-Received: by 10.55.25.146 with SMTP id 18mr15893335qkz.214.1515426361441;
	Mon, 08 Jan 2018 07:46:01 -0800 (PST)
Received: from x1.local ([138.117.48.219]) by smtp.gmail.com with ESMTPSA id
	u36sm7832382qtc.58.2018.01.08.07.45.56
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 08 Jan 2018 07:46:00 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Alistair Francis <alistair.francis@xilinx.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Andrey Smirnov <andrew.smirnov@gmail.com>,
	Igor Mitsyanko <i.mitsyanko@gmail.com>
Date: Mon,  8 Jan 2018 12:43:03 -0300
Message-Id: <20180108154303.6522-32-f4bug@amsat.org>
X-Mailer: git-send-email 2.15.1
In-Reply-To: <20180108154303.6522-1-f4bug@amsat.org>
References: <20180108154303.6522-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::243
Subject: [Qemu-devel] [PATCH v5 31/31] sdhci: add Spec v4.2 register
 definitions
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
Cc: "Edgar E . Iglesias" <edgar.iglesias@xilinx.com>,
	Prasad J Pandit <pjp@fedoraproject.org>,
	=?UTF-8?q?Gr=C3=A9gory=20Estrade?= <gregory.estrade@gmail.com>,
	qemu-devel@nongnu.org, Peter Crosthwaite <crosthwaite.peter@gmail.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Jean-Christophe Dubois <jcd@tribudubois.net>,
	Sai Pavan Boddu <saipava@xilinx.com>, qemu-arm@nongnu.org,
	Clement Deschamps <clement.deschamps@antfield.fr>,
	Andrew Baumann <Andrew.Baumann@microsoft.com>,
	Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: BCecreynaJ6p

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/sd/sdhci-internal.h | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/hw/sd/sdhci-internal.h b/hw/sd/sdhci-internal.h
index 1da91a27b4..8193aa1821 100644
--- a/hw/sd/sdhci-internal.h
+++ b/hw/sd/sdhci-internal.h
@@ -191,6 +191,10 @@ FIELD(SDHC_HOSTCTL2, V18_ENA,          3, 1); /* UHS-I only */
 FIELD(SDHC_HOSTCTL2, DRIVER_STRENGTH,  4, 2); /* UHS-I only */
 FIELD(SDHC_HOSTCTL2, EXECUTE_TUNING,   6, 1); /* UHS-I only */
 FIELD(SDHC_HOSTCTL2, SAMPLING_CLKSEL,  7, 1); /* UHS-I only */
+FIELD(SDHC_HOSTCTL2, UHS_II_ENA,       8, 1); /* since v4 */
+FIELD(SDHC_HOSTCTL2, ADMA2_LENGTH,    10, 1); /* since v4 */
+FIELD(SDHC_HOSTCTL2, CMD23_ENA,       11, 1); /* since v4 */
+FIELD(SDHC_HOSTCTL2, VERSION4,        12, 1); /* since v4 */
 FIELD(SDHC_HOSTCTL2, ASYNC_INT,       14, 1);
 FIELD(SDHC_HOSTCTL2, PRESET_ENA,      15, 1);
 
@@ -219,12 +223,16 @@ FIELD(SDHC_CAPAB, DRIVER_TYPE_C,      37, 1); /* since v3 */
 FIELD(SDHC_CAPAB, DRIVER_TYPE_D,      38, 1); /* since v3 */
 FIELD(SDHC_CAPAB, TIMER_RETUNNING,    40, 4); /* since v3 */
 FIELD(SDHC_CAPAB, SDR50_TUNNING,      45, 1); /* since v3 */
+FIELD(SDHC_CAPAB, CLK_MUL,            48, 8); /* since v4.20 */
+FIELD(SDHC_CAPAB, ADMA3,              59, 1); /* since v4.20 */
+FIELD(SDHC_CAPAB, V18_VDD2,           60, 1); /* since v4.20 */
 
 /* HWInit Maximum Current Capabilities Register 0x0 */
 #define SDHC_MAXCURR                   0x48
 FIELD(SDHC_MAXCURR, V33_VDD1,          0, 8);
 FIELD(SDHC_MAXCURR, V30_VDD1,          8, 8);
 FIELD(SDHC_MAXCURR, V18_VDD1,         16, 8);
+FIELD(SDHC_MAXCURR, V18_VDD2,         32, 8); /* since v4.20 */
 
 /* W Force Event Auto CMD12 Error Interrupt Register 0x0000 */
 #define SDHC_FEAER                     0x50
-- 
2.15.1

