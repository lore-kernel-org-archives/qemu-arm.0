Received: by 2002:adf:f011:0:0:0:0:0 with SMTP id j17csp595556wro;
        Thu, 14 Mar 2019 02:06:18 -0700 (PDT)
X-Google-Smtp-Source: APXvYqx/j361wVCSLw00P3v9xDINnIrPEQLJ0xCoqNOb9peCbOmgX4qBltFhe0n2JF1UddmHv87M
X-Received: by 2002:a81:2002:: with SMTP id g2mr37671096ywg.60.1552554378451;
        Thu, 14 Mar 2019 02:06:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1552554378; cv=none;
        d=google.com; s=arc-20160816;
        b=gANIrPy5fES7aR9BFq7Uuh8vGPkX2ZrfyHV7Q/NKjR77wWdM7zxYhviepExXCsQhGF
         EbYpx1/lvarkViSLv4lsWN/mgAYNaHe2pvOM1SzOkQ7g9RRz5irUvkEXa2NiI2fIZ4wS
         2i/oSAXkn2h04wZq6aFCsmOCyZ3In6Mp9C9WTcunS629NT4LMJX83T/M02kO0IjAjg26
         esLFDV2ls36O9kpKvpqmIsGdiwFsiWK8r34JIi2JZgFz0wZC25Ze5kzNNWvHNnAMGwN2
         oA3VXQVAGoz33a1DgZw/uln9Wzc4BSZTAUg4dpv87VYis1iyq3iVNB+E50QoPMpD1FTJ
         h0hA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:content-language
         :in-reply-to:mime-version:user-agent:date:message-id:from:references
         :to;
        bh=u4BhffLcvfbvon9RiUL/AQFrEuMGKl2h5k1LAOqyRo0=;
        b=Lctd2F09477zfB3LbjBsfXc+5cEZPsTZWQsCMY7SCp5dLSbGe0bxoaUP5yFw029r6D
         K/EERpQTGKfcsEW4axsf0mjVyfpVcYGZaOHI+usWjgQEJlKq+LNB1WQBdKlxaS+yfOUq
         34iMnK5WUe49rgpi+ez1lka+lX/nFJhnHTXQrcjQzu2nbAgPHuT/72uKYqYBTDYn40xL
         wtIOqogBWrerbf3b0z6b2AJ9gyIVWZIrTkgn/DOFWk17y/xsti9NqIgkcsNs9pr211lW
         Btht0nnNzqsWHAcx++7isEn3EB1ypXWfPVLOEaiLxiDHF5Wc7WUEg99vQ8ZKMcXH1c9W
         s6XQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e144si7804421yba.178.2019.03.14.02.06.18
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 14 Mar 2019 02:06:18 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([127.0.0.1]:59420 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1h4MJd-0008Hj-R9
	for alex.bennee@linaro.org; Thu, 14 Mar 2019 05:06:17 -0400
Received: from eggs.gnu.org ([209.51.188.92]:56815)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1h4MJK-0008FI-9z
	for qemu-arm@nongnu.org; Thu, 14 Mar 2019 05:05:59 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1h4MJJ-0003EZ-2n
	for qemu-arm@nongnu.org; Thu, 14 Mar 2019 05:05:58 -0400
Received: from 7.mo68.mail-out.ovh.net ([46.105.63.230]:35746)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <clg@kaod.org>) id 1h4MJI-0003DT-Ln
	for qemu-arm@nongnu.org; Thu, 14 Mar 2019 05:05:57 -0400
Received: from player739.ha.ovh.net (unknown [10.109.146.53])
	by mo68.mail-out.ovh.net (Postfix) with ESMTP id 13BAE1169CC
	for <qemu-arm@nongnu.org>; Thu, 14 Mar 2019 10:05:53 +0100 (CET)
Received: from kaod.org (lfbn-1-2226-17.w90-76.abo.wanadoo.fr [90.76.48.17])
	(Authenticated sender: clg@kaod.org)
	by player739.ha.ovh.net (Postfix) with ESMTPSA id 63F5D3C89F0D;
	Thu, 14 Mar 2019 09:05:47 +0000 (UTC)
To: Peter Maydell <peter.maydell@linaro.org>
References: <20190314084235.9887-1-clg@kaod.org>
	<20190314084235.9887-6-clg@kaod.org>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <3876e39f-ed28-3b86-91e1-8bc1fc99be60@kaod.org>
Date: Thu, 14 Mar 2019 10:05:46 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <20190314084235.9887-6-clg@kaod.org>
Content-Type: multipart/mixed; boundary="------------623FB485399FBD46C45D1772"
Content-Language: en-US
X-Ovh-Tracer-Id: 1833246524009253734
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedutddrhedugdduvdekucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddm
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 46.105.63.230
Subject: Re: [Qemu-arm] [PATCH 5/5] aspeed/timer: Use signed muldiv for
 timer resets
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
Cc: Andrew Jeffery <andrew@aj.id.au>, qemu-arm@nongnu.org,
	Joel Stanley <joel@jms.id.au>,
	Christian Svensson <bluecmd@google.com>, qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: mHkZ0PmcjjJC

This is a multi-part message in MIME format.
--------------623FB485399FBD46C45D1772
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Christian,

Could you please provide a fix for this patch ? patchew complains, see
attached log.

Thanks,

C.=20

On 3/14/19 9:42 AM, C=C3=A9dric Le Goater wrote:
> From: Christian Svensson <bluecmd@google.com>
>=20
> If the host decrements the counter register that results in a negative
> delta. This is then passed to muldiv64 which only handles unsigned
> numbers resulting in bogus results.
>=20
> This fix ensures the data being operated on is signed before it is
> ultimately casted to the final unsigned value.
>=20
> Test case: kexec a kernel using aspeed_timer and it will freeze on the
> second bootup when the kernel initializes the timer. With this patch
> that no longer happens and the timer appears to run OK.
>=20
> Signed-off-by: Christian Svensson <bluecmd@google.com>
> [clg: - checkpatch fixes ]
> Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
> ---
>  hw/timer/aspeed_timer.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>=20
> diff --git a/hw/timer/aspeed_timer.c b/hw/timer/aspeed_timer.c
> index 9988b8fbbf17..0b16eac8970c 100644
> --- a/hw/timer/aspeed_timer.c
> +++ b/hw/timer/aspeed_timer.c
> @@ -275,7 +275,8 @@ static void aspeed_timer_set_value(AspeedTimerCtrlS=
tate *s, int timer, int reg,
>              int64_t delta =3D (int64_t) value - (int64_t) calculate_ti=
cks(t, now);
>              uint32_t rate =3D calculate_rate(t);
> =20
> -            t->start +=3D muldiv64(delta, NANOSECONDS_PER_SECOND, rate=
);
> +            t->start =3D (int64_t)t->start +
> +                ((__int128_t)delta * NANOSECONDS_PER_SECOND / rate);
>              aspeed_timer_mod(t);
>          }
>          break;
>=20


--------------623FB485399FBD46C45D1772
Content-Type: message/rfc822;
 name="[Qemu-devel] [PATCH 0/5] aspeed/timer: Fix slowdowns in recent
 Linux.eml"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename*0="[Qemu-devel] [PATCH 0/5] aspeed/timer: Fix slowdowns in rece";
 filename*1="nt Linux.eml"

Return-Path: <no-reply@patchew.org>
Delivered-To: clg@kaod.org
Received: from localhost (HELO queue) (127.0.0.1)
	by localhost with SMTP; 14 Mar 2019 11:00:11 +0200
Received: from unknown (HELO output45.mail.ovh.net) (10.108.115.102)
  by mail702.ha.ovh.net with AES256-GCM-SHA384 encrypted SMTP; 14 Mar 2019 11:00:11 +0200
Received: from vr27.mail.ovh.net (unknown [10.101.8.27])
	by out45.mail.ovh.net (Postfix) with ESMTP id 44KjMt5R98z2VdC5s
	for <clg@kaod.org>; Thu, 14 Mar 2019 09:00:10 +0000 (UTC)
Received: from in2.mail.ovh.net (unknown [10.101.4.2])
	by vr27.mail.ovh.net (Postfix) with ESMTP id 44KjMt1ngFzHmlZr
	for <clg@kaod.org>; Thu, 14 Mar 2019 09:00:10 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=135.84.80.216; helo=sender-of-o51.zoho.com; envelope-from=no-reply@patchew.org; receiver=<UNKNOWN> 
Authentication-Results: in2.mail.ovh.net; dkim=none; dkim-atps=neutral
Received: from sender-of-o51.zoho.com (sender-of-o51.zoho.com [135.84.80.216])
	by in2.mail.ovh.net (Postfix) with ESMTPS id 44KjMs3B9Cz10MSJ
	for <clg@kaod.org>; Thu, 14 Mar 2019 09:00:08 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1552554000; cv=none; 
	d=zoho.com; s=zohoarc; 
	b=IEYZTDpiQE4cRMdW9hT7fuwFyLVq2v0upTLrxhaTSoQFgjkBJN1zwrJjUDH3nFXcNtQTd2+hNQfm3vL4EhUAB02FH6fskYfF5EZnOJJ+dJfdpbrnbUDeE2HKt9BoB+QU1lDiZqdzTWL7jV5odp/q9yeummdnH0rO1rFTyUo73q4=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zoho.com; s=zohoarc; 
	t=1552554000; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:Reply-To:Subject:To:ARC-Authentication-Results; 
	bh=PDTli+9m6V3dcL3VCTvLZC/zfyYMS88moVsNhO9kujg=; 
	b=I1FVmnK8avhqbQSmQzFulf/vj4kmkgURAZcg0U/ZkRvzexhBTG/poamZV3qATkyxHLthG9XlK377bcFTIZXHCRX53nSP64SEFk+rNPEhvGG2AFm8RjyF0Jquac/m7cLNredcOJ/xIN6L9KGKFMS+N12ZXUWogD+X2mYpWKRuPDA=
ARC-Authentication-Results: i=1; mx.zoho.com;
	dkim=pass  header.i=patchew.org;
	spf=pass  smtp.mailfrom=no-reply@patchew.org;
	dmarc=pass header.from=<no-reply@patchew.org> header.from=<no-reply@patchew.org>
Received: from [172.17.0.3] (23.253.156.214 [23.253.156.214]) by mx.zohomail.com
	with SMTPS id 1552553999082843.1413899273413; Thu, 14 Mar 2019 01:59:59 -0700 (PDT)
In-Reply-To: <20190314084235.9887-1-clg@kaod.org>
Reply-To: <qemu-devel@nongnu.org>
Message-ID: <155255399748.14224.8340819987953765086@00e3a2c681c7>
Subject: Re: [Qemu-devel] [PATCH 0/5] aspeed/timer: Fix slowdowns in recent Linux
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Resent-From: 
From: no-reply@patchew.org
To: clg@kaod.org
Cc: fam@euphon.net, peter.maydell@linaro.org, andrew@aj.id.au, clg@kaod.org, qemu-arm@nongnu.org, joel@jms.id.au, qemu-devel@nongnu.org
Date: Thu, 14 Mar 2019 01:59:59 -0700 (PDT)
X-ZohoMailClient: External
X-Ovh-Remote: 135.84.80.216 (sender-of-o51.zoho.com)
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: 0
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedutddrhedugdduvdejucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenuc
X-Ovh-Spam-Status: OK
X-Ovh-Spam-Reason: vr: OK; dkim: disabled; spf: disabled
X-Ovh-Message-Type: OK

UGF0Y2hldyBVUkw6IGh0dHBzOi8vcGF0Y2hldy5vcmcvUUVNVS8yMDE5MDMxNDA4NDIzNS45ODg3
LTEtY2xnQGthb2Qub3JnLwoKCgpIaSwKClRoaXMgc2VyaWVzIGZhaWxlZCB0aGUgZG9ja2VyLW1p
bmd3QGZlZG9yYSBidWlsZCB0ZXN0LiBQbGVhc2UgZmluZCB0aGUgdGVzdGluZyBjb21tYW5kcyBh
bmQKdGhlaXIgb3V0cHV0IGJlbG93LiBJZiB5b3UgaGF2ZSBEb2NrZXIgaW5zdGFsbGVkLCB5b3Ug
Y2FuIHByb2JhYmx5IHJlcHJvZHVjZSBpdApsb2NhbGx5LgoKPT09IFRFU1QgU0NSSVBUIEJFR0lO
ID09PQojIS9iaW4vYmFzaAp0aW1lIG1ha2UgZG9ja2VyLXRlc3QtbWluZ3dAZmVkb3JhIFNIT1df
RU5WPTEgSj0xNCBORVRXT1JLPTEKPT09IFRFU1QgU0NSSVBUIEVORCA9PT0KCiAgQ0MgICAgICBt
aWdyYXRpb24veGJ6cmxlLm8KICBDQyAgICAgIG1pZ3JhdGlvbi9wb3N0Y29weS1yYW0ubwovdG1w
L3FlbXUtdGVzdC9zcmMvaHcvdGltZXIvYXNwZWVkX3RpbWVyLmM6IEluIGZ1bmN0aW9uICdhc3Bl
ZWRfdGltZXJfc2V0X3ZhbHVlJzoKL3RtcC9xZW11LXRlc3Qvc3JjL2h3L3RpbWVyL2FzcGVlZF90
aW1lci5jOjI3OToxOTogZXJyb3I6ICdfX2ludDEyOF90JyB1bmRlY2xhcmVkIChmaXJzdCB1c2Ug
aW4gdGhpcyBmdW5jdGlvbik7IGRpZCB5b3UgbWVhbiAnX19pbnQxMjgnPwogICAgICAgICAgICAg
ICAgICgoX19pbnQxMjhfdClkZWx0YSAqIE5BTk9TRUNPTkRTX1BFUl9TRUNPTkQgLyByYXRlKTsK
ICAgICAgICAgICAgICAgICAgIF5+fn5+fn5+fn4KICAgICAgICAgICAgICAgICAgIF9faW50MTI4
Ci90bXAvcWVtdS10ZXN0L3NyYy9ody90aW1lci9hc3BlZWRfdGltZXIuYzoyNzk6MTk6IG5vdGU6
IGVhY2ggdW5kZWNsYXJlZCBpZGVudGlmaWVyIGlzIHJlcG9ydGVkIG9ubHkgb25jZSBmb3IgZWFj
aCBmdW5jdGlvbiBpdCBhcHBlYXJzIGluCi90bXAvcWVtdS10ZXN0L3NyYy9ody90aW1lci9hc3Bl
ZWRfdGltZXIuYzoyNzk6MzA6IGVycm9yOiBleHBlY3RlZCAnKScgYmVmb3JlICdkZWx0YScKICAg
ICAgICAgICAgICAgICAoKF9faW50MTI4X3QpZGVsdGEgKiBOQU5PU0VDT05EU19QRVJfU0VDT05E
IC8gcmF0ZSk7CiAgICAgICAgICAgICAgICAgfiAgICAgICAgICAgIF5+fn5+CiAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICkKL3RtcC9xZW11LXRlc3Qvc3JjL2h3L3RpbWVyL2FzcGVlZF90
aW1lci5jOjI3NjoyMjogZXJyb3I6IHVudXNlZCB2YXJpYWJsZSAncmF0ZScgWy1XZXJyb3I9dW51
c2VkLXZhcmlhYmxlXQogICAgICAgICAgICAgdWludDMyX3QgcmF0ZSA9IGNhbGN1bGF0ZV9yYXRl
KHQpOwogICAgICAgICAgICAgICAgICAgICAgXn5+fgovdG1wL3FlbXUtdGVzdC9zcmMvaHcvdGlt
ZXIvYXNwZWVkX3RpbWVyLmM6Mjc1OjIxOiBlcnJvcjogdW51c2VkIHZhcmlhYmxlICdkZWx0YScg
Wy1XZXJyb3I9dW51c2VkLXZhcmlhYmxlXQogICAgICAgICAgICAgaW50NjRfdCBkZWx0YSA9IChp
bnQ2NF90KSB2YWx1ZSAtIChpbnQ2NF90KSBjYWxjdWxhdGVfdGlja3ModCwgbm93KTsKICAgICAg
ICAgICAgICAgICAgICAgXn5+fn4KY2MxOiBhbGwgd2FybmluZ3MgYmVpbmcgdHJlYXRlZCBhcyBl
cnJvcnMKCgpUaGUgZnVsbCBsb2cgaXMgYXZhaWxhYmxlIGF0Cmh0dHA6Ly9wYXRjaGV3Lm9yZy9s
b2dzLzIwMTkwMzE0MDg0MjM1Ljk4ODctMS1jbGdAa2FvZC5vcmcvdGVzdGluZy5kb2NrZXItbWlu
Z3dAZmVkb3JhLz90eXBlPW1lc3NhZ2UuCi0tLQpFbWFpbCBnZW5lcmF0ZWQgYXV0b21hdGljYWxs
eSBieSBQYXRjaGV3IFtodHRwOi8vcGF0Y2hldy5vcmcvXS4KUGxlYXNlIHNlbmQgeW91ciBmZWVk
YmFjayB0byBwYXRjaGV3LWRldmVsQHJlZGhhdC5jb20=


--------------623FB485399FBD46C45D1772--
