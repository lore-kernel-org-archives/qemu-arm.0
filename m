Received: by 2002:a19:690d:0:0:0:0:0 with SMTP id e13csp1331081lfc;
        Wed, 10 Feb 2021 06:21:17 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyMWU1ED46BGLeDLT4Sr0cYqxjqUeOQWdiqewvDT2GkDgWPBlFtgpvfjdcuuouaoR+a4PpA
X-Received: by 2002:a5b:5c1:: with SMTP id w1mr4353890ybp.177.1612966877423;
        Wed, 10 Feb 2021 06:21:17 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1612966877; cv=none;
        d=google.com; s=arc-20160816;
        b=lpAAiZ8Qd1Wukg/BEIxn2wPWEl2kwTtc1nFQQzpLNgYVVqvZZKAVrEajwYjC5sNYmv
         JvRTpONiXo2IVtlMiuj7y7De7jdZapPpDn1YmWRfFj791XQYSjdI09Ll7llmJGvEYlZp
         Q2lu6XEtEaTfRJkvcZvRB65LdtUF/G6ZL2BfategWQ0J5sZ855poLfSwgW2HAJDUe51s
         cMneq4f6ZllLH/3niEeSJIy5iM3F321BZeQMF7qX8xXcfj/Acwc6VFvfvNANED2VNRdC
         0YpReawPZayR5g8OIbA2PShlfF9yOhlWs7gnggJoZLgJHUWIpYMeeGdDGe89pBbKFJ95
         KLbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from:dkim-signature;
        bh=u/DdGZsZIGWVIzVRPCh+Uk463K1NvqWsggymDZTzsGc=;
        b=A6R0sfxXyhVuTX99sOeVeb7zWfvTBAmwQPUW/jj92foNkouWGsoz3LO5+StSw9im9T
         V4CIdLoKWFqsVJrNOp0kbeXby534K3DepDtfZ+Yqe1b/0ErgA7HQhmAks/ObIVie4KrO
         p/SHBWLTSHK/2gz+kT+HExhwa5xZXRtn43x8xxSTkYhoiF5LmJeM5QCrzcY6FqzZeskU
         cwhGt0XFnB4SHqcNTLaa40tK+wz6mRr+QHNaCH/Ol9nWFN8SGikcV6kasXB5b0XbKPwe
         0lvJl5//s+DR+P+yxo9oJcvERUwnqpJpJKHxhPUpHrRlYuQxeRmAVqS0Vir7WRm1l+0T
         jfOQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=uXYjAdON;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l131si2314862ybc.456.2021.02.10.06.21.17
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 10 Feb 2021 06:21:17 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=uXYjAdON;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:60342 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1l9qMm-0003MK-OQ
	for alex.bennee@linaro.org; Wed, 10 Feb 2021 09:21:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39154)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <edgar.iglesias@gmail.com>)
 id 1l9qMP-0003M5-CS; Wed, 10 Feb 2021 09:20:53 -0500
Received: from mail-lj1-x22a.google.com ([2a00:1450:4864:20::22a]:42172)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <edgar.iglesias@gmail.com>)
 id 1l9qMO-000626-1R; Wed, 10 Feb 2021 09:20:53 -0500
Received: by mail-lj1-x22a.google.com with SMTP id c18so3030863ljd.9;
 Wed, 10 Feb 2021 06:20:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=u/DdGZsZIGWVIzVRPCh+Uk463K1NvqWsggymDZTzsGc=;
 b=uXYjAdONT4UBKfdaeZIX+g25yW/+SFnV8MWlzoYDiVNvEo8hriByWiE3LJgs6Fhw+i
 w95oQtvfP+8XA8ClgktX6+bsvz3C20LXBetmY9Z1SHzEYd89W3y+k5UfuwUQcXNTf4A+
 vqgF/HJStAEnBN8VFcRiNWTV6sRUZ6PaHsFLISDwfNUK1FjoZKBgSSMfhCUsvfZUBYOk
 ZopQcsK1FC8fzbIpf65E8vCyqDq8iXr5oK26h2g3oXsoRWQXCZknIDS9/AG6ABAw2Wp+
 iD7ElpjrhjxTr/ZWSIoiiqw/kC5iMk0mN9bu9wjtEOUELlh5mtDxAPTflvyGEWjuT1TF
 ulug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=u/DdGZsZIGWVIzVRPCh+Uk463K1NvqWsggymDZTzsGc=;
 b=edBQ1yCOXV+qlmVGQdr4ZN+kBJZm6GbfNDxD/SePOQFSM4QYgo0JO1GV1ZuXKzHJhA
 48vDoCEp9fnKNJcZQpKst4s99zGtdC9wgEn3IKL8abVrSwq73ZcQL5CBmAgWSQ4Jnf4N
 L6XYpY+VLjzmiMAS9Zhxd+iPaDvOYPinaq/6xGBme45+1tLzcqgWwOkc1ECdhlHbNcEW
 Iys8vEdBH470eCrnxrPy3JNA1ZLLjQ4R9fTYUIeFbqT9h3gmS+jjpW6mu4FassojfkY/
 cR2lSS3vlrCxBF3QXho49Zt/AFGqvudTl2b841pBQQxfT/x9ac5NiBbsLuVYvnbzFZQH
 jYgg==
X-Gm-Message-State: AOAM532rMuIKniS4Juo43d6xaPsgGPAJf7J4EfOiPiLUFUyl/uLc4O3W
 0q42x3NM8XqaOXMS4doHfZdMsL/fqRsBfA==
X-Received: by 2002:a2e:b0f3:: with SMTP id h19mr2009974ljl.233.1612966849851; 
 Wed, 10 Feb 2021 06:20:49 -0800 (PST)
Received: from gmail.com (81-231-232-130-no39.tbcn.telia.com. [81.231.232.130])
 by smtp.gmail.com with ESMTPSA id v28sm502589ljv.66.2021.02.10.06.20.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Feb 2021 06:20:49 -0800 (PST)
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v1 0/1] hw/arm: versal: Use nr_apu_cpus in favor of hard
 coding 2
Date: Wed, 10 Feb 2021 15:20:47 +0100
Message-Id: <20210210142048.3125878-1-edgar.iglesias@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::22a;
 envelope-from=edgar.iglesias@gmail.com; helo=mail-lj1-x22a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: figlesia@xilinx.com, peter.maydell@linaro.org, sstabellini@kernel.org,
 edgar.iglesias@xilinx.com, sai.pavan.boddu@xilinx.com,
 frasse.iglesias@gmail.com, alistair@alistair23.me,
 richard.henderson@linaro.org, frederic.konrad@adacore.com, qemu-arm@nongnu.org,
 komlodi@xilinx.com, philmd@redhat.com, luc.michel@greensocs.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: OuqWviyijICX

From: "Edgar E. Iglesias" <edgar.iglesias@xilinx.com>

This is a minor clean-up making it a little easier to play around
with different CPU configurations.

Cheers,
Edgar

Edgar E. Iglesias (1):
  hw/arm: versal: Use nr_apu_cpus in favor of hard coding 2

 hw/arm/xlnx-versal.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

-- 
2.25.1

