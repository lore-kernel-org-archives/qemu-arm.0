Received: by 10.223.159.74 with SMTP id f10csp2924140wrg;
        Mon, 18 Dec 2017 09:39:55 -0800 (PST)
X-Google-Smtp-Source: ACJfBotF7UpfI997TIbKE3i6knhUbLYrJ8z99fW1nVpS8c+ZCV2FFyYfMiIptobE+7wT0e2R4t66
X-Received: by 10.37.125.135 with SMTP id y129mr454469ybc.256.1513618795531;
        Mon, 18 Dec 2017 09:39:55 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1513618795; cv=none;
        d=google.com; s=arc-20160816;
        b=0O7sgKidhOp1DumnEIzgRZ+mYoWomdR5/pZG4c+g5q2RlTzGRfsGUcbg1SLahEQ2Qr
         /w/G6t2Kcp6yq43zn9l9aI0ZPYHr8mb/Ev6VMtLAhFWVUKAjb19OK55BIsoBdm8TDQZy
         Zfkr6jPiU7obFLhaGMSh5166WfYpCVu7hvlbPd4IyFd95pA+Nv7RVovARmpEdf95XqYe
         5Md6hUxL+x12fILU3CzIKy0YN4jttSfeYvFdEqYad4LEWrH47WHSGQ7iWw3T4xI+A1uV
         MFYnasKguQrYAZuxX0VcskDcEO+C7b5cUANL4CRH162kXGRYF3ukplU+PpzSyYooExyP
         vhxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:message-id:date:to:from
         :dkim-signature:arc-authentication-results;
        bh=Wft3Rhn6e8gEnRrhkRoDem+GiKJKRuyOOHVSH/yZqg8=;
        b=RTP9h4mmLu63QVTowQRafBNWhPkUIURGtkUQlLlCM4ryNUnpghtNhdC9oLkBRXFRXK
         o97RPxlXX0pDdG1LOocdlFUQf647pBU6jpKq/PxIarBR7ViAwesP7f1UtPPc8UcUbdk9
         DnG+wf9rE3T87dsLY96NqHQ8qo8xavAYk/oXE3QgI0Fvb+ZIGcfy1QC9nOCEHQOM6Ilu
         B4EQ7sdIidtKD85iE3c55rBc9VhYyTlOjs1NWmQvBN5CNx2npbcK10whYEPt1DTINr+t
         uD2QvGIelAu9tc5ku8szJSMsy8o1iUNz1lAEnwayTUWNeN0pJizEKghEqyppCgm62erm
         at1g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=fvSNBQCS;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id z12si2537298ybj.57.2017.12.18.09.39.55
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 18 Dec 2017 09:39:55 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=fvSNBQCS;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:58918 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eQzON-0001tP-1D
	for alex.bennee@linaro.org; Mon, 18 Dec 2017 12:39:55 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40848)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1eQz9R-0005nE-Gy
	for qemu-arm@nongnu.org; Mon, 18 Dec 2017 12:24:30 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1eQz9Q-0007z3-IK
	for qemu-arm@nongnu.org; Mon, 18 Dec 2017 12:24:29 -0500
Received: from mail-pf0-x233.google.com ([2607:f8b0:400e:c00::233]:45598)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1eQz9Q-0007y6-Be
	for qemu-arm@nongnu.org; Mon, 18 Dec 2017 12:24:28 -0500
Received: by mail-pf0-x233.google.com with SMTP id u19so9926568pfa.12
	for <qemu-arm@nongnu.org>; Mon, 18 Dec 2017 09:24:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=Wft3Rhn6e8gEnRrhkRoDem+GiKJKRuyOOHVSH/yZqg8=;
	b=fvSNBQCSSzrmbBmiMIo50DChgqKHyq800OsSAQD0bxYE/en6qs1Xq0qVPicQc58Pwu
	esW2NvZ1GbqXEPbFezfJIWlKsdjw+QgfLw1OYCr6NMkW+N1Wf7GGzLO+VKtirBlFD7o+
	/xlkeciL7+1ID1nBjcA3eS6pdw6aOU+g84XRo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=Wft3Rhn6e8gEnRrhkRoDem+GiKJKRuyOOHVSH/yZqg8=;
	b=CgKMAKCoBIb13nCctyT5Of2vQBYFOpbWTrcx13gsoYZvCngKNkxQiGgxvMI4M1+Cse
	O0B6L6wtaUi49ae8tf5btk9Kyo2nO8xqAzOUfBfB/f7mWAbjFsx0jmthph8ajci5JbH6
	UgWyGqxRXAHC2YWUyMlYDQTlW1vFjvcuxhK5n5Og/zY/y7feJAYubb/y3FGp8NyfTc70
	p8V9SZMnX5lYnSRUlZi9qNtEPHl3O8BxyN7bV22ciois0KI6qZR0c6I2xqerEJyfbApN
	yk2/jzM95wq7+sFM2E+81sMOJ+71X5YIruIGx4ih+W9b+lxQtI1Y/g9Mh+5/p3sh7/Ev
	EwcQ==
X-Gm-Message-State: AKGB3mL5OGjG7Z1E0s8+Ih8O5L6Oq8yQgON6bqcpHlG9UiFjqRDrLGOr
	Zy9zdajd08OkJJEOTw3i0HvQpw==
X-Received: by 10.98.138.17 with SMTP id y17mr433655pfd.122.1513617867251;
	Mon, 18 Dec 2017 09:24:27 -0800 (PST)
Received: from cloudburst.twiddle.net (174-21-7-63.tukw.qwest.net.
	[174.21.7.63])
	by smtp.gmail.com with ESMTPSA id m10sm9260469pgs.4.2017.12.18.09.24.25
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 18 Dec 2017 09:24:26 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Date: Mon, 18 Dec 2017 09:24:14 -0800
Message-Id: <20171218172425.18200-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.14.3
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c00::233
Subject: [Qemu-arm] [PATCH v2 00/11] ARM v8.1 simd + v8.3 complex insns
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: mRIh88cJHiLL

I've incorporated Alex's feedback from v1, and have now rebased
upon Alex's work so that the complex insns now support fp16.


r~


Richard Henderson (11):
  target/arm: Add ARM_FEATURE_V8_1_SIMD
  target/arm: Decode aa64 armv8.1 scalar three same extra
  target/arm: Decode aa64 armv8.1 three same extra
  target/arm: Decode aa64 armv8.1 scalar/vector x indexed element
  target/arm: Decode aa32 armv8.1 three same
  target/arm: Decode aa32 armv8.1 two reg and a scalar
  target/arm: Add ARM_FEATURE_V8_FCMA
  target/arm: Decode aa64 armv8.3 fcadd
  target/arm: Decode aa64 armv8.3 fcmla
  target/arm: Decode aa32 armv8.3 3-same
  target/arm: Decode aa32 armv8.3 2-reg-index

 target/arm/cpu.h            |   2 +
 target/arm/helper.h         |  31 ++++
 linux-user/elfload.c        |  10 ++
 target/arm/advsimd_helper.c | 420 ++++++++++++++++++++++++++++++++++++++++++++
 target/arm/cpu.c            |   2 +
 target/arm/cpu64.c          |   2 +
 target/arm/translate-a64.c  | 382 ++++++++++++++++++++++++++++++++++++----
 target/arm/translate.c      | 239 ++++++++++++++++++++++---
 target/arm/Makefile.objs    |   2 +-
 9 files changed, 1032 insertions(+), 58 deletions(-)
 create mode 100644 target/arm/advsimd_helper.c

-- 
2.14.3

