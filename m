Received: by 2002:a17:907:c68a:b0:84d:2074:29bb with SMTP id ue10csp1303473ejc;
        Fri, 20 Jan 2023 10:50:55 -0800 (PST)
X-Google-Smtp-Source: AMrXdXu3++VX9dpzQ3QUMqEPoXzk8eI7u4mHkhGIA1q3W6aELnnSUat6Q2f032Z9/pUiGitcEAyG
X-Received: by 2002:a17:907:6746:b0:871:b898:92fd with SMTP id qm6-20020a170907674600b00871b89892fdmr18122338ejc.6.1674240655344;
        Fri, 20 Jan 2023 10:50:55 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1674240655; cv=none;
        d=google.com; s=arc-20160816;
        b=Z5BEpuSNFeXHiRP+YhlNS1DyaL9guLrczscfzEVBO7RGz7+wi99tdPFybBl1d1F69B
         X52N5HbI6QysSFsg2sec8oeVRVyroJzi8n/zesK+YVDJJo4KQHR5UO8USsa3n+MVg/Bp
         jwPQIR76B5OZCETIJNMjXmmfaqoT+qgRthVnvF9MW5jpz7C/NVJBTKTMzmktyEju3xU4
         0Kmna5cT2sF7eHkuz9xqv8jREX4H48Z+Ksz7FNmHaQMPnMftKWnXSWbU4CnyxkbhvdnL
         mkCqSBR0a+gfyeAUsFCkQEZGdiY6ROU4j43b8ct0ECsBRsFYeZpkCaz6ZRh8Vo1R9py8
         q+IQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:dkim-signature;
        bh=ER80PJwpTMoGZflgDcdmaejpQuhPqaaBc1ZyThFUlNM=;
        b=e5fKX8o/XzVffJPWXsIXdquOpHZHYYYU5KKGTktQCBJxvIdebpQGblYkRjZgbfo/mx
         I8HbbP1yvbkMuWQB+c7hLnWtseD7AZC2WKKiYKRHuh6EkIHpSaI5vh9O8MV9YpMIL0f5
         lc1ZyltvbJIcxHOiga2Kgkpf6mmtpGLWgQnfeWnwGpPw+X1ZUZN16ZGD0AvMveqHzzRS
         Vf1SGuKIzl14yntuIwCD2fWL0SwN35ezscKFskfTMMF6ZGYE1SErwCF5GmcZcNtZ+UJb
         W4XOpYjHu0mO2MTx9m/iZOZufkbQh4T2iEB0mTUqmh2TaLmyfdmXQkGFxiS76iZKawjj
         8soQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b=HJn1bx0d;
       dkim=neutral (no key) header.i=@suse.de;
       spf=pass (google.com: domain of farosas@suse.de designates 195.135.220.28 as permitted sender) smtp.mailfrom=farosas@suse.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Return-Path: <farosas@suse.de>
Received: from smtp-out1.suse.de (smtp-out1.suse.de. [195.135.220.28])
        by mx.google.com with ESMTPS id nb3-20020a1709071c8300b00870c8690d6csi14882230ejc.207.2023.01.20.10.50.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Jan 2023 10:50:55 -0800 (PST)
Received-SPF: pass (google.com: domain of farosas@suse.de designates 195.135.220.28 as permitted sender) client-ip=195.135.220.28;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b=HJn1bx0d;
       dkim=neutral (no key) header.i=@suse.de;
       spf=pass (google.com: domain of farosas@suse.de designates 195.135.220.28 as permitted sender) smtp.mailfrom=farosas@suse.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id F22F5337CA;
	Fri, 20 Jan 2023 18:50:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1674240655; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ER80PJwpTMoGZflgDcdmaejpQuhPqaaBc1ZyThFUlNM=;
	b=HJn1bx0dp5V4deR+2JB6M8x0LJO2goGbi+lpRuAtXz0kbq4X0OuVW7QWSNPafCWhh3URtm
	incELBCKt0oVvEksy57clgSEm2oBvvHz8jAmiuL/C3M1saWKVoDBsKZ/y/mlMTIJzldS/M
	PTBpjdndC7F7FZ6AAyooxG+UO4ZOV/s=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1674240655;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ER80PJwpTMoGZflgDcdmaejpQuhPqaaBc1ZyThFUlNM=;
	b=GW3tgvk9kZCpZatzxyFOKGz+p+KqvwGG4gPewKVAKhNzj2WoPvurMwIBg3nEmTPPzpSWBg
	YMgdworwN0Yt6SDw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id A1CCE1390C;
	Fri, 20 Jan 2023 18:50:51 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id 4FozGYviymNSbQAAMHmgww
	(envelope-from <farosas@suse.de>); Fri, 20 Jan 2023 18:50:51 +0000
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
	Cornelia Huck <cohuck@redhat.com>,
	Thomas Huth <thuth@redhat.com>
Subject: [RFC PATCH v5 6/9] tests/tcg: Do not build/run TCG tests if TCG is disabled
Date: Fri, 20 Jan 2023 15:48:22 -0300
Message-Id: <20230120184825.31626-7-farosas@suse.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20230120184825.31626-1-farosas@suse.de>
References: <20230120184825.31626-1-farosas@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: oIkOhj7CcZzl

The tests under tests/tcg depend on the TCG accelerator. Do not build
them if --disable-tcg was given in the configure line.

Signed-off-by: Fabiano Rosas <farosas@suse.de>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 configure | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/configure b/configure
index 9e407ce2e3..64960c6000 100755
--- a/configure
+++ b/configure
@@ -2483,7 +2483,11 @@ for target in $target_list; do
       tcg_tests_targets="$tcg_tests_targets $target"
   fi
 done
-echo "TCG_TESTS_TARGETS=$tcg_tests_targets" >> config-host.mak)
+
+if test "$tcg" = "enabled"; then
+    echo "TCG_TESTS_TARGETS=$tcg_tests_targets" >> config-host.mak
+fi
+)
 
 if test "$skip_meson" = no; then
   cross="config-meson.cross.new"
-- 
2.35.3
