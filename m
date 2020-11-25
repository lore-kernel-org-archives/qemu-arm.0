Received: by 2002:a19:ee0a:0:0:0:0:0 with SMTP id g10csp864743lfb;
        Wed, 25 Nov 2020 13:36:29 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyAvQQuw+jN7V0wci+rZAlExNJolGy/KNllVM41IpmlU/hLoTDwMDU4mbdPLlwlINK9rQPJ
X-Received: by 2002:a63:1619:: with SMTP id w25mr4665969pgl.34.1606340188876;
        Wed, 25 Nov 2020 13:36:28 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1606340188; cv=none;
        d=google.com; s=arc-20160816;
        b=bBaJO6vItwLBvtje9Fm+YMfal5gRO47hgV9cFVNcfGWYD8jMpJdIAARSRUP020UnJe
         f9lUe98dHYqz7kYSaXU3x7QyGqkG2ZS6nIfSdpV1ygus9qk1POkvuQ4uzLKk2tB1sY1d
         5GvUEEhwY40YETlZMZMzaouSJZYtY4PazVBMklhj6GOBXgapBywFQPX2O7qbO4Ni+yok
         b2cBnd5Cf0R4a4LVerNvWkv8LgpaClodC5WhPJeKDgn1NgsHZyIHoSSZxJWWjIh0nSD8
         nE3J5axOBhnyP8hhtow/HOCfHW34+wUkZXqRRCvtFYVYwyN/pkrvf2H85uOpj7v9eQh4
         7NMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:dkim-signature:dkim-signature;
        bh=MnQ7yEzIQnfjZFap42ZGJih6+ZGQ7Ny5btcwgsyHc7A=;
        b=oL0UAEfKcxEWtqdncqcXMnWRCD/+nxeCtJ2KR2F9RwzvuLvLWsimeCN/oVM+uh0Fat
         PJmXFHCeEIpgGMHAavg67lWejJ17XykgUVG7waR2XC+evLH33eGkEPw06c6Fj+KWRQvS
         cKJHMuPFGJm088PCPytEx9gRE5YphAmLoZJvZrmBwOSMyRnbBnrVJuVIdiPuM3bmJTB7
         m6SEVN09PUD/WXNGLkio8q3PCkjwLBn9xVob4DH67M7VjGA0irjIp/aI04aYWxW6VNkZ
         b1CmXkehgRJrJ5dC2W4mjEGKhncYP7hXJgBzdgvPfXIaBO7hcznDgeuhIJPIP6ZFjj78
         PCtg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@keithp.com header.s=mail header.b=nWkQYM97;
       dkim=pass header.i=@keithp.com header.s=mail header.b=nWkQYM97;
       spf=pass (google.com: domain of keithp@keithp.com designates 63.227.221.253 as permitted sender) smtp.mailfrom=keithp@keithp.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=keithp.com
Return-Path: <keithp@keithp.com>
Received: from elaine.keithp.com (home.keithp.com. [63.227.221.253])
        by mx.google.com with ESMTPS id cv2si3311293pjb.85.2020.11.25.13.36.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2020 13:36:28 -0800 (PST)
Received-SPF: pass (google.com: domain of keithp@keithp.com designates 63.227.221.253 as permitted sender) client-ip=63.227.221.253;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@keithp.com header.s=mail header.b=nWkQYM97;
       dkim=pass header.i=@keithp.com header.s=mail header.b=nWkQYM97;
       spf=pass (google.com: domain of keithp@keithp.com designates 63.227.221.253 as permitted sender) smtp.mailfrom=keithp@keithp.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=keithp.com
Received: from localhost (localhost [127.0.0.1])
	by elaine.keithp.com (Postfix) with ESMTP id 8C88B3F2E288;
	Wed, 25 Nov 2020 13:36:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=keithp.com; s=mail;
	t=1606340187; bh=tGkOZyd/9GYTCytL2ts1t7fw0WSivX7vnC0R1Ld40Ic=;
	h=From:To:Cc:Subject:Date:From;
	b=nWkQYM97UV7iwR0u/pS6MXBkIaAgEa/0fqiwa0YRkG9DNyeLBGnQ+OJ6qLQzgG0/6
	 xw3iF2DKV1m/6faCVfHpFXSfmcD8dvzDgnFAXdlfH9/+psdvE8Bh6HkdJ9gp3lmo+o
	 E+5uZhtcUHDUKqwU1AZp0e6tSoVyPlf2TikAehb/mvgo8pk9B8gsHws2vDOn20ibAb
	 ZNsiUOLeW9n24HH6uKX5IFrBUcQ0DtelDVf1UMLfY/CmxY9bNUXYwWMxkQtlN2fJOR
	 TesXDe7An3OE7nvVFGeJpRxsOiDW5VNhY/abZx/yMYz+eq4DXTBRDC0kXTiNR3NqMh
	 fCg2C8Pt8yP+g==
X-Virus-Scanned: Debian amavisd-new at keithp.com
Received: from elaine.keithp.com ([127.0.0.1])
	by localhost (elaine.keithp.com [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id 16__NwTy8MBl; Wed, 25 Nov 2020 13:36:27 -0800 (PST)
Received: from keithp.com (koto.keithp.com [10.0.0.2])
	by elaine.keithp.com (Postfix) with ESMTPSA id 2BC2A3F2E287;
	Wed, 25 Nov 2020 13:36:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=keithp.com; s=mail;
	t=1606340187; bh=tGkOZyd/9GYTCytL2ts1t7fw0WSivX7vnC0R1Ld40Ic=;
	h=From:To:Cc:Subject:Date:From;
	b=nWkQYM97UV7iwR0u/pS6MXBkIaAgEa/0fqiwa0YRkG9DNyeLBGnQ+OJ6qLQzgG0/6
	 xw3iF2DKV1m/6faCVfHpFXSfmcD8dvzDgnFAXdlfH9/+psdvE8Bh6HkdJ9gp3lmo+o
	 E+5uZhtcUHDUKqwU1AZp0e6tSoVyPlf2TikAehb/mvgo8pk9B8gsHws2vDOn20ibAb
	 ZNsiUOLeW9n24HH6uKX5IFrBUcQ0DtelDVf1UMLfY/CmxY9bNUXYwWMxkQtlN2fJOR
	 TesXDe7An3OE7nvVFGeJpRxsOiDW5VNhY/abZx/yMYz+eq4DXTBRDC0kXTiNR3NqMh
	 fCg2C8Pt8yP+g==
Received: by keithp.com (Postfix, from userid 1000)
	id CF96D15821B9; Wed, 25 Nov 2020 13:36:26 -0800 (PST)
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
Subject: [PATCH 0/8] Add RISC-V semihosting 0.2. Finish ARM semihosting 2.0
Date: Wed, 25 Nov 2020 13:36:09 -0800
Message-Id: <20201125213617.2496935-1-keithp@keithp.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: 6wcqdFslc2Oh

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
 5. Add RISC-V semihosting implementation
 6-8. Add missing semihosting operations from release 2.0

Signed-off-by: Keith Packard <keithp@keithp.com>

