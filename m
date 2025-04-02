Received: by 2002:a17:504:17d6:b0:1be9:327d:8ee3 with SMTP id o22csp3462201njd;
        Wed, 2 Apr 2025 06:53:14 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVCDgoVJlMrkXribGbI3ej3UGzPgxTPeKBKROoVUIKqq90OxQCNSb98g2qZITLKl5MqKo3RJ+bfcCg6XA==@linaro.org
X-Google-Smtp-Source: AGHT+IFZKa4ATPJ2ycW7vNIq+T5THvnvtCte3uZZcbHG35TOPTjVXtmayS1uj5CbAhpylEswEdei
X-Received: by 2002:a05:620a:1921:b0:7c5:59e1:f0d with SMTP id af79cd13be357-7c7664c1f97mr346892785a.39.1743601994210;
        Wed, 02 Apr 2025 06:53:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1743601994; cv=none;
        d=google.com; s=arc-20240605;
        b=f3sGTKrq3QQHKzEMgQBK/s9KUPtgBTHH0caU3E9M9y0H2Sltc0Eo6gqSJcV1KEd0gq
         G2Hd7HLKFqHevejN7phm0ei62d7gwvwM8AMJ99X8VVpRu/314CBDGkOmKztmW+3Xacjw
         Ntnp9v0/8/Cj6ogZbSG6nr/jONbLyxu+g7LjWztMOJ/X0hMJndwXp7qA4GAzbCund5yJ
         WXHvsTcumBii/mfUxBZlsLjKqsj9sZr3CqcFGH8GfBsczx0A6WTDJtH3N4XdE8GPPSVD
         m3fD/6E4q05s7p5SYlkig3xUVPX0x4u5HwZPg2bWy6kl0IYA5QfNUlbLoNbpfp8ByxRG
         YZVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=lkXiGighcJ8+bbnijQikkTSQRXMcE6kockK6lex7Is8=;
        fh=5y3keCLtsD5SnVtO9H4HEGBM2WO3bexKZtwkNvJJEt8=;
        b=MXbQ9N9/V9OU43KWDAP7r/2htBMs8F8sdKoSdQIuDgt4nsLKpRV2MOKeQ7xfjLqynU
         w9CnCUMIV+PZKMfIMUw3vYSwl8x6jPXI68MAK2p/3hrrWuYAvjqP/Zk6mPPDQdl+zXAz
         rn6C6o9Ret0Vj7JTGxTGWQ/7ZzligzCf7KvKJ1GD8prM136veRkUjIJ2uV5t1uvIkjpc
         tEpwemRiLq27uni2OgNqLTTvmHswlwvPaDFp7VaGCkqLAM8ueiZFk9oMmfyzJNef4+9M
         gunwIfPwmqmKpzyTh8HPNeR/TLSfxXUU+UmivZrdGoH2ml/eLZ7wD2ksSHdYGVYMR56Z
         xwDg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@ynddal.dk header.s=sig1 header.b="g+8/Bl2W";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7c5f7681e5fsi1116819585a.81.2025.04.02.06.53.14
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 02 Apr 2025 06:53:14 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@ynddal.dk header.s=sig1 header.b="g+8/Bl2W";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tzyWc-0000Sf-M7; Wed, 02 Apr 2025 09:53:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mads@ynddal.dk>) id 1tzyWQ-0000FZ-Nd
 for qemu-arm@nongnu.org; Wed, 02 Apr 2025 09:52:54 -0400
Received: from qs51p00im-qukt01072502.me.com ([17.57.155.15])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mads@ynddal.dk>) id 1tzyWK-0004d9-Ue
 for qemu-arm@nongnu.org; Wed, 02 Apr 2025 09:52:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ynddal.dk; s=sig1;
 bh=lkXiGighcJ8+bbnijQikkTSQRXMcE6kockK6lex7Is8=;
 h=From:To:Subject:Date:Message-ID:MIME-Version:x-icloud-hme;
 b=g+8/Bl2W3l7pJlrCmu1jZ0TXPnWGHNRw/xE2ZGeirc2TLbDor1s7ez96SNLOn0LdG
 lPys7hVOlv/V0p+8ZQISV549Ic273ySbjm5GVyq4JMm7FPWezdt8G9fnLrYyprTGQw
 Sk+XrSK7x+5UaqCEhTvRl8E76V8KL+5AApayNlbvKKWpy4ILzbxzjlYIVbN6ADJEI5
 eeR0Mdu0IvyXGD0h6ZcuUxpxVSXGq0kZfkQbY4/lHaH280x6ojgAarYBisGa2Hv3gj
 /N96CsaCY2eb+SANcigIqVVb1uNw9WlV9vty7ccW2ZPD9wlLsomTissF23c0ydqHXW
 H2nQCaPsoAbPQ==
Received: from localhost.localdomain (qs51p00im-dlb-asmtp-mailmevip.me.com
 [17.57.155.28])
 by qs51p00im-qukt01072502.me.com (Postfix) with ESMTPSA id ABBF96EC0164;
 Wed,  2 Apr 2025 13:52:40 +0000 (UTC)
From: Mads Ynddal <mads@ynddal.dk>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Phil Dennis-Jordan <phil@philjordan.eu>,
 Cameron Esfahani <dirty@apple.com>, Roman Bolshakov <rbolshakov@ddn.com>,
 Peter Maydell <peter.maydell@linaro.org>, Alexander Graf <agraf@csgraf.de>,
 Mads Ynddal <m.ynddal@samsung.com>, Daniel Gomez <da.gomez@samsung.com>
Subject: [PATCH 2/2] hvf: only update sysreg from owning thread
Date: Wed,  2 Apr 2025 15:52:29 +0200
Message-ID: <20250402135229.28143-3-mads@ynddal.dk>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250402135229.28143-1-mads@ynddal.dk>
References: <20250402135229.28143-1-mads@ynddal.dk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: _OkLlTlaorrSXTUR8_AbMX_3e-RPcZ-M
X-Proofpoint-ORIG-GUID: _OkLlTlaorrSXTUR8_AbMX_3e-RPcZ-M
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-02_05,2025-04-02_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=712
 phishscore=0 mlxscore=0
 bulkscore=0 spamscore=0 suspectscore=0 adultscore=0 malwarescore=0
 clxscore=1030 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2308100000 definitions=main-2504020088
Received-SPF: pass client-ip=17.57.155.15; envelope-from=mads@ynddal.dk;
 helo=qs51p00im-qukt01072502.me.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=0.001,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: Y0QYD66wVkB4

From: Mads Ynddal <m.ynddal@samsung.com>

hv_vcpu_set_sys_reg should only be called from the owning thread of the
vCPU, so to avoid crashes, the call to hvf_update_guest_debug is
dispatched to the individual threads.

Tested-by: Daniel Gomez <da.gomez@samsung.com>
Signed-off-by: Mads Ynddal <m.ynddal@samsung.com>
---
 accel/hvf/hvf-all.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/accel/hvf/hvf-all.c b/accel/hvf/hvf-all.c
index d404e01ade..3fc65d6b23 100644
--- a/accel/hvf/hvf-all.c
+++ b/accel/hvf/hvf-all.c
@@ -58,8 +58,13 @@ int hvf_sw_breakpoints_active(CPUState *cpu)
     return !QTAILQ_EMPTY(&hvf_state->hvf_sw_breakpoints);
 }
 
-int hvf_update_guest_debug(CPUState *cpu)
+static void do_hvf_update_guest_debug(CPUState *cpu, run_on_cpu_data arg)
 {
     hvf_arch_update_guest_debug(cpu);
+}
+
+int hvf_update_guest_debug(CPUState *cpu)
+{
+    run_on_cpu(cpu, do_hvf_update_guest_debug, RUN_ON_CPU_NULL);
     return 0;
 }
-- 
2.48.1

