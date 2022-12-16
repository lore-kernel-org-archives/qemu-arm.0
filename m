Received: by 2002:a17:906:a84b:b0:7c1:2a22:dc39 with SMTP id dx11csp1721201ejb;
        Fri, 16 Dec 2022 13:31:50 -0800 (PST)
X-Google-Smtp-Source: AMrXdXu51DylesxIyiy0ZC6OJuyvBaw44yRX2eqpwtuBe5dWiCk//XaMjoZcTI4F4s2/tGZc13KG
X-Received: by 2002:a05:6000:50b:b0:256:6553:5878 with SMTP id a11-20020a056000050b00b0025665535878mr7422174wrf.58.1671226310153;
        Fri, 16 Dec 2022 13:31:50 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1671226310; cv=none;
        d=google.com; s=arc-20160816;
        b=MQCr0FFKymULkqTdHWthXujyv+hi8YbjPDT/9zFL5TNCGuPxt3l75TiEt0FBlhnjsE
         tu8pbf9h6AMPQ6zPgCFg3NUNoe3n9N8fSf+eQIvFKlKr5YtRe2jlIOZlaiqDay+7MF7J
         oWdN1M2UC4ClLfLm9fhpdp3mxfh5JxO+ex1znZw+mCdj3vS5KyljVcgh4z0PXkGv/QL4
         eeXgGFN9qKR+z1GuflnijkNHdKERnWMvs0EAQ79q4yw96v05S8N495DTtZsY6GPXVdw+
         GsOEOjFCdj9GAxLzTeNSQKi1mMjQ5bDAitSlCjj5I6zd6/rV/2MUgQPSduqcuGF2kPdK
         40cw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:dkim-signature:dkim-signature;
        bh=BTcBOfozrJDbazHJtLGlc2brs+R/rlp2AyFICRwvd1Q=;
        b=E4Ka3eHRbYnIISoOkGR6mnWOlI1dM6Ba95E5mZXR1lir3y1D0NEaz+956jyFEHuAAU
         t4WLN8ioTunhMUn6ofLi64vnjdyQznnZDdJ0j4iRbVlBvRk8ZMh1I3eDPqvctBAubC2j
         YtPHRgy5CwJvnimWdT14HEJtNW5BxTTLAOiUGr9ZuvuIc3aJk2jYWsEe5xpKYSjCw4oh
         ieTyil4y9VzJqllvwojBlAraS8eHBJ+kwauFscDfNdzet3Oso681S+ixHYbJroUEUlSB
         lXwYXAl2RwFGLWJEpoVfVpAfDXW8Xd+2sFKDiPmMWxSinxAbS848HB5/ydzyt4cxk099
         tU1w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b=H22CD7Vt;
       dkim=neutral (no key) header.i=@suse.de header.s=susede2_ed25519 header.b=Oyf2Rk5X;
       spf=pass (google.com: domain of farosas@suse.de designates 195.135.220.28 as permitted sender) smtp.mailfrom=farosas@suse.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Return-Path: <farosas@suse.de>
Received: from smtp-out1.suse.de (smtp-out1.suse.de. [195.135.220.28])
        by mx.google.com with ESMTPS id o4-20020a5d6484000000b00244c6d5add5si2746053wri.812.2022.12.16.13.31.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Dec 2022 13:31:50 -0800 (PST)
Received-SPF: pass (google.com: domain of farosas@suse.de designates 195.135.220.28 as permitted sender) client-ip=195.135.220.28;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b=H22CD7Vt;
       dkim=neutral (no key) header.i=@suse.de header.s=susede2_ed25519 header.b=Oyf2Rk5X;
       spf=pass (google.com: domain of farosas@suse.de designates 195.135.220.28 as permitted sender) smtp.mailfrom=farosas@suse.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 78CB034BF5;
	Fri, 16 Dec 2022 21:31:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1671226309; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=BTcBOfozrJDbazHJtLGlc2brs+R/rlp2AyFICRwvd1Q=;
	b=H22CD7VtCdZ0DTxxJghGnudKzi5Dn37e/J4USzfBpLQydsNPqJEPA2W3wJ5VNSmsgbR2mJ
	F41JBzywCDRzRNPWPqxaxitP7mmf2XmuI+o2nxz6L7491uz74lfIyPh7owoL9xPzbj1SPe
	X5I5KB0K1jIdyxj98ZRHP2bDQh/mPO8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1671226309;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=BTcBOfozrJDbazHJtLGlc2brs+R/rlp2AyFICRwvd1Q=;
	b=Oyf2Rk5XX9cL0g8dETPlkfzMlziuSVotgTU2LUmbB8hWahHpopl6a+5Bm3zFDB0IrU2+pq
	u5S82dQvfp4Rh3Aw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id D6113138FD;
	Fri, 16 Dec 2022 21:31:46 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id Yb5PJsLjnGPAHwAAMHmgww
	(envelope-from <farosas@suse.de>); Fri, 16 Dec 2022 21:31:46 +0000
From: Fabiano Rosas <farosas@suse.de>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Claudio Fontana <cfontana@suse.de>,
	Eduardo Habkost <ehabkost@redhat.com>
Subject: [PATCH 0/5] target/arm: Some CONFIG_TCG code movement
Date: Fri, 16 Dec 2022 18:29:39 -0300
Message-Id: <20221216212944.28229-1-farosas@suse.de>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: 1t80xyoLxyQH

Hi,

This is the second round of rebasing the patches from:
https://lore.kernel.org/r/20210416162824.25131-1-cfontana@suse.de

These are the simpler ones that move code under
CONFIG_TCG/tcg_enabled. No new directories or files.

Claudio Fontana (5):
  target/arm: only build psci for TCG
  target/arm: rename handle_semihosting to tcg_handle_semihosting
  target/arm: wrap semihosting and psci calls with tcg_enabled
  target/arm: wrap call to aarch64_sve_change_el in tcg_enabled()
  target/arm: only perform TCG cpu and machine inits if TCG enabled

 target/arm/cpu.c       | 31 ++++++++++++---------
 target/arm/helper.c    | 45 +++++++++++++++++--------------
 target/arm/kvm.c       | 18 ++++++-------
 target/arm/kvm_arm.h   |  3 +--
 target/arm/machine.c   | 61 +++++++++++++++++++++++-------------------
 target/arm/meson.build |  5 +++-
 6 files changed, 91 insertions(+), 72 deletions(-)

-- 
2.35.3
