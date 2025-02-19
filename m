Received: by 2002:a17:504:f96:b0:1be9:327d:8ee3 with SMTP id oa22csp1627713njb;
        Wed, 19 Feb 2025 13:08:44 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWQupCs6XzOAlpSJYBzt4/ttg9w5MOpH4D8YGgzT/KrghV0V+Qs6lUiA345HJNLtRUaURW+/mQyMzTmTg==@linaro.org
X-Received: by 2002:a05:600c:c19:b0:439:884c:96ae with SMTP id 5b1f17b1804b1-439884c9afdmr103186655e9.27.1739999324213;
        Wed, 19 Feb 2025 13:08:44 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1739999324; cv=none;
        d=google.com; s=arc-20240605;
        b=lZI8zB6XYLhn6Ouc3w/sxyOLf0YbXHLsgWCIXxQx+lTNcCWyqGrb6KR28+KjO2mTgN
         d/GTsffP1ICFcjanvoNvYIQKToEvbbwLa01bkaF/KvphrIzSddOnvMXyxKVoDmWOwR4Y
         8N9Ex775+zoZqN5JofpppM47z+jKScfy2N3zls769znMGOJK5TJcXFFH2UAX4VE1Z51N
         kfPjZW15MLwmW5Zs+8MT7bAFU+iDf5IYLjeDWBFi2tK8FFrhtk5UosDjn8+xYITyDyLP
         wpiUCYCmm2npTy4irT9Ffqygux1tpzM2Wz6SsEOVlaUcphtm9woOhCqs+YXUXt6ck+ff
         d6nA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:dkim-signature;
        bh=jwfRzD6O0YD7j2pvGbQ4kMoFWL7J1bU250ClTlckFJs=;
        fh=Wqw7bnJ7XZhA97SSC0qGpjUL9ExYwOY3MAY/XzIcrKI=;
        b=kGklx572Pd2hHGZqIkN7pxb2Cuo/U0kI5YLtt+jx0n29Y096d/216GPdO2tpSp0bcO
         rakCTylamWEDVJfVH3WZh2ePCwxelPCM+Q8ijsRcEO+kHvk9yYQ68Yq3yUyfkmjmKOhC
         uRR7xCGnHlonxc3NCh+k1s/Ug3zWJGMHcINuZK1vqJqHOCm9azRmPDCXUrzn95hlG0Q7
         UtfrtPIh/weEw3YkSzy4qF42KT1zZZ4B0xgss36PlnZ8ICEBznUga2q4yZ1pbmZkaVLP
         KhZmQu12iWpPUeO/+nB6kzbmdRHW6QIhjFOPN77LzYJA82rz/g2AnljyDJam9An2hGGH
         mt0w==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=OeNIwtx7;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 5b1f17b1804b1-439815aded1sor27813905e9.5.2025.02.19.13.08.44
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 19 Feb 2025 13:08:44 -0800 (PST)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=OeNIwtx7;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739999324; x=1740604124; darn=linaro.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=jwfRzD6O0YD7j2pvGbQ4kMoFWL7J1bU250ClTlckFJs=;
        b=OeNIwtx7H7cqX2TRTPPhAzp7JF0CaOgs6tciyefksslIpi5A9sYj900WG69CysObbJ
         oq7Zbjzz7kBUAEOZVN9UcMxCU2Z+q5GDe4JKzEYF+uE4GztxArriYx+QZsJoqHoFcC6g
         9AvBZZJvZfgf7fOThEOurfL2FnK4jdlAr4cU7YOTfqFwfCygaA2FF0rgI28kKcbGjsCR
         vCzoPw6AWotSQuHSuNLXTyH+ieURCde97pCAg27XNPTaI7pjZ6D1CvvMp1CuPqzQRWXH
         DSs7sr7BJyUov5iLIVNZrd2XnF+/KR12Oe+ub0Yc2WZ2sFaTSkXovsVyv51EC7CGxrU/
         HN+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739999324; x=1740604124;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jwfRzD6O0YD7j2pvGbQ4kMoFWL7J1bU250ClTlckFJs=;
        b=czGS6rYeMKqkv5sJgXZrN67IbliJmztaA4U92Og4VyTdweR9qUjdUblKm40q/4yuZB
         RUEDMIMuvnfEsPQJYXh+Ymkk82lrti0xxbvnyIomRib1oAGqkPq2SvUF5pKCrvr/Z/A+
         ElbI/6fkMfB6JK9LN8h4sup2ycWPyRrsIx5Ut6ERdClgmai3cw/WjSbhyx4NrrlyWQUh
         rMyHabUGcvt+9TcnRmizekKwYnfJZGID/k8ZGoaZWhBzJleRhGW0pWIWSvGUjGmkdXDb
         U0OsJSec9CGRgHxZN/W9IYeuSNDkCCw5f5TNVnZ9XUH2SM/ojPC8zZfMlcqe6icOw9Ka
         TmRw==
X-Forwarded-Encrypted: i=1; AJvYcCWnzZy3vNwikXULjMS6G4O7nlQo8WWWmcPbYuJtIwCd9newtP8059s4EWhKsOtFz8frbutQy4snWqqihQ==@linaro.org
X-Gm-Message-State: AOJu0YyMOy1lSOLRN7RKPskqbOq5/iA8ij9VRIWJfmf7cfk/MS3USWIX
	klhHbehIXWCipRw/+BRFI8RIpufYras68xCndeidSxtyIucvtB1ZIZ1LmSCp73dYJA==
X-Gm-Gg: ASbGncsnzVaXkyNeWxYcNLot9ibyc/7QD2txEzpHu1y4paY82o2IMSZLoqeFgNe+Hzu
	x6wcasteCa+w18hGQZjwIyzr1RF8hpKzFpnghB92pgrb3u2NREBV3CTQ6p4k/M/0cCAVkc+jDKr
	OuL7beCI17D3XyTs9DDEdjPZ+uFV3ku1v969SJ0Fnh02Pmh88dNisupnfF7cgM3da7kBYgRS17g
	yKDFLN4vC+g1yiyGC/uZJlctui/8Cy8HizFUP1tfdz+LQH7MC+1EeqbMMgBDsY0CtRL04AgtTeE
	g9DYpr2LWCIcdC5FdG42PMRW/QbZ/q2hTkfjTTPN7LhumIkFZ9SZOqKSXNv7IFkPow==
X-Google-Smtp-Source: AGHT+IHduT0jWPJt3zNktPcWix1/Gcy05r8JAStrmmJCQqNFsZzmjva+oAwjfboNVKcjEzXFxBoaNw==
X-Received: by 2002:a05:600c:444e:b0:439:9f42:8652 with SMTP id 5b1f17b1804b1-4399f428858mr26436395e9.17.1739999323712;
        Wed, 19 Feb 2025 13:08:43 -0800 (PST)
Return-Path: <philmd@linaro.org>
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net. [88.187.86.199])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-439872b59e9sm90926805e9.31.2025.02.19.13.08.42
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 19 Feb 2025 13:08:43 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	qemu-devel@nongnu.org
Cc: Evgeny Iakovlev <eiakovlev@linux.microsoft.com>,
	Rayhan Faizel <rayhan.faizel@gmail.com>,
	Luc Michel <luc.michel@amd.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Yoshinori Sato <ysato@users.sourceforge.jp>,
	Magnus Damm <magnus.damm@gmail.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Thomas Huth <huth@tuxfamily.org>,
	Shin'ichiro Kawasaki <shinichiro.kawasaki@wdc.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	qemu-arm@nongnu.org
Subject: [PATCH 0/9] hw/char: Improve RX FIFO depth uses
Date: Wed, 19 Feb 2025 22:08:32 +0100
Message-ID: <20250219210841.94797-1-philmd@linaro.org>
X-Mailer: git-send-email 2.47.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-TUID: JOjthTnuCJmf

Some UART devices implement a RX FIFO but their code
(via IOCanReadHandler) only return a size of 1 element,
while we can receive more chars.

This series takes advantage of the full depth.

Inspired by pm215 chat comment on yesterday's community
meeting on the PL011 Rust implementation description by
Paolo :)

Philippe Mathieu-Daudé (9):
  hw/char/pl011: Warn when using disabled receiver
  hw/char/pl011: Simplify a bit pl011_can_receive()
  hw/char/pl011: Improve RX flow tracing events
  hw/char/pl011: Really use RX FIFO depth
  hw/char/bcm2835_aux: Really use RX FIFO depth
  hw/char/imx_serial: Really use RX FIFO depth
  hw/char/mcf_uart: Use FIFO_DEPTH definition instead of magic values
  hw/char/mcf_uart: Really use RX FIFO depth
  hw/char/sh_serial: Return correct number of empty RX FIFO elements

 hw/char/bcm2835_aux.c |  6 ++++--
 hw/char/imx_serial.c  |  8 ++++++--
 hw/char/mcf_uart.c    | 16 +++++++++++-----
 hw/char/pl011.c       | 28 ++++++++++++++++++++--------
 hw/char/sh_serial.c   | 30 ++++++++++++++----------------
 hw/char/trace-events  |  7 ++++---
 6 files changed, 59 insertions(+), 36 deletions(-)

-- 
2.47.1
