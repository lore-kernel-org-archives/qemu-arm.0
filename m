Received: by 2002:a17:906:1c8e:b0:a51:b7b1:b069 with SMTP id g14csp1183984ejh;
        Mon, 8 Apr 2024 03:52:24 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUqAL8NXRelRcaNVMzfauH5qY3uBOntFh1j2HJNyWWQOqkBu3pECEcDzBr3NeIGgOK0roEPhbwMJ9tLv/kiO6NaXzOwoJTA
X-Google-Smtp-Source: AGHT+IFhuoFqujRddAI2zBEKobZ2PRToxUfClNoMZoqF5beYrBCZQlolK73eeXsaqmwiDJC0F9dG
X-Received: by 2002:ad4:5c81:0:b0:69b:144d:bd75 with SMTP id o1-20020ad45c81000000b0069b144dbd75mr4483080qvh.47.1712573544405;
        Mon, 08 Apr 2024 03:52:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1712573544; cv=none;
        d=google.com; s=arc-20160816;
        b=zDCx6dlDx6ESuBq91O/NwUxSJvPMFsFAs3K3OGzvf22ZZL6FCe1n2RBSVlJcGk7ZQC
         BUQ5Z34dnJImMoOxIX16Z/q9KlBewFjoxT/I/hby4eZoz3PVnq8acNcx4cMgdnAllfUt
         dmRxvAtuhOwYSg0Z/mJETlwl/grAb8QKw++LBGmfHYigjJ8ozzNHKBp5ZerZG2xC6Uxf
         4ktxcxO3iFGCRZyeRXwARpZip46zYLyDpbqoNjAAZx0sOb/CobNQE+K/T5s2Cb8iuyJV
         2vCZ6+m2mE3IokotQuS0qVslnsR+fY6tzds3ea5dUEHYeuC2JSSNeYD0eO+hjUlaRfqF
         sfeg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=TGK9qftknixU9heZO350MkV2K3QN1Ehw0AuOxkZ5V7g=;
        fh=UxSwDIDxDAC+vOQTr/HC3AvyDh8GAic2CT/1oPYVdRA=;
        b=sQCNEiyiufm1WSOayFbh6B89sx8lAv9+xKd+pgzHkKlNi5q7RyeQFA1hbpXbVK+XRn
         Q29Jp5Ny8+uVtoMRko2GLC/zldHcKIGonAYhEaYWiQangdaF1oJ1endjiKDfihijGzos
         E9Qt+oKAg+ZYoRtu6Rjgz60Gyor8mvbGEFK20iTmZpdnnjOUB0piJHyj8kmq41+GcCqf
         iQdq27oQMmW8kAoPclEI8yjXCovIS3EWr/Xg6dJu3RtQFH8autaAtxL5hG+926y4+BoN
         7d6cgGSbQfhVbq6i2qnf3sUe9wrTzEQ2v4CoHw7lKhVZNeHXPMsx3xDUE8ZWmie0WMj1
         pZPQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Ss3eciLo;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b5-20020a0cbf45000000b0069b2064b981si864260qvj.442.2024.04.08.03.52.24
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 08 Apr 2024 03:52:24 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Ss3eciLo;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rtmbh-0002sV-Su; Mon, 08 Apr 2024 06:52:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rtmbf-0002rz-Qz
 for qemu-arm@nongnu.org; Mon, 08 Apr 2024 06:52:07 -0400
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rtmbd-0007rT-8Y
 for qemu-arm@nongnu.org; Mon, 08 Apr 2024 06:52:06 -0400
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-4162b74f2a1so26069435e9.3
 for <qemu-arm@nongnu.org>; Mon, 08 Apr 2024 03:52:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1712573523; x=1713178323; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=TGK9qftknixU9heZO350MkV2K3QN1Ehw0AuOxkZ5V7g=;
 b=Ss3eciLoqlmCl7g5mhOwqMCpsTC9n52vVcU83tD27d1YYCuNpVJ2RDViszBd9qztNF
 uKwy/8k85uw4/oXbMb/R8KiTvJRRGY5fT7mKucRNkuNPn3gfURU13sRrglkjgl7Okt4K
 jYNgeDDivuybgvmC1+IqfZ4X0WeRyrwly4/nkELSavi9Gyrg0d7ff+SmGIdoNF2Lo4mF
 5bh7xJ6WFfJ5Jg1I4tqMZ18sm7p5OMYFvRQdr2PPKhAXekDIHGGt/Y7stPMuCzz7xEN+
 nhvmjXu9E8qlHhGG2X8UgOjRSVt4LdGjc1C9L++P/nESkQuMRT6ARSqMEF4AfoPT3nFZ
 pEEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712573523; x=1713178323;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=TGK9qftknixU9heZO350MkV2K3QN1Ehw0AuOxkZ5V7g=;
 b=QtNoCHhDU1V2xRhg5Ex+9t4NskmRrfF9RIQtU5dr+UTB446+bZMOG4qRVF4D3eVS2U
 oOLretFtrC/ECPFW7kd5U0IOGMv3KPWZXXL6aa5eBACGxqTXMMs4TePvPKfBmP368Gne
 iQGmdiv1O4Ildrgd1tlHragO3DXegavvis2e8rYtwClHpOpXaHwdRZVpkL/rd2Xebgu/
 HkZLa4LGKq3fNoeConvU3nQSj2DUNoigUUEPXCGIZI39e9Qv2YhSonnBt+jwgRoWr0Lu
 c/uvWhq+id4uKsKFYgBoXD29I1xPM606sCNfN7FJeI6Ypl1OuSBVBlZJQKSFuBvyrG0v
 9ElQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUVdFMuX1jeG/xEpKsNCwbc6ok9q5ySIieLbtjJgAJ9F8jPugWMdNoqyITqDoV9C6dZaODMfbJO4MilBB2NqBIM/8HE
X-Gm-Message-State: AOJu0YzZMsFEaa82/nZzcdxT061ZOrclry+LfACX/mU6PoxXTW5RefMG
 /w2VKqFZke/9CvMK//T1iTpTd4h+rlxdfG4FZy4OHMzzls1tCHPmiQbzJEVCShk=
X-Received: by 2002:a05:600c:4f83:b0:416:5a88:4b49 with SMTP id
 n3-20020a05600c4f8300b004165a884b49mr2855420wmq.15.1712573523640; 
 Mon, 08 Apr 2024 03:52:03 -0700 (PDT)
Received: from m1x-phil.lan ([176.176.144.67])
 by smtp.gmail.com with ESMTPSA id
 t8-20020a05600c450800b004147db8a91asm16599890wmo.40.2024.04.08.03.52.02
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 08 Apr 2024 03:52:03 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Jason Wang <jasowang@redhat.com>, Alexander Bulekov <alxndr@bu.edu>,
 qemu-arm@nongnu.org, Chuhong Yuan <hslester96@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH-for-9.0? 2/2] hw/net/lan9118: Fix overflow in TX FIFO
Date: Mon,  8 Apr 2024 12:51:49 +0200
Message-ID: <20240408105149.59258-3-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240408105149.59258-1-philmd@linaro.org>
References: <20240408105149.59258-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32a.google.com
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
X-TUID: bYZee+5onAv7

When the TX FIFO is full, raise the TX Status FIFO Overflow (TXSO)
flag, "Generated when the TX Status FIFO overflows" [*].

Broken since model introduction in commit 2a42499017
("LAN9118 emulation").

When using the reproducer from
https://gitlab.com/qemu-project/qemu/-/issues/2267 we get:

  hw/net/lan9118.c:798:17: runtime error:
  index 2048 out of bounds for type 'uint8_t[2048]' (aka 'unsigned char[2048]')
    #0 0x563ec9a057b1 in tx_fifo_push hw/net/lan9118.c:798:43
    #1 0x563ec99fbb28 in lan9118_writel hw/net/lan9118.c:1042:9
    #2 0x563ec99f2de2 in lan9118_16bit_mode_write hw/net/lan9118.c:1205:9
    #3 0x563ecbf78013 in memory_region_write_accessor system/memory.c:497:5
    #4 0x563ecbf776f5 in access_with_adjusted_size system/memory.c:573:18
    #5 0x563ecbf75643 in memory_region_dispatch_write system/memory.c:1521:16
    #6 0x563ecc01bade in flatview_write_continue_step system/physmem.c:2713:18
    #7 0x563ecc01b374 in flatview_write_continue system/physmem.c:2743:19
    #8 0x563ecbff1c9b in flatview_write system/physmem.c:2774:12
    #9 0x563ecbff1768 in address_space_write system/physmem.c:2894:18
    ...

[*] LAN9118 DS00002266B.pdf, Table 5.3.3 "INTERRUPT STATUS REGISTER"

Reported-by: Will Lester
Reported-by: Chuhong Yuan <hslester96@gmail.com>
Resolves: https://gitlab.com/qemu-project/qemu/-/issues/2267
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/net/lan9118.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/hw/net/lan9118.c b/hw/net/lan9118.c
index 7be0430ac5..7a1367b0bb 100644
--- a/hw/net/lan9118.c
+++ b/hw/net/lan9118.c
@@ -795,8 +795,11 @@ static void tx_fifo_push(lan9118_state *s, uint32_t val)
             /* Documentation is somewhat unclear on the ordering of bytes
                in FIFO words.  Empirical results show it to be little-endian.
                */
-            /* TODO: FIFO overflow checking.  */
             while (n--) {
+                if (s->txp->len == PKT_SIZE) {
+                    s->int_sts |= TXSO_INT;
+                    break;
+                }
                 s->txp->data[s->txp->len] = val & 0xff;
                 s->txp->len++;
                 val >>= 8;
-- 
2.41.0

