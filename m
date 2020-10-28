Received: by 2002:a19:6b17:0:0:0:0:0 with SMTP id d23csp770724lfa;
        Wed, 28 Oct 2020 11:57:37 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyU5DM3Cy7COdjO9M0B+C/1pgSKYGV82V60Tgmf0VJwQd2ErJGgdtclYmJQXSQW4VlTnh6R
X-Received: by 2002:a17:90a:1f0b:: with SMTP id u11mr305220pja.105.1603911457662;
        Wed, 28 Oct 2020 11:57:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1603911457; cv=none;
        d=google.com; s=arc-20160816;
        b=QYUa/co4VsKdRPa2zrsAT7VMmOAPGHzoWIRQ3s7gVUIlZETh2ulWPgkXntv9dbIUBr
         2wzoeR0qBuZwiUsCcIOz5WTZl6Kh6Y8VTU0lMiklJ0rB8ELxteMW/y6nq26IpMlwBth7
         sriXKegnzkyOJqWars1ac4ACkTDOs6QklQqKrbbxaPaJMK4bHFQtiFZtvZ3wGryjYkff
         +/EtyYwc50kPlXn/johvfj0m4FPwnTCHkFhEexOe0tzNEtqgypj28CSnkOjrL5sC4xxo
         CB9YH1Y0l4N/+EQUZP2aa2Tb2hjr03kflR5y+EPjrgTJEF8x0/6NV4QByiu1B+7DRM0L
         ctAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:dkim-signature:dkim-signature;
        bh=3Y2VWJRX23/hdfDfe9DUV2SU7XlOH4Dfu/OiL9JBZxM=;
        b=VxYHaqmC08YF2m6EqIhWlaguDc43llzdvt9w+uFGsCBl4SjF+XFYN69zvkVzMuQqvX
         sv3tQz2VGT3tOdWyAs1/5CeALIgQeCl3b42SWDoEmMJSATB0NSY2ZvV2i3LJiC8wTaGj
         QkvxrHTlSUzNcl1NXbT4r+s9REh0NC2X0f7LgxUAwbwTxcr9eQFowL8+9sPi7iLlUxKw
         aZ02Efzg+uuTatfjIlLsNm9c75AhzG6OYZzsVspHpKpDwy7oUkkTcC4qUVfdLFxjonKi
         o4uLclBVL9Sd3f3ODjF0HIcs5k+KPxeZ6paa1U2LQJtDvO4L3uqbpUWVt51eS9VOC9ET
         r2lQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@keithp.com header.s=mail header.b=SCAVBsJG;
       dkim=pass header.i=@keithp.com header.s=mail header.b=kMHszQuP;
       spf=pass (google.com: domain of keithp@keithp.com designates 63.227.221.253 as permitted sender) smtp.mailfrom=keithp@keithp.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=keithp.com
Return-Path: <keithp@keithp.com>
Received: from elaine.keithp.com (home.keithp.com. [63.227.221.253])
        by mx.google.com with ESMTPS id g130si204918pgc.247.2020.10.28.11.57.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2020 11:57:37 -0700 (PDT)
Received-SPF: pass (google.com: domain of keithp@keithp.com designates 63.227.221.253 as permitted sender) client-ip=63.227.221.253;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@keithp.com header.s=mail header.b=SCAVBsJG;
       dkim=pass header.i=@keithp.com header.s=mail header.b=kMHszQuP;
       spf=pass (google.com: domain of keithp@keithp.com designates 63.227.221.253 as permitted sender) smtp.mailfrom=keithp@keithp.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=keithp.com
Received: from localhost (localhost [127.0.0.1])
	by elaine.keithp.com (Postfix) with ESMTP id 201E43F2DDB2;
	Wed, 28 Oct 2020 11:57:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=keithp.com; s=mail;
	t=1603911456; bh=3Y2VWJRX23/hdfDfe9DUV2SU7XlOH4Dfu/OiL9JBZxM=;
	h=From:To:Cc:Subject:Date:From;
	b=SCAVBsJG8lQV9AQsqErGnJ9Jqry65LpSB/LD5rjVSq3QD+uX/bTG1WVxRaIAsCwRl
	 5v3OP8gzpsP99tWnJvXOpNUAbhNw/luj3bR/A4GlfvakzJlr3Bw47KC666QV0nuocI
	 mHioRHGTltyybte6hdsWCtUM0AnAmPT0ZSrqlNt18KPRpXtwbDKdyOSbeZVl7vWPWI
	 jHp+D51I0MCpprBKAvfFTj39XnbNd97Q41Mo9odMc64zxBFEp9kY+3Z14OMhUdzb4T
	 Rxy7m6d7W7oACUOQrCgfzkMAlEGtcoFHoWRYmj/GrTjHD+3tbvxM4QMolgWnlOhNpx
	 N5feU1aAO2LMQ==
X-Virus-Scanned: Debian amavisd-new at keithp.com
Received: from elaine.keithp.com ([127.0.0.1])
	by localhost (elaine.keithp.com [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id 85-Kk52-VwyA; Wed, 28 Oct 2020 11:57:33 -0700 (PDT)
Received: from keithp.com (koto.keithp.com [10.0.0.2])
	by elaine.keithp.com (Postfix) with ESMTPSA id 60DCC3F2DDAA;
	Wed, 28 Oct 2020 11:57:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=keithp.com; s=mail;
	t=1603911453; bh=3Y2VWJRX23/hdfDfe9DUV2SU7XlOH4Dfu/OiL9JBZxM=;
	h=From:To:Cc:Subject:Date:From;
	b=kMHszQuP5MNEwRRFoZXqAHMZOQsgJcmzx874IFn2FBQk6JfUFBZtdCjqyprAdPDHD
	 6CPT72b6neQRq+s2i88PTgo8akIfNv3ChxyhYbpKL+QpTmdFvqelT6tyORJw0aSq+N
	 glRrbuwoSY7k+zhPQxoeF3rxO9sTLGgFj1E/u9XHUqJvzLZK7NKbsgat4fcxsL6Jyn
	 P+29+GqzaenPjnQN+1c7fsm2yAMaWUS1p1/zUhF3JGi4cYr80DQVMYFt7OVE9UQcQl
	 9WlsLYlzRDVAerkTnuFqvIi62O8hpHkYiyw5EUH4XJj77DsFD4pKu/flqUP7VONXje
	 RuZlG13NyiAog==
Received: by keithp.com (Postfix, from userid 1000)
	id 2D5421582210; Wed, 28 Oct 2020 11:57:33 -0700 (PDT)
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
Subject: [PATCH 0/4] Add RISC-V semihosting support
Date: Wed, 28 Oct 2020 11:57:18 -0700
Message-Id: <20201028185722.2783532-1-keithp@keithp.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: grXikg9Giou2

This series adapts the existing ARM semihosting code to be
target-independent, and then uses that to provide semihosting support
for RISC-V targets.

