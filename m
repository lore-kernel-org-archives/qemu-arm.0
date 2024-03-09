Received: by 2002:a17:907:991a:b0:a45:b507:d90a with SMTP id ka26csp369883ejc;
        Sat, 9 Mar 2024 11:29:33 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXjVQImI+p/x+m9j3Pt9df5Taj57BCvwZAMmicfbGtgpZZpSWWQlYEekDsv3jVusd0sWoH/dE/yN+dvYk1HmAoWiNBOtDW4
X-Google-Smtp-Source: AGHT+IHl/c59ekB4hKhC7EKmmFtxqS2OIWiuDaOCC7uX9LpgZ35dbVfWmtECmQNnZ8txyy+iJsNC
X-Received: by 2002:a0c:f585:0:b0:690:64e6:33d5 with SMTP id k5-20020a0cf585000000b0069064e633d5mr2857453qvm.54.1710012573433;
        Sat, 09 Mar 2024 11:29:33 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1710012573; cv=none;
        d=google.com; s=arc-20160816;
        b=RrwzybxGq8pDQyxOtG2GHwLNiWxZB3KfeL/ZjmblmU7DoQ8cN5Yc8YMGsa+RAJgMqt
         PlBlKdFvVTr6S/TllnxTTAk8GIh3iOIoOA3sDPrz94Utn4GjUYwg2QVeVb6JdNb/RouF
         YYXeA7JE3roecVqRnYifWytoA45Q66TL0nUwIC4UCxR8gxu7kENkS4V6JSsCEb696glY
         QnYyxjyxrmvrKkWm5jo512N3tUVYVw+Dgcr5PlrrcL5pzaM3U6LdWAeF+GyowolRmoNI
         hlSK7G/mQWobJxBRRMAiM31g2MoCoUItyYHfEU2+hnXjs+Je6J5eY92beXb8l2OG1Cse
         qVbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=4izzVDpY+AQ8hh1OPoQkok5+Cmay4u8VvPo/ani8Qjo=;
        fh=cBvmQivHXZNBWV0ISuTDIQIiKE4WjDsCuwXq/XwLi2I=;
        b=wlgK9y7GPLoOLIvRc8mRMXac/ReyqbX5xxFZ5RGLNie8x4Hf/KAvmekSUAENN2/d4c
         jrx1JhKNvKoLSWUt3AxNQlC2/TG8LE5L1VYFpOoF0q/fs/IutiCv2ZR6+uaCaskxL3NN
         HW+q2l3urFFXVYhAC4UfsE5LisHuimXj98RVrUhCq5dW2vRRErjzm1vb6+17sIPmZvP2
         NW8LMRSIv9aWOKu1CybDS85kUFLyn6VnDZFV8bCdN9s2qT9skTMUWltmkkLz9eaYWDlX
         aemWK9TqQhrE8lQtkv+5X+/stG1iJxBA91gKMnuC60fPFlYB063avzc8uSYoEkH0s4IP
         tuog==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="N/fn7aln";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c5-20020ad45ae5000000b0068f882108a8si2235916qvh.211.2024.03.09.11.29.33
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 09 Mar 2024 11:29:33 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="N/fn7aln";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rj2Lk-0001FV-0r; Sat, 09 Mar 2024 14:27:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rj2KH-0007Mx-W1
 for qemu-arm@nongnu.org; Sat, 09 Mar 2024 14:25:51 -0500
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rj2KF-0003Mc-6H
 for qemu-arm@nongnu.org; Sat, 09 Mar 2024 14:25:45 -0500
Received: by mail-ed1-x52b.google.com with SMTP id
 4fb4d7f45d1cf-5683093ffbbso2454951a12.1
 for <qemu-arm@nongnu.org>; Sat, 09 Mar 2024 11:25:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1710012339; x=1710617139; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4izzVDpY+AQ8hh1OPoQkok5+Cmay4u8VvPo/ani8Qjo=;
 b=N/fn7alnSp9IdsX0dSZWScKpNNh+gwvaIuz+GllWqNE40p3+nUzNYUMqxxGqLDsBkW
 SY4L09EcM/AswTVjPfQlsbDbkgs3tq4fTnR+qjD6Sk2Qhm0okiO2PfRYbxmOxEPItX2V
 X9zNZZu6Fro9VLEaELA14czQ8KPOunIX+7N2/XDxFUYwAwCV0Pg3zW3o8a6s5bJ+/Xzf
 vMAqCm2IhnAF66GvjFAWhbxddPopXFaDbcRKHOngPoBWfjXlEHwesucX+Tfvl2prRX0z
 JMBZovSm9AWUzezluT4LMTjGIJ+O0Z+nLtvnLFwVIJ6K4XR+XP7+UiyBD6udqWwi9Ywi
 9lQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1710012339; x=1710617139;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=4izzVDpY+AQ8hh1OPoQkok5+Cmay4u8VvPo/ani8Qjo=;
 b=PqNktDSND+655uXWbclmf8+Vr6rzTFZ8jTyIB5WiFy588swPFgZ5jsqIzvirmHTku7
 XXcVvIEWSynxwI/hT0jE8CvZE+ht6LognfIICTAD8cLn5iz+6oukySr982U9PtsgLkMr
 9X/ZKWpn476JpiM9Lo/P+F0YNPHK3Lc1QhVD16lPn8JflY7P0Q0bJxlAmeB7/eRZkg8y
 7adbwOUxNjYjKA0936DcXfltFeBfAbLC3+PFU3N0Z5bRlGkw2xYfO05abaAIDnNw8wIG
 N10yk1BOVUlQ3LvSTEcAwJgaBcH4YgQcxDvGUlKI7bSsmzxs3cAFaW7Wn/cWEQ6Y0+lj
 Va/w==
X-Forwarded-Encrypted: i=1;
 AJvYcCXmKttjkOlGkr1Ti31rRS9aMVekcCMd9vXtVXDqrOnEfdkY+rPYB5W/Ykj8DG286RPlB2lBeiC41hIO8WJDmBNBbxgF
X-Gm-Message-State: AOJu0Yw+mo/soCLdkfPXdYqZ7ueZaKWHoAkY/PaYwcH+vUr3Bw40wUvX
 VktNpmv5rZqdZNc6HrPsZESDQkMhb2bXXI0+78+xjHXxy8pTCwVhT6V4PHv4sIE=
X-Received: by 2002:a50:cd45:0:b0:568:2578:f520 with SMTP id
 d5-20020a50cd45000000b005682578f520mr1778835edj.35.1710012339700; 
 Sat, 09 Mar 2024 11:25:39 -0800 (PST)
Received: from m1x-phil.lan ([176.176.181.237])
 by smtp.gmail.com with ESMTPSA id
 n1-20020aa7c441000000b0056452477a5esm1183979edr.24.2024.03.09.11.25.38
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Sat, 09 Mar 2024 11:25:39 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, qemu-arm@nongnu.org, Zhao Liu <zhao1.liu@intel.com>,
 Xiaoling Song <xiaoling.song@intel.com>, Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Yanan Wang <wangyanan55@huawei.com>
Subject: [PULL 34/43] tests/unit/test-smp-parse: Use CPU number macros in
 invalid topology case
Date: Sat,  9 Mar 2024 20:22:01 +0100
Message-ID: <20240309192213.23420-35-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240309192213.23420-1-philmd@linaro.org>
References: <20240309192213.23420-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52b;
 envelope-from=philmd@linaro.org; helo=mail-ed1-x52b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: DdGP6xp2mZns

From: Zhao Liu <zhao1.liu@intel.com>

Use MAX_CPUS/MIN_CPUS macros in invalid topology case. This gives us the
flexibility to change the maximum and minimum CPU limits.

Signed-off-by: Zhao Liu <zhao1.liu@intel.com>
Tested-by: Xiaoling Song <xiaoling.song@intel.com>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Message-ID: <20240308160148.3130837-6-zhao1.liu@linux.intel.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 tests/unit/test-smp-parse.c | 22 ++++++++++++++--------
 1 file changed, 14 insertions(+), 8 deletions(-)

diff --git a/tests/unit/test-smp-parse.c b/tests/unit/test-smp-parse.c
index 1874bea086..84e3422774 100644
--- a/tests/unit/test-smp-parse.c
+++ b/tests/unit/test-smp-parse.c
@@ -323,15 +323,21 @@ static const struct SMPTestData data_generic_invalid[] = {
                         "sockets (2) * cores (4) * threads (2) "
                         "== maxcpus (16) < smp_cpus (18)",
     }, {
-        /* config: -smp 1
-         * should tweak the supported min CPUs to 2 for testing */
-        .config = SMP_CONFIG_GENERIC(T, 1, F, 0, F, 0, F, 0, F, 0),
+        /*
+         * config: -smp 1
+         * The test machine should tweak the supported min CPUs to
+         * 2 (MIN_CPUS + 1) for testing.
+         */
+        .config = SMP_CONFIG_GENERIC(T, MIN_CPUS, F, 0, F, 0, F, 0, F, 0),
         .expect_error = "Invalid SMP CPUs 1. The min CPUs supported "
                         "by machine '" SMP_MACHINE_NAME "' is 2",
     }, {
-        /* config: -smp 512
-         * should tweak the supported max CPUs to 511 for testing */
-        .config = SMP_CONFIG_GENERIC(T, 512, F, 0, F, 0, F, 0, F, 0),
+        /*
+         * config: -smp 512
+         * The test machine should tweak the supported max CPUs to
+         * 511 (MAX_CPUS - 1) for testing.
+         */
+        .config = SMP_CONFIG_GENERIC(T, MAX_CPUS, F, 0, F, 0, F, 0, F, 0),
         .expect_error = "Invalid SMP CPUs 512. The max CPUs supported "
                         "by machine '" SMP_MACHINE_NAME "' is 511",
     },
@@ -575,8 +581,8 @@ static void machine_generic_invalid_class_init(ObjectClass *oc, void *data)
     MachineClass *mc = MACHINE_CLASS(oc);
 
     /* Force invalid min CPUs and max CPUs */
-    mc->min_cpus = 2;
-    mc->max_cpus = 511;
+    mc->min_cpus = MIN_CPUS + 1;
+    mc->max_cpus = MAX_CPUS - 1;
 }
 
 static void machine_with_dies_class_init(ObjectClass *oc, void *data)
-- 
2.41.0

