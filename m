Received: by 2002:adf:efc1:0:0:0:0:0 with SMTP id i1csp105171wrp;
        Mon, 11 Feb 2019 15:56:28 -0800 (PST)
X-Google-Smtp-Source: AHgI3IZmUW3NxAntnMxXIzE0YBPnzhg3eC2mcsbo2hRwn2PFsFwaUnn7srfycl/+pRL/gnJL4FXs
X-Received: by 2002:a25:4504:: with SMTP id s4mr702004yba.40.1549929388510;
        Mon, 11 Feb 2019 15:56:28 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1549929388; cv=none;
        d=google.com; s=arc-20160816;
        b=UnI/XJcv5qBTHfcAaDYmM1p2NCEet6fdkx/NjPY0jfwpT7ien/u1PCbdFr7m0lF/Fl
         UckimAIcy94XiTrHl/wdV7HUKSeMh1kavfPhHeO+2SQJgSTJyKIS3+x/QOpbXS5Pvkvj
         W4VtpAN7NV8nCuHGrSkoWIUaA1EfyMVIUIMTHD2hLjlFxMRevOer0qFPqdHMgW54+uRT
         y6lIFW1226Oa2R3WfV7hBzqmvbRh1aM74ZU6QMdTuApduQvcPNXR73Mk1MB56wJUZerK
         8h1NJMXsv/dsID2+zpO8wqsinlmOhVvxw/sJSFAVBaMiTu3Ai8g0vvX5PnFmIy5L4alY
         403Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature;
        bh=CY+4xvY3XNlng3h4IyHhGPUmeyAfX1LC7tzqEoCASgM=;
        b=vja7/ftWne9dEudhULcOzu0M0C5DtHjasGp93cLpQ0vwrRyMb1/dhhTU6xFZ2KmGv7
         kq9SC/88LMLcLiGGB6F3WEy3nS5iW1p0A4SpS/VdHDoUtxl0OGZflvqr0yXFGIm/fuTa
         cExlIdJgOeT4/pzhOK0G7MroHfWfpzCL+YVPW+a3MthwaP4Hy8Fz5uS/Joz0nuus5Q5U
         apAcmgfRKdfcg90zGM/m7TYHD+QrVIawJXjzdJI8UwlcZ0fiMc+TgWj+zYVSxrH5wnm2
         hbe0gaGg6udM9M84gbxPlZYxBtfqRnfY8HlT1VPhYfljHEGsjiQGZEzWA4h5XT7pzeNh
         s1rg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=RwX2IXIE;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a7si6814040ybp.2.2019.02.11.15.56.28
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 11 Feb 2019 15:56:28 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=RwX2IXIE;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([127.0.0.1]:58170 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gtLR6-0007Jv-08
	for alex.bennee@linaro.org; Mon, 11 Feb 2019 18:56:28 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38152)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1gtLOG-0005Qz-UW
	for qemu-devel@nongnu.org; Mon, 11 Feb 2019 18:53:33 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1gtLOE-0004b8-OL
	for qemu-devel@nongnu.org; Mon, 11 Feb 2019 18:53:32 -0500
Received: from mail-pg1-x544.google.com ([2607:f8b0:4864:20::544]:45171)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1gtLOD-0004Ws-3v
	for qemu-devel@nongnu.org; Mon, 11 Feb 2019 18:53:30 -0500
Received: by mail-pg1-x544.google.com with SMTP id y4so303154pgc.12
	for <qemu-devel@nongnu.org>; Mon, 11 Feb 2019 15:53:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=CY+4xvY3XNlng3h4IyHhGPUmeyAfX1LC7tzqEoCASgM=;
	b=RwX2IXIE9pP7AR32yyLnvo4a7nXLJ6sT8TpjpJUkGzgZMFVfPXeQUTdkWdl8k6G5HV
	O0jSPVQ3Lnwd4Ude4PhfGRFJ7ZU7HhV5C/TUEoSNYavFnugJsg4VEffIpjHvo4bMujqp
	v0IBg8qLJQXFjFIn3t+QjzORcecStCEuujY5YNqGwdRnhfsPAWSX1dWQBuHfDpxM2SOv
	/uk+GwJ7k+Mg3VcIVfg0Qn0J8sCxrJ5xofQoN6HKijUYAnaMFuRckK4zAC/TnNILFyPX
	XMyjuK9h33VwTY1jH+q2kBy4lVjHu2pevwEJGkH2aJGvad9uxhDRNDUnjhl3HH6xC4V8
	wzUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=CY+4xvY3XNlng3h4IyHhGPUmeyAfX1LC7tzqEoCASgM=;
	b=kPDCnelleEYjaHPmjPLpjCRtTpRQ1RNvVCtnmtiXf0frAhVm3jj0HH/Uc+ynRKuBH5
	+9juU7rnX0kyzs/J95D+oP1pcHOTnP2bHTnXGwZE7rVpxRyJH1svZk26YSQLAYp7KIVa
	+9ur3veGO5xQvJDAxRRm8nTWxjs8SadQKj88y9VdSMlgH2in+a5IooTHEXSAkrhBkdM0
	5Xm1FTJc5kV/0RfZh8JYgPRG4Um2erH3gmqyoaXRYxWmspZxqvn6yahTmB36zfoz+7+R
	v0TUV3ycxcDOqRNdct0D972a9sZhRxY7f8P4TRS4ajUpzsQr5g3w1mh3ELZsBZclosEA
	2loQ==
X-Gm-Message-State: AHQUAuYplxn6R/MTCxvtMXPygRq0J5oaE4U6l8fL0HHNpu8LFT4kPIAS
	PO6jrvXouvhs1WuNTtmgNmIYjrqOBtc=
X-Received: by 2002:a63:2a86:: with SMTP id q128mr844907pgq.424.1549929206183; 
	Mon, 11 Feb 2019 15:53:26 -0800 (PST)
Received: from cloudburst.twiddle.net (97-113-188-82.tukw.qwest.net.
	[97.113.188.82]) by smtp.gmail.com with ESMTPSA id
	c4sm11861031pgq.85.2019.02.11.15.53.25
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 11 Feb 2019 15:53:25 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Date: Mon, 11 Feb 2019 15:52:49 -0800
Message-Id: <20190211235258.542-20-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.2
In-Reply-To: <20190211235258.542-1-richard.henderson@linaro.org>
References: <20190211235258.542-1-richard.henderson@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::544
Subject: [Qemu-devel] [PATCH v3 19/28] target/arm: Clean address for DC ZVA
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ZHdfc6eCCFOm

This data access was forgotten in the previous patch.

Fixes: 3a471103ac1823ba
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate-a64.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index b97af372f0..9e7afa571d 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -1815,7 +1815,7 @@ static void handle_sys(DisasContext *s, uint32_t insn, bool isread,
         return;
     case ARM_CP_DC_ZVA:
         /* Writes clear the aligned block of memory which rt points into. */
-        tcg_rt = cpu_reg(s, rt);
+        tcg_rt = clean_data_tbi(s, cpu_reg(s, rt), false);
         gen_helper_dc_zva(cpu_env, tcg_rt);
         return;
     default:
-- 
2.17.2

