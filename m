Received: by 2002:adf:c793:0:0:0:0:0 with SMTP id l19csp3613129wrg;
        Mon, 10 Jun 2019 14:22:20 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzMZgyqUJ+TORNQYwsCNxccX+QVUjb6v3VSThVhUp27msDx4rxX82HfxEqknXxY/i53Fzct
X-Received: by 2002:ac8:2f90:: with SMTP id l16mr45701600qta.12.1560201740464;
        Mon, 10 Jun 2019 14:22:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1560201740; cv=none;
        d=google.com; s=arc-20160816;
        b=DxzbeBB+o1VxEG4fTGbLFjYgJGNLdpmwrd+w6VwyMjVQWu/V/7L1krij4QqgF5IS4M
         cXwJzVK7g7lTn7YXY3S+eGkW6MzBtr/YIPyKmrE7YjE/imYFD91dFWwCVZrih6N7ESqj
         w1Z2HYGvoWPwGqz5gyXQBvuAZXZ9Qx4qG/UZ8TqIFoObzdMNjzYV+RGPWNdvPgQtAlth
         n91K3YaWLlz1WjyFIuDsChtv56IvSXh3nX5V18TbO4Q13hF3TkyPfmORwmMLLpkyqPgs
         1hcFaY6lsX41RNp4pJdfYVmrzJzU7t2Ddhn+xkZKHsPbCqD+9hcRndGYLAV70tgj4uuh
         Sf6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:to:from:references
         :message-id:date:dkim-signature;
        bh=OfbsNFVwuZJcrP6HY83smkRTXaZ90KkPSNbUmAkVhYU=;
        b=KjTMeSZTUhCyAbxWyjir4Ds5Ozzb7OvbFuNsFi/qRZjsqjwCat2yKu82sNWsDzPmpe
         AZHMfvdH0gOQ5C8U3VIwnaP0nDNut5jcO2dh6HQae+Jd817mjUcSHzRj46MOh86U7f7c
         icfse5+sX9SWexKtE29wefsxgLyrJcGCqJKGd4p7WowEjeBBlq5Bm9/BpVbVe8kMZnuw
         M0dCWAMN7zDcfK7g9d1ou37E6g5p7rg1psjclUBA7ifikqo8hmMKAkU3AXr2ngF0OPxV
         wbpC9ZASSwe3etaNHmajn/ivnyPOuM6xp7X6yy+RKJIc0Z4otkpZ5LNkWS6sJmVJeCPk
         rkPg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=o02vdxRL;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id r54si1560888qtk.10.2019.06.10.14.22.20
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 10 Jun 2019 14:22:20 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=o02vdxRL;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:49732 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1haRkB-0000Rj-UZ
	for alex.bennee@linaro.org; Mon, 10 Jun 2019 17:22:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54884)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <ali.mezgani@gmail.com>) id 1haPwo-0007xv-EF
 for qemu-arm@nongnu.org; Mon, 10 Jun 2019 15:27:16 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <ali.mezgani@gmail.com>) id 1haPwm-0005FN-Iy
 for qemu-arm@nongnu.org; Mon, 10 Jun 2019 15:27:14 -0400
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344]:37970)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <ali.mezgani@gmail.com>)
 id 1haPwl-0005Dx-8j; Mon, 10 Jun 2019 15:27:12 -0400
Received: by mail-wm1-x344.google.com with SMTP id s15so456953wmj.3;
 Mon, 10 Jun 2019 12:27:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:subject:message-id:references:from:to:cc:mime-version
 :content-transfer-encoding;
 bh=OfbsNFVwuZJcrP6HY83smkRTXaZ90KkPSNbUmAkVhYU=;
 b=o02vdxRLqV0x2TL0X9wjPfitgiU+GqQIAirNhHRAP0CpcCNvL0RpV/7ol1JVYOS+KI
 6mKzjSzVgxPDAWuM6OmKfsKCt8/rdt1FaTFZwq7iSfeWkk1riI6wp2/4uoa1XcGqbfPj
 pBX9A3XH1coDj06At5RTQBqCGS1hoh+JyRzrlsz2SNjE/J75dW2kGtSPJTAoXZGyIkB/
 F9Z4I7XUWw5Gh8FD0/YB5T2P1I5E4JVWvDTYCoKJoXlCZFvuMOWmFi8DfFuXH+2bpuTt
 0r4qZOpja0WXmhIXMrNRXDZ4P3yobvLI5o70y2MNoOS/8rF3UNoluVnN+lU0oslsoKp0
 sREA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:message-id:references:from:to:cc
 :mime-version:content-transfer-encoding;
 bh=OfbsNFVwuZJcrP6HY83smkRTXaZ90KkPSNbUmAkVhYU=;
 b=VAUB2kUUppwIw4SYlVQDcVxt9UD/WzaTE6F8fLESMDMJ5ZtvbtRc6QEXjhPN579s5Q
 l96ZdJO95bMZkLMAOGkBq5oM7281Uce2EL3rpIipEbCdFrOwy5IELwbOUI+7y5aLVYVL
 FqS8LWFoVTVlcwov8cIyMB09VZlE5v9N0Os7KirRUAU6U8z42ChFZOF/6FHTSdF5ZlMz
 KjETrdTnYT+nb/Yrs/21Ac6KzAyHHOKQjoZa2kHWYkj13FKIrL8Xj4aw/MIyS67pz9iY
 OUCeLHA7ejVKD2rgeNtZOQp7nKddQiZYGScnj2SuTLDfNhdVhUkJlGfjdkcCOXNcTmfM
 DW+g==
X-Gm-Message-State: APjAAAXSmbH6Y7M1FctkqS3lU5IEM681+ANxLJJHvrztkXxHQmTz2oFd
 2VF00ntm7QsiorMWXWbQfmU=
X-Received: by 2002:a1c:c915:: with SMTP id f21mr13625368wmb.123.1560194828485; 
 Mon, 10 Jun 2019 12:27:08 -0700 (PDT)
Received: from [192.168.1.220] ([41.250.232.80])
 by smtp.gmail.com with ESMTPSA id 88sm19573484wrl.68.2019.06.10.12.27.03
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 10 Jun 2019 12:27:07 -0700 (PDT)
Date: Mon, 10 Jun 2019 20:27:01 +0100
X-Priority: 3
Message-ID: <-2xywm9-ifb5yxlyz8y68ukj0nxy24qv-dgwbua-uu49fa-7xmm95-lpocej7h67y1tkkit4-31nus5-2bayju4z2jwk-kie60g-zanq099a87cdol5jfg-f5bb5a-yxekc0-x2g2ruj2xqm3-y3jyo2-un0xhw.1560194821347@email.android.com>
References: <20190606174609.20487-1-peter.maydell@linaro.org>
 <20190606174609.20487-29-peter.maydell@linaro.org>
 <da80c3ea-5a33-e7e0-209e-89a8413c8f06@linaro.org>
 <CAFEAcA8etr7_rmQsQcUY+cPHZEZna-An+r5TPJtMb4OQO-6Dsg@mail.gmail.com>
 <b9ac8354-6bb2-0080-f597-706b4b94009d@linaro.org>
From: Ali Mezgani <ali.mezgani@gmail.com>
To: Richard Henderson <richard.henderson@linaro.org>, Peter Maydell
 <peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: base64
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::344
X-Mailman-Approved-At: Mon, 10 Jun 2019 17:22:06 -0400
Subject: Re: [Qemu-arm] [PATCH 28/42] target/arm: Convert VMOV (imm) to
 decodetree
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ar3S+pPwVyoS

VGhhbmsgeW91IGJyb3RoZXIgZm9yIHRoaXMgY2h1bmsgb2YgY29kZS4gPGJyPjxicj5SZWdhcmRz
LCA8YnI+PGJyPlNlbnQgZnJvbSBteSBIdWF3ZWkgTW9iaWxlPGRpdiBjbGFzcz0icXVvdGUiIHN0
eWxlPSJsaW5lLWhlaWdodDogMS41Ij48YnI+PGJyPi0tLS0tLS0tIE9yaWdpbmFsIE1lc3NhZ2Ug
LS0tLS0tLS08YnI+U3ViamVjdDogUmU6IFtRZW11LWFybV0gW1BBVENIIDI4LzQyXSB0YXJnZXQv
YXJtOiBDb252ZXJ0IFZNT1YgKGltbSkgdG8gZGVjb2RldHJlZTxicj5Gcm9tOiBSaWNoYXJkIEhl
bmRlcnNvbiA8cmljaGFyZC5oZW5kZXJzb25AbGluYXJvLm9yZz48YnI+VG86IFBldGVyIE1heWRl
bGwgPHBldGVyLm1heWRlbGxAbGluYXJvLm9yZz48YnI+Q0M6IHFlbXUtYXJtIDxxZW11LWFybUBu
b25nbnUub3JnPixRRU1VIERldmVsb3BlcnMgPHFlbXUtZGV2ZWxAbm9uZ251Lm9yZz48YnI+PGJy
PjxiciB0eXBlPSJhdHRyaWJ1dGlvbiI+PGJsb2NrcXVvdGUgY2xhc3M9InF1b3RlIiBzdHlsZT0i
bWFyZ2luOjAgMCAwIC44ZXg7Ym9yZGVyLWxlZnQ6MXB4ICNjY2Mgc29saWQ7cGFkZGluZy1sZWZ0
OjFleCI+T24gNi8xMC8xOSAxMDoxMiBBTSwgUGV0ZXIgTWF5ZGVsbCB3cm90ZTo8YnI+PiBPbiBT
YXQsIDggSnVuIDIwMTkgYXQgMjA6MjksIFJpY2hhcmQgSGVuZGVyc29uPGJyPj4gPHJpY2hhcmQu
aGVuZGVyc29uQGxpbmFyby5vcmc+IHdyb3RlOjxicj4+Pjxicj4+PiBPbiA2LzYvMTkgMTI6NDUg
UE0sIFBldGVyIE1heWRlbGwgd3JvdGU6PGJyPj4+PiArICAgIG4gPSAoYS0+aW1tNGggPDwgMjgp
ICYgMHg4MDAwMDAwMDs8YnI+Pj4+ICsgICAgaSA9ICgoYS0+aW1tNGggPDwgNCkgJiAweDcwKSB8
IGEtPmltbTRsOzxicj4+Pj4gKyAgICBpZiAoaSAmIDB4NDApIHs8YnI+Pj4+ICsgICAgICAgIGkg
fD0gMHg3ODA7PGJyPj4+PiArICAgIH0gZWxzZSB7PGJyPj4+PiArICAgICAgICBpIHw9IDB4ODAw
Ozxicj4+Pj4gKyAgICB9PGJyPj4+PiArICAgIG4gfD0gaSA8PCAxOTs8YnI+Pj48YnI+Pj4gQ2Fu
IHdlIHJldXNlIHZmcF9leHBhbmRfaW1tIGhlcmU/ICBHaXZlbiB0aGF0IHlvdSBkb24ndCBoYXZl
IHB1cmUgY29kZSBtb3Rpb248YnI+Pj4gZnJvbSB0aGUgb2xkIGNvZGUgKGR1ZSB0byBmaWVsZCBl
eHRyYWN0aW9uKSBpdCBkb2Vzbid0IGZlZWwgd3JvbmcgdG8gZ28gYWhlYWQ8YnI+Pj4gYW5kIGZp
eCB0aGlzIHdhcnQgbm93Ljxicj4+IDxicj4+IEkgZHVubm8sIEknZCBraW5kIG9mIHByZWZlciB0
byBkbyBpdCBsYXRlci4gV2UncmUgYWxyZWFkeTxicj4+IGRyaWZ0aW5nIGF3YXkgZnJvbSB0aGUg
b2xkIGNvZGUgYXMgeW91IHNheSwgYW5kIGdvaW5nPGJyPj4gc3RyYWlnaHQgdG8gdmZwX2V4cGFu
ZF9pbW0oKSBtYWtlcyBpdCBldmVuIGxlc3MgY2xlYXIgdGhhdDxicj4+IHdlJ3JlIGRvaW5nIHRo
ZSBzYW1lIHRoaW5nIHRoZSBvbGQgY29kZSB3YXMuLi48YnI+PGJyPkZhaXIgZW5vdWdoLjxicj5S
ZXZpZXdlZC1ieTogUmljaGFyZCBIZW5kZXJzb24gPHJpY2hhcmQuaGVuZGVyc29uQGxpbmFyby5v
cmc+PGJyPjxicj48YnI+cn48YnI+PGJyPjwvYmxvY2txdW90ZT48L2Rpdj4=

