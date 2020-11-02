Received: by 2002:a19:6b17:0:0:0:0:0 with SMTP id d23csp3986868lfa;
        Mon, 2 Nov 2020 06:44:54 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwyVCLG376nruP3PwdJRP56AANucJP75Dd2JTxhe+9XOSdK9jAcK/G8HSSFhqTE35hzxIjP
X-Received: by 2002:ac8:6f23:: with SMTP id i3mr14676757qtv.255.1604328294069;
        Mon, 02 Nov 2020 06:44:54 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1604328294; cv=none;
        d=google.com; s=arc-20160816;
        b=OyaElWCHDyKjFsaJENOnChaebWEzAV939VXdT0MY8kvgxQ6eOvBhgBQzbO3LpKMUjX
         lAfG+duGarszZmnG1R+licPpM/hodm6RgyMMpw64icM1CDrb0PAllFiWnvozvUVc0WnJ
         CWgsIWcZ+Y4qLjaxC33Aea9Od8n/BCvgwNSwIQTpr8eb1HuBrpaQEGEpmmjtboWjYEJK
         kjSji8Hw+FZX0KmjUvd84JKFU+djACGcxJtSMknc+eyeEOetr68kK/f68rqodv3Ty/WO
         SNwtRiMy35PhCv+N5bXdOYawTmvW0EVIxQIBvLNb5ezY8dKSVvxSTAPuhL7jZ0cLgpuV
         2qmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=9QUU0pBZ1NcwhhSPi5zIux+LiK+R7ed8+irli08wV+4=;
        b=SCVqWJOcNWC/cVLGfDdkUNLyKUhRGIUUAR+0J4Iv+Y06OyogAE1uU46hkhlSYqr/tV
         gTN6+OhYfiwIWtEHi71HIUtF3L5apeqr/UpJnU0TIeSM1lWvAg1f8SKsj6OhCuHBoxI3
         LK19mPsG9vqIeZ6cVUr/QPts/TqQ6QeS5J/1K5mKH/wHuRXjR7QdFKEUuf32XIJ2oUur
         WploKCiUFGpt2nQNWJYp6pl0IcjYnRsZlLwZnpUldSDst9D5V+SDUD5DycLjZFOg3zJw
         VWcUvgdMz3YyZCypW7PLK+dmvFJZkHlJqFnuM/OoRZPYPtZlh+rS0Y2h+ZlsRN/cJeV/
         5S9w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b="VLW9Ud6/";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s3si8259288qtw.246.2020.11.02.06.44.53
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 02 Nov 2020 06:44:54 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b="VLW9Ud6/";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:54024 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kZb4n-0003m8-Fs
	for alex.bennee@linaro.org; Mon, 02 Nov 2020 09:44:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42754)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kZb3G-0002GF-9Y
 for qemu-devel@nongnu.org; Mon, 02 Nov 2020 09:43:18 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:28873)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kZb3E-0005DP-PO
 for qemu-devel@nongnu.org; Mon, 02 Nov 2020 09:43:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1604328194;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9QUU0pBZ1NcwhhSPi5zIux+LiK+R7ed8+irli08wV+4=;
 b=VLW9Ud6/P3QDHHVb4dTjrgCHjmkStzpq/9EiLl6B3yJ08D8muxnWOGlwi/88y1HEYs+acI
 cfB0rNSsvffgHzbiFe07F4DDN5eLpV/M73r89Y6JtHGJNWo97Hmwm+qkQirwUYo+1dk9L6
 RtDNfN8PRAVfh75HTJt+L2TnbJ+9T+Y=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-60-KZp1FxWJPtCXm1rud6HH_A-1; Mon, 02 Nov 2020 09:43:13 -0500
X-MC-Unique: KZp1FxWJPtCXm1rud6HH_A-1
Received: by mail-wm1-f70.google.com with SMTP id t201so3424569wmt.1
 for <qemu-devel@nongnu.org>; Mon, 02 Nov 2020 06:43:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=9QUU0pBZ1NcwhhSPi5zIux+LiK+R7ed8+irli08wV+4=;
 b=DSA472KC2jTrvi6h1dAUQSfujthqL8mrG43QqUFKXj/cr8tn64XIuLfdbYUKapPHMC
 bfTlICmC4rgNGYKxtrcd1w+8NjsOz24eni+dCdrrS328CBr/mqGQUkADq5h0Fqvpw/jO
 JOyFePCjgWnWdaRe33QqXVBqlhL4Xj2vgRNbl+PXM81nbl+ZTxOaLb6u+S04VEel4HE1
 8lh+bT/FObkoUKQsyCrj98UecTp9hayOGordQ8AmNYizgbMjmhHC3EGjeAKzLTc4iTja
 oIorrHosYsj9sc4KbcaXHdopsqPLRUeePRmR8Ke0Q4go8FmgBpHuyi5ypZHSzz3JbnaY
 T/CQ==
X-Gm-Message-State: AOAM531UwskGi+sNdMdJM8G7mYiVPQVCqHEv3bUChQYj1H4uzpPtuj7m
 BUcUlIPDe09beW/dQwY+XDU8Qowxd4LWFipY7pngrLjci9XyaQVItmjjW37HfW92Xmhc/sdecgb
 cB2br3VBYAsspx6w=
X-Received: by 2002:adf:eaca:: with SMTP id o10mr19308417wrn.9.1604328191789; 
 Mon, 02 Nov 2020 06:43:11 -0800 (PST)
X-Received: by 2002:adf:eaca:: with SMTP id o10mr19308403wrn.9.1604328191602; 
 Mon, 02 Nov 2020 06:43:11 -0800 (PST)
Received: from localhost.localdomain (234.red-83-42-66.dynamicip.rima-tde.net.
 [83.42.66.234])
 by smtp.gmail.com with ESMTPSA id f1sm12307777wmj.3.2020.11.02.06.43.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Nov 2020 06:43:10 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: "Daniel P . Berrange" <berrange@redhat.com>, qemu-devel@nongnu.org,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Cleber Rosa <crosa@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>
Subject: [RFC PATCH-for-5.2? 4/5] tests/acceptance: Only run tests tagged
 'gating-ci' on GitLab CI
Date: Mon,  2 Nov 2020 15:42:44 +0100
Message-Id: <20201102144245.2134077-5-philmd@redhat.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201102144245.2134077-1-philmd@redhat.com>
References: <20201102144245.2134077-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/02 03:02:24
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Sarah Harris <S.E.Harris@kent.ac.uk>, Michael Rolnik <mrolnik@gmail.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Fabien Chouteau <chouteau@adacore.com>, Aurelien Jarno <aurelien@aurel32.net>,
 KONRAD Frederic <frederic.konrad@adacore.com>,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 qemu-ppc@nongnu.org, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-arm@nongnu.org,
 Antony Pavlov <antonynpavlov@gmail.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: vzRpkMJEEQtx

To avoid breaking our CI each time a test is added, switch from the
"run all but disable some" to "only run the tagged tests on CI".
This way we can add a test to the repository, and promote it to
'gating-ci' once it is proven stable enough.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---

TODO: where to add documentation?

- docs/devel/testing.rst (too big, split?)
- tests/acceptance/README.rst

---
 tests/Makefile.include | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/Makefile.include b/tests/Makefile.include
index 3a0524ce740..f39ba760c17 100644
--- a/tests/Makefile.include
+++ b/tests/Makefile.include
@@ -126,7 +126,7 @@ check-acceptance: check-venv $(TESTS_RESULTS_DIR) get-vm-images
             $(TESTS_VENV_DIR)/bin/python -m avocado \
             --show=$(AVOCADO_SHOW) run --job-results-dir=$(TESTS_RESULTS_DIR) \
             --filter-by-tags-include-empty --filter-by-tags-include-empty-key \
-            $(AVOCADO_TAGS) \
+            $(AVOCADO_TAGS) -t gating-ci \
             $(if $(GITLAB_CI),,--failfast) tests/acceptance, \
             "AVOCADO", "tests/acceptance")
 
-- 
2.26.2

