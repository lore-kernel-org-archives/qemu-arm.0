Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp4649559wrt;
        Tue, 15 Jan 2019 13:23:06 -0800 (PST)
X-Google-Smtp-Source: ALg8bN4RkvOR0f7hDRL9DZt+EXQZt9A/h130aCybCIC2HNpQ4jM/jmyTTVUNGMvE4Nc5/ogRFuG7
X-Received: by 2002:adf:fa05:: with SMTP id m5mr4627943wrr.155.1547587386379;
        Tue, 15 Jan 2019 13:23:06 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1547587386; cv=none;
        d=google.com; s=arc-20160816;
        b=ECoIpmzN18Hfzbj4dTSy6WN5H+HBEVxgCC43r3zDRZktuqf/yvDpIw0TlJo71IMTRf
         q9pashrPyjg0Lr53/yvvyiYLw3KdAHJNhMu9L/X3lOwKCc/7VecCetgQNLJ+KBt+vAUt
         7mybVPH8D2dvRZWd6pJKkDOsv3O3fI+S2IZuDC/OWYrnMhl+VwBBZUM/BOxK8QdgCEdT
         EcxMosqHzJ0rNQLQ6AWCMA+l52fRvv+YPnBW6fyFa/k/c4FNxL0lG4eOVrL6HaIpwvFg
         5lRr73rd6i34aUj5d8V7zDHwS2BW7AK23cv0PBIZ40Bt2xEQ6toi3OWa/eEPJa5rv/7A
         Le1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to
         :dkim-signature;
        bh=cmdcLvIb40Z61380em+evv1MuTz4pHSJHZT4z0qgkS4=;
        b=eRmrLMlpJWQJ/s7LfWzUdzvN8IFAMC3Nud8u8eshKLwwOlh0dmtCk9WyYqMzZ3dBpp
         Ce3vt4Fd3HxnYAg3rPdEe3D8lfRXYRl9fQyXdNgbIEt99ENwCBSE6rH+uGlHR/G/kVeL
         7BbDR1mS0A/EPvWYC089vqkzXwxSbDzrKNcfFZAajOh3LUvtIwX80v/npQNHIFuVS8WJ
         U4qF5RkzGPVeDlZDBvz+n0Y1xaLhRWKwGZ3y5z84d3IfboFNN3y3msMIxVtb6XTZMtaW
         ruFuLK/4Z0L15DqK5ULJp2p0UYB/mt9c3hVWWxJTzO+LkJZAu7Lhuf0iubzCY9h4g3oR
         7sjw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=g98fS82Y;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a15si52604490wru.160.2019.01.15.13.23.06
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 15 Jan 2019 13:23:06 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=g98fS82Y;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([127.0.0.1]:60338 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gjWAr-0002y0-FG
	for alex.bennee@linaro.org; Tue, 15 Jan 2019 16:23:05 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50250)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1gjW8k-0001t2-5X
	for qemu-devel@nongnu.org; Tue, 15 Jan 2019 16:20:57 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1gjW8i-0005LA-4i
	for qemu-devel@nongnu.org; Tue, 15 Jan 2019 16:20:54 -0500
Received: from mail-pl1-f194.google.com ([209.85.214.194]:46005)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1gjW8h-0005Gg-Mo
	for qemu-devel@nongnu.org; Tue, 15 Jan 2019 16:20:52 -0500
Received: by mail-pl1-f194.google.com with SMTP id a14so1865204plm.12
	for <qemu-devel@nongnu.org>; Tue, 15 Jan 2019 13:20:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=cmdcLvIb40Z61380em+evv1MuTz4pHSJHZT4z0qgkS4=;
	b=g98fS82YZUt1cwbmg+kwcvxWaG1KE5OPbjId200Dv/eVoYaXVSRB5iUikSdpI6vc/Z
	qvxttUbc3Qa25Te6M4Jv6s+shDsK0RAORBba8MCUZOcqKJLJJqG4MHMEinMPpXAGNXly
	Nc2jPQDQTZ1QBuGf0PWStr8hGXma1xTaMMWV0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=cmdcLvIb40Z61380em+evv1MuTz4pHSJHZT4z0qgkS4=;
	b=SaLKoJlL2KXCnNrdGyB+B2dmdv1EVwRwmz9ZCeJKGXmDIQ8F0JuKYIgm5Se1jt0z5M
	v3CPhGksGhhEnYyjDEceQLtrOOahSfc/+LkV2XhQb2AZiTtdJYx5ubsUeW8UpdwIKyxY
	lN9SgjD4/vP1xGzCwKwVQ5h+ZPZcwBEYAT0VRNumQPlpOJRBSnDMOs8sgRHVYqGohaHx
	m8ALP07BUk5ezeesAc0WQL7PI1Qrq+dnRRtKXqyioiceYl6cC2udYBPDRLYnVoFXpwh6
	PnyW5aQJuzqgWe17o+DIIK8UbuzemNQg9RCiK2kjc8QnXZvXu0m6hkCWwu2cGHbXfpfM
	XLpg==
X-Gm-Message-State: AJcUukcpeOlyuD3KHhM27FbZEKlulehf1N9riVlrz1w1Ez8Z7LX8P03c
	nsnmPL4i2U4WbgjSJSq7geJm/A==
X-Received: by 2002:a17:902:bf0c:: with SMTP id
	bi12mr6273311plb.0.1547587248702; 
	Tue, 15 Jan 2019 13:20:48 -0800 (PST)
Received: from cloudburst.twiddle.net
	([2001:8003:2e1e:900:a89d:d9ff:18e1:b2fd])
	by smtp.gmail.com with ESMTPSA id
	b202sm6684420pfb.88.2019.01.15.13.20.43
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 15 Jan 2019 13:20:47 -0800 (PST)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
References: <20190114115637.6335-1-peter.maydell@linaro.org>
	<20190114115637.6335-4-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <3ad15f62-ed82-0789-2366-cb4233179e6d@linaro.org>
Date: Wed, 16 Jan 2019 08:20:40 +1100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <20190114115637.6335-4-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.214.194
Subject: Re: [Qemu-devel] [PATCH v2 3/4] accel/tcg: Add cluster number to
 TCG TB hash
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Eduardo Habkost <ehabkost@redhat.com>,
	Peter Crosthwaite <crosthwaite.peter@gmail.com>,
	Alistair Francis <alistair@alistair23.me>,
	"Emilio G . Cota" <cota@braap.org>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Aleksandar Markovic <aleksandar.m.mail@gmail.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: QFQhHP+ceMHG

On 1/14/19 10:56 PM, Peter Maydell wrote:
> Include the cluster number in the hash we use to look
> up TBs. This is important because a TB that is valid
> for one cluster at a given physical address and set
> of CPU flags is not necessarily valid for another:
> the two clusters may have different views of physical
> memory, or may have different CPU features (eg FPU
> present or absent).
> 
> We put the cluster number in the high 8 bits of the
> TB cflags. This gives us up to 256 clusters, which should
> be enough for anybody. If we ever need more, or need
> more bits in cflags for other purposes, we could make
> tb_hash_func() take more data (and expand qemu_xxhash7()
> to qemu_xxhash8()).
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
> v1->v2: move the setting of the cluster index in
> cf_mask in tb_htable_lookup() up to before we
> set desc.cf_mask from it...
> ---
>  include/exec/exec-all.h   | 4 +++-
>  accel/tcg/cpu-exec.c      | 3 +++
>  accel/tcg/translate-all.c | 3 +++
>  3 files changed, 9 insertions(+), 1 deletion(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~
