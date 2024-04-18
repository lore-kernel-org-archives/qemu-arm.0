Received: by 2002:a17:906:28cf:b0:a52:4db9:938b with SMTP id p15csp1806001ejd;
        Thu, 18 Apr 2024 08:20:45 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCX3Plppi0ps4L8qoWWZRD2DMfTKFxEQjGw5JLjzgHpg8TYJ+4B8RMMpk8Ox20oRnqS61gbizgEoYK+kNLqY9Jg+vggG5PjO
X-Google-Smtp-Source: AGHT+IGKrj+KEd2Gf9qz+GCfD2Qn1C8P9E1Ge5nXl7XKeRnOinWMhqgkrsykiGsluYJLheZbZlHJ
X-Received: by 2002:a05:6102:4187:b0:47b:b66e:c7d1 with SMTP id cd7-20020a056102418700b0047bb66ec7d1mr4218065vsb.1.1713453642286;
        Thu, 18 Apr 2024 08:20:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1713453642; cv=none;
        d=google.com; s=arc-20160816;
        b=esuQtTvlu7co1cdkWkdYJUaiKSDR+RxrHH6dYUki+IymqfDN4cDz7an7X5BIOo8xbf
         IIiV/m2jUhlCmOqjkQyRxaoaHzcYps1ATX0fTgGT3CVs+JZVqRWkgSZ+yINAr8jEvuiG
         4ArP/o5I4OhBj96wj5HJlI/DWipjDLQlx6z4q/n8zfDOQRo9yF8tUVALa3f0Euk3S22f
         NQ6j/eHZyRF+YMt+hJ2d8eKby29i1G0CGDlBsmWJzhvKlK29G6Bu1B/yiqheiUOsXzzc
         K/t/z000f+GvmBroIOGQgucpsQEMHWhlsfeNSApih7jTunNvN1CTxGsU7hiuKoORWcc8
         qPBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from:dkim-signature;
        bh=gPIaBM3QM8McnGpdq3qblSpqrPodIkBgwRVjsR+0/1E=;
        fh=H2AmuqulvQE+T5zu97MCEUC3z9wF9NssS7895NhR/+c=;
        b=lycVioPcqdCKLYT9x1jNPqX9jLD6NME2XG5afFiJGpLMNtWen+88XDJ1Duz6sXadIE
         boaD9U5TprWx1MiitbhHBJBHg8g6hfBND/h6AT35+QjO2iUQRiy/yBIFq5sQ/mab9bGp
         H6D8Lmi+R+JlkMI7UF+2UtM6jltsXqX9fouTzbEX0LclzLFMNi3R5/DPq5Itiu4QdlaA
         P2FDcjgsvIWVH0slIe7hcOZqnCVGh5yMmxfat4/6l6lAC0KHkYj7/ysqC0MA9K+Fh4gu
         3d8IkXD/C2nf/zpe9Szf5FjQcJaJMTfdXZamyS75j3Gh7HCTDz4HE9XW4rvUbVDgcUnZ
         r2ig==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=YTxnwxx7;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id hy5-20020a67e7c5000000b0047603e338f5si352101vsb.773.2024.04.18.08.20.41
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 18 Apr 2024 08:20:42 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=YTxnwxx7;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rxTYm-0003Gf-5r; Thu, 18 Apr 2024 11:20:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rxTYg-0003Ds-K3
 for qemu-arm@nongnu.org; Thu, 18 Apr 2024 11:20:18 -0400
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rxTYV-0004Ti-Ky
 for qemu-arm@nongnu.org; Thu, 18 Apr 2024 11:20:14 -0400
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-418effbc70cso4476435e9.0
 for <qemu-arm@nongnu.org>; Thu, 18 Apr 2024 08:20:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1713453606; x=1714058406; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:from:to:cc:subject:date:message-id:reply-to;
 bh=gPIaBM3QM8McnGpdq3qblSpqrPodIkBgwRVjsR+0/1E=;
 b=YTxnwxx78og9nHusPZmZEh7dW8Ttskztk/VdBSKYAHovY4eJxA3KdNu/0yaWFbWgcF
 sc27sfyxdVPJ1R1rbCBgAj8QOIcJjLpp3YRc0HZMSTypFIrueXSxQ3y5NA0ZTZRt2nBE
 h6GZVUA0fsUeDtHPQbSJfBoPJXW5D/gv+p/jen/zl3ZubapspVd+DjPIq98h0SlSKk3b
 0+IWEi/mcKxYmDCWixZVyrDPSe+UsPE0769wtdnwMoY7QrweYuDjTVOwJTZI+fugSJE1
 mDO8PeDGKDjGYCsS53f9VO9FqaAP3nJnGzxFrhneV4AGQHWJQ1M7zzLQsqsERGbb8+nY
 3zsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713453606; x=1714058406;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=gPIaBM3QM8McnGpdq3qblSpqrPodIkBgwRVjsR+0/1E=;
 b=QMRXBSy8CJQKQ6DKWdHVq+DqqNTmUqRhb53kpsZCRE6g+vt+sS7n6lmJ0fiIg9LUYk
 FtJtf22TLZzkZ6W1iAxlHU2/Glj+fZNozGm9ozVXK/teJXvhdpvtBuFGtPTIXN1w1JTP
 /8S2jYx9MAHOzAB3dHkPq46w3ISM8zgz85hIMsMENqtpv7FzDIVaq+13xhOv8TpqUmw9
 h99dkcUKJ/3tywyEluMj7xToqRzlZcDclfxXdYxPqcNGenaXm9hs9auVtno8huXQK9Q1
 TzPb7tzZUEqmeGmVtmf8VSOc5AkKFygfPBBsOQIKj3UYCcJ1eUBhbxutdrAM0x1Cj9WV
 Ct+A==
X-Gm-Message-State: AOJu0YyMDHUB16qwcpwmwFkbDJ5eTPJAGsXNOwpo8RxHbKNEq29CRiGJ
 0MfcqZBmS+NAYeciG6dZ9KRHbrOjOkC08TSYXk0zHTaf4U+1JV1qbFJ0lgSuuPFkx1588lOTVEX
 o
X-Received: by 2002:a05:600c:a004:b0:416:bc18:2a00 with SMTP id
 jg4-20020a05600ca00400b00416bc182a00mr2310119wmb.38.1713453605638; 
 Thu, 18 Apr 2024 08:20:05 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 w17-20020a05600c475100b004162d06768bsm6886839wmo.21.2024.04.18.08.20.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 18 Apr 2024 08:20:05 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 0/5] target/arm: Update emulation.rst, add some easy features
Date: Thu, 18 Apr 2024 16:19:59 +0100
Message-Id: <20240418152004.2106516-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32d.google.com
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
X-TUID: HbV3471nvC3v

As of version DDI0487K.a of the Arm ARM, some architectural features
which previously didn't have official names have been named.
Mostly these are features which we thought of as part of baseline 8.0
support.  For SVE and SVE2, the names have been brought into line
with the FEAT_* naming convention of other extensions, and some
sub-components split into separate FEAT_ items. This patchset updates
our list of supported features in emulation.rst to add these.
The audit also caught a few cases (eg FEAT_CCIDX, FEAT_DPB2) where
the omission from our list was just an oversight.
                                
I've also included a few patches enabling "basically no-op for us"
features: FEAT_CSV2_3, FEAT_ETS2, and FEAT_Spec_FPACC. (The latter
does require us to put in the handling for ID_AA64MMFR3_EL1 as
a real ID register rather than an always-zero reserved sysreg.)

thanks
-- PMM

Peter Maydell (5):
  docs/system/arm/emulation.rst: Add missing implemented features
  target/arm: Enable FEAT_CSV2_3 for -cpu max
  target/arm: Enable FEAT_ETS2 for -cpu max
  target/arm: Implement ID_AA64MMFR3_EL1
  target/arm: Enable FEAT_Spec_FPACC for -cpu max

 docs/system/arm/emulation.rst | 41 ++++++++++++++++++++++++++++++++---
 target/arm/cpu.h              | 17 +++++++++++++++
 target/arm/helper.c           |  6 +++--
 target/arm/hvf/hvf.c          |  2 ++
 target/arm/kvm.c              |  2 ++
 target/arm/tcg/cpu32.c        |  2 +-
 target/arm/tcg/cpu64.c        | 10 ++++++---
 7 files changed, 71 insertions(+), 9 deletions(-)

-- 
2.34.1

