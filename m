Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56E7ACAC5BB
	for <qemu-arm@archiver.kernel.org>; Thu,  2 Oct 2025 02:07:33 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1v48hS-0006qd-4S; Wed, 01 Oct 2025 22:05:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gustavo.romero@linaro.org>)
 id 1v48hM-0006pa-U5
 for qemu-arm@nongnu.org; Wed, 01 Oct 2025 22:05:39 -0400
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <gustavo.romero@linaro.org>)
 id 1v48gu-0004hZ-Gg
 for qemu-arm@nongnu.org; Wed, 01 Oct 2025 22:05:35 -0400
Received: by mail-pl1-x62e.google.com with SMTP id
 d9443c01a7336-27ee41e074dso5121005ad.1
 for <qemu-arm@nongnu.org>; Wed, 01 Oct 2025 19:05:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1759370699; x=1759975499; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=VOPeXicLAafrLttDNmWtdjRbKocV0eal4eWIHoa6qlM=;
 b=fJlZrnVc64xZjagllZHNBa0Y1+kO6Cn7HewtL+XO3bwUtrGEkD1y8r/YQo8GgRquOe
 85gfOvwJv6YySJUZ7LxUzMDu6UZ3GnicPiGB8D7SGLnsWFHMHScSWs+TXxffiI3+CRFJ
 8Xxm3cUazENJM1V6kx0oudjT1nwottgdQgW7OgSfvNHOp0xT/EAvFZnCNaIN8kRWn8dG
 IcSrOXnFJEV4Z7NJon3O5u/DS2S966+AO699Kx7foIRd3zjz3zriVCtwvUgtL6zXzUQs
 w6WvLKK6uTFeCke7EFlyuI1QmaIQLXuKghPqcINO4sdToKyfiSjx8gu9CLFOAfCIUr0Z
 Dd2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759370699; x=1759975499;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=VOPeXicLAafrLttDNmWtdjRbKocV0eal4eWIHoa6qlM=;
 b=BZQx8Iy6eUzqxiP17o3VsA+s7PFWA7GQtpYVzx6E3yss3Bvcwit/qsOhNfnolVLtL1
 G4r2rc72n9wJbnkftxUJkb7l46mGnDSPcRWAZTBkIbWxprTf4hG0RxP8mfzEKhyfhEbJ
 qB3UoWK96l0sP7DAPhAhbJf8VrW4Mtr/obNRub1aIDCXlMBVFRF9xmWf9j8UwaaJ0M9F
 njls2qMKpJeekx5/jeKe2o1i90Ul2v4lLFnP4Osv7NY27NgUawQ2u9o+wIA601SCWjVR
 Ycx9hX36mDKeWK/zjMUFG61ZucFLWhVG4S23vYX7xuYKRjh4CmeLLTZRBrv4524Dmh21
 hk6g==
X-Gm-Message-State: AOJu0YwhFLHjHRvz4z1UAk3OW6beexjhM2FG44Oa7enUWHOxUxFXiXoI
 6IGGE+CypLPJr3Jp8xArKa79kzTgbQ9q4eVgnE3nOhaws7jegRf07u5dLJjF/N/XrvA=
X-Gm-Gg: ASbGncuLaMDK+ALB2Bt38KTwYQdY9Dgv5w88+gvA4gBz+lrvybv7gq9bO0mpidTVrfL
 I5m0EgkLvY74MCUUPV2GzOU/CYbCnEevoM6R3aU3W54R3bj+6Gl2QC9hA5OlcrQkp/w+4vPCHg7
 ePcBiYLWwvmQNQYLrwZe1xVhXTZXYLuZoKMlBAU08LblK0When+u1op7cnvRj5f9s2V5nkd3uMp
 SHlNJchs+L/hPO35pvvoC71wZWHZk4/XLl2VrBOyc4pQYS44blUyCqw+eKUXaF+vj8hk+xInMS/
 t1GuKvQgd6a8cmvv81IVhiP6Cy0zexK/Jz6o5bp+VdNoTkYVDQ2r3VLtZGzO5ESbpwvjQ4JDCpC
 +Hp8IxMLfi5PuE4Pezhd06gRil8areFL0l1aans9lQwaQCKhfBgPqQ+rk
X-Google-Smtp-Source: AGHT+IEjdPsBhCaiASj+rlbTXJD682sqXdWjz5+iN+jcmd5NMS6PXOaw6l0sQrgslKzEfiSF9wWgig==
X-Received: by 2002:a17:903:1585:b0:269:9a8f:a4ab with SMTP id
 d9443c01a7336-28e7f442cb7mr62869465ad.60.1759370698706; 
 Wed, 01 Oct 2025 19:04:58 -0700 (PDT)
Received: from gromero0.. ([186.215.59.111]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-28e8d1d95bdsm9476735ad.119.2025.10.01.19.04.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Oct 2025 19:04:58 -0700 (PDT)
From: Gustavo Romero <gustavo.romero@linaro.org>
To: qemu-devel@nongnu.org, alex.bennee@linaro.org, thuth@redhat.com,
 berrange@redhat.com
Cc: qemu-arm@nongnu.org,
	gustavo.romero@linaro.org
Subject: [PATCH v5 2/9] python: Install pygdbmi in meson's venv
Date: Thu,  2 Oct 2025 02:04:25 +0000
Message-Id: <20251002020432.54443-3-gustavo.romero@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251002020432.54443-1-gustavo.romero@linaro.org>
References: <20251002020432.54443-1-gustavo.romero@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62e;
 envelope-from=gustavo.romero@linaro.org; helo=mail-pl1-x62e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 T_SPF_TEMPERROR=0.01 autolearn=unavailable autolearn_force=no
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

The upcoming changes in the reverse_debugging functional test to remove
Avocado as a dependency will require pygdbmi for interacting with GDB,
so install it in meson's venv (located in the build dir's pyvenv/).

Reviewed-by: Thomas Huth <thuth@redhat.com>
Signed-off-by: Gustavo Romero <gustavo.romero@linaro.org>
---
 pythondeps.toml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/pythondeps.toml b/pythondeps.toml
index 16fb2a989c..98e99e7900 100644
--- a/pythondeps.toml
+++ b/pythondeps.toml
@@ -33,3 +33,4 @@ sphinx_rtd_theme = { accepted = ">=0.5", installed = "1.2.2" }
 
 [testdeps]
 qemu.qmp = { accepted = ">=0.0.3", installed = "0.0.3" }
+pygdbmi = { accepted = ">=0.11.0.0", installed = "0.11.0.0" }
-- 
2.34.1


