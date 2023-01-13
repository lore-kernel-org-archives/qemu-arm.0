Received: by 2002:a17:907:c68a:b0:84d:2074:29bb with SMTP id ue10csp414600ejc;
        Fri, 13 Jan 2023 06:07:12 -0800 (PST)
X-Google-Smtp-Source: AMrXdXsY6oFu0HCDDFYKAvJHdhH1dMrIN6pKO5wKuCNkZcAXZY+XisGBPnQ2/JHCJyeC5IvagOj/
X-Received: by 2002:a1c:4b04:0:b0:3c6:f0b8:74e6 with SMTP id y4-20020a1c4b04000000b003c6f0b874e6mr59718181wma.4.1673618832698;
        Fri, 13 Jan 2023 06:07:12 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1673618832; cv=none;
        d=google.com; s=arc-20160816;
        b=dRqjUYRcHycbB7BSOJe0TeSLpMebsf4NRdXSd153VGpXWEk+m3kH7BrpyALKzIX+hh
         uRlPiLldjxqVtMVpf7cZLA5FhE38CkG8NEyn7AkDWil4lZLLb6TjpjdsCWW+Ytag9pmq
         y9JBWC34BGHITFt3CgqaHWF/m0BHmsIv9cay5eSXH39FQItlvumQ7kfvrxHuoXaR5Gp5
         mV+I0oow/ZcJTYCIx3zVn/hgHYEMAO4SaNgP/eNGiXijzL/tA5iwcBPoIZV0XKVofBIQ
         3JTM19svgzbP40YQ6OBjLXzm1BYLhQc2+uOtPINkMEl5McOwRPEgEHoh1IQfZzXWFQVT
         IhLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:dkim-signature;
        bh=bFCLtdp68XCkucr0GBNgmDryKCRj7k/2ikV3JWwMC5g=;
        b=Entz2GovoE5fDviJqnTfWC9reATVw1Pd5I+lkGtdfGl8sZWNWw1KWZrm2CsLLCbdr+
         sKvGm2j9bqM+y9WWeDIdF+bJQ2XBAsHBWOXZ8J0x2nV2NkL3TwDmdRDmTH4J+rLj95nE
         PM2/RVYdPLS5Mc5buMzcXuuTV7P0UObv9iAWPtZI41B3ma0dKRUxT8fKWuqEpwuPoWdG
         /V3phzzcC//YmDJG47qJqemZ5B97974YDmJE/WHJnOLC1bCRY9pkvu8CPSv9P2c96M8i
         oM1ek94Gp2D6FYyYI2OuW0GrDO2xAQpo1bpaARzSDAkhNnQAPrtT5y+T2xp33wRF8A7O
         NJOw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b=xpHQOYeL;
       dkim=neutral (no key) header.i=@suse.de;
       spf=pass (google.com: domain of farosas@suse.de designates 2001:67c:2178:6::1c as permitted sender) smtp.mailfrom=farosas@suse.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Return-Path: <farosas@suse.de>
Received: from smtp-out1.suse.de (smtp-out1.suse.de. [2001:67c:2178:6::1c])
        by mx.google.com with ESMTPS id l19-20020a05600c1d1300b003d9f91cbee4si10853427wms.199.2023.01.13.06.07.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Jan 2023 06:07:12 -0800 (PST)
Received-SPF: pass (google.com: domain of farosas@suse.de designates 2001:67c:2178:6::1c as permitted sender) client-ip=2001:67c:2178:6::1c;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b=xpHQOYeL;
       dkim=neutral (no key) header.i=@suse.de;
       spf=pass (google.com: domain of farosas@suse.de designates 2001:67c:2178:6::1c as permitted sender) smtp.mailfrom=farosas@suse.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 349E04DE3E;
	Fri, 13 Jan 2023 14:07:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1673618832; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=bFCLtdp68XCkucr0GBNgmDryKCRj7k/2ikV3JWwMC5g=;
	b=xpHQOYeLHFrF14S2x0Yh8NCJ7VXZHscjkPQC/oimMIanM9ZobA8bWrF52H5HQxfliOJTtE
	vYdBNvuLihW9Bc05HTtbiekQ3LcjQUWI22IaLvrPbpwFnsF9bUkPiGgwzXyQlh03kWWClC
	r042hIMjBwoAQJODIdT+sx6C4zW4P1w=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1673618832;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=bFCLtdp68XCkucr0GBNgmDryKCRj7k/2ikV3JWwMC5g=;
	b=wQruSaskzwx0e2QuCXAstCp5KqoEt19RkZxNR5Vabg3wQpbuhxUYLxrtHBEfUFljzhiuaX
	U6y+JX7pBhdRHEBQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 92CD71358A;
	Fri, 13 Jan 2023 14:07:09 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id 8GHxFo1lwWP8DQAAMHmgww
	(envelope-from <farosas@suse.de>); Fri, 13 Jan 2023 14:07:09 +0000
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
Subject: [RFC PATCH v3 15/28] target/arm: Don't access TCG code when debugging with KVM
Date: Fri, 13 Jan 2023 11:04:06 -0300
Message-Id: <20230113140419.4013-16-farosas@suse.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20230113140419.4013-1-farosas@suse.de>
References: <20230113140419.4013-1-farosas@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: apawmqBYhetV

When TCG is disabled this part of the code should not be reachable, so
wrap it with an ifdef for now.

Signed-off-by: Fabiano Rosas <farosas@suse.de>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/ptw.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/target/arm/ptw.c b/target/arm/ptw.c
index 4bda0590c7..2af75d0904 100644
--- a/target/arm/ptw.c
+++ b/target/arm/ptw.c
@@ -254,6 +254,7 @@ static bool S1_ptw_translate(CPUARMState *env, S1Translate *ptw,
         ptw->out_host = NULL;
         ptw->out_rw = false;
     } else {
+#ifdef CONFIG_TCG
         CPUTLBEntryFull *full;
         int flags;
 
@@ -270,6 +271,9 @@ static bool S1_ptw_translate(CPUARMState *env, S1Translate *ptw,
         ptw->out_rw = full->prot & PAGE_WRITE;
         pte_attrs = full->pte_attrs;
         pte_secure = full->attrs.secure;
+#else
+        g_assert_not_reached();
+#endif
     }
 
     if (regime_is_stage2(s2_mmu_idx)) {
-- 
2.35.3
