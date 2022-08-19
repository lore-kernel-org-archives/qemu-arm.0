Received: by 2002:a17:906:3b11:0:0:0:0 with SMTP id g17csp901767ejf;
        Fri, 19 Aug 2022 04:12:40 -0700 (PDT)
X-Google-Smtp-Source: AA6agR7amCN3fD0nr0XIrRJ8HiWP8kfK7Tg6w5qYvHM34hol7LJ9tBhqrrn/aTiNhmLHVW6+MVp2
X-Received: by 2002:ac8:4e45:0:b0:343:5faf:3af6 with SMTP id e5-20020ac84e45000000b003435faf3af6mr6055873qtw.340.1660907559981;
        Fri, 19 Aug 2022 04:12:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1660907559; cv=none;
        d=google.com; s=arc-20160816;
        b=IGPAl8bPL6rtZ7GBNQ6mv5IoyUhYAHSK2Vjq6kUdr5ZaODGDVWP3Vhhsf1XH+3yo3e
         skRjW2NXh4D8VSSZq/pXjO5adMXYnfj+k/ciiYmFKZG3SMfXuoqyQ3u9Tdg94X3hoCwd
         Gai/6285uqyAvn6Nt/5lU4zzc5NW5M7GZKu8fGeb5TIwOyg69Z8PRf2Y9ICuBftvY3Fg
         ff/LNHgslzc0vsyKuuOv0NdYMNCHiOaxVxMVXD/OcAS9lV6hnhXguEjV/3eWprXKgSYD
         Xkjzqy191S8i16e9iImf9Dt9Oc3NVeibPuHyqB1NH3c6WEDYPBTChf1Qw1U65k9SeGrG
         5CQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=uhwJFdO0H01eXY5Lyz7NeMke3RGgO/dYgfglq68Auzw=;
        b=aL42mYiKIDsRGPqqVCWdZ+E1WISP8sRMgDDwNM133dHxtczIsfhLodKnXXG6AvR3Rt
         IlVXdoC+BdH8v1V3++gtdrnjHH1o3KwJxbZAGRiOBSJ2wF4Z+MgVjr+HvS4zTARKQ+R7
         knX9Ohla8lykIW7AoAn7YRDMumV54pnXKjcwtR91Sx2r3XjhDS8pTRuzdYZGm7KdWXtt
         caOFheZUz6lQUN4TBxDRufooh5jVkta+Wce3omDyTurKN2vQ2dvkiT9KD9lkFVCLWHIT
         jiS3ZLNzXOamF5krTTD+4GPhRrsdtP3N6QfpZYNJ6hIQTjcHSji2s3wKw1RRUuMtr/pl
         mDHw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=p27WeET1;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id z5-20020ae9f445000000b006bb53224bc4si1829769qkl.641.2022.08.19.04.12.39
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 19 Aug 2022 04:12:39 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=p27WeET1;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:55868 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1oOzvb-0000Lx-8p
	for alex.bennee@linaro.org; Fri, 19 Aug 2022 07:12:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37560)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oOzkQ-0002Do-BT
 for qemu-arm@nongnu.org; Fri, 19 Aug 2022 07:01:09 -0400
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431]:40704)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oOzkK-0001R3-MZ
 for qemu-arm@nongnu.org; Fri, 19 Aug 2022 07:01:06 -0400
Received: by mail-wr1-x431.google.com with SMTP id h5so3950935wru.7
 for <qemu-arm@nongnu.org>; Fri, 19 Aug 2022 04:01:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc;
 bh=uhwJFdO0H01eXY5Lyz7NeMke3RGgO/dYgfglq68Auzw=;
 b=p27WeET1DkKXn2Bq+I2168oF6apMA9lHbKtx3bWHy6TRh73UzFg5iVi6VQr/Fu6twg
 HgS13tHxpG93O/QOPYrffE7GA8P6iLp7Umrp0kKqY7PA653fJI+DAfVTfxIu7jfIqmBV
 GTS1UMZDDpji1DAkKQpGdf3OZ7y/rJZ96dQ6XLPGtWfw58Wbha+u6Qjw285F90/hNDxS
 2vIF2JnD7j62xTXLjF6ZE5SM6cb7ONY24WtIz1eWjUqOebrT2fiHCt69RLW4iWO3/wqC
 6Iew9xd04A7QdJF7AJufNOoPpk1ig5zx/Otmr1fAz8KP3scU7govT1jPQ0cIjIKvQN3z
 8XNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc;
 bh=uhwJFdO0H01eXY5Lyz7NeMke3RGgO/dYgfglq68Auzw=;
 b=TdMJJPZpACjvzuyv8K/cgO9sDDrD6/D7pUhgBy+HXKxZpLJ1epJj9/ZRAuMsciGx9V
 YPGsNU6HzHCbNY3YCZ7Nm4DPUY0qJHvvCMv5mIQfvbKVQT6TuNPVFUPuyH+HE+N/BuOr
 PSBTjzFsQBTpiyycoXsJbuzWR5Oa9huBP/Iajr+XLxo8tjW/QwiXezRe40R82J++Qv08
 unXdA4L8L4zi45Gz0rwRqZXZvdYIwgErDdGaWkHazfDXATvt44l8mEDyW/Rwzym6YO4C
 KV5iYiwTXcXFuukTxwiS7UH4ntIHPAbozomCtoT8RBcisbZukFKywhKsbIKCz4wa/DHr
 NGxA==
X-Gm-Message-State: ACgBeo1+qjTb8vf+xDaBGfIGItOVih+nKTMHn1ar9QGsYwQkXmI0jRde
 FFQNhm+zBB3KiqHE+rap7f5qTKB38PXCog==
X-Received: by 2002:a5d:5a82:0:b0:224:f744:1799 with SMTP id
 bp2-20020a5d5a82000000b00224f7441799mr3839724wrb.582.1660906859067; 
 Fri, 19 Aug 2022 04:00:59 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 p22-20020a7bcc96000000b003a52969e89csm8154985wma.4.2022.08.19.04.00.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Aug 2022 04:00:58 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 6/6] target/arm: Add missing space in comment
Date: Fri, 19 Aug 2022 12:00:52 +0100
Message-Id: <20220819110052.2942289-7-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220819110052.2942289-1-peter.maydell@linaro.org>
References: <20220819110052.2942289-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x431.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: wEATzGHWB7fp

Fix a missing space before a comment terminator.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/cpu_tcg.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/arm/cpu_tcg.c b/target/arm/cpu_tcg.c
index f63f8cdd954..b714c61d940 100644
--- a/target/arm/cpu_tcg.c
+++ b/target/arm/cpu_tcg.c
@@ -64,7 +64,7 @@ void aa32_max_features(ARMCPU *cpu)
     t = FIELD_DP32(t, ID_MMFR4, HPDS, 1);         /* FEAT_AA32HPD */
     t = FIELD_DP32(t, ID_MMFR4, AC2, 1);          /* ACTLR2, HACTLR2 */
     t = FIELD_DP32(t, ID_MMFR4, CNP, 1);          /* FEAT_TTCNP */
-    t = FIELD_DP32(t, ID_MMFR4, XNX, 1);          /* FEAT_XNX*/
+    t = FIELD_DP32(t, ID_MMFR4, XNX, 1);          /* FEAT_XNX */
     cpu->isar.id_mmfr4 = t;
 
     t = cpu->isar.id_mmfr5;
-- 
2.25.1

