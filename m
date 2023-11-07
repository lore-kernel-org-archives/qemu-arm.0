Received: by 2002:a17:906:4a55:b0:9d0:bf65:29fa with SMTP id a21csp274556ejv;
        Tue, 7 Nov 2023 04:28:27 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFzgsfGLifyILiB+OZhiOSNgcPNCVRYdznGeOIEKDa9RsXnMm7HQI7+STwk9aCOjG8Tp2Zj
X-Received: by 2002:a05:6214:2dc5:b0:675:a120:7a2d with SMTP id nc5-20020a0562142dc500b00675a1207a2dmr4081650qvb.2.1699360107420;
        Tue, 07 Nov 2023 04:28:27 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1699360107; cv=none;
        d=google.com; s=arc-20160816;
        b=ExzDq3yK+05oI4BMah2bRLSn6WmYk31ZKsD1hOS5yAlmc0C23pxAYHuf8r/up3Mi8r
         fcRLLCrZgUEVRdlw2uNd1z3AweAWFQCPWN+6r1m9pVXfGI+meOO1Ei0fuZ296BYZtbQx
         m7iEoVeUW1fSJUdNvce5C09Tfd+dfNPol98+ouqFecVquycI2k0Fqk83dao0LdilEFag
         ZT2uA5hOtC2Nx6ZUXD9zBzpNCLnnCFgoOCTtuddx0g0+CQ1/ho0z2V/dGj6LL+AXYCXA
         oY81iIWeUZKVifKeitPsYVGFh/nQnPPhoaws0zA0l9GHg81PRq2z61BeETjrei/AleWh
         0zbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=bPpjDkEUgqCeZLuJ7FjDj9Qp3yXD435hoj9y2GuMgcc=;
        fh=cNSzr/W9J/4aJpqP86zm6hStvbeVv6h0MRvfoStHJZE=;
        b=ywf0PzZyl7pKPtuDw0edRAYBUO0ZlaPytvx3wusQAOeZo18ZmCxYi3J3RiyPWOw8Dz
         zahrevDl8NP/rhbpprUeaNTKZGxa2VV6tPZ5ftcwF0WZXEBmoIKYayPiYuajFrT+gaC4
         NzDDstmdJ9qHUdbjpHyQNjDPnfLBzAexl/poIwAytSZ29hBQ6L9lvM8ZROnvrSSxjmW/
         5v/cFC3aAUeG4sQx2FH0/jxninHCxQuecJ9Lwg3n0es/C5tNoK8Z6JkWmqagtQD+D+sf
         lmG9tD+E2Wl5peOuCRXVh61fJ08Ao84k3iKewzpEH5mqXguDz/LXPJGKYsvkgHIutIBL
         ejaQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=V8aVhrGf;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n11-20020a056214008b00b0066d03754b8bsi6608353qvr.21.2023.11.07.04.28.27
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 07 Nov 2023 04:28:27 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=V8aVhrGf;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1r0LAz-0001Br-Bd; Tue, 07 Nov 2023 07:27:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1r0LAD-0007Y1-9t
 for qemu-arm@nongnu.org; Tue, 07 Nov 2023 07:26:40 -0500
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1r0LA2-0005Mv-Gy
 for qemu-arm@nongnu.org; Tue, 07 Nov 2023 07:26:37 -0500
Received: by mail-ej1-x631.google.com with SMTP id
 a640c23a62f3a-9d224dca585so850321866b.1
 for <qemu-arm@nongnu.org>; Tue, 07 Nov 2023 04:26:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1699359984; x=1699964784; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=bPpjDkEUgqCeZLuJ7FjDj9Qp3yXD435hoj9y2GuMgcc=;
 b=V8aVhrGfgx39OX1v0S1sItKfH5CUDLVzn0sRdn0Le/D38biCGkycCpMb1mGGL5NEg/
 5hJy/iSYiZVA4VLXqUtwGxUn7QiWluaxymKt1UkSrKt5AC3ht1d+iz6wSBgNlW0OQn2v
 T61Sp+sDtY/GQqLY3PwS95Qhieh68QQPbNCocZbKr+amSADpd+dyFCaZFR5WdzDaoWNe
 t6EDSKLpLpEhZse9+vORYZUS4ee3/j9oRLszc9q9p9qxmB/a8aVi7Hqw3vQWOMDawGU9
 IRXOHOuQiyv+iUxcmZxGe9VQtsxt2yJcH5rtVic11Wz5mFwge0euJwkExdS15oUG6l5W
 cu3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699359984; x=1699964784;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=bPpjDkEUgqCeZLuJ7FjDj9Qp3yXD435hoj9y2GuMgcc=;
 b=gk9xcWT+7nvrt4APHvHCS/995giFuDC6+/9p/C9vDrhOIC8Rmy1rorOcA7tieRK7aV
 PpMuqAB623fPSFTYn9Ag7DYsxCYYZhfpDUyuGpNurrbgGyE7MwGes+WYl76XcrvLa7md
 T8QC2pPVKaCjC8HnQ8KGc2UO3SBzCuPrC7e0uWz35NT7ni7VvpLDkrproWZ1lYhN0DHc
 u7JN8BuCw+fNeMyo/JazEtaGSFQvNcPzyW03E8hxt05BQ0LtPgD8Aj/UNf6Ic6cdJKJw
 CSGenKvb38AF6z8blgBBxvO+zVEBrpp08mBMwiNeLw2gK1FhhQs6UjmLNqRedN3y13zl
 nDNg==
X-Gm-Message-State: AOJu0YzlLSzpmVvhT1FMVWQPhgwH0bNxeMRXXjhGhEvnotYtNDF4QJ7N
 hpDZeAQbY+livhGVsHYNfAlaew==
X-Received: by 2002:a17:907:31c3:b0:9c7:db3:8b31 with SMTP id
 xf3-20020a17090731c300b009c70db38b31mr19724449ejb.59.1699359983864; 
 Tue, 07 Nov 2023 04:26:23 -0800 (PST)
Received: from m1x-phil.lan ([176.187.216.69])
 by smtp.gmail.com with ESMTPSA id
 gz21-20020a170906f2d500b009ddcf5b07b8sm1002418ejb.148.2023.11.07.04.26.22
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 07 Nov 2023 04:26:23 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, qemu-arm@nongnu.org, qemu-block@nongnu.org,
 qemu-s390x@nongnu.org, qemu-riscv@nongnu.org,
 Zongmin Zhou <min_halo@163.com>, Zongmin Zhou <zhouzongmin@kylinos.cn>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PULL 75/75] dump: Add close fd on error return to avoid resource leak
Date: Tue,  7 Nov 2023 13:24:41 +0100
Message-ID: <20231107122442.58674-17-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231107122442.58674-1-philmd@linaro.org>
References: <20231107122442.58674-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::631;
 envelope-from=philmd@linaro.org; helo=mail-ej1-x631.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01,
 T_SPF_TEMPERROR=0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: 1ZwjavJUBoTa

From: Zongmin Zhou <min_halo@163.com>

Reported-by: Coverity CID 1523842 (RESOURCE_LEAK)
Fixes: e6549197f7 ("dump: Add command interface for kdump-raw formats")
Signed-off-by: Zongmin Zhou <zhouzongmin@kylinos.cn>
Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Message-ID: <20231107024417.585475-1-min_halo@163.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 dump/dump.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/dump/dump.c b/dump/dump.c
index 1c304cadfd..ad5294e853 100644
--- a/dump/dump.c
+++ b/dump/dump.c
@@ -2160,6 +2160,7 @@ void qmp_dump_guest_memory(bool paging, const char *protocol,
         return;
     }
     if (kdump_raw && lseek(fd, 0, SEEK_CUR) == (off_t) -1) {
+        close(fd);
         error_setg(errp, "kdump-raw formats require a seekable file");
         return;
     }
-- 
2.41.0

