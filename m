Received: by 2002:a17:907:20b4:b0:9a1:fa4e:495e with SMTP id pw20csp577015ejb;
        Thu, 14 Sep 2023 07:57:55 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHljC1w+TRIDK25aFO8gusEGWXfQD3f3xWB0ePafn8kVORteH/A1+eg8P0L7gsxgEL1x2Ef
X-Received: by 2002:ac8:590d:0:b0:40f:bec4:7179 with SMTP id 13-20020ac8590d000000b0040fbec47179mr6239583qty.2.1694703475141;
        Thu, 14 Sep 2023 07:57:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1694703475; cv=none;
        d=google.com; s=arc-20160816;
        b=pFYd2Fv3SFoGpnaafBxWHojRTUcABNQXfELAm93p8744v3u7puffOwg+OjX28Q04D3
         2LHsOJN9+Q8RrSUMp3yzeKA+BAf5wlT98E3axMv4G5PwuNMIdorJqrZ7OdMmkt2LhngE
         JyaqX0ulDkK2rhyXMIxWG+VKBYO5YP/mUrpNRgSJHv66lPkuCr0G2e8dSRYTuUqyNorD
         tXbOuqfO3j3KsF1+VjcNUkaCA6cqrR5CD5WJPyNs0I8wauOCBuos8nxxIZfO/n9UwsvQ
         fXv7vCTEeUPTvzVirVUj1yZ2qjInhhHIc5VsKImvL1wA5LnjLp1r1KFNCcYyfwT53B6y
         6pkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=yEBzd2ULRxk3ymaTMon7B6wcT3mZDM7Z+7Or36OEaEY=;
        fh=NY6IStX7ee+XRQ7VxbbREYpTmmSHrTCVjRm7wDQyZLI=;
        b=QpH6qKSwr6mL9yCnrWubtfOfWT+XiINKogWrEFtwMMrXs7MyZyXFy1zhtmeDMMXDwL
         TLLMBrg06yyrogSLecmceYDhX2KGR1m8MLz19yMWxrCkBcmsRdzRNO+pQhdsY2+ZM3hX
         8ZDd+QJt4AMaI2igQPNFquM7rCpjQkL2T1e4iDaMKe9mtnq9EtxDeww+3NO9rTiSTbZY
         cUqSlcC+2vlM0JCpLBYS9HByzc7xTA7UURfRWUc5qZq2jjOmNA95Jv8FpEzsaNXQDoPN
         5Py/NhHst5EIKmr8ib6K0Pt+FR+ROO4gBM9B6mb0rphJGmtOr0LfRfhQpP32qT0mj3jm
         aNlg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=RXLnXqXE;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w13-20020ac87e8d000000b004008b90cfeasi973392qtj.622.2023.09.14.07.57.55
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 14 Sep 2023 07:57:55 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=RXLnXqXE;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qgnmL-00015J-Cx; Thu, 14 Sep 2023 10:57:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qgnmJ-0000x8-O0
 for qemu-arm@nongnu.org; Thu, 14 Sep 2023 10:57:11 -0400
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qgnmH-0004Nl-UV
 for qemu-arm@nongnu.org; Thu, 14 Sep 2023 10:57:11 -0400
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-31fa666000dso936371f8f.2
 for <qemu-arm@nongnu.org>; Thu, 14 Sep 2023 07:57:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1694703428; x=1695308228; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=yEBzd2ULRxk3ymaTMon7B6wcT3mZDM7Z+7Or36OEaEY=;
 b=RXLnXqXEPtjSr3GnYPUcY8xnaWDfvlshP/1v2eZjlsyfAhvqk6euyeSRCtpRBiqGJy
 XQrkhOt4W7bcci+TDzUsDqtOedhUaDscSki+5b23KKE2K0tJOxqdbH4zbYISIjKJCkpd
 g7rcW/RoMz+VwfHBJWRVr7MgUjwv8ofcoikp+M1Wprd8Q0PxLI97OqEFZMcls9Ar3MYM
 VskP3dCWJKBQX7qL3wR9XtfSXM8znITxBtico49LA5srYr7HZiiseu6iIi+SH6sin3KS
 c988xdtBRPGCgrERwuPKwaJjbZmdqTnkPaAfA8azpWACqFRi4GoNeu8SVcNEsfah/JYl
 hIBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1694703428; x=1695308228;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=yEBzd2ULRxk3ymaTMon7B6wcT3mZDM7Z+7Or36OEaEY=;
 b=luYSGpY8shm4AoXYJiX0G3K9TBYuQqo8CxMX3j0LUom6L438xVktE1iEz4yhW/dyAy
 DUFUd/6AIKks+O9dtBc96/MPAmjB5ykNvmPwb3/qRJkYVVHh41vMwDLAidXbCxqH+Txs
 pBYEeDHiIvQHrEqqK1yRsnLoPyyttl5DRFNnE/M8mAHpud9pchulzwt97lbUHRCnkyiv
 4gj9il0cp+cXFWLyiO4b8GLOO++PBeOHm+hK7/krr6TvAv/dq6n/PBepmaYxPRQQqCOD
 2t0Q8uIhiYgZLplsYCRqUI7Ihp2qaUVO4Xjp3Dnv2gXbe5Qc9CYU+V6yO23Db56UUIFH
 1dfg==
X-Gm-Message-State: AOJu0Yw634Ja8u1SMOWTdTWhU/Dh0Fz+Ioh9BlwhqiYRFGh4HEpGXFt0
 0+772O9XW+dBwBoO59GwSyJksW/k4LeGcvCkAyk=
X-Received: by 2002:adf:978a:0:b0:31f:dc60:13b5 with SMTP id
 s10-20020adf978a000000b0031fdc6013b5mr2223423wrb.25.1694703428137; 
 Thu, 14 Sep 2023 07:57:08 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 y15-20020a5d470f000000b0031981c500aasm1978483wrq.25.2023.09.14.07.57.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Sep 2023 07:57:07 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Eric Auger <eric.auger@redhat.com>,
	Mostafa Saleh <smostafa@google.com>
Subject: [PATCH 0/3] hw/arm/smmuv3: Advertise SMMUv3.1-XNX
Date: Thu, 14 Sep 2023 15:57:02 +0100
Message-Id: <20230914145705.1648377-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: xy24yNtmHjbr

The SMMUv3.1-XNX feature is mandatory for an SMMUv3.1 if S2P is
supported, so we should theoretically have implemented it as part of
the recent S2P work.  Fortunately, for us the implementation is a
no-op.

This feature is about interpretation of the stage 2 page table
descriptor XN bits, which control execute permissions.

For QEMU, the permission bits passed to an IOMMU (via MemTxAttrs and
IOMMUAccessFlags) only indicate read and write; we do not distinguish
data reads from instruction reads outside the CPU proper.  In the
SMMU architecture's terms, our interconnect between the client device
and the SMMU doesn't have the ability to convey the INST attribute,
and we therefore use the default value of "data" for this attribute.

We also do not support the bits in the Stream Table Entry that can
override the on-the-bus transaction attribute permissions (we do not
set SMMU_IDR1.ATTR_PERMS_OVR=1).

These two things together mean that for our implementation, it never
has to deal with transactions with the INST attribute, and so it can
correctly ignore the XN bits entirely.  So we already implement
FEAT_XNX's "XN field is now 2 bits, not 1" behaviour to the extent
that we need to.

Patches 1 and 2 in this series do a little bit of tidy up
on the ID register bit code. Patch 3 is the one-liner to
advertise SMMUv3.1-XNX in the ID register.

thanks
-- PMM

Peter Maydell (3):
  hw/arm/smmuv3: Update ID register bit field definitions
  hw/arm/smmuv3: Sort ID register setting into field order
  hw/arm/smmuv3: Advertise SMMUv3.1-XNX feature

 hw/arm/smmuv3-internal.h | 38 ++++++++++++++++++++++++++++++++++++++
 hw/arm/smmuv3.c          |  5 +++--
 2 files changed, 41 insertions(+), 2 deletions(-)

-- 
2.34.1

