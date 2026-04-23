Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 250DBFDEE27
	for <qemu-arm@archiver.kernel.org>; Thu, 23 Apr 2026 17:04:02 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wFxSv-0001Fg-2Q; Thu, 23 Apr 2026 13:03:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1wFxSd-00010m-I4
 for qemu-arm@nongnu.org; Thu, 23 Apr 2026 13:03:40 -0400
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1wFxSY-0005Qb-FT
 for qemu-arm@nongnu.org; Thu, 23 Apr 2026 13:03:31 -0400
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-488b150559bso55110085e9.1
 for <qemu-arm@nongnu.org>; Thu, 23 Apr 2026 10:03:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1776963805; x=1777568605; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=U1NXswT2g4EmWOQS8rfES2kgf/hXgcwodQ+5qwGBtok=;
 b=F8Xkbu1U4nNVUGh1aKDlKOn2Qqz5jOtlaLXk+JVIhL2fRLa5y2Mr4+Ft4Scm0pgkht
 62skfHF6D/mg6YDSFfgNgVJAqMyfx8dly9D6gB23md20t+95ezfWT0tgsdXvaF/Nj575
 ttROP3TzAsWEArFw7UOvfHrCB4RTrQZ8KdV3SSZYT9xF3ui5O0dXRfYH1q9OGv6q3Gfd
 N5XYRJC72LzyJwPoCp0ao+c3aQYJzZE8W+j3II1eAh/Q6gyUzfH5yVAQF5GVjQXOKuvW
 gH2b1OOCVfecd5U4zmGufowjGx1qA4cBcKQBDQ20+Wiok7zf/Y08r/26F1vfFXqYrr5e
 M4ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1776963805; x=1777568605;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=U1NXswT2g4EmWOQS8rfES2kgf/hXgcwodQ+5qwGBtok=;
 b=BiPJFmAXNNGVUrjYz3mDMzabPsx8Ngu3IU7W8YBoDyKNI1IHpl2le2iI398bNsLHj4
 rlxFebCxFDD0KJKjQjdz1lhKVSyb/WT8lT2cVquswqPnUzNqfCNiZ3eY6V65wto7Wjm6
 Lsb+tJWKCFKogilYVHSOLH0w97kqlx2JOiLEgSZ5Y98YZ+SqdV4OyyuXJMRzCArVRRr3
 n6pfORDOqQvG0ITV1BIpgwCO4c59UJWYcA7CRg0DtXGb+Yk9byLM605TV5R1vEVvahmG
 hUwiF9fgg87btUYjHlO8ipGheoIvQaNMfsOvOIySZxsmAnzJJrePAjtN+FnTBAsiAzgj
 rnmw==
X-Forwarded-Encrypted: i=1;
 AFNElJ+AEhsPtLxtPWizVw8e5qdjSJ/phA9sO0aRxdPWVw7xd92fj1wehEGt3/6zHbbzVdbH+97FTkyojA==@nongnu.org
X-Gm-Message-State: AOJu0Yzs7Og7CB6v87Uo3wtijT5Q5dcxJyV2pGP7aXDgWCRfHTt+VFwK
 KRST8VK4nF/vWOG693ZgZteV9ACHSdhMrlXb+BNpxgXVzZmceEcolqlom3FB2dMgz6DtyXTiKjZ
 hhtxqkXc=
X-Gm-Gg: AeBDiesZBynFpXdRJYq+EkQ+GOJSz5Z5BDnbXmoXHZPDBciuNw3cg9vQV8laYjFyJ/C
 Hpxdw5bT1IdoxAvEK8YfQqjzi3j4KAU5grJIsbbFqHlhx73b/+EGNFMJ3H2pGleZLlUWLH9/KTW
 DRPZdCYZxW0DjEd8hO2Enz1nOqqGghb6dxm1gTpqYNo5YR4WG7CrJtyCJnEPF1G3v919SFgTHRK
 QAc2rL/IZW0tBeE8OL9mFAVFSJWHbi11AsVlBfwkWLJAAF7h/NA/S/O9F+OS/14sl9OkCq6Jq8I
 xdfAE8k7G3TQZSacKB1h3IY9DOE9yyDbmJeEek2T6aiSxUGF3EsWDbiPJ1MFUhdoNCGa8C8aZ5C
 jQNWTT9SO87XOhny5f9J4kSsWYqjHZiQ6fnAgDaISfmMGB1l1nuOs//nSS1VzCf95BIZM9hxwVV
 G7uW9tI9d/lTpx5ldQtIdLkB8meFyNLdvXXqrhW7M/eeqvrth1DoSWlNCJXUAo5fgCZhBib3+U0
 urq7yf+C6Y=
X-Received: by 2002:a05:600c:6297:b0:486:d76c:fa57 with SMTP id
 5b1f17b1804b1-488fb77155dmr372134825e9.17.1776963805093; 
 Thu, 23 Apr 2026 10:03:25 -0700 (PDT)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-488fc1c01cfsm556148625e9.10.2026.04.23.10.03.23
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 23 Apr 2026 10:03:24 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Roman Bolshakov <rbolshakov@ddn.com>,
 Jonathan Cameron <jonathan.cameron@huawei.com>,
 Mads Ynddal <mads@ynddal.dk>, qemu-arm@nongnu.org,
 Mohamed Mediouni <mohamed@unpredictable.fr>,
 Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Alexander Graf <agraf@csgraf.de>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 07/16] system/cpu: Reset vCPU %exception_index before resuming
 it
Date: Thu, 23 Apr 2026 19:02:19 +0200
Message-ID: <20260423170229.64655-8-philmd@linaro.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260423170229.64655-1-philmd@linaro.org>
References: <20260423170229.64655-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32d.google.com
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
 system/cpus.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/system/cpus.c b/system/cpus.c
index bded87feb1c..b4c7f94332d 100644
--- a/system/cpus.c
+++ b/system/cpus.c
@@ -621,6 +621,7 @@ void cpu_pause(CPUState *cpu)
 
 void cpu_resume(CPUState *cpu)
 {
+    cpu->exception_index = -1;
     cpu->stop = false;
     cpu->stopped = false;
     qemu_cpu_kick(cpu);
-- 
2.53.0


