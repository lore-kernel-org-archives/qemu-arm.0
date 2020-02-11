Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp5422987lfp;
        Tue, 11 Feb 2020 10:51:25 -0800 (PST)
X-Google-Smtp-Source: APXvYqyIR+gR5NGFp94Hv9a7JnzaLjsq53xz3F+5gxGWId9ElnnpgnUfViNOSWTOYedYjNaVa61D
X-Received: by 2002:a37:9f93:: with SMTP id i141mr3807243qke.404.1581447084893;
        Tue, 11 Feb 2020 10:51:24 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1581447084; cv=none;
        d=google.com; s=arc-20160816;
        b=oAnQfoYKAAGUviGwrHIjw4CAjEO99juk3YrGLL9MAqL5qcVmgjZQryoXVrTRpq7oXS
         /NVBoUYmhGCWEG84NkSsVijAOL94mSIZ4ykhuDboQeazH1HBnS1Jii4fQNVJWGFQm1aQ
         ynZpIh52kcXjAdMHKtq69M806o3oWtouREKxY7hKNGcDX8RJi7aHSqqcMzacl64/zdrg
         sOKVyvYkUYjQ2PbExu/Tc4Axt8V+qkdANXe1MwuPnjKunfK+jKMezyEvN3CyRUSO2G10
         n60kws+hR38zaR7kCxxIjtuLJyZH0NXoHc3nhWUZsUbksmnve6ukE0w/SsbX2bCUbRP6
         oYYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=Onm/+cFugkxQqmVsqipFd1LugZotiZNU5jMnku6pWPg=;
        b=HgjjP2RGE8mQljS+c7PKWq4rqyvyn9OO420P1wdEGkBfQkdSRklGChVRPFs8pJFj+p
         AeqgLSuMVV8hkSIiD2HRV2H+Wxn/QC2qExuHhHb694DhzaWtWZl/P45AQVCb2QPjMfv5
         ZSLCirEkZOn5FDoAsjvh4QnAm/uafksI93aeGefcxbh72YxxwU6PO3jgaw+gI6CEk9ew
         rmvf5pTVTUiunzYczIzG0G1t1/ylIbWV3+J625ZJBj2tjTrxhoEQiPFdS0mXLoMoPKap
         reZMNBVKhCE1O8OaDnwal55zbveiPWH8UcMV74paZUHAggCmrdTW6mOlvBK+vO1v40QX
         7RTQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=h8yISU8P;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x17si2247881qtm.13.2020.02.11.10.51.24
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 11 Feb 2020 10:51:24 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=h8yISU8P;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:55928 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1j1ad2-0000br-AY
	for alex.bennee@linaro.org; Tue, 11 Feb 2020 13:51:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57394)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1j1acL-0000Wt-Vt
 for qemu-devel@nongnu.org; Tue, 11 Feb 2020 13:50:42 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1j1acK-0003QB-Vq
 for qemu-devel@nongnu.org; Tue, 11 Feb 2020 13:50:41 -0500
Received: from mail-pj1-x1041.google.com ([2607:f8b0:4864:20::1041]:53579)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1j1acK-0003OC-NX
 for qemu-devel@nongnu.org; Tue, 11 Feb 2020 13:50:40 -0500
Received: by mail-pj1-x1041.google.com with SMTP id n96so1715977pjc.3
 for <qemu-devel@nongnu.org>; Tue, 11 Feb 2020 10:50:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Onm/+cFugkxQqmVsqipFd1LugZotiZNU5jMnku6pWPg=;
 b=h8yISU8P2m4ZGWHvqfyimveQd8KgWBGmRQn7OQL0Yec1ePazSEGJr36eOI7Tms3FAA
 fLUeZZG9Z+Cs0MbzuSNJHygDb6QvWuBI9Eg90mD6nc7eVFl68kqXOZAJqqNxyOTiT5Ks
 mV0OsHkzbRbcvDMjlx0zwjrZxbRg6lNlBMDl8pHrsEsU0LrvY3/u17Q8TQwWyCodhxZ4
 RtlJNfFnf8dJbWvhkDJ6iMwTNc8/4OP+U7HmwyDpdxKuN3YDangvkrp+S+9IULi8G5ZY
 cKAFUGzYPaoxqW8S6J2k/6b5jSri/9LPIUnMZXawuwJtoF3KSLITEtUUtRJxaWks82Wf
 rKNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Onm/+cFugkxQqmVsqipFd1LugZotiZNU5jMnku6pWPg=;
 b=VtjKpv2M0HThvvk/TL4OGEfCnOOL6b7YF1xz/JWh2U4myeKv/fRqWCLiX5J5d6GCVa
 nfjlC1qj5oZ9H0yMJCkhzJYDEKgBzO4CEM0rrh093ghPg430nZfG1m8Ul8AEKvc0QA4L
 W7g6+VIwE6qUYET7Zedj0Xp9UD0w3rzUeYB4OsmhBAI7UNX8CuRDPyjeBAKSlcdClzxc
 2/Y6wAYcrq+wYjujmSKDLo6FjN9+duJceNO5SrpDl5LucJxeIh/pnn5hgbt5XXbSvALT
 kfbn9Fw8XS45cuUnJN5hSMK0TyJvqL6qZqmxADZFvjItYvLUAkibCNne7zFSvgqovCpI
 C2LQ==
X-Gm-Message-State: APjAAAVCik87tVhUg/3bc1Tq/6TVh0TMQ8TIGctdVC/sfdniVeLiCG1N
 eok3wo2nB0TjqlouuAuM4d4ytQ==
X-Received: by 2002:a17:90a:1b42:: with SMTP id
 q60mr5054708pjq.108.1581447039420; 
 Tue, 11 Feb 2020 10:50:39 -0800 (PST)
Received: from [192.168.1.11] (97-126-123-70.tukw.qwest.net. [97.126.123.70])
 by smtp.gmail.com with ESMTPSA id
 gx2sm4076079pjb.18.2020.02.11.10.50.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 11 Feb 2020 10:50:38 -0800 (PST)
Subject: Re: [PATCH 11/13] target/arm: Provide ARMv8.4-PMU in '-cpu max'
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20200211173726.22541-1-peter.maydell@linaro.org>
 <20200211173726.22541-12-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <e9de4a07-47cd-b20c-b31e-ccd5500fc99f@linaro.org>
Date: Tue, 11 Feb 2020 10:50:35 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200211173726.22541-12-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::1041
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Eric Auger <eric.auger@redhat.com>,
 Aaron Lindsay <aaron@os.amperecomputing.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: JjORjooya66T

On 2/11/20 9:37 AM, Peter Maydell wrote:
> Set the ID register bits to provide ARMv8.4-PMU (and implicitly
> also ARMv8.1-PMU) in the 'max' CPU.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  target/arm/cpu64.c | 8 ++++++++
>  1 file changed, 8 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

