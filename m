Received: by 2002:a17:907:991a:b0:a45:b507:d90a with SMTP id ka26csp369648ejc;
        Sat, 9 Mar 2024 11:28:55 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXq3gpChz0XRSTtcyR6ExWLXYLIAKt7yj1CG8pJvZk1A4puZa651tJpmXQMkpTCtf9/AxDp4qlZuBp4SMUESg1r6uJYmlOU
X-Google-Smtp-Source: AGHT+IFdYmTO4bHtIoVx1La3ANeadKuhMOwXl67vY/OWjAIRfhG0ezrq0wb7qYFBc4V365P4ErzN
X-Received: by 2002:ac8:5e11:0:b0:42e:b23a:489c with SMTP id h17-20020ac85e11000000b0042eb23a489cmr3458105qtx.41.1710012534810;
        Sat, 09 Mar 2024 11:28:54 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1710012534; cv=none;
        d=google.com; s=arc-20160816;
        b=Fwk2vVEPQrvntkxI9FNVb5TAQKc70ZQvF38rX1OfHB7n+6xDzCvx43Y2SvuDHx6wbG
         DdBZlevYRsYKN9DX8EEqXD1Jfp6SprNa+dBYoG6+qCkObsgsj01HXj0jTTP7hHZ1NlOB
         XgXOO1pULCxp2G3H5khm7g/Ttlg32BRF2nNIP2cam6RmhbHAJuvPYYgj2PixIy3RBCvJ
         q2TGPbGPilTaGqP2/KF7DZEOFtERhu3S/Td81ocq0nrb8ltoYnVZdWUBHpwVJ1Fde8Ef
         AfqFt38ff7e+QMn8Cy4U7k1qqSdKwGkxpv7trgQkAkfM5W4a4WYBH67Vwl7NZPUWC0oL
         +xvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=3KwrSf6l5lMKRNbxBtTiB9ULE3uG/bpbp4V2erGNe1I=;
        fh=S9WQPGLWsBWknqalzlH4o2qrER0/PTbhZltwTmPAzps=;
        b=dDcdX4lVQqfESase0OAPIvOny0f+L/6kBGGy1K4fpQ9foL6ZqTLEb8CFdANjudOfVV
         wzaMQFX+99gV+maU8W0kJWc8bgtoY43S2hBVFmZkPi5Du4L6jC3603dssawCOf9DiXyp
         ZyMVHP2LkvxZUVrQXsQ5a2RXWHLosY5NWLwub2cVr6+qHElo5i5NBl47T2kjVFODW824
         vOOykOykCkDxk1qLRqIh/z7OwulBwOnWHfniHV1Se0sqrQkzPf8q+wgFj/Y1SaAF/idQ
         HggMh7iSs6E2nBLC7nGnKeqKTiLM0SlFivwMQ055K46daHwLUcv0bT+dvJvvoEqY39p9
         cSuA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=xek2MJML;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id br37-20020a05620a462500b0078826477b9bsi2336315qkb.290.2024.03.09.11.28.54
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 09 Mar 2024 11:28:54 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=xek2MJML;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1rj2Lo-0001ih-PC; Sat, 09 Mar 2024 14:27:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rj2L6-0007w8-EZ
 for qemu-devel@nongnu.org; Sat, 09 Mar 2024 14:26:38 -0500
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rj2L0-0003ZW-Qf
 for qemu-devel@nongnu.org; Sat, 09 Mar 2024 14:26:34 -0500
Received: by mail-ej1-x630.google.com with SMTP id
 a640c23a62f3a-a449c5411e1so409136966b.1
 for <qemu-devel@nongnu.org>; Sat, 09 Mar 2024 11:26:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1710012387; x=1710617187; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3KwrSf6l5lMKRNbxBtTiB9ULE3uG/bpbp4V2erGNe1I=;
 b=xek2MJMLHOBU6xUmmvY9xtDHjOjCIFggKBT7Tpatqn7ltm/hn7/gMJTzWocPOhJwZI
 aDEgn7BIX1LE6+SREZXfUaIGAFgK91pmlcgXXTrRBMcXUGJeRsyJpcm0h4igL5UxFEAr
 Ca3UAD1CSA1mpcrKOum5BVxB7x1ZoE2NiPXQfnpZxlPMk9hhFc0vtKt+/mrPiGjz2L0M
 S9nLKVQk9l/JXlXc1oyt4G7AsvQzHJPcGzKTjgPYE1Pb1/vfmfPTdvquSE+4ZxXhWWd6
 FGJbJ7cz5GSvWnpmBzETcdvDB0Wj5AVUVkmQsymjBL3zA5RqFrWl2vJ99Q1uYDx91PBd
 psWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1710012387; x=1710617187;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=3KwrSf6l5lMKRNbxBtTiB9ULE3uG/bpbp4V2erGNe1I=;
 b=Xja8apOyv/gj1rMpD7uiV8PDUvw1Nx+h59hu6HFCtvYcWKNLP2eQnsCNrhQefQB8jW
 F46GVJAG8CYY8bTEm0gmKM1EI09CJsu+ad7xt9mtYWvSMhCbbSNS3702VD0hJ8dXUEaF
 BGwx3jpvw4ypilHOsFFZGeXLP63mruy65bWV30naYNo+MPo66MuiufTRgodqptqt4Sms
 q/X3Aj8fAqOBA8cJKGHQfuQgW5onN1I7JjNFKLONT7eFbeUo3KSQRV0NxTSjBnTR7Xon
 OG1Fmxc6rVskQYAERnY2Py3JM6ICoxLCz2VER6c69y0KQ1dtYcywnlzyEr0KCa0qyIYn
 pcNQ==
X-Gm-Message-State: AOJu0Yx3U5kZZ9lqZ6qmUlyUeJHdd9FYtMhhO6ESiwzdsSr2lbxmL9gr
 VrR/u6ET0rCtyLGwheqleL45zuzq43di0Pwlvi4lVYyCFTw9r9TPP3D0fsJHNAF5V6MSyf42swf
 h
X-Received: by 2002:a17:906:b082:b0:a45:c99d:3625 with SMTP id
 x2-20020a170906b08200b00a45c99d3625mr1214493ejy.23.1710012387502; 
 Sat, 09 Mar 2024 11:26:27 -0800 (PST)
Received: from m1x-phil.lan ([176.176.181.237])
 by smtp.gmail.com with ESMTPSA id
 k16-20020a1709067ad000b00a4537466591sm1178153ejo.32.2024.03.09.11.26.26
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Sat, 09 Mar 2024 11:26:27 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, qemu-arm@nongnu.org, Zhao Liu <zhao1.liu@intel.com>,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Yanan Wang <wangyanan55@huawei.com>
Subject: [PULL 42/43] tests/unit/test-smp-parse: Test "parameter=0" SMP
 configurations
Date: Sat,  9 Mar 2024 20:22:09 +0100
Message-ID: <20240309192213.23420-43-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240309192213.23420-1-philmd@linaro.org>
References: <20240309192213.23420-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::630;
 envelope-from=philmd@linaro.org; helo=mail-ej1-x630.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: gKc8HBBPqAX5

From: Zhao Liu <zhao1.liu@intel.com>

The support for "parameter=0" SMP configurations is removed, and QEMU
returns error for those cases.

So add the related test cases to ensure parameters can't accept 0.

Signed-off-by: Zhao Liu <zhao1.liu@intel.com>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Message-ID: <20240308160148.3130837-14-zhao1.liu@linux.intel.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 tests/unit/test-smp-parse.c | 92 +++++++++++++++++++++++++++++++++++++
 1 file changed, 92 insertions(+)

diff --git a/tests/unit/test-smp-parse.c b/tests/unit/test-smp-parse.c
index d39cfdc19b..8994337e12 100644
--- a/tests/unit/test-smp-parse.c
+++ b/tests/unit/test-smp-parse.c
@@ -524,6 +524,91 @@ static const struct SMPTestData data_full_topo_invalid[] = {
     },
 };
 
+static const struct SMPTestData data_zero_topo_invalid[] = {
+    {
+        /*
+         * Test "cpus=0".
+         * config: -smp 0,drawers=1,books=1,sockets=1,dies=1,\
+         *              clusters=1,cores=1,threads=1,maxcpus=1
+         */
+        .config = SMP_CONFIG_WITH_FULL_TOPO(0, 1, 1, 1, 1, 1, 1, 1, 1),
+        .expect_error = "Invalid CPU topology: CPU topology parameters must "
+                        "be greater than zero",
+    }, {
+        /*
+         * Test "drawers=0".
+         * config: -smp 1,drawers=0,books=1,sockets=1,dies=1,\
+         *              clusters=1,cores=1,threads=1,maxcpus=1
+         */
+        .config = SMP_CONFIG_WITH_FULL_TOPO(1, 0, 1, 1, 1, 1, 1, 1, 1),
+        .expect_error = "Invalid CPU topology: CPU topology parameters must "
+                        "be greater than zero",
+    }, {
+        /*
+         * Test "books=0".
+         * config: -smp 1,drawers=1,books=0,sockets=1,dies=1,\
+         *              clusters=1,cores=1,threads=1,maxcpus=1
+         */
+        .config = SMP_CONFIG_WITH_FULL_TOPO(1, 1, 0, 1, 1, 1, 1, 1, 1),
+        .expect_error = "Invalid CPU topology: CPU topology parameters must "
+                        "be greater than zero",
+    }, {
+        /*
+         * Test "sockets=0".
+         * config: -smp 1,drawers=1,books=1,sockets=0,dies=1,\
+         *              clusters=1,cores=1,threads=1,maxcpus=1
+         */
+        .config = SMP_CONFIG_WITH_FULL_TOPO(1, 1, 1, 0, 1, 1, 1, 1, 1),
+        .expect_error = "Invalid CPU topology: CPU topology parameters must "
+                        "be greater than zero",
+    }, {
+        /*
+         * Test "dies=0".
+         * config: -smp 1,drawers=1,books=1,sockets=1,dies=0,\
+         *              clusters=1,cores=1,threads=1,maxcpus=1
+         */
+        .config = SMP_CONFIG_WITH_FULL_TOPO(1, 1, 1, 1, 0, 1, 1, 1, 1),
+        .expect_error = "Invalid CPU topology: CPU topology parameters must "
+                        "be greater than zero",
+    }, {
+        /*
+         * Test "clusters=0".
+         * config: -smp 1,drawers=1,books=1,sockets=1,dies=1,\
+         *              clusters=0,cores=1,threads=1,maxcpus=1
+         */
+        .config = SMP_CONFIG_WITH_FULL_TOPO(1, 1, 1, 1, 1, 0, 1, 1, 1),
+        .expect_error = "Invalid CPU topology: CPU topology parameters must "
+                        "be greater than zero",
+    }, {
+        /*
+         * Test "cores=0".
+         * config: -smp 1,drawers=1,books=1,sockets=1,dies=1,\
+         *              clusters=1,cores=0,threads=1,maxcpus=1
+         */
+        .config = SMP_CONFIG_WITH_FULL_TOPO(1, 1, 1, 1, 1, 1, 0, 1, 1),
+        .expect_error = "Invalid CPU topology: CPU topology parameters must "
+                        "be greater than zero",
+    }, {
+        /*
+         * Test "threads=0".
+         * config: -smp 1,drawers=1,books=1,sockets=1,dies=1,\
+         *              clusters=1,cores=1,threads=0,maxcpus=1
+         */
+        .config = SMP_CONFIG_WITH_FULL_TOPO(1, 1, 1, 1, 1, 1, 1, 0, 1),
+        .expect_error = "Invalid CPU topology: CPU topology parameters must "
+                        "be greater than zero",
+    }, {
+        /*
+         * Test "maxcpus=0".
+         * config: -smp 1,drawers=1,books=1,sockets=1,dies=1,\
+         *              clusters=1,cores=1,threads=1,maxcpus=0
+         */
+        .config = SMP_CONFIG_WITH_FULL_TOPO(1, 1, 1, 1, 1, 1, 1, 1, 0),
+        .expect_error = "Invalid CPU topology: CPU topology parameters must "
+                        "be greater than zero",
+    },
+};
+
 static char *smp_config_to_string(const SMPConfiguration *config)
 {
     return g_strdup_printf(
@@ -1173,6 +1258,13 @@ static void test_full_topo(const void *opaque)
         smp_parse_test(ms, &data, false);
     }
 
+    for (i = 0; i < ARRAY_SIZE(data_zero_topo_invalid); i++) {
+        data = data_zero_topo_invalid[i];
+        unsupported_params_init(mc, &data);
+
+        smp_parse_test(ms, &data, false);
+    }
+
     object_unref(obj);
 }
 
-- 
2.41.0

