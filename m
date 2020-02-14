Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp2308913lfp;
        Fri, 14 Feb 2020 11:47:02 -0800 (PST)
X-Google-Smtp-Source: APXvYqyT7TY8XsuY/AbJawc5i9m4x/unaNS9QYPVIlstGAfv0+8RrAfl9lylf9mO4uH1fxWMW5sx
X-Received: by 2002:ac8:1205:: with SMTP id x5mr3896525qti.238.1581709622638;
        Fri, 14 Feb 2020 11:47:02 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1581709622; cv=none;
        d=google.com; s=arc-20160816;
        b=mSBGm+0X5iHxgcAuMQfG4uPwEN1zbh8nH58UiTR2q2tMa23wv9nHYTPFgUPf3sKJx8
         P1qzA3OPy1rlTsjd9OB6j4LD4+KLEUg/RmWD59siVSSyahOOnJUFwNCDtnuFvmkX51Xf
         +eYIeRw3yQ432wP95mRzogV5p+kBJLLRI0weGDHFRqIGkNFVWw5nKKIu2IAP2YRXVFt7
         y9K6I2xZKi1UpBVjKR9anQ1FQrALmvXlxlCRmd5TCkHdHeI3bdGiV1zUkpylS9r9YL/4
         QP/wFZIrQ5apBeDHM3jUejhHcInB0WL8stBgZPB4yPn1uI8SSpXKGoeJCoQMMWcnn1EI
         oJHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from:dkim-signature;
        bh=F7PHyP31BJs5fHuan+iMwqGlPcnh0NKkrTwQ9fASbuU=;
        b=QlGC+/WjO/b0kbmESkZ5LkkmdY7xAJMWKdJnO3N1eYSiUXO6dGXM6KShwVvi5HuqYB
         ktuZbIHs+x7gozo2bbQA3f8WYC/PovcTSJpurFJp8zsAhnTAsvwtIeGCzQvIhtU9BpSu
         DtkUXWSE2YakCo9bmGHO7Kvmg7tlIRnRIuJr+5SA0pbRmttMlhmw6et3HUXvYDlmiM8t
         tL8DbbXOSAscMCgaGpq8nPX9B8UUsANQxZrPzerXEFU/pAF8LdMZwBv0hgH197LxUKTY
         IYA4ulAMh1nj6kgJYQbVxr/ZxCLMnZxPyyR+8Pj1ErYXEPXWeGj+YFx5OP4n6XGOe/18
         622Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=nct+iqYY;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a15si2731744qvf.158.2020.02.14.11.47.02
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 14 Feb 2020 11:47:02 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=nct+iqYY;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:44808 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1j2gvW-00031v-0Q
	for alex.bennee@linaro.org; Fri, 14 Feb 2020 14:47:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49024)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1j2gvH-00030m-UZ
 for qemu-arm@nongnu.org; Fri, 14 Feb 2020 14:46:48 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1j2gvG-0003Uy-SP
 for qemu-arm@nongnu.org; Fri, 14 Feb 2020 14:46:47 -0500
Received: from mail-pg1-x532.google.com ([2607:f8b0:4864:20::532]:44412)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1j2gvG-0003Sv-LC
 for qemu-arm@nongnu.org; Fri, 14 Feb 2020 14:46:46 -0500
Received: by mail-pg1-x532.google.com with SMTP id g3so5317469pgs.11
 for <qemu-arm@nongnu.org>; Fri, 14 Feb 2020 11:46:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=F7PHyP31BJs5fHuan+iMwqGlPcnh0NKkrTwQ9fASbuU=;
 b=nct+iqYYybKOjPGrvujzL4V1MLUDp+0z3pL+r92Uq1FjHCPbHo9OYjEl1uvT1+Fjaz
 XC9ahjioG5E4c9ACML2ccVKXP32ixwwNf4uYPLDVnv3SsMGbZH1BS+VypEKGhsruP+Vr
 4Y1BP6HTH7BQPXhVwgX6+0CnQqYQGd91Q+EA1SKFIu2xqBGlJ9fNqgMjG1745ZBqV4fC
 D7+0cTAlkE9zI8Lg1WPh4ySm4i/JAYVQt5XazR0W5qD6uE/Gy/bfLPFUecuGcu1Q4ri8
 Lg+E5vxNCRAklgqRop24Fom6+8LFPbN3XTWvqu44GjzoeyGioYkSmaevQa5Vc8uF0Br9
 zeHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=F7PHyP31BJs5fHuan+iMwqGlPcnh0NKkrTwQ9fASbuU=;
 b=ePBS815aYmJfJ3CSHEpkW2TlqTetrCIkgG665pPwLWyYHf3draV8kM7DRe4Dtcluuf
 5j2hVUTf5dR2E1G4nor6RzYDZvhRKhVfz5wDOz1itUWcGhAmEGFEHCunvekpt+oGLE6X
 yVD5Yu43Tich+wlotHjeNpZZr3qQEjh277UaWwFEYGZBugJSQuPuhliWn0eiaJd+JIgF
 p2d8xppRq6KXleSE1Ayn9H5Uzx+Dd4dTmU8QTwpW+4Zp0hsYOyxq+a6ClM75XpBLFWTZ
 znEXxPZEs5ltZtUmkns3mItflqo9Lz8rGfkPKE29y2Djpf9iA7u1xj/uYZDl9dV7CL1X
 ISqw==
X-Gm-Message-State: APjAAAXdWnwTOhHtQ+EY/lJXnyUYj1gniZXaP6Q0xwKjq0mJQByohbrV
 0toM3MLlR/028/7bQ01t83AMCA==
X-Received: by 2002:aa7:864b:: with SMTP id a11mr5032655pfo.175.1581709605439; 
 Fri, 14 Feb 2020 11:46:45 -0800 (PST)
Received: from localhost.localdomain (97-126-123-70.tukw.qwest.net.
 [97.126.123.70])
 by smtp.gmail.com with ESMTPSA id g13sm7558851pfo.169.2020.02.14.11.46.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 Feb 2020 11:46:44 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/4] target/arm: fix some simd writes vs sve
Date: Fri, 14 Feb 2020 11:46:39 -0800
Message-Id: <20200214194643.23317-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::532
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: q1ilaXOo0AqO

The launchpad bug only mentions EXT, but I found three more
via inspection.  I really should extend RISU so that we can
do AdvSIMD testing with SVE enabled...


r~


Richard Henderson (4):
  target/arm: Flush high bits of sve register after AdvSIMD EXT
  target/arm: Flush high bits of sve register after AdvSIMD TBL/TBX
  target/arm: Flush high bits of sve register after AdvSIMD ZIP/UZP/TRN
  target/arm: Flush high bits of sve register after AdvSIMD INS

 target/arm/translate-a64.c | 9 +++++++++
 1 file changed, 9 insertions(+)

-- 
2.20.1

