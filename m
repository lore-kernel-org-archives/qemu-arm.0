Received: by 2002:ac2:5937:0:0:0:0:0 with SMTP id v23csp2403927lfi;
        Thu, 26 Mar 2020 14:23:05 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vuXahAsyzHWOx67H6wAQvuL/Aj+bKCA1F3gfeJAVabo35AX41BqWpuoGxcolWm2kWSe2Vtk
X-Received: by 2002:a37:8503:: with SMTP id h3mr11039366qkd.198.1585257785804;
        Thu, 26 Mar 2020 14:23:05 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h12si2220104qkl.323.2020.03.26.14.23.05
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 26 Mar 2020 14:23:05 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       arc=fail (signature failed);
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:60584 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jHZxx-0002v7-8V
	for alex.bennee@linaro.org; Thu, 26 Mar 2020 17:23:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39202)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <no-reply@patchew.org>) id 1jHZxb-0002k5-Rl
 for qemu-arm@nongnu.org; Thu, 26 Mar 2020 17:22:44 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <no-reply@patchew.org>) id 1jHZxa-0003aM-8X
 for qemu-arm@nongnu.org; Thu, 26 Mar 2020 17:22:43 -0400
Resent-Date: Thu, 26 Mar 2020 17:22:43 -0400
Resent-Message-Id: <E1jHZxa-0003aM-8X@eggs.gnu.org>
Received: from sender4-of-o51.zoho.com ([136.143.188.51]:21108)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <no-reply@patchew.org>)
 id 1jHZxZ-0003YO-WC; Thu, 26 Mar 2020 17:22:42 -0400
ARC-Seal: i=1; a=rsa-sha256; t=1585257757; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=RtwP5e3WvG0lSsA6M0biR96U7InVlhJBmlPDVI4owE4+hDy8XIhcxmNjnw3c9W9ogjLFnTUHrtBVAKpYX2eVYA+f6YhNTuMgQfE9uUO6dComnOxFL/vFyJGf9vLD3IellzbzGY09ubRQFK9Zu0ph2Dny+STvEfqDT/PdHDG3FJ0=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1585257757;
 h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:Reply-To:Subject:To;
 bh=UQ1oTNrf1VH1ahRuAhXyGf+I2a02qMIHYEK9VCDSIS4=; 
 b=R8mcRV2jgGt4UPBwTfekbp5TyKdjxePCPysow+VI0PXaUzNlVhwBdsyp0GvO+BOA3wCEgd7vimVXS6fnF0AGgrnHno0NDHFWuVh3N/p+mu786tGIEfNO8NV64iArX4ePaE+3XdJ9MW87GZ4B1b3g7arOtt6jWshdfRpRa19j2lU=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 spf=pass  smtp.mailfrom=no-reply@patchew.org;
 dmarc=pass header.from=<no-reply@patchew.org>
 header.from=<no-reply@patchew.org>
Received: from [172.17.0.3] (23.253.156.214 [23.253.156.214]) by
 mx.zohomail.com with SMTPS id 1585257756192308.1368310990623;
 Thu, 26 Mar 2020 14:22:36 -0700 (PDT)
In-Reply-To: <20200326203414.18140-1-peter.maydell@linaro.org>
Subject: Re: [PATCH] hw/arm/collie: Put StrongARMState* into a
 CollieMachineState struct
Message-ID: <158525775502.25711.13645073054159373855@39012742ff91>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Resent-From: 
From: no-reply@patchew.org
To: peter.maydell@linaro.org
Date: Thu, 26 Mar 2020 14:22:36 -0700 (PDT)
X-ZohoMailClient: External
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 136.143.188.51
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
Reply-To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: +cJQ0zXY/ClP

UGF0Y2hldyBVUkw6IGh0dHBzOi8vcGF0Y2hldy5vcmcvUUVNVS8yMDIwMDMyNjIwMzQxNC4xODE0
MC0xLXBldGVyLm1heWRlbGxAbGluYXJvLm9yZy8KCgoKSGksCgpUaGlzIHNlcmllcyBmYWlsZWQg
dGhlIGRvY2tlci1taW5nd0BmZWRvcmEgYnVpbGQgdGVzdC4gUGxlYXNlIGZpbmQgdGhlIHRlc3Rp
bmcgY29tbWFuZHMgYW5kCnRoZWlyIG91dHB1dCBiZWxvdy4gSWYgeW91IGhhdmUgRG9ja2VyIGlu
c3RhbGxlZCwgeW91IGNhbiBwcm9iYWJseSByZXByb2R1Y2UgaXQKbG9jYWxseS4KCj09PSBURVNU
IFNDUklQVCBCRUdJTiA9PT0KIyEgL2Jpbi9iYXNoCmV4cG9ydCBBUkNIPXg4Nl82NAptYWtlIGRv
Y2tlci1pbWFnZS1mZWRvcmEgVj0xIE5FVFdPUks9MQp0aW1lIG1ha2UgZG9ja2VyLXRlc3QtbWlu
Z3dAZmVkb3JhIEo9MTQgTkVUV09SSz0xCj09PSBURVNUIFNDUklQVCBFTkQgPT09CgogIENDICAg
ICAgYWFyY2g2NC1zb2Z0bW11L3RhcmdldC9hcm0vdHJhbnNsYXRlLWE2NC5vCiAgQ0MgICAgICBh
YXJjaDY0LXNvZnRtbXUvdGFyZ2V0L2FybS9oZWxwZXItYTY0Lm8KL3RtcC9xZW11LXRlc3Qvc3Jj
L2h3L2FybS9jb2xsaWUuYzogSW4gZnVuY3Rpb24gJ2NvbGxpZV9pbml0JzoKL3RtcC9xZW11LXRl
c3Qvc3JjL2h3L2FybS9jb2xsaWUuYzo2NzoyMTogZXJyb3I6ICdzJyB1bmRlY2xhcmVkIChmaXJz
dCB1c2UgaW4gdGhpcyBmdW5jdGlvbikKICAgICBhcm1fbG9hZF9rZXJuZWwocy0+Y3B1LCBtYWNo
aW5lLCAmY29sbGllX2JpbmZvKTsKICAgICAgICAgICAgICAgICAgICAgXgovdG1wL3FlbXUtdGVz
dC9zcmMvaHcvYXJtL2NvbGxpZS5jOjY3OjIxOiBub3RlOiBlYWNoIHVuZGVjbGFyZWQgaWRlbnRp
ZmllciBpcyByZXBvcnRlZCBvbmx5IG9uY2UgZm9yIGVhY2ggZnVuY3Rpb24gaXQgYXBwZWFycyBp
bgptYWtlWzFdOiAqKiogWy90bXAvcWVtdS10ZXN0L3NyYy9ydWxlcy5tYWs6Njk6IGh3L2FybS9j
b2xsaWUub10gRXJyb3IgMQptYWtlWzFdOiAqKiogV2FpdGluZyBmb3IgdW5maW5pc2hlZCBqb2Jz
Li4uLgogIEdFTiAgICAgYWFyY2g2NC1zb2Z0bW11L3RhcmdldC9hcm0vZGVjb2RlLXN2ZS5pbmMu
YwptYWtlOiAqKiogW01ha2VmaWxlOjUyNzogYWFyY2g2NC1zb2Z0bW11L2FsbF0gRXJyb3IgMgpt
YWtlOiAqKiogV2FpdGluZyBmb3IgdW5maW5pc2hlZCBqb2JzLi4uLgogIEdFTiAgICAgeDg2XzY0
LXNvZnRtbXUvcWVtdS1zeXN0ZW0teDg2XzY0LmV4ZQpUcmFjZWJhY2sgKG1vc3QgcmVjZW50IGNh
bGwgbGFzdCk6Ci0tLQogICAgcmFpc2UgQ2FsbGVkUHJvY2Vzc0Vycm9yKHJldGNvZGUsIGNtZCkK
c3VicHJvY2Vzcy5DYWxsZWRQcm9jZXNzRXJyb3I6IENvbW1hbmQgJ1snc3VkbycsICctbicsICdk
b2NrZXInLCAncnVuJywgJy0tbGFiZWwnLCAnY29tLnFlbXUuaW5zdGFuY2UudXVpZD1jZGI5MTRi
ZjY2NTI0ZDdlYTNmMTAzZDIyZDEyMTlhNycsICctdScsICcxMDAxJywgJy0tc2VjdXJpdHktb3B0
JywgJ3NlY2NvbXA9dW5jb25maW5lZCcsICctLXJtJywgJy1lJywgJ1RBUkdFVF9MSVNUPScsICct
ZScsICdFWFRSQV9DT05GSUdVUkVfT1BUUz0nLCAnLWUnLCAnVj0nLCAnLWUnLCAnSj0xNCcsICct
ZScsICdERUJVRz0nLCAnLWUnLCAnU0hPV19FTlY9JywgJy1lJywgJ0NDQUNIRV9ESVI9L3Zhci90
bXAvY2NhY2hlJywgJy12JywgJy9ob21lL3BhdGNoZXcvLmNhY2hlL3FlbXUtZG9ja2VyLWNjYWNo
ZTovdmFyL3RtcC9jY2FjaGU6eicsICctdicsICcvdmFyL3RtcC9wYXRjaGV3LXRlc3Rlci10bXAt
dWd6ejF6dm8vc3JjL2RvY2tlci1zcmMuMjAyMC0wMy0yNi0xNy4yMC4yMS43NzUxOi92YXIvdG1w
L3FlbXU6eixybycsICdxZW11OmZlZG9yYScsICcvdmFyL3RtcC9xZW11L3J1bicsICd0ZXN0LW1p
bmd3J10nIHJldHVybmVkIG5vbi16ZXJvIGV4aXQgc3RhdHVzIDIuCmZpbHRlcj0tLWZpbHRlcj1s
YWJlbD1jb20ucWVtdS5pbnN0YW5jZS51dWlkPWNkYjkxNGJmNjY1MjRkN2VhM2YxMDNkMjJkMTIx
OWE3Cm1ha2VbMV06ICoqKiBbZG9ja2VyLXJ1bl0gRXJyb3IgMQptYWtlWzFdOiBMZWF2aW5nIGRp
cmVjdG9yeSBgL3Zhci90bXAvcGF0Y2hldy10ZXN0ZXItdG1wLXVnenoxenZvL3NyYycKbWFrZTog
KioqIFtkb2NrZXItcnVuLXRlc3QtbWluZ3dAZmVkb3JhXSBFcnJvciAyCgpyZWFsICAgIDJtMTQu
NjIxcwp1c2VyICAgIDBtOC4zMTNzCgoKVGhlIGZ1bGwgbG9nIGlzIGF2YWlsYWJsZSBhdApodHRw
Oi8vcGF0Y2hldy5vcmcvbG9ncy8yMDIwMDMyNjIwMzQxNC4xODE0MC0xLXBldGVyLm1heWRlbGxA
bGluYXJvLm9yZy90ZXN0aW5nLmRvY2tlci1taW5nd0BmZWRvcmEvP3R5cGU9bWVzc2FnZS4KLS0t
CkVtYWlsIGdlbmVyYXRlZCBhdXRvbWF0aWNhbGx5IGJ5IFBhdGNoZXcgW2h0dHBzOi8vcGF0Y2hl
dy5vcmcvXS4KUGxlYXNlIHNlbmQgeW91ciBmZWVkYmFjayB0byBwYXRjaGV3LWRldmVsQHJlZGhh
dC5jb20=
