Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88059CAC5BB
	for <qemu-arm@archiver.kernel.org>; Wed,  1 Oct 2025 08:28:29 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1v3s75-0000xa-9u; Wed, 01 Oct 2025 04:23:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1v3s6m-0000l0-Gv
 for qemu-arm@nongnu.org; Wed, 01 Oct 2025 04:22:45 -0400
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1v3s6K-0005e4-3K
 for qemu-arm@nongnu.org; Wed, 01 Oct 2025 04:22:41 -0400
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-46b303f755aso60738405e9.1
 for <qemu-arm@nongnu.org>; Wed, 01 Oct 2025 01:22:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1759306928; x=1759911728; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=hhhq2tskzQ+RgPEYDmhVYVdDixzKo6a0xF5vcW2Lqu4=;
 b=mjAyaZ1Ql8gbLsAc2zU9sCtUFjErPzaD9olZ4RGuwkqjdmy83OrlcMNOYjxPnWX61e
 +KOMdbfT/5/6i7e7StZf26eAouuT3qOThZb55wt8sjKf2Au6CleV8jUC9TPn86VzQJ5D
 F/8YGMSEbN7so6z60u7LqPd+TqL2EuuGLWPQxIWhC9weGPr3MB/uetkApedwjBQxLkJG
 wAcuAW3LnAq2T1i+n7+uoe3iTuRWes/ewtSF2tkgpsfdlaCfpFWeVXIv9D/Alg6kgssJ
 b0jcYhWPzjjKiR9duLYYjpWJTZETxb8K/kUC6bhkWh97QB7Kv7vYyfMnoJo0TOv9/TRe
 TXhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759306928; x=1759911728;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=hhhq2tskzQ+RgPEYDmhVYVdDixzKo6a0xF5vcW2Lqu4=;
 b=iZUiU05QrArbcXL5T2vDnQUXiuN4PBOF9gloIeSYTi4Nle+6IGtKlYTZJpW869Dw3N
 UlW+aps7TI6WvMZIe6FhBNgiuJXAFh6/PjRIt4ErNC46iQ1d/OZsjVDYLkfCvKdkpcHa
 ZRnE96WSpnrfww20IneewCwQunI+FQ2bdJCClzKMXTUGYE0VW3zUZKhlFgn9Itk8JZXT
 hY7TEOsSbu14JIN5671+qSLeRbmZYPhwq5E17xOBy9TZH2GdVirsbV5949Fwq6HONxe+
 wCojsIqni238znTxIP4jSPN2gwG89WE9hbEAnNGJatuJGAX05SAvY7k63nLBUDDIZNl6
 Dqog==
X-Forwarded-Encrypted: i=1;
 AJvYcCXYsZ2mfi70I956Bc3nvsZg7OEuKsKjVC9RbF4RcmHOEBIFwlW69pI+usRgtbjPe8t1fMedmc9LvA==@nongnu.org
X-Gm-Message-State: AOJu0YzBUBohGB2lkft/3FfIHyBK0Z66IkTh1TZsMdGSQ38eP+rpMfQq
 d+/RiZV4hnTEaARLGREv6qnhoWvLJw8R6/Fq4wq6ZE1T3cG1b1fKBgr0FmqY0HePonA=
X-Gm-Gg: ASbGncv17j5PLTJPiC/fWfMWcP+FSAVjx9J53xWLlp+i2ytwUkeqBtWLohW5bsWqXvi
 jZYqWQLOr9c617Hm7QWYxAyMXGzt0pXeDJzsRe8jVKeoNh5i99uHFzco2FKYE6lf2DIeiOnnNMm
 OJIjRBv9HCvx27q2qSBpw4ctMlRN2g+M6qXXwxYqknKvl/9vLMU4hZB1eCDaJvOUo2RCFAzabHW
 Vkw1UuZnNaAZgZETwAw91p5yXe4HtkYW70K/Yu5gQgpCLkRJVYtWQcxgY9WXxFG+OxuH4tz1NGi
 OZAjuTRcY1N6nv8WtqG75g8I8Egy7k60XtwHX+l/NEWkKr4iSv5vyu3SjZwIzS3hVG9o7Kr0wQb
 imqhs/JkgiY1mobIWSAN80my5I0gCSIIvxcjKlOnurjVrb0DqTeCSAgGTgX6hYf50XNkoaa7++J
 7HfgwowpUQUysCHdorhh+W
X-Google-Smtp-Source: AGHT+IH4vV/tAX0nQk6v1/YbP3GsfsEh9ZvIi/+Ptsdr+eTl5VsK33qrJ//K+YNtHqEFYGbK2CCT3A==
X-Received: by 2002:a05:600c:4511:b0:46e:394b:49b7 with SMTP id
 5b1f17b1804b1-46e612e5d92mr21414055e9.37.1759306927524; 
 Wed, 01 Oct 2025 01:22:07 -0700 (PDT)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-46e61a020a3sm27838355e9.10.2025.10.01.01.22.06
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 01 Oct 2025 01:22:07 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: "Michael S. Tsirkin" <mst@redhat.com>, Nicholas Piggin <npiggin@gmail.com>,
 Elena Ufimtseva <elena.ufimtseva@oracle.com>, qemu-arm@nongnu.org,
 Jagannathan Raman <jag.raman@oracle.com>,
 David Hildenbrand <david@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Halil Pasic <pasic@linux.ibm.com>, Eric Farman <farman@linux.ibm.com>,
 Thomas Huth <thuth@redhat.com>, Matthew Rosato <mjrosato@linux.ibm.com>,
 Jason Herne <jjherne@linux.ibm.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@redhat.com>,
 kvm@vger.kernel.org, Christian Borntraeger <borntraeger@linux.ibm.com>,
 Ilya Leoshkevich <iii@linux.ibm.com>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-ppc@nongnu.org,
 Harsh Prateek Bora <harshpb@linux.ibm.com>,
 Fabiano Rosas <farosas@suse.de>,
 Richard Henderson <richard.henderson@linaro.org>,
 Alex Williamson <alex.williamson@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-s390x@nongnu.org,
 Peter Xu <peterx@redhat.com>
Subject: [PATCH 07/25] accel/tcg: Document rcu_read_lock is held when calling
 tlb_reset_dirty()
Date: Wed,  1 Oct 2025 10:21:07 +0200
Message-ID: <20251001082127.65741-8-philmd@linaro.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251001082127.65741-1-philmd@linaro.org>
References: <20251001082127.65741-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x329.google.com
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 include/exec/cputlb.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/exec/cputlb.h b/include/exec/cputlb.h
index 9bec0e78909..db7cbf97826 100644
--- a/include/exec/cputlb.h
+++ b/include/exec/cputlb.h
@@ -31,6 +31,7 @@ void tlb_unprotect_code(ram_addr_t ram_addr);
 #endif
 
 #ifndef CONFIG_USER_ONLY
+/* Called with rcu_read_lock held. */
 void tlb_reset_dirty(CPUState *cpu, uintptr_t start, uintptr_t length);
 void tlb_reset_dirty_range_all(ram_addr_t start, ram_addr_t length);
 #endif
-- 
2.51.0


