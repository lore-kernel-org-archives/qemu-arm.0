Received: by 2002:a19:ee01:0:0:0:0:0 with SMTP id g1csp2144406lfb;
        Thu, 21 May 2020 19:30:32 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJymd7vjHdnPwVwxN1r/1ZPoKbPGG/Qrlarp1gERsEAzoiEEW+C7rNithQEpO5NhUU0tLJwQ
X-Received: by 2002:a17:906:aeca:: with SMTP id me10mr6587880ejb.367.1590114632468;
        Thu, 21 May 2020 19:30:32 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1590114632; cv=pass;
        d=google.com; s=arc-20160816;
        b=FYF8dVp9SUWXcbno2e+TSHLPQPPqfk0VhfdeNoc7NmRkbCABCoFnE31m9XkmIp754X
         QmpN3ChhmeJ4oqLot1uATAVd98YzuKzEXEuJitH10kh+fbN47I9lLyUKNALMjRo/1cTd
         he7XuijRVnctQa1rrrkTkSGtNYQcZqyIIChkLpzS1fqYr5glBPBrV2CemzerZZrNBzWY
         c4ehGFuhGzX1bpnAoL7OvoqhHj7s48YdCtBQ3R3lRw3Ezw7srWxTbFEajYgwVLzxex9h
         bAyWRRtQMCQUu+PzYGcm8NA5fDFV72AmzVQJ/PXb9I2WDx7T9o0SYGkHMDviufbioS94
         Y4Yg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=date:cc:to:from:resent-from:content-transfer-encoding:mime-version
         :reply-to:subject:in-reply-to:message-id;
        bh=0AczOR5wUifqMSsTEH72NUkg8qL/sKUoJPOWQrWWe7o=;
        b=o9IltmsFFW7srQhenHY+EYufbDZnCVnUHcZ4P9/zzLHGwvyprbwVJd/ELETfr3P0/R
         T5C5t9/2w/45rY0uBmIHCvOuUrBzf4Rc+LBeKE9M2aHdTJm889WHCgOvZFtVbXMoYR6/
         DnxbGctw2H+W/KCaghZR1p0/U4ZYlzoIsMoGGdRvP3QL7riZ6C/H4hNGSFPDKdWRSXyB
         /lwJ34iQGh7lai0lq7aJOvQrQlvm9Kt7Tl/RJ2vNPLO5Gd+R+GaglMc9RC+Q5/mTFXlx
         eCxwhdsGbzUQdfaX0MLbxpG1bmInffct++v/TwTCdJoI3TOVZZATXpLPHqNMbF/3ijvM
         1SOQ==
ARC-Authentication-Results: i=2; mx.google.com;
       arc=pass (i=1 spf=pass spfdomain=patchew.org dmarc=pass fromdomain=patchew.org>);
       spf=pass (google.com: domain of no-reply@patchew.org designates 136.143.188.53 as permitted sender) smtp.mailfrom=no-reply@patchew.org
Return-Path: <no-reply@patchew.org>
Received: from sender4-of-o53.zoho.com (sender4-of-o53.zoho.com. [136.143.188.53])
        by mx.google.com with ESMTPS id a99si4218771edf.381.2020.05.21.19.30.30
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 21 May 2020 19:30:31 -0700 (PDT)
Received-SPF: pass (google.com: domain of no-reply@patchew.org designates 136.143.188.53 as permitted sender) client-ip=136.143.188.53;
Authentication-Results: mx.google.com;
       arc=pass (i=1 spf=pass spfdomain=patchew.org dmarc=pass fromdomain=patchew.org>);
       spf=pass (google.com: domain of no-reply@patchew.org designates 136.143.188.53 as permitted sender) smtp.mailfrom=no-reply@patchew.org
ARC-Seal: i=1; a=rsa-sha256; t=1590114605; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=K6uQGYY+AXuccOcRqv6f/paw02yiFGL0UDgafvTZyQ/bFcBjUxDc6olRXj7q3zsMKbiRDWjJWi2ZNoi6sBdHYM6X0kCu+oq5Bw7yaf93L2L0EKQgO07NisxTJ//6hPEI59J5U0F2t2mAH3QzQAKlAAEQMaDYV0S6/lIxhMpgBMo=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1590114605; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:Reply-To:Subject:To; 
	bh=0AczOR5wUifqMSsTEH72NUkg8qL/sKUoJPOWQrWWe7o=; 
	b=PSAC1CkiPrHo5rNrDzGDalbAbK8UjIPZyKnzgZikQrZF9M3ux3H60Zwi18lxAuNCc4di9YPZ0xDTrDNcMEClkU0q2IfSz6Jv3cTtByMBetta7NQ4Ir6o/1Oe23jOa27Qb0sO8MJmI+CxxI6TsX7M5yZadQ5sgIypZKxXN+58T9I=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	spf=pass  smtp.mailfrom=no-reply@patchew.org;
	dmarc=pass header.from=<no-reply@patchew.org> header.from=<no-reply@patchew.org>
Received: from [172.17.0.3] (23.253.156.214 [23.253.156.214]) by mx.zohomail.com
	with SMTPS id 1590114603942437.70291499269945; Thu, 21 May 2020 19:30:03 -0700 (PDT)
Message-ID: <159011460144.1576.16339028461103520423@45ef0f9c86ae>
In-Reply-To: <20200521195911.19685-1-philmd@redhat.com>
Subject: Re: [PATCH v3 00/11] accel: Allow targets to use Kconfig, disable semihosting by default
Reply-To: <qemu-devel@nongnu.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Resent-From: 
From: no-reply@patchew.org
To: philmd@redhat.com
Cc: qemu-devel@nongnu.org, marex@denx.de, peter.maydell@linaro.org, thuth@redhat.com, qemu-riscv@nongnu.org, sagark@eecs.berkeley.edu, aleksandar.qemu.devel@gmail.com, kbastian@mail.uni-paderborn.de, crwulff@gmail.com, laurent@vivier.eu, philmd@redhat.com, jcmvbkbc@gmail.com, michael@walle.cc, qemu-arm@nongnu.org, palmer@dabbelt.com, pbonzini@redhat.com, Alistair.Francis@wdc.com, alex.bennee@linaro.org, aleksandar.rikalo@rt-rk.com, aurelien@aurel32.net, rth@twiddle.net
Date: Thu, 21 May 2020 19:30:03 -0700 (PDT)
X-ZohoMailClient: External
X-TUID: bhv/DJ/+N/sy

UGF0Y2hldyBVUkw6IGh0dHBzOi8vcGF0Y2hldy5vcmcvUUVNVS8yMDIwMDUyMTE5NTkxMS4xOTY4
NS0xLXBoaWxtZEByZWRoYXQuY29tLwoKCgpIaSwKClRoaXMgc2VyaWVzIGZhaWxlZCB0aGUgZG9j
a2VyLXF1aWNrQGNlbnRvczcgYnVpbGQgdGVzdC4gUGxlYXNlIGZpbmQgdGhlIHRlc3RpbmcgY29t
bWFuZHMgYW5kCnRoZWlyIG91dHB1dCBiZWxvdy4gSWYgeW91IGhhdmUgRG9ja2VyIGluc3RhbGxl
ZCwgeW91IGNhbiBwcm9iYWJseSByZXByb2R1Y2UgaXQKbG9jYWxseS4KCj09PSBURVNUIFNDUklQ
VCBCRUdJTiA9PT0KIyEvYmluL2Jhc2gKbWFrZSBkb2NrZXItaW1hZ2UtY2VudG9zNyBWPTEgTkVU
V09SSz0xCnRpbWUgbWFrZSBkb2NrZXItdGVzdC1xdWlja0BjZW50b3M3IFNIT1dfRU5WPTEgSj0x
NCBORVRXT1JLPTEKPT09IFRFU1QgU0NSSVBUIEVORCA9PT0KCiAgVEVTVCAgICBpb3Rlc3QtcWNv
dzI6IDA0MApzb2NrZXRfYWNjZXB0IGZhaWxlZDogUmVzb3VyY2UgdGVtcG9yYXJpbHkgdW5hdmFp
bGFibGUKKioKRVJST1I6L3RtcC9xZW11LXRlc3Qvc3JjL3Rlc3RzL3F0ZXN0L2xpYnF0ZXN0LmM6
MzAxOnF0ZXN0X2luaXRfd2l0aG91dF9xbXBfaGFuZHNoYWtlOiBhc3NlcnRpb24gZmFpbGVkOiAo
cy0+ZmQgPj0gMCAmJiBzLT5xbXBfZmQgPj0gMCkKL3RtcC9xZW11LXRlc3Qvc3JjL3Rlc3RzL3F0
ZXN0L2xpYnF0ZXN0LmM6MTY2OiBraWxsX3FlbXUoKSB0cmllZCB0byB0ZXJtaW5hdGUgUUVNVSBw
cm9jZXNzIGJ1dCBlbmNvdW50ZXJlZCBleGl0IHN0YXR1cyAxIChleHBlY3RlZCAwKQpFUlJPUiAt
IEJhaWwgb3V0ISBFUlJPUjovdG1wL3FlbXUtdGVzdC9zcmMvdGVzdHMvcXRlc3QvbGlicXRlc3Qu
YzozMDE6cXRlc3RfaW5pdF93aXRob3V0X3FtcF9oYW5kc2hha2U6IGFzc2VydGlvbiBmYWlsZWQ6
IChzLT5mZCA+PSAwICYmIHMtPnFtcF9mZCA+PSAwKQptYWtlOiAqKiogW2NoZWNrLXF0ZXN0LXg4
Nl82NF0gRXJyb3IgMQptYWtlOiAqKiogV2FpdGluZyBmb3IgdW5maW5pc2hlZCBqb2JzLi4uLgog
IFRFU1QgICAgaW90ZXN0LXFjb3cyOiAwNDEKICBURVNUICAgIGlvdGVzdC1xY293MjogMDQyCi0t
LQogICAgcmFpc2UgQ2FsbGVkUHJvY2Vzc0Vycm9yKHJldGNvZGUsIGNtZCkKc3VicHJvY2Vzcy5D
YWxsZWRQcm9jZXNzRXJyb3I6IENvbW1hbmQgJ1snc3VkbycsICctbicsICdkb2NrZXInLCAncnVu
JywgJy0tbGFiZWwnLCAnY29tLnFlbXUuaW5zdGFuY2UudXVpZD00MjQ0NmYxY2IzZDg0YjA4OTcz
YmM0N2U1ZmMyNDFhMicsICctdScsICcxMDAzJywgJy0tc2VjdXJpdHktb3B0JywgJ3NlY2NvbXA9
dW5jb25maW5lZCcsICctLXJtJywgJy1lJywgJ1RBUkdFVF9MSVNUPScsICctZScsICdFWFRSQV9D
T05GSUdVUkVfT1BUUz0nLCAnLWUnLCAnVj0nLCAnLWUnLCAnSj0xNCcsICctZScsICdERUJVRz0n
LCAnLWUnLCAnU0hPV19FTlY9MScsICctZScsICdDQ0FDSEVfRElSPS92YXIvdG1wL2NjYWNoZScs
ICctdicsICcvaG9tZS9wYXRjaGV3Mi8uY2FjaGUvcWVtdS1kb2NrZXItY2NhY2hlOi92YXIvdG1w
L2NjYWNoZTp6JywgJy12JywgJy92YXIvdG1wL3BhdGNoZXctdGVzdGVyLXRtcC1tNXYyNzFlby9z
cmMvZG9ja2VyLXNyYy4yMDIwLTA1LTIxLTIyLjE0LjE3LjgyODU6L3Zhci90bXAvcWVtdTp6LHJv
JywgJ3FlbXU6Y2VudG9zNycsICcvdmFyL3RtcC9xZW11L3J1bicsICd0ZXN0LXF1aWNrJ10nIHJl
dHVybmVkIG5vbi16ZXJvIGV4aXQgc3RhdHVzIDIuCmZpbHRlcj0tLWZpbHRlcj1sYWJlbD1jb20u
cWVtdS5pbnN0YW5jZS51dWlkPTQyNDQ2ZjFjYjNkODRiMDg5NzNiYzQ3ZTVmYzI0MWEyCm1ha2Vb
MV06ICoqKiBbZG9ja2VyLXJ1bl0gRXJyb3IgMQptYWtlWzFdOiBMZWF2aW5nIGRpcmVjdG9yeSBg
L3Zhci90bXAvcGF0Y2hldy10ZXN0ZXItdG1wLW01djI3MWVvL3NyYycKbWFrZTogKioqIFtkb2Nr
ZXItcnVuLXRlc3QtcXVpY2tAY2VudG9zN10gRXJyb3IgMgoKcmVhbCAgICAxNW00NC41NjZzCnVz
ZXIgICAgMG04LjkzM3MKCgpUaGUgZnVsbCBsb2cgaXMgYXZhaWxhYmxlIGF0Cmh0dHA6Ly9wYXRj
aGV3Lm9yZy9sb2dzLzIwMjAwNTIxMTk1OTExLjE5Njg1LTEtcGhpbG1kQHJlZGhhdC5jb20vdGVz
dGluZy5kb2NrZXItcXVpY2tAY2VudG9zNy8/dHlwZT1tZXNzYWdlLgotLS0KRW1haWwgZ2VuZXJh
dGVkIGF1dG9tYXRpY2FsbHkgYnkgUGF0Y2hldyBbaHR0cHM6Ly9wYXRjaGV3Lm9yZy9dLgpQbGVh
c2Ugc2VuZCB5b3VyIGZlZWRiYWNrIHRvIHBhdGNoZXctZGV2ZWxAcmVkaGF0LmNvbQ==
