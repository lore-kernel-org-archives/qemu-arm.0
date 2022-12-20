Received: by 2002:a17:906:a84b:b0:7c1:2a22:dc39 with SMTP id dx11csp4678489ejb;
        Tue, 20 Dec 2022 14:06:32 -0800 (PST)
X-Google-Smtp-Source: AMrXdXs7FqwEBY3QpuDa5uIwsV+sMT4F+D28kktIIExnjINiPqGxnFUpAVFJdNft14aw7TLT+U8Z
X-Received: by 2002:adf:ef09:0:b0:242:7eb8:37bf with SMTP id e9-20020adfef09000000b002427eb837bfmr2391831wro.32.1671573992483;
        Tue, 20 Dec 2022 14:06:32 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1671573992; cv=none;
        d=google.com; s=arc-20160816;
        b=BLpk9VurmnvL/AHC3pi5/Khj6a+FkPy42S9MGxktWD4X1+fedXYgdX4WSvFmhKPx9q
         Lpbh+RKAsKB0cIWdJNKIq+7lDboNg+HzfVKARWesHkBjgWvQYWPJEvAbdlTSpGNQmqu4
         Py1FtiwhUzIBbD8KmnVtMVIjFeW6o3MP7gxc0HcjuTj2SGH91Vniyn6dyjioIiSnD9tL
         WVyilwQmjODhlheCj4MGDMgg4N6K+FTcLIXs0SOPdp913RL/pPgG/p2fiLv3BQlsg/zV
         J1RMLXj+VPHpnNrCt3elKrkcEcobtdMBUxhhOQMwRSSCXC9VwIk1c6M5pdWsaL6aTzk2
         F5+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:dkim-signature:dkim-signature;
        bh=7OdQM/8eRsSAwXEtAVdCRrBz0+E30cH0z5yS4phLJTE=;
        b=ADUELhU28THycunsjHCyGlrxZ1ZehCLUk9VeNPliHCTMLIiw+OmIivAgXacW7cH5k7
         0axHYwfsCFZSpBWfrLW/GGQGV+uDHb5dyh+xA7FXmyl5BW3Ac1jG4Njf5olKk3TcD/XV
         91+Ne2sei7GouRC95VLwETvFMgVIfCZMsSS1UKCF8G3izKHzcgMks6aTSbUDBbIbrQuj
         nTsZD/AkO1+QhV0CP2IoiubKpuyYTHShipTxwsiej7SweF0Mw+dWxg0urwQymfXGQ3Mr
         P+g+Vv1YXCAvoN6SyvcWHxoCS1zkOqvtFRglMwG2aG74uN76nhv/58yCZBaQ9hLOtFDf
         ZWUw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b=pD0XT3FB;
       dkim=neutral (no key) header.i=@suse.de header.s=susede2_ed25519 header.b=p4F1qhb0;
       spf=pass (google.com: domain of farosas@suse.de designates 195.135.220.29 as permitted sender) smtp.mailfrom=farosas@suse.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Return-Path: <farosas@suse.de>
Received: from smtp-out2.suse.de (smtp-out2.suse.de. [195.135.220.29])
        by mx.google.com with ESMTPS id b14-20020adfd1ce000000b00242743e1e16si8992911wrd.694.2022.12.20.14.06.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Dec 2022 14:06:32 -0800 (PST)
Received-SPF: pass (google.com: domain of farosas@suse.de designates 195.135.220.29 as permitted sender) client-ip=195.135.220.29;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b=pD0XT3FB;
       dkim=neutral (no key) header.i=@suse.de header.s=susede2_ed25519 header.b=p4F1qhb0;
       spf=pass (google.com: domain of farosas@suse.de designates 195.135.220.29 as permitted sender) smtp.mailfrom=farosas@suse.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id C220476A43;
	Tue, 20 Dec 2022 22:06:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1671573991; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=7OdQM/8eRsSAwXEtAVdCRrBz0+E30cH0z5yS4phLJTE=;
	b=pD0XT3FBoobifDtYiu7iu9XtyqQz40T95IsZi+hHTa5zy9eVmw1JWD6hCQFG3ZVftET4Tu
	YaXIPHi/zmAzf9MfVS3fpx8l0lAKTRuB+E63vR6EEwKVU1jhC256/9kbh4yk9eznFEHHRc
	fCYtZFmmvAbLgMy8f+XM2OF463is5Go=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1671573991;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=7OdQM/8eRsSAwXEtAVdCRrBz0+E30cH0z5yS4phLJTE=;
	b=p4F1qhb0sWkiWNr576P6IaGybZsIyzvr5fB18LqwMHHaq0Hksn8SoH5kMT8i3Eek5mzW9g
	Jjnq9VrdOMIBJ6CQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id DC98C13254;
	Tue, 20 Dec 2022 22:06:28 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id 75yLJ+QxomPwfAAAMHmgww
	(envelope-from <farosas@suse.de>); Tue, 20 Dec 2022 22:06:28 +0000
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
Subject: [PATCH v2 0/5] target/arm: Some CONFIG_TCG code movement
Date: Tue, 20 Dec 2022 19:04:21 -0300
Message-Id: <20221220220426.8827-1-farosas@suse.de>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: 0wuRllTBgojL

since v1:
- patch 1: dropped. I will include it in the next series;

- patch 3: tcg_handle_semihosting does not need tcg_enabled, only
  CONFIG_TCG;

- patch 4 (new): moved alignment check and updated comment.

v1:
https://lore.kernel.org/r/20221216212944.28229-1-farosas@suse.de

Hi,

This is the second round of rebasing the patches from:
https://lore.kernel.org/r/20210416162824.25131-1-cfontana@suse.de

These are the simpler ones that move code under
CONFIG_TCG/tcg_enabled. No new directories or files.

Claudio Fontana (4):
  target/arm: rename handle_semihosting to tcg_handle_semihosting
  target/arm: wrap psci call with tcg_enabled
  target/arm: wrap call to aarch64_sve_change_el in tcg_enabled()
  target/arm: only perform TCG cpu and machine inits if TCG enabled

Fabiano Rosas (1):
  target/arm: Move PC alignment check

 target/arm/cpu.c     | 31 ++++++++++++++----------
 target/arm/helper.c  | 19 ++++++++-------
 target/arm/kvm.c     | 18 +++++++-------
 target/arm/kvm_arm.h |  3 +--
 target/arm/machine.c | 57 +++++++++++++++++++++++++-------------------
 5 files changed, 71 insertions(+), 57 deletions(-)

-- 
2.35.3
