Received: by 2002:a17:505:8d87:b0:1be9:327d:8ee3 with SMTP id ri7csp2498013njc;
        Tue, 23 Jul 2024 06:10:48 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCX46e5yimxThgXZRUXPqzEaFM2/EMker+qZIkK+dW2tAaXQ76h/89r/lD8oFvNNZdOhT/my6Nb2sHLbOOXV25vvFKkt3nzz
X-Google-Smtp-Source: AGHT+IH1WX5z+ZXM6KkO0q+E1PNM8nK3aw3r256XPWQEQ9nz5o9RFJXkQMUEZ7zwrszZDEHZsN2w
X-Received: by 2002:a05:6358:9997:b0:1aa:a27c:ae9e with SMTP id e5c5f4694b2df-1acc5c0de21mr1127129055d.19.1721740247863;
        Tue, 23 Jul 2024 06:10:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1721740247; cv=none;
        d=google.com; s=arc-20160816;
        b=fVEwlBGMAZx6i2ad/lm4+sUEo1XIDDp7OLX1wI0kZn8C/OPcuRHXcBR+byClE1xFC1
         x+b+KBe5/JBkvyAtV03GVQY9gT9JoGOM5FdLl0N/XPC2MVtPw1rWU20Ol2kzlWaAeT/O
         cH5W19XlEHMffNW6bmg4TWPpICfvimyWOAvsTKXhRGWnrAKuymTmiHeG0iFrb31sBdTm
         c73+ELZVGC0tRkEfRALuktzFvqx820cl/d4t5BustWr2V4i+1IUqe8/ndIaqPBF3fYOk
         VGNJ0qQdG8ceIugmMejpVRCYAefQ6VCdAbTj9uxomXGy68uZ81p4cryFPlqNNP3ORUnE
         6FmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=Z5Zr3Wsr3FjKw7bFm92VhN0gzyl3fccrt8w9hIA5ens=;
        fh=Y2hIghyObA32gLRCgGjrioRUL7/I7D9CftAQoPhmojM=;
        b=dXXoinv+cNLqA3csQ9n11HdICtGx/d46o7nXZQmdKPdE26eYI4NLI2/hB8wMRcmcGB
         FeYWNaMa5UPvW0vDJv7lQ4QC/ppVnO1ohYEZuKMDKZOD+MFJgPnCUtuel92O6bZXqOMS
         kqfZ4hb7yLwilSSbt1qC4PFXcnBNl3QE4fJoau5oDCtbr61ChsDf8Dj52qnvR8ZSQwto
         ZUzJs1G0Vd9g0MSKSoELDWmSvErxXJmnQIGRcuGzloWNdRY6moQy107QWMgUIFA2kkRh
         RBL8LxkWhPNX1l7of3FY4SJPbdTTqBhbR2/Wi2c7nGBnyejLWd4zzBwnAtSVJoO8e/nA
         Hskg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="a/f/G/3m";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ada2fe7eead31-4927935e065si1787978137.276.2024.07.23.06.10.47
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 23 Jul 2024 06:10:47 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="a/f/G/3m";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1sWFHr-0005yf-3a; Tue, 23 Jul 2024 09:10:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1sWFHp-0005xd-Fa
 for qemu-devel@nongnu.org; Tue, 23 Jul 2024 09:10:37 -0400
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1sWFHm-0000Hl-KI
 for qemu-devel@nongnu.org; Tue, 23 Jul 2024 09:10:36 -0400
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-4277a5ed48bso41277845e9.2
 for <qemu-devel@nongnu.org>; Tue, 23 Jul 2024 06:10:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1721740231; x=1722345031; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Z5Zr3Wsr3FjKw7bFm92VhN0gzyl3fccrt8w9hIA5ens=;
 b=a/f/G/3miHnLU8kHB8TsUTYla6upBgVB2+6lBMI/0qj4wNFFkp40/cX/UQWxhnLn0K
 EdYnmqp1AIf9lmTs3OwOUNPajkq2+F0Beu7DzR58wreV+R+9hpovrN6NIWPOZHx39tND
 Nf7az27SxTMfVjCDvQEmZt8t6kmLTe0bDsC+2mjFNQfPPaCeitUQ4t6Fr72VaKNQ8EBW
 BctMQo8lTb3LX1EFe8BZxHQIWFy3oiXTN2peTIl/pji9l+sW+5+8a8rjVszZBS0YbqFx
 c/HHsMv/8BfGiEwhQFNil8wynVynz3X1A0dw87ugpj6wCtbfcpKAgf8OjlFtFRcORin4
 GUjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721740231; x=1722345031;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Z5Zr3Wsr3FjKw7bFm92VhN0gzyl3fccrt8w9hIA5ens=;
 b=ByhUqdBOn6++/FtTE/qKm08EUFtiqCnQ3GTe5w7dLjvRmRaQRIcllxTtho76hiv3a2
 tdvwe84/qgumgVfJV1d3pjNPI7+ih+mOBiHrdJOemR7nADAv3SfvA3B4ddo/bYSnXQyg
 RsyyXj6ihYWWG9l/2F7PdRfotCHCKlhstJ7TgR64Nnt/EoMk+7g/jwjuyT208TXXJZBW
 uMLVt+p2fJ0rM82Kko8AccIaYr7CyfAhO0f0e72DL1P2VQupCcR4Yt/XhoRcaceCms7J
 S5GUdSF+vqaELXgz1wiCLlpZh7tSpUWoJ13EjOMqkfTA2wvXSHXGQEup6QIRYowvaf7J
 C0DA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUSW4FJmcXVirzf5NiYveyq1U5vwsc+4J4JUUa+RdsRlodOK089HID4yPlPvbHNah9GH72i6PlEsY1HElXBy8wMFWgcHYo=
X-Gm-Message-State: AOJu0YxvVctSlhKFGpUCNh8lvW8MVoCrPaglnJASFGGYNgqB4xHvxLl0
 JHWmH8xJRijDHb1lGJpxjC2MwOClmnyGevYcHFA0GsWoBSO3PgsluMzYt0QRBHw=
X-Received: by 2002:a05:600c:3b10:b0:426:5983:ed0a with SMTP id
 5b1f17b1804b1-427ed05ee7dmr19322955e9.30.1721740231282; 
 Tue, 23 Jul 2024 06:10:31 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-36878684773sm11560157f8f.7.2024.07.23.06.10.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Jul 2024 06:10:30 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-stable@nongnu.org
Subject: [PATCH 0/4] hw/misc/bcm2835_property: Fix set-palette,
 OTP-access properties
Date: Tue, 23 Jul 2024 14:10:25 +0100
Message-Id: <20240723131029.1159908-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
X-TUID: P3drSIgLY6iA

Coverity pointed out a problem in the bcm2835_property handling of
the OTP access properties, where a mixup between uint32_t and int
meant that the guest could hand us a very large unsigned value
that we would end up treating as a negative number. In the course
of fixing that I noticed that we also don't handle the set-palette
property correctly. This series:
 * fixes set-palette (enforcing the range restrictions on the
   inputs from the guest and getting the loop termination condition
   correct)
 * uses uint32_t rather than int for the loop variable in the
   OTP access properties to avoid the overflow problem
 * cleans up the code by making various variables have only the
   scope they need rather than being declared once at the top of
   this 400 line function

Only patches 1 and 2 are strictly bugfixes (and cc'd to stable); patches
3 and 4 are small and safe but don't really need to be backported.

thanks
-- PMM

Peter Maydell (4):
  hw/misc/bcm2835_property: Fix handling of FRAMEBUFFER_SET_PALETTE
  hw/misc/bcm2835_property: Avoid overflow in OTP access properties
  hw/misc/bcm2835_property: Restrict scope of start_num, number, otp_row
  hw/misc/bcm2835_property: Reduce scope of variables in mbox push
    function

 hw/misc/bcm2835_property.c | 91 +++++++++++++++++++++-----------------
 1 file changed, 50 insertions(+), 41 deletions(-)

-- 
2.34.1

