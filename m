Received: by 2002:ac2:5937:0:0:0:0:0 with SMTP id v23csp2401404lfi;
        Thu, 26 Mar 2020 14:20:16 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vu4PcTbX8tdgky0t3t08E5WJfP3MuqdrPBIr9gaRWKb/Ecq9JwJw33qvMIGu93mB4HpAuTW
X-Received: by 2002:ac8:1968:: with SMTP id g37mr10880881qtk.322.1585257616439;
        Thu, 26 Mar 2020 14:20:16 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j21si2325068qke.144.2020.03.26.14.20.16
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 26 Mar 2020 14:20:16 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       arc=fail (signature failed);
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:60536 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jHZvD-0001Ah-Rf
	for alex.bennee@linaro.org; Thu, 26 Mar 2020 17:20:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35324)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <no-reply@patchew.org>) id 1jHZur-0000lL-PV
 for qemu-arm@nongnu.org; Thu, 26 Mar 2020 17:19:54 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <no-reply@patchew.org>) id 1jHZuq-0000Qb-Bp
 for qemu-arm@nongnu.org; Thu, 26 Mar 2020 17:19:53 -0400
Resent-Date: Thu, 26 Mar 2020 17:19:53 -0400
Resent-Message-Id: <E1jHZuq-0000Qb-Bp@eggs.gnu.org>
Received: from sender4-of-o51.zoho.com ([136.143.188.51]:21162)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <no-reply@patchew.org>)
 id 1jHZuq-0000NP-4A; Thu, 26 Mar 2020 17:19:52 -0400
ARC-Seal: i=1; a=rsa-sha256; t=1585257587; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=AnNg/N8ktwP/9URZxeDIGjankTnHY6KwoGCpK45qjGaZ4hpGOfzOyAjRAgOzfMW9Y4GBpYpmDD967e1Fx0YfGWo0LbIHEj2vO53iDC8gwoMs763KGX0O27YhGIHBch4zLO/65WpUreP++ILok4c9be2noyfOw2UoE+YFRJSa+7c=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1585257587;
 h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:Reply-To:Subject:To;
 bh=+1fPIDFv0Dy7DTsJKUOm5KFRZqrB4KFG/KgZ87HbTCs=; 
 b=WT+b6vR2FSbXxT+naik6zIkT+ya9DIPLzklcmh26XeFUSrvwGYkFAQ/rGqcvPtKUaNmAJj2+eqwyBPfMghfi1ZbeM5Ih80WWpXQiNokszZKAMogELEPVyH2Q0jQi+MK3ixPfOHtKYPkap8akBcJGGLvitG51CzU9LMPcbRnfEVs=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 spf=pass  smtp.mailfrom=no-reply@patchew.org;
 dmarc=pass header.from=<no-reply@patchew.org>
 header.from=<no-reply@patchew.org>
Received: from [172.17.0.3] (23.253.156.214 [23.253.156.214]) by
 mx.zohomail.com with SMTPS id 1585257584462812.4986226658922;
 Thu, 26 Mar 2020 14:19:44 -0700 (PDT)
In-Reply-To: <20200326203414.18140-1-peter.maydell@linaro.org>
Subject: Re: [PATCH] hw/arm/collie: Put StrongARMState* into a
 CollieMachineState struct
Message-ID: <158525758339.25711.4191316348507848085@39012742ff91>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Resent-From: 
From: no-reply@patchew.org
To: peter.maydell@linaro.org
Date: Thu, 26 Mar 2020 14:19:44 -0700 (PDT)
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
X-TUID: QLAmnSv8nLBf

UGF0Y2hldyBVUkw6IGh0dHBzOi8vcGF0Y2hldy5vcmcvUUVNVS8yMDIwMDMyNjIwMzQxNC4xODE0
MC0xLXBldGVyLm1heWRlbGxAbGluYXJvLm9yZy8KCgoKSGksCgpUaGlzIHNlcmllcyBmYWlsZWQg
dGhlIGRvY2tlci1xdWlja0BjZW50b3M3IGJ1aWxkIHRlc3QuIFBsZWFzZSBmaW5kIHRoZSB0ZXN0
aW5nIGNvbW1hbmRzIGFuZAp0aGVpciBvdXRwdXQgYmVsb3cuIElmIHlvdSBoYXZlIERvY2tlciBp
bnN0YWxsZWQsIHlvdSBjYW4gcHJvYmFibHkgcmVwcm9kdWNlIGl0CmxvY2FsbHkuCgo9PT0gVEVT
VCBTQ1JJUFQgQkVHSU4gPT09CiMhL2Jpbi9iYXNoCm1ha2UgZG9ja2VyLWltYWdlLWNlbnRvczcg
Vj0xIE5FVFdPUks9MQp0aW1lIG1ha2UgZG9ja2VyLXRlc3QtcXVpY2tAY2VudG9zNyBTSE9XX0VO
Vj0xIEo9MTQgTkVUV09SSz0xCj09PSBURVNUIFNDUklQVCBFTkQgPT09CgogIENDICAgICAgeDg2
XzY0LXNvZnRtbXUvaHcvaTM4Ni9rdm0vYXBpYy5vCiAgQ0MgICAgICB4ODZfNjQtc29mdG1tdS9o
dy9pMzg2L2t2bS9pb2FwaWMubwovdG1wL3FlbXUtdGVzdC9zcmMvaHcvYXJtL2NvbGxpZS5jOiBJ
biBmdW5jdGlvbiAnY29sbGllX2luaXQnOgovdG1wL3FlbXUtdGVzdC9zcmMvaHcvYXJtL2NvbGxp
ZS5jOjY3OjIxOiBlcnJvcjogJ3MnIHVuZGVjbGFyZWQgKGZpcnN0IHVzZSBpbiB0aGlzIGZ1bmN0
aW9uKQogICAgIGFybV9sb2FkX2tlcm5lbChzLT5jcHUsIG1hY2hpbmUsICZjb2xsaWVfYmluZm8p
OwogICAgICAgICAgICAgICAgICAgICBeCi90bXAvcWVtdS10ZXN0L3NyYy9ody9hcm0vY29sbGll
LmM6Njc6MjE6IG5vdGU6IGVhY2ggdW5kZWNsYXJlZCBpZGVudGlmaWVyIGlzIHJlcG9ydGVkIG9u
bHkgb25jZSBmb3IgZWFjaCBmdW5jdGlvbiBpdCBhcHBlYXJzIGluCm1ha2VbMV06ICoqKiBbaHcv
YXJtL2NvbGxpZS5vXSBFcnJvciAxCm1ha2VbMV06ICoqKiBXYWl0aW5nIGZvciB1bmZpbmlzaGVk
IGpvYnMuLi4uCiAgQ0MgICAgICB4ODZfNjQtc29mdG1tdS9ody9pMzg2L2t2bS9pODI1NC5vCiAg
Q0MgICAgICB4ODZfNjQtc29mdG1tdS9ody9pMzg2L2t2bS9pODI1OS5vCi0tLQogIENDICAgICAg
eDg2XzY0LXNvZnRtbXUvcWFwaS9xYXBpLXR5cGVzLm8KICBDQyAgICAgIHg4Nl82NC1zb2Z0bW11
L3FhcGkvcWFwaS12aXNpdC1tYWNoaW5lLXRhcmdldC5vCiAgQ0MgICAgICB4ODZfNjQtc29mdG1t
dS9xYXBpL3FhcGktdmlzaXQtbWlzYy10YXJnZXQubwptYWtlOiAqKiogW2FhcmNoNjQtc29mdG1t
dS9hbGxdIEVycm9yIDIKbWFrZTogKioqIFdhaXRpbmcgZm9yIHVuZmluaXNoZWQgam9icy4uLi4K
ICBDQyAgICAgIHg4Nl82NC1zb2Z0bW11L3FhcGkvcWFwaS12aXNpdC5vCiAgQ0MgICAgICB4ODZf
NjQtc29mdG1tdS9xYXBpL3FhcGktZXZlbnRzLW1hY2hpbmUtdGFyZ2V0Lm8KLS0tCiAgICByYWlz
ZSBDYWxsZWRQcm9jZXNzRXJyb3IocmV0Y29kZSwgY21kKQpzdWJwcm9jZXNzLkNhbGxlZFByb2Nl
c3NFcnJvcjogQ29tbWFuZCAnWydzdWRvJywgJy1uJywgJ2RvY2tlcicsICdydW4nLCAnLS1sYWJl
bCcsICdjb20ucWVtdS5pbnN0YW5jZS51dWlkPThmMDM0NGNjZTg1YTQyYWJhMTU4MzQzNzU2M2I0
MzAwJywgJy11JywgJzEwMDEnLCAnLS1zZWN1cml0eS1vcHQnLCAnc2VjY29tcD11bmNvbmZpbmVk
JywgJy0tcm0nLCAnLWUnLCAnVEFSR0VUX0xJU1Q9JywgJy1lJywgJ0VYVFJBX0NPTkZJR1VSRV9P
UFRTPScsICctZScsICdWPScsICctZScsICdKPTE0JywgJy1lJywgJ0RFQlVHPScsICctZScsICdT
SE9XX0VOVj0xJywgJy1lJywgJ0NDQUNIRV9ESVI9L3Zhci90bXAvY2NhY2hlJywgJy12JywgJy9o
b21lL3BhdGNoZXcvLmNhY2hlL3FlbXUtZG9ja2VyLWNjYWNoZTovdmFyL3RtcC9jY2FjaGU6eics
ICctdicsICcvdmFyL3RtcC9wYXRjaGV3LXRlc3Rlci10bXAtdXNtZmI5cHAvc3JjL2RvY2tlci1z
cmMuMjAyMC0wMy0yNi0xNy4xNy4xMC4zMDk4MzovdmFyL3RtcC9xZW11Onoscm8nLCAncWVtdTpj
ZW50b3M3JywgJy92YXIvdG1wL3FlbXUvcnVuJywgJ3Rlc3QtcXVpY2snXScgcmV0dXJuZWQgbm9u
LXplcm8gZXhpdCBzdGF0dXMgMi4KZmlsdGVyPS0tZmlsdGVyPWxhYmVsPWNvbS5xZW11Lmluc3Rh
bmNlLnV1aWQ9OGYwMzQ0Y2NlODVhNDJhYmExNTgzNDM3NTYzYjQzMDAKbWFrZVsxXTogKioqIFtk
b2NrZXItcnVuXSBFcnJvciAxCm1ha2VbMV06IExlYXZpbmcgZGlyZWN0b3J5IGAvdmFyL3RtcC9w
YXRjaGV3LXRlc3Rlci10bXAtdXNtZmI5cHAvc3JjJwptYWtlOiAqKiogW2RvY2tlci1ydW4tdGVz
dC1xdWlja0BjZW50b3M3XSBFcnJvciAyCgpyZWFsICAgIDJtMzMuNTQwcwp1c2VyICAgIDBtOC42
OTBzCgoKVGhlIGZ1bGwgbG9nIGlzIGF2YWlsYWJsZSBhdApodHRwOi8vcGF0Y2hldy5vcmcvbG9n
cy8yMDIwMDMyNjIwMzQxNC4xODE0MC0xLXBldGVyLm1heWRlbGxAbGluYXJvLm9yZy90ZXN0aW5n
LmRvY2tlci1xdWlja0BjZW50b3M3Lz90eXBlPW1lc3NhZ2UuCi0tLQpFbWFpbCBnZW5lcmF0ZWQg
YXV0b21hdGljYWxseSBieSBQYXRjaGV3IFtodHRwczovL3BhdGNoZXcub3JnL10uClBsZWFzZSBz
ZW5kIHlvdXIgZmVlZGJhY2sgdG8gcGF0Y2hldy1kZXZlbEByZWRoYXQuY29t
