Received: by 2002:a19:f015:0:0:0:0:0 with SMTP id p21csp1151120lfc;
        Wed, 11 Mar 2020 12:33:37 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vtYMzewdRGS/4SeqhPwwBDKg/94SLUkxLHjm/s85j2ye0o7d9OicuFXCCTaqCn0a7hCJvhr
X-Received: by 2002:a0c:90e1:: with SMTP id p88mr4179820qvp.18.1583955217497;
        Wed, 11 Mar 2020 12:33:37 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n7si1859846qtl.44.2020.03.11.12.33.37
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 11 Mar 2020 12:33:37 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       arc=fail (signature failed);
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:57470 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jC76m-0003QM-VA
	for alex.bennee@linaro.org; Wed, 11 Mar 2020 15:33:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60876)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <no-reply@patchew.org>) id 1jC76V-0003OX-GH
 for qemu-arm@nongnu.org; Wed, 11 Mar 2020 15:33:20 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <no-reply@patchew.org>) id 1jC76T-0005xL-41
 for qemu-arm@nongnu.org; Wed, 11 Mar 2020 15:33:19 -0400
Resent-Date: Wed, 11 Mar 2020 15:33:19 -0400
Resent-Message-Id: <E1jC76T-0005xL-41@eggs.gnu.org>
Received: from sender4-of-o51.zoho.com ([136.143.188.51]:21158)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <no-reply@patchew.org>)
 id 1jC76L-0005qi-N6; Wed, 11 Mar 2020 15:33:10 -0400
ARC-Seal: i=1; a=rsa-sha256; t=1583955172; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=PSxjhUaq8UxQVdP31wSgx3g/M6WDfaGOIETSsORp8V3k0OsOEFbOFSNAfrsGsbBY5l/KT7evTY2kc1ey+SxYU2eghvmUAR9JBxl4529YCZxplO8ZRxKchSretk7QRjG3QMzK6v9UlrhmMIdaq07/Rjz8+j4z+E3HS3LpKql1EwY=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1583955172;
 h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:Reply-To:Subject:To;
 bh=WCUptfhJ2bbReCvE6A8NkTbiIZdF0pE5wW5MQf0s/c0=; 
 b=fG57euh4x4YRQ2nOTb1Uk36+z7ikcb+DvOUYILZTFaMu4nKGeilxhwsoFdNJruAJ90T+fMudw9c3Uou88F3Agbc6ZMJcFjiZIOcD2nbbtXz2Pz9/bCwsbPjYzI+ADdt2w09LFJiLfgE9XpsiZtUghG1PkOhVjVN7Rjc8YAGDuyI=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=patchew.org;
 spf=pass  smtp.mailfrom=no-reply@patchew.org;
 dmarc=pass header.from=<no-reply@patchew.org>
 header.from=<no-reply@patchew.org>
Received: from [172.17.0.3] (23.253.156.214 [23.253.156.214]) by
 mx.zohomail.com with SMTPS id 1583955171440481.092874640031;
 Wed, 11 Mar 2020 12:32:51 -0700 (PDT)
In-Reply-To: <20200311172014.33052-1-shameerali.kolothum.thodi@huawei.com>
Subject: Re: [PATCH v3 00/10] ARM virt: Add NVDIMM support
Message-ID: <158395516968.8804.14039731107027129787@39012742ff91>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Resent-From: 
From: no-reply@patchew.org
To: shameerali.kolothum.thodi@huawei.com
Date: Wed, 11 Mar 2020 12:32:51 -0700 (PDT)
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
Cc: peter.maydell@linaro.org, xiaoguangrong.eric@gmail.com, david@redhat.com,
 shannon.zhaosl@gmail.com, mst@redhat.com, qemu-devel@nongnu.org,
 xuwei5@hisilicon.com, linuxarm@huawei.com, eric.auger@redhat.com,
 qemu-arm@nongnu.org, imammedo@redhat.com, lersek@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 2tP2Bd+zhZPe

UGF0Y2hldyBVUkw6IGh0dHBzOi8vcGF0Y2hldy5vcmcvUUVNVS8yMDIwMDMxMTE3MjAxNC4zMzA1
Mi0xLXNoYW1lZXJhbGkua29sb3RodW0udGhvZGlAaHVhd2VpLmNvbS8KCgoKSGksCgpUaGlzIHNl
cmllcyBmYWlsZWQgdGhlIGRvY2tlci1taW5nd0BmZWRvcmEgYnVpbGQgdGVzdC4gUGxlYXNlIGZp
bmQgdGhlIHRlc3RpbmcgY29tbWFuZHMgYW5kCnRoZWlyIG91dHB1dCBiZWxvdy4gSWYgeW91IGhh
dmUgRG9ja2VyIGluc3RhbGxlZCwgeW91IGNhbiBwcm9iYWJseSByZXByb2R1Y2UgaXQKbG9jYWxs
eS4KCj09PSBURVNUIFNDUklQVCBCRUdJTiA9PT0KIyEgL2Jpbi9iYXNoCmV4cG9ydCBBUkNIPXg4
Nl82NAptYWtlIGRvY2tlci1pbWFnZS1mZWRvcmEgVj0xIE5FVFdPUks9MQp0aW1lIG1ha2UgZG9j
a2VyLXRlc3QtbWluZ3dAZmVkb3JhIEo9MTQgTkVUV09SSz0xCj09PSBURVNUIFNDUklQVCBFTkQg
PT09CgogIENDICAgICAgaHcvdGltZXIvYXJtX3RpbWVyLm8KSW4gZmlsZSBpbmNsdWRlZCBmcm9t
IC90bXAvcWVtdS10ZXN0L3NyYy9pbmNsdWRlL3FlbXUvb3NkZXAuaDo1MSwKICAgICAgICAgICAg
ICAgICBmcm9tIC90bXAvcWVtdS10ZXN0L3NyYy9ody9udnJhbS9md19jZmcuYzoyNToKL3RtcC9x
ZW11LXRlc3Qvc3JjL2luY2x1ZGUvcWVtdS9jb21waWxlci5oOjgxOjM1OiBlcnJvcjogaW52YWxp
ZCBvcGVyYW5kcyB0byBiaW5hcnkgLSAoaGF2ZSAndWludDY0X3QgKicge2FrYSAnbG9uZyBsb25n
IHVuc2lnbmVkIGludCAqJ30gYW5kICdzaXplX3QgKicge2FrYSAndW5zaWduZWQgaW50IConfSkK
ICNkZWZpbmUgdHlwZV9jaGVjayh0MSx0MikgKCh0MSopMCAtICh0MiopMCkKICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICBeCi90bXAvcWVtdS10ZXN0L3NyYy9pbmNsdWRlL21pZ3Jh
dGlvbi92bXN0YXRlLmg6MjU0OjY6IG5vdGU6IGluIGV4cGFuc2lvbiBvZiBtYWNybyAndHlwZV9j
aGVjaycKLS0tCi90bXAvcWVtdS10ZXN0L3NyYy9ody9udnJhbS9md19jZmcuYzo2NzQ6OTogbm90
ZTogaW4gZXhwYW5zaW9uIG9mIG1hY3JvICdWTVNUQVRFX1VJTlQ2NCcKICAgICAgICAgVk1TVEFU
RV9VSU5UNjQodGFibGVfbXJfc2l6ZSwgRldDZmdTdGF0ZSksCiAgICAgICAgIF5+fn5+fn5+fn5+
fn5+Ci90bXAvcWVtdS10ZXN0L3NyYy9pbmNsdWRlL3FlbXUvY29tcGlsZXIuaDo4MTozNTogZXJy
b3I6IGludmFsaWQgb3BlcmFuZHMgdG8gYmluYXJ5IC0gKGhhdmUgJ3VpbnQ2NF90IConIHtha2Eg
J2xvbmcgbG9uZyB1bnNpZ25lZCBpbnQgKid9IGFuZCAnc2l6ZV90IConIHtha2EgJ3Vuc2lnbmVk
IGludCAqJ30pCiAjZGVmaW5lIHR5cGVfY2hlY2sodDEsdDIpICgodDEqKTAgLSAodDIqKTApCiAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgXgovdG1wL3FlbXUtdGVzdC9zcmMvaW5j
bHVkZS9taWdyYXRpb24vdm1zdGF0ZS5oOjI1NDo2OiBub3RlOiBpbiBleHBhbnNpb24gb2YgbWFj
cm8gJ3R5cGVfY2hlY2snCi0tLQovdG1wL3FlbXUtdGVzdC9zcmMvaHcvbnZyYW0vZndfY2ZnLmM6
Njc1Ojk6IG5vdGU6IGluIGV4cGFuc2lvbiBvZiBtYWNybyAnVk1TVEFURV9VSU5UNjQnCiAgICAg
ICAgIFZNU1RBVEVfVUlOVDY0KGxpbmtlcl9tcl9zaXplLCBGV0NmZ1N0YXRlKSwKICAgICAgICAg
Xn5+fn5+fn5+fn5+fn4KL3RtcC9xZW11LXRlc3Qvc3JjL2luY2x1ZGUvcWVtdS9jb21waWxlci5o
OjgxOjM1OiBlcnJvcjogaW52YWxpZCBvcGVyYW5kcyB0byBiaW5hcnkgLSAoaGF2ZSAndWludDY0
X3QgKicge2FrYSAnbG9uZyBsb25nIHVuc2lnbmVkIGludCAqJ30gYW5kICdzaXplX3QgKicge2Fr
YSAndW5zaWduZWQgaW50IConfSkKICNkZWZpbmUgdHlwZV9jaGVjayh0MSx0MikgKCh0MSopMCAt
ICh0MiopMCkKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBeCi90bXAvcWVtdS10
ZXN0L3NyYy9pbmNsdWRlL21pZ3JhdGlvbi92bXN0YXRlLmg6MjU0OjY6IG5vdGU6IGluIGV4cGFu
c2lvbiBvZiBtYWNybyAndHlwZV9jaGVjaycKLS0tCi90bXAvcWVtdS10ZXN0L3NyYy9ody9udnJh
bS9md19jZmcuYzo2NzY6OTogbm90ZTogaW4gZXhwYW5zaW9uIG9mIG1hY3JvICdWTVNUQVRFX1VJ
TlQ2NCcKICAgICAgICAgVk1TVEFURV9VSU5UNjQocnNkcF9tcl9zaXplLCBGV0NmZ1N0YXRlKSwK
ICAgICAgICAgXn5+fn5+fn5+fn5+fn4KbWFrZTogKioqIFsvdG1wL3FlbXUtdGVzdC9zcmMvcnVs
ZXMubWFrOjY5OiBody9udnJhbS9md19jZmcub10gRXJyb3IgMQptYWtlOiAqKiogV2FpdGluZyBm
b3IgdW5maW5pc2hlZCBqb2JzLi4uLgogIENDICAgICAgaHcvdGltZXIvYXJtX21wdGltZXIubwpU
cmFjZWJhY2sgKG1vc3QgcmVjZW50IGNhbGwgbGFzdCk6Ci0tLQogICAgcmFpc2UgQ2FsbGVkUHJv
Y2Vzc0Vycm9yKHJldGNvZGUsIGNtZCkKc3VicHJvY2Vzcy5DYWxsZWRQcm9jZXNzRXJyb3I6IENv
bW1hbmQgJ1snc3VkbycsICctbicsICdkb2NrZXInLCAncnVuJywgJy0tbGFiZWwnLCAnY29tLnFl
bXUuaW5zdGFuY2UudXVpZD0yNWI3N2ZlYTEzNWE0Yjk5OTM4OTMxNzJlZmI4OGY1NScsICctdScs
ICcxMDAxJywgJy0tc2VjdXJpdHktb3B0JywgJ3NlY2NvbXA9dW5jb25maW5lZCcsICctLXJtJywg
Jy1lJywgJ1RBUkdFVF9MSVNUPScsICctZScsICdFWFRSQV9DT05GSUdVUkVfT1BUUz0nLCAnLWUn
LCAnVj0nLCAnLWUnLCAnSj0xNCcsICctZScsICdERUJVRz0nLCAnLWUnLCAnU0hPV19FTlY9Jywg
Jy1lJywgJ0NDQUNIRV9ESVI9L3Zhci90bXAvY2NhY2hlJywgJy12JywgJy9ob21lL3BhdGNoZXcv
LmNhY2hlL3FlbXUtZG9ja2VyLWNjYWNoZTovdmFyL3RtcC9jY2FjaGU6eicsICctdicsICcvdmFy
L3RtcC9wYXRjaGV3LXRlc3Rlci10bXAtaWpzYl94N2Evc3JjL2RvY2tlci1zcmMuMjAyMC0wMy0x
MS0xNS4yNy4zNS43MzcyOi92YXIvdG1wL3FlbXU6eixybycsICdxZW11OmZlZG9yYScsICcvdmFy
L3RtcC9xZW11L3J1bicsICd0ZXN0LW1pbmd3J10nIHJldHVybmVkIG5vbi16ZXJvIGV4aXQgc3Rh
dHVzIDIuCmZpbHRlcj0tLWZpbHRlcj1sYWJlbD1jb20ucWVtdS5pbnN0YW5jZS51dWlkPTI1Yjc3
ZmVhMTM1YTRiOTk5Mzg5MzE3MmVmYjg4ZjU1Cm1ha2VbMV06ICoqKiBbZG9ja2VyLXJ1bl0gRXJy
b3IgMQptYWtlWzFdOiBMZWF2aW5nIGRpcmVjdG9yeSBgL3Zhci90bXAvcGF0Y2hldy10ZXN0ZXIt
dG1wLWlqc2JfeDdhL3NyYycKbWFrZTogKioqIFtkb2NrZXItcnVuLXRlc3QtbWluZ3dAZmVkb3Jh
XSBFcnJvciAyCgpyZWFsICAgIDVtMTQuNzQ0cwp1c2VyICAgIDBtOC4zMzNzCgoKVGhlIGZ1bGwg
bG9nIGlzIGF2YWlsYWJsZSBhdApodHRwOi8vcGF0Y2hldy5vcmcvbG9ncy8yMDIwMDMxMTE3MjAx
NC4zMzA1Mi0xLXNoYW1lZXJhbGkua29sb3RodW0udGhvZGlAaHVhd2VpLmNvbS90ZXN0aW5nLmRv
Y2tlci1taW5nd0BmZWRvcmEvP3R5cGU9bWVzc2FnZS4KLS0tCkVtYWlsIGdlbmVyYXRlZCBhdXRv
bWF0aWNhbGx5IGJ5IFBhdGNoZXcgW2h0dHBzOi8vcGF0Y2hldy5vcmcvXS4KUGxlYXNlIHNlbmQg
eW91ciBmZWVkYmFjayB0byBwYXRjaGV3LWRldmVsQHJlZGhhdC5jb20=
