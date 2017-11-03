Received: by 10.223.150.237 with SMTP id u100csp243997wrb;
        Fri, 3 Nov 2017 13:27:10 -0700 (PDT)
X-Google-Smtp-Source: ABhQp+QV4TGQcJErLnmfbd+NG/s8FkAXKz6FGeVc9PB9PaomASRT50RLMGxO6WzI1Yu7y8rbZ7i2
X-Received: by 10.37.1.130 with SMTP id 124mr5483444ybb.420.1509740830449;
        Fri, 03 Nov 2017 13:27:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1509740830; cv=none;
        d=google.com; s=arc-20160816;
        b=RmouKAlHmA/NDIYcYHT0rXk6z67kWwPj+GxxHuAPs2Exs08PgLc6LKZP3sA6eWGQDD
         hdV+sgqiI/MNQQGLG+G/dqzLnuRV7gj6o/+aQdYA6pWEs6nHD408tregB1xbzqaMePGN
         omODGqpSrOL4yMtMWYQ1mby67WZieXA1SkxsHJdmTdKWH8NtsMLPxrcmoLQn13jG8k6W
         wD+9clWgj4uZYvHvobxNz5MmKXkC+/mwsWtBR+ZPu7mEyS6D0rQbRR4kasz59sfM9xYM
         IDlNUcLPYhhaaoCrC8vr7ElKV+sTqK+pKQ2svQ+pHitB3t97TyjjImGKgQUhwbulINaL
         BZ9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=T2AH302TNi0zLLW0x3o7zk1q0KAFyAu4TeQR2me0Tv4=;
        b=tqpyFC3hXzAJ6fFoFiPX8ScDMwjWHJK5NyY6Bq1nzz8KW/eXibwfiRCpglo06UK/WV
         PilkfhVLuZRrI99OSrDffpMcPZXcGeyk390VtoGjcjHb0bf0JlY6nyG8n909PjNORBfj
         VoS2TUH08xoTqGBakvrHnOWg/fLWskV1wBuJ1ZNlCIKzEoOYCDiQjTzlm29T2wIz1dAX
         lx5BeNOgHUVt39MZaIEZ3O5dR4+k+qfA4Lw805mBVg4EfKZQxxWMN1Y/F0lhdjC363AV
         a5Ry3SvIR++MTTgRLMgyI8w+Yr3s5En4uJtiCoS8NrDzOmGz2n0OmudpbdrPlr38Qpg0
         dhew==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id o84si697560ybb.105.2017.11.03.13.27.10
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 03 Nov 2017 13:27:10 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:38335 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eAiYX-0001gW-Pr
	for alex.bennee@linaro.org; Fri, 03 Nov 2017 16:27:09 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49135)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1eAiYC-0001WP-1V
	for qemu-arm@nongnu.org; Fri, 03 Nov 2017 16:26:48 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1eAiY8-0000XM-V4
	for qemu-arm@nongnu.org; Fri, 03 Nov 2017 16:26:48 -0400
Received: from mout.kundenserver.de ([212.227.126.130]:50357)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <laurent@vivier.eu>)
	id 1eAiY8-0000WK-KU; Fri, 03 Nov 2017 16:26:44 -0400
Received: from localhost.localdomain ([78.238.229.36]) by
	mrelayeu.kundenserver.de (mreue003 [212.227.15.167]) with ESMTPSA
	(Nemesis)
	id 0LzneB-1d7MN41Tlb-014zN0; Fri, 03 Nov 2017 21:26:29 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Date: Fri,  3 Nov 2017 21:26:24 +0100
Message-Id: <20171103202624.5956-5-laurent@vivier.eu>
X-Mailer: git-send-email 2.13.6
In-Reply-To: <20171103202624.5956-1-laurent@vivier.eu>
References: <20171103202624.5956-1-laurent@vivier.eu>
X-Provags-ID: V03:K0:4uH8cMy9vOzlQD96QkFK1E5nz+SzqxZ/7XRsJu+noBVUvo4WLsk
	urFvLe+9QkNr2BTWvnizG5owedD+ugEeKEnOeV0imvzbBRQpOvbk3V5DrMPwWgzxGdTG7Om
	/HpDNMd8+R8RDxE4xE3LT/IpqkOrwU6G5f65yKQ36xg5VUogwC0Qj7wVr/nbkZYD5GKH3PE
	MNOH4XKf9ptFu1c5ZWTHg==
X-UI-Out-Filterresults: notjunk:1;V01:K0:I8IxDBST+28=:2bsflxApj7snSKEuX7ySp6
	UbXprH33SGeeDfi0a1eqlJ/PWNmdnklrDrLifUa1u8V8Sz9mIrlcsSj142j2qm1U6uW1j0htg
	aePfkxzskWShtO4a3jtEkFOF5e0jsdpc4eyvgxT0p2tNvlVfEjqwaTW9u2zP3YoR4xpBc6LNl
	J5oyDZhwNTqgyDiBZYmaFwCHGwOMlcHkEnaRsHkD77WGLwkSBhvQacF3M03VO9i3259cSEq1r
	aVwLWCf+AnOcgKRY009zNBYg1KaEk+xesZtC3jusMz+myHDhvlnTzXAXXAHl4Pm2g0vaEGaqF
	S06Nofk6j3eFeIE5nm3Xy1U5OGSDxoP5xP8HOzxbQUY3v4k9kzu/5oMIsAnlSlEjBkJOH7hdF
	GbRtAhaEi8/c9wBAy/11/aFsUG/yWW2ABLRxaMCrk/J35NerSUsR/EvfPybK2R8+gXfm7EvZB
	5DlBOp+o95MoS+4YHI5pjHzIPNR06VUH4kBXhirM2yLRBcMjsZgNTF8MCN8bmI/Is5VJNYnsT
	Pt4VLdQMK1UxQukd+Kx5U8mhNEpHTQfewQMndursP13j13u4cM/5Jga+U9+Fglb9bd+Awpv6u
	A9zJDaGGu4Tt9wtEjetfIsLHbv10r8KvBIfN9cNMzaoczxZtdfrTfGUerWkywUo6GL5NWYQoR
	8q4ISGuy9NAQlynaEIThIJoabUUzZpjUbFYn8AMUdotDryicSQ4hqafAJWE0Ak7y2OgzUe1YK
	rSnopyyItud88UzZSzZ/WCnZzv8r/0yC0BuOPA==
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 212.227.126.130
Subject: [Qemu-arm] [PATCH 4/4] softfloat: use floatXX_val() in XX_minmax()
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
	Laurent Vivier <laurent@vivier.eu>, qemu-arm@nongnu.org,
	Stafford Horne <shorne@gmail.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: IbqGbNdW/TCa

Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 fpu/softfloat.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/fpu/softfloat.c b/fpu/softfloat.c
index 433c5dad2d..331d78e848 100644
--- a/fpu/softfloat.c
+++ b/fpu/softfloat.c
@@ -7700,11 +7700,9 @@ static inline float ## s float ## s ## _minmax(float ## s a, float ## s b,     \
     }                                                                   \
     aSign = extractFloat ## s ## Sign(a);                               \
     bSign = extractFloat ## s ## Sign(b);                               \
-    av = float ## s ## _val(a);                                         \
-    bv = float ## s ## _val(b);                                         \
     if (ismag) {                                                        \
-        aav = float ## s ## _abs(av);                                   \
-        abv = float ## s ## _abs(bv);                                   \
+        aav = float ## s ## _val(float ## s ## _abs(a));                \
+        abv = float ## s ## _val(float ## s ## _abs(b));                \
         if (aav != abv) {                                               \
             if (ismin) {                                                \
                 return (aav < abv) ? a : b;                             \
@@ -7713,6 +7711,8 @@ static inline float ## s float ## s ## _minmax(float ## s a, float ## s b,     \
             }                                                           \
         }                                                               \
     }                                                                   \
+    av = float ## s ## _val(a);                                         \
+    bv = float ## s ## _val(b);                                         \
     if (aSign != bSign) {                                               \
         if (ismin) {                                                    \
             return aSign ? a : b;                                       \
-- 
2.13.6

