Received: by 2002:a17:907:c68a:b0:84d:2074:29bb with SMTP id ue10csp217623ejc;
        Thu, 19 Jan 2023 02:14:59 -0800 (PST)
X-Google-Smtp-Source: AMrXdXu5kxvDDvsptoSpk96KCASTa0EO0e7VMFf9irOXgfIDAflftHCLFlKHP38yehwTr/oH5LZP
X-Received: by 2002:ac8:4914:0:b0:3b1:ad76:eefe with SMTP id e20-20020ac84914000000b003b1ad76eefemr15328032qtq.10.1674123298840;
        Thu, 19 Jan 2023 02:14:58 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1674123298; cv=none;
        d=google.com; s=arc-20160816;
        b=pOdRdN5JAFnL9ol4ebQ/g3cWwBbQhoTtD+cxuEp5bvDTwR21WK4CLGZsgJh3B9IVeh
         aOUQ1XxvCFCtJSVcoPyzJyeUNkEGDPwIeJ4Ifrb3E2aISHMuS4aAFqpKawKzjuX5FRc2
         zFJFOyRF9XpoIX/uT3TdaooYUHN5UqmtKBxVtz4xXcE8Usfx6Tt6nDRnjBLAmBULALQ+
         kSiLzdLshQ+h2lYuAn3brMFo0c26nYpvj6gslViYn3Jz/XU9R/Rru6QlI/CIZ+IH2rmQ
         hwXdX+TUSZsmQEU9G8s81CCEYRQoj6xjHB3sZsA2yVvIpjx0IFqYJWtWOwsfLGl2SwGz
         mltw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=tLwGuTl8bFyv/J/EkEe4pO8+RMjvvODUvba2H4Ltn/w=;
        b=FbldmIjVCB+6gBL2dYHk/Z6gY5en2FdkjgnxPQ3KuJiD7TPaUk0zXNg5cgwsPt5m8w
         dl/nvYnwvkA7ImuaYxRuMkCtn5PZBa4D1VIKcAedk0QHfxrTGzwFNMjTXl3ozziP5ElR
         kMsSGJfuC91thRxfft+uReVkIMH/iSi8ynE0xY50NgH0iT943Z8ZxQrCs6IUQ79rgK/Y
         4pCxtfsSDcchq8nG0Wcjb0TzRYdNhdhXx/kFd8xqgQq6KyUWBmmZb/3/iKLxdaoS9m+R
         3fEalprFtTUPTvcGCcnFSDo91QnGyI+Nwc6PgxcUWv8jxVJqASi73aw3/lno6Jh4lMYp
         JCEA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=epe6N7EK;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w26-20020ac8719a000000b003ada2b2fd42si7077983qto.271.2023.01.19.02.14.58
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 19 Jan 2023 02:14:58 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=epe6N7EK;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pIRot-0004WN-4y; Thu, 19 Jan 2023 05:06:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pIRoN-00047g-P0
 for qemu-arm@nongnu.org; Thu, 19 Jan 2023 05:06:25 -0500
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pIRoL-0005EA-4P
 for qemu-arm@nongnu.org; Thu, 19 Jan 2023 05:06:23 -0500
Received: by mail-wr1-x42e.google.com with SMTP id h16so1291104wrz.12
 for <qemu-arm@nongnu.org>; Thu, 19 Jan 2023 02:06:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=tLwGuTl8bFyv/J/EkEe4pO8+RMjvvODUvba2H4Ltn/w=;
 b=epe6N7EKDuPqfmzoHL/51kuAnQZSSLwXtAc7yW8a4O28igvEgHUViuzZ5DvTZYYld4
 NeUkksS6L553DGeBoqLqvv9gRh5De7zXNy18tc/YWHdtwkFerkX80yuc979CB6c5GrEW
 qvl4rXFPyMeof/rb9y4St5cpiSWW1FCdJm+T2gYUzbzYybOa1xd1dR/33chXEEa87eZt
 CPZFSyKtNi42ijKA4mKYttHg5FEqFzasqV7rOIhVx2zVdKbK8bd0xTf9K/KGa3yRfre7
 eMgDKYvqRKz1TCIsONTMW7LESzDuuuWzLyByHXIc2F8ds54XhkEL9bqyGcpv9mc8lElZ
 MJ4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=tLwGuTl8bFyv/J/EkEe4pO8+RMjvvODUvba2H4Ltn/w=;
 b=6IRhrNjkIDnUD8nRUPr+Hog2bbNqWFgAqQ8l/skeavSd/P4PejTp2OnPFeJqtJBPN8
 J7hcL83vLqs1fiMBzjBj0/dhaMhFHhEbzYcIPiUBX41e54T1Mp1k15qp9GR7cKyxVqzM
 XjpohR7Kq8cBBCijXTZXb7RKvG0AqGw3fZDNhxG/F6deRZEqgMqcuso5y4wzsuhLjZt5
 nVj8/vM6NbhzLyF6SIqOKz0jr5k1Ugs1T4DyWBXYRKnvICCm6qwPu5bqCXiTm0uDsnwE
 n+5jDw5zd1YjyH0yQzRGAcPVPwxC0vtP3yOvFKbFxhmHR4nmZcvNXPcFTHdgGltmgwo6
 qTcA==
X-Gm-Message-State: AFqh2kpi3Mz6HBYJfGs7Z9JcAAiXVundsOXpr902ha5NifCb/p7Enqd1
 lYquL2Iliawv4rl22A/N5M/68A==
X-Received: by 2002:a5d:6e42:0:b0:2bd:fcd3:44c7 with SMTP id
 j2-20020a5d6e42000000b002bdfcd344c7mr8542787wrz.29.1674122779596; 
 Thu, 19 Jan 2023 02:06:19 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 o15-20020a5d62cf000000b002bbedd60a9asm27608453wrv.77.2023.01.19.02.06.18
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 19 Jan 2023 02:06:19 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Fabiano Rosas <farosas@suse.de>, Juan Quintela <quintela@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Thomas Huth <thuth@redhat.com>, qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 8/8] tests/qtest/migration-test: Allow running with HVF
Date: Thu, 19 Jan 2023 11:05:37 +0100
Message-Id: <20230119100537.5114-9-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230119100537.5114-1-philmd@linaro.org>
References: <20230119100537.5114-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
X-TUID: wdUypCtZPSUs

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 tests/qtest/migration-test.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/tests/qtest/migration-test.c b/tests/qtest/migration-test.c
index 1e7f1ea162..7a0fcfb81d 100644
--- a/tests/qtest/migration-test.c
+++ b/tests/qtest/migration-test.c
@@ -47,6 +47,7 @@ unsigned start_address;
 unsigned end_address;
 static bool has_tcg;
 static bool has_kvm;
+static bool has_hvf;
 static bool uffd_feature_thread_id;
 
 /*
@@ -614,6 +615,9 @@ static int test_migrate_start(QTestState **from, QTestState **to,
                                args->use_dirty_ring
                                ? ",dirty-ring-size=4096" : "");
     }
+    if (has_hvf) {
+        g_string_append(cmd_common, "-accel hvf ");
+    }
 
     bootpath = g_strdup_printf("%s/bootsect", tmpfs);
     if (strcmp(arch, "i386") == 0 || strcmp(arch, "x86_64") == 0) {
@@ -2472,6 +2476,7 @@ int main(int argc, char **argv)
 
     has_tcg = qtest_has_accel("tcg");
     has_kvm = qtest_has_accel("kvm");
+    has_hvf = qtest_has_accel("hvf");
 
     g_test_init(&argc, &argv, NULL);
 
-- 
2.38.1

