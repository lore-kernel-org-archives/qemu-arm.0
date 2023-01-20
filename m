Received: by 2002:a17:907:c68a:b0:84d:2074:29bb with SMTP id ue10csp919777ejc;
        Fri, 20 Jan 2023 00:24:58 -0800 (PST)
X-Google-Smtp-Source: AMrXdXsnxrvuPj5wy767CCKTJo8JGSOAO+9Ja/zHzcraFarakIqNU/nQm3FxIxH7aQLAPNb079dh
X-Received: by 2002:a0c:f744:0:b0:532:33f3:2c9b with SMTP id e4-20020a0cf744000000b0053233f32c9bmr49033246qvo.39.1674203098202;
        Fri, 20 Jan 2023 00:24:58 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1674203098; cv=none;
        d=google.com; s=arc-20160816;
        b=QA7q1TBs4ewBIteiVjuLgOBMjYCdOQke3NwWGHPJhnezM5+l/SUpYOtVioudiE3YtS
         hfJa06MijoPGWGrzxtTqw8wUo/Ld7+ddWXI0n/LUZ3MeNDj9KfvDYs7afq8WRI85XFst
         UTwHCUd/Pi0NMxcVhIn8hUzd64JReGNDTZgSQPawpcG15nb9zaQ7Nz38b2QmEre2Mb2d
         SRPjgZ0MLsM0pDrD0/evx199SbWurmDixXA+wiIjvp6GDeG01CA+SAan6YRm4/Dkrqnx
         o1Ux5asaEVu12QgB71Nc/mjgyvbhdjOHa83iSjwUoxPSnBlOS+RhL2FXfuY4UGh3UrVX
         5bdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=W5TXNXh3AquUKHDIlWKH1U7Rhf/WLE5rFLgjN1F2D1o=;
        b=UUroeMGRnn2c3qyTMFtMEFSv+aL1VzBfDNWiwiup0xWzXX/jDxpCe2JQgEHq3JC9hi
         wUc5oFriTpGlPy8YxDq9i5YSbN3Eymr92eF44EiozbWEopBFhHM59O04q5Sctr58xnlK
         eSce50djd2h3RmApBpn16fLAdvExo8aC6sm1+bNctD2gU43EtzzdWNQs4xbtt1F4V8tl
         P/BX7Pu5NsQn12sB4HGrRiiO/VDGwjgWxvWLQ+Bqt7Qb4HAtnUFZYj+vawHfA/fjOBxN
         U4CenwoopfZVSMBTCzbRwjulgNZjPr7G4TmEWvlysoQaLfk6Tc0JxGtCI8V8YpVxlOYJ
         8CYg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=m+LYgICb;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t7-20020ad45bc7000000b004c7005f0276si24634148qvt.483.2023.01.20.00.24.58
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 20 Jan 2023 00:24:58 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=m+LYgICb;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pImhO-00059u-MZ; Fri, 20 Jan 2023 03:24:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pImhM-00053B-1e
 for qemu-arm@nongnu.org; Fri, 20 Jan 2023 03:24:32 -0500
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pImhK-0004fW-7i
 for qemu-arm@nongnu.org; Fri, 20 Jan 2023 03:24:31 -0500
Received: by mail-wr1-x435.google.com with SMTP id n7so4133010wrx.5
 for <qemu-arm@nongnu.org>; Fri, 20 Jan 2023 00:24:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=W5TXNXh3AquUKHDIlWKH1U7Rhf/WLE5rFLgjN1F2D1o=;
 b=m+LYgICbB3UFgva2MXKv+qAr8r7Oq0PXc7tul9i4gg3Q/F9UhvTonjUMBspmItaCqX
 hMq3q7Rj35P7cRKzQT4KGysEppzXmAs8sYgRrhpQWuxl9vNEWOpR5hrBXdx08NnojJWy
 5kjbKLwb2x3F8sk6dfHV0zgFpupBp5sHK5kgcpPzx3kXOsMOJEru80ppnyANl9WmWwjP
 zABs3FVzfNK0OVnxDpvlcucXuWppqxDEzUAbh1NdE9Sd51j/wtbH+bcFOtMH6lpGOmkZ
 jIUfHoaqRi9VCMIx1DAh7tGQJRzkmrMLKy9WfbWIrVF+SeScEmGcOnacVdWsM78Raw2p
 mOxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=W5TXNXh3AquUKHDIlWKH1U7Rhf/WLE5rFLgjN1F2D1o=;
 b=qz5uMmi0SfJnr41NcuBOUC6nD/cDoxndaArtUr411yUizMBOnBhrC6Uce1xosTDf2T
 wKNlsWdg7FRUFIf9+H7zGCNZscjptjMY4vryLiJmze1lTC+46j38MBnACFWMh1y34GxP
 QhRH1IxxQEwnSJeyoPlz1/mipMioE0mZOc2x+NGrSNpW/DtPxwOYFeyz/SS9fIp1pbs4
 1iE8f4N89ob1ZNKC8Rddo6FOXeh6NBJ2phPiHOb9R85yjUGDsmpAGy3qzz8UDcC/2AKC
 /kdXgKAbkinbLFi9m7XBemN739gM7/CUWUf9o+DhrGh77pXCIECuap/ZHreABXxbWOFe
 ZkXg==
X-Gm-Message-State: AFqh2krs7X3dd4mIVVwhH5xcGYfOnoG4uUuIFZOBP6sGnbTNRyhrj+k7
 oQUokLohCYuIiZh6ZMa9WqEKyQ==
X-Received: by 2002:a05:6000:608:b0:2bd:db84:d663 with SMTP id
 bn8-20020a056000060800b002bddb84d663mr8787590wrb.5.1674203068931; 
 Fri, 20 Jan 2023 00:24:28 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 l5-20020adfe9c5000000b002238ea5750csm21286817wrn.72.2023.01.20.00.24.27
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 20 Jan 2023 00:24:28 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Fabiano Rosas <farosas@suse.de>,
 Juan Quintela <quintela@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PATCH v3 09/11] tests/qtest/migration-test: Build command line using
 GString API (3/4)
Date: Fri, 20 Jan 2023 09:23:39 +0100
Message-Id: <20230120082341.59913-10-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230120082341.59913-1-philmd@linaro.org>
References: <20230120082341.59913-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x435.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: p76yFUnxKeHh

Part 3/4: Convert accelerator options.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 tests/qtest/migration-test.c | 15 +++++++++------
 1 file changed, 9 insertions(+), 6 deletions(-)

diff --git a/tests/qtest/migration-test.c b/tests/qtest/migration-test.c
index 670097a956..1ed3505c91 100644
--- a/tests/qtest/migration-test.c
+++ b/tests/qtest/migration-test.c
@@ -603,6 +603,13 @@ static int test_migrate_start(QTestState **from, QTestState **to,
     got_stop = false;
 
     cmd_common = g_string_new("");
+    /* KVM first */
+    if (args->use_dirty_ring) {
+        g_string_append(cmd_common, "-accel kvm,dirty-ring-size=4096 ");
+    } else {
+        g_string_append(cmd_common, "-accel kvm ");
+    }
+    g_string_append(cmd_common, "-accel tcg ");
 
     bootpath = g_strdup_printf("%s/bootsect", tmpfs);
     if (strcmp(arch, "i386") == 0 || strcmp(arch, "x86_64") == 0) {
@@ -678,12 +685,10 @@ static int test_migrate_start(QTestState **from, QTestState **to,
     if (!args->only_target) {
         g_autofree gchar *cmd_source = NULL;
 
-        cmd_source = g_strdup_printf("-accel kvm%s -accel tcg %s "
+        cmd_source = g_strdup_printf("%s "
                                      "-name source,debug-threads=on "
                                      "-serial file:%s/src_serial "
                                      "%s %s %s",
-                                     args->use_dirty_ring ?
-                                     ",dirty-ring-size=4096" : "",
                                      cmd_common->str,
                                      tmpfs,
                                      arch_source,
@@ -692,13 +697,11 @@ static int test_migrate_start(QTestState **from, QTestState **to,
         *from = qtest_init(cmd_source);
     }
 
-    cmd_target = g_strdup_printf("-accel kvm%s -accel tcg %s "
+    cmd_target = g_strdup_printf("%s "
                                  "-name target,debug-threads=on "
                                  "-serial file:%s/dest_serial "
                                  "-incoming %s "
                                  "%s %s %s",
-                                 args->use_dirty_ring ?
-                                 ",dirty-ring-size=4096" : "",
                                  cmd_common->str,
                                  tmpfs, uri,
                                  arch_target,
-- 
2.38.1

