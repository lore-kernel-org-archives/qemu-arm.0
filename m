Received: by 2002:a17:907:2723:b0:a5a:9152:cbdc with SMTP id d3csp708680ejl;
        Wed, 15 May 2024 07:59:52 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCW3ovBy4GfTliDjKyueLQRFPs/2k9JhWc1odHk9vFvu9MjiLvkeh3/genncbaiVYn2KYNFFa8f8ihNcimpF8LptdOn7F1Rw
X-Google-Smtp-Source: AGHT+IHMbsKDW4KV74WU9itvstJc53j6uQD2ADLFIGhfR6zQQNk3W2Cpf9yQXPEjUSlMj8PevTy8
X-Received: by 2002:a05:6102:3746:b0:47c:37e4:9143 with SMTP id ada2fe7eead31-48077de550amr13813283137.11.1715785191316;
        Wed, 15 May 2024 07:59:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1715785191; cv=none;
        d=google.com; s=arc-20160816;
        b=0A4cFqQq7/+2Ba3ibfTvz54GCvBZ+xFfY8qgVI+QnRYJMSphcobPwASopqm+l2zLRp
         nWJg7k/OH2Yy2VXwkFqgcCtsPKHfZIqrEkQN2+dYuDzG7u17OHR7nVQmZ7klalEgN7OT
         C3uo4773My/I+bb2QN1JWAnm6U8OVclNcvVcKst71ykTGJpyOYZWGyB4Uvolb9aWJaXH
         a8f3I+Zgq8LsgvW859CAZiZ0XjmBlzFI43XWqKDo09xBCeVsoARpgNhkpmTpk7m7cQUq
         wpj2rEt856tO1cFnrw5Grziezcgazd2Lx7tdWjy1T4Yo1lqEMxr/jMiza8Ig40X88s1Q
         lePQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=Ty7BmC8B8GeFcYZSk01dT7MdrNLqF8VJeahlXLQms/o=;
        fh=9Ev+QBUhk6P6vR3LT1wYeDLexozsz44nqjfoyPajZCc=;
        b=ej1yegbPwXLa26Pax4TmS9HTxEBKh7fhj5lJkEUT5u8pJrzNcCWq7aTQLmrux6MPYR
         vkbNHuyZFvnC+DOMCesZrGHccCahT0JDeVFNKvGT64UJd3qgePojt7Jx1Xq2S/eEZj5C
         2di0vH9L3mgKswD3LFkjw5XJu6PGCKbEIAp9YPV7Ug5Cl5ckWcosrUaF7bF1sm7q7A4r
         quV/tGBTbmn8UkUEUei1N/ZxKoQvhYk2zWfMaLhdL9wKNXO4lMWTZN0o3IO3XZ8xlNRB
         l5xMfNfXOlbZ7kPL9qNI2eb8tIXndOTrpRqkMPK6B9rU5n24MRAdJtxLbzQY2N02sLE9
         yNvA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=bOrHcBEO;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-43df549b6a5si147944951cf.135.2024.05.15.07.59.51
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 15 May 2024 07:59:51 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=bOrHcBEO;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1s7G61-0005CI-Eq; Wed, 15 May 2024 10:59:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1s7G60-0005Bq-7y
 for qemu-arm@nongnu.org; Wed, 15 May 2024 10:59:08 -0400
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1s7G5w-00075R-Vn
 for qemu-arm@nongnu.org; Wed, 15 May 2024 10:59:07 -0400
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-41fc5645bb1so49275305e9.1
 for <qemu-arm@nongnu.org>; Wed, 15 May 2024 07:59:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1715785142; x=1716389942; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Ty7BmC8B8GeFcYZSk01dT7MdrNLqF8VJeahlXLQms/o=;
 b=bOrHcBEOpkJPYXRagNH7SvQuuDVIb6RvZ0XVsYzNxF1ENpYLBSv70aJ2YQ4hNsKmmD
 cGm7beBpWB8HsL4PmO315nIQf8ILehzdKuUu5MkGadCjcbPtTD2t2nynJeT22RoEApcU
 /eZmJe6KXP+YGG/FRGsZ0ZBRYgZuOqVNqkMZljDXaU8NXYT04k3gA7s1llWNW7EJzhTp
 7h0iRatggPMZu4/VkuftwwHgyZ7wNsh6resskSDlOl7byfhXANPmwgedMQPjeifzXQUp
 XL8F8ARMcTp/VV1kG/HeUAJ+NCRbr51rHvRz6cloaRTkUhOLnNHdoyv2Yi37hQmqStmo
 zHpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1715785142; x=1716389942;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Ty7BmC8B8GeFcYZSk01dT7MdrNLqF8VJeahlXLQms/o=;
 b=Te3UmQlMXngSjdghbO/WEh5vMt2ZS4OxZ3c+jjGRHoPjKIq+VWZuW9Uh9ZxTz/+ceB
 K9Hn1W+TCXRzj2dsr8JNsFTKoBu7S9VnRzgVqcHI7lonN3PhISfig8KxfD5tufMbewXl
 5vTypNLoVsNR4cU+c2BimgoZ4/I2KmWFYfhHNLjuvBX9BCYixW/ALzjSly/tIBwysX/J
 UiNgGLtFWfP6dSvKNeQDPZnYSYS8kHGOZJ+qS0QilbqSmUIS3KytH1U3tdM118nACQ8f
 u5xtpiH07hs4OEb4eowoumBfiHolR6fBhdGjB+c6rnytkpQ5rOMzk5tK1gH+QeZh5W7y
 WiNg==
X-Gm-Message-State: AOJu0YzJaJm/UtSKVp1snfqCJLwU3FTpyynI2e31hUk/sOUPI0SSkuTq
 ucIniPPMb6q2WtBNN47ddPpxX/hByJ4+kDiZ2vQ8WY1xrhIq/16LfxIuOzJhxSI=
X-Received: by 2002:a05:600c:190c:b0:41f:e10f:889a with SMTP id
 5b1f17b1804b1-41fea93a0d7mr106339995e9.7.1715785141759; 
 Wed, 15 May 2024 07:59:01 -0700 (PDT)
Received: from stoup.. ([149.14.240.163]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-41f88111033sm272134645e9.34.2024.05.15.07.59.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 May 2024 07:59:01 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 0/5] tcg: Support TCG_COND_TST* for vectors
Date: Wed, 15 May 2024 16:58:55 +0200
Message-Id: <20240515145900.252870-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x32d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: 4qDQpwfwCFvu

It would be weird if some TCG_COND_* codes are supported
in only restricted cases.  Let's go ahead and fill this out.

Based-on: 20240506010403.6204-1-richard.henderson@linaro.org
("[PATCH 00/57] target/arm: Convert a64 advsimd to decodetree (part 1)")

I will inject the target/arm patch as 45.5 in the above,
and route the rest through tcg-next.


r~


Richard Henderson (4):
  tcg: Introduce TCG_TARGET_HAS_tst_vec
  tcg: Expand TCG_COND_TST* if not TCG_TARGET_HAS_tst_vec
  tcg/aarch64: Support TCG_TARGET_HAS_tst_vec
  tcg/arm: Support TCG_TARGET_HAS_tst_vec
  target/arm: Use TCG_COND_TSTNE in gen_cmtst_vec

 include/tcg/tcg.h            |  1 +
 tcg/aarch64/tcg-target.h     |  1 +
 tcg/arm/tcg-target.h         |  1 +
 tcg/i386/tcg-target.h        |  1 +
 tcg/loongarch64/tcg-target.h |  1 +
 tcg/ppc/tcg-target.h         |  1 +
 tcg/s390x/tcg-target.h       |  1 +
 tcg/tcg-op-vec.c             | 18 ++++++++++++++++++
 tcg/aarch64/tcg-target.c.inc | 26 ++++++++++++++++++++++++--
 tcg/arm/tcg-target.c.inc     | 23 ++++++++++++++++++++---
 10 files changed, 69 insertions(+), 5 deletions(-)

-- 
2.34.1

