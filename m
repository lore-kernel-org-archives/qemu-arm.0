Received: by 2002:ac2:4c26:0:0:0:0:0 with SMTP id u6csp4415009lfq;
        Tue, 29 Sep 2020 02:44:52 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwbKZO4udmqoodAkanGXTSMYmsj1ciBqvyb6adV+0dq+LySP83uDWac+Vb69biZ6FkyNZJm
X-Received: by 2002:a25:2a55:: with SMTP id q82mr5294642ybq.160.1601372691992;
        Tue, 29 Sep 2020 02:44:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1601372691; cv=none;
        d=google.com; s=arc-20160816;
        b=k96AtI5ElWJs4FgSXtzrEttDFiXyr/gNKoFVCI397dFeZl5UwIo/yrVhyuKoeCJWtk
         TZmjupMgvyy++MrJ7D06v7OgYW7e01C+89LkjuR+hLALp7G6YdUYQk0zVvaU0UhGnKW1
         UBzUPq85CUt6bfJY8TEvgu+P+jbRqTTc8NEjEPBKaQ35/eKrjaLuJ+YwRxByE5Tf/SaQ
         J20dvq9mJa6cB4z0+Ux33NM8zChM/WlQroT8KqJUAyhuqxiWvkGlU7yct0TuM5t6qse8
         UolTnLwm69e8MUWA7N3I36wKDMEOc55g48Et4YJIFo0h4Yd2YvrdquuwXMMRo0dhSRKj
         k/BA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from:dkim-signature;
        bh=hCyV2VoP+/J+PVZ3ArpNT9NKpKtACsKPbdEw4weObvo=;
        b=wPLeYpggOZASTwf1zGFf5Y5Jh9aNaT02SGaUsolyF5HX5Wxf0cMbiPf8pFsW6HYinE
         lAdLMWsV6QB0OxaKksfzuaSedFSL+6XA+sKcBfmjlJaBPM5nA9MvZfMtoW6+/cEHNtnC
         WcPwvVmfU8hJNlBySBcGmuh/bwCKbXnrfTmXUEJatmkk6L+TKer8L0uLoqTwiT0vZ0n6
         9svLm/GlEcUJkQmqiFeYyqoERakJGMewFTLmw/O5duLBRJ5NT3PjW91I7H9osbtDkbPu
         CBNu7ao7Mxnub+rZo++BZfEgHDZCc2DU39XabQzvMwpjtMYEaG9l73xLszaGltq97V82
         8AiA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@nuviainc-com.20150623.gappssmtp.com header.s=20150623 header.b=gXXaUSIT;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b88si4026246ybi.314.2020.09.29.02.44.51
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 29 Sep 2020 02:44:51 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@nuviainc-com.20150623.gappssmtp.com header.s=20150623 header.b=gXXaUSIT;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:55790 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kNCBn-0000Jz-9B
	for alex.bennee@linaro.org; Tue, 29 Sep 2020 05:44:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34758)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <graeme@nuviainc.com>)
 id 1kNCA1-0006cZ-7G
 for qemu-devel@nongnu.org; Tue, 29 Sep 2020 05:43:01 -0400
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343]:55787)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <graeme@nuviainc.com>)
 id 1kNC9y-0006oW-Va
 for qemu-devel@nongnu.org; Tue, 29 Sep 2020 05:43:00 -0400
Received: by mail-wm1-x343.google.com with SMTP id d4so3933085wmd.5
 for <qemu-devel@nongnu.org>; Tue, 29 Sep 2020 02:42:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nuviainc-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=hCyV2VoP+/J+PVZ3ArpNT9NKpKtACsKPbdEw4weObvo=;
 b=gXXaUSIT7jEN38OqRCjIEnp+1iskFTKnH9RP/pPW5b4KP3cB3xwiQPyDsblKFLIvZ7
 3geo7aX6Q29tfsGgZ1WfWtJk9+SQiRTlTw3UVZNs5r+XlhyOyOEcqzm5afp1E4XewSI8
 4ATd1mrivgwHecdFDkhltx9/Ac1gcumVmPbPGNU7MH8TVN5jecKr53MAflCtgDof6vTS
 FjOpwUbmw6/k2fP7wsit43gKqiJ6pMvAAto5fPjlXKL/zBfoXGjeADiPGNLruj/nhPAH
 snym6tiP9SNep2TUpwGZoAohEoe/AjujUiAGz4Pfzptyw2Q93o76E6V68ZK8ge9onMcw
 tVHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=hCyV2VoP+/J+PVZ3ArpNT9NKpKtACsKPbdEw4weObvo=;
 b=nETl8SPT5cJwQfGbjdjoyPed6Zzq5ucu23b73AM5KeGq7akxsT994r2GLglJgd2D/v
 ukJFzxsCJ5i0DNjhLjxQH3mhHac5/Mm9+GmYGByGjTLNGC2JAacupNb7V6J0m8Lv/O7D
 W3O6ClzT3ZR7q496HTU0NAX9Qyrhs9zPGlOA9ZNX2SDs1zK3ZztP4WF8x/tF/yYqk4Mt
 9MfusNbRNGuRhPQdPf5ZqpkOmaPbG0IyyxarDff9y/vUGeebH0kPfxEjkWGW4oo5anSD
 CzThyPTvLTcWLbO5ffEYARjaWEGK9hdVBjBeg9Xm59luiRZD3JXOYuCLMFZpNft6vBFg
 5tgQ==
X-Gm-Message-State: AOAM533eyCjuAEFc6yDDnD6jS1tt6NnQ4Ejd7eqaMuhDPJT66W0Sdo9C
 5HDIeJUPPq3AoopAWWXWFHf+ng==
X-Received: by 2002:a1c:a988:: with SMTP id s130mr3500762wme.31.1601372577119; 
 Tue, 29 Sep 2020 02:42:57 -0700 (PDT)
Received: from localhost.localdomain ([2a02:8010:64d6::1d89])
 by smtp.gmail.com with ESMTPSA id t6sm5887797wre.30.2020.09.29.02.42.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Sep 2020 02:42:56 -0700 (PDT)
From: Graeme Gregory <graeme@nuviainc.com>
To: qemu-arm@nongnu.org
Subject: [PATCH 0/2] hw/arm/sbsa-ref : small fixes to smmuv3 initialisation
Date: Tue, 29 Sep 2020 10:42:49 +0100
Message-Id: <20200929094251.151722-1-graeme@nuviainc.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::343;
 envelope-from=graeme@nuviainc.com; helo=mail-wm1-x343.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Graeme Gregory <graeme@nuviainc.com>, peter.maydell@linaro.org,
 jamie@nuviainc.com, rad@semihalf.com, qemu-stable@nongnu.org,
 qemu-devel@nongnu.org, leif@nuviainc.com, f4bug@amsat.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: eLmHX+C+yJLA

Fix two issues with the smmuv3 initialisation, first where a previous
patch had transposed an i to a 1. The second an assumption that the
IRQs allocated were meant to be unique and not 0 based.

Graeme Gregory (2):
  hw/arm/sbsa-ref : Fix SMMUv3 Initialisation
  hw/arm/sbsa-ref : allocate IRQs for SMMUv3

 hw/arm/sbsa-ref.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

-- 
2.25.1

