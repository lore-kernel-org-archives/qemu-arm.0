Received: by 2002:a19:ee17:0:0:0:0:0 with SMTP id g23csp2106693lfb;
        Sat, 23 Jan 2021 19:01:35 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzXB4tSTtQ3cgbNjoo6ZbgLAnsCtRl9p2o1k6QwLoTFGhD+HHtgLgdg0hcczMtivMlTE9jX
X-Received: by 2002:a25:bd4a:: with SMTP id p10mr16131386ybm.79.1611457295180;
        Sat, 23 Jan 2021 19:01:35 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id z7si13725876ybh.74.2021.01.23.19.01.35
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 23 Jan 2021 19:01:35 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       arc=fail (signature failed);
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:33552 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1l3Veg-0007HV-EW
	for alex.bennee@linaro.org; Sat, 23 Jan 2021 22:01:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56024)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <no-reply@patchew.org>)
 id 1l3Ve7-0007F5-G3; Sat, 23 Jan 2021 22:00:59 -0500
Resent-Date: Sat, 23 Jan 2021 22:00:59 -0500
Resent-Message-Id: <E1l3Ve7-0007F5-G3@lists.gnu.org>
Received: from sender4-of-o53.zoho.com ([136.143.188.53]:21308)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <no-reply@patchew.org>)
 id 1l3Ve4-0005Kc-0Q; Sat, 23 Jan 2021 22:00:59 -0500
ARC-Seal: i=1; a=rsa-sha256; t=1611457249; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=N9WI0oUSAf8a7jw4nKduJjnVm92pRCcDOfAlu6vAVVNp21XcTuOHbJU9E5r3dMuq1dFz0ai75ffjbgVOVP2vWX13Z7rxWzd8eEWgvo/0ZDu4mOrixKCwQlUKjf8mJVZSkg77Yua6p3h1cWOtrNKuE7Sa42EiI8Ygy1SgO92sKwg=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1611457249;
 h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:Reply-To:Subject:To;
 bh=2GiHNECfFj+HKkBNFj/jdjO1ErByujCTvqDAtnJgzqo=; 
 b=J6X3cYuvyEim4tl/h76QXH+dfKEfmhgd1EkKy5jzO3nX6IfTqw6jeoHx/E1O33V18caqqMCcsqJyuJZJ3MjaX/t99ewUfgOyhkAN1fbvR9xFHjQcXt7et5Gg6rpDFEN9Hejok36V3wn49GDQv0ThgJPZ+x1GU52/bbQA866VOi8=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 spf=pass  smtp.mailfrom=no-reply@patchew.org;
 dmarc=pass header.from=<no-reply@patchew.org>
 header.from=<no-reply@patchew.org>
Received: from [172.17.0.3] (23.253.156.214 [23.253.156.214]) by
 mx.zohomail.com with SMTPS id 1611457245641472.34127391598815;
 Sat, 23 Jan 2021 19:00:45 -0800 (PST)
In-Reply-To: <20210124025306.3949-1-leif@nuviainc.com>
Subject: Re: [RFC PATCH 0/4] hw/intc: enable GICv4 memory layout for GICv3
 driver
Message-ID: <161145724424.19173.13045858546874721941@c667a6b167f6>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Resent-From: 
From: no-reply@patchew.org
To: leif@nuviainc.com
Date: Sat, 23 Jan 2021 19:00:45 -0800 (PST)
X-ZohoMailClient: External
Received-SPF: pass client-ip=136.143.188.53; envelope-from=no-reply@patchew.org;
 helo=sender4-of-o53.zoho.com
X-Spam_score_int: -2
X-Spam_score: -0.3
X-Spam_bar: /
X-Spam_report: (-0.3 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, URIBL_SBL=1.623 autolearn=no autolearn_force=no
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
Cc: peter.maydell@linaro.org, shashi.mallela@linaro.org, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: B9uQL6VjAhkS

UGF0Y2hldyBVUkw6IGh0dHBzOi8vcGF0Y2hldy5vcmcvUUVNVS8yMDIxMDEyNDAyNTMwNi4zOTQ5
LTEtbGVpZkBudXZpYWluYy5jb20vCgoKCkhpLAoKVGhpcyBzZXJpZXMgc2VlbXMgdG8gaGF2ZSBz
b21lIGNvZGluZyBzdHlsZSBwcm9ibGVtcy4gU2VlIG91dHB1dCBiZWxvdyBmb3IKbW9yZSBpbmZv
cm1hdGlvbjoKClR5cGU6IHNlcmllcwpNZXNzYWdlLWlkOiAyMDIxMDEyNDAyNTMwNi4zOTQ5LTEt
bGVpZkBudXZpYWluYy5jb20KU3ViamVjdDogW1JGQyBQQVRDSCAwLzRdIGh3L2ludGM6IGVuYWJs
ZSBHSUN2NCBtZW1vcnkgbGF5b3V0IGZvciBHSUN2MyBkcml2ZXIKCj09PSBURVNUIFNDUklQVCBC
RUdJTiA9PT0KIyEvYmluL2Jhc2gKZ2l0IHJldi1wYXJzZSBiYXNlID4gL2Rldi9udWxsIHx8IGV4
aXQgMApnaXQgY29uZmlnIC0tbG9jYWwgZGlmZi5yZW5hbWVsaW1pdCAwCmdpdCBjb25maWcgLS1s
b2NhbCBkaWZmLnJlbmFtZXMgVHJ1ZQpnaXQgY29uZmlnIC0tbG9jYWwgZGlmZi5hbGdvcml0aG0g
aGlzdG9ncmFtCi4vc2NyaXB0cy9jaGVja3BhdGNoLnBsIC0tbWFpbGJhY2sgYmFzZS4uCj09PSBU
RVNUIFNDUklQVCBFTkQgPT09CgpVcGRhdGluZyAzYzhjZjVhOWMyMWZmODc4MjE2NGQxZGVmN2Y0
NGJkODg4NzEzMzg0CkZyb20gaHR0cHM6Ly9naXRodWIuY29tL3BhdGNoZXctcHJvamVjdC9xZW11
CiAtIFt0YWcgdXBkYXRlXSAgICAgIHBhdGNoZXcvMjAyMTAxMjMyMzAxMDUuMjA3NjI3MC0xLXJp
Y2hhcmQuaGVuZGVyc29uQGxpbmFyby5vcmcgLT4gcGF0Y2hldy8yMDIxMDEyMzIzMDEwNS4yMDc2
MjcwLTEtcmljaGFyZC5oZW5kZXJzb25AbGluYXJvLm9yZwogKiBbbmV3IHRhZ10gICAgICAgICBw
YXRjaGV3LzIwMjEwMTI0MDI1MzA2LjM5NDktMS1sZWlmQG51dmlhaW5jLmNvbSAtPiBwYXRjaGV3
LzIwMjEwMTI0MDI1MzA2LjM5NDktMS1sZWlmQG51dmlhaW5jLmNvbQpTd2l0Y2hlZCB0byBhIG5l
dyBicmFuY2ggJ3Rlc3QnCjIyY2UzZWIgaHcvaW50YzogbWFrZSBnaWN2M19pZHJlZygpIGRpc3Rp
bmd1aXNoIGJldHdlZW4gZ2ljdjMvZ2ljdjQKNGQyNDAwYyBody9pbnRjOiBzZXQgR0lDRF9UWVBF
Ui5EVklTIGZvciBHSUN2NApiYWI5MjA4IGh3L2ludGM6IGFkZCBoZWxwZXIgZnVuY3Rpb24gdG8g
ZGV0ZXJtaW5lIGdpY3YzIHJlZGlzdHJpYnV0b3Igc2l6ZQo3MWZhNDhmIGh3L2ludGM6IGRvbid0
IGJhaWwgb3V0IGdpY3YzIG1vZGVsIGluaXQgZm9yIHJldmlzaW9uIDQKCj09PSBPVVRQVVQgQkVH
SU4gPT09CjEvNCBDaGVja2luZyBjb21taXQgNzFmYTQ4ZmExNjI0IChody9pbnRjOiBkb24ndCBi
YWlsIG91dCBnaWN2MyBtb2RlbCBpbml0IGZvciByZXZpc2lvbiA0KQoyLzQgQ2hlY2tpbmcgY29t
bWl0IGJhYjkyMDg1NWZiZSAoaHcvaW50YzogYWRkIGhlbHBlciBmdW5jdGlvbiB0byBkZXRlcm1p
bmUgZ2ljdjMgcmVkaXN0cmlidXRvciBzaXplKQozLzQgQ2hlY2tpbmcgY29tbWl0IDRkMjQwMGNk
YTA3YiAoaHcvaW50Yzogc2V0IEdJQ0RfVFlQRVIuRFZJUyBmb3IgR0lDdjQpCkVSUk9SOiBzdXBl
cmZsdW91cyB0cmFpbGluZyBzZW1pY29sb24KIzI1OiBGSUxFOiBody9pbnRjL2FybV9naWN2M19k
aXN0LmM6MzkxOgorICAgICAgICAgICAgKmRhdGEgfD0gKDEgPDwgMTgpOzsKCnRvdGFsOiAxIGVy
cm9ycywgMCB3YXJuaW5ncywgOSBsaW5lcyBjaGVja2VkCgpQYXRjaCAzLzQgaGFzIHN0eWxlIHBy
b2JsZW1zLCBwbGVhc2UgcmV2aWV3LiAgSWYgYW55IG9mIHRoZXNlIGVycm9ycwphcmUgZmFsc2Ug
cG9zaXRpdmVzIHJlcG9ydCB0aGVtIHRvIHRoZSBtYWludGFpbmVyLCBzZWUKQ0hFQ0tQQVRDSCBp
biBNQUlOVEFJTkVSUy4KCjQvNCBDaGVja2luZyBjb21taXQgMjJjZTNlYjZmOTBhIChody9pbnRj
OiBtYWtlIGdpY3YzX2lkcmVnKCkgZGlzdGluZ3Vpc2ggYmV0d2VlbiBnaWN2My9naWN2NCkKPT09
IE9VVFBVVCBFTkQgPT09CgpUZXN0IGNvbW1hbmQgZXhpdGVkIHdpdGggY29kZTogMQoKClRoZSBm
dWxsIGxvZyBpcyBhdmFpbGFibGUgYXQKaHR0cDovL3BhdGNoZXcub3JnL2xvZ3MvMjAyMTAxMjQw
MjUzMDYuMzk0OS0xLWxlaWZAbnV2aWFpbmMuY29tL3Rlc3RpbmcuY2hlY2twYXRjaC8/dHlwZT1t
ZXNzYWdlLgotLS0KRW1haWwgZ2VuZXJhdGVkIGF1dG9tYXRpY2FsbHkgYnkgUGF0Y2hldyBbaHR0
cHM6Ly9wYXRjaGV3Lm9yZy9dLgpQbGVhc2Ugc2VuZCB5b3VyIGZlZWRiYWNrIHRvIHBhdGNoZXct
ZGV2ZWxAcmVkaGF0LmNvbQ==
