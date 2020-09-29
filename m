Received: by 2002:ac2:4c26:0:0:0:0:0 with SMTP id u6csp4986033lfq;
        Tue, 29 Sep 2020 15:44:12 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzAFpgXyIJVdcpUOG6uBHYMv7BSXBlclQ74fdRmtUphx4rj42Rt0T9aXWwyyRJf+YCtN/+p
X-Received: by 2002:a50:fc0b:: with SMTP id i11mr5676719edr.164.1601419452656;
        Tue, 29 Sep 2020 15:44:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1601419452; cv=none;
        d=google.com; s=arc-20160816;
        b=Aj4/BmoYiXFY7vvKgTHCBqdqkKoHFXEKwzox5pSwqN2uaXOUAYreubQfvBpzwLfwT5
         lZahLQV7XvKvQOFk9S5OOwL60ouqZQPhChlRAUopZR23F6sO2XTF+P0O+P+gYCYxoyI5
         Qq1MZ8YLVDlLxDQKgPVzVUTV7ELqERNO8PTYvc+WtQGTglS9tp3U+Jf/tiTnmU/cklel
         kmeVR3LdywhVTtcytuhMLdldmMxcjv5nUD/2JEC3uQZg01eUtYku/EBBlFfXwHxCVIL8
         uIGFdubCN+HDa9O0NkbqPRCSc87peLtoUTsuwCn7AkBJWMGH7hxdgMQvSWdAMhTP5vT0
         +n6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=fnVaKlxSjgosYNWUZ3C9BB5KnUFHrX+zW6dbopznvYU=;
        b=LBzLLhlZUMQcxXt26SJf/HZXR98jepvggOKZck3r/8uPALS6d2/TtiVR9WYMYPcv90
         579jkfAejVWK6KrfYQ9X+7/ewl9U0dkKh1+ypSfKaJdv7wYOwVbHLVOk0iVXAd0sw7vG
         xdq0wJ1qp6T89If8UG5SR0kcDC/v42he8TsWNmhaxoePYGoUGKaE7zjZcila5t5MPVMh
         RP+PNJZimCORgrbTFOZNUEqlw7DrFAA91ULDbbkj8e6MpVhtcL5wq2PBh1dY+9w1YF5m
         JtEy3as2ZrNsL9req+5modSe/WO3A+1a896IN5qBN0hUZvd/aMxTLjxsLn9eARVEk7HH
         cLgQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=MVZaWTj3;
       spf=pass (google.com: domain of philmd@redhat.com designates 216.205.24.124 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <philmd@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [216.205.24.124])
        by mx.google.com with ESMTPS id cq27si3728579edb.415.2020.09.29.15.44.12
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 29 Sep 2020 15:44:12 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@redhat.com designates 216.205.24.124 as permitted sender) client-ip=216.205.24.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=MVZaWTj3;
       spf=pass (google.com: domain of philmd@redhat.com designates 216.205.24.124 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1601419451;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=fnVaKlxSjgosYNWUZ3C9BB5KnUFHrX+zW6dbopznvYU=;
	b=MVZaWTj3uuEWiAJX7mnLgvCR1qJdqbNF7Nh0l4y4x/JPJrz8tRNUAuG6j33lDKNGvmWG2G
	daNojlzfhWL7Kmw6Pq3P6/F8zJ90dEURNaiaEeB+rcIrVqXHwbZ7nUxo76h2bXdHpavGdR
	mrDR+0DUrG8Yr5Fo45KvI9Bd2gamV4o=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-377-Vr-Q7DsMM9Os7WQr2RYaAw-1; Tue, 29 Sep 2020 18:44:09 -0400
X-MC-Unique: Vr-Q7DsMM9Os7WQr2RYaAw-1
Received: by mail-wr1-f71.google.com with SMTP id 33so2341573wrk.12
        for <alex.bennee@linaro.org>; Tue, 29 Sep 2020 15:44:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=fnVaKlxSjgosYNWUZ3C9BB5KnUFHrX+zW6dbopznvYU=;
        b=gto8q4bDZOtg7Pe0I8IOaEBGLHhU7/mEzU3+qiGb4BcZ/Gt9i4/MleqcDQ9JrPzSOu
         ppELOxksTVNYK3h2Iv849NXB2FCmDXfvd7vdudoaxGN+/lAG8dz69cDwKecu4ZatNXJn
         QEn0dY3ZrIm9waJO2JvCz9t2nbKWIN5DDpSoET/Cetnd3x9KA1q80Sm84TZpD08VleGy
         rPgg4MDOapxfRMF112ZPVOA9T6eeAo6CYaljXSWPYms3IN2E89ZLOYT7qGMT8e63aa9+
         TyDMVRdYZjsu9SbIR5ZjIRA7AHiGL8jUwAonCy91hNpWdBQ+Me7ofNUMGHn0eVochiZu
         arbQ==
X-Gm-Message-State: AOAM5327qmKqYHJS7lydRo5JIUjNe7xk+GYLMUC3fP/daY7nGFVtDo8o
	Sp1GuOUzTPpDaDA8waDzXpGcVGI5C8ZrRtUAD0Q9J1SPFBeDV/muHEIHslFuvdUrUFM8jV7iGDa
	UHYHQMI3emjjFTGYZ
X-Received: by 2002:adf:f2d0:: with SMTP id d16mr6386598wrp.332.1601419448303;
        Tue, 29 Sep 2020 15:44:08 -0700 (PDT)
X-Received: by 2002:adf:f2d0:: with SMTP id d16mr6386570wrp.332.1601419448124;
        Tue, 29 Sep 2020 15:44:08 -0700 (PDT)
Return-Path: <philmd@redhat.com>
Received: from x1w.redhat.com (74.red-83-53-161.dynamicip.rima-tde.net. [83.53.161.74])
        by smtp.gmail.com with ESMTPSA id e13sm8276536wre.60.2020.09.29.15.44.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2020 15:44:07 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Fam Zheng <fam@euphon.net>,
	Peter Maydell <peter.maydell@linaro.org>,
	kvm@vger.kernel.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	qemu-arm@nongnu.org,
	Richard Henderson <rth@twiddle.net>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
	Claudio Fontana <cfontana@suse.de>
Subject: [PATCH v4 02/12] meson: Allow optional target/${ARCH}/Kconfig
Date: Wed, 30 Sep 2020 00:43:45 +0200
Message-Id: <20200929224355.1224017-3-philmd@redhat.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200929224355.1224017-1-philmd@redhat.com>
References: <20200929224355.1224017-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-TUID: l5DMDT5LBbvk

Extend the generic Meson script to pass optional target Kconfig
file to the minikconf script.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
We could use fs.exists() but is_file() is more specific
(can not be a directory).

Cc: Paolo Bonzini <pbonzini@redhat.com>
Cc: Claudio Fontana <cfontana@suse.de>
---
 meson.build | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/meson.build b/meson.build
index d36dd085b5..9ab5d514d7 100644
--- a/meson.build
+++ b/meson.build
@@ -529,6 +529,7 @@ kconfig_external_symbols = [
 ]
 ignored = ['TARGET_XML_FILES', 'TARGET_ABI_DIR', 'TARGET_DIRS']
 
+fs = import('fs')
 foreach target : target_dirs
   config_target = keyval.load(meson.current_build_dir() / target / 'config-target.mak')
 
@@ -569,8 +570,13 @@ foreach target : target_dirs
     endforeach
 
     config_devices_mak = target + '-config-devices.mak'
+    target_kconfig = 'target' / config_target['TARGET_BASE_ARCH'] / 'Kconfig'
+    minikconf_input = ['default-configs' / target + '.mak', 'Kconfig']
+    if fs.is_file(target_kconfig)
+      minikconf_input += [target_kconfig]
+    endif
     config_devices_mak = configure_file(
-      input: ['default-configs' / target + '.mak', 'Kconfig'],
+      input: minikconf_input,
       output: config_devices_mak,
       depfile: config_devices_mak + '.d',
       capture: true,
-- 
2.26.2
