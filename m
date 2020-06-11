Received: by 2002:a19:711a:0:0:0:0:0 with SMTP id m26csp1857568lfc;
        Thu, 11 Jun 2020 16:16:30 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyIKhnmqkyxADjDuto3Lr0mBgbC1oVpM1J+pMeYbu33RH37kb4C3rksGGmNSlMjHSCe06+M
X-Received: by 2002:a25:cad5:: with SMTP id a204mr18667533ybg.350.1591917390041;
        Thu, 11 Jun 2020 16:16:30 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f65si3622338ybi.147.2020.06.11.16.16.29
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 11 Jun 2020 16:16:30 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       arc=fail (signature failed);
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:41712 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jjWQv-000299-E1
	for alex.bennee@linaro.org; Thu, 11 Jun 2020 19:16:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34982)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <no-reply@patchew.org>)
 id 1jjWQl-0001z2-U4; Thu, 11 Jun 2020 19:16:21 -0400
Resent-Date: Thu, 11 Jun 2020 19:16:19 -0400
Resent-Message-Id: <E1jjWQl-0001z2-U4@lists.gnu.org>
Received: from sender4-of-o53.zoho.com ([136.143.188.53]:21309)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <no-reply@patchew.org>)
 id 1jjWQi-0004x5-WD; Thu, 11 Jun 2020 19:16:19 -0400
ARC-Seal: i=1; a=rsa-sha256; t=1591917369; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=A9sDeEnCXo1RQWB2ijH9h0Q0CEqdiABi3pTI34SegNmg1C9C3D34lMtN1US6fK+d/2K1xbqNShL7BqEeA3W9utAhYHHS41YpwPkyNMR8E2JgE6P+p2aJuHTW6BW30LFoUSFr96S1CVJnsSb8xujnSaL97sbCzoUW/8e8pUepEIk=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1591917369;
 h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:Reply-To:Subject:To;
 bh=87IeyaAZlLkcOXno63+DbNBsMiGoWNqfmo80OYSrFag=; 
 b=ip3ZVCmJ1yhSROhTAeI0IDfQc4A3c+kIOS3cFCKXXZV/6Ab3N/kz6jSuMelc+zMx21ZjCUZkfeN8omTrcT4w5X8KwWXZMWtyW615f9jSfxcSy9zhdwqptl6UeZxfbsdyxTcTr9rhioh2gWVEOzJ+lL8eVTg6obRZbWhFNPdO5r4=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 spf=pass  smtp.mailfrom=no-reply@patchew.org;
 dmarc=pass header.from=<no-reply@patchew.org>
 header.from=<no-reply@patchew.org>
Received: from [172.17.0.3] (23.253.156.214 [23.253.156.214]) by
 mx.zohomail.com with SMTPS id 159191736842431.92594247673594;
 Thu, 11 Jun 2020 16:16:08 -0700 (PDT)
Message-ID: <159191736736.1247.7375858404815176599@45ef0f9c86ae>
In-Reply-To: <20200611144529.8873-1-peter.maydell@linaro.org>
Subject: Re: [PATCH 00/10] target/arm: Convert 2-reg-scalar to decodetree
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Resent-From: 
From: no-reply@patchew.org
To: peter.maydell@linaro.org
Date: Thu, 11 Jun 2020 16:16:08 -0700 (PDT)
X-ZohoMailClient: External
Received-SPF: pass client-ip=136.143.188.53; envelope-from=no-reply@patchew.org;
 helo=sender4-of-o53.zoho.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/11 19:16:13
X-ACL-Warn: Detected OS   = Linux 3.11 and newer [fuzzy]
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Reply-To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, richard.henderson@linaro.org, qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: fXoZDS/wndl+

UGF0Y2hldyBVUkw6IGh0dHBzOi8vcGF0Y2hldy5vcmcvUUVNVS8yMDIwMDYxMTE0NDUyOS44ODcz
LTEtcGV0ZXIubWF5ZGVsbEBsaW5hcm8ub3JnLwoKCgpIaSwKClRoaXMgc2VyaWVzIGZhaWxlZCB0
aGUgZG9ja2VyLXF1aWNrQGNlbnRvczcgYnVpbGQgdGVzdC4gUGxlYXNlIGZpbmQgdGhlIHRlc3Rp
bmcgY29tbWFuZHMgYW5kCnRoZWlyIG91dHB1dCBiZWxvdy4gSWYgeW91IGhhdmUgRG9ja2VyIGlu
c3RhbGxlZCwgeW91IGNhbiBwcm9iYWJseSByZXByb2R1Y2UgaXQKbG9jYWxseS4KCj09PSBURVNU
IFNDUklQVCBCRUdJTiA9PT0KIyEvYmluL2Jhc2gKbWFrZSBkb2NrZXItaW1hZ2UtY2VudG9zNyBW
PTEgTkVUV09SSz0xCnRpbWUgbWFrZSBkb2NrZXItdGVzdC1xdWlja0BjZW50b3M3IFNIT1dfRU5W
PTEgSj0xNCBORVRXT1JLPTEKPT09IFRFU1QgU0NSSVBUIEVORCA9PT0KCiAgQ0MgICAgICBhYXJj
aDY0LXNvZnRtbXUvdGFyZ2V0L2FybS9oZWxwZXItYTY0Lm8KICBHRU4gICAgIGFhcmNoNjQtc29m
dG1tdS90YXJnZXQvYXJtL2RlY29kZS1zdmUuaW5jLmMKICBDQyAgICAgIGFhcmNoNjQtc29mdG1t
dS90YXJnZXQvYXJtL3N2ZV9oZWxwZXIubwovdG1wL3FlbXUtdGVzdC9zcmMvdGFyZ2V0L2FybS9u
ZW9uLWRwLmRlY29kZTo0MTY6IGVycm9yOiAoJ2RlZmluaXRpb24gaGFzIDAgYml0cycsKQogIEND
ICAgICAgYWFyY2g2NC1zb2Z0bW11L3RhcmdldC9hcm0vcGF1dGhfaGVscGVyLm8KbWFrZVsxXTog
KioqIFt0YXJnZXQvYXJtL2RlY29kZS1uZW9uLWRwLmluYy5jXSBFcnJvciAxCm1ha2VbMV06ICoq
KiBXYWl0aW5nIGZvciB1bmZpbmlzaGVkIGpvYnMuLi4uCm1ha2U6ICoqKiBbYWFyY2g2NC1zb2Z0
bW11L2FsbF0gRXJyb3IgMgpUcmFjZWJhY2sgKG1vc3QgcmVjZW50IGNhbGwgbGFzdCk6CiAgRmls
ZSAiLi90ZXN0cy9kb2NrZXIvZG9ja2VyLnB5IiwgbGluZSA2NjUsIGluIDxtb2R1bGU+CiAgICBz
eXMuZXhpdChtYWluKCkpCi0tLQogICAgcmFpc2UgQ2FsbGVkUHJvY2Vzc0Vycm9yKHJldGNvZGUs
IGNtZCkKc3VicHJvY2Vzcy5DYWxsZWRQcm9jZXNzRXJyb3I6IENvbW1hbmQgJ1snc3VkbycsICct
bicsICdkb2NrZXInLCAncnVuJywgJy0tbGFiZWwnLCAnY29tLnFlbXUuaW5zdGFuY2UudXVpZD02
NTJlNWRhZWI5ZDc0MjU4YjNiMTU4M2ZiZjMwZmU3YScsICctdScsICcxMDAzJywgJy0tc2VjdXJp
dHktb3B0JywgJ3NlY2NvbXA9dW5jb25maW5lZCcsICctLXJtJywgJy1lJywgJ1RBUkdFVF9MSVNU
PScsICctZScsICdFWFRSQV9DT05GSUdVUkVfT1BUUz0nLCAnLWUnLCAnVj0nLCAnLWUnLCAnSj0x
NCcsICctZScsICdERUJVRz0nLCAnLWUnLCAnU0hPV19FTlY9MScsICctZScsICdDQ0FDSEVfRElS
PS92YXIvdG1wL2NjYWNoZScsICctdicsICcvaG9tZS9wYXRjaGV3Mi8uY2FjaGUvcWVtdS1kb2Nr
ZXItY2NhY2hlOi92YXIvdG1wL2NjYWNoZTp6JywgJy12JywgJy92YXIvdG1wL3BhdGNoZXctdGVz
dGVyLXRtcC1wbHZza2kwZC9zcmMvZG9ja2VyLXNyYy4yMDIwLTA2LTExLTE5LjEzLjAxLjIxODg6
L3Zhci90bXAvcWVtdTp6LHJvJywgJ3FlbXU6Y2VudG9zNycsICcvdmFyL3RtcC9xZW11L3J1bics
ICd0ZXN0LXF1aWNrJ10nIHJldHVybmVkIG5vbi16ZXJvIGV4aXQgc3RhdHVzIDIuCmZpbHRlcj0t
LWZpbHRlcj1sYWJlbD1jb20ucWVtdS5pbnN0YW5jZS51dWlkPTY1MmU1ZGFlYjlkNzQyNThiM2Ix
NTgzZmJmMzBmZTdhCm1ha2VbMV06ICoqKiBbZG9ja2VyLXJ1bl0gRXJyb3IgMQptYWtlWzFdOiBM
ZWF2aW5nIGRpcmVjdG9yeSBgL3Zhci90bXAvcGF0Y2hldy10ZXN0ZXItdG1wLXBsdnNraTBkL3Ny
YycKbWFrZTogKioqIFtkb2NrZXItcnVuLXRlc3QtcXVpY2tAY2VudG9zN10gRXJyb3IgMgoKcmVh
bCAgICAzbTYuNDcwcwp1c2VyICAgIDBtOC4xNTlzCgoKVGhlIGZ1bGwgbG9nIGlzIGF2YWlsYWJs
ZSBhdApodHRwOi8vcGF0Y2hldy5vcmcvbG9ncy8yMDIwMDYxMTE0NDUyOS44ODczLTEtcGV0ZXIu
bWF5ZGVsbEBsaW5hcm8ub3JnL3Rlc3RpbmcuZG9ja2VyLXF1aWNrQGNlbnRvczcvP3R5cGU9bWVz
c2FnZS4KLS0tCkVtYWlsIGdlbmVyYXRlZCBhdXRvbWF0aWNhbGx5IGJ5IFBhdGNoZXcgW2h0dHBz
Oi8vcGF0Y2hldy5vcmcvXS4KUGxlYXNlIHNlbmQgeW91ciBmZWVkYmFjayB0byBwYXRjaGV3LWRl
dmVsQHJlZGhhdC5jb20=
