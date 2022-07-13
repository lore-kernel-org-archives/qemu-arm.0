Received: by 2002:ac2:596f:0:0:0:0:0 with SMTP id h15csp20631lfp;
        Tue, 12 Jul 2022 21:59:21 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1uIwXRx5zl+QEkk57dpotnkGyjdwMfnYY0ppOaQi1E8MKDygFaANkcmdNKdnimCiqJDgLtG
X-Received: by 2002:ad4:5bce:0:b0:473:9233:e898 with SMTP id t14-20020ad45bce000000b004739233e898mr1002753qvt.107.1657688361619;
        Tue, 12 Jul 2022 21:59:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1657688361; cv=none;
        d=google.com; s=arc-20160816;
        b=mAQ/svbLpUoC7ImNzihe+TGfXu9h0NpX8dM8ySWxkxKhikT/tDGLp3BtZ/mofVGgP+
         wBReACuIzRXMxt2kWqA0a22B9L5HCQP96KeJYBTSuGhMuV/ecRyWYDUFkaSXaLgg+o98
         PA2lHV9pYwTD9+D3zaYr6eTtX7cv8qAfCvWImXwXXR5lhha2IUzSf1mS97gNcUr1CGMp
         qxaXB2a5tKq8ekO9Lpq54yJJOI1xMAZdFcuS5rmULI7ZcLKj4nS5i23CVKR8fjfKjn+2
         y3h2SaXvCfausz8HBuWX7GtYuJ6gh3jNYKk5V3xYqrsGV7sIAd476GnDnJkc0q2m4mXn
         sW+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=QHtaGb+0bceVj4ZA4UdjMCU/5EVY5lNfh75m/ENra58=;
        b=Py0ueYsdfcK+ydBCBIwPAaRyqFeXiBiunPRWt7In12GT+22hp8Vr9fib55UghjNC5y
         0H15+FIKWIJgaGWwpPk4mIFgYnYDJG+XeqyBpVRE79JfZwAjOKj44gb1mhC7IeTxYT5S
         qQbfadc6GCS+uxqHrv3PedUJ/z/o62OW45ox4+0ko0HhTML7bSIauzXz7wVm4y6MCA9p
         fstsbxNtRLexZ84Uc97SN/68vNV9tfM1nM1aqe/qogAGa/TF/6WTR26F2i0t5RpwdzC5
         Q213vA+NrF9Fk9zf1FbtD7ISEdUsJcOnhV+9Wm641Zxc9tWroTtrMhkkoUNIteS2GnNt
         4YIQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="Q6D6H/i4";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c2-20020ac80082000000b0031bef908883si6794329qtg.752.2022.07.12.21.59.21
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 12 Jul 2022 21:59:21 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="Q6D6H/i4";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:45306 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1oBUT1-0000wi-RM
	for alex.bennee@linaro.org; Wed, 13 Jul 2022 00:59:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54512)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oBUSh-0000wR-6H
 for qemu-arm@nongnu.org; Wed, 13 Jul 2022 00:58:59 -0400
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032]:55208)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oBUSf-0006qW-I8
 for qemu-arm@nongnu.org; Wed, 13 Jul 2022 00:58:58 -0400
Received: by mail-pj1-x1032.google.com with SMTP id s21so10407458pjq.4
 for <qemu-arm@nongnu.org>; Tue, 12 Jul 2022 21:58:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=QHtaGb+0bceVj4ZA4UdjMCU/5EVY5lNfh75m/ENra58=;
 b=Q6D6H/i4M8lN458NExEdCt5K7DQ/Br+xfz0c4/U0ifLNSLF++9Hf0x24wQMycXy4+u
 4GwPWXsBSmAMH65ZN9WHCgTiLdv0mqwvdAI3Y8YnKy944/J5a2y8iZXd0BPYh+P+jZLz
 jWd6+Tt47GHZ33Nj+tVWVvWugrHWbQ3242BFlY+1OYyaGHF7lF0qDGWTnHoBtxfiMHXR
 Eg/mNwLo/mnxs0ntFXA8dgURlZTZP9ZIhB417spWDKvmm75kVYXG6Pcaa2dDIBR5mqIa
 4r91iO5APVUZhbHX1jSK9w8oCD/5PY/V8iLjzZtzpQ1y5zy2n8WL/AuwpKmJaUJhK59i
 qUAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=QHtaGb+0bceVj4ZA4UdjMCU/5EVY5lNfh75m/ENra58=;
 b=6Z4yosIwgEyo4xOUrcoOwLNn4zgWzjKGgqRF8RMUTnrYp7CTojaLHqrY33+YXxfHZm
 lUM82R5DBCqcD80kaUhvojqRx35ny6paLUGz+SyFqzWwvqsVpiMg56tsr5YJwbM6mHCj
 f70Msld/+ww5j5WUlJqy9rTS2bJzIEyElXyQoLfG94T7bri3fV9w6DaDPDShM+Y8jKVu
 IM35TGEajLsdIVjERCBfbirmPfq5X1wQork5T4Ojj5uATT7/CGcbxz2o4nNE8v1pQCdP
 Oh4bK0yih7KToSlbGwfLCqxIESGbqo4vWIgNyvdka7kWJf/eiFzSZ/hXyHxnfFenXmOJ
 i40A==
X-Gm-Message-State: AJIora9UG3huyCZSA/2/wsBZfq1VzBGpvpMt4UjtUgwgee3DkOAOLV/j
 nITsLVd5fgXU0231C8FNXCNuhQ==
X-Received: by 2002:a17:90b:1bc8:b0:1f0:5854:f761 with SMTP id
 oa8-20020a17090b1bc800b001f05854f761mr1860660pjb.116.1657688335409; 
 Tue, 12 Jul 2022 21:58:55 -0700 (PDT)
Received: from stoup.. ([122.255.60.245]) by smtp.gmail.com with ESMTPSA id
 d194-20020a621dcb000000b00525302fe9c4sm7677047pfd.190.2022.07.12.21.58.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Jul 2022 21:58:54 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: broonie@kernel.org,
	qemu-arm@nongnu.org
Subject: [PATCH 0/2] target/arm: Two SME fixes
Date: Wed, 13 Jul 2022 10:28:46 +0530
Message-Id: <20220713045848.217364-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1032;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1032.google.com
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
X-TUID: lsX9vvkLRMfl

Ho hum.  Let a feature loose on users and they find bugs.  Mark noticed
that the wrong value was being picked up for VL when SVE is disabled.
I had run the same test but failed to notice the vector length wasn't
as expected, though the test otherwise produced expected results.


r~


Richard Henderson (2):
  target/arm: Fill in VL for tbflags when SME enabled and SVE disabled
  target/arm: Fix aarch64_sve_change_el for SME

 target/arm/helper.c | 41 +++++++++++++++++++++++++++++++++--------
 1 file changed, 33 insertions(+), 8 deletions(-)

-- 
2.34.1

