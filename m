Received: by 2002:a17:505:8d87:b0:1be9:327d:8ee3 with SMTP id ri7csp2005989njc;
        Mon, 22 Jul 2024 09:07:49 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXfFaQFeFhi3yNPw7bnpN+H+agwVrrEbUh29ZqizoZY26uXuAgkm09KE9ltg+FKF8f+o6JsgkASEYWCkeHsaMW49X44Ek9t
X-Received: by 2002:a05:6000:c8a:b0:368:747c:5a04 with SMTP id ffacd0b85a97d-369dec16606mr256461f8f.25.1721664469325;
        Mon, 22 Jul 2024 09:07:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1721664469; cv=none;
        d=google.com; s=arc-20160816;
        b=bhB542BXHKpNo3q1sYKcUHoWD6FJDJLYhLh++JldbtKEvXKH6JSRrVKDbyUHUR1/Ln
         Use2bqDQbIAcPLbsfK66s/gPgkcLdF9kLRQXtpTwaaIBgh93KX7lZVLD4PX/8jsYT4Nw
         4pPcHzwrBAmXzKlYlSU90w9oWNEgvx+leP+vXAGyApn2R0BpGEGS/AA5TDZ3eQ2LoJBf
         M3G3iuHP2YOzEqc0pGtSrKiHA1hPlLeNxrPmRBRO07EeKTUJ39DuiZLeEYk8I8R3pwfn
         y1n+XavwYHsECzogxb0lZURmfRAL5X7wdXexovVemWyNHh/18M2/G8yaUQY0SstZ6OKu
         1AAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:dkim-signature;
        bh=9OXBMV4qUioh74t9F5ySrsmXcQ3/BZ3r66GlJck4oz4=;
        fh=mZHNikmmVG/T/oGwGcsfYskLxelFAecelcorisue5BI=;
        b=rd7b9LKbnU7pQ6HSgmOSCh824m/RZJTwwUZNOKsIM4mpKrrtJssvIr9fLWlp5qvywL
         T1V3vK5/HZsmQ3GcwazwGesoka1vRehwvuDApF+87yvtpqekguEMs2Hwxr4k1sGGV2VK
         8F8JO2yFe+rg/LvfcG94gEDeYZTh3PRRd6wDFYXM7VYmCizXjbPIbMBd1tJOQoqX4jxz
         0zsGC8FOOnA2dfQl5sFUvElPYUdyYcBcEZJCvFWbKpe3x1wfWjoRk5wRg63gtJ9KcUTN
         VViMfTcJc9mCDZGY7aujxBDi0gfODpTWNNTrVIFtCvEo4/j5s5C9nqPYZCNkWw/lSeaK
         6Eig==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="y0q6a4q/";
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id ffacd0b85a97d-368786b2be9sor1763713f8f.1.2024.07.22.09.07.49
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 22 Jul 2024 09:07:49 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="y0q6a4q/";
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1721664469; x=1722269269; darn=linaro.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=9OXBMV4qUioh74t9F5ySrsmXcQ3/BZ3r66GlJck4oz4=;
        b=y0q6a4q/KzMFtVqWpAmzo7H62yj0jdEE2ZqCehuh60CIo6cqXw1o1d8+Ytnz83dk8j
         uVQT2Qpz3tLqtFt7MI715CngOUEsVIHfW8Tyx9qNh3IADUh7bnaniFRkyyC6cleMzwOt
         PAQ15rvq1BwKejFJG4EqtupZe9FA8/w/rxMGxhQ5dePdoVEU73tmpOIgUosAzy0DArI7
         kWjAnkeCJzBeHskSR2/fbMbKDo7X28+X45xFt9TIPE26s/UvMD2FmJMJqqiqPoClbm3X
         zTPBnFQsX/iXxR8hJHInCQluIE/teQrwGPB2S3VuBuwOkXF56aufnBx5SLWWBwQzVqOd
         QMkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721664469; x=1722269269;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9OXBMV4qUioh74t9F5ySrsmXcQ3/BZ3r66GlJck4oz4=;
        b=Dpp2e9PqJ9nYdcN0m2UvhKjnyUit1lRGxMZ/z292n2e9qoqLF3gPZun+ArSCuIga2X
         F+RFrcVO1YeHKUnB38wjlwuZL2/oHAGRtrv/OxU0lJQO5zI4SLxUShINhlGOctSJ1cNk
         t/eFUDs92dLV8BsUr4BjoeaQn/KKBljmjbKtUbSv34Zpsf5/0KVTo2p5f0M4RH1YNImG
         a2lL2j9P/KZV0CvNIMnKCA6Vt4qXdRDF1c4SYxCjMd8Lkqrv5dHuUlopaMCuqyZml2Uw
         H7uCx1mEQM+1+UB0y5yAX+hRcrv0MgpccjvjhBiauVoMiOyRLsUw9NDK/C80cWDnFVfl
         k7vg==
X-Forwarded-Encrypted: i=1; AJvYcCWBX77fnA4pvu83+KomfWuiuXsJOXKX3Lal0eQJQ8lbTTPDXOIBLvcNzWZsdUxYY+HqFuUhPUQ/5okuPSOvPgDssQWcB71b
X-Gm-Message-State: AOJu0YxI9FHu4NvimEyp8u0Fn7ofHMfbZDcKWFEXL04zVFPo4dDOcklW
	xQuSFhfrCCutPyF3EGSKfaQD67Oh7+9ouvSpU9MgBotBMeLBOlYi0UPsrxQx1Z2acg==
X-Google-Smtp-Source: AGHT+IEEQOaEyC3ZGAb4KHeZ8onREs/k5/cfmjlsYZOkpswDb0x9vz5R37amm7ALKpaOtZ57CUFwGw==
X-Received: by 2002:a5d:4e45:0:b0:367:991f:4377 with SMTP id ffacd0b85a97d-369dee62a5cmr205724f8f.58.1721664468689;
        Mon, 22 Jul 2024 09:07:48 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from localhost.localdomain (gen92-h02-176-184-20-254.dsl.sta.abo.bbox.fr. [176.184.20.254])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-368787ebd50sm8868499f8f.93.2024.07.22.09.07.47
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 22 Jul 2024 09:07:48 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	Paolo Bonzini <pbonzini@redhat.com>,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Peter Maydell <peter.maydell@linaro.org>,
	qemu-arm@nongnu.org,
	Philippe =?unknown-8bit?q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v2 0/7] util/fifo8: Rework fifo8_pop_buf()
Date: Mon, 22 Jul 2024 18:07:38 +0200
Message-ID: <20240722160745.67904-1-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-TUID: nQ0mayz5moOq

Rename current fifo8_pop_buf() as fifo8_pop_constbuf()
and expose ESP's fifo8_pop_buf() which takes care of
wrapped FIFO buffer.

Supersedes: <20240719151628.46253-1-philmd@linaro.org>
  util/fifo8: Introduce fifo8_change_capacity()

Philippe Mathieu-Daudé (7):
  chardev/char-fe: Document returned value on error
  util/fifo8: Fix style
  util/fifo8: Use fifo8_reset() in fifo8_create()
  util/fifo8: Rename fifo8_peek_buf() -> fifo8_peek_constbuf()
  util/fifo8: Rename fifo8_pop_buf() -> fifo8_pop_constbuf()
  util/fifo8: Expose fifo8_pop_buf()
  util/fifo8: Introduce fifo8_discard()

 include/chardev/char-fe.h |  3 +++
 include/qemu/fifo8.h      | 50 ++++++++++++++++++++++++---------------
 chardev/msmouse.c         |  2 +-
 hw/char/goldfish_tty.c    |  4 ++--
 hw/net/allwinner_emac.c   |  2 +-
 hw/scsi/esp.c             | 38 ++++-------------------------
 ui/console-vc.c           |  2 +-
 ui/gtk.c                  |  2 +-
 util/fifo8.c              | 48 +++++++++++++++++++++++++++++++------
 9 files changed, 85 insertions(+), 66 deletions(-)

-- 
2.41.0
