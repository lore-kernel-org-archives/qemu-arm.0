Received: by 2002:a19:f807:0:0:0:0:0 with SMTP id a7csp1856690lff;
        Fri, 18 Jun 2021 12:29:55 -0700 (PDT)
X-Received: by 2002:a17:902:868d:b029:11e:6556:acea with SMTP id g13-20020a170902868db029011e6556aceamr6075575plo.59.1624044595052;
        Fri, 18 Jun 2021 12:29:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1624044595; cv=none;
        d=google.com; s=arc-20160816;
        b=hPnEerRJtojwC+Zy4EFJEsKDqrIcuueluy7ndkydC6nDoQHfI5SETMQ6RPr2fdlgQ4
         T522stW+ygRgWtVGOavgfFymfAScSP5fDpyDii9zb0mWZlKfnZ9PJhT+VyuYw0tSFeAs
         SljSXoPG0Bp4dJhC3kRIBY2aK/QM1jzubTBR30rbWT6CqCvqtW6iHTUL2c8uSjozILyD
         v9FRdbEMvtvE4RJbT+P8kyJXDOI7kVjpKK9r7gI0N0mi7MIOY0ZmvWCX+3v3HXiG3AEz
         xfvrYpuLZjTxulFDtSSx0E/9okY1semXRm4PoXkxidfIcb7irIs0vAQH3AlnqVhiGXr9
         JJ8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=xc89iOQ6Z9A7jmI+2EVW1gXxkL96LTZi3hKVzfLFP0A=;
        b=OS/wwBTnvenOTmEYgcqx/3c1nXB+PNc4BT3cw9aD5FGYdVS7hpE7K2c2cz6J3KKvkZ
         ryFlPINWTrTbFZr1ltWblsV5Fa3VYXE786cE3MRnrYjrR1Ty3rW5/7J6cW0ZsevRO9+3
         wweIt70IqoSGjQnf5oNIW3eARAgpAta2DKLJvk5zKDgcRT96CvS7A8DoBFaV2la5OD8R
         HQ1EDbOcjpW4t7ECJ2RvaHGbp0y173w3VFewpPW2DqZCkTmfLwbOyNrYj1d1ao+3dwfd
         KbmY4a2tr243av89qQWD/Aq1AEXuyFiSEbcCrN0OhZuAWtdblI/Du2GtgIgz/sbTVaJQ
         Fubg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=PmixQGL2;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id ml15sor2119249pjb.42.2021.06.18.12.29.54
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 18 Jun 2021 12:29:55 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=PmixQGL2;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=xc89iOQ6Z9A7jmI+2EVW1gXxkL96LTZi3hKVzfLFP0A=;
        b=PmixQGL27Pxfz3A6w5dAYzho9T5gEWLniESYkDMaxFolfWLUDVGboa5mn0NuCZBSk7
         yYhM+Cf08JMP+4SqQdyLIoqERrYSENEZYmpPZDAMcAeFp6Ca2WJPpe6GT+xtlIjXGBx5
         bIeAKiQPIiEFSjfLpilGpc7SrBe7lz/Wn9stiQrdVXHaC1J5uXrtlVLzmdWf6fQ3MPov
         y40gKs2IZovY93iqFEzxLJk4fnY17Fr5AfPK6tVkjeE2Ns7QET4MlZjFjSPnWYGQ4H+T
         f7Vopma8RPtaFxuuDMJuwWHTQDlW6sczI2UJ0A5jOobZ90r+fMdfF8A/rWC59IQ9y/iB
         kt7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=xc89iOQ6Z9A7jmI+2EVW1gXxkL96LTZi3hKVzfLFP0A=;
        b=TOiBvlPI1QFO8vwkLI2VIKnGG6EADTD+YCngzZUnq04CluveJ0pTdVzLycZvJ5YnMK
         s+IsWopmBS1nnz5jje2XQPH6UWR1UxRTSDOzIB/H+v4Kf7kLfH2C3FWlS1rjdYU5P84g
         rgCNbx0IX08gDJorlXy1U9zv2loROKOhFeGV/+vf06E+P7fDK9wWHx9Mx52he9aTQWo2
         wAVxWHqSAIv8A3NTnq/WNzXQ1K4FsaB9C/q2H63Nn+wCdvhyM3XDt0hh6Q43p6rM7BMB
         /sdTaJSvP7kXIeziRSOdvr8HVFYhzfsap8tA08YSDV/0NcPAByI9MIed9SyHeTt/t3+v
         B9CQ==
X-Gm-Message-State: AOAM530MzZv7qXUITDMkp+Poae9cO2BfZTEPScpQRq0XvRXVKhg7y3cf
	u8klAbcPIQsFQwo3R2UugW8Ppi0H
X-Google-Smtp-Source: ABdhPJwzgCU0eb6qiL8x/wJBYfMVU6g/VQDpTlJlJ5hGV576UARtXC55f079tApajlq1uPHU0h99FA==
X-Received: by 2002:a17:90b:1bc6:: with SMTP id oa6mr6085300pjb.36.1624044594623;
        Fri, 18 Jun 2021 12:29:54 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from localhost.localdomain ([71.212.149.176])
        by smtp.gmail.com with ESMTPSA id 92sm11938234pjv.29.2021.06.18.12.29.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Jun 2021 12:29:54 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: laurent@vivier.eu,
	alex.bennee@linaro.org,
	qemu-arm@nongnu.org
Subject: [PATCH v2 04/23] linux-user/arm: Force v2 frames for fdpic
Date: Fri, 18 Jun 2021 12:29:32 -0700
Message-Id: <20210618192951.125651-5-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210618192951.125651-1-richard.henderson@linaro.org>
References: <20210618192951.125651-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: cm2fOYFD3YvZ

The value of get_os_release may be controlled by a command
line option.  Since fdpic was added in v4.14, and v2 frame
were added in v2.6.12, this makes no change under normal conditions.

Cc: qemu-arm@nongnu.org
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/arm/signal.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/linux-user/arm/signal.c b/linux-user/arm/signal.c
index cb65623965..2d30345fc2 100644
--- a/linux-user/arm/signal.c
+++ b/linux-user/arm/signal.c
@@ -167,7 +167,14 @@ static inline int valid_user_regs(CPUARMState *regs)
 
 static bool v2_frame(void)
 {
-    return get_osversion() >= 0x020612;
+    /*
+     * We do not create fdpic trampolines for v1 frames.
+     * Thus we force v2 frames, regardless of what uname says.
+     * Support for fdpic dates from Linux 4.14, so this is not
+     * really a behaviour change.
+     */
+    int is_fdpic = info_is_fdpic(((TaskState *)thread_cpu->opaque)->info);
+    return is_fdpic || get_osversion() >= 0x020612;
 }
 
 static void
-- 
2.25.1
