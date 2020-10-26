Received: by 2002:a19:6b17:0:0:0:0:0 with SMTP id d23csp3225173lfa;
        Mon, 26 Oct 2020 14:29:12 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxvVCVl1WFdvb44CJ7AIkT6qx+H6TWi+LfZjP0BZf6Rf7AwNoRVzc0Tk4r3vjaW32yXMxp2
X-Received: by 2002:a63:d354:: with SMTP id u20mr5901003pgi.41.1603747752701;
        Mon, 26 Oct 2020 14:29:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1603747752; cv=none;
        d=google.com; s=arc-20160816;
        b=wIFkbAPCz/C5SYOHfb5Lbqath8b4qjFlGh2LMt0J3Cn5+zfSRQbI/yejtrhaIIzdRG
         8ZpT9OoxIUngbU1AW6kj+aED83Hj7L9jyFEeeLazWj+/JEXz/o4uA+yCa7SrBehWAn29
         PPB8Aw04DsKZHBnQ8MxcbQ4RxXsUuwU4NWhNKC62+0K5fFO4HU8vFujfL3EI403tUtAz
         KHSjFRXxWU2VElk25d37uHfnqSnIengB5leY6oOmes7IftTnQ0wgN2qHSiZw36wsaiky
         w01gRB4cUNYwZMffGb2KK03uL/SgkY3JPFinBLduQzJ7ptjII/2wovpDdlSU2jF1Z3KL
         Febw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:dkim-signature:dkim-signature;
        bh=h5maS+Ga+vOmYNo0Gj4CRNOdrG+2EENdlc0yMuInjXk=;
        b=huuiaOmiG+ZRl6IXi8Z55I4h5hLJYKG+/fPyQOxQOjW2eqFY0kTCpEPYpawFatmqit
         sa15s0wPSCVZrvefVXkuQtoK3G42O5Sko7BZWZKqEB5+3TtmRtn4eSWZ4m8GxBzt+3j0
         BI+R4sgfjeTqtn0FkCNdXG939aCoHWvJ8uODze3FRQjqjl7ZriLYOSWiEhCEu3G44L9M
         dRAE78WSOnyKKoJL9Uwlg2oK1siabeqFWbvD2d1DQ57ai2yAx1TM9+s9nBYDHPx+BmF0
         iqCUxAXfgFrI40pL3hkNi5SFp238oGvnMXdpLOtitAmQWNMNp9ARaddPHLW39Lxs3kGc
         iYAQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@keithp.com header.s=mail header.b=RCyO3IKz;
       dkim=pass header.i=@keithp.com header.s=mail header.b=i0Si6+8R;
       spf=pass (google.com: domain of keithp@keithp.com designates 63.227.221.253 as permitted sender) smtp.mailfrom=keithp@keithp.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=keithp.com
Return-Path: <keithp@keithp.com>
Received: from elaine.keithp.com (home.keithp.com. [63.227.221.253])
        by mx.google.com with ESMTPS id s9si10109011pgo.267.2020.10.26.14.29.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2020 14:29:12 -0700 (PDT)
Received-SPF: pass (google.com: domain of keithp@keithp.com designates 63.227.221.253 as permitted sender) client-ip=63.227.221.253;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@keithp.com header.s=mail header.b=RCyO3IKz;
       dkim=pass header.i=@keithp.com header.s=mail header.b=i0Si6+8R;
       spf=pass (google.com: domain of keithp@keithp.com designates 63.227.221.253 as permitted sender) smtp.mailfrom=keithp@keithp.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=keithp.com
Received: from localhost (localhost [127.0.0.1])
	by elaine.keithp.com (Postfix) with ESMTP id 87D003F2DD66;
	Mon, 26 Oct 2020 14:29:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=keithp.com; s=mail;
	t=1603747751; bh=h5maS+Ga+vOmYNo0Gj4CRNOdrG+2EENdlc0yMuInjXk=;
	h=From:To:Cc:Subject:Date:From;
	b=RCyO3IKznZkge2TLn3UprmuZqvgEAN+KvvviY10/VbtFfSEdQ0Wo+g8ipP3XVWkC0
	 hTuKHUIZXTApZnR3mH9Gle0rtOCSfxBKKW+FoMYIqeWeb/RwYAzf0JeqNUCmINW5Ya
	 TkcfZTqfTLQXftPvYVF+vsKeeH5VMUYLjqRLprgUQpqFGVzQUKbFw8hbQuqKvc/rLv
	 MEbe5bWFKPA9wJw6TagCEpvr8ntvwYxs2+mg0AiAE2mr9hYVgXtqdkS6P+XpQZxiiX
	 55hr7ZOV9dQ/63xFClWLeGAv4QSkYBklXgEYwq9uEmLWWYCnZb0d2/adAPBMvtjUMK
	 HQXON7M2C4Lbw==
X-Virus-Scanned: Debian amavisd-new at keithp.com
Received: from elaine.keithp.com ([127.0.0.1])
	by localhost (elaine.keithp.com [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id rSVIRRspRVFZ; Mon, 26 Oct 2020 14:29:11 -0700 (PDT)
Received: from keithp.com (koto.keithp.com [10.0.0.2])
	by elaine.keithp.com (Postfix) with ESMTPSA id AF45E3F2DD60;
	Mon, 26 Oct 2020 14:29:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=keithp.com; s=mail;
	t=1603747749; bh=h5maS+Ga+vOmYNo0Gj4CRNOdrG+2EENdlc0yMuInjXk=;
	h=From:To:Cc:Subject:Date:From;
	b=i0Si6+8RZDFZh318UTulzuflo2yXtTS9hHlDQCyq1b9eBPGB0PaZRhpCBEe6waaHx
	 IBR4KyBRvqbx1ZqGnVriU7fkkRigdxEMoCNWqE0GHplJW+xqeeYYzKhJ0xmyqkOUPf
	 deyaxk7JMd/NtE3wv3lpPJgaCA36pwPKK8vvs4pDEOPM1D25EUKhP4Op45VMolIZ+P
	 39ld052CoCa0486jS62V8E1PtlqbGHgtlVCsYEIIH9OyEtXm5lN/N+6jUQBweHd5E/
	 JfGgq5MttJCYI5+ELTHprra6U0VVv3i6vA0ctnFHjBYdP7/tBYKz91sYdd7mqtJWa9
	 J5wGA1FuQn8vQ==
Received: by keithp.com (Postfix, from userid 1000)
	id 8E3F71582210; Mon, 26 Oct 2020 14:29:09 -0700 (PDT)
From: Keith Packard <keithp@keithp.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Laurent Vivier <laurent@vivier.eu>,
	Peter Maydell <peter.maydell@linaro.org>,
	qemu-arm@nongnu.org,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Alistair Francis <Alistair.Francis@wdc.com>,
	Sagar Karandikar <sagark@eecs.berkeley.edu>,
	Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
	qemu-riscv@nongnu.org
Subject: [PATCH 0/4] riscv: Add semihosting support [v10]
Date: Mon, 26 Oct 2020 14:28:49 -0700
Message-Id: <20201026212853.92880-1-keithp@keithp.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: YcLtNIVuKLKq

This series first adapts the existing ARM semihosting code to be
architecture-neutral, then adds RISC-V semihosting support using that.

Patch 1/4 moves the ARM semihosting support code to common directories and
adapts the build system to match.

Patch 2/4 changes the public API to this code to use
architecture-independent names and types.

Patch 3/4 changes the internals of this code to use architecture
neutral types where practical, and adds helper functions to abstract
away the architecture-specific details.

Patch 4/4 adds the RISC-V support, including modifying the breakpoint
handling code to recognize a semihosting sequence and adding RISC-V
specific implementations of the helper functions.

