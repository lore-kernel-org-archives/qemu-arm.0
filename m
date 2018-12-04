Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp8096352wrt;
        Tue, 4 Dec 2018 05:57:43 -0800 (PST)
X-Google-Smtp-Source: AFSGD/X/fVmlcFfFkUjViQpmtPpLpjW3cFB4Mm9VufSpmq2dqXDz3M1MHNxIfWLbmi/bXG47r+29
X-Received: by 2002:a0c:c993:: with SMTP id b19mr18969867qvk.126.1543931863674;
        Tue, 04 Dec 2018 05:57:43 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1543931863; cv=none;
        d=google.com; s=arc-20160816;
        b=CBSSeB6Z+bF0lBd37MFNZ+bN/OqXOLxemDN4SxTCdjQ+3EUgLcFtm0ZoUmaNvzsExP
         P+G3PbGoBuYU7JIhO30aL4c+gp1LZo+inHe1OOwk5OCAHCaU4E1j0znTWA6cWtfbn7wH
         qyOIVtdKLp4mYA4r02zK50PYIqaVToa1SwQCXtC90QczLShS71DDJHItURdWYW+MxX7i
         SUkQgIYe6jl0YhFuFVbE1vm5ZhwOXD/8Tk+QNnhgJ51rlBsKAJkE2BcUN37dynOc9ODM
         Gnaz7hQH78rNn/AEBFRyukqyPk9RHIq8zW+wk4MlGhpRXHFJxKep2XDLRb44FT5g2l3C
         U4eg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to
         :dkim-signature;
        bh=3HtHK/7qy2u8+nBYAQRl1qDG4NwqdEe7yesFIQkNMAU=;
        b=KbltfAVOLDYx3vJUumIB5uETCFfXJ72X6sE7JK3zCnW8H3P+nbhrFurI7qabPc6RXu
         2Ca3Z90CEp4akYQlwH6ebsDkyTKLwB4Ivw7RhkT8+P1ikAAbIeqpUWPB5uHz5FjZ9GGX
         Z0T6tJASVbhCikBdhZS6ODcQ4bm+yNHG/eu3a+2gs65djFU2rEx60u6ScgppX3wTZ1KD
         /cl0Ix9m45J4Hi6REEAqL/j3AzYN3hKGu8twFk4ndeowYXgF4S1mR4TrtqnSPFhmx6T2
         8EHOTvYZGNhHuSYeU5rWKnvXiJVVsMMK4ZBj5PH/LiYnQgzRSHyLXgNbeKQmzyfj+Bq4
         Ahhw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=IUWF1a9I;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id t130si855923qke.233.2018.12.04.05.57.43
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 04 Dec 2018 05:57:43 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=IUWF1a9I;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:56918 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gUBCp-0005nQ-75
	for alex.bennee@linaro.org; Tue, 04 Dec 2018 08:57:43 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39483)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1gUBCd-0005mc-E4
	for qemu-arm@nongnu.org; Tue, 04 Dec 2018 08:57:32 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1gUBCa-0008WV-51
	for qemu-arm@nongnu.org; Tue, 04 Dec 2018 08:57:31 -0500
Received: from mail-ot1-x344.google.com ([2607:f8b0:4864:20::344]:41936)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1gUBCZ-0008VN-EE
	for qemu-arm@nongnu.org; Tue, 04 Dec 2018 08:57:27 -0500
Received: by mail-ot1-x344.google.com with SMTP id u16so15212971otk.8
	for <qemu-arm@nongnu.org>; Tue, 04 Dec 2018 05:57:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=3HtHK/7qy2u8+nBYAQRl1qDG4NwqdEe7yesFIQkNMAU=;
	b=IUWF1a9Id3QCxkniw2PHjh80xmN8nswbwB+Btm0IS/Oef54OmQrKxx65ZVYLg18UPt
	p32Kp1eYD1yRZQwP3KQEcBN3nILOPMkyCLEMB6kM8q8UzpgEn0hvy7Q2ODrQzPNvdQ5c
	98VDo63JECTkBQzdDTQ8fK5w0Hibzc/gGMCN4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=3HtHK/7qy2u8+nBYAQRl1qDG4NwqdEe7yesFIQkNMAU=;
	b=aKWZha3DOZl+xvB8TL4o+AMpZ8sMOL/qXOGTB+ZBCavQPnfzlxpHD4QTEw/4CH9qBh
	5bvIzDlrxe7ItaUoxFRz8sSmrph+DkKn6Xl2rRpC2z+Oep2W3Uo5OOXG3jvYwADkOtZe
	Le9SQrysrBIK5hg4AA6FQo3p9Kn2dDfsb5e2+SjMpZcxeaO0l8MrHEEyZKw0NqqrYMd0
	MrVbbcDWttgjM3gQ8TXLnDv1Djc9L2ML6WfHndB9qQD6NIl1x+jQU4NcvccKlH0Lc+hr
	L15CkrwsKdE+v6leOEw5DUDpiR/lDMaoAu84vA8m3/KqjdpGG8yy6EUYM8KdYz8t68OZ
	zDBg==
X-Gm-Message-State: AA+aEWazFjPPyCcugtJ9sH1W6wmadq7S2oAOA84pUIHX/rR7W5U7FM11
	SlvFRnwpt6z1WnM2KNpTZ5xldw==
X-Received: by 2002:a05:6830:2141:: with SMTP id
	r1mr5284445otd.190.1543931846346; 
	Tue, 04 Dec 2018 05:57:26 -0800 (PST)
Received: from cloudburst.twiddle.net (172.189-204-159.bestel.com.mx.
	[189.204.159.172]) by smtp.gmail.com with ESMTPSA id
	h25sm5933546otj.27.2018.12.04.05.57.24
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 04 Dec 2018 05:57:25 -0800 (PST)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
References: <20181204132952.2601-1-peter.maydell@linaro.org>
	<20181204132952.2601-2-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <f79fa7ae-3d36-651b-a123-e048c925bf50@linaro.org>
Date: Tue, 4 Dec 2018 07:57:22 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.3.1
MIME-Version: 1.0
In-Reply-To: <20181204132952.2601-2-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::344
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH 1/5] target/arm: Free name
 string in ARMCPRegInfo hashtable entries
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
Cc: patches@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: AGfsLAkGVbvS

On 12/4/18 7:29 AM, Peter Maydell wrote:
> When we add a new entry to the ARMCPRegInfo hash table in
> add_cpreg_to_hashtable(), we allocate memory for tehe
> ARMCPRegInfo struct itself, and we also g_strdup() the
> name string. So the hashtable's value destructor function
> must free the name string as well as the struct.
> 
> Spotted by clang's leak sanitizer. The leak here is a
> small one-off leak at startup, because we don't support
> CPU hotplug, and so the only time when we destroy
> hash table entries is for the case where ARM_CP_OVERRIDE
> means we register a wildcard entry and then override it later.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  target/arm/cpu.c | 16 +++++++++++++++-
>  1 file changed, 15 insertions(+), 1 deletion(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~
