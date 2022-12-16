Received: by 2002:a17:906:a84b:b0:7c1:2a22:dc39 with SMTP id dx11csp1721231ejb;
        Fri, 16 Dec 2022 13:31:53 -0800 (PST)
X-Google-Smtp-Source: AA0mqf5wa0gBSR29F5dGtKKaMiExFFKy5hnsplzYmJz3lc3LUrOBBWcya+wDQoiZKYiXzt+cfE1I
X-Received: by 2002:a5d:48c7:0:b0:236:8130:56e8 with SMTP id p7-20020a5d48c7000000b00236813056e8mr19602223wrs.29.1671226313159;
        Fri, 16 Dec 2022 13:31:53 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1671226313; cv=none;
        d=google.com; s=arc-20160816;
        b=WOxuNd/ox/UiQE5iGYaZ3Vud1e8nTdWRt+Q9u1DHryrYcJxmWqXmPsoItHFuGncTDB
         Lir643CiQabu0tZAQOY0hVhgm28eZ0CjUVM2i6voxVLra09UAemyLJ1iKZZy7sLAwGJh
         Xeem9N9uazYuGbWprI7388/56TdqWfnvWima3BSLjeCUn2ImGLxTwUCc5Z1SB/wIumin
         MZLw6d1l4Ez4GPblr0iAhltzwvWP/JXawEN+M9F9wbVZSmtqgYIcg8ZrkiYaEm1ARsn8
         ZdAdVygoa4w0M3x8OS9S208xsIbjElLaofOI9hOICOry6GcqF17w6uEgDYNRAcEb2TM9
         tW9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:dkim-signature;
        bh=B5CG4PGerUxdqx8UYWH7MTKHIghaqlUgu4Ciy6KeonQ=;
        b=r+o/W6mdQxY6ydWbOfXZ5kfdAQl6FGzQUm1KhyMuDRXy1ik08qmP4zO61np3wuXdng
         e11TY5eddqogvqJBy7fPiQ1Yb/ft3hqHzyFdA3c4RniqWs35izkKCs+pWTY7akTKVoLi
         gkik7DZhyw1U4BkheEMWDHEVKCP2eOC+7KUlfQtMrOeHg/lCIkkEG5EcKOLRrCYkQADw
         j377s5lznM1JSNl+PFeMEgpBXDm82urHnjq+CkV5fOLTPX9i/2IlELerI6ATEIetUrzQ
         4ozuuRDc4/tn0jXVWbyqIvTmqJ4yXXU/am7JLyvABf3LwGhgKluOPxGY1kmIfmJIUyCQ
         hnZw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b=I6VlfHdj;
       dkim=neutral (no key) header.i=@suse.de;
       spf=pass (google.com: domain of farosas@suse.de designates 195.135.220.28 as permitted sender) smtp.mailfrom=farosas@suse.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Return-Path: <farosas@suse.de>
Received: from smtp-out1.suse.de (smtp-out1.suse.de. [195.135.220.28])
        by mx.google.com with ESMTPS id b3-20020a05600018a300b002422f74c2aasi3166500wri.19.2022.12.16.13.31.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Dec 2022 13:31:53 -0800 (PST)
Received-SPF: pass (google.com: domain of farosas@suse.de designates 195.135.220.28 as permitted sender) client-ip=195.135.220.28;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b=I6VlfHdj;
       dkim=neutral (no key) header.i=@suse.de;
       spf=pass (google.com: domain of farosas@suse.de designates 195.135.220.28 as permitted sender) smtp.mailfrom=farosas@suse.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id BC41A34BF8;
	Fri, 16 Dec 2022 21:31:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1671226312; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=B5CG4PGerUxdqx8UYWH7MTKHIghaqlUgu4Ciy6KeonQ=;
	b=I6VlfHdjtOYLRdROMXiUoYTjpBz9ZorRXgsdpu7oOlLN81LBcueWVeTqkBm3lqKzJObDu6
	ybGwvTvm1zpWMYSN2wl3kpVi0ziWmDtsqeThOrin9z/QTJtgAbpAcWJd2wuibZF6Wvte9l
	aA44rWJfIOW/GaX/u8ICzF0Cw4kgT7A=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1671226312;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=B5CG4PGerUxdqx8UYWH7MTKHIghaqlUgu4Ciy6KeonQ=;
	b=ILhXrWT70SZTDPbEQaQJAmp1Y/N7S330dxc+ztyglq0cAxMU9vQbXfbEFUKeGmU1H3qD5L
	QXKWaf4L5guSBvCQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id E5B24138FD;
	Fri, 16 Dec 2022 21:31:49 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id SD8wKsXjnGPAHwAAMHmgww
	(envelope-from <farosas@suse.de>); Fri, 16 Dec 2022 21:31:49 +0000
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
Subject: [PATCH 1/5] target/arm: only build psci for TCG
Date: Fri, 16 Dec 2022 18:29:40 -0300
Message-Id: <20221216212944.28229-2-farosas@suse.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20221216212944.28229-1-farosas@suse.de>
References: <20221216212944.28229-1-farosas@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: fBl6f76vvovp

From: Claudio Fontana <cfontana@suse.de>

Signed-off-by: Claudio Fontana <cfontana@suse.de>
Cc: Alexander Graf <agraf@csgraf.de>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Fabiano Rosas <farosas@suse.de>
---
Originally from:
[RFC v14 09/80] target/arm: only build psci for TCG
https://lore.kernel.org/r/20210416162824.25131-10-cfontana@suse.de
---
 target/arm/meson.build | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/target/arm/meson.build b/target/arm/meson.build
index 87e911b27f..26e425418f 100644
--- a/target/arm/meson.build
+++ b/target/arm/meson.build
@@ -61,10 +61,13 @@ arm_softmmu_ss.add(files(
   'arm-powerctl.c',
   'machine.c',
   'monitor.c',
-  'psci.c',
   'ptw.c',
 ))
 
+arm_softmmu_ss.add(when: 'CONFIG_TCG', if_true: files(
+  'psci.c',
+))
+
 subdir('hvf')
 
 target_arch += {'arm': arm_ss}
-- 
2.35.3
