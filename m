Received: by 2002:a17:906:d7a2:b0:96f:a786:ac5c with SMTP id pk2csp1286458ejb;
        Mon, 22 May 2023 08:31:53 -0700 (PDT)
X-Received: by 2002:a05:600c:2196:b0:3f6:580:b07d with SMTP id e22-20020a05600c219600b003f60580b07dmr2077901wme.21.1684769513087;
        Mon, 22 May 2023 08:31:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1684769513; cv=none;
        d=google.com; s=arc-20160816;
        b=zqHhi2e1juVZRJ6o1+XabqbuulxnII/AhQwJPciNMzWihvhTdpDjX3wv9ydxMArcBU
         nj2t9j24FdcB6Lm0g4dbNfZko9q3vlEF/VMO5ZtKLYtRxUHhD23Na14+QzOxrOB0xuXo
         dWlzahLSzSVZhcqRxLEWuaxrYOXwWNYDevckv2XKV09R0/JqLrGTc/gRDaXKSd9ffVfB
         16Oi8DEiCw32rXeBzlEDHZAXqHPGuMfqaztqauH1+q3OErfRX4or6/XS5Xcoa3GHizxU
         b1OfGsnH5zynMbuuAgV0rL4Fa721uAD2WKBVAMt34iQDmU0/f8qUZeqV+1gbApw2d48k
         85+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=glXXfgsRplQFxPF2FEdJ5asogB54RtufXxooiyPAR7A=;
        b=J90I+PZFqdzeWKp3w9Gf0bQw8Zk2ickYJzsv/pYMa3i0FNlAO4TeBvxFO91s8xAT3h
         cTceCn8pqkzLbSJdz1YAngbj56wXNNPb46DNb89GauiDVQIZOBTvZOdjgR9x/GhJiiiZ
         pot0eovB7YfBp8DEY/Ew0AfvaLmICmg+GGlM6RjNkgdZlH6w/6GWsrkcYzGQ43imYlYe
         +sb9EP0DjLihJYH2QLnSI8ud0y+4CyqNiBJqn7kIJ74xpphrfMVq8wobHW6to4Y/9GIh
         we9gKaf5GOVTnOzFKV7vR3iEZCg9rmNuglfNzgbW58llfcJRcEZAsWimNZKGYUxUjvti
         dCkg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=N0ERuWsL;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id v4-20020a05600c214400b003f49a8325acsor1174522wml.4.2023.05.22.08.31.53
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 22 May 2023 08:31:53 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=N0ERuWsL;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1684769513; x=1687361513;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=glXXfgsRplQFxPF2FEdJ5asogB54RtufXxooiyPAR7A=;
        b=N0ERuWsLU6iXzOmNBKOlOpg4dVkGIjpNumO8nlBuo/g3l/21CGfmxDKG1N7GJHIODC
         xCjmdmKdHuOGQoAkqrhwNkOM6uT88izAuP3FNvvfanq3672NomTXUdILkhUxwC0a/sp9
         pn9WJZchyTXwhmGPVJMVCOhemcgIzwWs6X8tVscCiw12/7/1QLhGqWtV/rlzRdmkZsDL
         K54krVxaFq8L9I28MWlWWq+S0m9wjStStKhVHGEc+Xuroh0ag4vwadyLsW7JN0s/tFFZ
         /HbGaIxvd+PaBTr+bRLhP/UN7MdfhJW7lvLzTZSuiui4WalCkBefKzxfbp8TjbkbFBME
         0YBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684769513; x=1687361513;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=glXXfgsRplQFxPF2FEdJ5asogB54RtufXxooiyPAR7A=;
        b=KLsKkDGJQja9WZgF2ZNWKcNki0PTXm88Im7PGSn2epex2kHGKExtVwyxHFmnPp+OOL
         TnqTWDKh5Bv2ijipJ1FAuV6JRGC07Y9M1wu62PwP8tgyXa+heMtmcIF1B0+2omxwWmqt
         N/yaAVM52PL3EVMcgx+M5xYvhxnB1YickC54dw7H4qcV6id3qR/5YTGyQZ8t4+O0oDgO
         QRh3FYZII+f2+FIvMSDhJmxsE7bZ/fmX9XcfS2SDdW/LLig5Q2SKldPwuiCz4zYMKFwT
         zA34dH31HcdmCBmkQS6u8/0D82j/2JXCqMxO5E7HA72c6USN3QkG00+vJOPfNMnzYLVo
         Aj5A==
X-Gm-Message-State: AC+VfDyrzwjvT0N5/8ZAhl8c/pfuT0vui47fZ9XTnWfd7fMokYQ2y2lI
	fIMRZ7fa6yzTvQ83eTPPAbTHiEkE
X-Google-Smtp-Source: ACHHUZ76Trc8v9vEFbD2AWUKqFB0luBfRmsTYpHZPG+DYF4hzmK1sSjy1HfwK+v4/lpt1CFMe8JjBg==
X-Received: by 2002:a05:600c:220d:b0:3f6:3bc:8562 with SMTP id z13-20020a05600c220d00b003f603bc8562mr3097333wml.1.1684769512764;
        Mon, 22 May 2023 08:31:52 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from localhost.localdomain ([176.176.153.164])
        by smtp.gmail.com with ESMTPSA id f15-20020a7bcd0f000000b003f0aefcc457sm11845054wmj.45.2023.05.22.08.31.51
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 22 May 2023 08:31:52 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
	qemu-arm@nongnu.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Evgeny Iakovlev <eiakovlev@linux.microsoft.com>,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 01/12] util/fifo8: Fix typo in fifo8_push_all() description
Date: Mon, 22 May 2023 17:31:33 +0200
Message-Id: <20230522153144.30610-2-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230522153144.30610-1-philmd@linaro.org>
References: <20230522153144.30610-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: /nFZRMkAxwJN

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
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
2.38.1
