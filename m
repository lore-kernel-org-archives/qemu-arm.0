Received: by 2002:a05:693c:2909:b0:17e:9665:bf4c with SMTP id rk9csp1256610dyc;
        Fri, 4 Jul 2025 07:33:25 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXkdQfKDDkcycPoWMMgysHVmN9JwaIcb7g/wE/J9nVjleL5WoCGcp6HlrOuHAKbRZPULl1Ev6LDXRyZmA==@linaro.org
X-Google-Smtp-Source: AGHT+IGUVkWtJLKcKFgChJNBhM4u22XAoNk34jXN6sFD6qZs/R1WqDI5XFDkoQFEvyeQOfhoUjq8
X-Received: by 2002:a05:6122:c86:b0:531:3981:fdb9 with SMTP id 71dfb90a1353d-5347bf062bcmr1852783e0c.4.1751639604828;
        Fri, 04 Jul 2025 07:33:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1751639604; cv=none;
        d=google.com; s=arc-20240605;
        b=h6Q7yPfwTxkAXoe69Q5YTPT4XCImhY4e90I/hAXHu42Ni5SdrSvGBTpa0LYauNycHC
         G0HUvl8LnEJJg5U5NqLDaR/IWRyMM7pLbY381TPm4EM6aZwv9pgGXtDRJd0Q940pmwIC
         K0mUm8+b1Aw3VwT94hIP9/ytMRg77DJ3w48yIRD3uEDVeJQnDP/q4qOU749eTYFFujV5
         XmfP4+wxEXpOgEWG889th7myI/XSWc/ZznNDt/yb5F/BmJFTJI6QRhRPDfTWbaIesfih
         LMeqSW/jeR88elqPl0gi/ssm36uVZmSDDCN9baiLb8hJZvkl2W34Bo/eGEBR8Z4sjsSR
         +NhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=RMD+SlJ5VLnhq7YaYAJ7GNtxYCcTlcYxvxtAyCRLgqI=;
        fh=vZxkDpCwvhENXlY8qSqryGKuN7qdzoFpPjxnavaSuNI=;
        b=lRETFI7l7HguN3hYwO5RydptlBU9RQOjzXVRs2CUFhicgPbjByKhoulFqDkvTJvfyw
         Z8aO3b5oxtbt80ccJjhU9I1mc8OONpP9cJR+61d3UincdDeXV7YX0OQLV2UgWyOaT5yE
         NY05ptpHablCjGsq0LBcug1gh/KQ9l7MoizjXZePY673UhIUzXJjHW8fVk0De68+vzZL
         7ciEuTV6fLAeR/QMKe09CN/V0kTQAwj0af1tI/D64iJNJEhfQAZV8PiEpmomhpsvElo3
         /HlKKPEpihQQVZMBLq+9PS8Kzn15LA+nZca87fztlpgCvUcisVk5bEp0orYIhqFziERF
         H48A==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=w6qNUa4e;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 71dfb90a1353d-5347913965dsi573370e0c.205.2025.07.04.07.33.24
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 04 Jul 2025 07:33:24 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=w6qNUa4e;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1uXhR5-0005YN-6e; Fri, 04 Jul 2025 10:30:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1uXhLu-00047L-Vc
 for qemu-devel@nongnu.org; Fri, 04 Jul 2025 10:25:27 -0400
Received: from mail-oo1-xc29.google.com ([2607:f8b0:4864:20::c29])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1uXhLp-0007yg-FX
 for qemu-devel@nongnu.org; Fri, 04 Jul 2025 10:25:21 -0400
Received: by mail-oo1-xc29.google.com with SMTP id
 006d021491bc7-6113e68da82so515932eaf.1
 for <qemu-devel@nongnu.org>; Fri, 04 Jul 2025 07:25:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1751639115; x=1752243915; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=RMD+SlJ5VLnhq7YaYAJ7GNtxYCcTlcYxvxtAyCRLgqI=;
 b=w6qNUa4eSFR8tivRRqtZHWh6q+jC0EQQ534B4s5m5E5kgRZWQQXhTgH4JINW2VbsOz
 egChBJdwQGMB2aQBkxbdk7S7abDpOHjOAMSqOvTYoyHHhaUSyiyagOzIohfn9iMswYfm
 k/Rhw4ZULMZUsDiuAF5Js0mFv16O3YWVDiH95Ykt1p1nLihgoPVAbwcgcwpXabcJJbHq
 6GRAIBEzdn3K7eFAdFQ31jn0tJqfyyMpdCWW6zY6yvfOCyRllrqPXR6Br5XsZHRYZ27H
 xYvl9mwfNTDK1lEHlomkut1dE8cNrpvQjvXUKPhq6VdTWr1SA2TcyNci9sxPSYtY3AZj
 pKTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751639115; x=1752243915;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=RMD+SlJ5VLnhq7YaYAJ7GNtxYCcTlcYxvxtAyCRLgqI=;
 b=L3F/a4uKCWPTyNpBnMaxfBBpt8KFo/TnM5Tm3npGizw/Pq+FVxlf+qQPNYkbuWSm6n
 z2YSevpduICkSMTXj2jHcQW0jlvTZqjOzEsGNd2+4RrVd/sj8JV+6wCbGPfJp7H9eW3c
 w5hqaKsq4KzPclkDGLjH1rDVaKfZ5g9Aq67e01uc7MNpCbwA1JlI9wIvDbss0GswxMdW
 JLUeVrxYgGZUljayoYBhgE2udptiWABfP7zEVUOzzixXuWoPOz9CNa82Kez791Z/6FLL
 T+PYdzTyUyNIVxulwq2Fk6FgB9NapBBnQu+7rgWzniOO7xksx0Po0wF+t4DnyppW9wdu
 cN+g==
X-Gm-Message-State: AOJu0YzQiE2IW1eHuYyMxzJA+IXDQ0ggPAjcU0wZtCGp1Kzc8ayJ0g1I
 8yGj991jy6yTfd8OS2qcvjoPUcijPdHnPFid9rNhTJxnGw+XPe1zWNhP3oRHufs+2NvcUMBldnB
 g9mkcw/o=
X-Gm-Gg: ASbGncs/2m7hq23DB0DT/e+lUxslcGD9qHC0KaViEpFIS9ssIYb9JiQRCk+XjWVsBKp
 5Q89uQ63zKDj1/arSI+2iygQvra/M5SL/LoiMppsQrvI7H2Pi5HHaYmmbMvBiJbSuiblQhjomlH
 QBnVt4DrTydKv3GbyLRJMuTDO1CqF2p1h0J8coMFVWG8xYalj0CbvpA9rHWQfbC/0P5IhmxzJyb
 63BG0UsNubFegaYm4GtIncEl/Tn9eIG44CmzqSdRbB9aUslHdCKBN9S9fTiWCNmyBXzJVyy6D/5
 kXgGlhk9zBed4cpmXgt2jWaimp2+Tqx7VRQijEGyi0FmHrfzM88RYwgfgLsZ/goHzEdlZR7jZEO
 BvHbdanxiFEaBZMLMsECWyETzXyZPXUXiRcmK5bpNs9YVxc/d
X-Received: by 2002:a05:6820:2018:b0:611:7385:77a0 with SMTP id
 006d021491bc7-6139005ec2fmr1830608eaf.4.1751639115283; 
 Fri, 04 Jul 2025 07:25:15 -0700 (PDT)
Received: from localhost.localdomain (fixed-187-189-51-143.totalplay.net.
 [187.189.51.143]) by smtp.gmail.com with ESMTPSA id
 006d021491bc7-6138e5ac5eesm310233eaf.29.2025.07.04.07.25.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Jul 2025 07:25:14 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	peter.maydell@linaro.org
Subject: [PATCH v4 056/108] target/arm: Implement SME2 FRINTN, FRINTP, FRINTM,
 FRINTA
Date: Fri,  4 Jul 2025 08:20:19 -0600
Message-ID: <20250704142112.1018902-57-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250704142112.1018902-1-richard.henderson@linaro.org>
References: <20250704142112.1018902-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::c29;
 envelope-from=richard.henderson@linaro.org; helo=mail-oo1-xc29.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: 5XjcXoiKfz4i

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/tcg/translate-sme.c | 9 +++++++++
 target/arm/tcg/sme.decode      | 9 +++++++++
 2 files changed, 18 insertions(+)

diff --git a/target/arm/tcg/translate-sme.c b/target/arm/tcg/translate-sme.c
index dce3b56de2..4fbc61ae27 100644
--- a/target/arm/tcg/translate-sme.c
+++ b/target/arm/tcg/translate-sme.c
@@ -1375,3 +1375,12 @@ TRANS_FEAT(SCVTF, aa64_sme2, do_zz_fpst, a, 0,
            FPST_A64, gen_helper_sme2_scvtf)
 TRANS_FEAT(UCVTF, aa64_sme2, do_zz_fpst, a, 0,
            FPST_A64, gen_helper_sme2_ucvtf)
+
+TRANS_FEAT(FRINTN, aa64_sme2, do_zz_fpst, a, float_round_nearest_even,
+           FPST_A64, gen_helper_gvec_vrint_rm_s)
+TRANS_FEAT(FRINTP, aa64_sme2, do_zz_fpst, a, float_round_up,
+           FPST_A64, gen_helper_gvec_vrint_rm_s)
+TRANS_FEAT(FRINTM, aa64_sme2, do_zz_fpst, a, float_round_down,
+           FPST_A64, gen_helper_gvec_vrint_rm_s)
+TRANS_FEAT(FRINTA, aa64_sme2, do_zz_fpst, a, float_round_ties_away,
+           FPST_A64, gen_helper_gvec_vrint_rm_s)
diff --git a/target/arm/tcg/sme.decode b/target/arm/tcg/sme.decode
index 449d97bd28..9cc25622d4 100644
--- a/target/arm/tcg/sme.decode
+++ b/target/arm/tcg/sme.decode
@@ -751,3 +751,12 @@ SCVTF           11000001 001 00010 111000 ....0 ....0       @zz_2x2
 SCVTF           11000001 001 10010 111000 ...00 ...00       @zz_4x4
 UCVTF           11000001 001 00010 111000 ....1 ....0       @zz_2x2
 UCVTF           11000001 001 10010 111000 ...01 ...00       @zz_4x4
+
+FRINTN          11000001 101 01000 111000 ....0 ....0       @zz_2x2
+FRINTN          11000001 101 11000 111000 ...00 ...00       @zz_4x4
+FRINTP          11000001 101 01001 111000 ....0 ....0       @zz_2x2
+FRINTP          11000001 101 11001 111000 ...00 ...00       @zz_4x4
+FRINTM          11000001 101 01010 111000 ....0 ....0       @zz_2x2
+FRINTM          11000001 101 11010 111000 ...00 ...00       @zz_4x4
+FRINTA          11000001 101 01100 111000 ....0 ....0       @zz_2x2
+FRINTA          11000001 101 11100 111000 ...00 ...00       @zz_4x4
-- 
2.43.0

