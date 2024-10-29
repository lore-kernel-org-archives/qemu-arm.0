Received: by 2002:a17:504:82cc:b0:1be9:327d:8ee3 with SMTP id m12csp324088njj;
        Tue, 29 Oct 2024 08:18:37 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVmXl4dtkuNX2ekFDhAuSIC7lrTz4qVUzeWXXysKqUzQplKKlMN4ksKT6uezOdlEZQJmhtoOfkMJp5btw==@linaro.org
X-Google-Smtp-Source: AGHT+IH+eQSl9F3fzcDaB4obWez9MXA7QgPXxn0L8QgBgg56cVFi8F+Vvn/8VbaQi63qF0w6REXT
X-Received: by 2002:a05:6102:cd2:b0:4a4:4868:cfd9 with SMTP id ada2fe7eead31-4a8f6ac814fmr1656894137.1.1730215117173;
        Tue, 29 Oct 2024 08:18:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1730215117; cv=none;
        d=google.com; s=arc-20240605;
        b=UktjagOEEEJwOaVMQmmi8bpQp9p2hjr/+RYEqk5b3DUqYsmiksezRk+Hx09MVDZ/s4
         9yQaSuxfFX++lgDA3AQtE5se8hAI3AwelF31/ymxR4HgjmR6c+ygZN8jmle7PBb8PFWT
         T/rBT+vULi4u1PjOyjpJyjCZeVv6zDhth90pqn5bzvZ5SuYhpJQQJxH54Ic1w1msnV4g
         wSqP43t+f/AbPSoWqTPNLTOlCx/vx9zfRTUnnu+tQKnvJde+qZKSR0Vlhw7sVdx9Obt1
         A2pGQgWzSQALARY3Uh15q25tWaFs2H+cm+8nG44yzo16eMliU77urtzt1P7u2Q6u4gD4
         wVPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=8e1aymOVILrgw7W2xEL/OiCjMGpomvllpnPzHFIUe8Q=;
        fh=H2AmuqulvQE+T5zu97MCEUC3z9wF9NssS7895NhR/+c=;
        b=OKxOnGkmGYzLc6bekcQFszZa/gBR4DNKLb0Omxk6igU0s1iqrQ7yz1yY7aXKcQ38Ia
         r80Zci78RWXhgMKRjAP7Fgskw2dys7LC45oq1Sj0EFVYErA3+E5/n9x6IOkx527H0PSz
         6qfl5YzVxiw6CRS0hzEwne9gPchJuf+MwqRZMo+0XLfWfsGtyPqqgi46tFxfqxdxh4iu
         v5E4dcny/1d11FHxW2wGQmAhXPlsd1oren+FtXGOLeZgsfrcgQJMNagg3F3Kdplig2Xq
         xgNfjKLNYsRyQ+QFsnzxJ1u5piCXg+NOZjYot5l9dPvtjgpnyJXWwdeaPf1/pa5PrEaA
         r/Vg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Q+uhP822;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ada2fe7eead31-4a8c531127dsi2296986137.395.2024.10.29.08.18.37
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 29 Oct 2024 08:18:37 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Q+uhP822;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1t5nwD-0007eL-3Z; Tue, 29 Oct 2024 11:15:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1t5ns7-0000iH-CJ
 for qemu-arm@nongnu.org; Tue, 29 Oct 2024 11:11:04 -0400
Received: from mail-lf1-x133.google.com ([2a00:1450:4864:20::133])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1t5ns1-0007hn-6k
 for qemu-arm@nongnu.org; Tue, 29 Oct 2024 11:11:02 -0400
Received: by mail-lf1-x133.google.com with SMTP id
 2adb3069b0e04-539f72c8fc1so6906033e87.1
 for <qemu-arm@nongnu.org>; Tue, 29 Oct 2024 08:10:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1730214654; x=1730819454; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=8e1aymOVILrgw7W2xEL/OiCjMGpomvllpnPzHFIUe8Q=;
 b=Q+uhP822wY6j/2OBE1UFo1lAZMKykhjOlk99R3Qhx5Cp0L6s6e9NHQHQ4YV/r9V+mF
 1oMK+swtLxZUfOWzVdERvc8Wp09vchH9dBsXcSmB72gw7EVPvK7gzj/4tzAhR2rwdARd
 xGysPczgnYoLzYjGjeVCx2mV+h5LJdEA8yJ+RNdlRgmcGQ9VMYti4zQwp9vof6jZX2qj
 4lwObM7eQcUPWuR7NlOwsvq6rnbtySLF3oJDHRyyEd1YN7Dy3FDg953hLErwuOSOYCGX
 hw23IlegJ1blTbOClb48Kcb0LCbuAMSVqV0EdvQeBsTq7aWQoUCurbLKbyUG9hfmjGAS
 FWeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730214654; x=1730819454;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=8e1aymOVILrgw7W2xEL/OiCjMGpomvllpnPzHFIUe8Q=;
 b=J1SJTM6OlGXQvK4t79RaLPGXtHGdPiNJACxM33W0e3BL4Be1CPP/SQWqOH8OB4UfxC
 UHMQs5tntSQNpuSQspi8TszMdsBN5hr7L/+ZvIIAOgAaPQo12LpuegEyWY/2wKJHX6bj
 ZC35NCNDfFVZOlWR+6+/3pKxsCqBbJxW70pWbqQYJgoZdLkfYhJiAzHceUUzHGu668tW
 5Oe4iB+RFG9daHjQ2lC3voqwpku3F0RkfMBxU/ToJ0r3c9BuzrIKhuyVNVFzTOWAVUoe
 Ko0kHMv3yFCvcKWRh+FGnaJf4hkzOUEhHOIbYfgu0lZv0L2dMci50cJd9KQqvd3KoYrl
 0yDQ==
X-Gm-Message-State: AOJu0Yy+nFjmgm8BWRJM4m+Ekhk8j+XTJr26w6RAQfs3RVagSE5ZtaEq
 h+acW4QWJNbHQJ9AbDOiApM9axKb4iaU5DX7I0AUX38Qx61WPPIEYUN1AlDvTCKpGTpnf1KrnI9
 i
X-Received: by 2002:a05:6512:1392:b0:539:e0ee:4f5f with SMTP id
 2adb3069b0e04-53b7ecdeed7mr35054e87.18.1730214654213; 
 Tue, 29 Oct 2024 08:10:54 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4319360cc2esm146835865e9.44.2024.10.29.08.10.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Oct 2024 08:10:53 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PULL 08/18] scripts/symlink-install-tree.py: Fix MESONINTROSPECT
 parsing
Date: Tue, 29 Oct 2024 15:10:38 +0000
Message-Id: <20241029151048.1047247-9-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241029151048.1047247-1-peter.maydell@linaro.org>
References: <20241029151048.1047247-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::133;
 envelope-from=peter.maydell@linaro.org; helo=mail-lf1-x133.google.com
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
X-TUID: x/FWycHfiisR

From: Akihiko Odaki <akihiko.odaki@daynix.com>

The arguments in MESONINTROSPECT are quoted with shlex.quote() so it
must be parsed with shlex.split().  Otherwise the script will fail if
the build directory has a character like "~" in it.

Note: this fix cannot be backported directly to any stable branch
that doesn't require Meson version 1.4.0 or better; otherwise it will
work OK on Linux but will break on Windows hosts.

(Unfortunately, Meson prior to version 1.4.0 was inconsistent between
host OSes about how it quoted arguments, and used a different quoting
process on Windows hosts.  Our current git trunk already requires
1.5.0 as of commit 07f0d32641e ("Require meson version 1.5.0"), but
the stable branches are still on older Meson.)

Fixes: cf60ccc330 ("cutils: Introduce bundle mechanism")
Reported-by: Michael Tokarev <mjt@tls.msk.ru>
Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
Tested-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
Message-id: 20241018130852.931509-1-peter.maydell@linaro.org
[PMM: Updated commit message to give all the detail about the
Meson version compability requirements.]
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 scripts/symlink-install-tree.py | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/scripts/symlink-install-tree.py b/scripts/symlink-install-tree.py
index 8ed97e3c943..b72563895c5 100644
--- a/scripts/symlink-install-tree.py
+++ b/scripts/symlink-install-tree.py
@@ -4,6 +4,7 @@
 import errno
 import json
 import os
+import shlex
 import subprocess
 import sys
 
@@ -14,7 +15,7 @@ def destdir_join(d1: str, d2: str) -> str:
     return str(PurePath(d1, *PurePath(d2).parts[1:]))
 
 introspect = os.environ.get('MESONINTROSPECT')
-out = subprocess.run([*introspect.split(' '), '--installed'],
+out = subprocess.run([*shlex.split(introspect), '--installed'],
                      stdout=subprocess.PIPE, check=True).stdout
 for source, dest in json.loads(out).items():
     bundle_dest = destdir_join('qemu-bundle', dest)
-- 
2.34.1

