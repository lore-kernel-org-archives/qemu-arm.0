Received: by 10.25.159.131 with SMTP id i125csp158120lfe;
        Tue, 6 Dec 2016 20:31:42 -0800 (PST)
X-Received: by 10.55.42.5 with SMTP id q5mr63067316qkh.268.1481085102592;
        Tue, 06 Dec 2016 20:31:42 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [208.118.235.17])
        by mx.google.com with ESMTPS id l1si13505932qtl.293.2016.12.06.20.31.42
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 06 Dec 2016 20:31:42 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) client-ip=208.118.235.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:36318 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1cETtO-0005RS-2c
	for alex.bennee@linaro.org; Tue, 06 Dec 2016 23:31:42 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58367)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <rth7680@gmail.com>) id 1cETtF-0005O9-5v
	for qemu-arm@nongnu.org; Tue, 06 Dec 2016 23:31:34 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <rth7680@gmail.com>) id 1cETtE-0006be-B9
	for qemu-arm@nongnu.org; Tue, 06 Dec 2016 23:31:33 -0500
Received: from mail-qt0-f195.google.com ([209.85.216.195]:33634)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <rth7680@gmail.com>)
	id 1cETt8-0006ag-C2; Tue, 06 Dec 2016 23:31:26 -0500
Received: by mail-qt0-f195.google.com with SMTP id n6so43049070qtd.0;
	Tue, 06 Dec 2016 20:31:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=FA1FrrdNgHQtXBP+6eyKElAb5GWINHDB94AwtYdCsBg=;
	b=Hb29aKBepP6m5OfrNPToTxG4xD0X2q2nMy+xYCS6RaEJBkRRSDTcjH8hdhOjz8wrNq
	yTMzrCwID5SaaPR1eSH/Jlu5JfEnvdnKO62zyUpp7hj0sOYA5dERKEy5GTrelWKKUQxY
	rYhv1Wk7/o9NEEdGGPhYRg5+SUDn5iasx3YOtp1Ra8JktpIk3dAWrew5WLilhatPGdXL
	QlVwS9ZgHy+hLLOGLk9Zp1B1VCsBHQi7KJrtzmCalj1hjrbpMabnoly6wOQVq6Ai8HKO
	fm4DKomzg8VFjAgn6RzoEcnpxQmlI2EdvU50EjsBA7ZzkziW/NVRD9qhu1mgODkO9LWQ
	wjCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references;
	bh=FA1FrrdNgHQtXBP+6eyKElAb5GWINHDB94AwtYdCsBg=;
	b=CSdMl80cp+dgjIyTnKfB4LFGaA460d5S30v38tCjC3E/eeuHBZ5ALnM12Jr3M1whL4
	NWcFSdbcBMQ6l27gk1F7EtM/0pXbSPuen8/quWyrKPFIOuhLNnbLbqRtQr6dw+z+B3cT
	7+/l3vmUtExunwGd3iTCnpNHvuCuRQNN4pUGjpIlky0Qd1fYjpk3DRNfH995DTj30Vk2
	rFrhJUBP7yw4FqgjBZUBxZHDzoMP5rPc9qU4//p3efXU4H+nEcVkoLgimDvVfCVm5N8l
	03whcc3Nm7jXlIU7lzrLTmkeTDtbzzbufXes7i/tXlMFv3KvnSvkzEM7VHEnf9n+x/Ga
	4MjQ==
X-Gm-Message-State: AKaTC00RJLiUjxEXrDNEKo4TefEERky65Y+GhdLr1Qq+c0ilUR5e1Fp3CPMY/aPMuw0SJw==
X-Received: by 10.200.52.138 with SMTP id w10mr56231311qtb.49.1481085025808;
	Tue, 06 Dec 2016 20:30:25 -0800 (PST)
Received: from bigtime.twiddle.net.com
	([2602:47:d954:1500:5e51:4fff:fe40:9c64])
	by smtp.gmail.com with ESMTPSA id
	i41sm13911947qtc.18.2016.12.06.20.30.24
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 06 Dec 2016 20:30:25 -0800 (PST)
From: Richard Henderson <rth@twiddle.net>
To: qemu-devel@nongnu.org
Date: Tue,  6 Dec 2016 20:30:19 -0800
Message-Id: <1481085020-2614-2-git-send-email-rth@twiddle.net>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1481085020-2614-1-git-send-email-rth@twiddle.net>
References: <1481085020-2614-1-git-send-email-rth@twiddle.net>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.216.195
Subject: [Qemu-arm] [PATCH 1/2] target-arm: Fix aarch64 vec_reg_offset
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
Cc: qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 1m31n+G2lc37

Since CPUARMState.vfp.regs is not 16 byte aligned, the ^ 8 fixup used
for a big-endian host doesn't do what's intended.  Fix this by adding
in the vfp.regs offset after computing the inter-register offset.

Signed-off-by: Richard Henderson <rth@twiddle.net>
---
 target-arm/translate-a64.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/target-arm/translate-a64.c b/target-arm/translate-a64.c
index 6dc27a6..ef7601b 100644
--- a/target-arm/translate-a64.c
+++ b/target-arm/translate-a64.c
@@ -527,7 +527,7 @@ static inline void assert_fp_access_checked(DisasContext *s)
 static inline int vec_reg_offset(DisasContext *s, int regno,
                                  int element, TCGMemOp size)
 {
-    int offs = offsetof(CPUARMState, vfp.regs[regno * 2]);
+    int offs = 0;
 #ifdef HOST_WORDS_BIGENDIAN
     /* This is complicated slightly because vfp.regs[2n] is
      * still the low half and  vfp.regs[2n+1] the high half
@@ -540,6 +540,7 @@ static inline int vec_reg_offset(DisasContext *s, int regno,
 #else
     offs += element * (1 << size);
 #endif
+    offs += offsetof(CPUARMState, vfp.regs[regno * 2]);
     assert_fp_access_checked(s);
     return offs;
 }
-- 
2.7.4

