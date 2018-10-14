Received: by 2002:a5d:4c4c:0:0:0:0:0 with SMTP id n12-v6csp3338652wrt;
        Sun, 14 Oct 2018 09:26:30 -0700 (PDT)
X-Google-Smtp-Source: ACcGV6159JGPtSu1tKxwt/Wv4Fej1XUnLn15sJ/TZ5DBZBL969XuoL/gsorCBJQTZK2R3xPMT648
X-Received: by 2002:a0c:87b0:: with SMTP id 45mr13944978qvj.244.1539534390158;
        Sun, 14 Oct 2018 09:26:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1539534390; cv=none;
        d=google.com; s=arc-20160816;
        b=xotPX8vtVkTNXiLssHXcaU350Q68lYHvB5hgAv657d+7ccx967YmMz/y5XLzIHyBCe
         ygy1TLrxtxGGmN4jLtmgiS9a9YJQGS2gNs45YIVhiGhYMyVAbtrhmwMZJgKrg0iA5+WD
         KExLfB4PTnTSiHBR9lxrZO3SBr+RfMrW4gmYBg8JFdXHCJ6OOhLThv/2GLLw0ir8FAdB
         6OSCrYZu7khQ3V3ptOgZycJggisBip5ks9J61kLpnlLtUdRDYQTtP9DzEjG4UTsgKmyr
         jHlLKQBLp47WXo3PneW0ERLz6HrDPKBRCLwCFTSBcva9PwdVu1DnBXqPFYS93kjopvzO
         Xndg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to
         :dkim-signature;
        bh=ALOY40saRuGnv6jINtwyLMe2X89gzffDPZpA/PEru/E=;
        b=qHoYMdDcLx+q53UYWq6xstph2eUwNMGwAOMNvX9g0HXJIfrrV5bZV/uJCUXN1Nfo99
         7ftWOrvnqFMv7nwvpTKb6igXbtQENz+IXJKIj/HVsBldidt4D3BRC3nCeOPBhniunL+H
         0bfpYAAU2On0p+w6Bt+9RR5zzABptT7LqCVCi5Z+rip/AkwFQj4X0Chz53brlwbi9CpN
         WOyMFqzO/mQ2WIV9rEPpogblgnKFW/OxtjsptmaKpkwWM3YjbbVJX4wmf16FZzipxdnd
         OGbXLwpy4Wflrg5WO3ldx2VV8RueUy+dMCk30G9rsFTuqRkmYzyMYHpv+iU7Sre0gC/y
         0SgA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=hG2vaIgz;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id l29-v6si991107qtf.21.2018.10.14.09.26.29
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sun, 14 Oct 2018 09:26:30 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=hG2vaIgz;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:48958 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gBjDp-0004DG-Fd
	for alex.bennee@linaro.org; Sun, 14 Oct 2018 12:26:29 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47294)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1gBjDk-0004Cu-28
	for qemu-arm@nongnu.org; Sun, 14 Oct 2018 12:26:24 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1gBjDg-0006Gt-Mc
	for qemu-arm@nongnu.org; Sun, 14 Oct 2018 12:26:23 -0400
Received: from mail-pf1-x441.google.com ([2607:f8b0:4864:20::441]:35097)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1gBjDg-0006Fp-Do
	for qemu-arm@nongnu.org; Sun, 14 Oct 2018 12:26:20 -0400
Received: by mail-pf1-x441.google.com with SMTP id l17-v6so8468682pff.2
	for <qemu-arm@nongnu.org>; Sun, 14 Oct 2018 09:26:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=ALOY40saRuGnv6jINtwyLMe2X89gzffDPZpA/PEru/E=;
	b=hG2vaIgz/qezc31DBxwLwRFggQ6dBqSmeXYHohILn6YROF+q72R+zjMpUr1o7lwqhD
	PzD+dp5igFN7w5UslAJ1bgMv04uSdqqm5eCAVnJ+ND2tVpZT9GezDWVKLBUNUCQuG/gL
	Qstl+o9xa88VFE7KLDehJFaL28Tu0hVOLQ3gY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=ALOY40saRuGnv6jINtwyLMe2X89gzffDPZpA/PEru/E=;
	b=iLhMQyV803e9s+nS4pWznQTK8eKINAlnMRkAlQo5gKtzv2BdfUR3EWTGcu3y/E0D8x
	wufvJ71VUkgM/9/6JQ1PmcaRUHtgebkfdWbcdecqjDk1t8Du+LXhVmyLLQb66xqEC43+
	sjP4QOWiRLq+wsboA2QV8nEAR1Ng+tBjFz2s20L8m5Da6vLquGMVs+Einl895UWXHRoa
	Z9GT4zqBCDIYGagiB/1ohzOwdgY+KMLR3bM8Bbe8+W8U//aDFVEE+zKGFYrT6jqCBXmR
	NQC6IJuTXGzGXojlQmgs3HQkxm81eXYjssWo13PShSzVlPo31WQiEtZG9upWgV4WyxaZ
	vRKg==
X-Gm-Message-State: ABuFfogThOXqo83gyDgj1v4apUOknrUdeFAEXGX9ko2Oplo015Fj9I68
	6kj5VHnMdjzfddr7Af0cxs/p/Q==
X-Received: by 2002:a63:8c4:: with SMTP id
	187-v6mr12925504pgi.396.1539534377996; 
	Sun, 14 Oct 2018 09:26:17 -0700 (PDT)
Received: from cloudburst.twiddle.net (97-113-8-179.tukw.qwest.net.
	[97.113.8.179]) by smtp.gmail.com with ESMTPSA id
	z25-v6sm10937404pfl.58.2018.10.14.09.26.16
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 14 Oct 2018 09:26:16 -0700 (PDT)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
References: <20181012144235.19646-1-peter.maydell@linaro.org>
	<20181012144235.19646-5-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <c1dc4cd3-7379-0602-b911-d8e2845c02c2@linaro.org>
Date: Sun, 14 Oct 2018 09:26:15 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.0
MIME-Version: 1.0
In-Reply-To: <20181012144235.19646-5-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::441
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH 04/10] target/arm: Implement
 HCR.DC
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
X-TUID: BJOr5ssQRqaB

On 10/12/18 7:42 AM, Peter Maydell wrote:
> The HCR.DC virtualization configuration register bit has the
> following effects:
>  * SCTLR.M behaves as if it is 0 for all purposes except
>    direct reads of the bit
>  * HCR.VM behaves as if it is 1 for all purposes except
>    direct reads of the bit
>  * the memory type produced by the first stage of the EL1&EL0
>    translation regime is Normal Non-Shareable,
>    Inner Write-Back Read-Allocate Write-Allocate,
>    Outer Write-Back Read-Allocate Write-Allocate.
> 
> Implement this behaviour.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

