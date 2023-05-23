Received: by 2002:a17:906:d7a2:b0:96f:a786:ac5c with SMTP id pk2csp2058412ejb;
        Tue, 23 May 2023 11:06:18 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ7twzeRPt3uwi7JOtcN4hM1bQfaK69h4RLDjUddy0d5A8Tkmnvk7A0MX5rZlJ75LjMWO4N3
X-Received: by 2002:a37:788:0:b0:75b:23a1:3614 with SMTP id 130-20020a370788000000b0075b23a13614mr5571672qkh.37.1684865178459;
        Tue, 23 May 2023 11:06:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1684865178; cv=none;
        d=google.com; s=arc-20160816;
        b=KhiGf6tpeMa5WW6YGq3HqMYebaRkrzU7AnehjgKeEoNmVZjbmZ+KvsnLCKQngiVQpH
         kcLCAMuFfbhHmea+CYDPmUhw9PxrzJzmXKOqQF8pE29x5hMdTcxATedAULaXc0rpb7SC
         McTR9OvNVou8O8lSmbtiHlKVlJCI3BrNb+QgGt0otxlpmkAWms4FeHv4VgL/OCiNYZLR
         jlqHXmtqsEWVohE51ihGWpCsgE5jr1u/5NVMpTDHJreE9etHCdlAstKc2D+M8jph/fGx
         +33MqN3xKzpaQAvPBxGuVvTOybCHFQYM91JN8hf52Ig8z4LuLTDQULZp3ihuapK4fdWF
         /Xcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature:dkim-signature;
        bh=gIqaBzpor76jqDn9uectkKx8OYYnrv6WOou5EwMgQmo=;
        b=yNQpt/2ke5s3hfAuF1o14e/cvR9sy545l3Oz6WbgXo41rY1OvTPy/boiBljO+XklPA
         U2PdENBP+4fTK7S6LunSK+07+nzsP0ucxGvNIEG172eFVVWFi2PeuMcBp8Ko+zbNPUfu
         JZefDgsmSW/ArIAX4uRKGy7X6WtVBsK9awpMb0Q+KOqXQ4oPmSfHHLuk0gVBY+B5IxLz
         shKprUWZu8cTWg1MhLNHaWfaKSa8UzY0f6OSZtqsJnVyRzPgQLVkvYXMNSSg0JwgFbsY
         sCrIiLbPfrIS1L3or8JryYECRTzNX6nZSEtlU+5TbWQHXByMrV7BeAvvsOwtj7Z5d5KM
         0U8Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b=QqGyNfcy;
       dkim=neutral (no key) header.i=@nongnu.org header.s=susede2_ed25519;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id kc8-20020a056214410800b005e625695a7csi5363369qvb.91.2023.05.23.11.06.18
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 23 May 2023 11:06:18 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b=QqGyNfcy;
       dkim=neutral (no key) header.i=@nongnu.org header.s=susede2_ed25519;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1q1WO9-0006r0-L5; Tue, 23 May 2023 14:05:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@suse.de>)
 id 1q1WO7-0006pE-IK; Tue, 23 May 2023 14:05:35 -0400
Received: from smtp-out2.suse.de ([2001:67c:2178:6::1d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <farosas@suse.de>)
 id 1q1WO6-0007T8-0y; Tue, 23 May 2023 14:05:35 -0400
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 3B68C20554;
 Tue, 23 May 2023 18:05:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1684865132; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gIqaBzpor76jqDn9uectkKx8OYYnrv6WOou5EwMgQmo=;
 b=QqGyNfcy/dmvFSNFV9VeJtS1hRq9wxgO9Pa+D2i8vt0hf8RuG+tL5QVjNNmE8+Moa/FlK1
 y4MrRTUO/mbCMKYfukh/dA5yC3zB27JsbqVjrgeH3lKhzzAZgamNDVdx0UfuOJeMWSbVIc
 RhQoQ5nFPlKyHzRcurY7/iv2XAN7Cho=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1684865132;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gIqaBzpor76jqDn9uectkKx8OYYnrv6WOou5EwMgQmo=;
 b=gDAekTsaLXSDUG3tXfjyu72rDixzpHYH33Ave5a7MRNEMw+3JQjOZCZDMpk59JF02EMDWR
 Q5CJdz3gXpR+rADg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 6122A13A10;
 Tue, 23 May 2023 18:05:30 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id +D98CmoAbWQMQwAAMHmgww
 (envelope-from <farosas@suse.de>); Tue, 23 May 2023 18:05:30 +0000
From: Fabiano Rosas <farosas@suse.de>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>
Subject: [PATCH 1/3] target/arm: Explain why we need to select ARM_V7M
Date: Tue, 23 May 2023 15:05:23 -0300
Message-Id: <20230523180525.29994-2-farosas@suse.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20230523180525.29994-1-farosas@suse.de>
References: <20230523180525.29994-1-farosas@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:67c:2178:6::1d; envelope-from=farosas@suse.de;
 helo=smtp-out2.suse.de
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: xBIdvWUq2xfG

We currently need to select ARM_V7M unconditionally when TCG is
present in the build because some translate.c helpers and the whole of
m_helpers.c are not yet under CONFIG_ARM_V7M.

Suggested-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Fabiano Rosas <farosas@suse.de>
---
 target/arm/Kconfig | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/target/arm/Kconfig b/target/arm/Kconfig
index 5947366f6e..bf57d739cd 100644
--- a/target/arm/Kconfig
+++ b/target/arm/Kconfig
@@ -1,6 +1,9 @@
 config ARM
     bool
     select ARM_COMPATIBLE_SEMIHOSTING if TCG
+
+    # We need to select this until we move m_helper.c and the
+    # translate.c v7m helpers under ARM_V7M.
     select ARM_V7M if TCG
 
 config AARCH64
-- 
2.35.3

