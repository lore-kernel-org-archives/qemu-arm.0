Received: by 2002:a17:505:3f8c:b0:1be9:327d:8ee3 with SMTP id bm12csp888397njb;
        Thu, 1 Aug 2024 05:05:31 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWvG9I0wywcKFsKIKptTcFWEqbyWSgJL/9OE32gVE+Ieg9VvDMJJ/1XjtaMCItBEH8OTxHUL3xuep2ZKfcBuFJY+a37IzRw
X-Google-Smtp-Source: AGHT+IFy/LTJalfC4NYaw1dtjTwsI5NAQUutUmleKJPppTfhGtPULxNcK/6eelFtEy8xm1uxA9t8
X-Received: by 2002:a05:6358:998d:b0:1a8:c0fd:cf2d with SMTP id e5c5f4694b2df-1af2ed4f14amr126051355d.9.1722513930966;
        Thu, 01 Aug 2024 05:05:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1722513930; cv=none;
        d=google.com; s=arc-20160816;
        b=zMqnmRP37g7WurzEau394Ym0EinGpCXAQQVqSZYQR/yKa752XHBB92V75Q+1qZpvYq
         bVU3S7Sby7n+xj73euODLIl7GuTSUGZHn7TfD1WPbyWQpLWL6zfKJzYOpGxEgwQeaXpv
         os/waVog3GLJqYI+fzFFl7UaNVbHogn3ilutZG4K86rP109FT9C5UWhRXNsw8i8/oLt5
         S0oRcTiEyhOoq2TqO0j9BcQg0UrWTy/dQSKCo/fNbZ00vtEQKXR3z4De6272Sbl91shB
         QgDK0JNtu3eq4XqBIJ4UFr/uqvin2D9JrJ+J7ubfDYsx5NKe7N+q1R/O/hBos2FQT6qP
         zsag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:from
         :content-language:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=GEulAVszEy+67DY4K5qrndX4XxVofukQTlttO1gOKBE=;
        fh=DBwo5oYV+Zl89FPcGyBzo6mnqwnGCoM6YpiQGc4/RNc=;
        b=vWQ4Qz/qzD85GDlKyVxqFHp0MqvzNK/lvDbjVNgOT7ZQa68LSxfzcSy2ZD7D/+2XXU
         Fgbp3bOa47pMy+8rRgJWbW9p+meToNpppS1o0H34YDfFaYcC9EdNPKquxio54d6JiMLl
         PJDtqwcPFBeL6IwtnB9yTBsHpsBXzCpbFTisscGdbx6JI8ZpIAQ5JVst+KgSneXMAgEO
         Wv0QQxdX+qkgU63hUdI5rrjFZPb4MJu+t2e8SHmwovMZiPoSIeS8JSmweFJY0V8Z3ngp
         Oiy2TGu1oPvya8/RXq6hPBFEyHptuySI0YdTQO8qBB4rNZj1jL8+7yyeP94/EEFyPa1q
         GPLw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@free.fr header.s=smtp-20201208 header.b=Vph3yFZo;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=free.fr
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a1e0cc1a2514c-831b0d93574si2292462241.77.2024.08.01.05.05.30
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 01 Aug 2024 05:05:30 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@free.fr header.s=smtp-20201208 header.b=Vph3yFZo;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=free.fr
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sZUYb-0000fl-Dv; Thu, 01 Aug 2024 08:05:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ludovic.delabre@free.fr>)
 id 1sZUYX-0000er-Qc
 for qemu-arm@nongnu.org; Thu, 01 Aug 2024 08:05:18 -0400
Received: from smtp6-g21.free.fr ([2a01:e0c:1:1599::15])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ludovic.delabre@free.fr>)
 id 1sZUYV-00012q-DN
 for qemu-arm@nongnu.org; Thu, 01 Aug 2024 08:05:17 -0400
Received: from [IPV6:::1] (unknown
 [IPv6:2a01:e0a:a48:7810:e5ea:2ff8:54c0:2d41])
 (Authenticated sender: ludovic.delabre@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPSA id CD8BC78034D
 for <qemu-arm@nongnu.org>; Thu,  1 Aug 2024 14:05:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1722513906;
 bh=r9v8c3CrbrNrxGIbOIvCPJo6C140489oIKQl6G9GjgM=;
 h=Date:From:Subject:To:From;
 b=Vph3yFZov6nfxehiUaimpwnczWIlk8vC/3ABhWqnLCaR0dRVNSXFtEmTP6OxZ7BRh
 lY8X6wfgzakUY5H1CxH6TXxpsfwIKqfVgOKlhXK+JkVs4EESVJGtFAcmaaFSGxJEmJ
 cIeKaN/Zyt0q8TCfc3ZfRHuZsoL0pwu3a2athD5+Fxf0Ouz3N+I1BcbDaoa59jJk99
 k/cRLNSuaZoTu4DDIsYzO4wfViGgEzJa6CC9gAPaS3BvdzH73pT5a87j+58NpDNeGN
 DQYbmbA18Mfg4TzQLIM26kjcfFoysxxNUFMDr6vEXQy/Dfp+tzvtuZ4ND99YPdBQUL
 6iYLz4jky09WQ==
Content-Type: multipart/alternative;
 boundary="------------2MeWP35UsZpy0nU6mqfE6jSY"
Message-ID: <7ef15cde-1d49-4f7f-81fd-5c81b6f564a9@free.fr>
Date: Thu, 1 Aug 2024 14:05:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
From: Ludovic Delabre <ludovic.delabre@free.fr>
Subject: Question about Raspberry Pi A+ entry point
To: qemu-arm@nongnu.org
X-Antivirus: Avast (VPS 240801-2, 1/8/2024), Outbound message
X-Antivirus-Status: Clean
Received-SPF: pass client-ip=2a01:e0c:1:1599::15;
 envelope-from=ludovic.delabre@free.fr; helo=smtp6-g21.free.fr
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_IMAGE_ONLY_32=0.001, HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_REMOTE_IMAGE=0.01 autolearn=ham autolearn_force=no
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
X-TUID: dB5Thw04eA44

This is a multi-part message in MIME format.
--------------2MeWP35UsZpy0nU6mqfE6jSY
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hello everyone,

I'm working as an a hobbyist OS developer on a multi-architecture 
targets which includes a Raspberry Pi A+.

Every examples of bare bones I could find out there, sets their kernel's 
start address at 0x8000.

But when I invoke QEMU using a flatten kernel image:
|qemu-system-arm -s -S -m 512 -M raspi1ap -kernel kernel.img|

After connecting to the GDB server, the CPU starts at @0x0.

If I understood correctly, at that address a very small boolader was setup:

|static const ARMInsnFixup bootloader[] = { { 0xe28fe004 }, /* add lr, 
pc, #4 */ { 0xe51ff004 }, /* ldr pc, [pc, #-4] */ { 0, FIXUP_BOARD_SETUP 
}, #define BOOTLOADER_NO_BOARD_SETUP_OFFSET 3 { 0xe3a00000 }, /* mov r0, 
#0 */ { 0xe59f1004 }, /* ldr r1, [pc, #4] */ { 0xe59f2004 }, /* ldr r2, 
[pc, #4] */ { 0xe59ff004 }, /* ldr pc, [pc, #4] */ { 0, FIXUP_BOARDID }, 
{ 0, FIXUP_ARGPTR_LO }, { 0, FIXUP_ENTRYPOINT_LO },|

  After returned from the board setup, both r1 & r2 are set respectively 
at the board ID (FIXUP_BOARDID) and the address of the ATAGS structures 
(FIXUP_ARGPTR_LO).

|(gdb) x/4i $pc => 0xc: mov r0, #0 0x10: ldr r1, [pc, #4] @ 0x1c 0x14: 
ldr r2, [pc, #4] @ 0x20 0x18: ldr pc, [pc, #4] @ 0x24 (gdb) x/8x $pc 
0xc: 0xe3a00000 0xe59f1004 0xe59f2004 0xe59ff004 0x1c: *0x00000c42* 
*0x00000100* _*0x00010000*_ 0x00000000 |

My problem is that the entry point address (FIXUP_ENTRYPOINT_LO) is 
0x10000 instead of the expected 0x8000.

Am I missing something here or is this an expected behavior that differs 
from the real hardware ?
Note that I do not have any issue on AArch64, where the entry point is 
set correctly set at 0x80000.

Thanks,
Best regards,
Ludovic.

||


-- 
Cet e-mail a été vérifié par le logiciel antivirus d'Avast.
www.avast.com
--------------2MeWP35UsZpy0nU6mqfE6jSY
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html>
<html>
  <head>

    <meta http-equiv="content-type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p>Hello everyone,</p>
    <p>I'm working as an a hobbyist OS developer on a multi-architecture
      targets which includes a Raspberry Pi A+.</p>
    <p>Every examples of bare bones I could find out there, sets their
      kernel's start address at 0x8000.<br>
    </p>
    <p>But when I invoke QEMU using a flatten kernel image:<br>
      <code>qemu-system-arm -s -S -m 512 -M raspi1ap -kernel kernel.img</code></p>
    <p>After connecting to the GDB server, the CPU starts at @0x0.</p>
    <p>If I understood correctly, at that address a very small boolader
      was setup:</p>
    <pre><code>static const ARMInsnFixup bootloader[] = {
    { 0xe28fe004 }, /* add     lr, pc, #4 */
    { 0xe51ff004 }, /* ldr     pc, [pc, #-4] */
    { 0, FIXUP_BOARD_SETUP },
#define BOOTLOADER_NO_BOARD_SETUP_OFFSET 3
    { 0xe3a00000 }, /* mov     r0, #0 */
    { 0xe59f1004 }, /* ldr     r1, [pc, #4] */
    { 0xe59f2004 }, /* ldr     r2, [pc, #4] */
    { 0xe59ff004 }, /* ldr     pc, [pc, #4] */
    { 0, FIXUP_BOARDID },
    { 0, FIXUP_ARGPTR_LO },
    { 0, FIXUP_ENTRYPOINT_LO },</code></pre>
    <p> After returned from the board setup, both r1 &amp; r2 are set
      respectively at the board ID (FIXUP_BOARDID) and the address of
      the ATAGS structures (FIXUP_ARGPTR_LO).<br>
    </p>
    <pre><code>(gdb) x/4i $pc
=&gt; 0xc: mov     r0, #0
   0x10:        ldr     r1, [pc, #4]    @ 0x1c
   0x14:        ldr     r2, [pc, #4]    @ 0x20
   0x18:        ldr     pc, [pc, #4]    @ 0x24
(gdb) x/8x $pc
0xc:    0xe3a00000      0xe59f1004      0xe59f2004     0xe59ff004
0x1c:   <b>0x00000c42</b>      <b>0x00000100</b>      <u><b>0x00010000</b></u>     0x00000000
</code></pre>
    <p>My problem is that the entry point address (FIXUP_ENTRYPOINT_LO)
      is 0x10000 instead of the expected 0x8000.</p>
    <p>Am I missing something here or is this an expected behavior that
      differs from the real hardware ?<br>
      Note that I do not have any issue on AArch64, where the entry
      point is set correctly set at 0x80000.</p>
    <p>Thanks,<br>
      Best regards,<br>
      Ludovic.</p>
    <code></code>
    <p></p>
  <div id="DAB4FAD8-2DD7-40BB-A1B8-4E2AA1F9FDF2"><br /><table style="border-top: 1px solid #D3D4DE;"><tr><td style="width: 55px; padding-top: 13px;"><a href="https://www.avast.com/sig-email?utm_medium=email&utm_source=link&utm_campaign=sig-email&utm_content=emailclient" target="_blank"><img src="https://s-install.avcdn.net/ipm/preview/icons/icon-envelope-tick-round-orange-animated-no-repeat-v1.gif" alt="" width="46" height="29" style="width: 46px; height: 29px;"/></a></td><td style="width: 470px; padding-top: 12px; color: #41424e; font-size: 13px; font-family: Arial, Helvetica, sans-serif; line-height: 18px;">Sans virus.<a href="https://www.avast.com/sig-email?utm_medium=email&utm_source=link&utm_campaign=sig-email&utm_content=emailclient" target="_blank" style="color: #4453ea;">www.avast.com</a></td></tr></table><a href="#DAB4FAD8-2DD7-40BB-A1B8-4E2AA1F9FDF2" width="1" height="1"> </a></div></body>
</html>

--------------2MeWP35UsZpy0nU6mqfE6jSY--
