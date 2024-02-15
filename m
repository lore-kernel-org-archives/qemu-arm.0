Received: by 2002:a17:906:d9da:b0:a3d:1c09:7d3d with SMTP id qk26csp734585ejb;
        Thu, 15 Feb 2024 09:58:15 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWaDC3+SCHu+XcO/YUEYEfmyvkPseAV3gSveIpJc08hNmi8JL7j/EB0d4OTlfSuBFhOOMhSUwB+ksjp/tjHzU799AQrYAwm
X-Received: by 2002:a5d:49d1:0:b0:33c:e2d9:ad36 with SMTP id t17-20020a5d49d1000000b0033ce2d9ad36mr1966868wrs.20.1708019895362;
        Thu, 15 Feb 2024 09:58:15 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1708019895; cv=none;
        d=google.com; s=arc-20160816;
        b=joz0EMzuuWEVVMnA0sJGoQODCfJfrUaX1SEhGSBHb0eUvAenYKNcCpJd9oU2ALw2wE
         8OnPtHoXn8vOk7PZN7vjzJnRGYXdJ5qAgVsY2ItBRrSQ2u7GX1fvHdfCd7DKAbFTqpcm
         ulsRQLtC+4bQ/pZnUhmrDQHUsgLFU+RF+8aMaL9UWQ+VsbVzVkQgxtcw2YFBpvPemQ7k
         H4vsd0thvWuddq73qXayTGOK00T9HFNfYsbT3e6hexO/pd7nOWyJgzE6VPay5YYygJMJ
         zfq5bKqbd3I2LG2UQ1DOscHLSRjlxgqLNH2sTdMnNJxpB4Dc/4ImyHh60AZRBWMRhnIX
         HRXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=Agls286qrzGsJ1hJI9sraTA4L0NishS8JrZlDzd0umA=;
        fh=SQdxOtn1bIrw5OQzpMkOCDcmUlkJSuuBuCjKYSjLc8I=;
        b=DeNK9+iUIhg3NYRRQzQKxWt+NxPnovTtvHT7ZlcT5H+IhV1qCEi8VLMO1nAF3z9xKD
         1+VNgXpitodEtjoAgpJ3stlmku99zzlSvb7HdP4vjeiNO7GwMiB4ESaj26rdTfiMzdmu
         keSCmzMmPwdrOb/ialCMGnDgMfAsrkzjnWV0agBmv7vAAw8gY20UGoQNrB1vESbEvOhO
         KgNvQij0Pf+NkLCgWTU0csBOYiXEvuc4+1bh/r7G3h0IV0CNYMkDe+G1LbVP3B0UMRsA
         DFi0pZDIzpTw5CvApxBEYUraAmw400w8ukzE+Q5QuzMNblg0HG3mxTRJCWfDcuKSIhUK
         QohA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=z5FAOXrk;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id q2-20020adfab02000000b0033b1815cc92sor577430wrc.7.2024.02.15.09.58.15
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 15 Feb 2024 09:58:15 -0800 (PST)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=z5FAOXrk;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708019895; x=1708624695; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Agls286qrzGsJ1hJI9sraTA4L0NishS8JrZlDzd0umA=;
        b=z5FAOXrkH0CBJTngLCreC2ErWHytUnUuv3Tc+HWuubLrNNZ2rJnQj+1Etab9l0/aTf
         c13h8e3jD8LZ29vXhBg00kZM45AFDaICLhC6OxUHa4lZPwesQ8IiHArdthNlJOXonV1Q
         D0rYOW96crL+FT0lulfD2YdD4AkLU9uvwwcBVcqiEm0oDlttceJYGEN4YDZUlBVtDw8A
         uc31rvR4IgtdA74SC1UGuEhEtGCGEBsZvsOPcFo0cb40Xschlx4i3SJsMnjfSxya/Zu1
         SfFVI12ThEpBdP6dOogIRHvZ4jXlWv3rXWQysJzhNAlMeg8VkU4KwI6vgukYFpzvITyh
         w96w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708019895; x=1708624695;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Agls286qrzGsJ1hJI9sraTA4L0NishS8JrZlDzd0umA=;
        b=vOMogI/Daz6av9Bj/ejThgONcXHFDL4L/m2rFsLXYQwd0zyC+hptUCqZC8p9kslUPe
         QUpqFyjK2OXF3i3y7MhL6JYaegs974+q2BGuVvcyGw8p6fLemmYHiEK1y7gDebT1Htjt
         jbDHWZPoFlYpoebPCmT8f2NrmC1FelM6WNgZ8BLL3zoQQ/+/3SjpOfnF/+rRzlcw3eBC
         zwnINS67kt95VpQOUCUlpo4VTHiwyBejbdA7T5twXUdwis64Ypm0E3p85KYLvAtsU1Da
         ybhEZMCdgkgGrq3EufNiIZmx7mDq5RF6OZ0ZTR8MNg1ZzfK370PZDloa0uAg9rauwP8g
         3ruA==
X-Forwarded-Encrypted: i=1; AJvYcCVlvyV/Pnb4LUbKjH1eHXGaDEfhxpUIs/o05scBx1aU4Q1JlpSuZzdLkihqFM34a/q5sVeJ1Oe09rpe2c2M84x3UfVSX6Rs
X-Gm-Message-State: AOJu0YzDTWOAzWRWzXiquMkYEAqxPH14mGr1yhV+91xtClUNEgIAJKmk
	/mMU4BjVdQIsDwDWvonJmRfSfkIpp7Kqn2LtDjy8bOm4GBTS4cQUKHGm/HknygF7qg==
X-Google-Smtp-Source: AGHT+IFNb/9ECMbxAKPLendWbsSb67EYu/O9JmvIMn90J/gls0XaRrtaHbhgHzJAHcAnR8YpyYNNmg==
X-Received: by 2002:adf:a446:0:b0:33d:4e5:b1f2 with SMTP id e6-20020adfa446000000b0033d04e5b1f2mr1479996wra.38.1708019895026;
        Thu, 15 Feb 2024 09:58:15 -0800 (PST)
Return-Path: <philmd@linaro.org>
Received: from m1x-phil.lan ([176.187.193.50])
        by smtp.gmail.com with ESMTPSA id ci3-20020a5d5d83000000b0033d10bd6612sm1315244wrb.81.2024.02.15.09.58.13
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 15 Feb 2024 09:58:14 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org,
	qemu-arm@nongnu.org,
	qemu-block@nongnu.org,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Aurelien Jarno <aurelien@aurel32.net>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>
Subject: [PULL 03/56] target/mips: Use qemu_irq typedef for CPUMIPSState::irq member
Date: Thu, 15 Feb 2024 18:56:57 +0100
Message-ID: <20240215175752.82828-4-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240215175752.82828-1-philmd@linaro.org>
References: <20240215175752.82828-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: Y6q61JVXL2mG

Missed during commit d537cf6c86 ("Unify IRQ handling")
when qemu_irq typedef was introduced for IRQState.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20240130111111.6372-1-philmd@linaro.org>
---
 target/mips/cpu.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/mips/cpu.h b/target/mips/cpu.h
index ef26fe03c7..b4788e1af2 100644
--- a/target/mips/cpu.h
+++ b/target/mips/cpu.h
@@ -1183,7 +1183,7 @@ typedef struct CPUArchState {
     CPUMIPSMVPContext *mvp;
 #if !defined(CONFIG_USER_ONLY)
     CPUMIPSTLBContext *tlb;
-    void *irq[8];
+    qemu_irq irq[8];
     struct MIPSITUState *itu;
     MemoryRegion *itc_tag; /* ITC Configuration Tags */
 
-- 
2.41.0
