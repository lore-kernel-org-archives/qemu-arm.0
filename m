Received: by 2002:ac2:4c03:0:0:0:0:0 with SMTP id t3csp458769lfq;
        Thu, 7 Jan 2021 09:07:28 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwM1+4la1a+/LFWL1Na5pSYMm+xuZknnmbghaaL/KhkjPQb5TE4j1yyfMMzRsQgD6pqzcFg
X-Received: by 2002:a05:6a00:1716:b029:19e:11b0:7804 with SMTP id h22-20020a056a001716b029019e11b07804mr9360866pfc.57.1610039248204;
        Thu, 07 Jan 2021 09:07:28 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1610039248; cv=none;
        d=google.com; s=arc-20160816;
        b=mzlOyzA7ZhaHCMH4gAPcag/sT0GXxbqdhtTXhLurWidhdsFow9virkPs9JvuSulvlE
         op4xN7FwQQO46XH01XMMYQ4YGTmvZ3aN80s1XjA+rs4Dink0fuiWJWz2fcKTrxEDdwAA
         cfGKXzY81kSmFoNXAtymtBShelodxPQLVbGzNn0hUt/bRq8wpYG5OAjVq3BoPJptfhru
         KZyhSm5c8fP+jXuEAZx7/JnXzeepXVrxnncWlsn4hBitL9BkM9LCGMYGhRILDokIl0lN
         kzSbiuPWOW9cLyeHw17CVejnsWI5r1dM63Jp2ESn1NRCqjU8DhptVG6cap+lscXonbPN
         yONA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:dkim-signature;
        bh=st/DwMmCjNZ40FZW79PjNiZPSb6vsG4G3EKAOBiCcPg=;
        b=U1OiGlVRynYO2NMBOEDnfc8lKSRIrRp7AoOKjkGG6FpOE9upGRLS/uBj9ieIz7WECU
         fi+IhJSN/EYMOTuuN+d1ID+5uSxRKgkg6Rtunr4NwT8t37nvEREKdIGDFbLf70Mlnntc
         bobIw26XPwm0Z6DyTVug54YRZx2gztUZVw4SkWCeOELzRZHEhnvIgWkNEPRsryDbEa6/
         wDI9n1KCc/fGsDe4Vxmuow7XVyyXtxU+mP92zyQGRTWYYRCzzW1gNBG6pa4dp+quFtjn
         K5ttS7nXokL7AaNg9iS/B8EklUaT3f9lk/WHKnfRwqNPQ9zlq71Wbuz4L9n01YPOHfNB
         SFFA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@keithp.com header.s=mail header.b=gNDedzCS;
       spf=pass (google.com: best guess record for domain of keithp@vr.keithp.com designates 63.227.221.253 as permitted sender) smtp.mailfrom=keithp@vr.keithp.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=keithp.com
Return-Path: <keithp@vr.keithp.com>
Received: from elaine.keithp.com (home.keithp.com. [63.227.221.253])
        by mx.google.com with ESMTPS id z12si6387493pgu.300.2021.01.07.09.07.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Jan 2021 09:07:28 -0800 (PST)
Received-SPF: pass (google.com: best guess record for domain of keithp@vr.keithp.com designates 63.227.221.253 as permitted sender) client-ip=63.227.221.253;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@keithp.com header.s=mail header.b=gNDedzCS;
       spf=pass (google.com: best guess record for domain of keithp@vr.keithp.com designates 63.227.221.253 as permitted sender) smtp.mailfrom=keithp@vr.keithp.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=keithp.com
Received: from localhost (localhost [127.0.0.1])
	by elaine.keithp.com (Postfix) with ESMTP id 6DD2A3F2E315;
	Thu,  7 Jan 2021 09:07:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=keithp.com; s=mail;
	t=1610039246; bh=9BOTQrPtZFuoNkEto83jhRHuzrY24cMlHGqNa4OHSIY=;
	h=From:To:Cc:Subject:Date:From;
	b=gNDedzCS515exhvhhtzTot0CtnkZW1iSO1ZPFPPrW5m/Ib9ji6Fo1jHJEWY1uBSRu
	 RNOoegtnZOJnL4ZjlMIJyST5YFHVcLGWdbeVx8YD4EkUHGAr+bdOmeAX8i156tLxMp
	 elI6gvNOQ6eef+NF3QnqBKBCDBE4x1p+yPzwvh9nkbIdyoRMzUOOl6ctiaxVFDSfCv
	 lJ0NJ5SPm8jO/UFXT1C8DcPE3ewqr5NsMk2p+raA75NrtNl0fAZ/m/8jXdLW7uwrjF
	 oJ+LxSQHOgutqov+a86WKz5XkF37+TqGZ2A6qutRriTAvUum6GAqgfmgvVcfP21M5I
	 uAWoyrEew4yBA==
X-Virus-Scanned: Debian amavisd-new at keithp.com
Received: from elaine.keithp.com ([127.0.0.1])
	by localhost (elaine.keithp.com [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id JrZe3ojHtXJn; Thu,  7 Jan 2021 09:07:26 -0800 (PST)
Received: from vr.keithp.com (vr.keithp.com [10.0.0.39])
	by elaine.keithp.com (Postfix) with ESMTP id E5CE53F2E325;
	Thu,  7 Jan 2021 09:07:23 -0800 (PST)
Received: by vr.keithp.com (Postfix, from userid 1000)
	id 65703742C81; Thu,  7 Jan 2021 09:07:23 -0800 (PST)
From: Keith Packard <keithp@keithp.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Alistair Francis <Alistair.Francis@wdc.com>,
	Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
	Laurent Vivier <laurent@vivier.eu>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	qemu-arm@nongnu.org,
	qemu-riscv@nongnu.org,
	Sagar Karandikar <sagark@eecs.berkeley.edu>
Subject: [PATCH 0/9] Add RISC-V semihosting 0.2. Finish ARM semihosting 2.0
Date: Thu,  7 Jan 2021 09:07:08 -0800
Message-Id: <20210107170717.2098982-1-keithp@keithp.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: ETRZY2Ae4uaj

This series adds support for RISC-V Semihosting, version 0.2 as
specified here:

	https://github.com/riscv/riscv-semihosting-spec/releases/tag/0.2

This specification references the ARM semihosting release 2.0 as
specified here:

	https://static.docs.arm.com/100863/0200/semihosting.pdf

That specification includes several semihosting calls which were not
previously implemented. This series includes implementations for the
remaining calls so that both RISC-V and ARM versions are now complete.

Tests for release 2.0 can be found in picolibc on the semihost-2.0-all
branch:

	https://github.com/picolibc/picolibc/tree/semihost-2.0-all

These tests uncovered a bug in the SYS_HEAPINFO implementation for
ARM, which has been fixed in this series as well.

The series is structured as follows:

 1. Move shared semihosting files
 2. Change public common semihosting APIs
 3. Change internal semihosting interfaces
 4. Fix SYS_HEAPINFO crash on ARM
 5-6. Add RISC-V semihosting implementation
 7-9. Add missing semihosting operations from release 2.0

