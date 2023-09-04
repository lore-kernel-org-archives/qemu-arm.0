Received: by 2002:a17:906:cc96:b0:9a1:fa4e:495e with SMTP id oq22csp1444435ejb;
        Mon, 4 Sep 2023 09:14:39 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGC1qF3kUzzImGDkneVa35t0fzvgbyFSSQnZMU1gjvpIM3nswjHcU3lahAuvGxl6dNb4iof
X-Received: by 2002:a05:622a:c4:b0:403:eb5b:9569 with SMTP id p4-20020a05622a00c400b00403eb5b9569mr12109779qtw.21.1693844079600;
        Mon, 04 Sep 2023 09:14:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1693844079; cv=none;
        d=google.com; s=arc-20160816;
        b=gWS+cawoIkUSUn+ARnWv0t3a68eD+NWxNqcUNqm+pHyLzNMHsPXOkmG3/rYEUmgImu
         WJXs+ZqD4RlkRuS8iTNRKmCXrlaJvtFxnI7cLIrbozCGz+MKoZz9J1989//asqz/e4p5
         OhdDeQivf9PP9w2Vww+Eiq6930D7tt+ve31y2Uwy9p2Pt9RWDvGJ3o3PxDashxPm4slG
         ZtE1Apo8+QAgLlfqrE06JDuGkDd2Vdo8/UopeLEseaFS9ugXauL/67t3nQpnpB3agyjb
         r9TeZLLl6/k2Au1xdGzyIRmAwb76EYvdFSaL85RqO+w+FjNEz9yTFev9lodmtZsKAhjl
         GjSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=ZsTnNe2odIs1TlMwUjNe64GWSQVkGVh+b8/mlWNguvM=;
        fh=M4+wifAeNQ6fagA7lq67eYgVVAfcj+heqTkZZhMPaG0=;
        b=Pa+dKQ3WqeC6DeKqfTx9N5wt0IarrUGoIXPYN2U2b3JJI4Cx/BK8GVpnZkUxLDeQeo
         gWZ6BfnMAC+zKGuZuWi6qUgHxTw9f5P7mzs+nkWpKXl3vaHPkgPE+V7WJVMPjybCZmle
         gcEgULbJVyK2g9iD3W3Q1LS2XH/94tnFEmGtljTU1KiSzQmcT8DCiylbNGSXuahh6kuZ
         1/5gfHthCEvQc8J/rIo6RpLNFNl5IC6LvNpC1H2dyMijVfFmxJaHLb3LalclYtn/s4z8
         WhIRK3jYE3O9HpZNNP4ecoa2V/Cyph2D5OaZFX2fAsO4PACAwYVQCARkNsln8jInE6LR
         8Gjw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=g9QVPfK4;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d13-20020ac85acd000000b00403b102697fsi6827091qtd.294.2023.09.04.09.14.39
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 04 Sep 2023 09:14:39 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=g9QVPfK4;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qdCDf-0005hA-Eb; Mon, 04 Sep 2023 12:14:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qdCDc-0005aE-La
 for qemu-arm@nongnu.org; Mon, 04 Sep 2023 12:14:28 -0400
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qdCDa-0007mQ-Eg
 for qemu-arm@nongnu.org; Mon, 04 Sep 2023 12:14:28 -0400
Received: by mail-ej1-x62a.google.com with SMTP id
 a640c23a62f3a-9a63b2793ecso240037166b.2
 for <qemu-arm@nongnu.org>; Mon, 04 Sep 2023 09:14:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1693844065; x=1694448865; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ZsTnNe2odIs1TlMwUjNe64GWSQVkGVh+b8/mlWNguvM=;
 b=g9QVPfK4eZnVme7n94l/byTu2MOkqs/7+pfhpNlvhSSd0M99+ZL5OK59FjqmdoEL8u
 VgHW9cHqYqj5epCqSn1gETL0OQvsBXHUzWJ9bSdMe477etsXWR4ngCOh8yG8kcjd1btS
 z+U8pqD7Jzmd61Gq6atqUFUEie/q1yoT6sRV9T+gJNbu9k0pwXxwNMgQCzk4llc5AUqN
 2DKg+8KUO5DBn607uhsra33KwbegPgKc1NA+tPaA3qDA808Y5abKAyOmGxbyoLdsbMLb
 xUK0rWmAcu8B5DpFIZaPCmGNoy5MLtK/WqAp2j8MNkvjUVVbNKYiEXJJF7dVjCgSdWo+
 VMyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693844065; x=1694448865;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ZsTnNe2odIs1TlMwUjNe64GWSQVkGVh+b8/mlWNguvM=;
 b=PTWxbjZHMhsu8hDxGkSUWgRX7rSEcOqREaJ1nNKu34ho2mHG0Z+nZWv5fVbiGpkJLO
 F9SEI+Dnr0meoVPA+WZoFXZBfpOinbFMlcExJNYroZnBpMDrrY36046l0G0EEYLTfLu0
 P3VV8ywuhp0UOcXzUVoYh5hysrutHsdK4flmv49tAdJAriNfgwRSs1zgrFKfzBBO8fES
 DSNuDZ6Wn7lPuDqGMv9Dc+tJ4vsHf+CjoRSX04NcQbj7UZUuansaMPlCrWyVtcY90oVH
 xTYIBhTj7eChYkNMgUbxUlaXpZ0/xnzRaUf0uSSmyA7YXFo6sjRiCP7A3ekGntXzUjCm
 EY+Q==
X-Gm-Message-State: AOJu0YzERHLu7KQ21JKSj2rCOXrXjutZgaqKiWUwgfZ52JPOLrz9lWxg
 UIXbgRktZi0qRr/z/NaY4lzbDQ==
X-Received: by 2002:a17:907:75e6:b0:988:9b29:5653 with SMTP id
 jz6-20020a17090775e600b009889b295653mr6541467ejc.77.1693844065083; 
 Mon, 04 Sep 2023 09:14:25 -0700 (PDT)
Received: from m1x-phil.lan ([176.187.209.227])
 by smtp.gmail.com with ESMTPSA id
 f3-20020a170906824300b0099b921de301sm6338473ejx.159.2023.09.04.09.14.24
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 04 Sep 2023 09:14:24 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: Markus Armbruster <armbru@redhat.com>,
	qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>
Subject: [PATCH v2 19/22] linux-user/strace: Clean up local variable shadowing
Date: Mon,  4 Sep 2023 18:12:31 +0200
Message-ID: <20230904161235.84651-20-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230904161235.84651-1-philmd@linaro.org>
References: <20230904161235.84651-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62a;
 envelope-from=philmd@linaro.org; helo=mail-ej1-x62a.google.com
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
X-TUID: wivQpfPbZU6Z

Fix:

  linux-user/strace.c: In function ‘print_sockaddr’:
  linux-user/strace.c:370:17: warning: declaration of ‘i’ shadows a previous local [-Wshadow=compatible-local]
    370 |             int i;
        |                 ^
  linux-user/strace.c:361:9: note: shadowed declaration is here
    361 |     int i;
        |         ^

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 linux-user/strace.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/linux-user/strace.c b/linux-user/strace.c
index e0ab8046ec..cf26e55264 100644
--- a/linux-user/strace.c
+++ b/linux-user/strace.c
@@ -367,7 +367,6 @@ print_sockaddr(abi_ulong addr, abi_long addrlen, int last)
         switch (sa_family) {
         case AF_UNIX: {
             struct target_sockaddr_un *un = (struct target_sockaddr_un *)sa;
-            int i;
             qemu_log("{sun_family=AF_UNIX,sun_path=\"");
             for (i = 0; i < addrlen -
                             offsetof(struct target_sockaddr_un, sun_path) &&
-- 
2.41.0

