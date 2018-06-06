Received: by 2002:a5d:4301:0:0:0:0:0 with SMTP id h1-v6csp641310wrq;
        Wed, 6 Jun 2018 03:32:52 -0700 (PDT)
X-Google-Smtp-Source: ADUXVKKChFyocaxKt1JK3VvSIVzZ9G4tscUzV+KwhODpwJz985K2yQTjxV0iiC9g3fVCTgArUkJF
X-Received: by 2002:ac8:2191:: with SMTP id 17-v6mr2148287qty.279.1528281172673;
        Wed, 06 Jun 2018 03:32:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1528281172; cv=none;
        d=google.com; s=arc-20160816;
        b=xp1t3iXEqduIFckpE9LrWVx2+OB0qsV20UDJleJ6ov80nmuE+NewnWlEk03FpEzlxL
         pb6TQHzgUnYHFg44/AeZoznJnp4Z9MJyBRwe5dKcGanOuof/3N0THOzCRPE+z0L7SuxR
         vuFfEuES0WSt0lmJS9n/NE8YKVkqo0fqE4uGdsLiUqpFAIXhYvIYzeAlKR2N+PgM3v/L
         e/me/U1iqAA0rxoxMUrEbX4SXghD6IckbRiJt/WC1U5xL98fFaKVVaxORJlXE1lpOOwD
         4yp42vU4Es192IW23bJvoXg8UYaMe465pTDo4eq4yOXWazrJpvcgg6fnbXY/oPYoCEHh
         6Clw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence:subject:date:to
         :from:resent-from:content-transfer-encoding:mime-version:message-id
         :in-reply-to:resent-message-id:resent-date
         :arc-authentication-results;
        bh=/3Z4NfmFc0OMZZaSDL1fTdtv3JaRhPl7xSJDWrgtkRI=;
        b=kYBWw1XJiMxrqQrRqvWkvsHbZGRD5hDRodozQ83MIdgEjINFvKlTDYl9Y5fI5/wux7
         wGm3FF6VcaAvNVZegn1W9OdDggIaxHVGUBRxMnXlnij/RCRxKg6uycYytZ9npAtFfMRe
         UbAEvGSB3/Xw9rRsEj1hIiPnZfpJ+/LhXTLqqhRFXthCOD4pSMBR/PqK0YUp5NexeHw8
         d1Z3p+ASRdSN+K13tYJEyz4FoWCt6mQWS2lMTXzBbkvDlyPrv7VDC6aYB3Hv6sop3esD
         4rm6vWU3lUpwpqsFHDVpXLq24QaNX3Yrg0WMQnBA5R7tBQUqX0Rd8+9KW2xEq1sYEOqV
         xgMA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 49-v6si3634079qvw.269.2018.06.06.03.32.52
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 06 Jun 2018 03:32:52 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:51310 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fQVkK-0003hh-4O
	for alex.bennee@linaro.org; Wed, 06 Jun 2018 06:32:52 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47856)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <no-reply@patchew.org>) id 1fQVk5-0003gV-94
	for qemu-arm@nongnu.org; Wed, 06 Jun 2018 06:32:38 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <no-reply@patchew.org>) id 1fQVk1-0008Mi-Ed
	for qemu-arm@nongnu.org; Wed, 06 Jun 2018 06:32:37 -0400
Resent-Date: Wed, 06 Jun 2018 06:32:37 -0400
Resent-Message-Id: <E1fQVk1-0008Mi-Ed@eggs.gnu.org>
Received: from sender-of-o51.zoho.com ([135.84.80.216]:21146)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <no-reply@patchew.org>)
	id 1fQVk1-0008Kr-6f
	for qemu-arm@nongnu.org; Wed, 06 Jun 2018 06:32:33 -0400
Received: from [172.17.0.2] (23.253.156.214 [23.253.156.214]) by
	mx.zohomail.com with SMTPS id 1528281120988362.4589396304232;
	Wed, 6 Jun 2018 03:32:00 -0700 (PDT)
In-Reply-To: <1528233505-25842-1-git-send-email-thuth@redhat.com>
Message-ID: <152828111997.435.2720941435101125836@d39dc562802a>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Resent-From: 
From: no-reply@patchew.org
To: thuth@redhat.com
Date: Wed, 6 Jun 2018 03:32:00 -0700 (PDT)
X-ZohoMailClient: External
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 135.84.80.216
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH] hw/arm: Remove the deprecated
 xlnx-ep108 machine
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Reply-To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org, famz@redhat.com, alistair@alistair23.me,
	qemu-devel@nongnu.org, alistair.francis@xilinx.com, qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ARa/9yQp7ucQ

SGksCgpUaGlzIHNlcmllcyBmYWlsZWQgZG9ja2VyLW1pbmd3QGZlZG9yYSBidWlsZCB0ZXN0LiBQ
bGVhc2UgZmluZCB0aGUgdGVzdGluZyBjb21tYW5kcyBhbmQKdGhlaXIgb3V0cHV0IGJlbG93LiBJ
ZiB5b3UgaGF2ZSBEb2NrZXIgaW5zdGFsbGVkLCB5b3UgY2FuIHByb2JhYmx5IHJlcHJvZHVjZSBp
dApsb2NhbGx5LgoKVHlwZTogc2VyaWVzCk1lc3NhZ2UtaWQ6IDE1MjgyMzM1MDUtMjU4NDItMS1n
aXQtc2VuZC1lbWFpbC10aHV0aEByZWRoYXQuY29tClN1YmplY3Q6IFtRZW11LWRldmVsXSBbUEFU
Q0hdIGh3L2FybTogUmVtb3ZlIHRoZSBkZXByZWNhdGVkIHhsbngtZXAxMDggbWFjaGluZQoKPT09
IFRFU1QgU0NSSVBUIEJFR0lOID09PQojIS9iaW4vYmFzaApzZXQgLWUKZ2l0IHN1Ym1vZHVsZSB1
cGRhdGUgLS1pbml0IGR0YwojIExldCBkb2NrZXIgdGVzdHMgZHVtcCBlbnZpcm9ubWVudCBpbmZv
CmV4cG9ydCBTSE9XX0VOVj0xCmV4cG9ydCBKPTgKdGltZSBtYWtlIGRvY2tlci10ZXN0LW1pbmd3
QGZlZG9yYQo9PT0gVEVTVCBTQ1JJUFQgRU5EID09PQoKVXBkYXRpbmcgM2M4Y2Y1YTljMjFmZjg3
ODIxNjRkMWRlZjdmNDRiZDg4ODcxMzM4NApmYXRhbDogdW5hYmxlIHRvIGFjY2VzcyAnaHR0cHM6
Ly9naXRodWIuY29tL3BhdGNoZXctcHJvamVjdC9xZW11Lyc6IEVuY291bnRlcmVkIGVuZCBvZiBm
aWxlCmVycm9yOiBDb3VsZCBub3QgZmV0Y2ggM2M4Y2Y1YTljMjFmZjg3ODIxNjRkMWRlZjdmNDRi
ZDg4ODcxMzM4NApUcmFjZWJhY2sgKG1vc3QgcmVjZW50IGNhbGwgbGFzdCk6CiAgRmlsZSAiL3Vz
ci9iaW4vcGF0Y2hldyIsIGxpbmUgNDQyLCBpbiB0ZXN0X29uZQogICAgZ2l0X2Nsb25lX3JlcG8o
Y2xvbmUsIHJbInJlcG8iXSwgclsiaGVhZCJdLCBsb2dmKQogIEZpbGUgIi91c3IvYmluL3BhdGNo
ZXciLCBsaW5lIDQ4LCBpbiBnaXRfY2xvbmVfcmVwbwogICAgc3Rkb3V0PWxvZ2YsIHN0ZGVycj1s
b2dmKQogIEZpbGUgIi91c3IvbGliNjQvcHl0aG9uMy42L3N1YnByb2Nlc3MucHkiLCBsaW5lIDI5
MSwgaW4gY2hlY2tfY2FsbAogICAgcmFpc2UgQ2FsbGVkUHJvY2Vzc0Vycm9yKHJldGNvZGUsIGNt
ZCkKc3VicHJvY2Vzcy5DYWxsZWRQcm9jZXNzRXJyb3I6IENvbW1hbmQgJ1snZ2l0JywgJ3JlbW90
ZScsICdhZGQnLCAnLWYnLCAnLS1taXJyb3I9ZmV0Y2gnLCAnM2M4Y2Y1YTljMjFmZjg3ODIxNjRk
MWRlZjdmNDRiZDg4ODcxMzM4NCcsICdodHRwczovL2dpdGh1Yi5jb20vcGF0Y2hldy1wcm9qZWN0
L3FlbXUnXScgcmV0dXJuZWQgbm9uLXplcm8gZXhpdCBzdGF0dXMgMS4KCgoKLS0tCkVtYWlsIGdl
bmVyYXRlZCBhdXRvbWF0aWNhbGx5IGJ5IFBhdGNoZXcgW2h0dHA6Ly9wYXRjaGV3Lm9yZy9dLgpQ
bGVhc2Ugc2VuZCB5b3VyIGZlZWRiYWNrIHRvIHBhdGNoZXctZGV2ZWxAcmVkaGF0LmNvbQ==

