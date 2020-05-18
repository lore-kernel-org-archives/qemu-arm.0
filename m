Received: by 2002:a19:ee01:0:0:0:0:0 with SMTP id g1csp3013601lfb;
        Mon, 18 May 2020 06:01:53 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyXe0f/YVM5KuRRD1wLkaWfMj6ifFex5W+zW3gleomUgsj/77cBxsvQvJ85QscAZGkOiwgo
X-Received: by 2002:a37:c20a:: with SMTP id i10mr15481023qkm.29.1589806913627;
        Mon, 18 May 2020 06:01:53 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id dg11si3139427qvb.166.2020.05.18.06.01.53
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 18 May 2020 06:01:53 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       arc=fail (signature failed);
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:45062 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jafOy-0007Hn-VB
	for alex.bennee@linaro.org; Mon, 18 May 2020 09:01:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55544)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <no-reply@patchew.org>)
 id 1jafOr-0007F2-UU; Mon, 18 May 2020 09:01:45 -0400
Resent-Date: Mon, 18 May 2020 09:01:45 -0400
Resent-Message-Id: <E1jafOr-0007F2-UU@lists.gnu.org>
Received: from sender4-of-o53.zoho.com ([136.143.188.53]:21383)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <no-reply@patchew.org>)
 id 1jafOp-0000zB-8J; Mon, 18 May 2020 09:01:45 -0400
ARC-Seal: i=1; a=rsa-sha256; t=1589806887; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=kRtFHpOdjE76jfZaVq/0JC+28KtsPE7oZ95CeyEQdK+UVhGeyaIV1t8ZfvCcMkLCA/NGV6SQALqqUUMDuMHEnjUK0zD2A1kSv3ID+ecFTL4ppcB8WYGdMVDqZRDMAiqkZ6nzlYRGIWoOcWCslDBYiBQud1rGCNRLeIpplIgQSEk=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1589806887;
 h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:Reply-To:Subject:To;
 bh=Jt15/qc+kCAmLUKTh2InF5KY2TxP533zLp/PDPkfuMw=; 
 b=hvK1c1yC5fb43N0LnVsiQtCwEgZ68Pd4HacShnQa4CA0iBUQNXFF+JHL4BYOleLZVRyQuFG5v636v3+uj3G/3z9tCu+pQNQ/o+IB3baoTNs3UCl2n+V3OvHE5EDvl2Jdg/wV20h0MZkgLFZN/sqKM4jrNe71VLsHLCz++UQKah8=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 spf=pass  smtp.mailfrom=no-reply@patchew.org;
 dmarc=pass header.from=<no-reply@patchew.org>
 header.from=<no-reply@patchew.org>
Received: from [172.17.0.3] (23.253.156.214 [23.253.156.214]) by
 mx.zohomail.com with SMTPS id 1589806884987715.5984974737307;
 Mon, 18 May 2020 06:01:24 -0700 (PDT)
Message-ID: <158980688319.15373.2806704576300550846@45ef0f9c86ae>
In-Reply-To: <20200518095203.1013-1-f4bug@amsat.org>
Subject: Re: [PATCH 0/4] hw/arm: Replace hw_error() by qemu_log_mask()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Resent-From: 
From: no-reply@patchew.org
To: f4bug@amsat.org
Date: Mon, 18 May 2020 06:01:24 -0700 (PDT)
X-ZohoMailClient: External
Received-SPF: pass client-ip=136.143.188.53; envelope-from=no-reply@patchew.org;
 helo=sender4-of-o53.zoho.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/18 08:50:08
X-ACL-Warn: Detected OS   = Linux 3.11 and newer [fuzzy]
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Cc: peter.maydell@linaro.org, i.mitsyanko@gmail.com, alistair@alistair23.me,
 qemu-devel@nongnu.org, f4bug@amsat.org, qemu-arm@nongnu.org,
 pbonzini@redhat.com, marcandre.lureau@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: MSHPVl6OXZWA

UGF0Y2hldyBVUkw6IGh0dHBzOi8vcGF0Y2hldy5vcmcvUUVNVS8yMDIwMDUxODA5NTIwMy4xMDEz
LTEtZjRidWdAYW1zYXQub3JnLwoKCgpIaSwKClRoaXMgc2VyaWVzIGZhaWxlZCB0aGUgZG9ja2Vy
LW1pbmd3QGZlZG9yYSBidWlsZCB0ZXN0LiBQbGVhc2UgZmluZCB0aGUgdGVzdGluZyBjb21tYW5k
cyBhbmQKdGhlaXIgb3V0cHV0IGJlbG93LiBJZiB5b3UgaGF2ZSBEb2NrZXIgaW5zdGFsbGVkLCB5
b3UgY2FuIHByb2JhYmx5IHJlcHJvZHVjZSBpdApsb2NhbGx5LgoKPT09IFRFU1QgU0NSSVBUIEJF
R0lOID09PQojISAvYmluL2Jhc2gKZXhwb3J0IEFSQ0g9eDg2XzY0Cm1ha2UgZG9ja2VyLWltYWdl
LWZlZG9yYSBWPTEgTkVUV09SSz0xCnRpbWUgbWFrZSBkb2NrZXItdGVzdC1taW5nd0BmZWRvcmEg
Sj0xNCBORVRXT1JLPTEKPT09IFRFU1QgU0NSSVBUIEVORCA9PT0KCiAgQlVJTEQgICBwYy1iaW9z
L29wdGlvbnJvbS9tdWx0aWJvb3QuaW1nCiAgQ0MgICAgICBwYy1iaW9zL29wdGlvbnJvbS9wdmhf
bWFpbi5vCi90bXAvcWVtdS10ZXN0L3NyYy9ody90aW1lci9leHlub3M0MjEwX21jdC5jOiBJbiBm
dW5jdGlvbiAnZXh5bm9zNDIxMF9tY3RfcmVhZCc6Ci90bXAvcWVtdS10ZXN0L3NyYy9ody90aW1l
ci9leHlub3M0MjEwX21jdC5jOjExNjM6MTI6IGVycm9yOiAndmFsdWUnIG1heSBiZSB1c2VkIHVu
aW5pdGlhbGl6ZWQgaW4gdGhpcyBmdW5jdGlvbiBbLVdlcnJvcj1tYXliZS11bmluaXRpYWxpemVk
XQogICAgIHJldHVybiB2YWx1ZTsKICAgICAgICAgICAgXn5+fn4KY2MxOiBhbGwgd2FybmluZ3Mg
YmVpbmcgdHJlYXRlZCBhcyBlcnJvcnMKbWFrZTogKioqIFsvdG1wL3FlbXUtdGVzdC9zcmMvcnVs
ZXMubWFrOjY5OiBody90aW1lci9leHlub3M0MjEwX21jdC5vXSBFcnJvciAxCm1ha2U6ICoqKiBX
YWl0aW5nIGZvciB1bmZpbmlzaGVkIGpvYnMuLi4uCiAgQlVJTEQgICBwYy1iaW9zL29wdGlvbnJv
bS9saW51eGJvb3QuaW1nCiAgQlVJTEQgICBwYy1iaW9zL29wdGlvbnJvbS9tdWx0aWJvb3QucmF3
Ci0tLQogICAgcmFpc2UgQ2FsbGVkUHJvY2Vzc0Vycm9yKHJldGNvZGUsIGNtZCkKc3VicHJvY2Vz
cy5DYWxsZWRQcm9jZXNzRXJyb3I6IENvbW1hbmQgJ1snc3VkbycsICctbicsICdkb2NrZXInLCAn
cnVuJywgJy0tbGFiZWwnLCAnY29tLnFlbXUuaW5zdGFuY2UudXVpZD02NmU2OWU2NmRiNmE0Y2Vl
OTNiOWU3MGU1MGMwYmMzMScsICctdScsICcxMDAzJywgJy0tc2VjdXJpdHktb3B0JywgJ3NlY2Nv
bXA9dW5jb25maW5lZCcsICctLXJtJywgJy1lJywgJ1RBUkdFVF9MSVNUPScsICctZScsICdFWFRS
QV9DT05GSUdVUkVfT1BUUz0nLCAnLWUnLCAnVj0nLCAnLWUnLCAnSj0xNCcsICctZScsICdERUJV
Rz0nLCAnLWUnLCAnU0hPV19FTlY9JywgJy1lJywgJ0NDQUNIRV9ESVI9L3Zhci90bXAvY2NhY2hl
JywgJy12JywgJy9ob21lL3BhdGNoZXcyLy5jYWNoZS9xZW11LWRvY2tlci1jY2FjaGU6L3Zhci90
bXAvY2NhY2hlOnonLCAnLXYnLCAnL3Zhci90bXAvcGF0Y2hldy10ZXN0ZXItdG1wLWFnczQxNWRv
L3NyYy9kb2NrZXItc3JjLjIwMjAtMDUtMTgtMDguNTguMzguNTIxOTovdmFyL3RtcC9xZW11Onos
cm8nLCAncWVtdTpmZWRvcmEnLCAnL3Zhci90bXAvcWVtdS9ydW4nLCAndGVzdC1taW5ndyddJyBy
ZXR1cm5lZCBub24temVybyBleGl0IHN0YXR1cyAyLgpmaWx0ZXI9LS1maWx0ZXI9bGFiZWw9Y29t
LnFlbXUuaW5zdGFuY2UudXVpZD02NmU2OWU2NmRiNmE0Y2VlOTNiOWU3MGU1MGMwYmMzMQptYWtl
WzFdOiAqKiogW2RvY2tlci1ydW5dIEVycm9yIDEKbWFrZVsxXTogTGVhdmluZyBkaXJlY3Rvcnkg
YC92YXIvdG1wL3BhdGNoZXctdGVzdGVyLXRtcC1hZ3M0MTVkby9zcmMnCm1ha2U6ICoqKiBbZG9j
a2VyLXJ1bi10ZXN0LW1pbmd3QGZlZG9yYV0gRXJyb3IgMgoKcmVhbCAgICAybTQ1LjIwMHMKdXNl
ciAgICAwbTguNTI2cwoKClRoZSBmdWxsIGxvZyBpcyBhdmFpbGFibGUgYXQKaHR0cDovL3BhdGNo
ZXcub3JnL2xvZ3MvMjAyMDA1MTgwOTUyMDMuMTAxMy0xLWY0YnVnQGFtc2F0Lm9yZy90ZXN0aW5n
LmRvY2tlci1taW5nd0BmZWRvcmEvP3R5cGU9bWVzc2FnZS4KLS0tCkVtYWlsIGdlbmVyYXRlZCBh
dXRvbWF0aWNhbGx5IGJ5IFBhdGNoZXcgW2h0dHBzOi8vcGF0Y2hldy5vcmcvXS4KUGxlYXNlIHNl
bmQgeW91ciBmZWVkYmFjayB0byBwYXRjaGV3LWRldmVsQHJlZGhhdC5jb20=
