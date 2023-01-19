Received: by 2002:a17:907:c68a:b0:84d:2074:29bb with SMTP id ue10csp345826ejc;
        Thu, 19 Jan 2023 05:57:10 -0800 (PST)
X-Google-Smtp-Source: AMrXdXvCsj6eB6WGLRCbJT0uvfAjAeSjhKBV04ZBJAuzvlxyRx8StjwPHf9dzCTU/ztFcNq5mfg2
X-Received: by 2002:a17:907:c911:b0:870:5bf4:a3b1 with SMTP id ui17-20020a170907c91100b008705bf4a3b1mr9958828ejc.33.1674136630107;
        Thu, 19 Jan 2023 05:57:10 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1674136630; cv=none;
        d=google.com; s=arc-20160816;
        b=rJz77Z8yF6nfSjFC8eHQP6RpfmKT7/3v5+AL/KlZwa5PyomVx3piTlkSgt3V6Y2Rcr
         IeIY1P+VzPJA9ykU7XLLiNG1lPKeO5B7k55xx2jQ2NjClzZiHzCh+EMJtTW/lq4tqfKK
         lT+GuyOSjNV6mlUKz8TLZkPtq5OhvPrxcKXo2mOUC7GyAqS6MBi0BNCyZW/ZJYu7fPIe
         W1TtQOHU+yq02NviLQB2mQW+uLUBWeI4MChGrzju+STA34hCyFiBe7dSp7gP7BveZ/QK
         LQJ7gXFWXUkRrkkGUzPqRxpvd67UBZdNlhTCdVoLL/Mrd7MpRCL3Cx4EmY4u5/FO8All
         cPaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:dkim-signature;
        bh=SoROsn94cX/HEtXMIBdno9N1fGnMg0pFEZJS8bDdoF4=;
        b=u/36SN+SbFYslGa7vX6PGPqS4yNHPpn7rBo6mfFhqIVFXxE2ls8hSke/TummK9f/xz
         bzh45NrKFNTbpiuwxs/iADSD5ocheTRUC39ZcSgQl9Qfr/URhQIcv0/vrGry+Ynm/z3n
         1hhWlvkJNtlC8+RHLopuhQ7cLa4GtoDplzWLMp4mD35HHKvgUYil/3u5R6VmwzHNtxZu
         0zXcw+QxjA5xHfj1ILgabbH+90xPnyz9j6EwAo3c+FZ55YE/08RtcDlIg/rBSYGN9ld9
         nMfIgMFbuGfw+B/bzwqrar2s2N8zc6UFeDHf2i9YiLmfVyMk1TBJw0fqEUCjDWjn9OFm
         d8oA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b=CgcSH5tb;
       dkim=neutral (no key) header.i=@suse.de;
       spf=pass (google.com: domain of farosas@suse.de designates 2001:67c:2178:6::1d as permitted sender) smtp.mailfrom=farosas@suse.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Return-Path: <farosas@suse.de>
Received: from smtp-out2.suse.de (smtp-out2.suse.de. [2001:67c:2178:6::1d])
        by mx.google.com with ESMTPS id mp26-20020a1709071b1a00b007c146656546si30120311ejc.317.2023.01.19.05.57.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Jan 2023 05:57:10 -0800 (PST)
Received-SPF: pass (google.com: domain of farosas@suse.de designates 2001:67c:2178:6::1d as permitted sender) client-ip=2001:67c:2178:6::1d;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b=CgcSH5tb;
       dkim=neutral (no key) header.i=@suse.de;
       spf=pass (google.com: domain of farosas@suse.de designates 2001:67c:2178:6::1d as permitted sender) smtp.mailfrom=farosas@suse.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 8A9595CE73;
	Thu, 19 Jan 2023 13:57:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1674136629; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=SoROsn94cX/HEtXMIBdno9N1fGnMg0pFEZJS8bDdoF4=;
	b=CgcSH5tbldlyc+scsiaiuX+nNTSzWszsN6AVnQw0l363vuI0tnWS36WFEjl2lCYipo7bhe
	tpmxMTcEoXP2cWl310Z7prCyuaAgoFhfHdALz9p1knDpfZnUp3btwuO8cjxLdMCf9u7jMU
	RItv3bMGrvxw4o40+mPjNXpDCLlEKEA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1674136629;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=SoROsn94cX/HEtXMIBdno9N1fGnMg0pFEZJS8bDdoF4=;
	b=hOkEjj6FiQvOg0CAjPj7CPH68UJxSPWxrnwKwraK1+PLksQKKMNeJhSuZWpo7KCxhnj1EG
	05s9wLvgjTuNpqCw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 00E03134F5;
	Thu, 19 Jan 2023 13:57:05 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id KLH4LTFMyWOCFAAAMHmgww
	(envelope-from <farosas@suse.de>); Thu, 19 Jan 2023 13:57:05 +0000
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
	Thomas Huth <thuth@redhat.com>,
	Laurent Vivier <lvivier@redhat.com>
Subject: [RFC PATCH v4 10/15] tests/qtest: aarch64: Set -cpu for numa-test
Date: Thu, 19 Jan 2023 10:54:19 -0300
Message-Id: <20230119135424.5417-11-farosas@suse.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20230119135424.5417-1-farosas@suse.de>
References: <20230119135424.5417-1-farosas@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: vWZmQ0hHt6vC

The aarch64 KVM-only builds no longer have a default cpu. We need to
explicitly give one in the command line.

Signed-off-by: Fabiano Rosas <farosas@suse.de>
---
 tests/qtest/numa-test.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tests/qtest/numa-test.c b/tests/qtest/numa-test.c
index c5eb13f349..7a6cf17b2a 100644
--- a/tests/qtest/numa-test.c
+++ b/tests/qtest/numa-test.c
@@ -559,6 +559,7 @@ int main(int argc, char **argv)
 
     if (g_str_equal(arch, "aarch64")) {
         g_string_append(args, " -machine virt");
+        g_string_append(args, " -cpu cortex-a57");
     }
 
     g_test_init(&argc, &argv, NULL);
-- 
2.35.3
