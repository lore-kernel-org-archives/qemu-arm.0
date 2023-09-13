Received: by 2002:a17:906:9502:b0:9a1:fa4e:495e with SMTP id u2csp2716631ejx;
        Wed, 13 Sep 2023 04:58:44 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFFrC+oRVgihfVUAM6QtcRCBwpbpsMJKu9Ry8GFsNcZGQie6uWG3lYw0r6DkibF5mSSzKuY
X-Received: by 2002:a0c:ca81:0:b0:64f:3c7a:fc57 with SMTP id a1-20020a0cca81000000b0064f3c7afc57mr2325135qvk.26.1694606324190;
        Wed, 13 Sep 2023 04:58:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1694606324; cv=none;
        d=google.com; s=arc-20160816;
        b=jx+wFXe9+UXwNrmPtMoqzqJw8oDm5WroBYIwUph9h1CNfuG868MahfvcBVhM8BZjwb
         P1efs9kxMkOiuM8mv19hr+s0Q00/GY+WC4GLCtxUdMKcP4FXGitITbDPT83DS4IXsu0A
         xhFmpWLSRRD09zMMSctwXoE+INBXLnb/6ihUT4PJTUyeOjEMUMP0ktsNFMRKnLufb1Am
         32WPI+GzQsBLgp+QDpibPoU2hE/Ct6v4qWbbKtzorde5igYbumwjV4XWYq5+2A10rlH6
         rtqob/N00xMOEITlf9pT2IzYQ6j0lcOZp//CK6gycO77KBvg0WsdJ/gs+uXwSHfMOL0m
         95yA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature
         :dkim-signature;
        bh=UXbE0HYap58YmFjEmG0QNQwRoRh+wUbovC8FszvAVYM=;
        fh=VQUMc85x8ANizanga/Uk0eVpSOWbPwTPWK+d/C2OKHM=;
        b=CqoRD2CV8VkSl2tmntzrLxi8ah8l+YWQH3NyffANu/cErVMAsjk+zfTIkUkorGMNW9
         CvmNls4t0U7xNEQJ6ONGonfjdrlhPNw3HAORlN0jGpMmHR2+/AOtmRnVuDdKE0UvdCE7
         KZIwzfWH6qnzrhBeqVb5WDHI6zdplpE9u671YkkRqqCADLGqTLyGnCqTURZFBYDZmvfx
         6aNI7v5nrOE8axZ3t4hZY/dEiXZuvO0/g4xjaS4bakvze4eAxlMsUIuPeV10q8iqNbHV
         qk7bV9avrVmz9k7ZrtL4hTTfTmAiEsqcKguZ0iMdT6cs4yBMF6O/xfjobQHXsjUGDuzk
         J2OQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b=RlKn7agm;
       dkim=neutral (no key) header.i=@suse.de header.b=bzjPhyHC;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d20-20020a0caa14000000b0064f6fa5d7b9si7361697qvb.84.2023.09.13.04.58.44
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 13 Sep 2023 04:58:44 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b=RlKn7agm;
       dkim=neutral (no key) header.i=@suse.de header.b=bzjPhyHC;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1qgOVm-0001bi-0p; Wed, 13 Sep 2023 07:58:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fvogt@suse.de>)
 id 1qgOVj-0001Xr-4j; Wed, 13 Sep 2023 07:58:23 -0400
Received: from smtp-out1.suse.de ([195.135.220.28])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <fvogt@suse.de>)
 id 1qgOVe-0007lC-A6; Wed, 13 Sep 2023 07:58:22 -0400
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id A77A2218E3;
 Wed, 13 Sep 2023 11:58:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1694606293; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=UXbE0HYap58YmFjEmG0QNQwRoRh+wUbovC8FszvAVYM=;
 b=RlKn7agmv+kYrXXpI8yf2ucpGd95LTV6I695HlubwIDwV/E4k1xGLUom+dLNx40PZgkJge
 O9jgQ8PMJlOT1TMudXg9RRaOTs8zWYWbmjUg21FQME4d6ohFF07Xg5HJAwT3/dHxMqEYY/
 1V0LHrqzgVr0cpy9jrp3ssoqqBA5YZA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1694606293;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=UXbE0HYap58YmFjEmG0QNQwRoRh+wUbovC8FszvAVYM=;
 b=bzjPhyHCNkO5lAfmzyU27S/kHv8ckSqM4DIzIQlWSB3EV/4KN2c4xf3srDySPC9EQkFz//
 uHu/AG116q0cwkDA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 9A6C513582;
 Wed, 13 Sep 2023 11:58:13 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id MnU5JdWjAWUtFgAAMHmgww
 (envelope-from <fvogt@suse.de>); Wed, 13 Sep 2023 11:58:13 +0000
From: Fabian Vogt <fvogt@suse.de>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Subject: [PATCH] hw/arm/boot: Set SCR_EL3.FGTEn when booting kernel
Date: Wed, 13 Sep 2023 13:57:52 +0200
Message-ID: <4831384.GXAFRqVoOG@linux-e202.suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Received-SPF: pass client-ip=195.135.220.28; envelope-from=fvogt@suse.de;
 helo=smtp-out1.suse.de
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: 5aldE9EWCH0p

Just like d7ef5e16a17c sets SCR_EL3.HXEn for FEAT_HCX, this commit
handles SCR_EL3.FGTEn for FEAT_FGT:

When we direct boot a kernel on a CPU which emulates EL3, we need to
set up the EL3 system registers as the Linux kernel documentation
specifies:
    https://www.kernel.org/doc/Documentation/arm64/booting.rst

> For CPUs with the Fine Grained Traps (FEAT_FGT) extension present:
> - If EL3 is present and the kernel is entered at EL2:
>   - SCR_EL3.FGTEn (bit 27) must be initialised to 0b1.

Signed-off-by: Fabian Vogt <fvogt@suse.de>
---
 hw/arm/boot.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/hw/arm/boot.c b/hw/arm/boot.c
index 720f22531a..24fa169060 100644
--- a/hw/arm/boot.c
+++ b/hw/arm/boot.c
@@ -761,6 +761,10 @@ static void do_cpu_reset(void *opaque)
                     if (cpu_isar_feature(aa64_hcx, cpu)) {
                         env->cp15.scr_el3 |= SCR_HXEN;
                     }
+                    if (cpu_isar_feature(aa64_fgt, cpu)) {
+                        env->cp15.scr_el3 |= SCR_FGTEN;
+                    }
+
                     /* AArch64 kernels never boot in secure mode */
                     assert(!info->secure_boot);
                     /* This hook is only supported for AArch32 currently:
-- 
2.41.0




