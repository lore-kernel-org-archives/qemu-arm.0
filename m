Received: by 2002:a17:505:70c3:b0:1be9:327d:8ee3 with SMTP id lw3csp1074142njc;
        Mon, 30 Sep 2024 00:35:05 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCX2DoIY9WdcybfbKdn/BnHDZPq3sbAn/LhT0ncoogQxjJiPNpTLHlKYoWohYfgaY+iHfjyu0b7895f/DA==@linaro.org
X-Received: by 2002:a05:600c:5903:b0:42c:bae0:f057 with SMTP id 5b1f17b1804b1-42f58bdaf9dmr89493035e9.8.1727681705615;
        Mon, 30 Sep 2024 00:35:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1727681705; cv=none;
        d=google.com; s=arc-20240605;
        b=S30Ar6JOttVI/o6K0Z0vw2P0TUwUuTFjV74RV/bzzoz5ozi5g1ZqUzLIksZ3HZ2v8R
         mi3pRYlzGRhwmgOUP+qB1P04JPX0/qgccZ2fzdf3dJf9QarV+cwrfTUtJOqEYwKIwlnA
         guyGNnNHPRIC8jAkatKaFk4JShSPnyyReliwBiN/q63DPCHWszLFwQtmMiF5D5grwksf
         YFFvUNLzJxpYClJ3QTjvu4BguCkiIG/J67Zy0TMiNi0jyJ38IwnudUUsx8eaeKHtkclN
         q8DdcWJ2R6BoPXTGN0PA7mxCu8oKpGp4ZCpG1lBfaDzTy4qhXgxar35EVBmeB63DLtEQ
         BlZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=Dt537SuyKX8S7JgDRKIhn/HH1R6QVwglbjLetvuqYf0=;
        fh=l/2T8yFRzDbritBXU2NIDkqCHL0i4Y/Y82e/BL9LuRw=;
        b=IWINUNiYVSz+q8FuHU58ktrvJFTxGm9wzkTPvYC4x9kKR/261laz7xl7d1sMDZFcQG
         IS+AbgLljNZCnHOSkpq8WaTXTb4K3jzQWLVmrpe+Frqg3b9xW4bl83h1M3TCM5dLhdyt
         6brPNR2mbfMh/i9sdxFFPuX0TvykqmIR2r/l+Z9azXdNK/HuRmj47qudMdAmV0NdUPfV
         5TY2iETGv1ONQ3iJ1MjwJs+YjTraFtg3yNNuAuCVbGxSipDv5yraBYGOZ3rpISQ0BkVX
         RHpcCmp5hvgGASBRIqP3vAhew98XHVibksBXZVYyf7SnB3aqwcW1TCWzqcqZOrdouTdQ
         M2jA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=TtRIFUDJ;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 5b1f17b1804b1-42f5f2d5a49sor14150615e9.4.2024.09.30.00.35.05
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 30 Sep 2024 00:35:05 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=TtRIFUDJ;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1727681705; x=1728286505; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Dt537SuyKX8S7JgDRKIhn/HH1R6QVwglbjLetvuqYf0=;
        b=TtRIFUDJSoFVrrD+knpQbBRbt2WmCehr+8lPepTQzfhd9uT6VTzQntbE+o/qkgUiNL
         MFwuAMYQlqYFlUJOjb6JQPF8uCnNXpRAxvWIozILcsXydYKd40QKn0Ke2Z8mJuEcI0AE
         B99vQ7nKvUwPNI3nplXMlyWFTBuKDdsQe7tQE2MELWvzF2G/4/h+nW+XtaFiBJuW07h1
         bQRKjPoPUXSBqjfmY0nQwmANj5ZtTCYD8AOc7mIYWA80IlB5Drwxe9fswcrZw/kMY1B0
         xJeX2fWdIW4YyCn+3iLaPxvMNF+2+29KEU109/PuF+W5fkF5iyyKvpegJiniVubs9HAt
         pxrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727681705; x=1728286505;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Dt537SuyKX8S7JgDRKIhn/HH1R6QVwglbjLetvuqYf0=;
        b=WELA3flp31H9iAWuYAPtn4NNJjvhNs1I18xjCBtPK4+cbT4OWnjmwXqmeqD/w3p7mb
         MvBqhXTF4ijQa8gWt1xYQhHf1Sc07lZr7aME1rf7/NqLo3k1P7YiFPytO20XwjqapBkP
         WQXKZS6VIkN/qB0rSQ5e7eLDj2ATt11+VFWe5mLoFvTASDN6UdkIHwrGPYYyse3bC2mr
         ZczlonVYKKu9LTX87XejoJ2mJXMfqz5lzv8OeuF/jbpfiXnEJBZ67ggdEQHRq1VaC1Dd
         OxKWc7uf4Q8T3yTzmVC7Pi2gBE/ydr1V/Be7Wd7zEO9PeqMOWl2WFHqJyMno2E3me2Wz
         FH0A==
X-Forwarded-Encrypted: i=1; AJvYcCWePNJ/LUvYNEtHVSAmndkCPeahUqQCJ5VJkte5sHH+bvHgLOjc+3oAl3BFCyUakkRVcPdlJ14d3i4Ssw==@linaro.org
X-Gm-Message-State: AOJu0Yz+FS3qVZrIpT3nHBtY6JIXnvkRPiTN1PHdsBupn6si9I0sep7g
	d//JBvSofUS+yY5HnClAz1adX/Sr496aL4fn5rgd2+MwKPjIJ/CHBK43gYuTGr6Bcg==
X-Google-Smtp-Source: AGHT+IFFqjO07Ex6VXaJnBp0fLXrztRoPGuiC1qPJjA4ACoyyr6faMY/cMGoyF46pDMcCkFmfDJSuA==
X-Received: by 2002:a05:600c:310e:b0:42c:c28c:e477 with SMTP id 5b1f17b1804b1-42f58488779mr69873155e9.23.1727681705036;
        Mon, 30 Sep 2024 00:35:05 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from localhost.localdomain (186.red-88-28-13.dynamicip.rima-tde.net. [88.28.13.186])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42f57debe5csm94870215e9.24.2024.09.30.00.35.01
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 30 Sep 2024 00:35:04 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Mahmoud Mandour <ma.mandourr@gmail.com>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Thomas Huth <thuth@redhat.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Alexandre Iooss <erdnaxe@crans.org>,
	Jason Wang <jasowang@redhat.com>,
	Aleksandar Rikalo <arikalo@gmail.com>,
	Anton Johansson <anjo@rev.ng>,
	Peter Maydell <peter.maydell@linaro.org>,
	Huacai Chen <chenhuacai@kernel.org>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Sven Schnelle <svens@stackframe.org>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	qemu-arm@nongnu.org,
	Aurelien Jarno <aurelien@aurel32.net>,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>,
	Max Filippov <jcmvbkbc@gmail.com>,
	Paul Burton <paulburton@kernel.org>
Subject: [PATCH 01/13] qemu/bswap: Introduce ld/st_endian_p() API
Date: Mon, 30 Sep 2024 09:34:38 +0200
Message-ID: <20240930073450.33195-2-philmd@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240930073450.33195-1-philmd@linaro.org>
References: <20240930073450.33195-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: L4w2vDPgpWZl

Introduce the ld/st_endian_p() API, which takes an extra
boolean argument to dispatch to ld/st_{be,le}_p() methods.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
TODO: Update docstring regexp
---
 include/qemu/bswap.h | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/include/qemu/bswap.h b/include/qemu/bswap.h
index ad22910a5d..ec813a756d 100644
--- a/include/qemu/bswap.h
+++ b/include/qemu/bswap.h
@@ -433,4 +433,23 @@ DO_STN_LDN_P(be)
 #undef le_bswaps
 #undef be_bswaps
 
+#define lduw_endian_p(big_endian, p) \
+                     (big_endian) ? lduw_be_p(p) : lduw_le_p(p)
+#define ldsw_endian_p(big_endian, p) \
+                     (big_endian) ? ldsw_be_p(p) : ldsw_be_p(p)
+#define ldl_endian_p(big_endian, p) \
+                    (big_endian) ? ldl_be_p(p) : ldl_le_p(p)
+#define ldq_endian_p(big_endian, p) \
+                    (big_endian) ? ldq_be_p(p) : ldq_le_p(p)
+#define stw_endian_p(big_endian, p, v) \
+                    (big_endian) ? stw_be_p(p, v) : stw_le_p(p, v)
+#define stl_endian_p(big_endian, p, v) \
+                    (big_endian) ? stl_be_p(p, v) : stl_le_p(p, v)
+#define stq_endian_p(big_endian, p, v) \
+                    (big_endian) ? stq_be_p(p, v) : stq_le_p(p, v)
+#define ldn_endian_p(big_endian, p, sz) \
+                     (big_endian) ? ldn_be_p(p, sz) : ldn_le_p(p, sz)
+#define stn_endian_p(big_endian, p, sz, v) \
+                    (big_endian) ? stn_be_p(p, sz, v) : stn_le_p(p, sz, v)
+
 #endif /* BSWAP_H */
-- 
2.45.2
