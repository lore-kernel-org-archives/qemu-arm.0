Received: by 2002:a17:907:c68a:b0:84d:2074:29bb with SMTP id ue10csp787569ejc;
        Wed, 18 Jan 2023 11:37:59 -0800 (PST)
X-Google-Smtp-Source: AMrXdXvXihgDMiqHCDPGeg1s8DQsATR+oMIkLiEVbMMMJCeP95G5/0VNGkr3Ik8La5xkYG63ujgk
X-Received: by 2002:a1c:cc11:0:b0:3da:1d52:26b5 with SMTP id h17-20020a1ccc11000000b003da1d5226b5mr16407297wmb.14.1674070679368;
        Wed, 18 Jan 2023 11:37:59 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1674070679; cv=none;
        d=google.com; s=arc-20160816;
        b=tKnldhqsSpDaOThru0bWrx0jrlRK1neOeH6+blCXRPJZGlmMQ8TKztCO3kaih/oLB8
         eE9dKDX2NjtXWLPCiDckkq+uqt+Bn9VA6MhyNWX3VArNDOUQ49xHhmynstGkMKxRyGS+
         E+cj25JRf4FX4gKcJHsotbbperu/f8xQiAeEDloOBRJpeG+Rtw4cmxV3d9WO3/Nx3uCw
         VxIqhaJrrnXyYMwA87yOhv2WG8gP1jy5kCbPaMMLnSrP4KvZ6KP869okeK7A9WIVgbkz
         jpj+pgP16g+A5XDqKjd9QZlhPD7Y00pzURpRVFGYLRVDYKNXuaDMq+C7xf7apNpXjF92
         uCeg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:dkim-signature;
        bh=2bZNRFBZ+XzBgzjYJl5VTmOByJ6GMFubKN5YaXKn3TM=;
        b=G3eg9GqW4mTTqNwmHuCIycjLFCTNFhNZlpB2lA7gMgtasGLCcHMP0qqKdzfGr33K/d
         z5Llljnw2i6O2o4e71PIAamlsAjixdmwaahAssrHhq0f5oc+D2Unk/h52+i4d0hfb66S
         8dxU2bfx7tgITrJxOi1wnLFq6yNoJn1DkcP/wh7zxV4Q5GB+Wxm+/M4KRIraCbyrUlVs
         uDLE7Ohowdf5pP6hImH89Iki6f1zKBK6vaRH+ql38GHcwFxThSzJPmQNL8MXHKA5Zpyy
         HHH3muAwpJx6+tZ441lFXg+pP3kzDXvYE53CvWwyT0MugdCAiN4K51uWTR79gf3yFZjH
         YBGg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b="JOXlC/LQ";
       dkim=neutral (no key) header.i=@suse.de header.s=susede2_ed25519;
       spf=pass (google.com: domain of farosas@suse.de designates 195.135.220.29 as permitted sender) smtp.mailfrom=farosas@suse.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Return-Path: <farosas@suse.de>
Received: from smtp-out2.suse.de (smtp-out2.suse.de. [195.135.220.29])
        by mx.google.com with ESMTPS id y14-20020a05600015ce00b002bdc14dc952si23814073wry.494.2023.01.18.11.37.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Jan 2023 11:37:59 -0800 (PST)
Received-SPF: pass (google.com: domain of farosas@suse.de designates 195.135.220.29 as permitted sender) client-ip=195.135.220.29;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b="JOXlC/LQ";
       dkim=neutral (no key) header.i=@suse.de header.s=susede2_ed25519;
       spf=pass (google.com: domain of farosas@suse.de designates 195.135.220.29 as permitted sender) smtp.mailfrom=farosas@suse.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 05C6B20DE8;
	Wed, 18 Jan 2023 19:37:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1674070679; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2bZNRFBZ+XzBgzjYJl5VTmOByJ6GMFubKN5YaXKn3TM=;
	b=JOXlC/LQ+Lki9HCIp1tAoGZ4tzcMbOiVkH89SxGVjiq7qRd86GEUaJotXixBi8M3fXTALS
	HtghX6PvKo9yMKFNTX0A/uoFlJRdW1i6fkZ06EFm2P7Fjne0BWrE1RZjx8g7YdsauKa0n8
	PZxlQMh1lygXdp0uj8oxSSNOjD7zpzc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1674070679;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2bZNRFBZ+XzBgzjYJl5VTmOByJ6GMFubKN5YaXKn3TM=;
	b=ITVR8HpZP2DmwQosOOTLFS5IJg3PUG1clc21lEvkOX/Q7l43gCZ2hwCzdc8X4MR3PVwSrm
	VI45ipcdsBRgYyAA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 64219139D2;
	Wed, 18 Jan 2023 19:37:56 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id sBSUC5RKyGOWBwAAMHmgww
	(envelope-from <farosas@suse.de>); Wed, 18 Jan 2023 19:37:56 +0000
From: Fabiano Rosas <farosas@suse.de>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Claudio Fontana <cfontana@suse.de>,
	Eduardo Habkost <ehabkost@redhat.com>,
	Alexander Graf <agraf@csgraf.de>
Subject: [PATCH 11/20] target/arm: Move psci.c into the tcg directory
Date: Wed, 18 Jan 2023 16:35:09 -0300
Message-Id: <20230118193518.26433-12-farosas@suse.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20230118193518.26433-1-farosas@suse.de>
References: <20230118193518.26433-1-farosas@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: japwbHjv9Ony

From: Claudio Fontana <cfontana@suse.de>

Signed-off-by: Claudio Fontana <cfontana@suse.de>
Signed-off-by: Fabiano Rosas <farosas@suse.de>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
---
 target/arm/meson.build      | 1 -
 target/arm/tcg/meson.build  | 4 ++++
 target/arm/{ => tcg}/psci.c | 0
 3 files changed, 4 insertions(+), 1 deletion(-)
 rename target/arm/{ => tcg}/psci.c (100%)

diff --git a/target/arm/meson.build b/target/arm/meson.build
index 01143a805c..595d22a099 100644
--- a/target/arm/meson.build
+++ b/target/arm/meson.build
@@ -22,7 +22,6 @@ arm_softmmu_ss.add(files(
   'arm-powerctl.c',
   'machine.c',
   'monitor.c',
-  'psci.c',
   'ptw.c',
 ))
 
diff --git a/target/arm/tcg/meson.build b/target/arm/tcg/meson.build
index c27ac2939c..47006f903c 100644
--- a/target/arm/tcg/meson.build
+++ b/target/arm/tcg/meson.build
@@ -44,3 +44,7 @@ arm_ss.add(when: 'TARGET_AARCH64', if_true: files(
   'sme_helper.c',
   'sve_helper.c',
 ))
+
+arm_softmmu_ss.add(files(
+  'psci.c',
+))
diff --git a/target/arm/psci.c b/target/arm/tcg/psci.c
similarity index 100%
rename from target/arm/psci.c
rename to target/arm/tcg/psci.c
-- 
2.35.3
