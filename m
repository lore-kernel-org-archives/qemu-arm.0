Received: by 2002:a17:906:da85:b0:8b1:202f:4753 with SMTP id xh5csp127989ejb;
        Fri, 17 Feb 2023 12:14:29 -0800 (PST)
X-Google-Smtp-Source: AK7set+yMF+H7iFRjLI+atgQFFtjobzxRRgD7mb/pT4/mus4MsqRhSOoKmxzKPoMT2Z4r3XfcWUB
X-Received: by 2002:a5d:6182:0:b0:2c5:80ad:aa9e with SMTP id j2-20020a5d6182000000b002c580adaa9emr5692304wru.67.1676664869412;
        Fri, 17 Feb 2023 12:14:29 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1676664869; cv=none;
        d=google.com; s=arc-20160816;
        b=owwBMbDihzdmMH53eb8Gi6e/FSyBwUUSMxRTlY2VLGixz2B+lNtN28X8cAY4dX/rfD
         L+LQZMN3o5WcyQutDYZEryUlGlVQqxHdN686AQr+HyWVSx5SXv6vwnsUi2lT1ugx62E/
         9Ir+GiB9mqcuYnov63WYiNdNyXZBnxXYwokedFxszo0FdgwNV4djCcuIX/gsB2sbkfWR
         t9yDGcP+uXrcfC7Ow/UPmUzgMREdTSteEMfLol6/LrAra0WRJV5d4MJ7OW9aTLvJVFso
         UN0DVCoX7yGIQxqu+TAOk8uPCtOBL5Ufe20sHcFF7RUJaCg1QcGPQCFNe2AdUfeBVuih
         P3GQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:dkim-signature;
        bh=idMRdTknij5akfDpU2EHeXHT1plxdisEKd5SP6dUfeA=;
        b=DXKPCRPcQB0Ii1GyzZxo2Lfn0YhXV6sM9KKtzdH9VCFhDSR4G8jeuY3bP87TcSt68h
         3LPMmy8owCVQ5ED8j0ur1ZuQ5nDjgICGAuVWD/kVyE5yMNmnO/rvdsTG1lWve+FNMdlO
         vbjRZ3G9JRPQtv6T94SBcSePqWeRSp1ZSjMucrXnIVa7F5riqQIgpTVjKL6nkx2MBgB8
         vC1GhtjvF1hV6/F8DNou2Imz9tH0FvHTaHsvFHdD76Ej/YcbkU/rS7mh1MCk7Ok7Q+LC
         BO/1WYp+tpOleqEZ+42yzOGzdbHs9VZ0If2tOAUDsdD+sBIhWkS6C3qwXOVOK7i+h7P2
         9NSw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b=bm3lutw5;
       dkim=neutral (no key) header.i=@suse.de;
       spf=pass (google.com: domain of farosas@suse.de designates 195.135.220.29 as permitted sender) smtp.mailfrom=farosas@suse.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Return-Path: <farosas@suse.de>
Received: from smtp-out2.suse.de (smtp-out2.suse.de. [195.135.220.29])
        by mx.google.com with ESMTPS id i17-20020a5d5231000000b002c5a790e961si3483917wra.104.2023.02.17.12.14.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Feb 2023 12:14:29 -0800 (PST)
Received-SPF: pass (google.com: domain of farosas@suse.de designates 195.135.220.29 as permitted sender) client-ip=195.135.220.29;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b=bm3lutw5;
       dkim=neutral (no key) header.i=@suse.de;
       spf=pass (google.com: domain of farosas@suse.de designates 195.135.220.29 as permitted sender) smtp.mailfrom=farosas@suse.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id F0AB720FB9;
	Fri, 17 Feb 2023 20:14:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1676664868; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=idMRdTknij5akfDpU2EHeXHT1plxdisEKd5SP6dUfeA=;
	b=bm3lutw566+78owGzZKoWC+A2DfJbowsqaElh7l9bydoIm0vuUVN1ipC+Sh8xjSbkIjdXD
	iBMxeqQzbPoYPqo8FieRlIpMZ01py/Xnwo2DE/M5G/u4tjey8qRUTeJ5g+N9yGBZ/RNA4r
	k/7Kb6dfq9IxD2S3WzWtxx6CCXg6VjU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1676664868;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=idMRdTknij5akfDpU2EHeXHT1plxdisEKd5SP6dUfeA=;
	b=bYnAAtdSRGHWqT0+Xo5VhIEp3pttgDFkh4xvgHhM4pG00FfIBpxshnPZbml/8F8Ma6q9Th
	XcHGoo4Knh2Iv9Dg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 143AD138E3;
	Fri, 17 Feb 2023 20:14:25 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id 0HZxMyHg72MwIAAAMHmgww
	(envelope-from <farosas@suse.de>); Fri, 17 Feb 2023 20:14:25 +0000
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
	Alexander Graf <agraf@csgraf.de>,
	Cornelia Huck <cohuck@redhat.com>
Subject: [PATCH v6 10/29] target/arm: Move psci.c into the tcg directory
Date: Fri, 17 Feb 2023 17:11:31 -0300
Message-Id: <20230217201150.22032-11-farosas@suse.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20230217201150.22032-1-farosas@suse.de>
References: <20230217201150.22032-1-farosas@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: jwAFcEsWbE0Y

From: Claudio Fontana <cfontana@suse.de>

Signed-off-by: Claudio Fontana <cfontana@suse.de>
Signed-off-by: Fabiano Rosas <farosas@suse.de>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Tested-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 target/arm/meson.build      | 1 -
 target/arm/tcg/meson.build  | 4 ++++
 target/arm/{ => tcg}/psci.c | 0
 3 files changed, 4 insertions(+), 1 deletion(-)
 rename target/arm/{ => tcg}/psci.c (100%)

diff --git a/target/arm/meson.build b/target/arm/meson.build
index 3e2f403005..a5191b57e1 100644
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
index 1f27ba1272..fa8a9eab93 100644
--- a/target/arm/tcg/meson.build
+++ b/target/arm/tcg/meson.build
@@ -43,3 +43,7 @@ arm_ss.add(when: 'TARGET_AARCH64', if_true: files(
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
