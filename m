Received: by 10.28.91.67 with SMTP id p64csp728965wmb;
        Sat, 3 Mar 2018 06:40:49 -0800 (PST)
X-Google-Smtp-Source: AG47ELvR4vtlISkO9X/rbu4j5fhEAHp9c3NVISyS3XW7rJvRDRMeczVA6Vbu8AcFMOXgHpqcbR8r
X-Received: by 10.13.251.3 with SMTP id l3mr5912085ywf.126.1520088049913;
        Sat, 03 Mar 2018 06:40:49 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1520088049; cv=none;
        d=google.com; s=arc-20160816;
        b=jqKN58XZJgIQRQ8tEYIxGUX6jMzMoKpEu5uo0F4NaltP3QR3OArJfATM2dusF1thj7
         Mj2ZMmUctqUlhOVQJJ5PliNKPqKTj8SWN2OjMV2/jV1UxouyEMUIHEiagyN2THnYBezq
         vSX6x/4yqPqg6eIDc7jddXhicp6ElHwD6enWnm/1xYG1P8BHz0k3YHnyG3fyuDJ9CUhV
         g1ZTVlZkpdg7lGYD2zOcgm4lP+aCAvQUBaiz6eNXZmmVT7VBZ2uXE4Dpixw2F0LzsZvS
         OBolMWgXAokgyGOIsNiXmjNbDRRLxdmzNqWwRUb80afJoXZLSwbhXO76gX/SxwIrAKWi
         8dpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:message-id:date:to:from
         :dkim-signature:arc-authentication-results;
        bh=pGyNCgXq4PItnMidlFLasyh8gi/l6CGo0ZrobuDXVAM=;
        b=0NsfpVFKZsy8cav+gE6nPFSbhMKYWugDfQtVvm2tQjO9Q9lrMRZKLPcd9gdTnC1AXv
         Vgs3W0KAWPFf8ggijriXophxQbHrzR49XKOCLs3P67OKwTkVzL4k8vhW7GP629Zki3q/
         ptHF3c9PdG2bSyICVy7p3CC+9byYBpdZSM06hfUYTvviGKlkJsIdXzXnFsZehQlOgyda
         HouQImlsHCrvYcjf0Ngwl2QDN/xQ7A50OS6BbUBbcX0EZfkLk95r+7YvQuPs5ARgXuIN
         TUIqd6Fz15f2nSPNXde3wZBkA+Q/VRBGms2EWX5Fl7xuVeNHjGWOgFZKQxj+uvNcT6e9
         KiLQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=SS7DH+VC;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id c2-v6si1440599ybn.452.2018.03.03.06.40.49
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sat, 03 Mar 2018 06:40:49 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=SS7DH+VC;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:40486 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1es8LB-0007Ow-5p
	for alex.bennee@linaro.org; Sat, 03 Mar 2018 09:40:49 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56799)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1es8Iy-000629-CL
	for qemu-devel@nongnu.org; Sat, 03 Mar 2018 09:38:33 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1es8Iv-0003up-AE
	for qemu-devel@nongnu.org; Sat, 03 Mar 2018 09:38:32 -0500
Received: from mail-wm0-x241.google.com ([2a00:1450:400c:c09::241]:53747)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1es8Iv-0003ud-4Y
	for qemu-devel@nongnu.org; Sat, 03 Mar 2018 09:38:29 -0500
Received: by mail-wm0-x241.google.com with SMTP id t74so8161175wme.3
	for <qemu-devel@nongnu.org>; Sat, 03 Mar 2018 06:38:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id;
	bh=pGyNCgXq4PItnMidlFLasyh8gi/l6CGo0ZrobuDXVAM=;
	b=SS7DH+VCLoqbuhnqZxZBeT0ckXWjrtKGOYS3iQxSrjSrCp+DLxRuk7FVVoTPeMWdp7
	v0vpgWCI5p3zGAyLK0ITJGp6teKAkivLIes/Dl+LLtag+Iis1dB5h2iTJ+sgV+PDzdMm
	OdnGBfGakbBCx4Fp5NdhI7GpBYHO/9YLW3exA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=pGyNCgXq4PItnMidlFLasyh8gi/l6CGo0ZrobuDXVAM=;
	b=QEWsyQSz7X1QkoMMnN5pj4iC3Msj87gX+LK+ogapJqj3MtU2kzS7m9fIsRjr3SFuAV
	pAzPnCluAZqfu5DfwRXwNf2CQnAsGS5rVOTysQb0l5aQnUjBGQJNmyEuBLLSg7cAiqy4
	fAu44Hor1K6jyogRkNWCM1pcmVRG31yMYcpRpTKEiHHeZ8aE5YvZX5uOI4qsfcpfItQf
	oX1wIcYelehzEu0kPaP79Q/AKymY8kGofVnW6hmoOQe1SUn+AF92K66l6mFPeKFmjwKm
	jkoD8TmtklDV/95EvahCTVgB24u5NkGWKB3vOoQwWf64CwgI4rq7T5gqnBs8r8yaPrjw
	fCVg==
X-Gm-Message-State: AElRT7EBbACpBQ4mzFI4jxV2eJhFlR4VKmxsDMF3QM/qvN7IWf7nZ4M8
	dxzAG/UiWjrHOYWb3QW43l5wycBeBbU=
X-Received: by 10.28.27.194 with SMTP id b185mr3911600wmb.102.1520087907772;
	Sat, 03 Mar 2018 06:38:27 -0800 (PST)
Received: from cloudburst.twiddle.net ([37.205.61.206])
	by smtp.gmail.com with ESMTPSA id 4sm2732686wmz.31.2018.03.03.06.38.26
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Sat, 03 Mar 2018 06:38:27 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Date: Sat,  3 Mar 2018 14:38:18 +0000
Message-Id: <20180303143823.27055-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.14.3
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c09::241
Subject: [Qemu-devel] [PATCH v4 0/5] target/arm linux-user changes for sve
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: KLe9Bfuc+j/i

Changes since v3:
  * Review comments applied.
  * Frame allocation generalized in patch 5; hopefully this
    eliminates some of the confusion seen during review.

Changes since v2:
  * 5 patches merged,
  * The PR_SVE_SET/GET_VL patch is more specifically user-only.
  * Split the signal frame patch into 4 parts.


r~


Richard Henderson (5):
  linux-user: Implement aarch64 PR_SVE_SET/GET_VL
  aarch64-linux-user: Split out helpers for guest signal handling
  aarch64-linux-user: Remove struct target_aux_context
  aarch64-linux-user: Add support for EXTRA signal frame records
  aarch64-linux-user: Add support for SVE signal frame records

 linux-user/aarch64/target_syscall.h |   3 +
 target/arm/cpu.h                    |   1 +
 linux-user/signal.c                 | 415 ++++++++++++++++++++++++++++++------
 linux-user/syscall.c                |  27 +++
 target/arm/cpu64.c                  |  41 ++++
 5 files changed, 418 insertions(+), 69 deletions(-)

-- 
2.14.3

