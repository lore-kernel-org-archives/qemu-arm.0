Received: by 2002:a17:906:a84b:b0:7c1:2a22:dc39 with SMTP id dx11csp4493531ejb;
        Tue, 13 Dec 2022 11:08:21 -0800 (PST)
X-Google-Smtp-Source: AA0mqf4OuuD93b5Gx1xNqICwzsBUMLVnu1ig+qytEAEhILppUQuECdDfAoJSpVUQYSN71hCVWv/2
X-Received: by 2002:a05:600c:5106:b0:3d1:ebdf:d591 with SMTP id o6-20020a05600c510600b003d1ebdfd591mr16831920wms.15.1670958501446;
        Tue, 13 Dec 2022 11:08:21 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1670958501; cv=none;
        d=google.com; s=arc-20160816;
        b=O1M3+FIQpINqXDpWFTNoG8Eedy4mGhJLx0Q2ZQa0ZonmwvWY/vVt6h9vDqAiQOjLAB
         rGt59oTaY9o6kUvzFGANJd/jbQrALq9klv/YxA1JLCUXA9D0RPqC2Cj5PM/WhNHYPaFE
         sGG4S1XGMKvuuUwL5vIuF0rQIZjyuI+dn/+CRUvLNGJrpfu881dXDsd85ih9nvFLJ8oG
         QebFhf0M31/SZ4x85wMdSAjmBMKQKrDtPE9+P2Tp2LDMpXvs7FJnNWv9m0DHSxaHt4Qz
         vt7W2ZRT6a++uWRMuorCmWbFDdC/oPB3ZcvSP64aMpoPTkA3Sf8eHyLxNAQ5+fEJhKXw
         DxRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:dkim-signature:dkim-signature;
        bh=uw6AtSJxl1jEv65fYSKXWLghoyT76z11LdcsTWPyY00=;
        b=GMW6/ccyslcZlgC3WDjbEVK1zlK1fSPCfy2k20SHrzVFOUct1iGf5D1+6ISzZhO+3H
         M3116Umx9lgwejAfAnaby3tiOA6EJ/q8TjfCFYCzn5NKMW4IqnoZjCkCOfZLf67M7xTW
         kxFk4EPQn9NpN8wlkwsrUJsz0digX5DhKhDuy6LZBaWUcghHUPTK4E1dNjgcFiiq3LnB
         opZcFFsbUkJ02DJXNxGtJ10qy1T5rRLOcyIB/+y5MsEVRp7wzvGGqtBtC7sC2Bl4/CSn
         DqfQyKNhEfjCM0cpg74DkXznax+X7d8bjS+sDkDrk0FbitvNY07pwae5yqSvbpZoabia
         TGlA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b=ZthqpKIK;
       dkim=neutral (no key) header.i=@suse.de;
       spf=pass (google.com: domain of farosas@suse.de designates 195.135.220.29 as permitted sender) smtp.mailfrom=farosas@suse.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Return-Path: <farosas@suse.de>
Received: from smtp-out2.suse.de (smtp-out2.suse.de. [195.135.220.29])
        by mx.google.com with ESMTPS id c37-20020a05600c4a2500b003cf81536ba9si6046054wmp.1.2022.12.13.11.08.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Dec 2022 11:08:21 -0800 (PST)
Received-SPF: pass (google.com: domain of farosas@suse.de designates 195.135.220.29 as permitted sender) client-ip=195.135.220.29;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b=ZthqpKIK;
       dkim=neutral (no key) header.i=@suse.de;
       spf=pass (google.com: domain of farosas@suse.de designates 195.135.220.29 as permitted sender) smtp.mailfrom=farosas@suse.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 8123E1FDF1;
	Tue, 13 Dec 2022 19:08:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1670958500; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=uw6AtSJxl1jEv65fYSKXWLghoyT76z11LdcsTWPyY00=;
	b=ZthqpKIKknApmKfMAkMmoEvt/DxP67SRie17Tg6olDpR3XV1bHtwDqEfDKPKovGxAiw5gk
	fjJ8dgH5mUERaPyF7i2NlJf5UCGoZNj/3YJMSpai3T5NupUDM2phn9xbhKSHy/MJw59Oxj
	g5F4JMH1RmYNc560gLl2jUBfZHyTBl8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1670958500;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=uw6AtSJxl1jEv65fYSKXWLghoyT76z11LdcsTWPyY00=;
	b=h6mollNijlAv1Fw6SJ2jxxto3nPQXLLhLOqIC30J/hGhfNLsyFBnLgwZ0UprW59438vuX5
	m7b6cocF4iYvhXDQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id B0592138F9;
	Tue, 13 Dec 2022 19:08:17 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id YMsOHaHNmGOcBwAAMHmgww
	(envelope-from <farosas@suse.de>); Tue, 13 Dec 2022 19:08:17 +0000
From: Fabiano Rosas <farosas@suse.de>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Roman Bolshakov <r.bolshakov@yadro.com>,
	Claudio Fontana <cfontana@suse.de>,
	Eduardo Habkost <ehabkost@redhat.com>
Subject: [PATCH 0/6] target/arm: general cleanups
Date: Tue, 13 Dec 2022 16:05:31 -0300
Message-Id: <20221213190537.511-1-farosas@suse.de>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: vU5BP85tgMi5

Hi folks,

I'm splitting this big series from Claudio from last year into more
manageable chunks (at least for me):

https://lore.kernel.org/r/20210416162824.25131-1-cfontana@suse.de

This is the first chunk with only the most trivial patches that make
sense even without the kvm/tcg and sysemu/user splits.

Claudio Fontana (1):
  target/arm: cleanup cpu includes

Fabiano Rosas (5):
  target/arm: Fix checkpatch comment style warnings in helper.c
  target/arm: Fix checkpatch space errors in helper.c
  target/arm: Fix checkpatch brace errors in helper.c
  target/arm: Remove unused includes from m_helper.c
  target/arm: Remove unused includes from helper.c

 target/arm/cpu.c      |   1 -
 target/arm/cpu64.c    |   6 -
 target/arm/helper.c   | 439 ++++++++++++++++++++++++++----------------
 target/arm/m_helper.c |  16 --
 4 files changed, 278 insertions(+), 184 deletions(-)

-- 
2.35.3
