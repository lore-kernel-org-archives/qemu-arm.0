Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFEE4C5DF9B
	for <qemu-arm@archiver.kernel.org>; Mon, 24 Aug 2026 15:26:28 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wyWY1-0005fn-3V; Mon, 24 Aug 2026 11:25:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1wyWXz-0005dB-AF
 for qemu-arm@nongnu.org; Mon, 24 Aug 2026 11:25:15 -0400
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1wyWXv-0007Ds-SG
 for qemu-arm@nongnu.org; Mon, 24 Aug 2026 11:25:15 -0400
Received: by mail-ed1-x531.google.com with SMTP id
 4fb4d7f45d1cf-6a38098734bso6242891a12.1
 for <qemu-arm@nongnu.org>; Mon, 24 Aug 2026 08:25:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1787585110; x=1788189910; darn=nongnu.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :content-type:mime-version:subject:date:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=U45IFqB/B/WnMCg1IRuOHzVkoRjzCwe1cooFYxUHXWw=;
 b=hdLTaR1emdnSrKO1wnnYf73DlJ0VXTGm7r5zqgeKvpJiQ/bLYFhdGdj6wy0cMLtCBg
 SDZI7TKXRez0dYihL/JmjHWiBmB6IjkZ0pFil5rFOxNaaqSndnjVSj3XnuMNaZo+7/uF
 ZwGchkcC0PSl9HlFU+jf2yyEryvZrPexf0WjPJgpZdaeEy+WbDypcED6qs7Sfs4mQ5R/
 wN9eb9aoI5y9UmlBDUZhs47b1HB8YkcgnoUpn7r1hb/2S5n0BlSPeP1Fyize6xfgGEKk
 VI9e+CdP+AsdhWSUCnKsoW3RdOQOeEG9iGJQxgfbUvIAGQDkIejuJdxs3/GoO6tdiTOn
 oLlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1787585110; x=1788189910;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :content-type:mime-version:subject:date:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=U45IFqB/B/WnMCg1IRuOHzVkoRjzCwe1cooFYxUHXWw=;
 b=m7FZp7B38wJ/0z7lSFszyokE9DpKRqPKAoJgNN8dBMhtQgoF6RCVwgkQJtqf+tKm0L
 3jroQa0K07yvQNJNNteTDYFh1+8GlMA68wgIxpeu2HtIDTKcmQ03+duo6mxml0p7+b6E
 jhQhwFXzqdkb8gTN9Cte0GJleykk2zJBFptkRoPa2zOCg1FI1bgPjzvrMBGe1FbOOcE0
 AbUr//km5Jbm4mgKL/juwflRSm/JHbX469TybkRYEhj5+QqPytmRtpmtCu6elxlpfPKK
 XA8jajHz8zMDtqUMk8Tp5oaLgsWrBIicVRFtDOBgc3KoDmZpfaVBZz9rJRTQZWs8r+cM
 Qsag==
X-Forwarded-Encrypted: i=1;
 AHgh+RpRXqgCXEf4QcSm5tA/5hYRJcU+nFchCkYhiIWZ0+MXS6pGzrWKWi2CI0uu4bLnYVv2+tnDBluilQ==@nongnu.org
X-Gm-Message-State: AFuF++lQr2FhO0rR3SC+Gf5xWOsqUWyBSUzHJb9Y0iR7XoCFUCh/I0Vq
 fXmLP5T0eptnrANXE8oxdT9sPU0AnU74zV1HiIwy4QWTuzHOEn6Y4cYG0g34hJC7Eks=
X-Gm-Gg: AR+sD13SGElwTYsuc0s3t2F6RS0y0X4kDHWL7ta/P6+HVIhdDZv+R8R93NlglNok4SX
 /ZEQIBvs+UbooGs4bMk4sAJ2q6/J3ZkKpEl+9Y/PJrpP1F66JZEVb/PkYio3OTPagbL5eRsWjB9
 zIZl0KpSvD2LaCCl8D3/n6iAca8tCqsCS0FedsLtxxU0HTuq31YPYBq1vzbWB478UfxAFM7D/P2
 tsSrBEiZU+TzWljRu41qghkxoRL0ghLq+0UOQSZlhIkwJxkfZy6CBPeSeS8cxgYt25O/YHeqMnz
 LdkMBBuTPOP7pwT4cRVnd6GnFiCZR/0UuEtg/KHEYborGgXiYjEmGmRiOHcNOPfYr7HNa5KF2WN
 3qT5O35imM4Rujm3z+USlOQ0FMotmUKSzRWkslgGV1AmVd051unCLpyyjKSvSc2gEzJgeZbBqPQ
 Ux33L6xYFX8tGz1pfLQ9vL7DleoaiBfxqGDfMkJvPUFcVMOZ88rdEQVFy8A1L7
X-Received: by 2002:a05:6402:1f07:b0:6a1:c908:1701 with SMTP id
 4fb4d7f45d1cf-6a42f26dab3mr31841527a12.13.1787585110195; 
 Mon, 24 Aug 2026 08:25:10 -0700 (PDT)
Received: from draig.lan ([185.124.0.156]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-6a59e012f84sm13536443a12.8.2026.08.24.08.25.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Aug 2026 08:25:07 -0700 (PDT)
Received: from draig.lan (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id 6D39F5FC09;
 Mon, 24 Aug 2026 16:25:02 +0100 (BST)
From: =?utf-8?q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
Date: Mon, 24 Aug 2026 16:24:54 +0100
Subject: [PATCH v2 7/8] docs: deprecate virtio-crypto
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260824-fixes-for-11-2-v2-7-352c6b890402@linaro.org>
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
 Fabiano Rosas <farosas@suse.de>, 
 Mohamed Mediouni <mohamed@unpredictable.fr>, Thomas Huth <thuth@redhat.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1968;
 i=alex.bennee@linaro.org; h=from:subject:message-id;
 bh=cMLkR++Pqz7yCt0s5pb0e/7fsHML1OtITb6mzDUOj2c=;
 b=owEBbQGS/pANAwAKAfvQ2wlanipEAcsmYgBqjGJOraK+kojWIq01tyMbXtc0yAj6astNti5DP
 MkJ9/4MsP+JATMEAAEKAB0WIQRmha6Z51FnvK/I3zX70NsJWp4qRAUCaoxiTgAKCRD70NsJWp4q
 RF+VB/9R/UJ6dGOCUOj//jdooY2wqVc6kBH/x04y5MN+vHX5qOfOdroZ1hhJxWTULR1FDPiKvjV
 YlOoG7mMlWuR/aWFq7oU7deiRER3vlSK6+gHYiJVv+f4zzcIpb1lpi/YWjnkd08P5Ug8vALifEb
 iSnUcIbtNqQ6G9D/qRuHiY1b/UeNGakeAEIkcxE4m8L2DaSL1jdOmDBFcChtRcsHnMl36W4PoZS
 a4Klv/esnpfgShOR2KOc6t86nq91uD+ktHJb3asFLs3PBd6gUxzAsggjqOoUKI4IUaqdu8XxLas
 aFLhO+MXfgVXJQS6j3orz7vb931eDG/4cNkmZeM+wmqAOy9F
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

We have outstanding guest exploitable bugs in the code which is fairly
complex and needs some serious love to clean it up. As off-CPU
cryptography acceleration seems to be waning in popularity lets just
the deprecate the sub-system with a view to removing it in a couple of
cycles.

We can also remove the backend code at that point as well.

Link: https://gitlab.com/qemu-project/qemu/-/work_items/3625
Reviewed-by: Mohamed Mediouni <mohamed@unpredictable.fr>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
v2
  - mention the backend bits (only used by virtio-crypto)
  - use Gonglei's modified version of the text
---
 docs/about/deprecated.rst | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/docs/about/deprecated.rst b/docs/about/deprecated.rst
index 0c656a968fc..05e4ce8cf16 100644
--- a/docs/about/deprecated.rst
+++ b/docs/about/deprecated.rst
@@ -276,6 +276,24 @@ future release. Where no 'dh-params.pem' file is provided, the DH
 parameters will be automatically negotiated in accordance with
 RFC7919.
 
+Devices
+-------
+
+``virtio-crypto`` and cryptodev backends (since 11.2)
+'''''''''''''''''''''''''''''''''''''''''''''''''''''
+
+The ``virtio-crypto`` device emulation is quite complex code with a
+number of known flaws. It has never been migratable, so it is
+unlikely to be used in any serious virtualization setting. Modern
+ISAs provide on-CPU cryptography instructions (e.g. AES-NI/VAES,
+armv8 crypto extensions), and the Linux kernel deprecated AF_ALG
+and dropped its off-CPU accelerator support in Linux 7.2, removing
+the primary userspace path for off-CPU crypto acceleration. The
+time for this sort of off-load has passed.
+
+As this is the only device that uses the cryptodev backends these will
+be removed at the same time the ``virtio-crypto`` device is.
+
 Device options
 --------------
 

-- 
2.47.3


