Received: by 2002:a17:907:76f8:b0:9a1:fa4e:495e with SMTP id kg24csp5072764ejc;
        Thu, 31 Aug 2023 06:00:18 -0700 (PDT)
X-Received: by 2002:a05:600c:2353:b0:401:b2c7:34aa with SMTP id 19-20020a05600c235300b00401b2c734aamr4269949wmq.33.1693486818814;
        Thu, 31 Aug 2023 06:00:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1693486818; cv=none;
        d=google.com; s=arc-20160816;
        b=UPNKJn/9uXHxPr1Bqf4ZYk+2CEy7SkJuIXF/kNtT6a1lHZKkcDCUM9NyVTBuiJm0OR
         wy5vBuqwnpySJNNAOY0KH9OJe1391dQAapc8etuXcCywHQkwcuOfgvR5k0rZcYsVAnAa
         0351kEintVg+zp4nZV9zNDuRyjEg3LwNR9g89IlQ51oNC43FpojTkoxXf35eXI5sBgRb
         pAxqOmSgnNMqjKuxJrbXqRQBj7U1iQJzJ5CWtIWvy76M42J3OjphN909TF8CnYn7i5c2
         YceBHha7yqrva3m99ADivgX+c/o6lO5H7fg6CwAgY4m70kZNBjESU4mOGlSgsOF62oCG
         WLJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=P4pW4nemJPjYVIP0e99/LIoCEfzLbBmEnwZT8fz868s=;
        fh=K1pMRBYxWidjd6gK05IXWA+ucg3D/BsM7PyoXK7BVrU=;
        b=TSvV7rVT1CQT5/Tw0BUvzR0hEx70Q1cAeQSswmSf3b9Q4bI1vMx+l2It99O6BTqDlz
         XBH0p9udP4MLrHD2z96EV0F0GAB+hw4UfsmLJkfxHKvLXldQ8Q0Jmntq//9ZLgQaA5dY
         9rv8K9bGccLyUtqMldE4JAxEexQJkqk0xWGtCv2J4h9CcF/iFDZ/XXMRhRPAAgwYHLK+
         bvhA7tB4VVe7y5GnVz8T/N59OzLoMfWx7WrQT0Bnr/GP2h648OPMCb7KVYvXSlF5u9s+
         QhJa81ir4OYe2FOHZxjq25nnN+2pT7QYYRsc142joGhCqzvi8lMqKWDM3LdgAM0nW1TJ
         kRng==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=N3raOVOH;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id o16-20020a05600c379000b003fc055c4420sor556446wmr.5.2023.08.31.06.00.18
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 31 Aug 2023 06:00:18 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=N3raOVOH;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1693486818; x=1694091618; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=P4pW4nemJPjYVIP0e99/LIoCEfzLbBmEnwZT8fz868s=;
        b=N3raOVOH5Eysx5jzo+J3Mp8U7sXqL/mXSLFrXiuJ56oBANghox6dcRJUqtHzbSbdDR
         AJM+/BIbI7/bTxDQRsCqDsjG0wt3hjNBK0IdzRfAqDACHbFacu6lAJBzNbeCKSfXZOoc
         Iw693wG0IG73m4oQjwah42yN8zVhTL/rbbzDnWcRw/K/soQ+A6y5ugu9KE3yXBv8Zmk0
         k02SPTJgC5If4Ai4fx8D9QfLC6BJv1YIEaVW3QoSupy2Ub/0mswUY9owa/IMqemlvdc9
         /E5445VtRvtd7VgxyXWv/+vGZmbpqoNubYgbvkKNVjy+d10luCsSdQxAf6+ypGf2FiUH
         M4pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693486818; x=1694091618;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=P4pW4nemJPjYVIP0e99/LIoCEfzLbBmEnwZT8fz868s=;
        b=VBSXm+BLpnuo8JBwvc+CVetTBWBRVRtWzb1UK+kXceB6m/qUUAIt+LF6XfWEMqSRlS
         RiUDn0flDmABcV45dTMZeoMsf7wk5iJOXv/RVH8u74pN06Ib1ugwg/Pj7qWtJUw3geso
         q1CDPxtbCDZlf+3xrhQ2DhcO0cPqcGlRtaBgniGjm3VGlcXKQ3leRphM2BBCUS2eI8BZ
         IJzc9xhxxO9RwjuMCY3rI084rhq/6171kbkPW3ZLUy11JTxMWAUdpLQh85aFOHLUMEzK
         SodV3rMGh8Pv+BW81vj+UYnNYlvFyBKu1C1LrUr2s9xceRN+3ztRHtTD3KuJEnVS1+ER
         kk3A==
X-Gm-Message-State: AOJu0Yy/PbJIxQaNYIPXGxjvIuJFwUbRQLtt2vnxwRQHLPTOkD8J8Mqe
	YkQ6a/NT+asHX7vk1CZm6Hd5fJ3asbdTqLM1sqNrfw==
X-Google-Smtp-Source: AGHT+IHMRgh4uEGvXy36inVdMqMO2SdZ0cczkAdfEZ5cpCBkqfsNCWZjiOdku26vSaBEojoinu+cbg==
X-Received: by 2002:a5d:6884:0:b0:317:5747:b955 with SMTP id h4-20020a5d6884000000b003175747b955mr3642041wru.17.1693486818448;
        Thu, 31 Aug 2023 06:00:18 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from m1x-phil.lan ([176.187.199.245])
        by smtp.gmail.com with ESMTPSA id c17-20020adfe711000000b0031773a8e5c4sm2141968wrm.37.2023.08.31.06.00.17
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 31 Aug 2023 06:00:18 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	qemu-s390x@nongnu.org,
	qemu-ppc@nongnu.org,
	qemu-riscv@nongnu.org,
	qemu-block@nongnu.org,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Francisco Iglesias <frasse.iglesias@gmail.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PULL 35/41] util/fifo8: Fix typo in fifo8_push_all() description
Date: Thu, 31 Aug 2023 14:56:37 +0200
Message-ID: <20230831125646.67855-36-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230831125646.67855-1-philmd@linaro.org>
References: <20230831125646.67855-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: g97gagyAxfu4

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Francisco Iglesias <frasse.iglesias@gmail.com>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20230522153144.30610-2-philmd@linaro.org>
---
 include/qemu/fifo8.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/qemu/fifo8.h b/include/qemu/fifo8.h
index 28bf2cee57..16be02f361 100644
--- a/include/qemu/fifo8.h
+++ b/include/qemu/fifo8.h
@@ -46,7 +46,7 @@ void fifo8_push(Fifo8 *fifo, uint8_t data);
  * fifo8_push_all:
  * @fifo: FIFO to push to
  * @data: data to push
- * @size: number of bytes to push
+ * @num: number of bytes to push
  *
  * Push a byte array to the FIFO. Behaviour is undefined if the FIFO is full.
  * Clients are responsible for checking the space left in the FIFO using
-- 
2.41.0
