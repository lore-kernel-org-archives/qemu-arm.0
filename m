Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp4334257lfm;
        Sun, 5 Jul 2020 13:48:19 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzL5B55aSBZDPIgSz/23o4TN7dkn/uyXulHxcKo33+i6TCJwALWXB+bdskzkCCrsEn4xz+3
X-Received: by 2002:a25:2558:: with SMTP id l85mr25715348ybl.307.1593982099784;
        Sun, 05 Jul 2020 13:48:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1593982099; cv=none;
        d=google.com; s=arc-20160816;
        b=CWDshYjd78egnRAXyEixBA3oN8eFqVPMYmQYxZwO/1YnsgWWmSxQ7HMoSpJUcqgK4I
         1wLWrwCZN7bCi5dEYPa7RzMs+FtxobpbqQILw4Jw4uBlfMir+xCdXCjBIrRydO4+ghLO
         sdEHqVBoUMQRqbVZVtqnk/qTujRPMZjj7I9bToKpoyJEGe2oy6eOAb80t4CpG7Xi1ipK
         mZkYAdrT117f+pdMy0ax8gC0nTFIQgDoYdRV4Ahe0VLNv48EnNO++Smu310mkjew0Jjx
         MqeVFhRfYFDXs9piO0dEzGlYZWpDXJHVnhZyc3LkvkEzJa8iZPO8kKVt9d8KoogWjSLA
         P7qw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=97pUZmX/67wbHP9Fb1MFklUqwh59qQdvzxeqL5/W8D4=;
        b=tVh2Za1+82Ugn+4lKOnipyNXbh0pLS8+h32yxO1OrwWdD7nTjbJby48ENZQR9/T+w2
         giNv9upbZrGHcJfofbLMx2uS2V7aaPjKpWLHmNUJZUCtWgp/lPwF6uX59OWqefsYSiqd
         82QQ7VW8mt/pEhSKpHcN9hGEGDXE1HojQzOlc/6K9u10Do/Wsx24e8UvMyTRx5DFj0up
         QFDoFEltxAD58kNtpcD4f5F1LXyEH2CG5DLTSn3egyK3YfAeMpLvfYygXpfuPXH9yGA0
         vXW0zTnHafueqvaU8/pzv3oFqJNKoN0fNu9omOJNeKT+Af4/ar8ZjMn41lnTUqwSohcO
         23GA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=uGqxQPLP;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v82si18241994ybb.285.2020.07.05.13.48.19
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 05 Jul 2020 13:48:19 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=uGqxQPLP;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Received: from localhost ([::1]:38718 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jsBYh-0006Db-1Z
	for alex.bennee@linaro.org; Sun, 05 Jul 2020 16:48:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50646)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jsBX4-0004PM-DG; Sun, 05 Jul 2020 16:46:38 -0400
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344]:56313)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jsBX2-0000p1-UD; Sun, 05 Jul 2020 16:46:38 -0400
Received: by mail-wm1-x344.google.com with SMTP id g75so37066778wme.5;
 Sun, 05 Jul 2020 13:46:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=97pUZmX/67wbHP9Fb1MFklUqwh59qQdvzxeqL5/W8D4=;
 b=uGqxQPLPNagqvAJlLJufXSkR4jInpyfz+KVDjHLZRwMN7Kk+EOLJ8d7pUkBc5uYkRU
 KhM3bHfMakJN5r/Gd89cq6gN+4Dj55IObDyjHHGQ7caqcXncD36kZ6MUHTSxqgeT8wh8
 FELegVmolU+gYrBr/FgqTSU7Q2WQA17iTTxlNbjgHn2bczrB++MF+m101hfKA3bdxUKy
 39jAyhv/7D34Yslqnv1NwGF5m37xMJNnQc70xGdCVxqQPdYP4GxiH/Ter2y9/roh2rCO
 503gsou0Mk2FrlOYzZ3x43LZRLGCKo9+Fkxj0MIm9rSwl1KTBUEx6fO0O9maHK/PulDW
 z1qQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=97pUZmX/67wbHP9Fb1MFklUqwh59qQdvzxeqL5/W8D4=;
 b=a/leI7WlTyFUxdyaIKuNgx255ajjIPyPFxnnw3trSuJ1HLjryDxL1I+/zTPkEj/1qD
 oXSEElzbh03lM6GKpnJOAYHJxGTuPpbz9r8LAiAHHTaR5AOpki2/+ibXBHM5eGQ/NTsk
 NrOWhuVRlMXhFwLEKUyW/QMR3DeZRk8kOwrleeywYXrcO7pA8TDlUez0ekwLvV5UxkP3
 9akmOFx5upN1F1oXza+z6WAI3+O8V769NTpyyYShoKzWipoyMEGPUG0NyJUhLBP+FkVm
 kr9uW7aqJ1oo7moi9c4yvOq2LvIY+2zkuzDAbeoIMsdGaB9r0yK161ls9WwQFgaTGqeB
 Jb5g==
X-Gm-Message-State: AOAM533UA4J2ik46MKDtoyliDPXzA2hsISiNLykvy9LFRqAelP245IrB
 oHsqgGUBZv4gfgouP6EarCclO9N50Kw=
X-Received: by 2002:a1c:32c4:: with SMTP id y187mr47170302wmy.79.1593981995180; 
 Sun, 05 Jul 2020 13:46:35 -0700 (PDT)
Received: from localhost.localdomain (1.red-83-51-162.dynamicip.rima-tde.net.
 [83.51.162.1])
 by smtp.gmail.com with ESMTPSA id g144sm51397817wme.2.2020.07.05.13.46.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 05 Jul 2020 13:46:34 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 02/10] hw/sd/pl181: Rename pl181_send_command() as
 pl181_do_command()
Date: Sun,  5 Jul 2020 22:46:22 +0200
Message-Id: <20200705204630.4133-3-f4bug@amsat.org>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20200705204630.4133-1-f4bug@amsat.org>
References: <20200705204630.4133-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::344;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x344.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: 0
X-Spam_score: 0.0
X-Spam_bar: /
X-Spam_report: (0.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=1, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Alistair Francis <alistair@alistair23.me>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: qJKKcUCTRVzJ

pl181_send_command() do a bus transaction (send or receive),
rename it as pl181_do_command().

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/sd/pl181.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/sd/pl181.c b/hw/sd/pl181.c
index 649386ec3d..3fc2cdd71a 100644
--- a/hw/sd/pl181.c
+++ b/hw/sd/pl181.c
@@ -173,7 +173,7 @@ static uint32_t pl181_fifo_pop(PL181State *s)
     return value;
 }
 
-static void pl181_send_command(PL181State *s)
+static void pl181_do_command(PL181State *s)
 {
     SDRequest request;
     uint8_t response[16];
@@ -402,7 +402,7 @@ static void pl181_write(void *opaque, hwaddr offset,
                 qemu_log_mask(LOG_UNIMP,
                               "pl181: Pending commands not implemented\n");
             } else {
-                pl181_send_command(s);
+                pl181_do_command(s);
                 pl181_fifo_run(s);
             }
             /* The command has completed one way or the other.  */
-- 
2.21.3

