Received: by 2002:a17:505:d21:b0:1be9:327d:8ee3 with SMTP id vh1csp169731njb;
        Tue, 7 Jan 2025 05:58:27 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUAhfzdGBJ+qQsh1YfHi4eusm0nNqPiHk/ga01mXnHVN9wQKnOjra/n18TIVLQirrFxypoN41xqcUoEHw==@linaro.org
X-Google-Smtp-Source: AGHT+IErbVWF65tpQLfNMikpO8SXuuxrmJrJqjcf5ZJpSVe1c6De41/AvaVycgrQls5UmOeGM+Ez
X-Received: by 2002:a05:620a:4721:b0:7b6:dedf:b6c2 with SMTP id af79cd13be357-7b9ba716accmr11036904585a.5.1736258306977;
        Tue, 07 Jan 2025 05:58:26 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1736258306; cv=none;
        d=google.com; s=arc-20240605;
        b=jHHBNtL2ySuHKviSjxPBa8iJMas1c3cw4XdZYCcBf7yjY3qjUDjg+AGEwgafgFU9gI
         tLPxTdsn5pTDuR0ynwQ+Yp/gKqkajxqgr6PD4NDQRs64uS0TnrfnYhrnitYzoTlle0cj
         72ieBZVZb5QviwsHQte5ep9aY9wfR8HJQislL19SLymLPKylNFexXiIzPAF6DvOm6OB7
         BOM/wcpNArapNKlLCSToBZ5gV5OGxUCWmQwaSVTrvLA/ziYhyycM/pJ/qbdz0Fkj+nsu
         MxgT4SlEEUtiTmd2wZXKoDjQdVnEj7jSUGx+SVlbW9hfPRAIf+7ys6zCsw1ut20ByXjD
         LbWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=eYDkVruTPbeywuSuzwkP1y/8rZYhZBrKATsH8FXrn2Y=;
        fh=B5VmkTrzS5rSWGousiXEP6FjoUEQ8j2QCHFj7nMsbXs=;
        b=SrUw1IFLW6Gi4+T+1RYawYOqG0T2w9DHCNl3GSbJ4hWpxFYwCDQVDkrFFTqaLutwej
         SB/LEBZcdAJrOlQd5BSziLxCWUvXEqrhtkRUjbtwwTKDCaV3E4/0n4phajfw18L0bPZU
         Vx+pGd/POa4aSrsD2IEdEpvZ1H8ASCjcrbhl0L/QJId7mHTSaLGWjBCo+QgvyCCiVuV6
         Qu+7CK2A8y/pQgeFiPL3ecmF2m6uCTjy9Du3U6vJryKGwFZMDO3I5faTRoWFXM3cr6sl
         EtQ8/myMmfNSO8K+ZLsg83Fabkz1qvmzdPAobyLO3ErSEsbTKdPddbLSpOWBg9cIWg4L
         X5sQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Gal7tPPh;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7b9ac52f306si4509201685a.606.2025.01.07.05.58.26
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 07 Jan 2025 05:58:26 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Gal7tPPh;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tVA5e-000602-6Q; Tue, 07 Jan 2025 08:57:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tVA5b-0005zj-CM
 for qemu-arm@nongnu.org; Tue, 07 Jan 2025 08:57:47 -0500
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tVA5Y-0007MU-Kd
 for qemu-arm@nongnu.org; Tue, 07 Jan 2025 08:57:47 -0500
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-4361b0ec57aso154774595e9.0
 for <qemu-arm@nongnu.org>; Tue, 07 Jan 2025 05:57:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1736258262; x=1736863062; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=eYDkVruTPbeywuSuzwkP1y/8rZYhZBrKATsH8FXrn2Y=;
 b=Gal7tPPhhaOUi+as0JXGkZc1/RwfnBpgraRIUHFCfvfZFcTnzCRwZX1QwPb2ZtyF9b
 QcCG1ydqq91l3ZDWxlteGNgGPPvxtA6tpBfxoV94abFaD9SWxaeV0y4TWstEBhSQ44QF
 CSxilQ49uYSuuLUxeZuhQ/cUX6ORDPlII15siDIIq01okbf1flec4Lgr1lS2e3iN00BU
 JJNTomgE9ieShPlvvEckwxLyE8B3mDWmxv/UMMzBmi1U8OAw7a6z1IXn/TrreSax8LUB
 VFVbIW2cyMdWeLwhSOPhTJMQmnNXiJ2kkBOj02+7ue48TQ2ZhUuJNW6snrJhKfDdHUFN
 5TcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736258262; x=1736863062;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=eYDkVruTPbeywuSuzwkP1y/8rZYhZBrKATsH8FXrn2Y=;
 b=U78ExZ/txPtDTA/53UTknacpiMrgnWRvqxi+/2gPVrctxBtkm9e05LewxGBV9rpWAu
 bApWE3QnChWMw9TkpS9sG/eIro/f7MxGbmxY1TNGQwCXujPeMcglpVPbr6ba6yJhtEJq
 yKgyL/Y9NFOo7Oc09ESnSuiQJEs8wCOOMkw791M/+1hEXPeQraqxbrMW4AlPAC2eiOaT
 eQVwMM5CycRz+mTH8t/lHuo5rkOUZmU2wGm+p42D9B2kVz82CqTWod5HquhduxIdPmpG
 9MG2clDYaOlNRBZh7zbNTVKweGytVPPRx5Sw287KHZurr85wDSg2GnozVoMeouSuDLmI
 JyiQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUIzDnrlBKvWTN/TXWTEH+inBJM5jOAz93tKQ2hwD2u1/23gA5+A9W6bwKZFAIhmPvCLGJ4A/FMtg==@nongnu.org
X-Gm-Message-State: AOJu0Yw06gSlS0V8dxOERbn/SpMtEFrz9BGailCFtFvZGkNBX6tbEFfk
 XbuBrBl0BwbE4ql94uIo7umiIAeBn+DzBK2dzUHRRCB/PQfcuynkBg8fNDkqflw=
X-Gm-Gg: ASbGncv/lMvRMigrcs591qJdMHxEMQBvfqVe2RkVEni2KnWflPa1V4kh6jl6x/avg79
 NL+CBEQL+Jnuejj6m6X7S0XvL/K0mZEG4eVuG+nP4mcciSSWWh2vrA1/LgkVrFd93MCNFVfBTGN
 HdmEXpltIqPAIzjJXR4uC9iB2widKSiuqaspKQ7UEEQkf36IVewFJdjNN1+UTxR2bLpJgwgP/Hg
 VHik+u0ggeDWOsytu/psWShWb8ykxqK5vfxdAJqErApSHyMbmpfS2mCvMQlG2EYvOYJS5l50GzK
 Mzde2x6UE/3fLkCPBFUWdkcaIQ101eY=
X-Received: by 2002:a05:600c:4f03:b0:435:1a2:2633 with SMTP id
 5b1f17b1804b1-43668645cf5mr580286485e9.15.1736258261724; 
 Tue, 07 Jan 2025 05:57:41 -0800 (PST)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38a1c8472casm51290740f8f.45.2025.01.07.05.57.40
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 07 Jan 2025 05:57:41 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Anton Johansson <anjo@rev.ng>, Alistair Francis <alistair.francis@wdc.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-arm@nongnu.org, Yanan Wang <wangyanan55@huawei.com>,
 Zhao Liu <zhao1.liu@intel.com>, Thomas Huth <thuth@redhat.com>,
 "Edgar E . Iglesias" <edgar.iglesias@amd.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Eduardo Habkost <eduardo@habkost.net>,
 Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v2 0/2] target/arm/arm-powerctl: Restrict to ARM cores
Date: Tue,  7 Jan 2025 14:57:37 +0100
Message-ID: <20250107135739.48324-1-philmd@linaro.org>
X-Mailer: git-send-email 2.47.1
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
X-TUID: wVlDDQFkVi9U

Since v1:
- Factor cpu_is_of_type() out

Philippe Mathieu-Daudé (2):
  cpus: Introduce cpu_is_of_type() helper
  target/arm/arm-powerctl: Restrict to ARM cores

 include/hw/core/cpu.h     | 9 +++++++++
 cpu-common.c              | 5 +++++
 target/arm/arm-powerctl.c | 6 ++++--
 3 files changed, 18 insertions(+), 2 deletions(-)

-- 
2.47.1

