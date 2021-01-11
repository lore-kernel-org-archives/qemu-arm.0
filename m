Received: by 2002:ac2:4c03:0:0:0:0:0 with SMTP id t3csp3061120lfq;
        Mon, 11 Jan 2021 15:11:33 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzyTyX9D8nODCQR+gzHV0yLBHVn+2aKwa3H78DiIcr7dsAZT/snNOwKL6Hl90K8QHk+25Af
X-Received: by 2002:a25:6585:: with SMTP id z127mr2919647ybb.473.1610406693163;
        Mon, 11 Jan 2021 15:11:33 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1610406693; cv=none;
        d=google.com; s=arc-20160816;
        b=aKHrZQeHkoM97CeiDoMu/tLWrDgLa2cbkvECsLP8qdS1kPV4oT/cVfl0rRb+cqPWmU
         B5v1pwhV7S0vrJnbBHQo1bAVg3W8utbvINq2+Hg11WQahz7Lqc4jYNt4qgvhuVz/brle
         NTtQ++iSpuOAkXrnNWqiKhY4LakeUFOS+8+5hiawgnRmm6i4zykq2PQzkecPp5W+/2Jn
         KrrzqW3HqntP++mChUtreOQocr4mF7pNR2LQTSF6I3Yk+yTnLi/Pw6J1mttmEWeiYbCx
         mPFiXE+9yGPQ6ZtDqfcoMHQ2Epxpnx4K5NgHNXDMEf307mW0n0xngFH7KIfR34kd9JxX
         AykA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from:dkim-signature;
        bh=UWP41LldK9nkC6LBfZA8LR7R7rGfju6ns2oORRKgk08=;
        b=JD2H2thja5f0f5nqtBTk1o0nJZZI4ZquQIz+rGItLPbU07NZ4st2YB6Wf/2yp0BeOl
         BeB7zfbkOKY3bn90dCjPqFY/YPHEuHTtdM8R1CfGNhe+bR8mlxjCjvpBNj7ns+IdtJNn
         w8sMb+tu8Eo85UtWp+PG1DC6C7tU/n3FUUNH7Sq7t6QzJvkA8tgwv9qu5Dv1jH179Tp7
         1mH+dLNTqSm2Vx/MW2umieogsinaFyBEm5hnNxzhPjVrNy6x5o02fnCD9w/vnnpspST6
         T1yoZ7IMPZVTYRSopRbTctb9jbvbdI/9TiPOvN24+JuwU8mMnNuAexTPMhoMu/30EEtV
         CgxQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=FSLNrW1K;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x63si1079863ybh.326.2021.01.11.15.11.33
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 11 Jan 2021 15:11:33 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=FSLNrW1K;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:45024 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kz6LU-0004cc-Fy
	for alex.bennee@linaro.org; Mon, 11 Jan 2021 18:11:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51006)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kz6LF-0004bH-Ep
 for qemu-arm@nongnu.org; Mon, 11 Jan 2021 18:11:17 -0500
Received: from mail-pg1-x530.google.com ([2607:f8b0:4864:20::530]:41172)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kz6LC-0006Bx-24
 for qemu-arm@nongnu.org; Mon, 11 Jan 2021 18:11:17 -0500
Received: by mail-pg1-x530.google.com with SMTP id i7so153837pgc.8
 for <qemu-arm@nongnu.org>; Mon, 11 Jan 2021 15:11:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=UWP41LldK9nkC6LBfZA8LR7R7rGfju6ns2oORRKgk08=;
 b=FSLNrW1Kgta0djg85U/FyKXbFjN1eJBZqUBL/OF2GFGzjnuXsw5ttqXM+yYZhEJ3d3
 zb402Nl1fh/heIol+wy3iYvHc+4lWzBIlIC6Kq17zIiTJX2s+7381D+ZXreD6SK/t0AO
 7cBRQBt2tV/1k+72kUItZjpfvlvzfdx2rW8vNJYwCCQ/WFNK8+T1641q5TY2Q9BoeXxw
 P9a7pj5dR+MKBSoOlrgDU4UKCK9+xyTQmN5LcT/8nmuzILBs9fBHVWbCj/keKuevNn65
 yHGW23UHlrGLnFIyHRBwDvTim4p8LdjVGJfpjpXZFtWub6vUC9UbceOuljwqopx5mh5s
 U43w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=UWP41LldK9nkC6LBfZA8LR7R7rGfju6ns2oORRKgk08=;
 b=WT8BZgoXQKUm7tP5q/ZrO2GUwss1uLWMOi5ufJMHK11CZx3JM1b/6HDgJpnUkUs+Z1
 2k1UrQ2weY0+ZwNuAJEQ5w+6XgMM4YkLSmQ3ksj/IZNhyOBK/3qMLTaN/ouzgKoG9MTj
 q+TeautD0sY2TnkuC8BIKZ65dYTDdHTOuCuJ4bWgD3gPfilUl99Eg3EfhP8ZT2luulHj
 SoLLIoAHYlx4w1EkFDwn0op+FjoQqz22nmLzA3NncNoxMHI3X/BmmQFo+zXtGIyzHqj9
 4+3l+NNGPreazKUZXbsnVi3ebAlAnSCfTRAJLyj3/7jUjiCLw6YYB11hy3ZzN06GZp21
 oCxA==
X-Gm-Message-State: AOAM531sPXlae0D1kusuMhWV6FNzZ0oN1mgzl7TIxeOZKJU41GwsM//i
 bq2cmgLedzMyM+kyyf3oA9kdMw==
X-Received: by 2002:a63:4e44:: with SMTP id o4mr1774714pgl.46.1610406671500;
 Mon, 11 Jan 2021 15:11:11 -0800 (PST)
Received: from localhost.localdomain (rrcs-173-197-107-21.west.biz.rr.com.
 [173.197.107.21])
 by smtp.gmail.com with ESMTPSA id g202sm658105pfb.196.2021.01.11.15.11.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Jan 2021 15:11:10 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v6 0/3] target/arm: Implement an IMPDEF pauth algorithm
Date: Mon, 11 Jan 2021 13:11:05 -1000
Message-Id: <20210111231108.461088-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::530;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x530.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: diYXCOzmpa6+

The architected pauth algorithm is quite slow without
hardware support, and boot times for kernels that enable
use of the feature have been significantly impacted.

Version 6 changes:
  * Rearrange xxhash64 (pmm).
  * Add documentation (pmm).


r~


Richard Henderson (3):
  target/arm: Implement an IMPDEF pauth algorithm
  target/arm: Add cpu properties to control pauth
  target/arm: Use object_property_add_bool for "sve" property

 docs/system/arm/cpu-features.rst | 21 +++++++
 include/qemu/xxhash.h            | 98 ++++++++++++++++++++++++++++++++
 target/arm/cpu.h                 | 25 ++++++--
 target/arm/cpu.c                 | 13 +++++
 target/arm/cpu64.c               | 64 +++++++++++++++------
 target/arm/monitor.c             |  3 +-
 target/arm/pauth_helper.c        | 27 +++++++--
 tests/qtest/arm-cpu-features.c   | 13 +++++
 8 files changed, 236 insertions(+), 28 deletions(-)

-- 
2.25.1

