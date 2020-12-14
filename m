Received: by 2002:ac2:4c03:0:0:0:0:0 with SMTP id t3csp2877460lfq;
        Mon, 14 Dec 2020 12:07:19 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyFKfEHmMhQ8yJ0xTKmmMcDNewD2nzi7CCoTIhpc4wnamlB2dCgJg/qpQ7Hhaj4S0AVxYar
X-Received: by 2002:a17:90a:aa8f:: with SMTP id l15mr25879270pjq.135.1607976439079;
        Mon, 14 Dec 2020 12:07:19 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1607976439; cv=none;
        d=google.com; s=arc-20160816;
        b=0En7oGDnELfAD/cpLlbP76WDVoIvH9i/40H8+Zorf/vR3nLvaMj08Tl+uTKr4m+cfp
         jIdzhZaGB7aROU81GKBtEm56FHtf+icf3o13ZjvwwkeH0aKQmRlLefC3JBTNQwy4PC1/
         Yh3GL0FbsfHSj5j7FIavUT0+Ag29fS7UnGpB2J8/+2vsia7+xidajNrXJSFombubSr9G
         7Gr9gfHq83yurx6xslUTtp1EgEZA30p0Ma5QHwtX+rLz4FkOFBgR/w8aDXxf7pjvXwZO
         Q6mlICWOf0wJL6pgl2WBelJ7ymyHlZbCFSQzXQJs923ioxmv3oZIvjrr2ZaNjGUuXp/w
         /fow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:dkim-signature;
        bh=5TARfT/ukpao7EiFQkQN+xN529Qnh5s9VbBBbvUuACc=;
        b=DaAfMi3qhoX3AloV7KylwpSR60NoL4/T8jmyjmQbVWHxf5uEs/47w1w/bg9O7jEEb4
         7SsOp247ifLHVuIw5o6FtL10KDssa6ardyt2wMOOv+jTizw6JBA0Ovpke39k1bcM1N5Z
         CsZOArX5/7UgY8oqtpTa5r/tGCFSKUmWHpVwzLgU/TMijYcIgQNU0/ngndoqBXpft/HJ
         EsjNJYxefOpwptxz0wv9rZW6AbgfFh79QLssXMJ0CGBEfUhQljq7FJ6+Z1Sm8FmT5JUP
         ISxVaOkl48yKXJOE9myIVRDvbcO0w8sbRiMuIcvjQbW5QUQt8dBY27CuzdMzaldvpbsz
         3B/w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@keithp.com header.s=mail header.b="ebrUsY/b";
       dkim=pass header.i=@keithp.com header.s=mail header.b=wYIoBcYt;
       spf=pass (google.com: domain of keithp@keithp.com designates 63.227.221.253 as permitted sender) smtp.mailfrom=keithp@keithp.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=keithp.com
Return-Path: <keithp@keithp.com>
Received: from elaine.keithp.com (home.keithp.com. [63.227.221.253])
        by mx.google.com with ESMTPS id q187si16521277pfc.231.2020.12.14.12.07.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Dec 2020 12:07:19 -0800 (PST)
Received-SPF: pass (google.com: domain of keithp@keithp.com designates 63.227.221.253 as permitted sender) client-ip=63.227.221.253;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@keithp.com header.s=mail header.b="ebrUsY/b";
       dkim=pass header.i=@keithp.com header.s=mail header.b=wYIoBcYt;
       spf=pass (google.com: domain of keithp@keithp.com designates 63.227.221.253 as permitted sender) smtp.mailfrom=keithp@keithp.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=keithp.com
Received: from localhost (localhost [127.0.0.1])
	by elaine.keithp.com (Postfix) with ESMTP id 211EA3F2E393;
	Mon, 14 Dec 2020 12:07:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=keithp.com; s=mail;
	t=1607976438; bh=8haCYnZ52jXxxy78j8fypuNz+2Y8rEl1NEqgcLh4ORM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ebrUsY/brx6OjNpoxolM4bbxy/nQy6RGE3hJ8UKBe2lzs/cE6e6oomZSQhnAUWDyg
	 vq5y6hVZ73AvYunlHPB9H0S/ndGFFW3D67e1hikTEOyMV6OyrWQ/kVjqi5sG9FqX6j
	 pgI8GtxqvupHJjcq0JlSk62ux/2bmyuJoDBuPfIA/lkiaV3DEAE2XH/IEZQNpcUp0x
	 Phnzlwkg8Ha+XgeThXzSiBt99BoUmUlB/AwF+Li6t5I3aGLsY9eHX0illij8hR91HC
	 gyJEJYGyKLFGnmiryruHRzoMPWtjoyy29gx8RF6pUkDamJtTlRmEp+9ARn4nC1APYz
	 ijWiuXaevpRDw==
X-Virus-Scanned: Debian amavisd-new at keithp.com
Received: from elaine.keithp.com ([127.0.0.1])
	by localhost (elaine.keithp.com [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id GHliSzEgtfof; Mon, 14 Dec 2020 12:07:17 -0800 (PST)
Received: from keithp.com (koto.keithp.com [10.0.0.2])
	by elaine.keithp.com (Postfix) with ESMTPSA id 7816F3F2D6F1;
	Mon, 14 Dec 2020 12:07:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=keithp.com; s=mail;
	t=1607976437; bh=8haCYnZ52jXxxy78j8fypuNz+2Y8rEl1NEqgcLh4ORM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=wYIoBcYtjBDc05zvyqpV+F6NqqILFE43y12UsOcSxQAvc/11JoR1nVL+42x9cK8NQ
	 fMk3fw7KqxP3CLZk4gs/okQ0A/M10En2jtVyI8CTnVT3rc02//AzlZSZw+15PbA4G1
	 ZnTKo7rIlRasCy2jUNwjk4cjBvRnKJ5Xq4yKp4CXAhUUzRusw5xiR9WfyD4GaeuEne
	 IDuA94WCVntPKXMVt6wGb1O8alUs6MdTY62k8o5mQhDNDpNCYu4bXu7XkOpEmyff8d
	 WcoFmNqgk5AoZshTHCmyeTUGocrENJ7zJVk8qKJ8W3KoWmGnlCsh1DerWmkRri+N7e
	 iTsqy0+bTvqkw==
Received: by keithp.com (Postfix, from userid 1000)
	id 3015E15820DB; Mon, 14 Dec 2020 12:07:17 -0800 (PST)
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
	Sagar Karandikar <sagark@eecs.berkeley.edu>,
	Keith Packard <keithp@keithp.com>
Subject: [PATCH 0/9] Add RISC-V semihosting 0.2. Finish ARM semihosting 2.0
Date: Mon, 14 Dec 2020 12:07:04 -0800
Message-Id: <20201214200713.3886611-1-keithp@keithp.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <87wnxktost.fsf@linaro.org>
References: <87wnxktost.fsf@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: dwXvfDD6ydRD

This series adds support for RISC-V Semihosting, version 0.2 as
specified here:

	https://github.com/riscv/riscv-semihosting-spec/releases/tag/0.2

This specification references the ARM semihosting release 2.0 as specified here:

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

Signed-off-by: Keith Packard <keithp@keithp.com>

