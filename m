Received: by 10.223.161.27 with SMTP id o27csp229919wro;
        Mon, 23 Oct 2017 13:11:56 -0700 (PDT)
X-Received: by 10.129.125.68 with SMTP id y65mr9193243ywc.191.1508789516746;
        Mon, 23 Oct 2017 13:11:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1508789516; cv=none;
        d=google.com; s=arc-20160816;
        b=nPe+Dn98EUjge/TQSNTIRPDQDtcyefGQ/Gsxm4XqN1+6n/u4RWiqp/5HU0iDh+ls8A
         sLny92zdm7EjxUqN4z0cYVi2dc6i/uRCPSdU12Iu8h+yUL7VGplMXGZ0RJUOzR4D0Tsz
         TXekbbtrG30G5sZZzALvGNv3jcv4TIrPQPEZz/C7rOF1Kdhmm9HE2F6tgkC/Buj6KcVb
         p0MOZJ209AB9r/02OCNpa5ZMzAnCQQroZAK5f9YaNzEAw3ZoZXDQP//c04oisasYju/r
         aNfKL8TvtS+Ng3Hxk/97BZ8laACGucgd8uqDlUxQUISPQtsIKCgBRbHG9PPcluZC4r8q
         nusQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=xnqBi/NrNQWv2EkLEjjv4DKMlIxiaS1iGRV2nOqWKr4=;
        b=I6rmHl2tlPvqFyMU7vEKOHJ4lpBg/vmAap5Cy67ZjVwMEuwOn7+jAQUiodgc46rzLC
         u9Q7jFCvBRy5b8Xh+E1rTPKQxarq5pbLmpddzcKbTMIXi3Zbgf6Y9ckFRVCDqcMtKYEs
         0785JGG6F/TBkH3L/86a4zaD0J1zgLmehma8uekI8yHt0S2VsjUCbEdfrvr6piDLeIzw
         4mwvwI1pJ92Ca/ku7hWackbkaTevEXP8CrG14NsDYSyOaMWrFa2F0f+vFjwEMe+ERpfj
         f1/59G1cEuF7AuJdmAEwyR1m7p/881aMUf/d8tN6kSW0QT50Sn7nKPUACS9rbLU9judC
         uxog==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=dY7YfMdC;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id q9si1326491ybf.624.2017.10.23.13.11.56
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 23 Oct 2017 13:11:56 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=dY7YfMdC;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:40374 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1e6j4m-0000VU-3P
	for alex.bennee@linaro.org; Mon, 23 Oct 2017 16:11:56 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46084)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <andrew.smirnov@gmail.com>) id 1e6j4E-00007n-8E
	for qemu-arm@nongnu.org; Mon, 23 Oct 2017 16:11:23 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <andrew.smirnov@gmail.com>) id 1e6j4D-0002Sq-D9
	for qemu-arm@nongnu.org; Mon, 23 Oct 2017 16:11:22 -0400
Received: from mail-pf0-x241.google.com ([2607:f8b0:400e:c00::241]:54594)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <andrew.smirnov@gmail.com>)
	id 1e6j4D-0002SO-8V; Mon, 23 Oct 2017 16:11:21 -0400
Received: by mail-pf0-x241.google.com with SMTP id n89so17894991pfk.11;
	Mon, 23 Oct 2017 13:11:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=xnqBi/NrNQWv2EkLEjjv4DKMlIxiaS1iGRV2nOqWKr4=;
	b=dY7YfMdCE7CC2ggtYfepRMLy5YHEguXATbN7uv92dpf3MKZODUZn6lv2mhOk0CEzR9
	8aUu6vnUkwajIazJkN8r+EU7KRKyNSddkLU2B2ZqgW2eP0LP/yysdQ3I9aaWVa/bIFgj
	qYAVlC5qAv1vJDMfaBmDOlZm05eq5c4Ob2w9DGjE9Rs3iUuG+jK031DOp7LmRTckL2GQ
	kIgydPiSqNpQuGD7ILe7F2c6SgSqI2lL29Os091e+4CoWkXlsIn/fkGKrKwPbmXliLUz
	ulGinrQcnFdPJ/3on/sbSxP251YminrkrP5OE7VgtG6YkHyAPFsMAU7wY/mwXk848whc
	WWcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=xnqBi/NrNQWv2EkLEjjv4DKMlIxiaS1iGRV2nOqWKr4=;
	b=UkrPwt0uDq7ipFEPhmxUWEby0NSJPVLhKKj92Mz285J3NJuKS+FmoBY4rJhTlkfStD
	Bhy2BVxZ22elq6jNzEvOqnQEJ1wVId74nuSORjAaKF/SPP46d4SB/HbB5v7xkfaOlJVT
	/nLZSpdiL8agwiEzv2MhU2f0Kfz8Npy3QNdXbpbcM/JVZkzAwtEHQgh4ODp4YebELyXj
	sv0ysr9jREiTVR7NKvwkmbGnspvnGdSpiO2HWXKVSMRcXvBxn07zDgRdbgxpOyHstHCh
	Q466/mbErhLguT/kDDU7PM9XarP4tKx5Ap+ShiHfki9g/PnZUNdApkigBiEo/EBE+k1f
	to/A==
X-Gm-Message-State: AMCzsaUVOmqDMCGykfwd91a+yqJsi0dczzn7/4X+ijc/zROOgWmQtB1T
	XLqVsb7VJVzXjOqo77kmvuzqtiAi
X-Google-Smtp-Source: ABhQp+Spoxm7ctlxyRBfQ+Fjlo4W5CXpdgF9pKX4VWNWgqJgOZzPuhFJZQ+iPsgD5NeoDzR5upa4Cg==
X-Received: by 10.99.107.6 with SMTP id g6mr12787263pgc.215.1508789480186;
	Mon, 23 Oct 2017 13:11:20 -0700 (PDT)
Received: from squirtle.westlake.spaceflightindustries.com ([173.226.206.194])
	by smtp.gmail.com with ESMTPSA id
	j1sm15181623pfj.108.2017.10.23.13.11.19
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 23 Oct 2017 13:11:19 -0700 (PDT)
From: Andrey Smirnov <andrew.smirnov@gmail.com>
To: qemu-arm@nongnu.org
Date: Mon, 23 Oct 2017 13:10:33 -0700
Message-Id: <20171023201055.21973-6-andrew.smirnov@gmail.com>
X-Mailer: git-send-email 2.13.5
In-Reply-To: <20171023201055.21973-1-andrew.smirnov@gmail.com>
References: <20171023201055.21973-1-andrew.smirnov@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c00::241
Subject: [Qemu-arm] [PATCH v2 05/27] imx_fec: Use MIN instead of explicit
 ternary operator
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Andrey Smirnov <andrew.smirnov@gmail.com>,
	Jason Wang <jasowang@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, yurovsky@gmail.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 1Wffc3xp2gpb

Cc: Peter Maydell <peter.maydell@linaro.org>
Cc: Jason Wang <jasowang@redhat.com>
Cc: Philippe Mathieu-Daudé <f4bug@amsat.org>
Cc: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Cc: yurovsky@gmail.com
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>
---
 hw/net/imx_fec.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/net/imx_fec.c b/hw/net/imx_fec.c
index dda0816fb3..18de508e8c 100644
--- a/hw/net/imx_fec.c
+++ b/hw/net/imx_fec.c
@@ -1076,7 +1076,7 @@ static ssize_t imx_enet_receive(NetClientState *nc, const uint8_t *buf,
                           TYPE_IMX_FEC, __func__);
             break;
         }
-        buf_len = (size <= s->regs[ENET_MRBR]) ? size : s->regs[ENET_MRBR];
+        buf_len = MIN(size, s->regs[ENET_MRBR]);
         bd.length = buf_len;
         size -= buf_len;
 
-- 
2.13.5

