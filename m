Received: by 2002:a19:e8d:0:0:0:0:0 with SMTP id 135csp1618781lfo;
        Fri, 29 Jan 2021 17:52:40 -0800 (PST)
X-Received: by 2002:a1c:28c2:: with SMTP id o185mr6031505wmo.7.1611971560872;
        Fri, 29 Jan 2021 17:52:40 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1611971560; cv=none;
        d=google.com; s=arc-20160816;
        b=MUT4gmeM7NAWuzRmysKsmjfNNFAgXAAdr1IgVEiOS0d1SQOZ7b/nfHkgbwuZxSqAJK
         yA5BDHRtBbt7cL8DwrUiVpP3X1TaxzKN8+PtTZrXMsQkP0ptgVrvcjJOnBZLWRjfYdQi
         BT4nLIJA3ASh3gX1nAsGHSY97aZfAurt/kN28v+NUozmvFihoQQU5XJ15e+WnnMgco7r
         LKVy8WAqVcdmFyOsPtmK/5mYXn+DZ3tWd96B5iZQRv1zoNrclBETSlSqb0vpaOgEaVv5
         aBmqRikj2uJxPNRu+3alJTuHX1dtQoXsCjBkoPKICQOVw3OIKEBxsBOERfxESgbpWSSj
         0oMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:dkim-signature;
        bh=G9dNmRIohMTgXAElzkQ+lpMLRmxhHG61au1rY6dJdIw=;
        b=Pd8iReug3dzC1543VqPhx9ivy8KzJlIlYauGw9R/hLpvF0h4+d8h5AjtJh7/uSU5YL
         hAzRrvKE67A6/OAW80e1U0Bxm4TlVk+0MJK7WDI3JdcFnWaDT/AyqoLQt4LJ5n5Umaye
         QS/Ve7YU2L/Xss1THuEJSB0GpyDVfzvgsc+iYxJUuNZj7bUdKnBRcpO5DP/18EItxMyg
         w6GvHSf0Fqu4D1rvdrLpS8FV20/spS/QlHr8YsaHe+Sx9Cd66OHNRxRIqXB5aIrFIBOO
         r9hugwNEPKvX9+6gapYHeRHTS27XQZJubv9l+iyhA9LSQJLIHsztvYI5inCPWzyXhW1N
         tsew==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=PEjpazXU;
       spf=pass (google.com: domain of philippe.mathieu.daude@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=philippe.mathieu.daude@gmail.com;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <philippe.mathieu.daude@gmail.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id b66sor5388982wmh.16.2021.01.29.17.52.40
        (Google Transport Security);
        Fri, 29 Jan 2021 17:52:40 -0800 (PST)
Received-SPF: pass (google.com: domain of philippe.mathieu.daude@gmail.com designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=PEjpazXU;
       spf=pass (google.com: domain of philippe.mathieu.daude@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=philippe.mathieu.daude@gmail.com;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=G9dNmRIohMTgXAElzkQ+lpMLRmxhHG61au1rY6dJdIw=;
        b=PEjpazXUgk6kR6UqDmwU45UySoXQLcz5AUjh6P8ScUgFkBsPisn+Tm/qm9hBMUWlxU
         bXEcLJ8UugY9aEVPQbo6p4m/Hux6j9xRlGgX4nFBl3CdGdq2BBIrSjLEO86Z4aoFc8pO
         sOUDNxqSQ0sq11WskYH43JUY8ipQhlYj/w/bYvz/VXaBRpbw+O5FYEX3aiwba24dV37x
         eXoZz8Ukp5kBBqvvXXbiR7M0vIrCWLxvkVDzdRwwembHyYCl3SSmuG6HSoiE25+STMef
         fVEoHq1XKPD0QMR5koqBX/Yf7PEsrpn+QnhlP/GxxXqA9IDdom/mYPcwNcgu4Y2ATxaQ
         whbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:content-transfer-encoding;
        bh=G9dNmRIohMTgXAElzkQ+lpMLRmxhHG61au1rY6dJdIw=;
        b=J+zqR/KyghOYcCj9m2zu12F3w/osI8PlQRUhIJL8umgsLnL+MzFYjEn0LLe7m1Ypbl
         lQWOkyGXcy9g4Vqk9Zs27I9UP6z/SnnWiRFrQByhaitvmD9YFyIRPFs24uurEy4bs3kK
         7YKkLczC/LJuJU8mskYZQi4BAFtmPqm/yNQaXU7IkL0s4Rk2p2uy74OVii6jiuTf0ea4
         oNJrFy4mi9Worod4exIQNQZn9/mQ+/q3P2wl7i8ormnkpfDe+RXPvjkkW/JvVhfdhyFs
         x29tgCJ8vIFYgbdcJYIU9J+Q6Q6heObmmaafA/3xYTPcOdG+UCYKMbqcmBYrdtkahWHM
         +I0Q==
X-Gm-Message-State: AOAM533kCyB4Q0XncKLD7kuF4QATrYLobe4IUnn/Z0ns33Ni+dzNGqC3
	uQqZdJ1DYe0uaPhLvpW/1f+z6dO/6bw=
X-Google-Smtp-Source: ABdhPJwskto+f53o9TCaynYuVK8iQ1uBoTdTN+CKWcrz2acq5nnSN55h/BCj1DXRiUJLZD6Cr+Hp6Q==
X-Received: by 2002:a1c:21c6:: with SMTP id h189mr5786718wmh.173.1611971560647;
        Fri, 29 Jan 2021 17:52:40 -0800 (PST)
Return-Path: <philippe.mathieu.daude@gmail.com>
Received: from localhost.localdomain (13.red-83-57-169.dynamicip.rima-tde.net. [83.57.169.13])
        by smtp.gmail.com with ESMTPSA id w126sm12485133wma.43.2021.01.29.17.52.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Jan 2021 17:52:40 -0800 (PST)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
	kvm@vger.kernel.org,
	Peter Maydell <peter.maydell@linaro.org>,
	Fam Zheng <fam@euphon.net>,
	Thomas Huth <thuth@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
	Richard Henderson <rth@twiddle.net>,
	Claudio Fontana <cfontana@suse.de>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	qemu-arm@nongnu.org,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PATCH v5 02/11] default-configs: Remove unnecessary SEMIHOSTING selection
Date: Sat, 30 Jan 2021 02:52:18 +0100
Message-Id: <20210130015227.4071332-3-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210130015227.4071332-1-f4bug@amsat.org>
References: <20210130015227.4071332-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: /j+xUzSVqBKr

Commit 56b5170c87e ("semihosting: Move ARM semihosting code to
shared directories") selected ARM_COMPATIBLE_SEMIHOSTING which
already selects SEMIHOSTING. No need to select it again.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 default-configs/devices/arm-softmmu.mak | 1 -
 1 file changed, 1 deletion(-)

diff --git a/default-configs/devices/arm-softmmu.mak b/default-configs/devices/arm-softmmu.mak
index 0500156a0c7..341d439de6f 100644
--- a/default-configs/devices/arm-softmmu.mak
+++ b/default-configs/devices/arm-softmmu.mak
@@ -41,6 +41,5 @@ CONFIG_MICROBIT=y
 CONFIG_FSL_IMX25=y
 CONFIG_FSL_IMX7=y
 CONFIG_FSL_IMX6UL=y
-CONFIG_SEMIHOSTING=y
 CONFIG_ARM_COMPATIBLE_SEMIHOSTING=y
 CONFIG_ALLWINNER_H3=y
-- 
2.26.2
