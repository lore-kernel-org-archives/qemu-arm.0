Received: by 2002:a17:504:17c4:b0:1be9:327d:8ee3 with SMTP id o4csp2136753njd;
        Mon, 21 Apr 2025 22:28:58 -0700 (PDT)
X-Received: by 2002:a17:902:e5cc:b0:223:3630:cd32 with SMTP id d9443c01a7336-22c5365eaefmr213832855ad.53.1745299738342;
        Mon, 21 Apr 2025 22:28:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1745299738; cv=none;
        d=google.com; s=arc-20240605;
        b=UtDmtc++G9XzS/Tm0MNhy9a6Muxyc1+D05CTKQAJhdUm6ypemPl9er7Bx+COcArlGt
         V3ZReSKg/9kVnYSVJZZ6ns7i0wVzPIDys95VMN9lHW/CbHlU6riS5YIN7VDr1sG3Dlvz
         QwMD1qdOeOQvC0am8jdFm9HO3MbrEyd6QtVYdmX2LYC5LOmgRPkB78Z7AL+GRU6llTT2
         4xZfWD7XfMLgCJyiWI09C720DzdzXtbpifDSIvPhLwK+DGmF0WeFSLfCFoPr9gg4c/m7
         lNt+CIiGZyd949iaMSJ7feWkEzozcOnzAdQaK7y0NcH15VQillfPcVrLJWpBGtOkkKft
         0kPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=jka831lyyEn5TBrC/KjMd2fj+rwDsw1v7du1qQ7OLBI=;
        fh=q5YfWEIFI9rT6WXr4Ark/orNfGTjC2YyCAydBF2RghU=;
        b=Wykt8rp7qKXlUJA7m5G+APx2sOrD5T2fMvFiLZUGR9I+nJIYj/sgHMVFL0uRlid6QA
         kfrTKv9CU/0OzDRNeidagS/56Dj1V7TaKvqAhdyUjOx4uaPenvY3oEeVLXYfjAROxD21
         NqZ0aP/3OyPvTwCPljlIltqBzrv0ZZ/skRWOB+dXjIaCXnj2ogE/WuIlKtNzlu9F9pD9
         j04yBX9aaEcc9s9fBFGTEJaOJurE0poQ/G6Z4wIIjq0Y2Xvn9BnGrC3YhC6bV+4LiKk5
         SEYTmbrBxUM62T+KOodZiP4pGtzKmH97E7D+aRRHeGPTXs627vCBjYeNx5o5K6fT1Wt5
         B5DA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=RYkcLdjZ;
       spf=pass (google.com: domain of ktokunaga.mail@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=ktokunaga.mail@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com;
       dara=neutral header.i=@linaro.org
Return-Path: <ktokunaga.mail@gmail.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d9443c01a7336-22c50bc856esor50854615ad.2.2025.04.21.22.28.58
        (Google Transport Security);
        Mon, 21 Apr 2025 22:28:58 -0700 (PDT)
Received-SPF: pass (google.com: domain of ktokunaga.mail@gmail.com designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=RYkcLdjZ;
       spf=pass (google.com: domain of ktokunaga.mail@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=ktokunaga.mail@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745299738; x=1745904538; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jka831lyyEn5TBrC/KjMd2fj+rwDsw1v7du1qQ7OLBI=;
        b=RYkcLdjZ/X1zvStvsnyUtP9R7zSb7b9YLJXojdcl4I6xMTu+zzYxh8dXgoRnnkLc4+
         i4vc+lohOHP0cMsk1c+C8ggVwJxE4QEsMNQx1WLntOo82OOIr4h11oWR6X/PODakwRim
         Y0b1yXKU0KrlWe31NLOJ3tqjFNEPrrpPUogNv2Wf2MSTipxzQXe+aSxD1PEo4okL8Ifd
         9SLRvBUi2glM4QEBqQXzkbS+TfgL1t/hzRe2YQkJWVv9O+syU8TL0WFdzZ9r78zsXhiW
         zrucPqD8RMyc7Ni2Vi1G+QK7EJlsSgL28M0wxok//7k9KVjPwHxt1l27cvjC/+96c2pH
         /bHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745299738; x=1745904538;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jka831lyyEn5TBrC/KjMd2fj+rwDsw1v7du1qQ7OLBI=;
        b=noYhF1BCroQWcAXKSSOWiAcL9t0jQ+u0NXqg0ie2wJvMuBUu6CwRw9DbM0W3jsoP0+
         NmWGyTp5uzEZg8lhkV/qpD09yIOaemJPNm4hJ5pbveQqO9ll/iomfnli96VQFxueVn+h
         6b6tNhAgzbUI0NnuKEY85Sa7zewXB411kbyo6+h++o2UdC3OF959yqrCiIjaxL0V25VV
         woBzoVfEf6MHvhpbfpWygudCouBP3g9uTiTfZwMnGW+fGAz29xSHFQrTaZdVn+TtXD40
         oxGg5aNPecR1c27cwqVva3MHW3r3tn6sXbp2WOUBHsmsVes1ho8DXrKi2Oxf76wm2pHA
         uCwA==
X-Forwarded-Encrypted: i=1; AJvYcCU/98W+PmM0kTrUZf0PXOXAvBtLpgsEF/ZWZ+iBKEo0tcT+/ZUgCHxVm630BYaPTLFOOmArAUcK3EUK439eOmA9x0M=@linaro.org, AJvYcCVY8hpGtj5FrWjeJp3OJBGiaVViy/pxRp06/x61HM8co/b+v9L38EzFVo3wIsmgoQAiuXBfw5UDtuKGpTP7@linaro.org, AJvYcCW3S7vIcL7eNmwntlOYHLuseCH5VqWQdvKiCGZb7Fyk3/I1Cskfp92PWkSZ/yUjs+/y4P+uRhX+VbcDrUFC+NRGZA==@linaro.org, AJvYcCXBBfz1SoT0xJ2nYiiWSWQagfF+Elf4ZgfwCLy9/IZSHSBf5ZXs+VI1g56rjebC4EAWZuvSn5aH@linaro.org
X-Gm-Message-State: AOJu0YzJ7XYecmZ53fghDz+BfChMNRcAGonu0EgODi/rHSrBUOEu9cqz
	MJxBh7JIUiCdj7xGPNJOeQfmZMq7l4uLImLD/egvl2buhkVeuXaznqT1T2zj
X-Gm-Gg: ASbGncsmD7eLY06QifLdhoGdxQseef/zwzREMxHyC5k/Yof9Y8aNJVeqmb5JXEluLoO
	1bAO3x1LzETBJE6jSx5kAtj/tCbGZfipffH3sc/hHeSpKy8+b/f7dLQvyAdeNfMlCntBLcNW7Kz
	HCqt/mOUexaeylI0aFzxzb1UE4TOj+qj5naaPafTWUJYOQcQLmnULipm7ECwwyhhkrwA5I0RgOJ
	vf+/zi+RP15pXpSQPd2ElWkqcHiRo2mlW/4FsQ8OQD9gRNozQv/775JV4vpgcbnXIQ3IKDjnsdg
	689hY1MTXCZk+1WTQJWuPkd2qpEyZ8R+P7kTgb508UC7ip095bFqJUF18Jc=
X-Google-Smtp-Source: AGHT+IGaXHMDzxoqNDfNho02Zs6s6BdUjSAFaf5W8QD0EenDq6q0h00TKwY1MjsG5jasjF+nnumjcQ==
X-Received: by 2002:a17:903:298d:b0:220:e392:c73 with SMTP id d9443c01a7336-22c535be3a0mr241851615ad.22.1745299737701;
        Mon, 21 Apr 2025 22:28:57 -0700 (PDT)
Return-Path: <ktokunaga.mail@gmail.com>
Received: from localhost.localdomain ([240d:1a:3b6:8b00:e142:4a4f:1ebb:3ca4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22c50eb4483sm75692085ad.118.2025.04.21.22.28.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Apr 2025 22:28:57 -0700 (PDT)
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
	Peter Xu <peterx@redhat.com>,
	David Hildenbrand <david@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Zhao Liu <zhao1.liu@intel.com>,
	Nicholas Piggin <npiggin@gmail.com>,
	Daniel Henrique Barboza <danielhb413@gmail.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Ilya Leoshkevich <iii@linux.ibm.com>,
	Stefan Hajnoczi <stefanha@redhat.com>,
	qemu-block@nongnu.org,
	qemu-arm@nongnu.org,
	qemu-ppc@nongnu.org,
	qemu-s390x@nongnu.org
Subject: [PATCH v2 07/20] hw/net/can: Fix type conflict of GLib function pointers
Date: Tue, 22 Apr 2025 14:27:11 +0900
Message-Id: <4d47a75c5768c9a6dc5d8b3504e78837577ad70d.1745295397.git.ktokunaga.mail@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1745295397.git.ktokunaga.mail@gmail.com>
References: <cover.1745295397.git.ktokunaga.mail@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: 5PQY5UPTxmaZ

On Emscripten, function pointer casts can result in runtime failures due to
strict function signature checks. This affects the use of g_list_sort and
g_slist_sort, which internally perform function pointer casts that are not
supported by Emscripten. To avoid these issues, g_list_sort_with_data and
g_slist_sort_with_data should be used instead, as they do not rely on
function pointer casting.

Signed-off-by: Kohei Tokunaga <ktokunaga.mail@gmail.com>
---
 hw/net/can/xlnx-versal-canfd.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

V2:
- Updated the commit message to explicitly explain that function pointer
  casts are performed internally by GLib.

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
