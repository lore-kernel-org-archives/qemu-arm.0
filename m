Received: by 2002:a17:906:fcb7:b0:974:3dd3:6e73 with SMTP id qw23csp532285ejb;
        Thu, 1 Jun 2023 08:30:33 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ6mZNK2SNK6IbPg37sz5xC5EBb6/szSnI38RXq71u7Bujd9Cudg30rmtp54TTP+i6owEUGY
X-Received: by 2002:a05:622a:11c7:b0:3f3:9395:671 with SMTP id n7-20020a05622a11c700b003f393950671mr3023575qtk.0.1685633432750;
        Thu, 01 Jun 2023 08:30:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1685633432; cv=none;
        d=google.com; s=arc-20160816;
        b=O0FwbdH8VOriYLmpp7D5VA12fEKKdgKiANVmtBVuixrrVt3gwpHwvOi7Fb158RHzDd
         HK7MjEcoxOo2p2BUw6a3Kaodz+c4WBu3wn7fkBOJ8BpxvnLpBPhcMaNFSDiD0BZEfhU/
         oakkkWZEe7YIqTMQtsjGtxKTyx2D5YnrUUq6cwYRp3j47+oSn5IPLHOWtKDb2GN+z4gk
         BG8CQQS4hz+QVwzA7uPebugCaQdL4DXAmLhLFn+EIAgQBLZEfAF9BSyjRYJaQNKN+xt7
         xzwT1j9ExmVtzBBPSZ/Da5D2C9jqi/Ogz92SdkRnU61q0fo0STA249BiX1092XKN3u6K
         EqTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:organization:from:references:cc:to:content-language
         :subject:user-agent:mime-version:date:message-id:dkim-signature;
        bh=5o15EwaqP9wRg49cit4Rwy8RwUKqd+TTHLoBgusXj0o=;
        b=VZXszXT8kkcu2G0zRTQWWBoQLriaToaJvTcaNx+WXdHCoXY97/4G5lSShYhdxwYEPz
         ramXyuef2Efe5Dw/nOrpRAXq1kPpfiQivQW8CjIxi9UwLPVaGVJrgLEhN6od0PjdW8sh
         EUseSl4yjYzPHjyoIl5rU+Wn2gV8m9qdLHmgpshCFefvyQ1duuwsk5cbRrrgzv71og+H
         DNXrMuHJkI6ish1b3ur2V1P3LzBblETrJPS5r8drbsoGjBZJkuZlZaAjRvYG6tFNoHCL
         XGNKGy9WCoTJ8cbfV+ZgUBQFIa0HjY1Dyy9+bW+sGxoKcij9BxAqMcy5S/qL+YnsVNQm
         uUkg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=feaZISbx;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o20-20020ac85a54000000b003f6c1aedfcbsi9893950qta.210.2023.06.01.08.30.32
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 01 Jun 2023 08:30:32 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=feaZISbx;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1q4kFw-0003lK-2W; Thu, 01 Jun 2023 11:30:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcin.juszkiewicz@linaro.org>)
 id 1q4kFv-0003eF-0l
 for qemu-arm@nongnu.org; Thu, 01 Jun 2023 11:30:27 -0400
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcin.juszkiewicz@linaro.org>)
 id 1q4kFs-0004wy-Ci
 for qemu-arm@nongnu.org; Thu, 01 Jun 2023 11:30:25 -0400
Received: by mail-ej1-x632.google.com with SMTP id
 a640c23a62f3a-96f818c48fbso139417766b.0
 for <qemu-arm@nongnu.org>; Thu, 01 Jun 2023 08:30:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1685633422; x=1688225422;
 h=content-transfer-encoding:in-reply-to:organization:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=5o15EwaqP9wRg49cit4Rwy8RwUKqd+TTHLoBgusXj0o=;
 b=feaZISbx6PFuWAygz52GrdKkEmi2vGs8QKj7CY8lFGTIuJa7C+akznhfdjpT4IwWqy
 i+EM2Ke7xQVA41+RedaJJ9qe8kTCascDzDB0PNrWmxAyfnkbBwFz1TMldWgfvqFe7EOb
 riVXPhzzM1+IrtAi48x+Xrer02GMHAVWGcVmdrgwdwT2vRHg5JbcJTNXznBPii5JoyJH
 XSlF8YNP1ynUu8Nuvf21awfThQXiqQeViLlOMtGvpLAU1+qCplIAcb/MniBAf1ZOGdmn
 ryW1dnoOKtuG0u9hnmHPhfgu7GU1GRJ0To8n++LBq+QpGd5q9SwuIivUh1fjymyf9uYf
 Y2rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685633422; x=1688225422;
 h=content-transfer-encoding:in-reply-to:organization:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=5o15EwaqP9wRg49cit4Rwy8RwUKqd+TTHLoBgusXj0o=;
 b=ECX/DEEZXQ/oFzKSDRaSiBWqsHCHdglOe/sWyWBJ+0ViR6kJU/QVP8PGKKeRCRzQg2
 QcNaAzCqkbxkUD6Vtuyo2vlQRRVc1tkZE7kSwGG9uEpq3hCDKt459UK1PJeTkGEOWq2Z
 C7WsGgm9N4ckwSUg+xG2KKGqGk4zwCc66L4faLBmgxjkt6FN+1dbnn3G8IHTht3pI21r
 om29LXH3uwT1uVxa4FUSsqxZVzkNyp6eRAkzsjLNTELpUTP4IxC4fijFCoFF9tF4L0Kg
 3x/y+C2LreBhhzkT9iLJb4UwS+B+cxV/uVdsl/Ce/ZWUlci/LPaTCtNA8XiRo3kjgOnM
 CWfQ==
X-Gm-Message-State: AC+VfDzgX24rkYRVJtAkBivIn7JDzgnzbouY3fsO60ttJSK7QUtw/NaC
 3k1fmaZJKiComjY5rLIFISI+5A==
X-Received: by 2002:a17:907:3f1c:b0:970:d85:59e9 with SMTP id
 hq28-20020a1709073f1c00b009700d8559e9mr8113618ejc.5.1685633422525; 
 Thu, 01 Jun 2023 08:30:22 -0700 (PDT)
Received: from [192.168.200.206] (83.21.93.182.ipv4.supernova.orange.pl.
 [83.21.93.182]) by smtp.gmail.com with ESMTPSA id
 j11-20020a170906410b00b0096f689848desm10650997ejk.195.2023.06.01.08.30.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 01 Jun 2023 08:30:22 -0700 (PDT)
Message-ID: <da42c1fc-4adc-5eaa-2d72-6747b74f8ae8@linaro.org>
Date: Thu, 1 Jun 2023 17:30:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH 1/1] hw/arm/sbsa-ref: use XHCI to replace EHCI
Content-Language: pl-PL, en-GB, en-HK
To: Peter Maydell <peter.maydell@linaro.org>,
 Leif Lindholm <quic_llindhol@quicinc.com>
Cc: Graeme Gregory <graeme@xora.org.uk>, wangyuquan1236@phytium.com.cn,
 chenbaozi@phytium.com.cn, qemu-arm@nongnu.org, qemu-devel@nongnu.org
References: <20230531070229.334124-1-wangyuquan1236@phytium.com.cn>
 <20230531070229.334124-2-wangyuquan1236@phytium.com.cn>
 <lfcmvvqjp64wngrdk33bvkb3k7op53l24lcoslah2evsyh3esc@at7jnsnrto7h>
 <CAFEAcA8h9-YWUYsvuERttmsEK3xi+K+xasFdoWmnFm26S6npNw@mail.gmail.com>
 <b663fb55-dc8e-9fd8-9d82-7e693c3c4ad3@quicinc.com>
 <CAFEAcA_9Prr1xV2s1q2+GpWEnrsEEFT57bbLDnop5Hw3MaxM0A@mail.gmail.com>
From: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
Organization: Linaro
In-Reply-To: <CAFEAcA_9Prr1xV2s1q2+GpWEnrsEEFT57bbLDnop5Hw3MaxM0A@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::632;
 envelope-from=marcin.juszkiewicz@linaro.org; helo=mail-ej1-x632.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.1,
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
X-TUID: PhMRS8Uu8EHT

W dniu 1.06.2023 o 17:01, Peter Maydell pisze:
> On Wed, 31 May 2023 at 17:37, Leif Lindholm <quic_llindhol@quicinc.com> wrote:

>> Ah, thanks! That explains why we did the thing that made no sense :)
>>
>> To skip the migration hazard, my prefernece is we just leave the EHCI
>> device in for now, and add a separate XHCI on PCIe. We can drop the
>> EHCI device at some point in the future.
> 
> Why PCIe for the XHCI and not sysbus? At the time the board
> was originally added the argument was in favour of using
> a sysbus USB controller (you can see Ard making that point
> in the linked archive thread).

So something like below? I only tested does system boot into Debian.
To make it work also changes to EDK2 would be needed to list XHCI
controller in DSDT.

"info qtree" in QEMU monitor lists controller with usb devices
attached (added them by cli arguments).

 From 8f5af99a670be226a1dfc5b06cbdd3eff4841d27 Mon Sep 17 00:00:00 2001
From: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
Date: Thu, 1 Jun 2023 17:27:24 +0200
Subject: [PATCH] WIP: arm/sbsa-ref: add XHCI on sysbus

EHCI controller is not working as it requires 32-bit memory.
XHCI one should work fine.
---
  hw/arm/sbsa-ref.c | 13 +++++++++++++
  1 file changed, 13 insertions(+)

diff --git a/hw/arm/sbsa-ref.c b/hw/arm/sbsa-ref.c
index de21200ff9..0bc87abbf4 100644
--- a/hw/arm/sbsa-ref.c
+++ b/hw/arm/sbsa-ref.c
@@ -83,6 +83,7 @@ enum {
      SBSA_SECURE_MEM,
      SBSA_AHCI,
      SBSA_EHCI,
+    SBSA_XHCI,
  };
  
  struct SBSAMachineState {
@@ -120,6 +121,7 @@ static const MemMapEntry sbsa_ref_memmap[] = {
      /* Space here reserved for more SMMUs */
      [SBSA_AHCI] =               { 0x60100000, 0x00010000 },
      [SBSA_EHCI] =               { 0x60110000, 0x00010000 },
+    [SBSA_XHCI] =               { 0x60120000, 0x00010000 },
      /* Space here reserved for other devices */
      [SBSA_PCIE_PIO] =           { 0x7fff0000, 0x00010000 },
      /* 32-bit address PCIE MMIO space */
@@ -142,6 +144,7 @@ static const int sbsa_ref_irqmap[] = {
      [SBSA_EHCI] = 11,
      [SBSA_SMMU] = 12, /* ... to 15 */
      [SBSA_GWDT_WS0] = 16,
+    [SBSA_XHCI] = 17,
  };
  
  static const char * const valid_cpus[] = {
@@ -575,6 +578,15 @@ static void create_ahci(const SBSAMachineState *sms)
      }
  }
  
+static void create_xhci(const SBSAMachineState *sms)
+{
+    hwaddr base = sbsa_ref_memmap[SBSA_XHCI].base;
+    int irq = sbsa_ref_irqmap[SBSA_XHCI];
+
+    sysbus_create_simple("sysbus-xhci", base,
+                         qdev_get_gpio_in(sms->gic, irq));
+}
+
  static void create_ehci(const SBSAMachineState *sms)
  {
      hwaddr base = sbsa_ref_memmap[SBSA_EHCI].base;
@@ -804,6 +816,7 @@ static void sbsa_ref_init(MachineState *machine)
      create_ahci(sms);
  
      create_ehci(sms);
+    create_xhci(sms);
  
      create_pcie(sms);
  
-- 
2.40.1


