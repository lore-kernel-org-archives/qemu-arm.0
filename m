Received: by 2002:a17:504:14cd:b0:1be9:327d:8ee3 with SMTP id g13csp3179016njc;
        Wed, 16 Apr 2025 01:15:57 -0700 (PDT)
X-Received: by 2002:a05:6a00:896:b0:736:5664:53f3 with SMTP id d2e1a72fcca58-73c267d4f79mr1288720b3a.15.1744791357666;
        Wed, 16 Apr 2025 01:15:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1744791357; cv=none;
        d=google.com; s=arc-20240605;
        b=fEe0++wpyCOt0b5UwCDqHbgdHzptNwMWZ/oMsDm6Y1poBQCNEiqkaV6Yjrj0oY03cf
         IUVBevf0jKPAeakYBQUwpZngBZY3wAqoPXB/xlVUfXGyt2mrSfrcik6hJvozknfSDclT
         B5id67jo8K/IVtFRMFp6LUGzeiLkqhmGbPVty8B49moIfOh8in45ucSWzrumFu7KHj29
         qHEHXZSP2JgyfR+HpS+fnx85jGF4ZXF4GvMeng0h82r1u3ITdZIHmjBwVe72JmZZIrpw
         PWuTYZTUvvrNF58kp6mYkRVZuOyHWa3vFRMbU160XEIyKFwJW91eWIMTEwRYLHV8UKA5
         j7Eg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=LLrrsrQZzD72xGTbhwYlmsLnhFUFIFLCF7fWNU0pNNM=;
        fh=ee7pLgImdk6kmRIdAY8rmoAJMmUrG2cykShSps+hZPE=;
        b=CqwuDeURYqN58etn6jYWyXeK516BQNVuCAi/4XWvLMQBsxbwYXFtfT1rcttFIks9OR
         QGBOL3e8LmWiMRCpA3Df9quhUlXZWMMQNeu8kaDmWBHj+gDCzER4u0WNhd3f6N28nSBP
         6Y78b81bBMIEH9eEZMG3wSiQc9oztdPf0cQCreKOrMbO8zhS58Lqn7sM78kJ5qCiBolx
         slWnH+5m0KV4PcJqWatkTSeXrmWN33/zm6GdaLk2++PPXPwQhEUzNYpSLfK/NV5wPJj5
         NpvyDX+cXouYFbU47YaYI7Ti1/wVNlxAnm5zSvONN2Q80NpP4l/F0VkydpjjiaWJBqA/
         rjKA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=Pmt5sZ6B;
       spf=pass (google.com: domain of ktokunaga.mail@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=ktokunaga.mail@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com;
       dara=neutral header.i=@linaro.org
Return-Path: <ktokunaga.mail@gmail.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d2e1a72fcca58-73bb1e9784csor2310780b3a.9.2025.04.16.01.15.57
        (Google Transport Security);
        Wed, 16 Apr 2025 01:15:57 -0700 (PDT)
Received-SPF: pass (google.com: domain of ktokunaga.mail@gmail.com designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=Pmt5sZ6B;
       spf=pass (google.com: domain of ktokunaga.mail@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=ktokunaga.mail@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744791357; x=1745396157; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LLrrsrQZzD72xGTbhwYlmsLnhFUFIFLCF7fWNU0pNNM=;
        b=Pmt5sZ6BEodLB+wXHfu9z9xS5sS350gGQGa0x79TqMu25HwVsCpraw+3soO3SW4h6e
         MJWmOjW8Spxyfav0emFrd9sl9quuMFOlr13lUkdr53mWY959e57lWyQUEpsR0Bx4BWpR
         X8gReryYe4qvJ/A5rw75lxurA6gt6Wu77jCt12ptQekxI87Ic4K2l0TzGrqYyHNHZz+w
         LxECyqtIwwVLCCUZHll2RjS4jv5/lnIZqfpebTk8jv7Q1oIHFIAQxogKbVxFFHK312Xh
         UQHQjtlyMjGa4GUo1QRyWzlNnYl8H0nwbcdWhmSvYHw1x12hh42iKXoHQGkLCNvOciNp
         iXzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744791357; x=1745396157;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LLrrsrQZzD72xGTbhwYlmsLnhFUFIFLCF7fWNU0pNNM=;
        b=Y0Fqqp/w2obFkRZbrlu4t6T54UMGN/r8OGy/TePFnQYM9NCrIsu2mM9elY74qlUrkz
         0kqZvz6oTTfdwtySloQDj5pIJTf/khoysL7XGofrMjBK+BgJfw2aIbNUpGng2U1xCivM
         b+6cqK5+v8ebEiz/cOOW54Udo3xFZ/o3fSL3P/8VOCFUf5cCX5r70ypMG2r6MhRrGUJx
         a2dbER3KCUbZ0hYACs23RQ+HjmcXtSoWZDFQKgFWjOOXwceOooRyC7T+JSojiTt/RNhd
         zISXCS3Na95G5BOaDfjjgYcm2GBuxndorLeaec15TeETcgEI1BN246815kVm3RvgHIs5
         3Eag==
X-Forwarded-Encrypted: i=1; AJvYcCUOsWM7t8Te1jtTbc3Qv9xVuDQbeNbBZMBgNtkb2pI5SGF9x7iANgFBsSKLFS9xHachTIBNuaRfxjlHSeZ9@linaro.org, AJvYcCViTZ/dA3I8UyrocY/dLGF/W1OX2/zn8botAZpwLiJ7puZ+CaD7XEERkttLdKr3Wg3EQ9H+vkP1d7b7VHof7no9MQ==@linaro.org, AJvYcCVm6RYgf8AmfiHCGPpQPisYZ7oR7KGUX46KBDSPjtaMxusqA1I8/7wb5ynunj14MoT0daI6Z1K6nDLUS4PrzAOGFTk=@linaro.org, AJvYcCXeg8BSfc3pJx0BRpCA3MZJMKmslb0jl686hUckt/5c2Ld1PgQ5cKMjc5tRcRm/gi3Lv7JEFMoc@linaro.org
X-Gm-Message-State: AOJu0YxX0SDpQEKqXS08D8iWNp3qH9j3w1CoSWU6GqeLvZsokh+yMbCL
	cSeegEUbUlw4a9hLOVoayATZ19nPOnERhmaMn+gGBwS0StvEQDjk
X-Gm-Gg: ASbGncvR1gIMTGerWy8H4eozSlvtdN8wKRxbI4gUKU9S5nCuFdR9XyPQMdTGcItsz2V
	cj+MO4Kw/H17CatTrnounhYfVGYuNUTTyzgpvoBsSc+Y3xUkR/JzzQr1zWnjjI4LZTxH1ef46Eb
	aMHNzzJig4p5UBlLMNeOGFt8R44iPeCOp52R/oQfsLA/mz4E6pPFlbdTDzTFL9Y+Jm5atmGU1li
	rvCflGru0X/aB5ddylWGInoeQFZyWJdOTVspVPWbdHcJv7XPF3OuA7BhoDhDxQu6DYmZbcFwTjc
	luI1elBdqQ2LP5JZpoBe/iuH1H/7qPc60+C1LCxib9rAr/mopH56SksrOA==
X-Google-Smtp-Source: AGHT+IElp/3KeYgC/T6jv5Txgk/XiOizl7AfYjlspAIvyy7iNx5MfvQinIdw27QmjbVp2QBCODsp4g==
X-Received: by 2002:a05:6a00:aa8d:b0:736:a973:748 with SMTP id d2e1a72fcca58-73c267f8ba4mr1454869b3a.22.1744791356930;
        Wed, 16 Apr 2025 01:15:56 -0700 (PDT)
Return-Path: <ktokunaga.mail@gmail.com>
Received: from localhost.localdomain ([240d:1a:3b6:8b00:ee5a:e672:7d4c:d43])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73bd21c3263sm9839445b3a.38.2025.04.16.01.15.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Apr 2025 01:15:56 -0700 (PDT)
From: Kohei Tokunaga <ktokunaga.mail@gmail.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Thomas Huth <thuth@redhat.com>,
	Kevin Wolf <kwolf@redhat.com>,
	Hanna Reitz <hreitz@redhat.com>,
	Kohei Tokunaga <ktokunaga.mail@gmail.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Alexandre Iooss <erdnaxe@crans.org>,
	Mahmoud Mandour <ma.mandourr@gmail.com>,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>,
	Pavel Pisa <pisa@cmp.felk.cvut.cz>,
	Francisco Iglesias <francisco.iglesias@amd.com>,
	Vikram Garhwal <vikram.garhwal@bytedance.com>,
	Jason Wang <jasowang@redhat.com>,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	=?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	Eduardo Habkost <eduardo@habkost.net>,
	Peter Maydell <peter.maydell@linaro.org>,
	Zhao Liu <zhao1.liu@intel.com>,
	Nicholas Piggin <npiggin@gmail.com>,
	Daniel Henrique Barboza <danielhb413@gmail.com>,
	David Hildenbrand <david@redhat.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Ilya Leoshkevich <iii@linux.ibm.com>,
	Stefan Hajnoczi <stefanha@redhat.com>,
	qemu-block@nongnu.org,
	qemu-arm@nongnu.org,
	qemu-ppc@nongnu.org,
	qemu-s390x@nongnu.org
Subject: [PATCH 07/19] hw/net/can: Fix type conflict of GLib function pointers
Date: Wed, 16 Apr 2025 17:14:12 +0900
Message-Id: <4ddec141849368fa77f9fd68942f09f5338ef9c6.1744787186.git.ktokunaga.mail@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1744787186.git.ktokunaga.mail@gmail.com>
References: <cover.1744787186.git.ktokunaga.mail@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: k+0OEGwESlgg

On emscripten, function pointer casts can cause function call failure.
This commit fixes the function definition to match to the type of the
function call using g_slist_sort_with_data.

Signed-off-by: Kohei Tokunaga <ktokunaga.mail@gmail.com>
---
 hw/net/can/xlnx-versal-canfd.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/net/can/xlnx-versal-canfd.c b/hw/net/can/xlnx-versal-canfd.c
index dc242e9215..013ebc10dc 100644
--- a/hw/net/can/xlnx-versal-canfd.c
+++ b/hw/net/can/xlnx-versal-canfd.c
@@ -1278,7 +1278,7 @@ static void tx_fifo_stamp(XlnxVersalCANFDState *s, uint32_t tb0_regid)
     }
 }
 
-static gint g_cmp_ids(gconstpointer data1, gconstpointer data2)
+static gint g_cmp_ids(gconstpointer data1, gconstpointer data2, gpointer d)
 {
     tx_ready_reg_info *tx_reg_1 = (tx_ready_reg_info *) data1;
     tx_ready_reg_info *tx_reg_2 = (tx_ready_reg_info *) data2;
@@ -1318,7 +1318,7 @@ static GSList *prepare_tx_data(XlnxVersalCANFDState *s)
             temp->can_id = s->regs[reg_num];
             temp->reg_num = reg_num;
             list = g_slist_prepend(list, temp);
-            list = g_slist_sort(list, g_cmp_ids);
+            list = g_slist_sort_with_data(list, g_cmp_ids, NULL);
         }
 
         reg_ready >>= 1;
-- 
2.25.1
