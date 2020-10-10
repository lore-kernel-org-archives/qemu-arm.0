Received: by 2002:ac2:4c26:0:0:0:0:0 with SMTP id u6csp3413939lfq;
        Sat, 10 Oct 2020 13:38:15 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwGEEDk7tiKjqA0vR3Nb32QDMGqFVY5ZcZZyNtYnQZyAwJhWoD34Q86jR488u9l3p2uSh7P
X-Received: by 2002:a25:6942:: with SMTP id e63mr23429251ybc.508.1602362295585;
        Sat, 10 Oct 2020 13:38:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1602362295; cv=none;
        d=google.com; s=arc-20160816;
        b=F75ydPtP5RRP9PVLV1AKWkN0wxFi9ufyR70ULrOHYzvKuXO8qMefby19dAVB1LzuQv
         6vkuqHnSY5JLXTOtzG5xZsnWLSuXB5JTuGg564Y/ul6fXlTsF80cQ75MZU0O4ttsTQHz
         5KsAZya4itvJeBM1gNF9C83mVEwye2WH98CFcdmo40zlw/eiNnDshrmtVEX1kzzUeaqs
         J9mcDSFzSm7zpvFkGLbNlmNmKsjOjpb/gl4E4w64jGQQK2QLztwKctt3e052Y9JgdKC/
         x3R+uPdGGm1xBn+dKdS3navvltCLvIVQNR6zpXARJ0jfo7vIyU/kaq1Dzv4FQI4PSnMB
         VHhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=aNNUhWwFlXOxHa7l9Duv+e4zB1nmUoxjDeC+01ryrtA=;
        b=YpEf/NyTjZamIUq2DTEIUF68JSNb7m9HPxy1Hk8DANe6i4aSQvzPMe31QA0a+XPHoa
         VrQ2yY3JXLOkOIRZfenQPd4slyr5pPN5wK1QRst7Yih5CivPKcTBMPYVjCQw7oJ6DrMC
         R4jdVP16/wM374gzrju2V6Fayi7a1IppwBuCdMJyAMbJzfUIUPQv2evxFpeXK2WN0tQB
         7AWSXaRbAKkiKEp4Kd3gEvsGwCGedlvb3+cnOpjV+dpp/4NYhC4Od77xhjhoizO2xt6L
         oozPxH3U4c9L70dJGvRUhawbYREyJa4CZ/imn3qykn3QYbpPWtvsnz+G4wAII4/RpBu3
         DvfA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=c68K9ZVC;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g4si12117633ybo.473.2020.10.10.13.38.15
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 10 Oct 2020 13:38:15 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=c68K9ZVC;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Received: from localhost ([::1]:46256 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kRLd8-0002Re-Fh
	for alex.bennee@linaro.org; Sat, 10 Oct 2020 16:38:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50858)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kRLcD-0001ys-VS; Sat, 10 Oct 2020 16:37:19 -0400
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443]:33496)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kRLcC-0006cs-EU; Sat, 10 Oct 2020 16:37:17 -0400
Received: by mail-wr1-x443.google.com with SMTP id b8so938882wrn.0;
 Sat, 10 Oct 2020 13:37:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=aNNUhWwFlXOxHa7l9Duv+e4zB1nmUoxjDeC+01ryrtA=;
 b=c68K9ZVCOMuCtf2nPmkz0E30RnWBeW719GkrbxEaMaYnqLQCUqfgDCzPBn4yGSIvNN
 /6PXNbh2bi7AS1f/+MBy48OyVNzLJKAZtVZMewVYhrm17aGztyDEVf4Jap5uDisBW5wC
 6i8bQNMMNtpVVx1Bt8TPG5rwSKGcYYRlB3wX91DyxIcEQTgK5y0DWYTvZjqQKf8qzfrt
 9Bd5ES4NicDFX3NvL7WpcN2P9EIIm/EjA4YlHPw/jdLsNFqoI+2dtgipoCZvusR7B87t
 tCNa44NC4DHe4tuNDaHsKVN9e+nTKvCxwITmfA3SB94B0/g2/JHOTXT8YLflz75jq2wY
 sBdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=aNNUhWwFlXOxHa7l9Duv+e4zB1nmUoxjDeC+01ryrtA=;
 b=LJ9hC/IczTo6CU5TEkyyyQI3WOfNqER/u3RAGwdSgBnvik39ofgf4n/DsRvWIe4XF1
 wgpjFUqp29zcw3g5ojPYF0eEg2dv4QKLGn9M0jpYpfe5iLJlDzq/fNKUCe4AmujFaMaS
 znReHKvphqKopVgQWjBRaY0CYfdsQySNr2s+Yvu+RgHiki2MTllp0MVxtF+oSa3GWus4
 AzOfkajq5SQWuBz6n067wxPxnlCPZ7WkMJaAlpfolsUmfgN8R+jNs+BF1URMT4UWCgT2
 /qkvc0UtVYLCUzcuchKgi3L+h1ExCNucBbw4Xz6h+BPGl6cKH/+CpT9yFXhhKxZBsgiZ
 ouYg==
X-Gm-Message-State: AOAM532qJRVoRCVddYH1mQJ7TKCgoq9qCpKLThI9io+Bx4j7EWQPClUT
 C0rMHZxWQOwNvNjJvHYvn21hdLh/v9s=
X-Received: by 2002:a5d:52ca:: with SMTP id r10mr20299525wrv.195.1602362234480; 
 Sat, 10 Oct 2020 13:37:14 -0700 (PDT)
Received: from localhost.localdomain
 (106.red-83-59-162.dynamicip.rima-tde.net. [83.59.162.106])
 by smtp.gmail.com with ESMTPSA id v17sm5661341wru.44.2020.10.10.13.37.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 10 Oct 2020 13:37:13 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 2/4] hw/timer/bcm2835: Rename variable holding CTRL_STATUS
 register
Date: Sat, 10 Oct 2020 22:37:07 +0200
Message-Id: <20201010203709.3116542-3-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201010203709.3116542-1-f4bug@amsat.org>
References: <20201010203709.3116542-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::443;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x443.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.001,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>, Luc Michel <luc@lmichel.fr>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Andrew Baumann <Andrew.Baumann@microsoft.com>,
 Paul Zimmerman <pauldzim@gmail.com>, qemu-arm@nongnu.org,
 Luc Michel <luc.michel@greensocs.com>, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: qGzgGMba1wU6

The variable holding the CTRL_STATUS register is misnamed
'status'. Rename it 'ctrl_status' to make it more obvious
this register is also used to control the peripheral.

Reviewed-by: Luc Michel <luc.michel@greensocs.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 include/hw/timer/bcm2835_systmr.h | 2 +-
 hw/timer/bcm2835_systmr.c         | 8 ++++----
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/include/hw/timer/bcm2835_systmr.h b/include/hw/timer/bcm2835_systmr.h
index 43df7ee488c..f15788a78d8 100644
--- a/include/hw/timer/bcm2835_systmr.h
+++ b/include/hw/timer/bcm2835_systmr.h
@@ -27,7 +27,7 @@ struct BCM2835SystemTimerState {
     qemu_irq irq;
 
     struct {
-        uint32_t status;
+        uint32_t ctrl_status;
         uint32_t compare[BCM2835_SYSTIMER_COUNT];
     } reg;
 };
diff --git a/hw/timer/bcm2835_systmr.c b/hw/timer/bcm2835_systmr.c
index ff8c5536610..b234e83824f 100644
--- a/hw/timer/bcm2835_systmr.c
+++ b/hw/timer/bcm2835_systmr.c
@@ -30,7 +30,7 @@ REG32(COMPARE3,     0x18)
 
 static void bcm2835_systmr_update_irq(BCM2835SystemTimerState *s)
 {
-    bool enable = !!s->reg.status;
+    bool enable = !!s->reg.ctrl_status;
 
     trace_bcm2835_systmr_irq(enable);
     qemu_set_irq(s->irq, enable);
@@ -52,7 +52,7 @@ static uint64_t bcm2835_systmr_read(void *opaque, hwaddr offset,
 
     switch (offset) {
     case A_CTRL_STATUS:
-        r = s->reg.status;
+        r = s->reg.ctrl_status;
         break;
     case A_COMPARE0 ... A_COMPARE3:
         r = s->reg.compare[(offset - A_COMPARE0) >> 2];
@@ -82,7 +82,7 @@ static void bcm2835_systmr_write(void *opaque, hwaddr offset,
     trace_bcm2835_systmr_write(offset, value);
     switch (offset) {
     case A_CTRL_STATUS:
-        s->reg.status &= ~value; /* Ack */
+        s->reg.ctrl_status &= ~value; /* Ack */
         bcm2835_systmr_update_irq(s);
         break;
     case A_COMPARE0 ... A_COMPARE3:
@@ -133,7 +133,7 @@ static const VMStateDescription bcm2835_systmr_vmstate = {
     .version_id = 1,
     .minimum_version_id = 1,
     .fields = (VMStateField[]) {
-        VMSTATE_UINT32(reg.status, BCM2835SystemTimerState),
+        VMSTATE_UINT32(reg.ctrl_status, BCM2835SystemTimerState),
         VMSTATE_UINT32_ARRAY(reg.compare, BCM2835SystemTimerState,
                              BCM2835_SYSTIMER_COUNT),
         VMSTATE_END_OF_LIST()
-- 
2.26.2

