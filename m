Received: by 2002:ac2:4c03:0:0:0:0:0 with SMTP id t3csp673893lfq;
        Fri, 15 Jan 2021 14:49:02 -0800 (PST)
X-Google-Smtp-Source: ABdhPJy06jhEAK25Kbf5ML/LwB3Kruh5t4k0l312I/d/6xUZD/2Gl2pvYugFfs4iRmO7YngfGnXN
X-Received: by 2002:a25:a125:: with SMTP id z34mr15630573ybh.22.1610750942840;
        Fri, 15 Jan 2021 14:49:02 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1610750942; cv=none;
        d=google.com; s=arc-20160816;
        b=n+Ad33WOSlo/aE6wF4mhWB9fgcqa7EXUJLZFTYXr2TrxwVIYl8F5IdK996Qb5uglHK
         8/WlKcxQ6TQq/v5HCSuinrHaQCUW8mlPSg4YKBPU29pSeOGNokrtWmCuGhddyZB1cYPn
         CXSUL7B3mmum2fNkWVbExEjf3oHx0pOAQNAdIEabBkwXAFlPIv8JM8VDkGbIv9mVdZjf
         GCdiSKXgFA0FJ93osqSBNPLoq0ysIjHDofzOTeqkf+hRpU4Q7klqhJGSdreMgAQlvgoi
         iFcs7by3RH06sFMyV/Nqf9Q6Psoo6gNkV7yRvAJLEG8ICG+l7+iY+HwkPGKzih9CkKTk
         ZoOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=Kyzjq96nH0KWrOiii6echH6ofV70lplGMBMMhcVo2Uo=;
        b=NUTFm4KAnJ3Ph+2aRYlBZ4jKWG8vg2uGm00/GMPKfbgsRZpCAdlebRpwGEthGxcWU6
         5jHhggR0RQMhUVhsVw5+KAd28+cXCfbvQvEvagvyqsUd/HsUQ0rYLxDyu/DZqG9n+vFL
         acaQSDs9Zt7Z9a42YNbbWAprt4lZtVeL7bF6dnCF6E3cLRW2IOZhdcBqS+b1w6VYTIk6
         6BbgUOqOvNKi/6ajl2W5VIt+T3w1GMEuZPfzpvMkeHNBkOetQlaYDDXfG9VzCCZS9C0K
         +Sn4jkVTjJnQxClhMAATN3RV9uSKyalYv81PMkbrzRnPVd5yt112V+r6L6nnWh3uTzzB
         tBKg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=NZ6mpl9g;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d14si8436628ybj.19.2021.01.15.14.49.02
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 15 Jan 2021 14:49:02 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=NZ6mpl9g;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:51214 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1l0Xtu-0004BC-3y
	for alex.bennee@linaro.org; Fri, 15 Jan 2021 17:49:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53490)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l0Xrr-0003Vq-Sc
 for qemu-devel@nongnu.org; Fri, 15 Jan 2021 17:46:56 -0500
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031]:51024)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l0Xrp-0005Bb-Fj
 for qemu-devel@nongnu.org; Fri, 15 Jan 2021 17:46:55 -0500
Received: by mail-pj1-x1031.google.com with SMTP id md11so5895553pjb.0
 for <qemu-devel@nongnu.org>; Fri, 15 Jan 2021 14:46:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Kyzjq96nH0KWrOiii6echH6ofV70lplGMBMMhcVo2Uo=;
 b=NZ6mpl9ggtqxYOyKpx6AdJI2gAJf/R0znj6EoKUUuG9paOIxhpcg7T4sB1yAWe/V7Z
 IoUtTj8vvt2RTaVTsybm0o7IDQZcx0nKTs8oPVac9c4UW0dIZqqCKo5u9KBILg1Fvz5j
 uZkoLbN7RGAbn0umx2kmhRdVdByPHJURB91sIt74Js+4/uZS0RmeN6KZWXItCJ9f2eWQ
 s09YPG7CPAwFMW44echC5/bzf9e1izzo/1+XojkzBTzu/8nu121jLUHyHG+s6SwevA0K
 wxQBYmkwzxIcbwud1/2nHRHh+eMFATw5Ads8Q0NLm3EjC1X2qTQjpv2IakiTH2jIFJzO
 UrEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Kyzjq96nH0KWrOiii6echH6ofV70lplGMBMMhcVo2Uo=;
 b=Dae+DrssnoLxUS3+198kNIXIdF4/Wi7zDDw3qz5uwCdOdFv2aoCdlzqqxTJDrEqxDf
 mpMLPOhJo+GS0a5AaMuAboxXoQY/tkQWd5zM+JFslKv4hii/fouw0g2g3IU4upMlX+0y
 kOpzh4NFGbz4do9wOt9tEodQPvfYoY5EFUjSFcyDStozGguYKibxKBfkvSKzzSgkdhEA
 RlOFZ7jOrAJnb2Oa1fjjlxyRX9RDTdl3Y1FSQpqSssqHE9fV/ttYzHWsEMaK0cbUyb/H
 1g4h1cWNixqdXS8PyIT5RwdWAFxb1fXo8kR+B0Em9usi3ycmmbwffGWKCfOWUoJFQVKo
 z+5g==
X-Gm-Message-State: AOAM530D3F3nY/4RH/sMePli+sr1PrQ7rOyAAHC38cCZhSr9HTMf0kXw
 2o1/UfqeoH0Bb1QJ4iuEQ8IFEs4F2Hc/D8y0
X-Received: by 2002:a17:902:8642:b029:de:2bf1:b061 with SMTP id
 y2-20020a1709028642b02900de2bf1b061mr14643592plt.10.1610750812180; 
 Fri, 15 Jan 2021 14:46:52 -0800 (PST)
Received: from localhost.localdomain (rrcs-173-197-107-21.west.biz.rr.com.
 [173.197.107.21])
 by smtp.gmail.com with ESMTPSA id s13sm9521700pfd.99.2021.01.15.14.46.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Jan 2021 14:46:51 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 02/21] linux-user: Introduce PAGE_ANON
Date: Fri, 15 Jan 2021 12:46:26 -1000
Message-Id: <20210115224645.1196742-3-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210115224645.1196742-1-richard.henderson@linaro.org>
References: <20210115224645.1196742-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1031;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1031.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: SgEnWY7OaZjU

Record whether the backing page is anonymous, or if it has file
backing.  This will allow us to get close to the Linux AArch64
ABI for MTE, which allows tag memory only on ram-backed VMAs.

The real ABI allows tag memory on files, when those files are
on ram-backed filesystems, such as tmpfs.  We will not be able
to implement that in QEMU linux-user.

Thankfully, anonymous memory for malloc arenas is the primary
consumer of this feature, so this restricted version should
still be of use.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/exec/cpu-all.h | 2 ++
 linux-user/mmap.c      | 3 +++
 2 files changed, 5 insertions(+)

diff --git a/include/exec/cpu-all.h b/include/exec/cpu-all.h
index 99a09ee137..c23c77589b 100644
--- a/include/exec/cpu-all.h
+++ b/include/exec/cpu-all.h
@@ -275,6 +275,8 @@ extern intptr_t qemu_host_page_mask;
 #define PAGE_WRITE_INV 0x0020
 /* For use with page_set_flags: page is being replaced; target_data cleared. */
 #define PAGE_RESET     0x0040
+/* For linux-user, indicates that the page is MAP_ANON. */
+#define PAGE_ANON      0x0080
 
 #if defined(CONFIG_BSD) && defined(CONFIG_USER_ONLY)
 /* FIXME: Code that sets/uses this is broken and needs to go away.  */
diff --git a/linux-user/mmap.c b/linux-user/mmap.c
index c693505b60..7fb4c628e1 100644
--- a/linux-user/mmap.c
+++ b/linux-user/mmap.c
@@ -599,6 +599,9 @@ abi_long target_mmap(abi_ulong start, abi_ulong len, int target_prot,
         }
     }
  the_end1:
+    if (flags & MAP_ANONYMOUS) {
+        page_flags |= PAGE_ANON;
+    }
     page_flags |= PAGE_RESET;
     page_set_flags(start, start + len, page_flags);
  the_end:
-- 
2.25.1

