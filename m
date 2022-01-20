Received: by 2002:ac2:4c90:0:0:0:0:0 with SMTP id d16csp944065lfl;
        Thu, 20 Jan 2022 14:38:00 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxJa/I7i9H56jcFxr06XFwiUGspFAh2Be+OUWyG6HbC/STRg5Pfmak7R6Mfsy0TixijK1SR
X-Received: by 2002:a25:2106:: with SMTP id h6mr1982177ybh.154.1642718279953;
        Thu, 20 Jan 2022 14:37:59 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1642718279; cv=none;
        d=google.com; s=arc-20160816;
        b=s7NXKNeQxcwCJBQB9IPOxjE8bIIp+qNtRMu5O3ZqBl3OdlX5J0/UVZ44cb2BRwJZ4I
         snmPBZtRQij9pKhQAifuwiW+R7syfSiebMwDMJC9rl9Dxo2YCVdH2PMK5z+twaUErOSc
         /LnWN7EenYjvvgwgoz/Q3amgLv1AJ/jc/ZzxbKh7aTsBT3/xxjP/SXY9U+CFk/CsZ+cH
         MMQBtkug1/bt5yXCAI1CNilvEnchx+qGOSv+BBD3FezVtxWf34p5dfHLobWrlwuTj5p1
         7pN5XLiJcwGVTqOyQjBeQCvwonS45VnUFTAQM1YPpNHLiljcKTSc0OTgctxMExF1ksig
         2Ddg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=LHsZc0OIAsB+x7RT9WDlnUuxuaLdKPkOwM4GbPx5oR8=;
        b=jdNctofsUDsIbXVAuzbADrDrEdr2uRAkimgqZK5x6QKgQpeBOsjgK3NiRVQdnw0jzn
         +di/4huEu/5LmXpX4JL33xpLGNsimzszwrdnmeDnJis2l0J2ysmZJsRkvirCCZnh3BXQ
         dAe8HnuNL6cgCDsTh373yvD9/edgwWSiNKf3ESi19Eo72XqqBtMMHBgR2wTt4XvBbdoM
         LkAnMGiYT7TYDVpyglz8bhGg2bNROwzR68eZwwp4BJloMSIsioeNQXnm1jO5YSJLB73n
         NZ1gA0N6uCeSOcJFqYKSj4QzIt/9Rlbt8IpH8V9Y8Pu725cthxNU9jCH9Vsw28AjRqk0
         GYhw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=bHX+iv1l;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 136si718606ywo.574.2022.01.20.14.37.59
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 20 Jan 2022 14:37:59 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=bHX+iv1l;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:56832 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nAg47-0007TK-5K
	for alex.bennee@linaro.org; Thu, 20 Jan 2022 17:37:59 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34958)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nAZsK-0003JW-FQ
 for qemu-devel@nongnu.org; Thu, 20 Jan 2022 11:01:24 -0500
Received: from [2a00:1450:4864:20::32c] (port=43742
 helo=mail-wm1-x32c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nAZsG-0002XC-6i
 for qemu-devel@nongnu.org; Thu, 20 Jan 2022 11:01:23 -0500
Received: by mail-wm1-x32c.google.com with SMTP id
 e9-20020a05600c4e4900b0034d23cae3f0so14829229wmq.2
 for <qemu-devel@nongnu.org>; Thu, 20 Jan 2022 08:01:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=LHsZc0OIAsB+x7RT9WDlnUuxuaLdKPkOwM4GbPx5oR8=;
 b=bHX+iv1ldqTWNU/M8d7Skkf23XawKZjosywMS/RVouZBwSq4SlbYtWYZLEZGgvflpK
 JTt3jUq862cJfoa431ZMkGl0/XFGGkber+dap5dD8kgqeuGgti+8lGpOOTdAL+tearb0
 4Hnko+eJMf/APwr2XrwSHJn3kEasCJVfA7BJOT9hXtZ286N2bmsVkmT1FGP3z358qBjR
 kEXfbinrFiLUl+KB9nWs97t7PmonVUYAE6SLqSfXmmJVPQLikEV6Z5wLp6wJV+wwLpmf
 9GUvfrGZQpxlmBhmcSBPKU0kKeKdnE1UyUZ0tEws+6g06Pd/IBEP+9n5pmRwWASsJIH8
 IBMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=LHsZc0OIAsB+x7RT9WDlnUuxuaLdKPkOwM4GbPx5oR8=;
 b=QdROZnsabUz9+KwxENnPKuXcH0sUBpNvNp/3YWMgVVRVp5xDxNIkPwIJIbh136G2zs
 ubtcZiL8/sQlh63t65J02HzuAJ06wJ4wjtTb6UF62XT34IdCDAl/sdwqPprVUBXSYZM6
 IzTFoWx8CkH2THJR19kWrv8gPYuhU2CXe9rz39ElRNoOJptM2xGqME0Fy3iE0PBfhewT
 46swPoRtYedyy5aF2PPZjSArZqMDhbqYzIWsib/8I/CETR1QPVFkAkKd1IMVetxZ3NbX
 WnXoZ4Gvhdr+uDJRgwUFAMb/GZ+LwYTw6FaRdl5tHfXQ4vfVFidZuucJOV8l0WXJCleu
 rQTw==
X-Gm-Message-State: AOAM533gh8Dm0k2eGt627L3gQXtnAV2bWqqrJ2cXD8rbU30n/rT1MHAC
 zLoiZ53zpSDDVVnpSYkIQW+iZIjZ9VMx8Joos7WMwQ==
X-Received: by 2002:a5d:644a:: with SMTP id d10mr3624441wrw.295.1642694477967; 
 Thu, 20 Jan 2022 08:01:17 -0800 (PST)
MIME-Version: 1.0
References: <20220111084546.4145785-1-troy_lee@aspeedtech.com>
 <20220111084546.4145785-3-troy_lee@aspeedtech.com>
In-Reply-To: <20220111084546.4145785-3-troy_lee@aspeedtech.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 20 Jan 2022 16:01:06 +0000
Message-ID: <CAFEAcA_AJumJSKEUoxSiu5n3a8cPwdG_Xqx+hVko8sE0WdsjrQ@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] This patch includes i3c instance in ast2600 soc.
To: Troy Lee <troy_lee@aspeedtech.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::32c
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32c.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Andrew Jeffery <andrew@aj.id.au>, qemu-devel@nongnu.org,
 hailin.wu@aspeedtech.com, leetroy@gmail.com,
 "open list:ASPEED BMCs" <qemu-arm@nongnu.org>, Joel Stanley <joel@jms.id.au>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: pzQCg6vllV+2

On Tue, 11 Jan 2022 at 08:46, Troy Lee <troy_lee@aspeedtech.com> wrote:
>
> v3:
> - Remove unrelated changes to SPI2 address
> - Remove controller irq line
>
> v2: Rebase to mainline QEMU
>
> Signed-off-by: Troy Lee <troy_lee@aspeedtech.com>

This turns out not to build on macOS or on 32-bit hosts
because of format string issues -- you can't portably
use %lx to print uint64_t or hwaddr types. I have folded
in the following fix:

diff --git a/hw/misc/aspeed_i3c.c b/hw/misc/aspeed_i3c.c
index 43771d768ad..f54f5da522b 100644
--- a/hw/misc/aspeed_i3c.c
+++ b/hw/misc/aspeed_i3c.c
@@ -150,7 +150,8 @@ static void aspeed_i3c_device_write(void *opaque,
hwaddr offset,
     case R_I3C_VER_TYPE:
     case R_EXTENDED_CAPABILITY:
         qemu_log_mask(LOG_GUEST_ERROR,
-                      "%s: write to readonly register[%02lx] = %08lx\n",
+                      "%s: write to readonly register[0x%02" HWADDR_PRIx
+                      "] = 0x%08" PRIx64 "\n",
                       __func__, offset, value);
         break;
     case R_RX_TX_DATA_PORT:
@@ -231,13 +232,15 @@ static void aspeed_i3c_write(void *opaque,
     case R_I3C6_REG1:
         if (data & R_I3C1_REG1_I2C_MODE_MASK) {
             qemu_log_mask(LOG_UNIMP,
-                          "%s: Not support I2C mode [%08lx]=%08lx",
+                          "%s: Unsupported I2C mode [0x%08" HWADDR_PRIx
+                          "]=%08" PRIx64 "\n",
                           __func__, addr << 2, data);
             break;
         }
         if (data & R_I3C1_REG1_SA_EN_MASK) {
             qemu_log_mask(LOG_UNIMP,
-                          "%s: Not support slave mode [%08lx]=%08lx",
+                          "%s: Unsupported slave mode [%08" HWADDR_PRIx
+                          "]=0x%08" PRIx64 "\n",
                           __func__, addr << 2, data);
             break;
         }

which also includes a small grammar fix, adds the missing
trailing newlines, and includes the "0x" prefix to make it
clearer to the user that the values printed are hex.

thanks
-- PMM
