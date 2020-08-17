Received: by 2002:ac2:4841:0:0:0:0:0 with SMTP id 1csp3068492lfy;
        Mon, 17 Aug 2020 10:31:02 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw9GgDand+azKEXG7tiKhCfcWQxjJ7MgOmX5dlflQExVptJ8sXzMf1FKlzyKGpldQTPy5Pm
X-Received: by 2002:a25:7d43:: with SMTP id y64mr20921556ybc.104.1597685462317;
        Mon, 17 Aug 2020 10:31:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1597685462; cv=none;
        d=google.com; s=arc-20160816;
        b=JYcUrPtCjCcWVg+lf2lH9Do3p8oPaPcM8gk+rRj2DzpQ/En06Mb1Jv+ChQQuxkKLko
         cWZFkNiHfciQgqEcUBlOlE0hptxqed8opAsjBZt1/ZkAemu+17G1o3F/+uS76J9LPEfP
         h/Nz8MbThDlM6dyesnPzr6y2tvyARj2Og5AyadVWzIL6Dn8mK5ljiU2Pb/5QqtpayadK
         HPJoS6VrxsZlRCXlEvq4LL4mdfwdEQ/tLMIbWjlK/TcBj8TBqzDVaHOcDIRO3h4d4ULx
         8wD7KjysQsCoEPpg+211bIbLFqlb6b1b6IvCXSMmaAzBFcxSCkvKYRkHAYcU9KUepQgv
         5FSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=42pNxyFkb8r8xbuSmezRvuZiT8cVhtJo0HiE1dBtcds=;
        b=r7cY9+YwgcmeBUsBDVrHABal6EyhjV6PT5Wl5L0cB/OBnGZE/+t2Op1GJC7Wey8kJQ
         x7XzG5kliPfVLbx0pVeaAK+j6PazGujjMDsFY/NvxjyGlNV5kN3iQvUAG6xyQKr7Ts9f
         uc70aOntZDmoNG/zaKObiIGhI1xVlcXM8nm6WjuSPx1IgnxoiPM4OjE+a+aCHbwINYqr
         xFEWVyHfC/qp5eQ5SXcZ4dmoX2sYGS2gs6SqK+SbxLrDhZiGNnIF9XyN5qg8jSzidqrT
         Q0+W2QvVr9Htd1oaDoYZ8EEj+z4WiT60USg27pgN46NUqbB8kknFVzsgRNtfUqGKuZ+9
         AYvw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=oMpuKHd7;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n126si18362079yba.429.2020.08.17.10.31.02
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 17 Aug 2020 10:31:02 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=oMpuKHd7;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:41890 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1k7iyL-0001dk-Le
	for alex.bennee@linaro.org; Mon, 17 Aug 2020 13:31:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59980)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <edgar.iglesias@gmail.com>)
 id 1k7iyB-0001cz-E3; Mon, 17 Aug 2020 13:30:51 -0400
Received: from mail-lf1-x142.google.com ([2a00:1450:4864:20::142]:41297)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <edgar.iglesias@gmail.com>)
 id 1k7iyA-0005w8-4b; Mon, 17 Aug 2020 13:30:51 -0400
Received: by mail-lf1-x142.google.com with SMTP id i19so8774387lfj.8;
 Mon, 17 Aug 2020 10:30:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=42pNxyFkb8r8xbuSmezRvuZiT8cVhtJo0HiE1dBtcds=;
 b=oMpuKHd7SYY7imaG5TFWU8UTqDv+DCsYgQ9m4AP34y/49Xteck4G6FABd063WfuINo
 v3DDjUaV421Af8lqpI1YWawTNtIoVGV0vvS5DUwlc9iqWHhtfoLw+ez/iFGedECMlanp
 0zhZRZYXN+Egny6Dl3wQg8F0OwxQxTW2k6n/ZDQ+FmtvPzCifalSAOQgV6ZhRdCATMfe
 8UQkFhG0R3J/IL/o5LgHAYNRzD/MhABETIfNRGwxueoa/PVf2oNQ8A0uynjYPTfoXS2g
 8MDF2INrNfNm9j7kahSWB4IE0M7peBVJXSc56KXeuqu0Xpr9gF2g0+0JcQLaSl+54SH3
 U+xA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=42pNxyFkb8r8xbuSmezRvuZiT8cVhtJo0HiE1dBtcds=;
 b=a+DQPKPGTJWBtms34W1jr+HxDYBcIb3YWQNc7jnd3GgJFtH32wuQAZcjGG63mTMvaj
 gXhaRGcBQToEOIzE1UF9myYweBI7qK8Xr1v5uwRigM2pGFpsXybp2oVA9/vzBSrUN8Mp
 g1fL8ITiZumY3bVAHeTZ4IpIsZ0qi9lXrXELXwlMw2zI9jThG0EQw60++k51/BsGN9JQ
 oHKYzmitcgu+ktaVqU4TiZ4hnGG9VKqiXP7KWNAN9ASJC5HoKqLSy0ejg7l+BX6QvMQ0
 FdlYpoqMs4MQZ1vuGanZScqkBqiTg1GtAn1aM+rGE9H3o2ABp6/YSDJT9LyYIqNrq9L3
 sUOA==
X-Gm-Message-State: AOAM531dWtzUplK/xqFjViOuFdJo1zMvHpswK8e8462od294+L34tzgo
 kflOBxpK08bGeHi76+Q8VpEHeIg+EO8s3g==
X-Received: by 2002:a19:f207:: with SMTP id q7mr7421316lfh.148.1597685447838; 
 Mon, 17 Aug 2020 10:30:47 -0700 (PDT)
Received: from gmail.com (81-231-232-130-no39.tbcn.telia.com. [81.231.232.130])
 by smtp.gmail.com with ESMTPSA id q20sm5165600ljj.42.2020.08.17.10.30.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Aug 2020 10:30:47 -0700 (PDT)
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v1 1/1] target/microblaze: mbar: Trap sleeps from user-space
Date: Mon, 17 Aug 2020 19:30:45 +0200
Message-Id: <20200817173045.437534-2-edgar.iglesias@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200817173045.437534-1-edgar.iglesias@gmail.com>
References: <20200817173045.437534-1-edgar.iglesias@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::142;
 envelope-from=edgar.iglesias@gmail.com; helo=mail-lf1-x142.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 FSL_HELO_FAKE=1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
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
Cc: figlesia@xilinx.com, peter.maydell@linaro.org, sstabellini@kernel.org,
 edgar.iglesias@xilinx.com, sai.pavan.boddu@xilinx.com,
 frasse.iglesias@gmail.com, alistair@alistair23.me,
 richard.henderson@linaro.org, frederic.konrad@adacore.com, qemu-arm@nongnu.org,
 philmd@redhat.com, luc.michel@greensocs.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: en6dAgqpFHJU

From: "Edgar E. Iglesias" <edgar.iglesias@xilinx.com>

Trap mbar-sleeps from user-space.

Reported-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
---
 target/microblaze/translate.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/target/microblaze/translate.c b/target/microblaze/translate.c
index 530c15e5ad..a96cb21d96 100644
--- a/target/microblaze/translate.c
+++ b/target/microblaze/translate.c
@@ -1250,6 +1250,11 @@ static void dec_br(DisasContext *dc)
 
             LOG_DIS("sleep\n");
 
+            if (trap_userspace(dc, true)) {
+                /* Sleep is a privileged instruction.  */
+                return;
+            }
+
             t_sync_flags(dc);
             tcg_gen_st_i32(tmp_1, cpu_env,
                            -offsetof(MicroBlazeCPU, env)
-- 
2.25.1

