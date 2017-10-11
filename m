Received: by 10.223.197.9 with SMTP id q9csp77459wrf;
        Tue, 10 Oct 2017 17:27:25 -0700 (PDT)
X-Received: by 10.55.142.5 with SMTP id q5mr16897967qkd.83.1507681645705;
        Tue, 10 Oct 2017 17:27:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1507681645; cv=none;
        d=google.com; s=arc-20160816;
        b=SXMa5X6yHxYjG9g2VQI8Pc162aNLblF8HQBN9caJopsy4pt8mKqBNYRR6ykPzo//Wq
         RX8aqib1Ej7uVCFr7JvmMmk63NS7jNxBq7lv90mTmdQ43IyoeMvFkNn/TODV1m8hKRI4
         6YkhT2IbAO47IqhSaCLznpzmDWcqNR9fVT8iNWfxEDWANa385/Vige0J5UXBEewWGcSp
         HNGUto5gnmFfRw8y5oBJmon7oKTdAoEhJ/b/wD+5BhAdOf0Uq38TvnCyTqz7V2Wiw62j
         NEMaPThtt7RHihEwFJ5mjWuVGH7UogeKVuwsa6IaMR5MOPECPrfhU+1fTbKQsvL7QvfF
         AuMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:dkim-signature
         :arc-authentication-results;
        bh=zNRHGZQ5cLVivaHBKlP8deeeh/sUH6SJ46Lj2d+sYWM=;
        b=BjNeP1/3LqTGHXhUKANrhB3dd7D0Tl1Vf0mtFr3qX1wWQDL2/mQpMqjTjM4xCm6xxh
         F7wK7nGJSOn8aD6hxuiWBAHIq2Cq5ve5jFWYGmJCluYg9ftcwimFYWT06Qs2tpXdLHna
         LinKDbWAbuCUXNHmTcmlwKEtyBdZ8vqpczLKkkoieEYdhyUbTqiTpr6Id5y1B9gSN16c
         QkEtzuYjbaCmE0Q+TktbNNgw96rhVJrB4kWQ49lvE61WJH+Far/upu0p6mpd06zm2FBT
         mMY2IYTXoj3fZG3BWd0S1cpAwDBXfhF1Cr5AlrJ1Jj1cCCaMiyaXyWxg8AJZcuqJCOkd
         vyHQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=C3mMXK2c;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id x141si2800600qkb.235.2017.10.10.17.27.25
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 10 Oct 2017 17:27:25 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=C3mMXK2c;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:37935 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1e24rr-0007ja-EE
	for alex.bennee@linaro.org; Tue, 10 Oct 2017 20:27:23 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51412)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1e24rk-0007jF-Vr
	for qemu-arm@nongnu.org; Tue, 10 Oct 2017 20:27:17 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1e24ri-0004ex-8l
	for qemu-arm@nongnu.org; Tue, 10 Oct 2017 20:27:17 -0400
Received: from mail-pg0-x234.google.com ([2607:f8b0:400e:c05::234]:48935)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1e24ri-0004eX-2i
	for qemu-arm@nongnu.org; Tue, 10 Oct 2017 20:27:14 -0400
Received: by mail-pg0-x234.google.com with SMTP id v78so71467pgb.5
	for <qemu-arm@nongnu.org>; Tue, 10 Oct 2017 17:27:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=zNRHGZQ5cLVivaHBKlP8deeeh/sUH6SJ46Lj2d+sYWM=;
	b=C3mMXK2ceE/HkC7BljMqQRfssPukzURLzCUjFy85Jpdz4l/a3+eONyA+cEuNkn2dHc
	ipcX/Ap5jNE9fBUaz9AmsgiFMfXmvB1odqtIOJa7UzaCz+8n2kV1tEztLahz3PnrJrKG
	qU2z+hgSANVzQXMwyLf2jaoPlcLB4FHpqwl5k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=zNRHGZQ5cLVivaHBKlP8deeeh/sUH6SJ46Lj2d+sYWM=;
	b=gcuDhHiEv8BQzLwh/bRFLjKcRA1hh8C8jddH8I+URq88E63RSKTeFrJyotf3MENJjo
	NU1kb0QBFxFvxk9VYS7ZATs9LGqccq08I3WREGMy3xASIWCk+ReT8pLVwT6bSyUrO61T
	IjP4RFVuHgbNH1Dh+Zr6tJskXqDCFKN+7/6DIeiDV2jauiThFxXQpxWLo6tWO6qfNGHJ
	s+npFjQoiM9dJMZZFJR7P0AObvuglu3P2VcKVo1fb5uNhXFXNMy4GKbZsnbGm1RaGnww
	mL6CjNmvCcCf1NXnAuHAyHh8u/1HwLxKUho0SSJo87mefUT+T8PGd9+bhGVldZeSTIwV
	bO3g==
X-Gm-Message-State: AMCzsaUKvMVbArMtDPo/wNpcKD/D3oBnGEIXYsn2S2WQISKq7dh+uAkD
	PshnqeAKJvUcXtGBhGI1kScKlQ==
X-Google-Smtp-Source: AOwi7QDChEjfmHkoOgnfOxXfaO5y2ZEw8oUE2HoC50BdyKU8ysFwK+HxZQMgjkRbqzGIOKiMCbZaag==
X-Received: by 10.98.198.195 with SMTP id x64mr8258370pfk.322.1507681633050;
	Tue, 10 Oct 2017 17:27:13 -0700 (PDT)
Received: from bigtime.twiddle.net (97-126-104-76.tukw.qwest.net.
	[97.126.104.76]) by smtp.gmail.com with ESMTPSA id
	h70sm23425668pfc.51.2017.10.10.17.27.11
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 10 Oct 2017 17:27:12 -0700 (PDT)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
References: <1507556919-24992-1-git-send-email-peter.maydell@linaro.org>
	<1507556919-24992-3-git-send-email-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <e9f29609-b3e5-25fa-d9d6-903c16f7c8cf@linaro.org>
Date: Tue, 10 Oct 2017 17:27:10 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.3.0
MIME-Version: 1.0
In-Reply-To: <1507556919-24992-3-git-send-email-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c05::234
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH 2/9] target/arm: Implement SG
 instruction
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
Cc: Richard Henderson <rth@twiddle.net>, patches@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: OWInaP8f5pBs

On 10/09/2017 06:48 AM, Peter Maydell wrote:
> Implement the SG instruction, which we emulate 'by hand' in the
> exception handling code path.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  target/arm/helper.c | 132 ++++++++++++++++++++++++++++++++++++++++++++++++++--
>  1 file changed, 127 insertions(+), 5 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~
