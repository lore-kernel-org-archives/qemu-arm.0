Received: by 2002:a17:504:3f1b:b0:1be9:327d:8ee3 with SMTP id x27csp614886njk;
        Tue, 16 Jul 2024 23:09:55 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVDxc34472i2VvSrjbiIvv+jnXPGlfRXXxAbv4chNPH9yVQKUgLyl66kKCilwBnZOmBOF33O3Mk0Zwof4v4ZFcWf6xz8r5Z
X-Google-Smtp-Source: AGHT+IFmNx3Y/q0uuVSS/pyHRq95MGkwoUDDmd5OImO481+5bOC9tYKufF2JNudOmUO+BItKeGdb
X-Received: by 2002:a05:6214:258f:b0:6b5:e403:43ee with SMTP id 6a1803df08f44-6b78e35c71amr10851396d6.50.1721196595173;
        Tue, 16 Jul 2024 23:09:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1721196595; cv=none;
        d=google.com; s=arc-20160816;
        b=VsDXnQxy+nZnx7IahBS5KderC6yK2nCaxIrXpiku51jGuwuS97/c5BNqxbgIS97mRi
         wP+fFjjku5jP7wjoy4UI+2cl/GD6diZ1wQUrzMQ4WMQdWWSfJdw52vUYvi+vtcRlWGdb
         fjXfHxt8rEa++pGIS6MTzfqtttY+qNCxeoBRCW2ePgEXhwSrWSVvBoSV9TE2xDte+cdl
         qErBS8HCyemkXIJynyq+D4CzH6FCw5Sz4AsN2CYIweyPuCPg9mGHhDnb/1KaBo0xi3uQ
         8BZwbZUDhlqN5JGytCNc6XtXtfvaGTXDkOu2YwOpDJzdPg2U82aasBJN6raHGkD2Y+05
         wdpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=nGeC9BqibeOCSkqo/96qzTdc5e22rYcjirQRxXS7nrw=;
        fh=9Ev+QBUhk6P6vR3LT1wYeDLexozsz44nqjfoyPajZCc=;
        b=uIcTTzglNziOpQ8H59Nc7swioGa9xJ+fU4uGfrY+m+xba6Xdh1zWFVq9WbdDWUhjAA
         eaTuP6DXDq5kXikJXWmb9F5KJREUVm9dHG3NPHaAzEEh5PrX3Agw6bLtjMC8LFEXW8WK
         nwHcVaTaXpEcCsP1jKcdhneGoz0HXZ6hFrmq5uc8e6EXBzcZ7XFvD4da+RreEH6JssYt
         patcwzBN7W/7S2zxkObWJLfEBnxhE6B+CcotdxjF1q2SH9NmfsAHI6nXNBqOvGslAZR/
         Pq1kUBfLLdOdOZ98CDbSp1BV0HyZ2UBM96ydZD8/tE4kCZyFTpSHex9YflffU2Jb3kqo
         peUQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=YPzuAN1Q;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-44f5b82f4bdsi94238201cf.698.2024.07.16.23.09.55
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 16 Jul 2024 23:09:55 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=YPzuAN1Q;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sTxqn-0003am-0l; Wed, 17 Jul 2024 02:09:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1sTxqk-0003Z8-Us
 for qemu-arm@nongnu.org; Wed, 17 Jul 2024 02:09:15 -0400
Received: from mail-oa1-x32.google.com ([2001:4860:4864:20::32])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1sTxqj-0002zn-7b
 for qemu-arm@nongnu.org; Wed, 17 Jul 2024 02:09:14 -0400
Received: by mail-oa1-x32.google.com with SMTP id
 586e51a60fabf-25e397c51b2so3323687fac.3
 for <qemu-arm@nongnu.org>; Tue, 16 Jul 2024 23:09:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1721196551; x=1721801351; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=nGeC9BqibeOCSkqo/96qzTdc5e22rYcjirQRxXS7nrw=;
 b=YPzuAN1Qj5I1TQ7MzH6CbQo1CER6MgTKkoetpgO/S866biPwDjFxjm1TvNEDm2Hdta
 AjmFykxyzVByIvDpZUK4n1XPK9w8HmGbc4cjI1OJ3pcD7ccF0DPc4OWnn7jLB+V1mG4p
 IseN3i5Q4jXLnQa7yluLRlR4ImXX7w+UGMuBygi3WfQlRIzu/WCmFer23qfKrYUzoPnR
 l/UfDR6ZbbWmPd/ulsTfQ199OeMvgGD11MJLSfItP33/bbBtYXEblb6osX4KR+/I7fJk
 rx2Zirb4iy//CNB8hUgptcSxVl3LEDEJdFGXpNA7vnql63T13rznhWrlN7wk/1XH8jh2
 pzBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721196551; x=1721801351;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=nGeC9BqibeOCSkqo/96qzTdc5e22rYcjirQRxXS7nrw=;
 b=okc4QuApc2UVOSMrug0N7KK5B8TH9N3OIqggiBbX9+nBtm/npo8ZtJFrl2m+uaOvpp
 xn63fB53A3EFvsfoDc79nie7CR01ANuKhs6bRpzqowX4yfwqlQXMgeJ9k53fhbJWsy/S
 xMcbFJuWmM61du4Y2z9/8OAdORU2T73JnPn9DzfW1q6ZZI7nuCSifMKO7GVG2wvLVVjy
 Hb7b9VUDWBzDlbMR7R7D7NOMyDJNjBp/fVD9ZTHZ7FHVWEb59xT7UnEhgckkjALFK/vj
 RNKjtOxK/zJumpml1LSIoWjEl7rkQ9mSCBBEK0DmUWqeNw73QFj2LivOi0rNOITbB/ry
 PkIg==
X-Gm-Message-State: AOJu0YwH8xBvysJPuXwRouzesPU1dvq1+fPiZDRgZTaXuseVNqR9HjyL
 ECmnD91qxiVQgvEXDb2A+0F+/IK8KX1VAeU+mrt/SRZiKIEMXetZXHqCTe7amto=
X-Received: by 2002:a05:6870:3046:b0:25e:c7b:ca96 with SMTP id
 586e51a60fabf-260d9144d62mr594913fac.10.1721196551001; 
 Tue, 16 Jul 2024 23:09:11 -0700 (PDT)
Received: from stoup.. ([203.56.128.103]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-70b7ecd603bsm7330404b3a.219.2024.07.16.23.09.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Jul 2024 23:09:10 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 00/17] target/arm: AdvSIMD decodetree conversion, part 4
Date: Wed, 17 Jul 2024 16:08:46 +1000
Message-ID: <20240717060903.205098-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::32;
 envelope-from=richard.henderson@linaro.org; helo=mail-oa1-x32.google.com
X-Spam_score_int: 12
X-Spam_score: 1.2
X-Spam_bar: +
X-Spam_report: (1.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_SBL_CSS=3.335, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
X-TUID: c9GTZM/zwZLU

Flush before the queue gets too big.
Also, there's a bug fix in patch 14.

r~

Richard Henderson (17):
  target/arm: Use tcg_gen_extract2_i64 for EXT
  target/arm: Convert EXT to decodetree
  target/arm: Convert TBL, TBX to decodetree
  target/arm: Convert UZP, TRN, ZIP to decodetree
  target/arm: Simplify do_reduction_op
  target/arm: Convert ADDV, *ADDLV, *MAXV, *MINV to decodetree
  target/arm: Convert FMAXNMV, FMINNMV, FMAXV, FMINV to decodetree
  target/arm: Convert FMOVI (scalar, immediate) to decodetree
  target/arm: Convert MOVI, FMOV, ORR, BIC (vector immediate) to
    decodetree
  target/arm: Introduce gen_gvec_sshr, gen_gvec_ushr
  target/arm: Fix whitespace near gen_srshr64_i64
  target/arm: Convert handle_vec_simd_shri to decodetree
  target/arm: Convet handle_vec_simd_shli to decodetree
  target/arm: Clear high SVE elements in handle_vec_simd_wshli
  target/arm: Use {,s}extract in handle_vec_simd_wshli
  target/arm: Convert SSHLL, USHLL to decodetree
  target/arm: Push tcg_rnd into handle_shri_with_rndacc

 target/arm/tcg/translate.h      |    5 +
 target/arm/tcg/gengvec.c        |   21 +-
 target/arm/tcg/translate-a64.c  | 1123 +++++++++++--------------------
 target/arm/tcg/translate-neon.c |   25 +-
 target/arm/tcg/a64.decode       |   87 +++
 5 files changed, 520 insertions(+), 741 deletions(-)

-- 
2.43.0

