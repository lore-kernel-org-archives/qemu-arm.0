Received: by 2002:a17:906:28cf:b0:a52:4db9:938b with SMTP id p15csp2498086ejd;
        Fri, 19 Apr 2024 09:00:00 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCU0k3SZWBdI+FDS7p3FsrxKRpj4OAnz1cQ/vcVXjxyxRwLpdW8SteK8Wj9UhOD5ZDGD1jYTavihUr7K4yTMGJRtNMFL5o4t
X-Received: by 2002:adf:f447:0:b0:343:d23a:c977 with SMTP id f7-20020adff447000000b00343d23ac977mr4791314wrp.1.1713542400284;
        Fri, 19 Apr 2024 09:00:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1713542400; cv=none;
        d=google.com; s=arc-20160816;
        b=uuxHT/uTDspJwX6kSTmVJdwnwcCUgEON+iMhS8651MQwWdcStL4WFfNUxWc5VAUvOm
         t09C+ZRAqN0V81xujbWuavumfP1WmV9TsaLYn3xNyuAGcUkzBJDaRv1KcLcIBL0ujn/9
         WNw0E5oNv/KpDzxUsRn7SNLlACVM/ISfj6V+tMcqlgUE/NCMa21IVwzvirWkKXEEYPE2
         kmZJFpxYMg0Elfd2PZRHSExnl6e4dPq3gVJC3norWb24Hrne8lt+ABPdT68gsOSK9fwg
         m6aqc4uM2PRK7LBdwfkrR1wNJxmsexM/OG2X/ZmDSG2FXtp1KiMT0bZPqU2xUNZaz6RC
         RUjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=FkRIZYSXM60C11pVAmU0c6gDc0GU3jgcOc8qxUScJ1Y=;
        fh=xk/Zp1qNYHrrYWsN7hRHG7IOw8K4JZqb5+hrebNljTI=;
        b=iI80PVv5T+oHnV366sMdHBe9bl4Gw6OR03crbPSltcyfE6xeY1zWqUlFxSuuXltFlV
         r+ENxQQ1M7icyu3u97c717iRtwvrZK+aDYqXGhjFxdnfUQOWAJ5RC8oObogj1VGJL8zr
         ckBDcCT6y5kVDc4JD3f5GkDfcHwUHKdx6oE7QX5777ErJSHfiA8tvEkJ8MaCsxR/Uok7
         AaEAuKwqlVouz9ZcWsOnSxZDIgJRk5/b/cwW5cCvFOH0tHSO9qRxnQH6V+LaZ0zh8WKI
         WFON258aW74FEyv/I2xaYd7ZrqJ7qIuUxYnqp3Q7GlAmG63LV/c8ApaqrI1UCBAjmWJY
         bRJA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=uAVFARwQ;
       spf=pass (google.com: domain of jean-philippe@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=jean-philippe@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <jean-philippe@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id v1-20020a05600c214100b004147e72fe40sor1112505wml.1.2024.04.19.09.00.00
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 19 Apr 2024 09:00:00 -0700 (PDT)
Received-SPF: pass (google.com: domain of jean-philippe@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=uAVFARwQ;
       spf=pass (google.com: domain of jean-philippe@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=jean-philippe@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713542400; x=1714147200; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FkRIZYSXM60C11pVAmU0c6gDc0GU3jgcOc8qxUScJ1Y=;
        b=uAVFARwQLbCU275bRs13h/QrePTY3QWyDLvXH0jQPNQsLRIiAktW3UoM7mu78/5Nmd
         xHs6LCwwbvnnhgd6ebiT6eq1WT0M2Jl9GTzzIV2I73E/G9VQ40xCQmE0RHpnrxlZEGya
         NAQT024v8zX3HT1e0Fk0SCu5gVxJ0PNCzHwsMzldzsiLLLlEAcb6sZarLjcWJ579DsmM
         2SujVDIq5kGJ6//DKYjS2jSqYvPjM7Et+lr4JeOeJ5eMB2cQn7pTNkCfxx1SCRQx/liX
         6zKL9fUvN62joUvcMWkNdyf8G93IRzKtgqjvu6uJtuc0ALJ5ufIPzqUAfMv5hMei0GbC
         ZgNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713542400; x=1714147200;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FkRIZYSXM60C11pVAmU0c6gDc0GU3jgcOc8qxUScJ1Y=;
        b=ZwgCnVHXuqAkA2FN1PGxpdznkXBNRqbz+dtw4ErqGKtslyxXjvWzsoH8RdnJdFumk+
         5QEm9NlOutyJU6KNuTW7AeTq66B/nKRqH0TPwpbx4jMa/LJemoX+74+Vyf9f/XBIW56l
         oLab3dEfLZOHaunncXVxuRvjnnvwCp8IFqDmhdPrcHGNRMlx4ABWfsfJGbrLEdXxyCQG
         MDzH3e9MHQKZ2oyIksxkGueKFzo/ZILIdxqoFxrDLAUO7/tmeSacDyRKs/jkoAWeK1z8
         jzAb6NdNxsD8XQKTeYVN6iexy5s8X8SvOj3WeSwTeDjtUeKofjaPjaSTul5cfswRYbSl
         smAA==
X-Forwarded-Encrypted: i=1; AJvYcCVG5qg8i08dWxwTQglVJ/It0B2L0+8T/i7O6ZSLt8v4/GvKPUSHZeeY7IptKuXdjHjv6cuQRAbShUYfeMsaNpvtIzmjG1sL
X-Gm-Message-State: AOJu0YxHO7TJ/e+40Y4Wr6ZM7cTxsa2ixgMzKK1bt7urZ1LkPPdYOvkr
	fzTNWkuY4HiWGyi7mQ2dcCuLAOwT6lK2vQEB5t/rhOdswgZv8Lh+5DReZ30RE7K/xOcHFyKvz4X
	46Ew=
X-Google-Smtp-Source: AGHT+IHAbdi0c326+6wQmTCOWDDeEMqnDrJNMO++dLbiFMIKRETjm2YK89aW5Ik3rFD1vYXenRdRYw==
X-Received: by 2002:a05:600c:4c17:b0:418:f6e7:3599 with SMTP id d23-20020a05600c4c1700b00418f6e73599mr3254144wmp.3.1713542399993;
        Fri, 19 Apr 2024 08:59:59 -0700 (PDT)
Return-Path: <jean-philippe@linaro.org>
Received: from localhost.localdomain ([2.221.137.100])
        by smtp.gmail.com with ESMTPSA id p13-20020adfe60d000000b00349b73143e7sm4793089wrm.75.2024.04.19.08.59.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Apr 2024 08:59:59 -0700 (PDT)
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: peter.maydell@linaro.org,
	richard.henderson@linaro.org
Cc: philmd@linaro.org,
	pbonzini@redhat.com,
	alex.bennee@linaro.org,
	qemu-devel@nongnu.org,
	qemu-arm@nongnu.org,
	Jean-Philippe Brucker <jean-philippe@linaro.org>
Subject: [PATCH v2 20/22] target/arm/kvm-rme: Enable guest memfd
Date: Fri, 19 Apr 2024 16:57:08 +0100
Message-ID: <20240419155709.318866-22-jean-philippe@linaro.org>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240419155709.318866-2-jean-philippe@linaro.org>
References: <20240419155709.318866-2-jean-philippe@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: 37kPNeAL5ypx

Request that RAM block uses the KVM guest memfd call to allocate guest
memory. With RME, guest memory is not accessible by the host, and using
guest memfd ensures that the host kernel is aware of this and doesn't
attempt to access guest pages.

Done in a separate patch because ms->require_guest_memfd is not yet
merged.

Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
---
v1->v2: new
---
 target/arm/kvm-rme.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/target/arm/kvm-rme.c b/target/arm/kvm-rme.c
index 8f39e54aaa..71cc1d4147 100644
--- a/target/arm/kvm-rme.c
+++ b/target/arm/kvm-rme.c
@@ -263,6 +263,7 @@ int kvm_arm_rme_init(MachineState *ms)
     rme_guest->rom_load_notifier.notify = rme_rom_load_notify;
     rom_add_load_notifier(&rme_guest->rom_load_notifier);
 
+    ms->require_guest_memfd = true;
     cgs->ready = true;
     return 0;
 }
-- 
2.44.0
