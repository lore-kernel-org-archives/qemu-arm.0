Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A158BC5DF94
	for <qemu-arm@archiver.kernel.org>; Mon, 24 Aug 2026 15:27:46 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wyWYg-0007C7-Lt; Mon, 24 Aug 2026 11:25:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1wyWYf-00079t-AL
 for qemu-arm@nongnu.org; Mon, 24 Aug 2026 11:25:57 -0400
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1wyWYd-0007el-SC
 for qemu-arm@nongnu.org; Mon, 24 Aug 2026 11:25:57 -0400
Received: by mail-ed1-x531.google.com with SMTP id
 4fb4d7f45d1cf-6a15d54ac95so6298572a12.0
 for <qemu-arm@nongnu.org>; Mon, 24 Aug 2026 08:25:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1787585154; x=1788189954; darn=nongnu.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :content-type:mime-version:subject:date:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=hI/4kRcuHe18/qYKP2hOGxNnKh8pw1N2QjNp4C1E0DY=;
 b=aTlX94E8P2Nhnc6NLypLDq4hu+fxen6Pe0wGBEWTqw9L6IfUClIfSK3hbLbfDIoduU
 j6bG93xTG5IcA9MuH4eWuX638w/BMn6EzTuYUY3hsVNLDru3+zvY8s4Kfs/UbGdDA3oo
 rNuXmRUGFrtvA6jUOfWIXNRcyGzsUfMp3yGMLMhWTilEIuDSxxgyvCpVUakFeP/BY0IH
 A7io0w8OYKJzmiH2404IyCgOxxObK5UMgFL5wCHVlSqEBN7UkiQdPh+Kb/oEP48C/2GV
 BDLcAjQbhDRIPC9NkpVvOy0XE5130pXwRs3vRG4YEUajEp4LONzmrbasPOpkgoDuJG6A
 l+6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1787585154; x=1788189954;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :content-type:mime-version:subject:date:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=hI/4kRcuHe18/qYKP2hOGxNnKh8pw1N2QjNp4C1E0DY=;
 b=REd2FOlK97KiPxBVn/GRoqEie5kVXA8smkEeHzVf076BNQx2zoL1iaxXJfFn8af2HX
 NosegbtbXefPVtPBwOyaUsgT7WO0MdhkorxrxucxnE66VcZi9FL/zMkVRf9R5GzhmQSo
 Jv8I0yr2zwxapNzLzH2vkU141aH9DOb2eAYt/Gn9iFeMBZrvvEWIORztEdeWrOcGEOWZ
 MihzX5TUfIHU1SwPZZSw+jbaB9JhLXlc/rXQKAM3jNb4mwkSjhhLlJK1D9u3uT8PSChT
 RDW+WgxdPJgU1K3wR+0GpSpams6Ux2DixxsNVRQibHfEPa1t3xw+i/l2F8DwMWct5uXt
 Wpng==
X-Forwarded-Encrypted: i=1;
 AHgh+RowBmoBUTnwd+Peo0lyjH3Vst9ev9Os4skiDd19LVvykKLeO8xi8fGuse9Hc7erHgtawTXVIHXzFg==@nongnu.org
X-Gm-Message-State: AFuF++kmtYcURi3GWzR1pziKwnzCoDMAenaWv9YcGYsGFO6oJ4eTVBaE
 2Bm4AneMXRUyfgcbtWdplZ/EN9PPbGFd7eUZe1z/m79yEOquDDzqFF81eniJXMQRXaU=
X-Gm-Gg: AR+sD11mrB3jE/9Ra5cQ6Ksx64+fB1eB3nfInSSuAi3NvcyuCPtSZF8Zs45eCzoH/No
 hxBlFnuGqhfPEFGdYOSlZncU9jSpsWDZfqazGa2xjjPkwSIAmav9lciswPOyf878tgEpYWBPKOr
 8bjaWFh5CqPLK7qJpQpHr082UU0GQunWm7nrIPV3F73fKY+Af8iO3LmGHYRdzzygTkfnlT0Afb/
 8epD35rpJcAtKtMqsOeR6vZ06WBMzsBV4eS6elUH9QMZtG23lYVm2xzZ/uIE8jT/Hnr3yY5qVuH
 YrVQM401BWP9YbFwSpvzcjK1S/Db8KfjbzdwsElnkSXiEj1W6cH3XDhHRJt2kR2qUtXlGQAtste
 7DDMVKiA6+TWkySgIEbBGo6R+vMmXbCMq+dPiwKV9rrGWj0P0GH9ptWC4YWfD9XSUqOlxADvinq
 qXMUzEFc2RTB2qLZAzN1Wui7eQ00cMOJCRuyaJqPJxPB+LKlW0v2D6C0Ote2wC
X-Received: by 2002:a05:6402:501f:b0:698:6084:db7f with SMTP id
 4fb4d7f45d1cf-6a582b5f1a2mr23050271a12.10.1787585104864; 
 Mon, 24 Aug 2026 08:25:04 -0700 (PDT)
Received: from draig.lan ([185.124.0.156]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-6a59e1d7399sm13500683a12.26.2026.08.24.08.25.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Aug 2026 08:25:03 -0700 (PDT)
Received: from draig.lan (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id 5DD405F8BB;
 Mon, 24 Aug 2026 16:25:02 +0100 (BST)
From: =?utf-8?q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
Date: Mon, 24 Aug 2026 16:24:48 +0100
Subject: [PATCH v2 1/8] gitlab: use .base_meson_job_template for macOS jobs
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260824-fixes-for-11-2-v2-1-352c6b890402@linaro.org>
References: <20260824-fixes-for-11-2-v2-0-352c6b890402@linaro.org>
In-Reply-To: <20260824-fixes-for-11-2-v2-0-352c6b890402@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?utf-8?q?Philippe_Mathieu-Daud=C3=A9?= <philmd@mailo.com>, 
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>, 
 Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org, 
 "Gonglei (Arei)" <arei.gonglei@huawei.com>, 
 zhenwei pi <zhenwei.pi@linux.dev>, "Michael S. Tsirkin" <mst@redhat.com>, 
 Stefano Garzarella <sgarzare@redhat.com>, 
 Laurent Vivier <lvivier@redhat.com>, Amit Shah <amit@kernel.org>, 
 =?utf-8?q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>, 
 Paolo Bonzini <pbonzini@redhat.com>, John Snow <jsnow@redhat.com>, 
 Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>, 
 qemu-block@nongnu.org, devel@lists.libvirt.org, 
 =?utf-8?q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>, 
 Fabiano Rosas <farosas@suse.de>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=700; i=alex.bennee@linaro.org; 
 h=from:subject:message-id;
 bh=oLQW1QjvvZodHpTsPvGLeM5B3yePRIAQ/JBnkvtdcNQ=; 
 b=owEBbQGS/pANAwAKAfvQ2wlanipEAcsmYgBqjGJN3qf7wX053m0Vgz8GcZ4A0nHYUnlzOdQa5
 ZawJlGLedOJATMEAAEKAB0WIQRmha6Z51FnvK/I3zX70NsJWp4qRAUCaoxiTQAKCRD70NsJWp4q
 RAulB/wOK/vInJTDlmAf73QpENyVwLMabK2Y4tqkw9Y5nrDa99Lvloe7cSUcJSkQ8NqSlnLmzV3
 UWmJLJAsdS83UWIdLbyaBF41rKEI7/bdlkiUAaYqb/6k+03oM/XKgbEBucCraRgcjGHzalOz0x4
 5mdgFZ6TuCEmV4p9Lxs2Rr/tv4UKNMTdNHt6049JYpgf7/HjI+OlwMebd4lu18V+3xfXD4N+1ZM
 WnInEaiIdzXrKvOAG/INgqRPhFhw0PIyKBCsmXwjdXAYl1VCaYnxeYP8yOlUOg7N+Qcz5DSA3el
 RZQEZcvDdrCPVATOSkXT4akAEDijBf1DxMMJMB9CiN/ATYuV
X-Developer-Key: i=alex.bennee@linaro.org; a=openpgp;
 fpr=6685AE99E75167BCAFC8DF35FBD0DB095A9E2A44
Received-SPF: pass client-ip=2a00:1450:4864:20::531;
 envelope-from=alex.bennee@linaro.org; helo=mail-ed1-x531.google.com
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

This way we'll get more environmental information which will help with
debugging.

Reviewed-by: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
Message-ID: <20260723200904.224413-2-alex.bennee@linaro.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 .gitlab-ci.d/macos.yml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/.gitlab-ci.d/macos.yml b/.gitlab-ci.d/macos.yml
index 641a48b3832..bdb3eae18f0 100644
--- a/.gitlab-ci.d/macos.yml
+++ b/.gitlab-ci.d/macos.yml
@@ -1,5 +1,5 @@
 .macos_job_template:
-  extends: .base_job_template
+  extends: .base_meson_job_template
   stage: build
   tags:
     - saas-macos-large-m2pro

-- 
2.47.3


