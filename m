Received: by 2002:ac2:5bdb:0:0:0:0:0 with SMTP id u27csp316188lfn;
        Sun, 24 Oct 2021 09:18:00 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzyYz/94zTigj/ZUfd65QZ814dZ7YON5oBtDwSuRJKuewPtyNs4EpUIVELsg4yfL1Fs8/VG
X-Received: by 2002:a9d:c47:: with SMTP id 65mr9546146otr.232.1635092280130;
        Sun, 24 Oct 2021 09:18:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1635092280; cv=none;
        d=google.com; s=arc-20160816;
        b=r/f15y9Q8Qyj/RIC7rSuRVsmmOIxIQWwG3zwBdUAIbxT1lQziFOteTIGGwzJLf3xyT
         V0iRYu7IS6JkwdcBu4A0GBJdbMxlmAYJDjNavapx5PU78E66IDniKqMRsYp0MMOFhdeH
         aGrjd/pp8MNKmkZHl0Tn2RQ2fBqVb+gR0itGfzjgb8j8oATnR6NRizAHSATea2kKZ2qd
         5jQ4zt1Wb5R8b0eKLI+Z+1UwM5td6ZS9RsvTns6pbSyBEx7jcWQXkeMjdu3VvFZGXbxy
         NiGrIELJmNAw3VHEQZ5tpqpSplWeZbAXlF2KTN3BDGZ/aJXJ57rXksMTJcBvubIn9mFs
         pF3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from:dkim-signature;
        bh=BV+RBki8nYw8tZRRuwWX2/XovH6xzi86Kkg/m5is14M=;
        b=VvWnz4ES1NB5j8/a8nKvq/G+tQUPnRR6iQpf5DYfJ3TftWWF+y3G24RvewhKrDbtOd
         LrtcJbyA9jUI7PUvSNN/qOrlt0dpYcWPeNtDUvuylgpb5JsDyHFp9EZv3crS0j9bSfHe
         yqJNPD3HtR+T4NSbiIMxfz0oy1dPyzCCgRJp3T30O1DMgj3kdg7JFB0DpHVYY0fkrhFQ
         06vG//u2HE2CA8RRd14SqUVdp+Tr0+ALAhR74LLvoH0XS9udCYDjfz2oqTkOgyQqmeue
         DLHPBsWOEnT4lTVHvDK+ZWPOZU+l5OyHRzVggsAqk96qyPLJ+lFsWQ1MbRIPU5KI94Dx
         ySCA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20210112 header.b=D5ItYW8M;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d2si14481077oia.268.2021.10.24.09.17.59
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 24 Oct 2021 09:18:00 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20210112 header.b=D5ItYW8M;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:50706 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1megC7-00082l-AI
	for alex.bennee@linaro.org; Sun, 24 Oct 2021 12:17:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45642)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1megAc-0005eS-K8; Sun, 24 Oct 2021 12:16:26 -0400
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c]:43871)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1megAa-000838-An; Sun, 24 Oct 2021 12:16:26 -0400
Received: by mail-wr1-x42c.google.com with SMTP id p14so2105961wrd.10;
 Sun, 24 Oct 2021 09:16:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=BV+RBki8nYw8tZRRuwWX2/XovH6xzi86Kkg/m5is14M=;
 b=D5ItYW8MoT8IYnpho4TmYhjaf0py69t6Gf0TRJQCgOS9aeKH5SxPkQtzJfh+1ZLd9v
 F/9RFtzRLFLOVaVzSNrTj8eNnE7l64aOM2ca1ivEIamN3zm7UuDjAdhSlTCf3VwUinUI
 eLydNZFSeusW3E0mVn/pVIBNVf+ekSvXS2hNkySFxV18s33jZzm9tQPfkDGZpsbihq9O
 dE6OsdUwQRNrVUb1NP1IlJh9sR0F1RHMEwFBsbd0VHUv7oZyziWdFZsbNEd2NaYuA/ZH
 UyI5MjRCHQFyK1Wkj2sBCiXXIjNuSBv0YNvQAyVa361uTN8MQ44iN5+a5dSnW1I2aHOr
 RFPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=BV+RBki8nYw8tZRRuwWX2/XovH6xzi86Kkg/m5is14M=;
 b=2gh4o3qQtwhUl4h6xCAlKBlRzQXg2qwxUj+1ikA9D8uQVuAC7RPIN1ZOpbYXBFknVE
 HCvLkUwuexBSfffjiuP0jYpucmBfk4J5cjAEBtR0z5ekyWTL7hsz0GjrbLDI/mP7fSH5
 k8pb1yadYYNBSP77bAk1Jne49FCrv94soEEwz363ymkwjWvgQFAPYk7EVdI5cofVL+Ve
 J0f2t8XIk6iFs/eYGI3TraucMUcEw2zz19UT3aSAXTkrMWtlRvxWwKGSb3BsybKEk+Nz
 RdYHhELe9V3ExlMkD1eJ0rDekWqONm4jQL2Bh+1GYL6FfEh28Ut0rvrpVp8MNV0xpYq3
 o92A==
X-Gm-Message-State: AOAM531LcBf/2BdMFlUgXkCVRCSZRkCGVPF1MADX8EcV4j4MhfzqlZ8t
 4DU3IkFdkMBT7ZcRYaMJCBcVWh2XopM=
X-Received: by 2002:a5d:64aa:: with SMTP id m10mr16631831wrp.196.1635092181861; 
 Sun, 24 Oct 2021 09:16:21 -0700 (PDT)
Received: from x1w.. (62.red-83-57-168.dynamicip.rima-tde.net. [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id
 h1sm13365540wmb.7.2021.10.24.09.16.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 24 Oct 2021 09:16:21 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/4] target/alpha,arm,ppc: More uses of tcg_constant()
Date: Sun, 24 Oct 2021 18:16:15 +0200
Message-Id: <20211024161619.325903-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42c.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>, Greg Kurz <groug@kaod.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: c3KUfRcKlzE8

Few more cases where we can use tcg_constant().=0D
=0D
Philippe Mathieu-Daud=C3=A9 (4):=0D
  target/alpha: Use tcg_constant_i64() in gen_call_pal()=0D
  target/arm: Use tcg_constant_i64() in do_sat_addsub_64()=0D
  target/ppc: Use tcg_constant_tl() in gen_op_cmp()=0D
  target/ppc: Use tcg_constant_i32() in gen_ld/st()=0D
=0D
 target/alpha/translate.c   |  9 +++------=0D
 target/arm/translate-sve.c | 17 ++++++++--------=0D
 target/ppc/translate.c     | 40 ++++++++++++++++----------------------=0D
 3 files changed, 28 insertions(+), 38 deletions(-)=0D
=0D
-- =0D
2.31.1=0D
=0D
