Received: by 2002:a17:906:779e:b0:94e:fe67:1757 with SMTP id s30csp724493ejm;
        Sat, 15 Apr 2023 06:07:28 -0700 (PDT)
X-Google-Smtp-Source: AKy350YgmDGJSX/JKPJFD4FHqxZk3SNdcShGFK5/W/9K43rikOG9QQaIdp+DTKVXEe3HPgdfkohH
X-Received: by 2002:a05:6214:1bcb:b0:5eb:fc42:ea4f with SMTP id m11-20020a0562141bcb00b005ebfc42ea4fmr8957581qvc.33.1681564047900;
        Sat, 15 Apr 2023 06:07:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1681564047; cv=none;
        d=google.com; s=arc-20160816;
        b=tKqRsp4CPTzLPiCXTUZiG94dVf6rOGezTVW7NLc6s8oLqeBMd2A3Dr1KhWH5Om8Se5
         0YBnbukWMinHV9uHs2ilmZ12WPCE2pUBnUUhNCa8Jlg3Ju7ERIlQ2RJgEROioeu1OkR4
         jqY7W/UAAfdTKMeyV7NvWWXoybQD3NjBv23RocP7dZtBhsU0MigJet1czFG/u55A15Mb
         tpW9SCwIKaF6Jw48/Idq2yLgRTujCTSQjAkycoFpvhL+JhdrsHT0FKggDzCy+wyHrSEX
         tV/qyvNFGnkwg/ui9Sx7GbAXZ9ztmUBK4JsniFvm5FPTdqLrQ+VktKFywRmM8ZN6ZlnU
         wBZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=g1HqqdsU8QGo+uHG2HueOCnsD690FsxOJF7ks09llGo=;
        b=Itns8veVQovkGo3LOdzcnNIOSnxhh3Pu32zzxAJ3eo5KUG+jM5ajnC2XK5LzNIZcMF
         lZ+9ehfbXEbxwmKCgysWETG8B5OcA3yLQTITmhuPeUANQlrLQKvtHwwaowkjWXOe4Gxa
         9LcGVPT0pYEk1znIROVBSCBklSVAUqzyoX38Ex4ofoBZd0KvlrQ8cVggJUArIwi3oK/5
         JccVsQKwxyUm3XyQL8IH90Ao6lKkfGQNQDOau/8KU9PT2dO/lr6bJb2SJEpIwSGutnSo
         bXb3IbGRuTiVGi/HBkoeRARhlLPPCfQLitWs2JNXBuz3TTE0HdM5hO21GOSKmZ8pwiI2
         e4mg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=fQVLxNHN;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=kernel.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p2-20020a05621421e200b005ef52dd990fsi2937124qvj.497.2023.04.15.06.07.27
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 15 Apr 2023 06:07:27 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=fQVLxNHN;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=kernel.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pnfcS-0004o3-EP; Sat, 15 Apr 2023 09:07:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jszhang@kernel.org>)
 id 1pnbRU-000521-T6; Sat, 15 Apr 2023 04:39:32 -0400
Received: from dfw.source.kernel.org ([139.178.84.217])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jszhang@kernel.org>)
 id 1pnbRT-0000tr-1l; Sat, 15 Apr 2023 04:39:32 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 5D2AD60DBB;
 Sat, 15 Apr 2023 08:39:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 123E3C4339B;
 Sat, 15 Apr 2023 08:39:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1681547961;
 bh=eWQIR4pDjW5W0LBVxz11mFgQNASZOEMMkzX3EPueH38=;
 h=From:To:Cc:Subject:Date:From;
 b=fQVLxNHNRcYpNxvRDVGM9juvvOWl6Heb7LKUC0p01D2nXAoGFPj5CLiruxO9Xt0Vg
 A+q6476a/X75kQXzSNt82zBtJIQix8QDHaRDJUumAvsTDd2MmzYNGETsm8mthEHvFY
 66Bm6966i+BIH874LDO7p8ap+qgQa5kh6ZqK0ZNzc79GYLJk6HJfQMsPYx0GECKiDd
 9BZWkt2a+qQh4I+55K08M6gsYntx+boqDPIZHpWitcrPDiQ+5QAvzv1oX0pKXCunAy
 oBcZvo/TJjzKMF1tKvL0a1RJiwqeQd7N8RMbq/UaoP9EHscNPlLRF6KZmWe98r331u
 Y1yfEDSn4XTfg==
From: Jisheng Zhang <jszhang@kernel.org>
To: Peter Maydell <peer.maydell@linaro.org>
Cc: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 0/2] Remove CBAR from A55/A76 and add A78
Date: Sat, 15 Apr 2023 16:28:25 +0800
Message-Id: <20230415082827.2054-1-jszhang@kernel.org>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=139.178.84.217; envelope-from=jszhang@kernel.org;
 helo=dfw.source.kernel.org
X-Spam_score_int: -70
X-Spam_score: -7.1
X-Spam_bar: -------
X-Spam_report: (-7.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_HI=-5, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Sat, 15 Apr 2023 09:06:55 -0400
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
X-TUID: vOFyy2Ac8/xS

patch1 removes CBAR from A55 and A76
patch2 adds A78 CPU

Jisheng Zhang (2):
  target/arm: Remove ARM_FEATURE_CBAR_RO from A55 and A76
  target/arm: Add Cortex-A78 CPU

 docs/system/arm/virt.rst |  1 +
 hw/arm/virt.c            |  1 +
 target/arm/cpu64.c       | 71 ++++++++++++++++++++++++++++++++++++++--
 3 files changed, 71 insertions(+), 2 deletions(-)

-- 
2.40.0

