Received: by 2002:a17:907:c68a:b0:84d:2074:29bb with SMTP id ue10csp345891ejc;
        Thu, 19 Jan 2023 05:57:17 -0800 (PST)
X-Google-Smtp-Source: AMrXdXvWb9PX916CNHBatsUCFvistSIQlBmCUG+AvErX42rKWPKFQ8aywGg/qVc0fI+ELmXTYyuV
X-Received: by 2002:a05:600c:444b:b0:3da:fd06:a6f1 with SMTP id v11-20020a05600c444b00b003dafd06a6f1mr10156865wmn.31.1674136637719;
        Thu, 19 Jan 2023 05:57:17 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1674136637; cv=none;
        d=google.com; s=arc-20160816;
        b=QZJsMIVwGH8Q41StLWBE6p4Zy7O7jPaOBbUdBpsRSqg39G6GmokV6Oie257yEvVCHb
         Ga1nbNn5emg31D3oFApU7d4ePDdhr4PM7ONI8vYhy0N1gAT5v6Ryk3WygU5rpsxl0Le1
         sJhMIYCf+1BEZV0UtnK438lSAMHicGr32DPYyIheELee73ngslgq5VuUw/qT7Gpzgglc
         1MuMsr2UIe8oqrYJnoIlo8cPbVP99ZJ6pFprvVSXhSsd92mHTZ/4KFpFe3NC3kAnHJtA
         yRojCHfM1ACRqQxA2Ppz4D1237p3cHcFRtjHbO94Md3JgXrcMrBkzvz8fbY9Q0lwH0bV
         oQ+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:dkim-signature;
        bh=+ek2plUhT6cYZ08vwAGsINrJigng7r+gmkaUGahZEZ4=;
        b=vWQ6kxcKdxFecTtRlhhBaZQ24RLssKXP93RR1ZtEU4oFvuL7lQiAs0DOuMJpdV2y6u
         mN5eXIZYU83JeWhkMU1oM8lywn7kUAgHZ1wNHVElJpKXxTYGTgxMEnpgD1YwFzi8Y61a
         9SfNRg/kpPthLqNvKw8GN3Dv1Yh985aQDr8/DUd5PWYtEGwpDwaScT/WSfiLui1gOgKX
         nuvKHePrdE+k5k3fp8mQSPExghCoNPMnEp494Mz9Ia1adaMlGSNSpZgx1cE46Kzt+91U
         B4gO2ckTmd2jLU55IWGWbmPqLuJ16jlc8UUiHGeplMoM4azFZ55dJpnoObM+RLAnS2tI
         QHrA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b=ih3ztUW1;
       dkim=neutral (no key) header.i=@suse.de header.s=susede2_ed25519 header.b=zxmSc2sC;
       spf=pass (google.com: domain of farosas@suse.de designates 2001:67c:2178:6::1c as permitted sender) smtp.mailfrom=farosas@suse.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Return-Path: <farosas@suse.de>
Received: from smtp-out1.suse.de (smtp-out1.suse.de. [2001:67c:2178:6::1c])
        by mx.google.com with ESMTPS id v10-20020a05600c444a00b003d0359fa609si5573166wmn.185.2023.01.19.05.57.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Jan 2023 05:57:17 -0800 (PST)
Received-SPF: pass (google.com: domain of farosas@suse.de designates 2001:67c:2178:6::1c as permitted sender) client-ip=2001:67c:2178:6::1c;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b=ih3ztUW1;
       dkim=neutral (no key) header.i=@suse.de header.s=susede2_ed25519 header.b=zxmSc2sC;
       spf=pass (google.com: domain of farosas@suse.de designates 2001:67c:2178:6::1c as permitted sender) smtp.mailfrom=farosas@suse.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 574ED38C3C;
	Thu, 19 Jan 2023 13:57:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1674136637; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+ek2plUhT6cYZ08vwAGsINrJigng7r+gmkaUGahZEZ4=;
	b=ih3ztUW1ikhb6FhBu3jtUr1uO3nJluculKz5WXHzU7pRVyM3wzr4dSfLEsZUhHjB6bngcO
	Dq7mPPobB/DUzhBkECQOYzkcBRVC8BeRsSifUCJxnGnf0ExgMtVwb9wDQolSijg+AAH9RF
	nhNo8j+OdZQahZ+ZvhbzkmgW6PUUwxQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1674136637;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+ek2plUhT6cYZ08vwAGsINrJigng7r+gmkaUGahZEZ4=;
	b=zxmSc2sCO18Cx0GcWlXwZdGzXetXooAlNBUZwrkjvE4wcaFwaIPe47c+U4MdoDe2uMR5Dn
	5jVbN8HOElpKkEDg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 09AAE134F5;
	Thu, 19 Jan 2023 13:57:13 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id 4HIiMDlMyWOCFAAAMHmgww
	(envelope-from <farosas@suse.de>); Thu, 19 Jan 2023 13:57:13 +0000
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
Subject: [RFC PATCH v4 12/15] tests/tcg: Do not build/run TCG tests if TCG is disabled
Date: Thu, 19 Jan 2023 10:54:21 -0300
Message-Id: <20230119135424.5417-13-farosas@suse.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20230119135424.5417-1-farosas@suse.de>
References: <20230119135424.5417-1-farosas@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: S87rIq+NOO36

The tests under tests/tcg depend on the TCG accelerator. Do not build
them if --disable-tcg was given in the configure line.

Signed-off-by: Fabiano Rosas <farosas@suse.de>
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
