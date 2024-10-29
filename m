Received: by 2002:a17:504:82cc:b0:1be9:327d:8ee3 with SMTP id m12csp321156njj;
        Tue, 29 Oct 2024 08:15:07 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUItGQf+NXngDunK+w4UEN/pJGT5N2mH7Bhe9Xni8jCDmpQMcinxWPPpCwI9I9uNWdZvuqc9MvBbJl/7g==@linaro.org
X-Google-Smtp-Source: AGHT+IHj13dzOQ6w5c9GyrVox2Wwr9Lc3x1ryEU+VJhlCpgMPajHDVdc7oLY5QAOubrxyFf0rnYZ
X-Received: by 2002:ac8:574e:0:b0:460:ff33:9141 with SMTP id d75a77b69052e-461716d01b2mr262851cf.15.1730214907214;
        Tue, 29 Oct 2024 08:15:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1730214907; cv=none;
        d=google.com; s=arc-20240605;
        b=RJlc28k6FuuJ5owJHOzzCohU0cTtSG1kzIGDEQkfSOYrvUPl7E5rbQucGtn6NSBe0Z
         v2UpZgovhSaugP2Aydld8EJVJamK0SnCKHEi8c54XcaGafP1AF48oV7d50MpyHigHprh
         T4MJ/YWxmHipqdSyqMEz9iV2Nyog0Bt+wfj1hR78MHjjkuBRpQT4bi85iwxVEjHISroJ
         42HJCp3GUzaZqGyeFph82Yn07TZPIyLt8w/wEMxcWdyj5H7bBdzjYuwknb41cw7scWhx
         Dn4+mslFmLtoBNk1QFuwqbc8NGHhy6E0DpmUcgQnhxXrPJVQnOLCVkjfk74qyAvEc1XH
         KiSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=pxi72wEBVWIssBlyuwhwklhEOKwU4BGfiI/BxT6XvHQ=;
        fh=H2AmuqulvQE+T5zu97MCEUC3z9wF9NssS7895NhR/+c=;
        b=CfxRIQI5Wij5tbU0Z+cwz2qD5F1OxxwgTIoE1pOJOLTMudAksjL4GTbPM/1aMrgOpO
         A/ilmlSywkQH9pWp1VElQfcOWCakA1dp9YPY+phe/JP5/A7azX2SNQrTxIO3Lb6GAxd8
         O8S6Xam8oRYvh1Tyc5r6PoZD9E1lI8hpwcPioWzLF1KqSbKmuHJWUSPZ0Ntat49xTTel
         +CQPXVXEoxMlCZL2sOgqLcfghDUkvdSxnSbVroJ7QD7dLHUHUNCZkN08HMORv/PA/WIz
         vYXdVnWOKE7bdd9u1PJP1EL+hcTlW+n7CKcXpHyvymlD+ehBtph+IInQtJjD00FtESMS
         Hfow==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=vYcNeXQ9;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-4613235a9e1si120690581cf.389.2024.10.29.08.15.07
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 29 Oct 2024 08:15:07 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=vYcNeXQ9;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1t5nw0-0006yb-Nc; Tue, 29 Oct 2024 11:15:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1t5nsB-0000p7-QX
 for qemu-arm@nongnu.org; Tue, 29 Oct 2024 11:11:11 -0400
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1t5ns3-0007j6-9k
 for qemu-arm@nongnu.org; Tue, 29 Oct 2024 11:11:06 -0400
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-4315df7b43fso56238175e9.0
 for <qemu-arm@nongnu.org>; Tue, 29 Oct 2024 08:10:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1730214658; x=1730819458; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=pxi72wEBVWIssBlyuwhwklhEOKwU4BGfiI/BxT6XvHQ=;
 b=vYcNeXQ9NyXJ1ZJ4xc26ZUdIsfu1km2C9fYooFvpGgu8kju24KbFht1G7QstOOq8C6
 evFALRLvLiw1CqtFWm6yiXRuoKlN1V0eRZY3e1tR7LJ0LE6ijxAx7g5amiI+GX/ZQ2qS
 +qmr0j14ZVJ/eGYtV0pYK5Gl9XABSk46YNPoZDquCM58AAKXg5fuqtOth9Mo+ZuzI5My
 x7r10jvm+93erlrxRrhC/DaCduWige9wtzj23bGi5hYCbdi0/UKyIDLTuY0NHLj1OHea
 u8TkoXV3SYMS0p/UfKdMMgN5fUhe7WauyVhd2nZ3rRm4K04svabZcK2H7B0DKF3cQzwq
 wsRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730214658; x=1730819458;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=pxi72wEBVWIssBlyuwhwklhEOKwU4BGfiI/BxT6XvHQ=;
 b=wd7+gT9nigXncquiSxDlo4aCmtJMJD2f703lawT07MJ828PakUwg5GIXdmCvv6xZCv
 2hrXjsJDmh4Qm+eZ3Ge9lJr8jm01cRacOmb6L3UqOmIxFB5PmsihZaSW0KYthytzbS4M
 WDSSeqAhwSbNEUPFFXvDM6TUXqimQHtvGOjOu+KBDO95YjMfLZOixpXcGmfchKMGkCRb
 mEwplJ3Oal3Eznr58Pu6zzkDsDXHJduwRaU0rqvK5IXa7j1n2j4cRBkOdvOLLoAXNNxJ
 vWFiPKpnGXXAuUtIkM4oA392r5BNQxrzsuTZ0aya+zk5TBemXwRe245BlEf/DcOCbnk+
 6F1w==
X-Gm-Message-State: AOJu0YyUZ9qHYxh4Hi0Y7gfJ2mqeUcKEkrUTZbq5ot6EGYqZgnQEUAJp
 UWgQQ54U9PeewP1aNZNtfosuVLD/v0kyT0l+jFhrIPiKCg4ig/La3jgyFInCkYt+8jOtIHwoJOa
 q
X-Received: by 2002:a05:600c:5253:b0:431:46fe:4cc1 with SMTP id
 5b1f17b1804b1-4319aca42bemr111677735e9.10.1730214657629; 
 Tue, 29 Oct 2024 08:10:57 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4319360cc2esm146835865e9.44.2024.10.29.08.10.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Oct 2024 08:10:57 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PULL 15/18] docs/system/target-arm.rst: Remove "many boards are
 undocumented" note
Date: Tue, 29 Oct 2024 15:10:45 +0000
Message-Id: <20241029151048.1047247-16-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241029151048.1047247-1-peter.maydell@linaro.org>
References: <20241029151048.1047247-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x330.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: Rt/oPoYmz0E6

We now have at least placeholder documentation for every Arm board,
so we can remove the apologetic note that says that there are
undocumented ones which you can only find out about via the
``--machine help`` option.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Cédric Le Goater <clg@redhat.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Message-id: 20241018141332.942844-8-peter.maydell@linaro.org
---
 docs/system/target-arm.rst | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/docs/system/target-arm.rst b/docs/system/target-arm.rst
index 1f806cf4a46..9aaa9c414c9 100644
--- a/docs/system/target-arm.rst
+++ b/docs/system/target-arm.rst
@@ -63,10 +63,6 @@ large amounts of RAM. It also supports 64-bit CPUs.
 Board-specific documentation
 ============================
 
-Unfortunately many of the Arm boards QEMU supports are currently
-undocumented; you can get a complete list by running
-``qemu-system-aarch64 --machine help``.
-
 ..
    This table of contents should be kept sorted alphabetically
    by the title text of each file, which isn't the same ordering
-- 
2.34.1

