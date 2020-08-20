Received: by 2002:ac2:4841:0:0:0:0:0 with SMTP id 1csp1626525lfy;
        Thu, 20 Aug 2020 12:45:25 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxNM4c1HTsSYl6g1ZQOkAurseh76KDhsR2BA+LZ/tLr4qhnjRRPK96bXHxScksIIoCuqVPz
X-Received: by 2002:a25:6901:: with SMTP id e1mr7018281ybc.192.1597952725134;
        Thu, 20 Aug 2020 12:45:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1597952725; cv=none;
        d=google.com; s=arc-20160816;
        b=FPn7BVLoE/a+JlyNw5a5fbCXcR9S0x7MgVCOEHcsSBQhHBCk0Vi3ftUVxDmNNLU8d/
         ducufkdV5M93O74UkGPyeSwMpJXuOvUbG9U9o4XNWRmvp9VQSu2IoEkhmDk9UB3tTugg
         BSGlqXlYSvp4vF8Rq0JN6QM9ZfqdKa50fV75A0txjBXRG+VZOaHY7D/7LFX9xECG0hO0
         eB2mXyA9SUFhqD2qpaHD/Kvp2k2gl9F0EctVBoEzoaSQfbdn8s6flQJSm19d5uCzxb++
         VHQRA8OSWsTf+HtojxPZVtnJP18ANDQmGT2TFT0fUwkwO41J8gsJ6ztZd4EP4YNHixwN
         FRDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from:dkim-signature;
        bh=iQby6NjkdZDpj5Eu21WRa/aMPhqg4CaJZ3i36bO+0Co=;
        b=gcvZgd+c9Tr9TqAFtptxE4jKGE6DvsXDG/C7r5WB/TidvGkD2T+cjwxj8j9Uyt+LGj
         fQQ1tjF01T+oaa/aG2IT+fzdXZBv3gNxBNG9Ya9JvNrx/jUF2vIzP7WjRwSgm63xUrbe
         QiZJgWRg351mdjz0RUOAyL5GQHvMpJWxMxzC3y3PJY/eLxBQUq/U8eaFgqduO6Z/GPXh
         uyWjIw2FJSQAPlwUFiogO3D62Yzjj/Czd/yXPemL9GRaZZK+dVPbui9esgoUPi0vSizp
         BAu81d4hM8G2LYJYK4L+FaxPdnvyPTxlE9vcnNO8CX5JLqjyDV8zywqzNdfVdE+w+OWo
         7TBw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=owqPY7lD;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f73si2682739ybg.346.2020.08.20.12.45.24
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 20 Aug 2020 12:45:25 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=owqPY7lD;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:35418 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1k8qV2-00087N-E5
	for alex.bennee@linaro.org; Thu, 20 Aug 2020 15:45:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51328)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <edgar.iglesias@gmail.com>)
 id 1k8qTV-0006vp-LB; Thu, 20 Aug 2020 15:43:49 -0400
Received: from mail-lj1-x230.google.com ([2a00:1450:4864:20::230]:43573)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <edgar.iglesias@gmail.com>)
 id 1k8qTS-000305-Np; Thu, 20 Aug 2020 15:43:47 -0400
Received: by mail-lj1-x230.google.com with SMTP id v12so3403749ljc.10;
 Thu, 20 Aug 2020 12:43:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=iQby6NjkdZDpj5Eu21WRa/aMPhqg4CaJZ3i36bO+0Co=;
 b=owqPY7lDARmLL4RLDhfBrtXOScYGeFP4l7YM/i57DE5gtHfGWb5S43UHn/kQo9y8RO
 /Zm90fCN8LQOX/KOgo+YTKhlpo9o5WzLlby3+Tbf4zPry3eJRxp9NFBnFkj4J02EtnYR
 tsVEv1028ZY1aL/83oZcZoFwgrso8GC0kfNCq4vdLwES2bF7XMgtwGJIFg6gAnBtD5oH
 lYast5G3USTOhfrPSncG47wC0/7433c9x9Bgq/ZaLqUc1EJjmJcmeMxmodwHSRi9r3Mh
 z/IrnLcjT6MZLIMdU10hq3Ajy8DEeqQ7n9cLmZjp7YAQhM11zfaHm/kTY9nzCsr/1Dm1
 fpuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=iQby6NjkdZDpj5Eu21WRa/aMPhqg4CaJZ3i36bO+0Co=;
 b=A4KelMia5m2XPYG6JFMa4VhK6WmfRtV5UBn/tzvR3P4FZH1mOHD4JT3lEvGyATq+dt
 61/b8JmRZSfuQju7KPtBXJN6RVp501ykD/egA8vjzw32rHRIIZQHA5jP1PwqAzgq0tKa
 ET3LgkN/iUipl5qCVn8PlKq0Crc7TTgMRqxV/5EkJDlthv1w8Q2ByJJLnzP2Ju1vZkHy
 1AL+hT/ewxpI1gfLzqjMm7eQAuAoh0eAHqCI42cAwH94J4HiEaB5yjjuP6LDh97e2Gs5
 Rj7+xc1pq0LBWrolGV1zlFw10EtaXfLtiR0jykrZU68gkGlJzbDFQ93APLU6s4e3VGHn
 CT6Q==
X-Gm-Message-State: AOAM531I5LOlF51rWVlRcYbrZpOkBKtUzp/aOTULP+pqSR8SXIsWhLY/
 quY5sPTdvlML6mhL3AH32RUTV3nsZJ4=
X-Received: by 2002:a2e:8717:: with SMTP id m23mr2388939lji.245.1597952623703; 
 Thu, 20 Aug 2020 12:43:43 -0700 (PDT)
Received: from gmail.com (81-231-232-130-no39.tbcn.telia.com. [81.231.232.130])
 by smtp.gmail.com with ESMTPSA id h13sm618499lji.134.2020.08.20.12.43.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Aug 2020 12:43:42 -0700 (PDT)
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v1 0/2] pc-bios: petalogix: Re-generate DTB and add DTS files
Date: Thu, 20 Aug 2020 21:43:40 +0200
Message-Id: <20200820194342.1292611-1-edgar.iglesias@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::230;
 envelope-from=edgar.iglesias@gmail.com; helo=mail-lj1-x230.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 FSL_HELO_FAKE=1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: figlesia@xilinx.com, peter.maydell@linaro.org, sstabellini@kernel.org,
 edgar.iglesias@xilinx.com, sai.pavan.boddu@xilinx.com,
 frasse.iglesias@gmail.com, alistair@alistair23.me,
 richard.henderson@linaro.org, frederic.konrad@adacore.com, qemu-arm@nongnu.org,
 philmd@redhat.com, luc.michel@greensocs.com
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: lmqHZlPK/H6w

From: "Edgar E. Iglesias" <edgar.iglesias@xilinx.com>

This adds missing device-tree source files for the petalogix boards
with recompiled DTBs.

Cheers,
Edgar

Edgar E. Iglesias (2):
  microblaze: petalogix-ml605: Add device-tree source
  microblaze: petalogix-s3adsp1800: Add device-tree source

 pc-bios/petalogix-ml605.dtb      | Bin 9982 -> 9882 bytes
 pc-bios/petalogix-ml605.dts      | 350 +++++++++++++++++++++++++++++++
 pc-bios/petalogix-s3adsp1800.dtb | Bin 8259 -> 8161 bytes
 pc-bios/petalogix-s3adsp1800.dts | 282 +++++++++++++++++++++++++
 4 files changed, 632 insertions(+)
 create mode 100644 pc-bios/petalogix-ml605.dts
 create mode 100644 pc-bios/petalogix-s3adsp1800.dts

-- 
2.25.1

