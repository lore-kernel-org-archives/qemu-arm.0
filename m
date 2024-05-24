Received: by 2002:a17:906:d149:b0:a5d:17e5:aef9 with SMTP id br9csp1608582ejb;
        Fri, 24 May 2024 03:52:36 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVbkxXM4tnCGUcw3uygk02zBzexoPqiRWbD6wSDdyYnlABwtcPWowpKkbhGwwH47k4T9KuVu4CLRKif3Ir0hyD1guCCMzWQ
X-Google-Smtp-Source: AGHT+IF7ZL1tfJ3FedscQ/acrbIB0dHntdm5Z3gLToBoWVjAJDiErbPTB9Bz2cXSnQzB0HKnxfpM
X-Received: by 2002:a67:fe9a:0:b0:48a:31e9:dce with SMTP id ada2fe7eead31-48a3851126dmr1973014137.4.1716547955963;
        Fri, 24 May 2024 03:52:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1716547955; cv=none;
        d=google.com; s=arc-20160816;
        b=L+WfCi+7aww3sQY+WBNDAqQTmrQzJ/VQ0Hr4un9Jn3rlU1luq0ArnYULjowpKWruYl
         r5zR46N9UuGVxlShRkuONUX91SyOeXJHfB1bz+j4x3CXrIDQpgv/pXxXOQ/xaVaT+OYM
         q2PTU8fUIbJc+YkvHJUEfBmSyOvt28+J1ng6KYHr9ghCXZCao9Djy9OGZpQrtvK6d9rk
         bvAbnLhqBE8+3AjbmqPN5QJWOCSKT7ExPbt25k7q73xRvA9J6wcttms8udubchDhM7Kk
         ytApogAz5rKj+/lQe9kr2ijm2xgQ2dAQVft6n4YZ3pOZb0HijkaoYjLF64VIPaTgriDZ
         rMpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=iFOOOjt9lX3R5TOZr7m7NgtcNi/9J4Kc7/wWsAI8IDg=;
        fh=KXui3fTQ9sWyOF5AW0zpOcVrKLK7hXfDKx5ByAGjyMo=;
        b=yc0t2aD/i0BPAP6Z2gsJkS0b/3krfoe8Q8/Zorg6s51rNjhDVhW6/mFztX8ZWsYFjG
         LZhYuu0tE1xz2ncH1LmwU4jQ4Lq58bpHm6Esq/w8nNDj7SUL5bku8Y6c5rZw0F79/zWa
         T9qnAb7lxM00PkqkBhkXPv7IYSh40dOTY2rJFRbDRahvFJ4AvToE8wCgfeWSGC3aSqaP
         YnQBfeArc5WTV824j0Q1YygunSsQHyrJ8KyYSMKnnJXDBp7ipkVwXvnBVrseWfXwLwUs
         Mr8kTHJ9cTbE3EKo4fattgibOogQKfU2jXnI53uq5YNe4pH+eEIxkTl+9wGLX/iYbz2h
         zuQw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=GAaLE7eb;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-43fb18ca504si15054381cf.640.2024.05.24.03.52.35
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 24 May 2024 03:52:35 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=GAaLE7eb;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sASX4-0006fu-Cm; Fri, 24 May 2024 06:52:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <edgar.iglesias@gmail.com>)
 id 1sASWz-0006Yh-Ad; Fri, 24 May 2024 06:52:13 -0400
Received: from mail-lj1-x235.google.com ([2a00:1450:4864:20::235])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <edgar.iglesias@gmail.com>)
 id 1sASWx-0007gf-MQ; Fri, 24 May 2024 06:52:13 -0400
Received: by mail-lj1-x235.google.com with SMTP id
 38308e7fff4ca-2e564cad1f1so98623311fa.0; 
 Fri, 24 May 2024 03:52:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1716547929; x=1717152729; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=iFOOOjt9lX3R5TOZr7m7NgtcNi/9J4Kc7/wWsAI8IDg=;
 b=GAaLE7eboMDtAkdj14C/A0sgKyE8AW39fZH8iiZ9V9Xi5/Lz27tATDcZeRAZOuaFSG
 ddcGhR2qZ4DPC99xKDDQu63Jo1HHxq1jFlsuog7vWb8oX8wODC8DxRUKY/x2OlTWvzMP
 n4Cd0SSmU7yONu27K36MsezCZKWr1UQEGFm9gj6kctQIBVchC4hpFcCII0F72D32y+Uk
 BOKSEOaDmD8rfE2ZJNUcIwjC3jQoZtdeFMnJa7R/Tb3+YeWq9nu5uyVQAAmWniI6rPpG
 YVQ0AEDkHAHh3y9vrQAvOFNCm45Ds23wmGjqqZPi+VG1k4t8uFWMSYgMVeXF8sA0dBZ8
 CjFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716547929; x=1717152729;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=iFOOOjt9lX3R5TOZr7m7NgtcNi/9J4Kc7/wWsAI8IDg=;
 b=lD/zmOXlMGLfk0xPePnyyIN/TFuXkWIROBJLhOhjsxQIbmXu5cuVXlXKgluI6z6x6M
 C112jTihdcQgONYRLCHJrRLHTtZnAJ0CgUqpL8TJSO+NDbbQHiQBChUgWiZSoxfrdccb
 1mQpxoWXizEbADfcVbucaXF/c2M7iwvwRFj2dMp7HHJpEjxd41R//c/O25bJIww7Q4c0
 yqgLCHAf7Ms0uCZP+i2OqjWuanXkLSEsa69HF4cdDE+0SPRFw2/JjQzggN6i4mKBwB08
 ce3pMjVxm44hVUfB4J4mwDtIYvM6HzejA36+duqyV/aY/XZ83+vnqT7EmZO+m6LkVshn
 TK3g==
X-Forwarded-Encrypted: i=1;
 AJvYcCX2hIOiaFEs0iP+yTvByAqz6Fg9X21EW1qrloScoV9EBceCsfsfG3mg9gBdf1qDqTxSLrCsoR4gMhIhf10T3GqG/y4n
X-Gm-Message-State: AOJu0YwZkY3OP9WD+p3NPtGPFeSQaAo+U2aidawyBXxLJJ0PoLwftl/u
 plntYLh7C40LMaWyDLTpW01Dna8wej1CxN9vuS2zdldwiF7zTRKHfmDuMXto
X-Received: by 2002:a2e:92c3:0:b0:2e6:ed20:9059 with SMTP id
 38308e7fff4ca-2e95b27b213mr11228821fa.48.1716547929075; 
 Fri, 24 May 2024 03:52:09 -0700 (PDT)
Received: from gmail.com (213-67-3-247-no600.tbcn.telia.com. [213.67.3.247])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-2e95bf26002sm1473431fa.136.2024.05.24.03.52.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 May 2024 03:52:08 -0700 (PDT)
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
To: qemu-devel@nongnu.org
Cc: edgar.iglesias@gmail.com, sstabellini@kernel.org, jgross@suse.com,
 "Edgar E. Iglesias" <edgar.iglesias@amd.com>,
 Manos Pitsidianakis <manos.pitsidianakis@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org
Subject: [PATCH v7 8/8] hw/arm: xen: Enable use of grant mappings
Date: Fri, 24 May 2024 12:51:52 +0200
Message-Id: <20240524105152.1301842-9-edgar.iglesias@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240524105152.1301842-1-edgar.iglesias@gmail.com>
References: <20240524105152.1301842-1-edgar.iglesias@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::235;
 envelope-from=edgar.iglesias@gmail.com; helo=mail-lj1-x235.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: kgN9m82a1s5Z

From: "Edgar E. Iglesias" <edgar.iglesias@amd.com>

Signed-off-by: Edgar E. Iglesias <edgar.iglesias@amd.com>
Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
Reviewed-by: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
---
 hw/arm/xen_arm.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/hw/arm/xen_arm.c b/hw/arm/xen_arm.c
index 15fa7dfa84..6fad829ede 100644
--- a/hw/arm/xen_arm.c
+++ b/hw/arm/xen_arm.c
@@ -125,6 +125,11 @@ static void xen_init_ram(MachineState *machine)
                                  GUEST_RAM1_BASE, ram_size[1]);
         memory_region_add_subregion(sysmem, GUEST_RAM1_BASE, &ram_hi);
     }
+
+    /* Setup support for grants.  */
+    memory_region_init_ram(&xen_grants, NULL, "xen.grants", block_len,
+                           &error_fatal);
+    memory_region_add_subregion(sysmem, XEN_GRANT_ADDR_OFF, &xen_grants);
 }
 
 void arch_handle_ioreq(XenIOState *state, ioreq_t *req)
-- 
2.40.1

