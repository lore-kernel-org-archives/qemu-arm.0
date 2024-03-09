Received: by 2002:a17:907:991a:b0:a45:b507:d90a with SMTP id ka26csp371046ejc;
        Sat, 9 Mar 2024 11:32:36 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCVrSDmwhBdDEz4r/2S2YhpChtN5PtePBRdyzEc43gd+Lg6lqiTxby1uXLP1eR1dHiCIXcaxEKRy5tqM8BW2P35e1FErnyrz
X-Google-Smtp-Source: AGHT+IFILQ7ACRXPs8UxDIx5/voCT6Jpx53zvv+scZEqqyFqmnxXlqwrETEij+Z2N2Xq3IEUJfln
X-Received: by 2002:ad4:5143:0:b0:690:bb91:9d65 with SMTP id g3-20020ad45143000000b00690bb919d65mr3854359qvq.14.1710012756413;
        Sat, 09 Mar 2024 11:32:36 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1710012756; cv=none;
        d=google.com; s=arc-20160816;
        b=t+bGI79FtffbgmCyQhMh5hS3GRBNOJwFEtZNxpLL0DfIqfaMMUy6BkL8TzOg8D/TVW
         9mlGHniinvrEkloG6BptrimsqeTYZPb+P0aCZcbjd2jtGgcJDDMR3ECypw0NHBzxRt+/
         TBQtyRYy64OJkQPcNo5tn3A7rY/BFMkomsgvW3hBFZZQ4Mgd6mScNmqtY6aMJ5fm8N7K
         CGm3yhFDzQdtkKgPFyq49a1ns0t2x1zLIYrpnKvkczUi+HI02/J/suZWLHwjnBqg2yYU
         q9JbRSe2BdslaYubsNMvoeBoZBXo8e5iNTeyKO/5Pr9n8hTsshCYCYVYgefgGZKOLLzw
         Cmmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=qjFrwxdzh9cIFuy3VrLZl1YDUiO+UYomEAH8YyqLi9E=;
        fh=7eJuZ62IRbmeSneuVQPTZ6cDI70m+LR38eXHNXmZCeg=;
        b=qA+RNeQWEqCF+ryQ2b2Tf7wqwrHBbZsLi7lwwMMgI1L4lXY/NeJXVHHNj3L9BBh2ey
         h57zHhCDgKUylQMfTgfekLrTqn4YqUeqEQYrhuVifKytPeXwsegCRA7YaVhNmHH0rp/5
         Ejk4mMPNo2ANUyyK7VCFGB86OPTYH73Hn6Z1RnvjcARghPtlQp+eXOvQrgsgvS31enY7
         cNWBL9iOEWusIeYxvU9O7PxMdpaUr9/yhRiTAW0IC9EMMJteIXbGDXSaCkGdv17C672w
         9kaPkgHj1uqu3Vt9h2I7ZlDfuwp+dqJhmU/PcOvOBBJyYrbVH17RBoqu8IhFeRyiXP/M
         hOnw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="P7/bU2la";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id iv7-20020ad45ce7000000b0068d148b4a64si2276249qvb.419.2024.03.09.11.32.36
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 09 Mar 2024 11:32:36 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="P7/bU2la";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rj2Io-0002nB-US; Sat, 09 Mar 2024 14:24:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rj2In-0002gE-BJ
 for qemu-arm@nongnu.org; Sat, 09 Mar 2024 14:24:13 -0500
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rj2Il-0002jv-MI
 for qemu-arm@nongnu.org; Sat, 09 Mar 2024 14:24:13 -0500
Received: by mail-ed1-x52f.google.com with SMTP id
 4fb4d7f45d1cf-56781070f38so7408896a12.0
 for <qemu-arm@nongnu.org>; Sat, 09 Mar 2024 11:24:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1710012250; x=1710617050; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=qjFrwxdzh9cIFuy3VrLZl1YDUiO+UYomEAH8YyqLi9E=;
 b=P7/bU2la/osimESifAkLanHeMCSxf8dYX3GeUifgR0pf3pcS7E5MaTlPj7fN3e+wV7
 h+tBcnWBLvFVFFmvET8ChI2a+tnW35VTa+/NczjcYTDNset2v2ahJU6fClZrNmrkVU7z
 zS2S//Eu4+XRRZD49WfZhvNpnGZlEisclAKZm4vQjQx+w3c3KamRt2KAbrw5udzafMjM
 d05f2FsMifBNjNytjWC5f1ds8JDf8xkJY71/1My2qYsb13WuKd41lIgLzKSwN1pG6MBD
 cpUsdNKCIYb24Ksl2aogcjdCSwVMg6q03On9Qr93jwHtrdInHxP4yLEm0bcjY6uHy/Li
 Owfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1710012250; x=1710617050;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=qjFrwxdzh9cIFuy3VrLZl1YDUiO+UYomEAH8YyqLi9E=;
 b=Ak+BYWKoyWIie9Mu3Yhx8AF1yU+IZZlAYGwrqbnaZo1R4Q5qzwvJbgVUNZjODUubmM
 hMp3nvNzwS5jHMwUYUR03zbhdkJu5LLXiScXZsq/DylCebZf07mGRoN3L8XNwIDGpGss
 LxSr3q6Epsa1csPbhTq9EMyZdMl0cosBnVEVB7ehJ4E+cRdBchOKl31YiKdewtVALZeW
 zNqtcp6BHubU2QTyvznzE9O8SdwxJC0Nxm7+FA4xYH5agkzSRtFVtncgtX7cRi9VkRfa
 UkWeHreq8SA045AOoK7Bs8cz1+0s509fdtxBRS/YnQntTFCo5DQQWIUiUGpx2hPVkFZZ
 jyQw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUR8ERcvn7Ub4mktEUy0Vv+0aTgpvWAL/tTwZ8vzGYZx/stq/4C5a74l2BE7hxOOoz5ADtWgazgFOpXxkdRc8tSzLbF
X-Gm-Message-State: AOJu0YyeiY9jrw00ugw+it0XjkC793xouOPkIlJp2Xc4zoL3SAwp49in
 mnLjlpjx75zX52l4FyXJXOP63HxRP3NVMQT9qqLxACFysZ81s+IJw3YejxDKXMNfYQAeBaqCSlx
 e
X-Received: by 2002:a05:6402:5c3:b0:566:cfca:e56f with SMTP id
 n3-20020a05640205c300b00566cfcae56fmr2549323edx.19.1710012250332; 
 Sat, 09 Mar 2024 11:24:10 -0800 (PST)
Received: from m1x-phil.lan ([176.176.181.237])
 by smtp.gmail.com with ESMTPSA id
 9-20020a0564021f4900b00567e27c72c4sm1153365edz.62.2024.03.09.11.24.09
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Sat, 09 Mar 2024 11:24:09 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Subject: [PULL 19/43] hw/i386/pc: Remove pc_compat_1_4..1.7[] left over
 declarations
Date: Sat,  9 Mar 2024 20:21:46 +0100
Message-ID: <20240309192213.23420-20-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240309192213.23420-1-philmd@linaro.org>
References: <20240309192213.23420-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52f;
 envelope-from=philmd@linaro.org; helo=mail-ed1-x52f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: HAmRxQMrI5Fh

These definitions were removed in commit ea985d235b
("pc_piix: remove pc-i440fx-1.4 up to pc-i440fx-1.7").

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20240301185936.95175-2-philmd@linaro.org>
---
 include/hw/i386/pc.h | 12 ------------
 1 file changed, 12 deletions(-)

diff --git a/include/hw/i386/pc.h b/include/hw/i386/pc.h
index 5065590281..b958023187 100644
--- a/include/hw/i386/pc.h
+++ b/include/hw/i386/pc.h
@@ -288,18 +288,6 @@ extern const size_t pc_compat_2_1_len;
 extern GlobalProperty pc_compat_2_0[];
 extern const size_t pc_compat_2_0_len;
 
-extern GlobalProperty pc_compat_1_7[];
-extern const size_t pc_compat_1_7_len;
-
-extern GlobalProperty pc_compat_1_6[];
-extern const size_t pc_compat_1_6_len;
-
-extern GlobalProperty pc_compat_1_5[];
-extern const size_t pc_compat_1_5_len;
-
-extern GlobalProperty pc_compat_1_4[];
-extern const size_t pc_compat_1_4_len;
-
 #define DEFINE_PC_MACHINE(suffix, namestr, initfn, optsfn) \
     static void pc_machine_##suffix##_class_init(ObjectClass *oc, void *data) \
     { \
-- 
2.41.0

