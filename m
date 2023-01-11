Received: by 2002:a17:907:c68a:b0:84d:2074:29bb with SMTP id ue10csp3819925ejc;
        Wed, 11 Jan 2023 00:50:49 -0800 (PST)
X-Google-Smtp-Source: AMrXdXtKlM3+Ih2fs3mnQ5zQ2WM66DPDknw1HE0nyj1SwvE7KEklqLSoi4VD8AUuEQf8axFbKCcf
X-Received: by 2002:a05:6214:1021:b0:4df:2bdc:14e1 with SMTP id k1-20020a056214102100b004df2bdc14e1mr105050090qvr.47.1673427048818;
        Wed, 11 Jan 2023 00:50:48 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1673427048; cv=none;
        d=google.com; s=arc-20160816;
        b=qxULg0iOfRtOqLLKyfAKy6P6lTcGIqNI9L6znKjLyQBPPM75w4AXGEz6agMYwVo5Wc
         /mAbjpLz2ZHS8vuv06SR1uUVKkQPqx3vP/VBFatAuxncRwbdaqc4ZO4MBIpMIO5c+ome
         /KVVCvs7ypsbI6qOfq9/o58X0U8A1WNbBaMscuO0P9DtfKPokLcclmxyNfc8Zhw7zCev
         cf02sK+oS2HvhsXKjSMlqxsRO52V5ijRtZKwIaJQeY5fatlM1My+92ynSgYILv9MVHLi
         xQIkaoHNbZLVf4w/8RAj16pwZ7UvaqVBCAlKx3OGCPZePnzQL1O2IZ2MYn6ufVw2CaxE
         ChHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=mT+LWt01/sleIbh0MDOTvrE02y2MJEW1VXEk+avLKDA=;
        b=fSSWg5AZ8HagJeCxhlG0Cg1aCg8YnB8vVKnR/rJmYYF4/ap1kYpmw6vACk0pnVevIm
         fUzhSu6J8y4lG/3CNrVrAXexnGxz4+uj3glvNAOPJpH0qHChwtJPQuz3wAvdxZX/0e2a
         wosnU7/3LZsRtql1WhFnTOmMTr0qo1VWPd5IfDf8WNR2uxm2pqLsy4XN3TrYSkw3cjv6
         IyJpJgePfhjrPQphLbF5j2AUcji8JLJ4QLA54YhVJjmQ7vyoIlJJfiXVOd4LuIyeEU2Y
         VxASFRdUTFtFAPMVJoC6hdmSxkHLj2PZT+GpBtTbsStC+dHEQptlHuOU+4W14pBm9xZG
         C1Xw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=x2s+qJAl;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id r6-20020ad45766000000b004bb6b995982si7849973qvx.581.2023.01.11.00.50.48
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 11 Jan 2023 00:50:48 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=x2s+qJAl;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pFWoW-0003AN-Hf; Wed, 11 Jan 2023 03:50:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pFWoP-000364-W5
 for qemu-arm@nongnu.org; Wed, 11 Jan 2023 03:50:22 -0500
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pFWoN-0007Zc-Qv
 for qemu-arm@nongnu.org; Wed, 11 Jan 2023 03:50:21 -0500
Received: by mail-wm1-x329.google.com with SMTP id
 k26-20020a05600c1c9a00b003d972646a7dso13790870wms.5
 for <qemu-arm@nongnu.org>; Wed, 11 Jan 2023 00:50:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=mT+LWt01/sleIbh0MDOTvrE02y2MJEW1VXEk+avLKDA=;
 b=x2s+qJAlrhg+yHrXRGGRBWjDq/nLh5awC5PjogaxNASQjMgZtNrCUEsl4t7lIgzF9F
 +dTEwmDS+8mrFlfuo/gDBBZ2c9jSuvyFwK1Go6G/Zck7kHq6XWuyPMYIL1lYCi7ZyfRs
 F6n9CCooSKo2uuI9WPnQOixNgDL0KDSduaRv28mlQQos2mSVv9WOkcUHL9MWQYSvbmJW
 swShtN2dDBHdDYe7EfL53SgVtALZLQKK1uidJwelI4b7fkYJFWr90J9ApbINvyD5Vds2
 IhRQSW90VQ3Go3GJWjcnM5QCZ2mXk8mGl9e1lMHXLq3ktBC+pgd3c43Xu3CxSXjz5dtR
 zbTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=mT+LWt01/sleIbh0MDOTvrE02y2MJEW1VXEk+avLKDA=;
 b=hjoGvJh1+h8sjEbc9fuPN8uJ9+Tm5cHjatXZD7S/AgZbmuqk+DW4D/sc5e5TJuR1fh
 UuEDm1/U8zjmKOhxQvk7j7OMgyxJaR7BISI7AcyyUCD7jq5fjLV0UR9CHDMAHIDdMfD8
 edSU17NfIFl1ZbF765pR+e/G6vdf726oIhSBB8lMDm1aVX5dzwWXqrXt2TFEf/vLcjG5
 w2JJkbdsVVqtG9+LXgZJNT0VBxUXrsGfPshp93ZSEh6Xs8YN90T2SCA2iAowepG8Wteo
 kjwewUy5OSNKvv0ChNXyh/XIR3TfUL/O2ISFzlEFtmmLi51WZfcs4lGWWRdsq1SNMEQ7
 4yzA==
X-Gm-Message-State: AFqh2krr1EhfxjE4oevl2yXMaBP7ZJVjW2+2uc00rWm8VANwqjt2G6io
 x01bvShkVVMEIsWn2IVj7fqFmA==
X-Received: by 2002:a05:600c:19d1:b0:3d9:ea0a:19c5 with SMTP id
 u17-20020a05600c19d100b003d9ea0a19c5mr9697883wmq.38.1673427018104; 
 Wed, 11 Jan 2023 00:50:18 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 u21-20020a7bc055000000b003d9aa76dc6asm26107920wmc.0.2023.01.11.00.50.17
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 11 Jan 2023 00:50:17 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Thomas Huth <thuth@redhat.com>, Jan Kiszka <jan.kiszka@web.de>,
 qemu-trivial@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v3 0/5] hw/i2c/bitbang_i2c: Housekeeping
Date: Wed, 11 Jan 2023 09:50:11 +0100
Message-Id: <20230111085016.44551-1-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x329.google.com
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
X-TUID: YHRRVRez4kum

Series fully reviewed.

Since v2:
- Use array of const pointers to const (Richard)

Since v1:
- Fixed overwritten RECEIVING_BIT7 entry (Richard)
- Picked R-b tags

- Remove unused dummy MemoryRegion
- Convert DPRINTF() to using trace events

(series used as base for follow-up, better if merged via ARM tree)

Philippe Mathieu-Daudé (5):
  hw/i2c/bitbang_i2c: Define TYPE_GPIO_I2C in public header
  hw/i2c/bitbang_i2c: Remove unused dummy MemoryRegion
  hw/i2c/bitbang_i2c: Change state calling bitbang_i2c_set_state()
    helper
  hw/i2c/bitbang_i2c: Trace state changes
  hw/i2c/bitbang_i2c: Convert DPRINTF() to trace events

 hw/arm/musicpal.c            |  3 +-
 hw/i2c/bitbang_i2c.c         | 80 ++++++++++++++++++++++--------------
 hw/i2c/trace-events          |  7 ++++
 include/hw/i2c/bitbang_i2c.h |  2 +
 4 files changed, 61 insertions(+), 31 deletions(-)

-- 
2.38.1

