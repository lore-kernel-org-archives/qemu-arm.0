Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp4047977lfm;
        Tue, 30 Jun 2020 08:12:09 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwhjrvK0VdCblb4UuBghHjNomMNnJ1bAx9hjGsn8umBw0UF43X7p/lRuAFzkJySXSaOzn1t
X-Received: by 2002:a25:aa44:: with SMTP id s62mr32381540ybi.480.1593529929339;
        Tue, 30 Jun 2020 08:12:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1593529929; cv=none;
        d=google.com; s=arc-20160816;
        b=fjR8TlbTWi886qTfMmMUSRQumIaSKdhSjFszy764JUto1t02Jca10t2AagD5hAqOyU
         XDwTV1cEs1MBST/+RRGquDoUrPf11b0oBdDAqlk0omEaRx3vIi6d5a+T+Y0pbgqFJbnr
         M4qxR8qbv4Y0WTKJ4mg8QKg1qZJwPsoTo+YtIGkyBPk5yyUprX0aLanhJFzwUKwMPiDm
         VP3mOXTiA6jalPrbmPizZBpeBKzdUBi+CO8ePk/EU/nHFajqei0laDAzn781+WBWdYnj
         1Ulr/LYVc5OE3RJ5Fxs9h24P/yM8IKkdfs2OQKvrYPcNuoS8OMkJYJq4e4zyI/xJ0DNq
         p1MQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :mime-version:dkim-signature;
        bh=s6m6Fy0RDNvoDV9wdNk6FmUmx8SkGp9BMS1MrWTrzlA=;
        b=no3nYw8MrCWL4mgaBrSTF2VPEBYivFLunNRH8X8KNLGuYK5sA/dBwstbrqfR4EqmdG
         AR/v8iCNxzx3l3/eO9nNyErlzQ/+Mm3dmy7+Xs1BXxoYg5PqEjonlopytDj6u94RTS8c
         6lMkcL9ZVxhX/j52j4DkjfxxsW5rNikFK4tVUGjSj6Dlw/28bWKghNlUInYB/FFMvNcO
         Rx7lYZXhAFRhEz4Brd6z4OSb7iwWSgHwt7XVQtWrfA9APkh3oBEjoUkNPBN46nPhGjdY
         tfQagdyU8ApQuskNfKaGRO1Dh0PEDl1lItGoaaHY9ZEp/guH2Tl+xx6fLPVYfEuyT8Qe
         6zXw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=p5LQEwFt;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p18si2854247ybl.369.2020.06.30.08.12.09
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 30 Jun 2020 08:12:09 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=p5LQEwFt;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:51912 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jqHvc-0007M1-Mc
	for alex.bennee@linaro.org; Tue, 30 Jun 2020 11:12:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35522)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <erik.lucas.smit@gmail.com>)
 id 1jqHvU-0007KK-HX
 for qemu-arm@nongnu.org; Tue, 30 Jun 2020 11:12:00 -0400
Received: from mail-ot1-x332.google.com ([2607:f8b0:4864:20::332]:38237)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <erik.lucas.smit@gmail.com>)
 id 1jqHvS-0006f0-OB
 for qemu-arm@nongnu.org; Tue, 30 Jun 2020 11:12:00 -0400
Received: by mail-ot1-x332.google.com with SMTP id t18so5870249otq.5
 for <qemu-arm@nongnu.org>; Tue, 30 Jun 2020 08:11:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=s6m6Fy0RDNvoDV9wdNk6FmUmx8SkGp9BMS1MrWTrzlA=;
 b=p5LQEwFtcE77rCz0tv9bXl+XexCNvDPCknXty+Xmv3oR/QZWtqpGTLwfO2FCw9Nywv
 Xo4Sf753rfsx/UX6bWmeNBnzokXv346gKpqe33wMxqQ8uRPQXtddRaykNL/vKq9LnnBL
 ioPlgzY3DE0gdbZWpQv7sW8pUPzNgKWuwZ7HNEUejj7k9cgbmijz+Fr6vcUxhTsYXO4n
 TnmiJ31GBikaYUOorlP+l1mk3BU9IsedVZIrUOlg8KPpcuw54Rct3pQji5RZO98lm6J1
 rz2xfB8RMSqeqBSN3rto+GJcPzL5IJt3j1e1kt01ICFhGtYs+JasHAdkhzjfqEi0O1EK
 4Ppw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=s6m6Fy0RDNvoDV9wdNk6FmUmx8SkGp9BMS1MrWTrzlA=;
 b=p9sPCjLkzXn/u4ZLFirstbN0PCI/rmni/JVPokuS6KLTJmc2SxGGu31qtbP0XcfYLA
 DD9nerrIERBZlBeN49EuB4Kpyuol81Mhd2PnRiWiB56F/lZ1Eq7NQZop1e32Fkuf1Ocs
 uBN9ezGYM26MQXFCfekUjfxEwP30g+BX8Vk6nY0iHUYri4dJEFG7VKPpS6HBv8Vt2N4/
 QJCTd1O7fmTypk7dtDfGisENbLYEzw4xOeHNgfHh9Ygw7uAEqRhcBDI3MNo6ox2mZbfQ
 ZXa86F2zr+ISrwdYGFCjrNEJ3HzKKciw4Jo7UeKxRhJkewxgaujcYvJTeeRw9Tw1knpk
 D3FQ==
X-Gm-Message-State: AOAM533wBPi3/3p9D+93ALQgRuVRdFxAkPdoo9tdEFiAXpHLUQ3AAmlm
 FrKBJEq71GDlUdVj5r2YOjRAI6uawZPQXxg0pfhV9ZZJ75o=
X-Received: by 2002:a9d:5ccd:: with SMTP id r13mr16700599oti.47.1593529916565; 
 Tue, 30 Jun 2020 08:11:56 -0700 (PDT)
MIME-Version: 1.0
From: Erik Smit <erik.lucas.smit@gmail.com>
Date: Tue, 30 Jun 2020 17:11:44 +0200
Message-ID: <CA+MHfoubt1g2FzcjTw3a0vNr7X2T8Jb+nYoc4_x=Z2TP51afKg@mail.gmail.com>
Subject: hw/misc/aspeed_scu: 5d971f9e breaks Supermicro AST2400
To: "open list:ASPEED BMCs" <qemu-arm@nongnu.org>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Content-Type: multipart/mixed; boundary="0000000000009ddc4f05a94e984c"
Received-SPF: pass client-ip=2607:f8b0:4864:20::332;
 envelope-from=erik.lucas.smit@gmail.com; helo=mail-ot1-x332.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: xch2OgQgyksa

--0000000000009ddc4f05a94e984c
Content-Type: text/plain; charset="UTF-8"

Hello,

5d971f9e memory: Revert "memory: accept mismatching sizes in
memory_region_access_valid" breaks Supermicro AST2400 u-boot.
Supermicro AST2500 u-boot is fine.

The u-boot tries to make a 2-byte read from address 0x84, but
aspeed_ast2400_scu_ops has min_access = 4. When I change min_access to
2 or revert above commit, u-boot boots again.

Is changing min_access to 2 the right way to fix this? Should I send a
patch to qemu-devel for this?

Best regards,

Erik Smit

P.S.: I'm not subscribed to the mailing list, please Cc me on replies.

--0000000000009ddc4f05a94e984c
Content-Type: text/plain; charset="UTF-8"; name="smt_x11_158_scu_data_abort.txt"
Content-Disposition: attachment; filename="smt_x11_158_scu_data_abort.txt"
Content-Transfer-Encoding: base64
Content-ID: <f_kc22gtvp0>
X-Attachment-Id: f_kc22gtvp0

JCB+L3RtcC9xZW11L2J1aWxkL2FybS1zb2Z0bW11L3FlbXUtc3lzdGVtLWFybSAtbWFjaGluZSBw
YWxtZXR0by1ibWMgLW0gNTEyIC1kcml2ZSBmaWxlPVNNVF9YMTFfMTU4LmJpbixmb3JtYXQ9cmF3
LGlmPW10ZCAtbm9kZWZhdWx0cyAtbm9ncmFwaGljIC1zZXJpYWwgc3RkaW8NCg0KVS1Cb290IDIw
MDkuMDEgKCA05pyIIDAyIDIwMTkgLSAxNToyOTowMikgQVNQRUVEICh2LjAuMjEpDQoNCkkyQzog
ICByZWFkeQ0KRFJBTTogIDEyOCBNQg0KRmxhc2g6IDMyIE1CDQoqKiogV2FybmluZyAtIGJhZCBD
UkMsIHVzaW5nIGRlZmF1bHQgZW52aXJvbm1lbnQNCg0KSW46ICAgIHNlcmlhbA0KT3V0OiAgIHNl
cmlhbA0KRXJyOiAgIHNlcmlhbA0KSC9XOiAgIEFTVDI0MDAgc2VyaWVzIGNoaXANCkNPTTogICBw
b3J0MSBhbmQgcG9ydDINCmRhdGEgYWJvcnQNCnBjIDogWzw0MDUwZjY3MD5dICAgICAgICAgIGxy
IDogWzw0MDUwZjY1Yz5dDQpzcCA6IDQwNGNkZjBjICBpcCA6IDQwNTFiNDMwICAgICBmcCA6IDAw
MDAwMDAwDQpyMTA6IGZmZmZmZmZmICByOSA6IGZmZmZmZmZmICAgICByOCA6IDQwNGNmZmRjDQpy
NyA6IDAyMDAwMDAwICByNiA6IDQwNGNmZmJkICAgICByNSA6IDAwMDAwMDAyICByNCA6IDAyMDEw
MzAzDQpyMyA6IDE2ODhhOGE4ICByMiA6IDFlNmUyMDAwICAgICByMSA6IDAwMDAwMDBhICByMCA6
IDAwMDAwMDAwDQpGbGFnczogblpDdiAgSVJRcyBvbiAgRklRcyBvZmYgIE1vZGUgU1ZDXzMyDQpS
ZXNldHRpbmcgQ1BVIC4uLg0KDQpkYXRhIGFib3J0DQpwYyA6IFs8NDA1MWFiOTA+XSAgICAgICAg
ICBsciA6IFs8NDA1MWE5N2M+XQ0Kc3AgOiA0MDRjZGVhNCAgaXAgOiAwMDAwMDAwMCAgICAgZnAg
OiAwMDAwMDAwMA0KcjEwOiBmZmZmZmZmZiAgcjkgOiBmZmZmZmZmZiAgICAgcjggOiA0MDRjZmZk
Yw0KcjcgOiAwMjAwMDAwMCAgcjYgOiA0MDRjZmZiZCAgICAgcjUgOiA0MDRjZGVmOCAgcjQgOiAw
MjAxMDMwMw0KcjMgOiAwMDAwMDAwMCAgcjIgOiAwMDAwMDAwMCAgICAgcjEgOiBmZmZlY2UxMCAg
cjAgOiAwMDAwMDAwMA0KRmxhZ3M6IG5aQ3YgIElSUXMgb2ZmICBGSVFzIG9mZiAgTW9kZSBTVkNf
MzINClJlc2V0dGluZyBDUFUgLi4uDQo=
--0000000000009ddc4f05a94e984c--
